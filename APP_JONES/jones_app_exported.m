classdef jones_app_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        JONESAPPUIFigure                matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        DATATab                         matlab.ui.container.Tab
        GridLayout                      matlab.ui.container.GridLayout
        GridLayout4                     matlab.ui.container.GridLayout
        UITable                         matlab.ui.control.Table
        GridLayout3                     matlab.ui.container.GridLayout
        AppdesignedbyJessPachecoLabel   matlab.ui.control.Label
        GridLayout5                     matlab.ui.container.GridLayout
        GridLayout6                     matlab.ui.container.GridLayout
        CalculateButton                 matlab.ui.control.StateButton
        DeleteButton                    matlab.ui.control.StateButton
        ButtonGroup                     matlab.ui.container.ButtonGroup
        TwoStressButton                 matlab.ui.control.RadioButton
        SingleStressButton              matlab.ui.control.RadioButton
        GridLayout2                     matlab.ui.container.GridLayout
        APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel  matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        VPTab                           matlab.ui.container.Tab
        UITable4                        matlab.ui.control.Table
        JonesequationcoefficientsPanel  matlab.ui.container.Panel
        VoEditField                     matlab.ui.control.NumericEditField
        VoEditFieldLabel                matlab.ui.control.Label
        EditField                       matlab.ui.control.NumericEditField
        EditFieldLabel                  matlab.ui.control.Label
        CEditField                      matlab.ui.control.NumericEditField
        CEditFieldLabel                 matlab.ui.control.Label
        avEditField                     matlab.ui.control.NumericEditField
        avEditFieldLabel                matlab.ui.control.Label
        VPPanel                         matlab.ui.container.Panel
        VpccEditField                   matlab.ui.control.NumericEditField
        VpccEditFieldLabel              matlab.ui.control.Label
        NetStresspsiEditField           matlab.ui.control.NumericEditField
        NetStresspsiEditFieldLabel      matlab.ui.control.Label
        UITable2                        matlab.ui.control.Table
        UIAxes                          matlab.ui.control.UIAxes
        KTab_2                          matlab.ui.container.Tab
        UITable5                        matlab.ui.control.Table
        KkPanel                         matlab.ui.container.Panel
        KkmdEditField                   matlab.ui.control.NumericEditField
        KkmdEditFieldLabel              matlab.ui.control.Label
        NetStresspsiEditField_2         matlab.ui.control.NumericEditField
        NetStresspsiEditField_2Label    matlab.ui.control.Label
        JonesequationcoefficientsPanel_2  matlab.ui.container.Panel
        KkoEditField                    matlab.ui.control.NumericEditField
        KkoEditFieldLabel               matlab.ui.control.Label
        EditField_2                     matlab.ui.control.NumericEditField
        EditField_2Label                matlab.ui.control.Label
        CEditField_2                    matlab.ui.control.NumericEditField
        CEditField_2Label               matlab.ui.control.Label
        aKkEditField                    matlab.ui.control.NumericEditField
        aKkEditFieldLabel               matlab.ui.control.Label
        UITable2_2                      matlab.ui.control.Table
        UIAxes_2                        matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        Property
        selectedButton
        tabla_1
        tabla_2
        tabla_3
        tabla_4
        tabla_5
        value_av
        C
        sigma
        Vo
        av
        ak
        Ck
        sigmak
        Ko
        akair
        Kairo
        borragrafico
        p

        
        
    end
    
    
   
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           app.selectedButton = app.ButtonGroup.SelectedObject;
           app.value_av=app.avEditField.Value;

           
           app.tabla_1=app.UITable;
           app.tabla_2=app.UITable2;
           app.tabla_3=app.UITable2_2;
           app.tabla_5=app.UITable4;
           
           app.tabla_1.ColumnFormat={'short g' 'short g' 'short g' 'short g' 'short g' 'short g' };
           app.tabla_2.ColumnFormat={'short g' 'short g' 'short g' 'short g' };
           app.tabla_3.ColumnFormat={'short g' 'short g' 'short g' };
           app.tabla_5.ColumnFormat={'short g' 'short'};
           

          

            
            if app.selectedButton==app.SingleStressButton 
               app.tabla_1.Data=cell(1,5);
               app.tabla_2.Data=cell(1,4);
               app.tabla_3.Data=cell(1,3);
              
           else
               app.tabla_1.Data=cell(2,5);
               app.tabla_2.Data=cell(2,4);
               app.tabla_3.Data=cell(2,3);
               
            end

           %copiar datos de tabla uno en otras tablas
           app.tabla_2.Data(1,1)=app.tabla_1.Data(1,1);

        end

        % Selection changed function: ButtonGroup
        function ButtonGroupSelectionChanged(app, event)
           app.selectedButton = app.ButtonGroup.SelectedObject;
            if app.selectedButton==app.SingleStressButton 
               app.tabla_1.Data=cell(1,6);
               app.tabla_2.Data=cell(1,3);
               app.tabla_3.Data=cell(1,3);
               app.tabla_4.Data=cell(1,3);
           else
               app.tabla_1.Data=cell(2,5);
               app.tabla_2.Data=cell(2,3);
               app.tabla_3.Data=cell(2,3);
               app.tabla_4.Data=cell(2,3);
               
           end
            
        end

        % Value changed function: DeleteButton
        function DeleteButtonValueChanged(app, event)
            app.UITable.Data=[];
            
            app.EditField.Value=0;
            app.CEditField.Value=0;
            app.avEditField.Value=0;
            app.VoEditField.Value=0;
            app.tabla_2=[];
            app.tabla_3=[];
            app.tabla_4=[];
            app.UITable4.Data=[];
            app.NetStresspsiEditField.Value=0;
            app.VpccEditField.Value=0;
            app.borragrafico=plot(app.UIAxes,0,0);
            app.UITable5.Data=[];
            app.NetStresspsiEditField_2.Value=0;
            app.KkoEditField.Value=0;
            app.aKkEditField.Value=0;
            app.EditField_2.Value=0;
            app.CEditField_2.Value=0;
            app.borragrafico=plot(app.UIAxes_2,0,0);
            app.startupFcn

            



            
        end

        % Cell edit callback: UITable
        function UITableCellEdit(app, event)
%             indices = event.Indices;
%             newData = event.NewData;
              
            if app.selectedButton==app.SingleStressButton 
            % Copy Depth
                app.tabla_2.Data(1,1)=app.tabla_1.Data(1,1);
                app.tabla_3.Data(1,1)=app.tabla_1.Data(1,1);
                app.tabla_4.Data(1,1)=app.tabla_1.Data(1,1);

            %Copy Presion
                app.tabla_2.Data(1,2)=app.tabla_1.Data(1,2);
                app.tabla_3.Data(1,2)=app.tabla_1.Data(1,2);
                app.tabla_4.Data(1,2)=app.tabla_1.Data(1,2);
            
            %Copy VP
                app.tabla_2.Data(1,3)=app.tabla_1.Data(1,3);
            %Copy Prosity
                app.tabla_2.Data(1,4)=app.tabla_1.Data(1,4);
            %Copy Kk
                app.tabla_3.Data(1,3)=app.tabla_1.Data(1,5);
            %Copy Kair
                app.tabla_4.Data(1,3)=app.tabla_1.Data(1,5);


                
                
           
            else 
                % Copy Depth
                app.tabla_2.Data(1,1)=app.tabla_1.Data(1,1);
                app.tabla_3.Data(1,1)=app.tabla_1.Data(1,1);
                app.tabla_4.Data(1,1)=app.tabla_1.Data(1,1);

                app.tabla_2.Data(2,1)=app.tabla_1.Data(2,1);
                app.tabla_3.Data(2,1)=app.tabla_1.Data(2,1);
                app.tabla_4.Data(2,1)=app.tabla_1.Data(2,1);


                %Copy Presion
                app.tabla_2.Data(1,2)=app.tabla_1.Data(1,2);
                app.tabla_3.Data(1,2)=app.tabla_1.Data(1,2);
                app.tabla_4.Data(1,2)=app.tabla_1.Data(1,2);

                app.tabla_2.Data(2,2)=app.tabla_1.Data(2,2);
                app.tabla_3.Data(2,2)=app.tabla_1.Data(2,2);
                app.tabla_4.Data(2,2)=app.tabla_1.Data(2,2);

                %Copy VP
                app.tabla_2.Data(1,3)=app.tabla_1.Data(1,3);
                app.tabla_2.Data(2,3)=app.tabla_1.Data(2,3);
                %Copy Porosity
                app.tabla_2.Data(1,4)=app.tabla_1.Data(1,4);
                app.tabla_2.Data(2,4)=app.tabla_1.Data(2,4);
                %Copy Kk
                app.tabla_3.Data(1,3)=app.tabla_1.Data(1,5);
                app.tabla_3.Data(2,3)=app.tabla_1.Data(2,5);
              
                
                
               
                
               

            end


            
        end

        % Value changed function: avEditField
        function avEditFieldValueChanged(app, event)
            
           
            
        end

        % Value changed function: CalculateButton
        function CalculateButtonValueChanged(app, event)
%             value = app.CalculateButton.Value;
            app.C=app.CEditField.Value;
            app.sigma=app.EditField.Value;
            if app.selectedButton==app.SingleStressButton 
                porosity=cell2mat(app.tabla_2.Data(1,4));
                v1=cell2mat(app.tabla_2.Data(1,3));
                p1vp=cell2mat(app.tabla_2.Data(1,2));
                app.avEditField.Value=0.0336 + 4.556*((porosity/100)-0.25)^2;
                app.av=app.avEditField.Value;
                app.CEditField.Value=3*10^-6;
                app.EditField.Value=3000;
                app.C=3*10^-6;
                app.sigma=3000;
                app.VoEditField.Value=v1*(1+app.C*p1vp)*exp(app.avEditField.Value*(1-exp(-p1vp/app.sigma)));
                app.Vo=app.VoEditField.Value;
                
                %Kk
                kklinkenberg=cell2mat(app.tabla_1.Data(1,5));
                p1kk=cell2mat(app.tabla_3.Data(1,2));
                app.aKkEditField.Value=exp(-0.2-log(kklinkenberg)+0.13*log(kklinkenberg)*sqrt(abs(log(kklinkenberg))));
                app.ak=app.aKkEditField.Value;
                app.CEditField_2.Value=3*10^-6;
                app.EditField_2.Value=3000;
                app.Ck=3*10^-6;
                app.sigmak=3000;
                app.KkoEditField.Value=kklinkenberg*(1+app.Ck*p1kk)*exp(app.aKkEditField.Value*(1-exp(-p1kk/app.sigmak)));
                app.Ko=app.KkoEditField.Value;
            else
                
                v1=cell2mat(app.tabla_2.Data(1,3));
                v2=cell2mat(app.tabla_2.Data(2,3));
                p1vp=cell2mat(app.tabla_2.Data(1,2));
                p2vp=cell2mat(app.tabla_2.Data(2,2));
                app.CEditField.Value=3*10^-6;
                app.EditField.Value=3000;
                app.C=3*10^-6;
                app.sigma=3000;
                app.avEditField.Value=log((v1*(1+app.C*p1vp))/(v2*(1+app.C*p2vp)))/(exp(-p1vp/app.sigma)-exp((-p2vp/app.sigma)));
                app.av=app.avEditField.Value;
                
                app.VoEditField.Value=v1*(1+app.C*p1vp)*exp(app.avEditField.Value*(1-exp(-p1vp/app.sigma)));
                app.Vo=app.VoEditField.Value;
                
                %Kk
                kklinkenberg1=cell2mat(app.tabla_1.Data(1,5));
                kklinkenberg2=cell2mat(app.tabla_1.Data(2,5));
                p1kk1=cell2mat(app.tabla_3.Data(1,2));
                p1kk2=cell2mat(app.tabla_3.Data(2,2));
                app.CEditField_2.Value=3*10^-6;
                app.EditField_2.Value=3000;
                app.Ck=3*10^-6;
                app.sigmak=3000;
                app.aKkEditField.Value=log((kklinkenberg1*(1+app.C*p1kk1))/(kklinkenberg2*(1+app.C*p1kk2)))/(exp(-p1kk1/app.sigma)-exp((-p1kk2/app.sigma)));
                app.ak=app.aKkEditField.Value;
                app.KkoEditField.Value=kklinkenberg1*(1+app.Ck*p1kk1)*exp(app.aKkEditField.Value*(1-exp(-p1kk1/app.sigmak)));
                app.Ko=app.KkoEditField.Value;



                


            
            end
            
            
        end

        % Value changed function: NetStresspsiEditField
        function NetStresspsiEditFieldValueChanged(app, event)
            Vp_predicted=(app.Vo*exp(app.av*(exp(-app.NetStresspsiEditField.Value/(app.sigma))-1)))/(1+app.C*app.NetStresspsiEditField.Value);
            app.VpccEditField.Value=Vp_predicted;

            vpcalculado=cell(45,2);
           
             ta=1;
             tp=1;
             for i=0:100:4500 
                 vpcalculado(tp,1)=mat2cell(i,1);
                 tp=tp+1;
                
             end
            

             for i=0:100:4500 


                aped=app.Vo*exp(app.av*((exp(-i/app.sigma))-1));
                bped=(1+app.C*i);
                vpcalculadoc=round(aped/bped,3);
                vpcalculadonum=mat2cell(vpcalculadoc,1);
                vpcalculado(ta,2)=vpcalculadonum;
                ta=ta+1;
                
             end
             app.UITable4.Data=vpcalculado;

%              plot(app.UIAxes,app.UITable2.Data(1:end,1),app.UITable2.Data(1:end,2))
%               
%            
% 
             has=cell2mat(app.UITable4.Data(1:end,1));
             hasy=cell2mat(app.UITable4.Data(1:end,2));
             jkl=cell2mat(app.UITable2.Data(1:end,2));
             jkl2=cell2mat(app.UITable2.Data(1:end,3));             
            
            
             plot(app.UIAxes,jkl,jkl2,'o',has,hasy,'LineStyle','-');
             xlabel(app.UIAxes,'Net Stress (psi)','FontWeight','bold');
             ylabel(app.UIAxes,'Vp (cc)','FontWeight','bold');
             
%              app.p(1).LineStyle='-';
%              app.p(2).LineStyle='-';
%              app.p(2).Marker='o';
             legend(app.UIAxes,'Measuared Vp', 'Jones');
           

             title(app.UIAxes,'VP vs Net Stress');
             

%              % Plot the principal and interest
%             plot(app.PrincipalInterestUIAxes,(1:nper)',principal, ...
%                 (1:nper)',interest);
%             legend(app.PrincipalInterestUIAxes,{'Principal','Interest'},'Location','Best')
%             xlim(app.PrincipalInterestUIAxes,[0 nper]); 
%             ylim(app.PrincipalInterestUIAxes,'auto');


            


             

           
            

            
        end

        % Value changed function: NetStresspsiEditField_2
        function NetStresspsiEditField_2ValueChanged(app, event)
            
            Kk_predicted=(app.Ko*exp(app.ak*(exp(-app.NetStresspsiEditField_2.Value/(app.sigma))-1)))/(1+app.C*app.NetStresspsiEditField_2.Value);
            app.KkmdEditField.Value=Kk_predicted;

            Kkcalculado=cell(45,2);
           
             ta=1;
             tp=1;
             for i=0:100:4500 
                 Kkcalculado(tp,1)=mat2cell(i,1);
                 tp=tp+1;
                
             end
            

             for i=0:100:4500 


                apedk=app.Ko*exp(app.ak*((exp(-i/app.sigma))-1));
                bpedk=(1+app.C*i);
                kkcalculadoc=round(apedk/bpedk,3);
                kkcalculadonum=mat2cell(kkcalculadoc,1);
                Kkcalculado(ta,2)=kkcalculadonum;
                ta=ta+1;
                
             end
             app.UITable5.Data=Kkcalculado;

%              plot(app.UIAxes,app.UITable2.Data(1:end,1),app.UITable2.Data(1:end,2))
%               
%            
% 
             haskk=cell2mat(app.UITable5.Data(1:end,1));
             hasykk=cell2mat(app.UITable5.Data(1:end,2));
             jklkk=cell2mat(app.UITable2_2.Data(1:end,2));
             jkl2kk=cell2mat(app.UITable2_2.Data(1:end,3));             
            
            
             plot(app.UIAxes_2,jklkk,jkl2kk,'o',haskk,hasykk,'LineStyle','-');
             xlabel(app.UIAxes_2,'Net Stress (psi)','FontWeight','bold');
             ylabel(app.UIAxes_2,'Vp (cc)','FontWeight','bold');
             
%              app.p(1).LineStyle='-';
%              app.p(2).LineStyle='-';
%              app.p(2).Marker='o';
             legend(app.UIAxes_2,'Measuared Kk', 'Jones');
           

             title(app.UIAxes_2,'Kk vs Net Stress');
             

%              % Plot the principal and interest
%             plot(app.PrincipalInterestUIAxes,(1:nper)',principal, ...
%                 (1:nper)',interest);
%             legend(app.PrincipalInterestUIAxes,{'Principal','Interest'},'Location','Best')
%             xlim(app.PrincipalInterestUIAxes,[0 nper]); 
%             ylim(app.PrincipalInterestUIAxes,'auto');
%Kk
%                 kklinkenberg=cell2mat(app.tabla_1.Data(1,5));
%                 p1kk=cell2mat(app.tabla_3.Data(1,2));
%                 app.aKkEditField.Value=exp(-0.2-log(kklinkenberg)+0.13*log(kklinkenberg)*sqrt(abs(log(kklinkenberg))));
%                 app.ak=app.aKkEditField.Value;
%                 app.CEditField_2.Value=3*10^-6;
%                 app.EditField_2.Value=3000;
%                 app.Ck=3*10^-6;
%                 app.sigmak=3000;
%                 app.KkoEditField.Value=kklinkenberg*(1+app.Ck*p1kk)*exp(app.aKkEditField.Value*(1-exp(-p1kk/app.sigmak)));
%                 app.Ko=app.KkoEditField.Value;
% 

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create JONESAPPUIFigure and hide until all components are created
            app.JONESAPPUIFigure = uifigure('Visible', 'off');
            app.JONESAPPUIFigure.Color = [1 1 1];
            colormap(app.JONESAPPUIFigure, 'parula');
            app.JONESAPPUIFigure.Position = [100 100 640 399];
            app.JONESAPPUIFigure.Name = 'JONES APP';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.JONESAPPUIFigure);
            app.TabGroup.Position = [1 2 640 398];

            % Create DATATab
            app.DATATab = uitab(app.TabGroup);
            app.DATATab.Title = 'DATA';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.DATATab);
            app.GridLayout.ColumnWidth = {'1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x'};

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.GridLayout);
            app.GridLayout2.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout2.Layout.Row = 1;
            app.GridLayout2.Layout.Column = 1;

            % Create Image
            app.Image = uiimage(app.GridLayout2);
            app.Image.Layout.Row = [1 2];
            app.Image.Layout.Column = 1;
            app.Image.ImageSource = fullfile(pathToMLAPP, 'JESUS PACHECO LOGO_Mesa de trabajo 1.png');

            % Create APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel = uilabel(app.GridLayout2);
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.HorizontalAlignment = 'center';
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.FontSize = 10;
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.FontWeight = 'bold';
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.FontAngle = 'italic';
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.Layout.Row = [1 2];
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.Layout.Column = [2 3];
            app.APPTODETERMINEVPANDPERMEABILITYWITHJONESEQUATIONLabel.Text = 'APP TO DETERMINE VP AND PERMEABILITY WITH JONES EQUATION';

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.GridLayout);
            app.GridLayout3.RowHeight = {'1x'};
            app.GridLayout3.Layout.Row = 3;
            app.GridLayout3.Layout.Column = 1;

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.GridLayout3);
            app.GridLayout5.RowHeight = {'1x'};
            app.GridLayout5.Layout.Row = 1;
            app.GridLayout5.Layout.Column = 1;

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.GridLayout5);
            app.ButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroupSelectionChanged, true);
            app.ButtonGroup.Title = 'Button Group';
            app.ButtonGroup.Layout.Row = 1;
            app.ButtonGroup.Layout.Column = 1;
            app.ButtonGroup.FontSize = 10;

            % Create SingleStressButton
            app.SingleStressButton = uiradiobutton(app.ButtonGroup);
            app.SingleStressButton.Text = 'Single Stress';
            app.SingleStressButton.Position = [1 25 93 22];
            app.SingleStressButton.Value = true;

            % Create TwoStressButton
            app.TwoStressButton = uiradiobutton(app.ButtonGroup);
            app.TwoStressButton.Text = 'Two Stress';
            app.TwoStressButton.Position = [1 1 82 22];

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.GridLayout5);
            app.GridLayout6.ColumnWidth = {'1x'};
            app.GridLayout6.Layout.Row = 1;
            app.GridLayout6.Layout.Column = 2;

            % Create DeleteButton
            app.DeleteButton = uibutton(app.GridLayout6, 'state');
            app.DeleteButton.ValueChangedFcn = createCallbackFcn(app, @DeleteButtonValueChanged, true);
            app.DeleteButton.Text = 'Delete';
            app.DeleteButton.Layout.Row = 1;
            app.DeleteButton.Layout.Column = 1;

            % Create CalculateButton
            app.CalculateButton = uibutton(app.GridLayout6, 'state');
            app.CalculateButton.ValueChangedFcn = createCallbackFcn(app, @CalculateButtonValueChanged, true);
            app.CalculateButton.Text = 'Calculate';
            app.CalculateButton.Layout.Row = 2;
            app.CalculateButton.Layout.Column = 1;

            % Create AppdesignedbyJessPachecoLabel
            app.AppdesignedbyJessPachecoLabel = uilabel(app.GridLayout3);
            app.AppdesignedbyJessPachecoLabel.HorizontalAlignment = 'center';
            app.AppdesignedbyJessPachecoLabel.FontWeight = 'bold';
            app.AppdesignedbyJessPachecoLabel.Layout.Row = 1;
            app.AppdesignedbyJessPachecoLabel.Layout.Column = 2;
            app.AppdesignedbyJessPachecoLabel.Text = {'App designed by Jesús Pacheco'; ''};

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.GridLayout);
            app.GridLayout4.ColumnWidth = {'1x'};
            app.GridLayout4.RowHeight = {'0.9x'};
            app.GridLayout4.Layout.Row = 2;
            app.GridLayout4.Layout.Column = 1;

            % Create UITable
            app.UITable = uitable(app.GridLayout4);
            app.UITable.ColumnName = {'Depth (ft)'; 'Net Stress (psi)'; 'Vp (cc)'; 'Porosity (%)'; 'Kk (md)'};
            app.UITable.RowName = {};
            app.UITable.ColumnEditable = true;
            app.UITable.CellEditCallback = createCallbackFcn(app, @UITableCellEdit, true);
            app.UITable.Layout.Row = 1;
            app.UITable.Layout.Column = 1;

            % Create VPTab
            app.VPTab = uitab(app.TabGroup);
            app.VPTab.Title = 'VP';

            % Create UIAxes
            app.UIAxes = uiaxes(app.VPTab);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [230 21 385 243];

            % Create UITable2
            app.UITable2 = uitable(app.VPTab);
            app.UITable2.ColumnName = {'Deepth (ft)'; 'Net Stress (psi)'; 'Vp (cc)'; 'Porosity (%)'};
            app.UITable2.RowName = {};
            app.UITable2.Position = [25 275 333 79];

            % Create VPPanel
            app.VPPanel = uipanel(app.VPTab);
            app.VPPanel.TitlePosition = 'centertop';
            app.VPPanel.Title = 'VP ';
            app.VPPanel.FontWeight = 'bold';
            app.VPPanel.Position = [22 20 209 82];

            % Create NetStresspsiEditFieldLabel
            app.NetStresspsiEditFieldLabel = uilabel(app.VPPanel);
            app.NetStresspsiEditFieldLabel.HorizontalAlignment = 'right';
            app.NetStresspsiEditFieldLabel.Position = [12 33 88 22];
            app.NetStresspsiEditFieldLabel.Text = 'Net Stress (psi)';

            % Create NetStresspsiEditField
            app.NetStresspsiEditField = uieditfield(app.VPPanel, 'numeric');
            app.NetStresspsiEditField.ValueChangedFcn = createCallbackFcn(app, @NetStresspsiEditFieldValueChanged, true);
            app.NetStresspsiEditField.Position = [113 33 91 22];

            % Create VpccEditFieldLabel
            app.VpccEditFieldLabel = uilabel(app.VPPanel);
            app.VpccEditFieldLabel.HorizontalAlignment = 'right';
            app.VpccEditFieldLabel.Position = [54 7 44 22];
            app.VpccEditFieldLabel.Text = 'Vp (cc)';

            % Create VpccEditField
            app.VpccEditField = uieditfield(app.VPPanel, 'numeric');
            app.VpccEditField.ValueDisplayFormat = '%.3f';
            app.VpccEditField.Editable = 'off';
            app.VpccEditField.Position = [113 7 89 22];

            % Create JonesequationcoefficientsPanel
            app.JonesequationcoefficientsPanel = uipanel(app.VPTab);
            app.JonesequationcoefficientsPanel.TitlePosition = 'centertop';
            app.JonesequationcoefficientsPanel.Title = 'Jones equation coefficients';
            app.JonesequationcoefficientsPanel.FontWeight = 'bold';
            app.JonesequationcoefficientsPanel.Position = [21 111 183 153];

            % Create avEditFieldLabel
            app.avEditFieldLabel = uilabel(app.JonesequationcoefficientsPanel);
            app.avEditFieldLabel.HorizontalAlignment = 'right';
            app.avEditFieldLabel.Position = [-10 79 45 22];
            app.avEditFieldLabel.Text = 'av';

            % Create avEditField
            app.avEditField = uieditfield(app.JonesequationcoefficientsPanel, 'numeric');
            app.avEditField.ValueDisplayFormat = '%.3f';
            app.avEditField.ValueChangedFcn = createCallbackFcn(app, @avEditFieldValueChanged, true);
            app.avEditField.Editable = 'off';
            app.avEditField.HorizontalAlignment = 'center';
            app.avEditField.Position = [53 79 98 22];

            % Create CEditFieldLabel
            app.CEditFieldLabel = uilabel(app.JonesequationcoefficientsPanel);
            app.CEditFieldLabel.HorizontalAlignment = 'right';
            app.CEditFieldLabel.Position = [-10 46 45 22];
            app.CEditFieldLabel.Text = 'C';

            % Create CEditField
            app.CEditField = uieditfield(app.JonesequationcoefficientsPanel, 'numeric');
            app.CEditField.Editable = 'off';
            app.CEditField.HorizontalAlignment = 'center';
            app.CEditField.Position = [53 46 98 22];

            % Create EditFieldLabel
            app.EditFieldLabel = uilabel(app.JonesequationcoefficientsPanel);
            app.EditFieldLabel.HorizontalAlignment = 'right';
            app.EditFieldLabel.Position = [-10 11 45 22];
            app.EditFieldLabel.Text = 'σ0 ';

            % Create EditField
            app.EditField = uieditfield(app.JonesequationcoefficientsPanel, 'numeric');
            app.EditField.ValueDisplayFormat = '%.0f';
            app.EditField.Editable = 'off';
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.Position = [53 11 98 22];

            % Create VoEditFieldLabel
            app.VoEditFieldLabel = uilabel(app.JonesequationcoefficientsPanel);
            app.VoEditFieldLabel.HorizontalAlignment = 'center';
            app.VoEditFieldLabel.Position = [1 110 55 22];
            app.VoEditFieldLabel.Text = 'Vo';

            % Create VoEditField
            app.VoEditField = uieditfield(app.JonesequationcoefficientsPanel, 'numeric');
            app.VoEditField.ValueDisplayFormat = '%.3f';
            app.VoEditField.Editable = 'off';
            app.VoEditField.HorizontalAlignment = 'center';
            app.VoEditField.Position = [54 110 97 22];

            % Create UITable4
            app.UITable4 = uitable(app.VPTab);
            app.UITable4.ColumnName = {'Net Stress (psi)'; 'Vp Jones (cc)'};
            app.UITable4.RowName = {};
            app.UITable4.Position = [367 275 248 79];

            % Create KTab_2
            app.KTab_2 = uitab(app.TabGroup);
            app.KTab_2.Title = 'K';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.KTab_2);
            title(app.UIAxes_2, 'Title')
            xlabel(app.UIAxes_2, 'X')
            ylabel(app.UIAxes_2, 'Y')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.Position = [230 21 385 243];

            % Create UITable2_2
            app.UITable2_2 = uitable(app.KTab_2);
            app.UITable2_2.ColumnName = {'Deepth (ft)'; 'Net Stress (psi)'; 'Kk (md)'};
            app.UITable2_2.RowName = {};
            app.UITable2_2.Position = [25 275 333 79];

            % Create JonesequationcoefficientsPanel_2
            app.JonesequationcoefficientsPanel_2 = uipanel(app.KTab_2);
            app.JonesequationcoefficientsPanel_2.Title = 'Jones equation coefficients';
            app.JonesequationcoefficientsPanel_2.Position = [21 111 163 153];

            % Create aKkEditFieldLabel
            app.aKkEditFieldLabel = uilabel(app.JonesequationcoefficientsPanel_2);
            app.aKkEditFieldLabel.HorizontalAlignment = 'right';
            app.aKkEditFieldLabel.Position = [-10 79 45 22];
            app.aKkEditFieldLabel.Text = 'aKk';

            % Create aKkEditField
            app.aKkEditField = uieditfield(app.JonesequationcoefficientsPanel_2, 'numeric');
            app.aKkEditField.ValueDisplayFormat = '%.3f';
            app.aKkEditField.HorizontalAlignment = 'center';
            app.aKkEditField.Position = [53 79 98 22];

            % Create CEditField_2Label
            app.CEditField_2Label = uilabel(app.JonesequationcoefficientsPanel_2);
            app.CEditField_2Label.HorizontalAlignment = 'right';
            app.CEditField_2Label.Position = [-10 46 45 22];
            app.CEditField_2Label.Text = 'C';

            % Create CEditField_2
            app.CEditField_2 = uieditfield(app.JonesequationcoefficientsPanel_2, 'numeric');
            app.CEditField_2.HorizontalAlignment = 'center';
            app.CEditField_2.Position = [53 46 98 22];

            % Create EditField_2Label
            app.EditField_2Label = uilabel(app.JonesequationcoefficientsPanel_2);
            app.EditField_2Label.HorizontalAlignment = 'right';
            app.EditField_2Label.Position = [-10 11 45 22];
            app.EditField_2Label.Text = 'σ0 ';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.JonesequationcoefficientsPanel_2, 'numeric');
            app.EditField_2.ValueDisplayFormat = '%.0f';
            app.EditField_2.HorizontalAlignment = 'center';
            app.EditField_2.Position = [53 11 98 22];

            % Create KkoEditFieldLabel
            app.KkoEditFieldLabel = uilabel(app.JonesequationcoefficientsPanel_2);
            app.KkoEditFieldLabel.HorizontalAlignment = 'center';
            app.KkoEditFieldLabel.Position = [1 110 55 22];
            app.KkoEditFieldLabel.Text = 'Kko';

            % Create KkoEditField
            app.KkoEditField = uieditfield(app.JonesequationcoefficientsPanel_2, 'numeric');
            app.KkoEditField.ValueDisplayFormat = '%.3f';
            app.KkoEditField.HorizontalAlignment = 'center';
            app.KkoEditField.Position = [52 110 99 22];

            % Create KkPanel
            app.KkPanel = uipanel(app.KTab_2);
            app.KkPanel.TitlePosition = 'centertop';
            app.KkPanel.Title = 'Kk';
            app.KkPanel.Position = [22 20 209 82];

            % Create NetStresspsiEditField_2Label
            app.NetStresspsiEditField_2Label = uilabel(app.KkPanel);
            app.NetStresspsiEditField_2Label.HorizontalAlignment = 'right';
            app.NetStresspsiEditField_2Label.Position = [12 33 88 22];
            app.NetStresspsiEditField_2Label.Text = 'Net Stress (psi)';

            % Create NetStresspsiEditField_2
            app.NetStresspsiEditField_2 = uieditfield(app.KkPanel, 'numeric');
            app.NetStresspsiEditField_2.ValueChangedFcn = createCallbackFcn(app, @NetStresspsiEditField_2ValueChanged, true);
            app.NetStresspsiEditField_2.Position = [113 33 91 22];

            % Create KkmdEditFieldLabel
            app.KkmdEditFieldLabel = uilabel(app.KkPanel);
            app.KkmdEditFieldLabel.HorizontalAlignment = 'right';
            app.KkmdEditFieldLabel.Position = [51 7 47 22];
            app.KkmdEditFieldLabel.Text = 'Kk (md)';

            % Create KkmdEditField
            app.KkmdEditField = uieditfield(app.KkPanel, 'numeric');
            app.KkmdEditField.Position = [113 7 89 22];

            % Create UITable5
            app.UITable5 = uitable(app.KTab_2);
            app.UITable5.ColumnName = {'Net Stress (psi)'; 'K Jones (md)'};
            app.UITable5.RowName = {};
            app.UITable5.Position = [367 275 248 79];

            % Show the figure after all components are created
            app.JONESAPPUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = jones_app_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.JONESAPPUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.JONESAPPUIFigure)
        end
    end
end