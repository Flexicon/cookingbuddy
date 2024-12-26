import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="combo-box"
export default class extends Controller {
  static targets = ["input", "dropdown", "hiddenField"];
  static values = {
    filterThreshold: { type: Number, default: 1 }
  };

  connect() {
    this.filteredItems = [];
    this.activeIndex = -1;
  }

  filter() {
    const query = this.inputTarget.value.toLowerCase();

    const items = Array.from(this.dropdownTarget.children);
    this.filteredItems = items.filter((item) =>
      item.dataset.name.toLowerCase().includes(query)
    );

    items.forEach((item) =>
      item.classList.toggle("hidden", !this.filteredItems.includes(item))
    );

    this.dropdownTarget.classList.toggle(
      "hidden",
      this.filteredItems.length === 0
    );

    this.activeIndex = -1;
  }

  navigate(event) {
    if (["ArrowUp", "ArrowDown", "Enter"].includes(event.key)) {
      event.preventDefault();
    }

    switch (event.key) {
      case "ArrowDown":
        this.navigateDown();
        break;
      case "ArrowUp":
        this.navigateUp();
        break;
      case "Enter":
        this.selectItem();
        break;
    }
  }

  navigateDown() {
    if (this.filteredItems.length === 0) return;

    this.activeIndex = (this.activeIndex + 1) % this.filteredItems.length;
    this.updateActiveItem();
  }

  navigateUp() {
    if (this.filteredItems.length === 0) return;

    this.activeIndex =
      (this.activeIndex - 1 + this.filteredItems.length) %
      this.filteredItems.length;
    this.updateActiveItem();
  }

  select(event) {
    event.preventDefault();
    this.activeIndex = this.filteredItems.indexOf(event.currentTarget);
    this.selectItem();
  }

  selectItem() {
    if (this.activeIndex === -1) return;

    const selectedItem = this.filteredItems[this.activeIndex];

    this.inputTarget.value = selectedItem.dataset.name;
    this.hiddenFieldTarget.value = selectedItem.dataset.id;

    this.dropdownTarget.classList.add("hidden");
    this.activeIndex = -1;
    this.updateActiveItem();

    this.inputTarget.blur();
  }

  updateActiveItem() {
    this.filteredItems.forEach((item) => {
      item.classList.remove("bg-primary", "text-primary-content");
    });

    const activeItem = this.filteredItems[this.activeIndex];
    if (activeItem) {
      activeItem.classList.add("bg-primary", "text-primary-content");

      activeItem.scrollIntoView({
        block: "nearest",
      });
    }
  }

  blur() {
    setTimeout(() => {
      this.dropdownTarget.classList.add("hidden");
      this.activeIndex = -1;

      const currentId = this.hiddenFieldTarget.value;
      const selectedItem = Array.from(this.dropdownTarget.children).find(
        (item) => item.dataset.id === currentId
      );
      this.inputTarget.value = selectedItem?.dataset?.name || "";
    }, 50);
  }

  open() {
    this.inputTarget.value = "";
    this.filter();
  }

  hover() {
    this.activeIndex = -1;
    this.updateActiveItem();
  }
}
