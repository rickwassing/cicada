% REGISTERUSER
% Asks the user to register.

% Authors:
%   Rick Wassing, Woolcock Institute of Medical Research, Sydney, Australia
%
% History:
%   Created 2023-08-22, Rick Wassing

% Cicada (C) 2023 by Rick Wassing is licensed under
% Attribution-NonCommercial-ShareAlike 4.0 International
% This license requires that reusers give credit to the creator. It allows
% reusers to distribute, remix, adapt, and build upon the material in any
% medium or format, for noncommercial purposes only. If others modify or
% adapt the material, they must license the modified material under
% identical terms.

classdef RegisterUser < matlab.ui.componentcontainer.ComponentContainer
    % *********************************************************************
    % PROPERTIES
    properties
        Size = [450, 405];
        PayLoad = struct('name', '', 'institute', '', 'email', '', 'subscribe', 'yes', 'accept', 'no');
        Verbose;
    end
    properties (Access = public, Transient, NonCopyable)
        Panel matlab.ui.container.Panel
        GridLayout matlab.ui.container.GridLayout
        Text
        Labels
        Inputs
        Buttons
        WelcomePanel
        FormPanel
        WelcomeGridLayout
        FormGridLayout
        TitleText = 'Thank you for using Cicada.';
        WelcomeText = 'Cicada is an open-source software for analysing actigraphy and data from other wearable devices.';
        LicenseText = 'This app is developed by Rick Wassing, rick.wassing@woolcock.org.au, Woolcock Institute of Medical Research, Macquarie University, Australia, and is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.';
        DisclaimerText = 'I am a neuroscientist, foremost, and not a professional software developer. I have coded Cicada to the best of my abilities, but this software is provided "as is" and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the developers be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage.'; 
        FormText = 'By providing this app open-source and free of charge, Cicada aims to enable science for all. It would benefit me if you could please register the use of this app. This information may be used in presentations, publications, grant applications, etc.';
    end
    % *********************************************************************
    % METHODS
    methods (Access = protected)
        % =================================================================
        function setup(Obj)
            % -------------------------------------------------------------
            % Create sub-components
            % -------------------------------------------------------------
            Colors = app_colors();
            % -------------------------------------------------------------
            Obj.Tag = 'RegisterUser';
            Obj.Panel = uipanel(Obj, ...
                'Title', '', ...
                'FontSize', 8, ...
                'FontWeight', 'bold', ...
                'Tag', 'Register_Panel', ...
                'ForegroundColor', Colors.body_primary, ...
                'BackgroundColor', Colors.bg_secondary, ...
                'HighLightColor', [0.8, 0.8, 0.8], ...
                'Units', 'normalized', ...
                'Position', [0, 0, 1, 1]);
            % -------------------------------------------------------------
            Obj.GridLayout = uigridlayout(Obj.Panel, ...
                'Tag', 'RegisterUser_GridLayout', ...
                'ColumnWidth', {'1x', '1x'}, ...
                'RowHeight', {'1x', 24}, ...
                'ColumnSpacing', 12, ...
                'RowSpacing', 6, ...
                'Padding', 12, ...
                'BackgroundColor', Colors.bg_secondary);
            % -------------------------------------------------------------
            Obj.WelcomePanel = uipanel(Obj.GridLayout, ...
                'FontSize', 8, ...
                'Tag', 'RegisterUser_WelcomePanel', ...
                'BorderType', 'none', ...
                'ForegroundColor', Colors.body_primary, ...
                'BackgroundColor', Colors.bg_secondary, ...
                'HighLightColor', [0.8, 0.8, 0.8]);
            Obj.WelcomePanel.Layout.Row = 1;
            Obj.WelcomePanel.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.WelcomeGridLayout = uigridlayout(Obj.WelcomePanel, ...
                'Tag', 'RegisterUser_WelcomeGridLayout', ...
                'ColumnWidth', {'1x'}, ...
                'RowHeight', {24, 75, 245}, ...
                'ColumnSpacing', 0, ...
                'RowSpacing', 6, ...
                'Padding', 0, ...
                'BackgroundColor', Colors.bg_secondary);
            % -------------------------------------------------------------
            Obj.Text(1).Obj = uilabel(Obj.WelcomeGridLayout, ...
                'Text', Obj.TitleText, ...
                'WordWrap', 'on', ...
                'VerticalAlignment', 'top', ...
                'FontWeight', 'bold', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 12);
            Obj.Text(1).Obj.Layout.Row = 1;
            Obj.Text(1).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Text(2).Obj = uilabel(Obj.WelcomeGridLayout, ...
                'Text', Obj.LicenseText, ...
                'WordWrap', 'on', ...
                'VerticalAlignment', 'top', ...
                'FontColor', Colors.body_secondary, ...
                'FontSize', 10);
            Obj.Text(2).Obj.Layout.Row = 2;
            Obj.Text(2).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Text(3).Obj = uilabel(Obj.WelcomeGridLayout, ...
                'Text', Obj.DisclaimerText, ...
                'WordWrap', 'on', ...
                'VerticalAlignment', 'top', ...
                'FontColor', Colors.body_secondary, ...
                'FontSize', 10);
            Obj.Text(3).Obj.Layout.Row = 3;
            Obj.Text(3).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.FormPanel = uipanel(Obj.GridLayout, ...
                'FontSize', 8, ...
                'Tag', 'Register_FormPanel', ...
                'BorderType', 'none', ...
                'ForegroundColor', Colors.body_primary, ...
                'BackgroundColor', Colors.bg_secondary, ...
                'HighLightColor', [0.8, 0.8, 0.8]);
            Obj.FormPanel.Layout.Row = 1;
            Obj.FormPanel.Layout.Column = 2;
            % -------------------------------------------------------------
            Obj.FormGridLayout = uigridlayout(Obj.FormPanel, ...
                'Tag', 'RegisterUser_FormGridLayout', ...
                'ColumnWidth', {'1x'}, ...
                'RowHeight', {24, 78, 18, 24, 18, 24, 18, 24, 18, 18}, ...
                'ColumnSpacing', 0, ...
                'RowSpacing', 3, ...
                'Padding', 0, ...
                'BackgroundColor', Colors.bg_secondary);
            % -------------------------------------------------------------
            Obj.Text(4).Obj = uilabel(Obj.FormGridLayout, ...
                'Text', 'Please register', ...
                'WordWrap', 'on', ...
                'VerticalAlignment', 'top', ...
                'FontWeight', 'bold', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 12);
            Obj.Text(4).Obj.Layout.Row = 1;
            Obj.Text(4).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Text(5).Obj = uilabel(Obj.FormGridLayout, ...
                'Text', Obj.FormText, ...
                'WordWrap', 'on', ...
                'VerticalAlignment', 'top', ...
                'FontWeight', 'bold', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 10);
            Obj.Text(5).Obj.Layout.Row = 2;
            Obj.Text(5).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Labels(1).Obj = uilabel(Obj.FormGridLayout, ...
                'Text', 'Name', ...
                'FontWeight', 'bold', ...
                'VerticalAlignment', 'bottom', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 10);
            Obj.Labels(1).Obj.Layout.Row = 3;
            Obj.Labels(1).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Inputs(1).Obj = uieditfield(Obj.FormGridLayout, 'text', ...
                'Tag', 'name', ...
                'FontSize', 10, ...
                'ValueChangedFcn', @(~, event) Obj.setregistration(event));
            Obj.Inputs(1).Obj.Layout.Row = 4;
            Obj.Inputs(1).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Labels(2).Obj = uilabel(Obj.FormGridLayout, ...
                'Text', 'Institute', ...
                'FontWeight', 'bold', ...
                'VerticalAlignment', 'bottom', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 10);
            Obj.Labels(2).Obj.Layout.Row = 5;
            Obj.Labels(2).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Inputs(2).Obj = uieditfield(Obj.FormGridLayout, 'text', ...
                'Tag', 'institute', ...
                'FontSize', 10, ...
                'ValueChangedFcn', @(~, event) Obj.setregistration(event));
            Obj.Inputs(2).Obj.Layout.Row = 6;
            Obj.Inputs(2).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Labels(3).Obj = uilabel(Obj.FormGridLayout, ...
                'Text', 'Email', ...
                'FontWeight', 'bold', ...
                'VerticalAlignment', 'bottom', ...
                'FontColor', Colors.body_primary, ...
                'FontSize', 10);
            Obj.Labels(3).Obj.Layout.Row = 7;
            Obj.Labels(3).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Inputs(3).Obj = uieditfield(Obj.FormGridLayout, 'text', ...
                'Tag', 'email', ...
                'FontSize', 10, ...
                'ValueChangedFcn', @(~, event) Obj.setregistration(event));
            Obj.Inputs(3).Obj.Layout.Row = 8;
            Obj.Inputs(3).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Inputs(4).Obj = uicheckbox(Obj.FormGridLayout, ...
                'Tag', 'subscribe', ...
                'Text', 'Subscribe to updates', ...
                'Value', true, ...
                'FontColor', Colors.body_secondary, ...
                'FontSize', 10, ...
                'ValueChangedFcn', @(~, event) Obj.setregistration(event));
            Obj.Inputs(4).Obj.Layout.Row = 9;
            Obj.Inputs(4).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Inputs(5).Obj = uicheckbox(Obj.FormGridLayout, ...
                'Tag', 'accept', ...
                'Text', 'I accept the CC BY-SA License terms', ...
                'FontColor', Colors.body_secondary, ...
                'FontSize', 10, ...
                'ValueChangedFcn', @(~, event) Obj.setregistration(event));
            Obj.Inputs(5).Obj.Layout.Row = 10;
            Obj.Inputs(5).Obj.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Buttons.Cancel = uibutton(Obj.GridLayout, ...
                'Text', 'USE ANONYMOUSLY', ...
                'Enable', 'off', ...
                'Tag', 'anonymous', ...
                'FontSize', 10, ...
                'FontWeight', 'bold', ...
                'FontColor', 'w', ...
                'BackgroundColor', Colors.bs_secondary, ...
                'ButtonPushedFcn', @(source, event) Obj.submit(event));
            Obj.Buttons.Cancel.Layout.Row = 2;
            Obj.Buttons.Cancel.Layout.Column = 1;
            % -------------------------------------------------------------
            Obj.Buttons.Submit = uibutton(Obj.GridLayout, ...
                'Text', 'REGISTER', ...
                'Enable', 'off', ...
                'FontSize', 10, ...
                'FontWeight', 'bold', ...
                'FontColor', 'w', ...
                'BackgroundColor', Colors.bs_success, ...
                'ButtonPushedFcn', @(source, event) Obj.submit(event));
            Obj.Buttons.Submit.Layout.Row = 2;
            Obj.Buttons.Submit.Layout.Column = 2;
        end
        % =================================================================
        function update(Obj)
            try
                % ---------------------------------------------------------
                % Timer
                if Obj.Verbose; Time = now; end %#ok<TNOW1>
                % ---------------------------------------------------------
                % Todo
                % ---------------------------------------------------------
                if Obj.Verbose
                    fprintf('>> CIC: RegisterUser updated in %.1g s.\n', (now-Time)*24*60*60); %#ok<TNOW1>
                end
            catch ME
                printerrormessage(ME, 'The error occurred during ''update'' in RegisterUser.m')
            end
        end
    end
    % *********************************************************************
    methods (Access = public)
        % =================================================================
        % Cancel 
        function setregistration(Obj, event)
            % -------------------------------------------------------------
            % Convert bool to 'yes' or 'no'
            if islogical(event.Value)
                val = ifelse(event.Value, 'yes', 'no');
            else
                val = event.Value;
            end
            % Set value
            Obj.PayLoad.(event.Source.Tag) = val;
            % -------------------------------------------------------------
            % Check if the buttons can be enabled
            if strcmpi(Obj.PayLoad.accept, 'yes')
                Obj.Buttons.Cancel.Enable = 'on';
            else
                Obj.Buttons.Cancel.Enable = 'off';
            end
            if ...
                    strcmpi(Obj.PayLoad.accept, 'yes') && ...
                    ~isempty(Obj.PayLoad.name) && ...
                    ~isempty(Obj.PayLoad.institute) && ...
                    ~isempty(Obj.PayLoad.email)
                Obj.Buttons.Submit.Enable = 'on';
            else
                Obj.Buttons.Submit.Enable = 'off';
            end
        end
        % =================================================================
        % Create or update event
        function submit(Obj, event)
            % Get app handle so we have access to the MS Flow URL
            app = app_gethandle();
            % Set date-time
            dt = datetime('now', 'TimeZone', 'local');
            dt = sprintf('%s (%s)', char(dt, 'uuuu-MM-dd''T''HH:mm:ss'), dt.TimeZone);
            % Check if we should anonymize the user details
            if ~strcmpi(event.Source.Text, 'register')
                Obj.PayLoad.name = 'anonymous';
                Obj.PayLoad.institute = 'n/a';
                Obj.PayLoad.email = 'john@doe.com';
            end
            % Construct payload
            try
                httpreq(app.URL.MSFlow, ...
                    'user', Obj.PayLoad.name, ...
                    'institute', Obj.PayLoad.institute, ...
                    'email', Obj.PayLoad.email, ...
                    'subscribe', Obj.PayLoad.subscribe, ...
                    'datetime', dt);
            catch
                % API request failed for some reason, don't mind, keep going
            end
            % -------------------------------------------------------------
            % Store app settings that we have registered (no need to ask again)
            app.Props.Settings.Auth = struct();
            app.Props.Settings.Auth.User = Obj.PayLoad.name;
            app.Props.Settings.Auth.Institute = Obj.PayLoad.institute;
            app.Props.Settings.Auth.Email = Obj.PayLoad.email;
            app.Props.Settings.Auth.Subscribe = Obj.PayLoad.subscribe;
            app.Props.Settings.Auth.AskAgain = true;
            app.Props.Settings.Auth.IsRegistered = true;
            app.Props.Settings.Auth.DateTime = dt;
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            app_savesettings(app.Props.Settings);
            % -------------------------------------------------------------
            % Close modal
            app.hModal(event, '');
        end
        % =================================================================
        function hUpdate(Obj, app, ~)
            try
                % TODO: 
            catch ME
                printerrormessage(ME, 'The error occurred during ''hUpdate'' in RegisterUser.m')
            end
        end
    end
end