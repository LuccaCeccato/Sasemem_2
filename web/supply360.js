const sidebar = document.getElementById('default-sidebar');
const contentWrapper = document.getElementById('content-wrapper');
const sidebarToggleButton = document.querySelector('[data-drawer-toggle="default-sidebar"]');
sidebarToggleButton.addEventListener('click', function () {
    sidebar.classList.toggle('-translate-x-full');
    contentWrapper.classList.toggle('ml-0');
    contentWrapper.classList.toggle('ml-64');
});

document.addEventListener('click', function (event) {
    if (!sidebar.contains(event.target) && !sidebarToggleButton.contains(event.target)) {
        sidebar.classList.add('-translate-x-full');
        contentWrapper.classList.remove('ml-64');
        contentWrapper.classList.add('ml-0');
    }
});

document.addEventListener('DOMContentLoaded', function () {
    const dropdownButton = document.getElementById('example-dropdown-button');
    const dropdownMenu = document.getElementById('example-dropdown');

    dropdownButton.addEventListener('click', function () {
        dropdownMenu.classList.toggle('hidden');
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('dropdown');
    const modalToggle = document.querySelector('[data-dropdown-toggle="dropdown"]');
    const modalClose = modal.querySelector('button');
    modalToggle.addEventListener('click', function () {
        modal.classList.toggle('hidden');
        document.body.classList.toggle('overflow-hidden');
    });
    modalClose.addEventListener('click', function () {
        modal.classList.add('hidden');
        document.body.classList.remove('overflow-hidden');
    });
});
document.addEventListener('DOMContentLoaded', function () {
  // Função para lidar com a abertura e fechamento dos modais
  function toggleModal(modalId) {
      const modal = document.getElementById(modalId);
      modal.classList.toggle('hidden');
      document.body.classList.toggle('overflow-hidden');
  }

  // Event listeners para abrir e fechar o modal de criação
  const createModalToggle = document.querySelector('[data-modal-toggle="createProductModal"]');
  createModalToggle.addEventListener('click', function () {
      toggleModal('createProductModal');
  });

  const createModalClose = document.querySelector('#createProductModal button');
  createModalClose.addEventListener('click', function () {
      toggleModal('createProductModal');
  });

  // Event listeners para abrir e fechar o modal de atualização
  const updateModalToggle = document.querySelector('[data-modal-toggle="updateProductModal"]');
  updateModalToggle.addEventListener('click', function () {
      toggleModal('updateProductModal');
  });

  const updateModalClose = document.querySelector('#updateProductModal button');
  updateModalClose.addEventListener('click', function () {
      toggleModal('updateProductModal');
  });

  // Adicionar produto dinamicamente
  function addProduct() {
      const produtosContainer = document.getElementById('produtos-container');
      const newItem = document.createElement('div');
      newItem.className = 'flex flex-col space-y-4 item';
      newItem.innerHTML = `
      <label for="produto" class="block mb-2 text-sm font-medium text-blazeOrange">Produtos</label>
      <!-- Campo de entrada de texto para inserir o número do produto -->
      <input type="text" name="produto[]" 
             class="produto-input bg-white border border-blazeOrange text-blazeOrange text-sm rounded-lg focus:ring-blazeOrange focus:border-blazeOrange block w-full p-2.5" 
             placeholder="Digite o ID do produto" required="">
      
      <!-- Botão para remover o item -->
      <button type="button" class="remove-btn bg-red-500 text-white p-2 rounded-lg hover:bg-red-600">Remover</button>
      `;
      produtosContainer.appendChild(newItem);

      // Attach remove functionality to the newly added item
      newItem.querySelector('.remove-btn').addEventListener('click', () => {
          newItem.remove();
      });
  }
  function updateProduct() {
    const produtosContainer = document.getElementById('produtos-container');
    const newItem = document.createElement('div');
    newItem.className = 'flex flex-col space-y-4 item';
    newItem.innerHTML = `
        <label for="produto" class="block mb-2 text-sm font-medium text-blazeOrange">Produtos</label>
        <select name="produto[]" class="produto-select bg-white border border-blazeOrange text-blazeOrange text-sm rounded-lg focus:ring-blazeOrange focus:border-blazeOrange block w-full p-2.5" required>
            <option value="" disabled selected>Escolha um produto</option>
            <option value="produto1">Produto 1</option>
            <option value="produto2">Produto 2</option>
            <option value="produto3">Produto 3</option>
        </select>
      
        <button type="button" class="remove-btn bg-red-500 text-white p-2 rounded-lg hover:bg-red-600">Remover</button>
    `;
    produtosContainer.appendChild(newItem);

    // Attach remove functionality to the newly added item
    newItem.querySelector('.remove-btn').addEventListener('click', () => {
        newItem.remove();
    });
}

  const addProductBtn = document.getElementById('add-product-btn');
  addProductBtn.addEventListener('click', addProduct);


  // Attach remove functionality to existing items
  const produtosContainer = document.getElementById('produtos-container');
  produtosContainer.addEventListener('click', (e) => {
      if (e.target.classList.contains('remove-btn')) {
          e.target.parentElement.remove();
      }
  });
});

document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('readProductModal');
    const modalToggle = document.querySelector('[data-modal-toggle="readProductModal"]');
    const modalClose = modal.querySelector('button');
    modalToggle.addEventListener('click', function () {
        modal.classList.toggle('hidden');
        document.body.classList.toggle('overflow-hidden');
    });
    modalClose.addEventListener('click', function () {
        modal.classList.add('hidden');
        document.body.classList.remove('overflow-hidden');
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('deleteModal');
    const modalToggle = document.querySelector('[data-modal-toggle="deleteModal"]');
    const modalClose = modal.querySelector('button');
    modalToggle.addEventListener('click', function () {
        modal.classList.toggle('hidden');
        document.body.classList.toggle('overflow-hidden');
    });
    modalClose.addEventListener('click', function () {
        modal.classList.add('hidden');
        document.body.classList.remove('overflow-hidden');
    });
});


const options = {
  colors: ["#1A56DB", "#FDBA8C"],
  series: [
    {
      name: "Organic",
      color: "#1A56DB",
      data: [
        { x: "Mon", y: 231 },
        { x: "Tue", y: 122 },
        { x: "Wed", y: 63 },
        { x: "Thu", y: 421 },
        { x: "Fri", y: 122 },
        { x: "Sat", y: 323 },
        { x: "Sun", y: 111 },
      ],
    },
    {
      name: "Social media",
      color: "#FDBA8C",
      data: [
        { x: "Mon", y: 232 },
        { x: "Tue", y: 113 },
        { x: "Wed", y: 341 },
        { x: "Thu", y: 224 },
        { x: "Fri", y: 522 },
        { x: "Sat", y: 411 },
        { x: "Sun", y: 243 },
      ],
    },
  ],
  chart: {
    type: "bar",
    height: "320px",
    fontFamily: "Inter, sans-serif",
    toolbar: {
      show: false,
    },
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: "70%",
      borderRadiusApplication: "end",
      borderRadius: 8,
    },
  },
  tooltip: {
    shared: true,
    intersect: false,
    style: {
      fontFamily: "Inter, sans-serif",
    },
  },
  states: {
    hover: {
      filter: {
        type: "darken",
        value: 1,
      },
    },
  },
  stroke: {
    show: true,
    width: 0,
    colors: ["transparent"],
  },
  grid: {
    show: false,
    strokeDashArray: 4,
    padding: {
      left: 2,
      right: 2,
      top: -14
    },
  },
  dataLabels: {
    enabled: false,
  },
  legend: {
    show: false,
  },
  xaxis: {
    floating: false,
    labels: {
      show: true,
      style: {
        fontFamily: "Inter, sans-serif",
        cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400'
      }
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
  },
  yaxis: {
    show: false,
  },
  fill: {
    opacity: 1,
  },
}

        // JavaScript to handle modal display and chart initialization
        document.addEventListener('DOMContentLoaded', () => {
            // Initialize charts
            const ctxSales = document.getElementById('salesChart').getContext('2d');
            new Chart(ctxSales, {
                type: 'bar',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Vendas',
                        data: [12, 19, 3, 5, 2, 3, 7],
                        backgroundColor: '#ff6f61',
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false,
                        },
                        tooltip: {
                            callbacks: {
                                label: (context) => `R$ ${context.raw}`
                            }
                        }
                    },
                    scales: {
                        x: {
                            stacked: true,
                        },
                        y: {
                            stacked: true,
                            beginAtZero: true,
                            ticks: {
                                callback: (value) => `R$ ${value}`
                            }
                        }
                    }
                }
            });

            const ctxOrders = document.getElementById('ordersChart').getContext('2d');
            new Chart(ctxOrders, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Pedidos',
                        data: [8, 15, 5, 9, 12, 6, 4],
                        borderColor: '#4a90e2',
                        backgroundColor: 'rgba(74, 144, 226, 0.2)',
                        fill: true,
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false,
                        },
                        tooltip: {
                            callbacks: {
                                label: (context) => `Pedidos: ${context.raw}`
                            }
                        }
                    },
                    scales: {
                        x: {
                            stacked: true,
                        },
                        y: {
                            stacked: true,
                            beginAtZero: true,
                        }
                    }
                }
            });

            const ctxStock = document.getElementById('stockChart').getContext('2d');
            new Chart(ctxStock, {
                type: 'pie',
                data: {
                    labels: ['Produto A', 'Produto B', 'Produto C'],
                    datasets: [{
                        data: [10, 20, 30],
                        backgroundColor: ['#5e72e4', '#f7c84c', '#d63c6f'],
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: (context) => `${context.label}: ${context.raw}`
                            }
                        }
                    }
                }
            });

            const ctxSalesTarget = document.getElementById('salesTargetChart').getContext('2d');
            new Chart(ctxSalesTarget, {
                type: 'doughnut',
                data: {
                    labels: ['Meta Atingida', 'Meta Não Atingida'],
                    datasets: [{
                        data: [75, 25],
                        backgroundColor: ['#28a745', '#dc3545'],
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: (context) => `${context.label}: ${context.raw}%`
                            }
                        }
                    }
                }
            });

            // Modal Handling
            const addProductModal = document.getElementById('addProductModal');
            const updateProductModal = document.getElementById('updateProductModal');
            const removeProductModal = document.getElementById('removeProductModal');

            // Show Add Product Modal
            document.getElementById('addProductButton').addEventListener('click', () => {
                addProductModal.classList.remove('hidden');
            });

            // Close Add Product Modal
            document.getElementById('closeAddProductModal').addEventListener('click', () => {
                addProductModal.classList.add('hidden');
            });

            // Show Update Product Modal (Example - you should update this to show the actual product details)
            document.querySelectorAll('.updateProductButton').forEach(button => {
                button.addEventListener('click', () => {
                    updateProductModal.classList.remove('hidden');
                });
            });

            // Close Update Product Modal
            document.getElementById('closeUpdateProductModal').addEventListener('click', () => {
                updateProductModal.classList.add('hidden');
            });

            // Show Remove Product Modal (Example - you should update this to target the actual product)
            document.querySelectorAll('.removeProductButton').forEach(button => {
                button.addEventListener('click', () => {
                    removeProductModal.classList.remove('hidden');
                });
            });

            // Close Remove Product Modal
            document.getElementById('closeRemoveProductModal').addEventListener('click', () => {
                removeProductModal.classList.add('hidden');
            });

            // Confirm Remove Product
            document.getElementById('confirmRemoveProduct').addEventListener('click', () => {
                // Add logic to remove the product
                console.log('Produto removido!');
                removeProductModal.classList.add('hidden');
            });
        });
        
        const dropdownButton = document.getElementById('filterDropdownButton');
        const filterDropdown = document.getElementById('filterDropdown');

        dropdownButton.addEventListener('click', function () {
            filterDropdown.classList.toggle('hidden');
        });
        
        

   
