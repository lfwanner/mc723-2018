# Máquina Virtual para MC723/MC733 2017-1

Siga as intruções abaixo para configurar a sua VM.



Baixe e instale [VirtualBox](https://www.virtualbox.org/wiki/Downloads) e [Vagrant](https://www.vagrantup.com/downloads.html). Ambos pacotes estão disponíveis para Linux, Mac, e Windows.

Baixe e descompacte a configuração da [VM da disciplina](https://github.com/lfwanner/mc714-2017-1/archive/master.zip)  

Em um terminal de comando, vá para o diretório <code>mc714-2017-1-master/vm</code>, e inicie a máquina virtual com o comando <code>vagrant up</code>. Este procedimento envolverá o download de alguns GB de dados, e pode demorar algumas horas dependendo da velocidade da sua conexão de Internet. Caso seja necessário interromper o processo de instalação, use o comando <code>vagrant up --provision</code> ao reiniciar.

Faça login na VM usando o comando vagrant ssh. Teste a instalação com os comandos acsim e dineroIV. O diretório <code>/home/ubuntu/code</code> na VM está mapeado para o diretório <code>mc714-2017-1-master/code</code> na máquina host. Teste a escrita de um arquivo na VM e leitura no host, e vice-versa. Para sair do terminal da VM, use o comando <code>exit</code>.

O controle da VM deve ser feito sempre a partir do diretório vm na máquina host. Para desligar a VM, use o comando <code>vagrant halt</code>. Para ligar novamente a VM, use <code>vagrant up</code> (o procedimento de instalação não será repetido após o comando inicial). Para destruir/deletar a VM, use o comando <code>vagrant destroy</code>.
