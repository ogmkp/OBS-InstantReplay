obs = obslua
SLEEP_LIM = 3*(10^8)
proccessing = false
function script_description()
  return [[
    <center><h2>疑似インスタントリプレイ</h2></center>
    <left><p>保存ボタンを押すと自動でリプレイバッファをOff=>Onし、</br>バッファをリセットします。</p>
    
    ]]
end

function sleep()
  for i = 1, SLEEP_LIM do
  end
  --print("sleped")
end

function on_event(e)
  if e == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then 
    obs.obs_frontend_replay_buffer_stop()
    proccessing = true
    --print(proccessing and "true" or "false")
  end
  if(e == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STOPPED)then
    --print(proccessing and "true" or "false")
    if proccessing then
      sleep()
      obs.obs_frontend_replay_buffer_start()
      proccessing = false
    end
  end
end

function script_load(settings)
  obs.obs_frontend_add_event_callback(on_event)
end