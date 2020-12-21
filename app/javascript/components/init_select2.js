import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $(".select2").select2({
        dropdownParent: $("#newDose")
    });
};

export { initSelect2 };
