//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <agora_rtc_engine/agora_rtc_engine_plugin.h>
#include <audioplayers_windows/audioplayers_windows_plugin.h>
#include <awesome_notifications/awesome_notifications_plugin_c_api.h>
#include <iris_event/iris_event_plugin.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <zego_express_engine/zego_express_engine_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AgoraRtcEnginePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AgoraRtcEnginePlugin"));
  AudioplayersWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AudioplayersWindowsPlugin"));
  AwesomeNotificationsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AwesomeNotificationsPluginCApi"));
  IrisEventPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("IrisEventPlugin"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  ZegoExpressEnginePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ZegoExpressEnginePlugin"));
}
