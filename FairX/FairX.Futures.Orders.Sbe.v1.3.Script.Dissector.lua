-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Fairx Futures Orders Sbe 1.3 Protocol
local fairx_futures_orders_sbe_v1_3 = Proto("Fairx.Futures.Orders.Sbe.v1.3.Lua", "Fairx Futures Orders Sbe 1.3")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Fairx Futures Orders Sbe 1.3 Fields
fairx_futures_orders_sbe_v1_3.fields.account = ProtoField.new("Account", "fairx.futures.orders.sbe.v1.3.account", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.available_qty = ProtoField.new("Available Qty", "fairx.futures.orders.sbe.v1.3.availableqty", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.begin_exec_id = ProtoField.new("Begin Exec Id", "fairx.futures.orders.sbe.v1.3.beginexecid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.block_length = ProtoField.new("Block Length", "fairx.futures.orders.sbe.v1.3.blocklength", ftypes.UINT16)
fairx_futures_orders_sbe_v1_3.fields.cancel_order_message = ProtoField.new("Cancel Order Message", "fairx.futures.orders.sbe.v1.3.cancelordermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.cancel_order_reject_message = ProtoField.new("Cancel Order Reject Message", "fairx.futures.orders.sbe.v1.3.cancelorderrejectmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.cancel_reason = ProtoField.new("Cancel Reason", "fairx.futures.orders.sbe.v1.3.cancelreason", ftypes.UINT8)
fairx_futures_orders_sbe_v1_3.fields.canceled_count = ProtoField.new("Canceled Count", "fairx.futures.orders.sbe.v1.3.canceledcount", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.client_order_id = ProtoField.new("Client Order Id", "fairx.futures.orders.sbe.v1.3.clientorderid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.correlation_id = ProtoField.new("Correlation Id", "fairx.futures.orders.sbe.v1.3.correlationid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.current_session_only = ProtoField.new("Current Session Only", "fairx.futures.orders.sbe.v1.3.currentsessiononly", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.details = ProtoField.new("Details", "fairx.futures.orders.sbe.v1.3.details", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.end_exec_id = ProtoField.new("End Exec Id", "fairx.futures.orders.sbe.v1.3.endexecid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.error_message = ProtoField.new("Error Message", "fairx.futures.orders.sbe.v1.3.errormessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.event_resend_complete_message = ProtoField.new("Event Resend Complete Message", "fairx.futures.orders.sbe.v1.3.eventresendcompletemessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.event_resend_reject_message = ProtoField.new("Event Resend Reject Message", "fairx.futures.orders.sbe.v1.3.eventresendrejectmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.event_resend_request_message = ProtoField.new("Event Resend Request Message", "fairx.futures.orders.sbe.v1.3.eventresendrequestmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.exec_id = ProtoField.new("Exec Id", "fairx.futures.orders.sbe.v1.3.execid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.fill_price = ProtoField.new("Fill Price", "fairx.futures.orders.sbe.v1.3.fillprice", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.fill_qty = ProtoField.new("Fill Qty", "fairx.futures.orders.sbe.v1.3.fillqty", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.filled_vwap = ProtoField.new("Filled Vwap", "fairx.futures.orders.sbe.v1.3.filledvwap", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.flags = ProtoField.new("Flags", "fairx.futures.orders.sbe.v1.3.flags", ftypes.UINT8)
fairx_futures_orders_sbe_v1_3.fields.instrument_id = ProtoField.new("Instrument Id", "fairx.futures.orders.sbe.v1.3.instrumentid", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.instrument_info_message = ProtoField.new("Instrument Info Message", "fairx.futures.orders.sbe.v1.3.instrumentinfomessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.instrument_info_request_message = ProtoField.new("Instrument Info Request Message", "fairx.futures.orders.sbe.v1.3.instrumentinforequestmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.is_aggressor = ProtoField.new("Is Aggressor", "fairx.futures.orders.sbe.v1.3.isaggressor", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.is_last_message = ProtoField.new("Is Last Message", "fairx.futures.orders.sbe.v1.3.islastmessage", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.last_exec_id = ProtoField.new("Last Exec Id", "fairx.futures.orders.sbe.v1.3.lastexecid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.last_exec_id_message = ProtoField.new("Last Exec Id Message", "fairx.futures.orders.sbe.v1.3.lastexecidmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.last_exec_id_request_message = ProtoField.new("Last Exec Id Request Message", "fairx.futures.orders.sbe.v1.3.lastexecidrequestmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.last_processed_fill_id = ProtoField.new("Last Processed Fill Id", "fairx.futures.orders.sbe.v1.3.lastprocessedfillid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.last_processed_seq_no = ProtoField.new("Last Processed Seq No", "fairx.futures.orders.sbe.v1.3.lastprocessedseqno", ftypes.UINT32)
fairx_futures_orders_sbe_v1_3.fields.leg_1_fill_price = ProtoField.new("Leg 1 Fill Price", "fairx.futures.orders.sbe.v1.3.leg1fillprice", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.leg_2_fill_price = ProtoField.new("Leg 2 Fill Price", "fairx.futures.orders.sbe.v1.3.leg2fillprice", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.limit_price = ProtoField.new("Limit Price", "fairx.futures.orders.sbe.v1.3.limitprice", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_ack_message = ProtoField.new("Mass Cancel Order Ack Message", "fairx.futures.orders.sbe.v1.3.masscancelorderackmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_message = ProtoField.new("Mass Cancel Order Message", "fairx.futures.orders.sbe.v1.3.masscancelordermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_reject_message = ProtoField.new("Mass Cancel Order Reject Message", "fairx.futures.orders.sbe.v1.3.masscancelorderrejectmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.match_id = ProtoField.new("Match Id", "fairx.futures.orders.sbe.v1.3.matchid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.message_header = ProtoField.new("Message Header", "fairx.futures.orders.sbe.v1.3.messageheader", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.message_length = ProtoField.new("Message Length", "fairx.futures.orders.sbe.v1.3.messagelength", ftypes.UINT16)
fairx_futures_orders_sbe_v1_3.fields.new_limit_price = ProtoField.new("New Limit Price", "fairx.futures.orders.sbe.v1.3.newlimitprice", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.new_order_message = ProtoField.new("New Order Message", "fairx.futures.orders.sbe.v1.3.newordermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.new_quantity = ProtoField.new("New Quantity", "fairx.futures.orders.sbe.v1.3.newquantity", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.num_users_affected = ProtoField.new("Num Users Affected", "fairx.futures.orders.sbe.v1.3.numusersaffected", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.only_current_session = ProtoField.new("Only Current Session", "fairx.futures.orders.sbe.v1.3.onlycurrentsession", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.order_canceled_message = ProtoField.new("Order Canceled Message", "fairx.futures.orders.sbe.v1.3.ordercanceledmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.order_entered_message = ProtoField.new("Order Entered Message", "fairx.futures.orders.sbe.v1.3.orderenteredmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.order_filled_message = ProtoField.new("Order Filled Message", "fairx.futures.orders.sbe.v1.3.orderfilledmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.order_id = ProtoField.new("Order Id", "fairx.futures.orders.sbe.v1.3.orderid", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.order_reject_message = ProtoField.new("Order Reject Message", "fairx.futures.orders.sbe.v1.3.orderrejectmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.order_replaced_message = ProtoField.new("Order Replaced Message", "fairx.futures.orders.sbe.v1.3.orderreplacedmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.packet = ProtoField.new("Packet", "fairx.futures.orders.sbe.v1.3.packet", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.padding = ProtoField.new("Padding", "fairx.futures.orders.sbe.v1.3.padding", ftypes.BYTES)
fairx_futures_orders_sbe_v1_3.fields.payload = ProtoField.new("Payload", "fairx.futures.orders.sbe.v1.3.payload", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.ping_message = ProtoField.new("Ping Message", "fairx.futures.orders.sbe.v1.3.pingmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.pong_message = ProtoField.new("Pong Message", "fairx.futures.orders.sbe.v1.3.pongmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.protocol_id = ProtoField.new("Protocol Id", "fairx.futures.orders.sbe.v1.3.protocolid", ftypes.UINT8)
fairx_futures_orders_sbe_v1_3.fields.quantity = ProtoField.new("Quantity", "fairx.futures.orders.sbe.v1.3.quantity", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.receive_time = ProtoField.new("Receive Time", "fairx.futures.orders.sbe.v1.3.receivetime", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.reject_reason = ProtoField.new("Reject Reason", "fairx.futures.orders.sbe.v1.3.rejectreason", ftypes.UINT8)
fairx_futures_orders_sbe_v1_3.fields.replace_order_message = ProtoField.new("Replace Order Message", "fairx.futures.orders.sbe.v1.3.replaceordermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.request_time = ProtoField.new("Request Time", "fairx.futures.orders.sbe.v1.3.requesttime", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.request_trading_lock = ProtoField.new("Request Trading Lock", "fairx.futures.orders.sbe.v1.3.requesttradinglock", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.resent_event_count = ProtoField.new("Resent Event Count", "fairx.futures.orders.sbe.v1.3.resenteventcount", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.reserved = ProtoField.new("Reserved", "fairx.futures.orders.sbe.v1.3.reserved", ftypes.UINT32)
fairx_futures_orders_sbe_v1_3.fields.sbe_message = ProtoField.new("Sbe Message", "fairx.futures.orders.sbe.v1.3.sbemessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.schema_id = ProtoField.new("Schema Id", "fairx.futures.orders.sbe.v1.3.schemaid", ftypes.UINT16)
fairx_futures_orders_sbe_v1_3.fields.security_type = ProtoField.new("Security Type", "fairx.futures.orders.sbe.v1.3.securitytype", ftypes.UINT8)
fairx_futures_orders_sbe_v1_3.fields.send_time_epoch_nanos = ProtoField.new("Send Time Epoch Nanos", "fairx.futures.orders.sbe.v1.3.sendtimeepochnanos", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.sequence_number = ProtoField.new("Sequence Number", "fairx.futures.orders.sbe.v1.3.sequencenumber", ftypes.UINT32)
fairx_futures_orders_sbe_v1_3.fields.server_time = ProtoField.new("Server Time", "fairx.futures.orders.sbe.v1.3.servertime", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.set_account_message = ProtoField.new("Set Account Message", "fairx.futures.orders.sbe.v1.3.setaccountmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.set_ack_message = ProtoField.new("Set Ack Message", "fairx.futures.orders.sbe.v1.3.setackmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.set_trader_message = ProtoField.new("Set Trader Message", "fairx.futures.orders.sbe.v1.3.settradermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.side = ProtoField.new("Side", "fairx.futures.orders.sbe.v1.3.side", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.spread_order_filled_message = ProtoField.new("Spread Order Filled Message", "fairx.futures.orders.sbe.v1.3.spreadorderfilledmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.status = ProtoField.new("Status", "fairx.futures.orders.sbe.v1.3.status", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.stream_order_message = ProtoField.new("Stream Order Message", "fairx.futures.orders.sbe.v1.3.streamordermessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.symbol = ProtoField.new("Symbol", "fairx.futures.orders.sbe.v1.3.symbol", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.template_id = ProtoField.new("Template Id", "fairx.futures.orders.sbe.v1.3.templateid", ftypes.UINT16)
fairx_futures_orders_sbe_v1_3.fields.timestamp = ProtoField.new("Timestamp", "fairx.futures.orders.sbe.v1.3.timestamp", ftypes.INT64)
fairx_futures_orders_sbe_v1_3.fields.total_filled = ProtoField.new("Total Filled", "fairx.futures.orders.sbe.v1.3.totalfilled", ftypes.INT32)
fairx_futures_orders_sbe_v1_3.fields.trader = ProtoField.new("Trader", "fairx.futures.orders.sbe.v1.3.trader", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.trading_lock_applied = ProtoField.new("Trading Lock Applied", "fairx.futures.orders.sbe.v1.3.tradinglockapplied", ftypes.INT8)
fairx_futures_orders_sbe_v1_3.fields.unlock_trading_ack_message = ProtoField.new("Unlock Trading Ack Message", "fairx.futures.orders.sbe.v1.3.unlocktradingackmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.unlock_trading_message = ProtoField.new("Unlock Trading Message", "fairx.futures.orders.sbe.v1.3.unlocktradingmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.unlock_trading_reject_message = ProtoField.new("Unlock Trading Reject Message", "fairx.futures.orders.sbe.v1.3.unlocktradingrejectmessage", ftypes.STRING)
fairx_futures_orders_sbe_v1_3.fields.version = ProtoField.new("Version", "fairx.futures.orders.sbe.v1.3.version", ftypes.UINT16)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Fairx Futures Orders Sbe 1.3 Element Dissection Options
show.cancel_order_message = true
show.cancel_order_reject_message = true
show.event_resend_complete_message = true
show.event_resend_reject_message = true
show.event_resend_request_message = true
show.instrument_info_message = true
show.instrument_info_request_message = true
show.last_exec_id_message = true
show.last_exec_id_request_message = true
show.mass_cancel_order_ack_message = true
show.mass_cancel_order_message = true
show.mass_cancel_order_reject_message = true
show.message_header = true
show.new_order_message = true
show.order_canceled_message = true
show.order_entered_message = true
show.order_filled_message = true
show.order_reject_message = true
show.order_replaced_message = true
show.packet = true
show.ping_message = true
show.pong_message = true
show.replace_order_message = true
show.sbe_message = true
show.set_account_message = true
show.set_ack_message = true
show.set_trader_message = true
show.spread_order_filled_message = true
show.stream_order_message = true
show.unlock_trading_ack_message = true
show.unlock_trading_message = true
show.unlock_trading_reject_message = true
show.payload = false

-- Register Fairx Futures Orders Sbe 1.3 Show Options
fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_message = Pref.bool("Show Cancel Order Message", show.cancel_order_message, "Parse and add Cancel Order Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_reject_message = Pref.bool("Show Cancel Order Reject Message", show.cancel_order_reject_message, "Parse and add Cancel Order Reject Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_complete_message = Pref.bool("Show Event Resend Complete Message", show.event_resend_complete_message, "Parse and add Event Resend Complete Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_reject_message = Pref.bool("Show Event Resend Reject Message", show.event_resend_reject_message, "Parse and add Event Resend Reject Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_request_message = Pref.bool("Show Event Resend Request Message", show.event_resend_request_message, "Parse and add Event Resend Request Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_message = Pref.bool("Show Instrument Info Message", show.instrument_info_message, "Parse and add Instrument Info Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_request_message = Pref.bool("Show Instrument Info Request Message", show.instrument_info_request_message, "Parse and add Instrument Info Request Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_message = Pref.bool("Show Last Exec Id Message", show.last_exec_id_message, "Parse and add Last Exec Id Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_request_message = Pref.bool("Show Last Exec Id Request Message", show.last_exec_id_request_message, "Parse and add Last Exec Id Request Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_ack_message = Pref.bool("Show Mass Cancel Order Ack Message", show.mass_cancel_order_ack_message, "Parse and add Mass Cancel Order Ack Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_message = Pref.bool("Show Mass Cancel Order Message", show.mass_cancel_order_message, "Parse and add Mass Cancel Order Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_reject_message = Pref.bool("Show Mass Cancel Order Reject Message", show.mass_cancel_order_reject_message, "Parse and add Mass Cancel Order Reject Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_new_order_message = Pref.bool("Show New Order Message", show.new_order_message, "Parse and add New Order Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_order_canceled_message = Pref.bool("Show Order Canceled Message", show.order_canceled_message, "Parse and add Order Canceled Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_order_entered_message = Pref.bool("Show Order Entered Message", show.order_entered_message, "Parse and add Order Entered Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_order_filled_message = Pref.bool("Show Order Filled Message", show.order_filled_message, "Parse and add Order Filled Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_order_reject_message = Pref.bool("Show Order Reject Message", show.order_reject_message, "Parse and add Order Reject Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_order_replaced_message = Pref.bool("Show Order Replaced Message", show.order_replaced_message, "Parse and add Order Replaced Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_ping_message = Pref.bool("Show Ping Message", show.ping_message, "Parse and add Ping Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_pong_message = Pref.bool("Show Pong Message", show.pong_message, "Parse and add Pong Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_replace_order_message = Pref.bool("Show Replace Order Message", show.replace_order_message, "Parse and add Replace Order Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_sbe_message = Pref.bool("Show Sbe Message", show.sbe_message, "Parse and add Sbe Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_set_account_message = Pref.bool("Show Set Account Message", show.set_account_message, "Parse and add Set Account Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_set_ack_message = Pref.bool("Show Set Ack Message", show.set_ack_message, "Parse and add Set Ack Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_set_trader_message = Pref.bool("Show Set Trader Message", show.set_trader_message, "Parse and add Set Trader Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_spread_order_filled_message = Pref.bool("Show Spread Order Filled Message", show.spread_order_filled_message, "Parse and add Spread Order Filled Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_stream_order_message = Pref.bool("Show Stream Order Message", show.stream_order_message, "Parse and add Stream Order Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_ack_message = Pref.bool("Show Unlock Trading Ack Message", show.unlock_trading_ack_message, "Parse and add Unlock Trading Ack Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_message = Pref.bool("Show Unlock Trading Message", show.unlock_trading_message, "Parse and add Unlock Trading Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_reject_message = Pref.bool("Show Unlock Trading Reject Message", show.unlock_trading_reject_message, "Parse and add Unlock Trading Reject Message to protocol tree")
fairx_futures_orders_sbe_v1_3.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function fairx_futures_orders_sbe_v1_3.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.cancel_order_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_message then
    show.cancel_order_message = fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_message
    changed = true
  end
  if show.cancel_order_reject_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_reject_message then
    show.cancel_order_reject_message = fairx_futures_orders_sbe_v1_3.prefs.show_cancel_order_reject_message
    changed = true
  end
  if show.event_resend_complete_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_complete_message then
    show.event_resend_complete_message = fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_complete_message
    changed = true
  end
  if show.event_resend_reject_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_reject_message then
    show.event_resend_reject_message = fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_reject_message
    changed = true
  end
  if show.event_resend_request_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_request_message then
    show.event_resend_request_message = fairx_futures_orders_sbe_v1_3.prefs.show_event_resend_request_message
    changed = true
  end
  if show.instrument_info_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_message then
    show.instrument_info_message = fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_message
    changed = true
  end
  if show.instrument_info_request_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_request_message then
    show.instrument_info_request_message = fairx_futures_orders_sbe_v1_3.prefs.show_instrument_info_request_message
    changed = true
  end
  if show.last_exec_id_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_message then
    show.last_exec_id_message = fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_message
    changed = true
  end
  if show.last_exec_id_request_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_request_message then
    show.last_exec_id_request_message = fairx_futures_orders_sbe_v1_3.prefs.show_last_exec_id_request_message
    changed = true
  end
  if show.mass_cancel_order_ack_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_ack_message then
    show.mass_cancel_order_ack_message = fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_ack_message
    changed = true
  end
  if show.mass_cancel_order_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_message then
    show.mass_cancel_order_message = fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_message
    changed = true
  end
  if show.mass_cancel_order_reject_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_reject_message then
    show.mass_cancel_order_reject_message = fairx_futures_orders_sbe_v1_3.prefs.show_mass_cancel_order_reject_message
    changed = true
  end
  if show.message_header ~= fairx_futures_orders_sbe_v1_3.prefs.show_message_header then
    show.message_header = fairx_futures_orders_sbe_v1_3.prefs.show_message_header
    changed = true
  end
  if show.new_order_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_new_order_message then
    show.new_order_message = fairx_futures_orders_sbe_v1_3.prefs.show_new_order_message
    changed = true
  end
  if show.order_canceled_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_order_canceled_message then
    show.order_canceled_message = fairx_futures_orders_sbe_v1_3.prefs.show_order_canceled_message
    changed = true
  end
  if show.order_entered_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_order_entered_message then
    show.order_entered_message = fairx_futures_orders_sbe_v1_3.prefs.show_order_entered_message
    changed = true
  end
  if show.order_filled_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_order_filled_message then
    show.order_filled_message = fairx_futures_orders_sbe_v1_3.prefs.show_order_filled_message
    changed = true
  end
  if show.order_reject_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_order_reject_message then
    show.order_reject_message = fairx_futures_orders_sbe_v1_3.prefs.show_order_reject_message
    changed = true
  end
  if show.order_replaced_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_order_replaced_message then
    show.order_replaced_message = fairx_futures_orders_sbe_v1_3.prefs.show_order_replaced_message
    changed = true
  end
  if show.packet ~= fairx_futures_orders_sbe_v1_3.prefs.show_packet then
    show.packet = fairx_futures_orders_sbe_v1_3.prefs.show_packet
    changed = true
  end
  if show.ping_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_ping_message then
    show.ping_message = fairx_futures_orders_sbe_v1_3.prefs.show_ping_message
    changed = true
  end
  if show.pong_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_pong_message then
    show.pong_message = fairx_futures_orders_sbe_v1_3.prefs.show_pong_message
    changed = true
  end
  if show.replace_order_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_replace_order_message then
    show.replace_order_message = fairx_futures_orders_sbe_v1_3.prefs.show_replace_order_message
    changed = true
  end
  if show.sbe_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_sbe_message then
    show.sbe_message = fairx_futures_orders_sbe_v1_3.prefs.show_sbe_message
    changed = true
  end
  if show.set_account_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_set_account_message then
    show.set_account_message = fairx_futures_orders_sbe_v1_3.prefs.show_set_account_message
    changed = true
  end
  if show.set_ack_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_set_ack_message then
    show.set_ack_message = fairx_futures_orders_sbe_v1_3.prefs.show_set_ack_message
    changed = true
  end
  if show.set_trader_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_set_trader_message then
    show.set_trader_message = fairx_futures_orders_sbe_v1_3.prefs.show_set_trader_message
    changed = true
  end
  if show.spread_order_filled_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_spread_order_filled_message then
    show.spread_order_filled_message = fairx_futures_orders_sbe_v1_3.prefs.show_spread_order_filled_message
    changed = true
  end
  if show.stream_order_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_stream_order_message then
    show.stream_order_message = fairx_futures_orders_sbe_v1_3.prefs.show_stream_order_message
    changed = true
  end
  if show.unlock_trading_ack_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_ack_message then
    show.unlock_trading_ack_message = fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_ack_message
    changed = true
  end
  if show.unlock_trading_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_message then
    show.unlock_trading_message = fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_message
    changed = true
  end
  if show.unlock_trading_reject_message ~= fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_reject_message then
    show.unlock_trading_reject_message = fairx_futures_orders_sbe_v1_3.prefs.show_unlock_trading_reject_message
    changed = true
  end
  if show.payload ~= fairx_futures_orders_sbe_v1_3.prefs.show_payload then
    show.payload = fairx_futures_orders_sbe_v1_3.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Fairx Futures Orders Sbe 1.3
-----------------------------------------------------------------------

-- Display: Padding
display.padding = function(value)
  return "Padding: "..value
end

-- Dissect runtime sized field: Padding
dissect.padding = function(buffer, offset, packet, parent, size)
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.padding(value, buffer, offset, packet, parent, size)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.padding, range, value, display)

  return offset + size
end

-- Size: Details
size_of.details = 47

-- Display: Details
display.details = function(value)
  return "Details: "..value
end

-- Dissect: Details
dissect.details = function(buffer, offset, packet, parent)
  local length = size_of.details
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.details(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.details, range, value, display)

  return offset + length, value
end

-- Size: Reject Reason
size_of.reject_reason = 1

-- Display: Reject Reason
display.reject_reason = function(value)
  return "Reject Reason: "..value
end

-- Dissect: Reject Reason
dissect.reject_reason = function(buffer, offset, packet, parent)
  local length = size_of.reject_reason
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.reject_reason(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.reject_reason, range, value, display)

  return offset + length, value
end

-- Size: Correlation Id
size_of.correlation_id = 8

-- Display: Correlation Id
display.correlation_id = function(value)
  return "Correlation Id: "..value
end

-- Dissect: Correlation Id
dissect.correlation_id = function(buffer, offset, packet, parent)
  local length = size_of.correlation_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.correlation_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.correlation_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Event Resend Reject Message
size_of.event_resend_reject_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.reject_reason

  index = index + size_of.details

  return index
end

-- Display: Event Resend Reject Message
display.event_resend_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Event Resend Reject Message
dissect.event_resend_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Reject Reason: 1 Byte Unsigned Fixed Width Integer
  index, reject_reason = dissect.reject_reason(buffer, index, packet, parent)

  -- Details: 47 Byte Ascii String
  index, details = dissect.details(buffer, index, packet, parent)

  return index
end

-- Dissect: Event Resend Reject Message
dissect.event_resend_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.event_resend_reject_message then
    local length = size_of.event_resend_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.event_resend_reject_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.event_resend_reject_message, range, display)
  end

  return dissect.event_resend_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Resent Event Count
size_of.resent_event_count = 4

-- Display: Resent Event Count
display.resent_event_count = function(value)
  return "Resent Event Count: "..value
end

-- Dissect: Resent Event Count
dissect.resent_event_count = function(buffer, offset, packet, parent)
  local length = size_of.resent_event_count
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.resent_event_count(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.resent_event_count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Event Resend Complete Message
size_of.event_resend_complete_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.resent_event_count

  return index
end

-- Display: Event Resend Complete Message
display.event_resend_complete_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Event Resend Complete Message
dissect.event_resend_complete_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Resent Event Count: 4 Byte Signed Fixed Width Integer
  index, resent_event_count = dissect.resent_event_count(buffer, index, packet, parent)

  return index
end

-- Dissect: Event Resend Complete Message
dissect.event_resend_complete_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.event_resend_complete_message then
    local length = size_of.event_resend_complete_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.event_resend_complete_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.event_resend_complete_message, range, display)
  end

  return dissect.event_resend_complete_message_fields(buffer, offset, packet, parent)
end

-- Size: End Exec Id
size_of.end_exec_id = 8

-- Display: End Exec Id
display.end_exec_id = function(value)
  return "End Exec Id: "..value
end

-- Dissect: End Exec Id
dissect.end_exec_id = function(buffer, offset, packet, parent)
  local length = size_of.end_exec_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.end_exec_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.end_exec_id, range, value, display)

  return offset + length, value
end

-- Size: Begin Exec Id
size_of.begin_exec_id = 8

-- Display: Begin Exec Id
display.begin_exec_id = function(value)
  return "Begin Exec Id: "..value
end

-- Dissect: Begin Exec Id
dissect.begin_exec_id = function(buffer, offset, packet, parent)
  local length = size_of.begin_exec_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.begin_exec_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.begin_exec_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Event Resend Request Message
size_of.event_resend_request_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.begin_exec_id

  index = index + size_of.end_exec_id

  return index
end

-- Display: Event Resend Request Message
display.event_resend_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Event Resend Request Message
dissect.event_resend_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Begin Exec Id: 8 Byte Signed Fixed Width Integer
  index, begin_exec_id = dissect.begin_exec_id(buffer, index, packet, parent)

  -- End Exec Id: 8 Byte Signed Fixed Width Integer
  index, end_exec_id = dissect.end_exec_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Event Resend Request Message
dissect.event_resend_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.event_resend_request_message then
    local length = size_of.event_resend_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.event_resend_request_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.event_resend_request_message, range, display)
  end

  return dissect.event_resend_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Last Exec Id
size_of.last_exec_id = 8

-- Display: Last Exec Id
display.last_exec_id = function(value)
  return "Last Exec Id: "..value
end

-- Dissect: Last Exec Id
dissect.last_exec_id = function(buffer, offset, packet, parent)
  local length = size_of.last_exec_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.last_exec_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.last_exec_id, range, value, display)

  return offset + length, value
end

-- Size: Timestamp
size_of.timestamp = 8

-- Display: Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
dissect.timestamp = function(buffer, offset, packet, parent)
  local length = size_of.timestamp
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.timestamp, range, value, display)

  return offset + length, value
end

-- Calculate size of: Last Exec Id Message
size_of.last_exec_id_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.last_exec_id

  index = index + size_of.correlation_id

  return index
end

-- Display: Last Exec Id Message
display.last_exec_id_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Last Exec Id Message
dissect.last_exec_id_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Last Exec Id: 8 Byte Signed Fixed Width Integer
  index, last_exec_id = dissect.last_exec_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Last Exec Id Message
dissect.last_exec_id_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.last_exec_id_message then
    local length = size_of.last_exec_id_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.last_exec_id_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.last_exec_id_message, range, display)
  end

  return dissect.last_exec_id_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Last Exec Id Request Message
size_of.last_exec_id_request_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  return index
end

-- Display: Last Exec Id Request Message
display.last_exec_id_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Last Exec Id Request Message
dissect.last_exec_id_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Last Exec Id Request Message
dissect.last_exec_id_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.last_exec_id_request_message then
    local length = size_of.last_exec_id_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.last_exec_id_request_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.last_exec_id_request_message, range, display)
  end

  return dissect.last_exec_id_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Is Aggressor
size_of.is_aggressor = 1

-- Display: Is Aggressor
display.is_aggressor = function(value)
  return "Is Aggressor: "..value
end

-- Dissect: Is Aggressor
dissect.is_aggressor = function(buffer, offset, packet, parent)
  local length = size_of.is_aggressor
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.is_aggressor(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.is_aggressor, range, value, display)

  return offset + length, value
end

-- Size: Instrument Id
size_of.instrument_id = 4

-- Display: Instrument Id
display.instrument_id = function(value)
  return "Instrument Id: "..value
end

-- Dissect: Instrument Id
dissect.instrument_id = function(buffer, offset, packet, parent)
  local length = size_of.instrument_id
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.instrument_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.instrument_id, range, value, display)

  return offset + length, value
end

-- Size: Fill Qty
size_of.fill_qty = 4

-- Display: Fill Qty
display.fill_qty = function(value)
  return "Fill Qty: "..value
end

-- Dissect: Fill Qty
dissect.fill_qty = function(buffer, offset, packet, parent)
  local length = size_of.fill_qty
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.fill_qty(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.fill_qty, range, value, display)

  return offset + length, value
end

-- Size: Leg 2 Fill Price
size_of.leg_2_fill_price = 8

-- Display: Leg 2 Fill Price
display.leg_2_fill_price = function(value)
  return "Leg 2 Fill Price: "..value
end

-- Dissect: Leg 2 Fill Price
dissect.leg_2_fill_price = function(buffer, offset, packet, parent)
  local length = size_of.leg_2_fill_price
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.leg_2_fill_price(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.leg_2_fill_price, range, value, display)

  return offset + length, value
end

-- Size: Leg 1 Fill Price
size_of.leg_1_fill_price = 8

-- Display: Leg 1 Fill Price
display.leg_1_fill_price = function(value)
  return "Leg 1 Fill Price: "..value
end

-- Dissect: Leg 1 Fill Price
dissect.leg_1_fill_price = function(buffer, offset, packet, parent)
  local length = size_of.leg_1_fill_price
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.leg_1_fill_price(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.leg_1_fill_price, range, value, display)

  return offset + length, value
end

-- Size: Fill Price
size_of.fill_price = 8

-- Display: Fill Price
display.fill_price = function(value)
  return "Fill Price: "..value
end

-- Dissect: Fill Price
dissect.fill_price = function(buffer, offset, packet, parent)
  local length = size_of.fill_price
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.fill_price(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.fill_price, range, value, display)

  return offset + length, value
end

-- Size: Available Qty
size_of.available_qty = 4

-- Display: Available Qty
display.available_qty = function(value)
  return "Available Qty: "..value
end

-- Dissect: Available Qty
dissect.available_qty = function(buffer, offset, packet, parent)
  local length = size_of.available_qty
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.available_qty(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.available_qty, range, value, display)

  return offset + length, value
end

-- Size: Total Filled
size_of.total_filled = 4

-- Display: Total Filled
display.total_filled = function(value)
  return "Total Filled: "..value
end

-- Dissect: Total Filled
dissect.total_filled = function(buffer, offset, packet, parent)
  local length = size_of.total_filled
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.total_filled(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.total_filled, range, value, display)

  return offset + length, value
end

-- Size: Filled Vwap
size_of.filled_vwap = 8

-- Display: Filled Vwap
display.filled_vwap = function(value)
  return "Filled Vwap: "..value
end

-- Dissect: Filled Vwap
dissect.filled_vwap = function(buffer, offset, packet, parent)
  local length = size_of.filled_vwap
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.filled_vwap(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.filled_vwap, range, value, display)

  return offset + length, value
end

-- Size: Order Id
size_of.order_id = 8

-- Display: Order Id
display.order_id = function(value)
  return "Order Id: "..value
end

-- Dissect: Order Id
dissect.order_id = function(buffer, offset, packet, parent)
  local length = size_of.order_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.order_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.order_id, range, value, display)

  return offset + length, value
end

-- Size: Client Order Id
size_of.client_order_id = 8

-- Display: Client Order Id
display.client_order_id = function(value)
  return "Client Order Id: "..value
end

-- Dissect: Client Order Id
dissect.client_order_id = function(buffer, offset, packet, parent)
  local length = size_of.client_order_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.client_order_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.client_order_id, range, value, display)

  return offset + length, value
end

-- Size: Match Id
size_of.match_id = 8

-- Display: Match Id
display.match_id = function(value)
  return "Match Id: "..value
end

-- Dissect: Match Id
dissect.match_id = function(buffer, offset, packet, parent)
  local length = size_of.match_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.match_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.match_id, range, value, display)

  return offset + length, value
end

-- Size: Exec Id
size_of.exec_id = 8

-- Display: Exec Id
display.exec_id = function(value)
  return "Exec Id: "..value
end

-- Dissect: Exec Id
dissect.exec_id = function(buffer, offset, packet, parent)
  local length = size_of.exec_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.exec_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.exec_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Spread Order Filled Message
size_of.spread_order_filled_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.match_id

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.filled_vwap

  index = index + size_of.total_filled

  index = index + size_of.available_qty

  index = index + size_of.fill_price

  index = index + size_of.leg_1_fill_price

  index = index + size_of.leg_2_fill_price

  index = index + size_of.fill_qty

  index = index + size_of.instrument_id

  index = index + size_of.is_aggressor

  return index
end

-- Display: Spread Order Filled Message
display.spread_order_filled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Spread Order Filled Message
dissect.spread_order_filled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Match Id: 8 Byte Signed Fixed Width Integer
  index, match_id = dissect.match_id(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Filled Vwap: 8 Byte Signed Fixed Width Integer
  index, filled_vwap = dissect.filled_vwap(buffer, index, packet, parent)

  -- Total Filled: 4 Byte Signed Fixed Width Integer
  index, total_filled = dissect.total_filled(buffer, index, packet, parent)

  -- Available Qty: 4 Byte Signed Fixed Width Integer
  index, available_qty = dissect.available_qty(buffer, index, packet, parent)

  -- Fill Price: 8 Byte Signed Fixed Width Integer
  index, fill_price = dissect.fill_price(buffer, index, packet, parent)

  -- Leg 1 Fill Price: 8 Byte Signed Fixed Width Integer
  index, leg_1_fill_price = dissect.leg_1_fill_price(buffer, index, packet, parent)

  -- Leg 2 Fill Price: 8 Byte Signed Fixed Width Integer
  index, leg_2_fill_price = dissect.leg_2_fill_price(buffer, index, packet, parent)

  -- Fill Qty: 4 Byte Signed Fixed Width Integer
  index, fill_qty = dissect.fill_qty(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Is Aggressor: 1 Byte Signed Fixed Width Integer
  index, is_aggressor = dissect.is_aggressor(buffer, index, packet, parent)

  return index
end

-- Dissect: Spread Order Filled Message
dissect.spread_order_filled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.spread_order_filled_message then
    local length = size_of.spread_order_filled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.spread_order_filled_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.spread_order_filled_message, range, display)
  end

  return dissect.spread_order_filled_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Filled Message
size_of.order_filled_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.match_id

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.filled_vwap

  index = index + size_of.total_filled

  index = index + size_of.available_qty

  index = index + size_of.fill_price

  index = index + size_of.fill_qty

  index = index + size_of.instrument_id

  index = index + size_of.is_aggressor

  return index
end

-- Display: Order Filled Message
display.order_filled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Filled Message
dissect.order_filled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Match Id: 8 Byte Signed Fixed Width Integer
  index, match_id = dissect.match_id(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Filled Vwap: 8 Byte Signed Fixed Width Integer
  index, filled_vwap = dissect.filled_vwap(buffer, index, packet, parent)

  -- Total Filled: 4 Byte Signed Fixed Width Integer
  index, total_filled = dissect.total_filled(buffer, index, packet, parent)

  -- Available Qty: 4 Byte Signed Fixed Width Integer
  index, available_qty = dissect.available_qty(buffer, index, packet, parent)

  -- Fill Price: 8 Byte Signed Fixed Width Integer
  index, fill_price = dissect.fill_price(buffer, index, packet, parent)

  -- Fill Qty: 4 Byte Signed Fixed Width Integer
  index, fill_qty = dissect.fill_qty(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Is Aggressor: 1 Byte Signed Fixed Width Integer
  index, is_aggressor = dissect.is_aggressor(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Filled Message
dissect.order_filled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_filled_message then
    local length = size_of.order_filled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.order_filled_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.order_filled_message, range, display)
  end

  return dissect.order_filled_message_fields(buffer, offset, packet, parent)
end

-- Size: Error Message
size_of.error_message = 32

-- Display: Error Message
display.error_message = function(value)
  return "Error Message: "..value
end

-- Dissect: Error Message
dissect.error_message = function(buffer, offset, packet, parent)
  local length = size_of.error_message
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.error_message(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.error_message, range, value, display)

  return offset + length, value
end

-- Calculate size of: Unlock Trading Reject Message
size_of.unlock_trading_reject_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.correlation_id

  index = index + size_of.error_message

  return index
end

-- Display: Unlock Trading Reject Message
display.unlock_trading_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unlock Trading Reject Message
dissect.unlock_trading_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Error Message: 32 Byte Ascii String
  index, error_message = dissect.error_message(buffer, index, packet, parent)

  return index
end

-- Dissect: Unlock Trading Reject Message
dissect.unlock_trading_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.unlock_trading_reject_message then
    local length = size_of.unlock_trading_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.unlock_trading_reject_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.unlock_trading_reject_message, range, display)
  end

  return dissect.unlock_trading_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Num Users Affected
size_of.num_users_affected = 4

-- Display: Num Users Affected
display.num_users_affected = function(value)
  return "Num Users Affected: "..value
end

-- Dissect: Num Users Affected
dissect.num_users_affected = function(buffer, offset, packet, parent)
  local length = size_of.num_users_affected
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.num_users_affected(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.num_users_affected, range, value, display)

  return offset + length, value
end

-- Calculate size of: Unlock Trading Ack Message
size_of.unlock_trading_ack_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.correlation_id

  index = index + size_of.num_users_affected

  return index
end

-- Display: Unlock Trading Ack Message
display.unlock_trading_ack_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unlock Trading Ack Message
dissect.unlock_trading_ack_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Num Users Affected: 4 Byte Signed Fixed Width Integer
  index, num_users_affected = dissect.num_users_affected(buffer, index, packet, parent)

  return index
end

-- Dissect: Unlock Trading Ack Message
dissect.unlock_trading_ack_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.unlock_trading_ack_message then
    local length = size_of.unlock_trading_ack_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.unlock_trading_ack_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.unlock_trading_ack_message, range, display)
  end

  return dissect.unlock_trading_ack_message_fields(buffer, offset, packet, parent)
end

-- Size: Current Session Only
size_of.current_session_only = 1

-- Display: Current Session Only
display.current_session_only = function(value)
  return "Current Session Only: "..value
end

-- Dissect: Current Session Only
dissect.current_session_only = function(buffer, offset, packet, parent)
  local length = size_of.current_session_only
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.current_session_only(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.current_session_only, range, value, display)

  return offset + length, value
end

-- Calculate size of: Unlock Trading Message
size_of.unlock_trading_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.current_session_only

  return index
end

-- Display: Unlock Trading Message
display.unlock_trading_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unlock Trading Message
dissect.unlock_trading_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Current Session Only: 1 Byte Signed Fixed Width Integer
  index, current_session_only = dissect.current_session_only(buffer, index, packet, parent)

  return index
end

-- Dissect: Unlock Trading Message
dissect.unlock_trading_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.unlock_trading_message then
    local length = size_of.unlock_trading_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.unlock_trading_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.unlock_trading_message, range, display)
  end

  return dissect.unlock_trading_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Mass Cancel Order Reject Message
size_of.mass_cancel_order_reject_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.correlation_id

  index = index + size_of.error_message

  return index
end

-- Display: Mass Cancel Order Reject Message
display.mass_cancel_order_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Order Reject Message
dissect.mass_cancel_order_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Error Message: 32 Byte Ascii String
  index, error_message = dissect.error_message(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Order Reject Message
dissect.mass_cancel_order_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_order_reject_message then
    local length = size_of.mass_cancel_order_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.mass_cancel_order_reject_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_reject_message, range, display)
  end

  return dissect.mass_cancel_order_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Trading Lock Applied
size_of.trading_lock_applied = 1

-- Display: Trading Lock Applied
display.trading_lock_applied = function(value)
  return "Trading Lock Applied: "..value
end

-- Dissect: Trading Lock Applied
dissect.trading_lock_applied = function(buffer, offset, packet, parent)
  local length = size_of.trading_lock_applied
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.trading_lock_applied(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.trading_lock_applied, range, value, display)

  return offset + length, value
end

-- Size: Only Current Session
size_of.only_current_session = 1

-- Display: Only Current Session
display.only_current_session = function(value)
  return "Only Current Session: "..value
end

-- Dissect: Only Current Session
dissect.only_current_session = function(buffer, offset, packet, parent)
  local length = size_of.only_current_session
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.only_current_session(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.only_current_session, range, value, display)

  return offset + length, value
end

-- Size: Canceled Count
size_of.canceled_count = 4

-- Display: Canceled Count
display.canceled_count = function(value)
  return "Canceled Count: "..value
end

-- Dissect: Canceled Count
dissect.canceled_count = function(buffer, offset, packet, parent)
  local length = size_of.canceled_count
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.canceled_count(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.canceled_count, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Order Ack Message
size_of.mass_cancel_order_ack_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.correlation_id

  index = index + size_of.canceled_count

  index = index + size_of.only_current_session

  index = index + size_of.trading_lock_applied

  return index
end

-- Display: Mass Cancel Order Ack Message
display.mass_cancel_order_ack_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Order Ack Message
dissect.mass_cancel_order_ack_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Canceled Count: 4 Byte Signed Fixed Width Integer
  index, canceled_count = dissect.canceled_count(buffer, index, packet, parent)

  -- Only Current Session: 1 Byte Signed Fixed Width Integer
  index, only_current_session = dissect.only_current_session(buffer, index, packet, parent)

  -- Trading Lock Applied: 1 Byte Signed Fixed Width Integer
  index, trading_lock_applied = dissect.trading_lock_applied(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Order Ack Message
dissect.mass_cancel_order_ack_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_order_ack_message then
    local length = size_of.mass_cancel_order_ack_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.mass_cancel_order_ack_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_ack_message, range, display)
  end

  return dissect.mass_cancel_order_ack_message_fields(buffer, offset, packet, parent)
end

-- Size: Request Trading Lock
size_of.request_trading_lock = 1

-- Display: Request Trading Lock
display.request_trading_lock = function(value)
  return "Request Trading Lock: "..value
end

-- Dissect: Request Trading Lock
dissect.request_trading_lock = function(buffer, offset, packet, parent)
  local length = size_of.request_trading_lock
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.request_trading_lock(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.request_trading_lock, range, value, display)

  return offset + length, value
end

-- Size: Side
size_of.side = 1

-- Display: Side
display.side = function(value)
  if value == 1 then
    return "Side: Buy (1)"
  end
  if value == -1 then
    return "Side: Sell (-1)"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect: Side
dissect.side = function(buffer, offset, packet, parent)
  local length = size_of.side
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.side(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.side, range, value, display)

  return offset + length, value
end

-- Size: Limit Price
size_of.limit_price = 8

-- Display: Limit Price
display.limit_price = function(value)
  return "Limit Price: "..value
end

-- Dissect: Limit Price
dissect.limit_price = function(buffer, offset, packet, parent)
  local length = size_of.limit_price
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.limit_price(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.limit_price, range, value, display)

  return offset + length, value
end

-- Calculate size of: Mass Cancel Order Message
size_of.mass_cancel_order_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.limit_price

  index = index + size_of.instrument_id

  index = index + size_of.side

  index = index + size_of.current_session_only

  index = index + size_of.request_trading_lock

  return index
end

-- Display: Mass Cancel Order Message
display.mass_cancel_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Mass Cancel Order Message
dissect.mass_cancel_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Limit Price: 8 Byte Signed Fixed Width Integer
  index, limit_price = dissect.limit_price(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Side: 1 Byte Signed Fixed Width Integer Enum with 2 values
  index, side = dissect.side(buffer, index, packet, parent)

  -- Current Session Only: 1 Byte Signed Fixed Width Integer
  index, current_session_only = dissect.current_session_only(buffer, index, packet, parent)

  -- Request Trading Lock: 1 Byte Signed Fixed Width Integer
  index, request_trading_lock = dissect.request_trading_lock(buffer, index, packet, parent)

  return index
end

-- Dissect: Mass Cancel Order Message
dissect.mass_cancel_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.mass_cancel_order_message then
    local length = size_of.mass_cancel_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.mass_cancel_order_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.mass_cancel_order_message, range, display)
  end

  return dissect.mass_cancel_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Cancel Order Reject Message
size_of.cancel_order_reject_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.reject_reason

  index = index + size_of.details

  return index
end

-- Display: Cancel Order Reject Message
display.cancel_order_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cancel Order Reject Message
dissect.cancel_order_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Reject Reason: 1 Byte Unsigned Fixed Width Integer
  index, reject_reason = dissect.reject_reason(buffer, index, packet, parent)

  -- Details: 47 Byte Ascii String
  index, details = dissect.details(buffer, index, packet, parent)

  return index
end

-- Dissect: Cancel Order Reject Message
dissect.cancel_order_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cancel_order_reject_message then
    local length = size_of.cancel_order_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.cancel_order_reject_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.cancel_order_reject_message, range, display)
  end

  return dissect.cancel_order_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Cancel Reason
size_of.cancel_reason = 1

-- Display: Cancel Reason
display.cancel_reason = function(value)
  if value == 0 then
    return "Cancel Reason: Expired (0)"
  end
  if value == 1 then
    return "Cancel Reason: Canceledbyuser (1)"
  end
  if value == 2 then
    return "Cancel Reason: Selfmatchprevention (2)"
  end
  if value == 3 then
    return "Cancel Reason: Clientdisconnect (3)"
  end
  if value == 4 then
    return "Cancel Reason: Pricelimit (4)"
  end
  if value == 5 then
    return "Cancel Reason: Admincancel (5)"
  end
  if value == 6 then
    return "Cancel Reason: Masscancel (6)"
  end
  if value == 7 then
    return "Cancel Reason: Streamreplaced (7)"
  end
  if value == 8 then
    return "Cancel Reason: Activelimitexceeded (8)"
  end

  return "Cancel Reason: Unknown("..value..")"
end

-- Dissect: Cancel Reason
dissect.cancel_reason = function(buffer, offset, packet, parent)
  local length = size_of.cancel_reason
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.cancel_reason(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.cancel_reason, range, value, display)

  return offset + length, value
end

-- Size: Receive Time
size_of.receive_time = 8

-- Display: Receive Time
display.receive_time = function(value)
  return "Receive Time: "..value
end

-- Dissect: Receive Time
dissect.receive_time = function(buffer, offset, packet, parent)
  local length = size_of.receive_time
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.receive_time(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.receive_time, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Canceled Message
size_of.order_canceled_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.receive_time

  index = index + size_of.total_filled

  index = index + size_of.instrument_id

  index = index + size_of.cancel_reason

  return index
end

-- Display: Order Canceled Message
display.order_canceled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Canceled Message
dissect.order_canceled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Receive Time: 8 Byte Signed Fixed Width Integer
  index, receive_time = dissect.receive_time(buffer, index, packet, parent)

  -- Total Filled: 4 Byte Signed Fixed Width Integer
  index, total_filled = dissect.total_filled(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Cancel Reason: 1 Byte Unsigned Fixed Width Integer Enum with 9 values
  index, cancel_reason = dissect.cancel_reason(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Canceled Message
dissect.order_canceled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_canceled_message then
    local length = size_of.order_canceled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.order_canceled_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.order_canceled_message, range, display)
  end

  return dissect.order_canceled_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Cancel Order Message
size_of.cancel_order_message = function(buffer, offset)
  local index = 0

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.instrument_id

  return index
end

-- Display: Cancel Order Message
display.cancel_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cancel Order Message
dissect.cancel_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Cancel Order Message
dissect.cancel_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cancel_order_message then
    local length = size_of.cancel_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.cancel_order_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.cancel_order_message, range, display)
  end

  return dissect.cancel_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Replaced Message
size_of.order_replaced_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.receive_time

  index = index + size_of.total_filled

  index = index + size_of.available_qty

  index = index + size_of.instrument_id

  return index
end

-- Display: Order Replaced Message
display.order_replaced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Replaced Message
dissect.order_replaced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Receive Time: 8 Byte Signed Fixed Width Integer
  index, receive_time = dissect.receive_time(buffer, index, packet, parent)

  -- Total Filled: 4 Byte Signed Fixed Width Integer
  index, total_filled = dissect.total_filled(buffer, index, packet, parent)

  -- Available Qty: 4 Byte Signed Fixed Width Integer
  index, available_qty = dissect.available_qty(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Replaced Message
dissect.order_replaced_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_replaced_message then
    local length = size_of.order_replaced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.order_replaced_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.order_replaced_message, range, display)
  end

  return dissect.order_replaced_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Reject Message
size_of.order_reject_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.reject_reason

  index = index + size_of.details

  return index
end

-- Display: Order Reject Message
display.order_reject_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Reject Message
dissect.order_reject_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Reject Reason: 1 Byte Unsigned Fixed Width Integer
  index, reject_reason = dissect.reject_reason(buffer, index, packet, parent)

  -- Details: 47 Byte Ascii String
  index, details = dissect.details(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Reject Message
dissect.order_reject_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_reject_message then
    local length = size_of.order_reject_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.order_reject_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.order_reject_message, range, display)
  end

  return dissect.order_reject_message_fields(buffer, offset, packet, parent)
end

-- Size: Quantity
size_of.quantity = 4

-- Display: Quantity
display.quantity = function(value)
  return "Quantity: "..value
end

-- Dissect: Quantity
dissect.quantity = function(buffer, offset, packet, parent)
  local length = size_of.quantity
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.quantity(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.quantity, range, value, display)

  return offset + length, value
end

-- Size: Last Processed Fill Id
size_of.last_processed_fill_id = 8

-- Display: Last Processed Fill Id
display.last_processed_fill_id = function(value)
  return "Last Processed Fill Id: "..value
end

-- Dissect: Last Processed Fill Id
dissect.last_processed_fill_id = function(buffer, offset, packet, parent)
  local length = size_of.last_processed_fill_id
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.last_processed_fill_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.last_processed_fill_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Stream Order Message
size_of.stream_order_message = function(buffer, offset)
  local index = 0

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.last_processed_fill_id

  index = index + size_of.limit_price

  index = index + size_of.quantity

  index = index + size_of.instrument_id

  index = index + size_of.side

  return index
end

-- Display: Stream Order Message
display.stream_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stream Order Message
dissect.stream_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Last Processed Fill Id: 8 Byte Signed Fixed Width Integer
  index, last_processed_fill_id = dissect.last_processed_fill_id(buffer, index, packet, parent)

  -- Limit Price: 8 Byte Signed Fixed Width Integer
  index, limit_price = dissect.limit_price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index, quantity = dissect.quantity(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Side: 1 Byte Signed Fixed Width Integer Enum with 2 values
  index, side = dissect.side(buffer, index, packet, parent)

  return index
end

-- Dissect: Stream Order Message
dissect.stream_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stream_order_message then
    local length = size_of.stream_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.stream_order_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.stream_order_message, range, display)
  end

  return dissect.stream_order_message_fields(buffer, offset, packet, parent)
end

-- Size: New Quantity
size_of.new_quantity = 4

-- Display: New Quantity
display.new_quantity = function(value)
  return "New Quantity: "..value
end

-- Dissect: New Quantity
dissect.new_quantity = function(buffer, offset, packet, parent)
  local length = size_of.new_quantity
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.new_quantity(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.new_quantity, range, value, display)

  return offset + length, value
end

-- Size: New Limit Price
size_of.new_limit_price = 8

-- Display: New Limit Price
display.new_limit_price = function(value)
  return "New Limit Price: "..value
end

-- Dissect: New Limit Price
dissect.new_limit_price = function(buffer, offset, packet, parent)
  local length = size_of.new_limit_price
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.new_limit_price(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.new_limit_price, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replace Order Message
size_of.replace_order_message = function(buffer, offset)
  local index = 0

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.new_limit_price

  index = index + size_of.new_quantity

  index = index + size_of.instrument_id

  return index
end

-- Display: Replace Order Message
display.replace_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replace Order Message
dissect.replace_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- New Limit Price: 8 Byte Signed Fixed Width Integer
  index, new_limit_price = dissect.new_limit_price(buffer, index, packet, parent)

  -- New Quantity: 4 Byte Signed Fixed Width Integer
  index, new_quantity = dissect.new_quantity(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Replace Order Message
dissect.replace_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replace_order_message then
    local length = size_of.replace_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.replace_order_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.replace_order_message, range, display)
  end

  return dissect.replace_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Entered Message
size_of.order_entered_message = function(buffer, offset)
  local index = 0

  index = index + size_of.timestamp

  index = index + size_of.exec_id

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.order_id

  index = index + size_of.receive_time

  return index
end

-- Display: Order Entered Message
display.order_entered_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Entered Message
dissect.order_entered_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Exec Id: 8 Byte Signed Fixed Width Integer
  index, exec_id = dissect.exec_id(buffer, index, packet, parent)

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Order Id: 8 Byte Signed Fixed Width Integer
  index, order_id = dissect.order_id(buffer, index, packet, parent)

  -- Receive Time: 8 Byte Signed Fixed Width Integer
  index, receive_time = dissect.receive_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Entered Message
dissect.order_entered_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_entered_message then
    local length = size_of.order_entered_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.order_entered_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.order_entered_message, range, display)
  end

  return dissect.order_entered_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: New Order Message
size_of.new_order_message = function(buffer, offset)
  local index = 0

  index = index + size_of.client_order_id

  index = index + size_of.correlation_id

  index = index + size_of.limit_price

  index = index + size_of.quantity

  index = index + size_of.instrument_id

  index = index + size_of.side

  return index
end

-- Display: New Order Message
display.new_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Order Message
dissect.new_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Client Order Id: 8 Byte Signed Fixed Width Integer
  index, client_order_id = dissect.client_order_id(buffer, index, packet, parent)

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Limit Price: 8 Byte Signed Fixed Width Integer
  index, limit_price = dissect.limit_price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index, quantity = dissect.quantity(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Side: 1 Byte Signed Fixed Width Integer Enum with 2 values
  index, side = dissect.side(buffer, index, packet, parent)

  return index
end

-- Dissect: New Order Message
dissect.new_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.new_order_message then
    local length = size_of.new_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.new_order_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.new_order_message, range, display)
  end

  return dissect.new_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Set Ack Message
size_of.set_ack_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  return index
end

-- Display: Set Ack Message
display.set_ack_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Set Ack Message
dissect.set_ack_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Set Ack Message
dissect.set_ack_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.set_ack_message then
    local length = size_of.set_ack_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.set_ack_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.set_ack_message, range, display)
  end

  return dissect.set_ack_message_fields(buffer, offset, packet, parent)
end

-- Size: Trader
size_of.trader = 16

-- Display: Trader
display.trader = function(value)
  return "Trader: "..value
end

-- Dissect: Trader
dissect.trader = function(buffer, offset, packet, parent)
  local length = size_of.trader
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.trader(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.trader, range, value, display)

  return offset + length, value
end

-- Calculate size of: Set Trader Message
size_of.set_trader_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.trader

  return index
end

-- Display: Set Trader Message
display.set_trader_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Set Trader Message
dissect.set_trader_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Trader: 16 Byte Ascii String
  index, trader = dissect.trader(buffer, index, packet, parent)

  return index
end

-- Dissect: Set Trader Message
dissect.set_trader_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.set_trader_message then
    local length = size_of.set_trader_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.set_trader_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.set_trader_message, range, display)
  end

  return dissect.set_trader_message_fields(buffer, offset, packet, parent)
end

-- Size: Account
size_of.account = 12

-- Display: Account
display.account = function(value)
  return "Account: "..value
end

-- Dissect: Account
dissect.account = function(buffer, offset, packet, parent)
  local length = size_of.account
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.account(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.account, range, value, display)

  return offset + length, value
end

-- Calculate size of: Set Account Message
size_of.set_account_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.account

  return index
end

-- Display: Set Account Message
display.set_account_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Set Account Message
dissect.set_account_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Account: 12 Byte Ascii String
  index, account = dissect.account(buffer, index, packet, parent)

  return index
end

-- Dissect: Set Account Message
dissect.set_account_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.set_account_message then
    local length = size_of.set_account_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.set_account_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.set_account_message, range, display)
  end

  return dissect.set_account_message_fields(buffer, offset, packet, parent)
end

-- Size: Symbol
size_of.symbol = 32

-- Display: Symbol
display.symbol = function(value)
  return "Symbol: "..value
end

-- Dissect: Symbol
dissect.symbol = function(buffer, offset, packet, parent)
  local length = size_of.symbol
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.symbol(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.symbol, range, value, display)

  return offset + length, value
end

-- Size: Reserved
size_of.reserved = 4

-- Display: Reserved
display.reserved = function(value)
  return "Reserved: "..value
end

-- Dissect: Reserved
dissect.reserved = function(buffer, offset, packet, parent)
  local length = size_of.reserved
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.reserved(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.reserved, range, value, display)

  return offset + length, value
end

-- Size: Is Last Message
size_of.is_last_message = 1

-- Display: Is Last Message
display.is_last_message = function(value)
  return "Is Last Message: "..value
end

-- Dissect: Is Last Message
dissect.is_last_message = function(buffer, offset, packet, parent)
  local length = size_of.is_last_message
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.is_last_message(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.is_last_message, range, value, display)

  return offset + length, value
end

-- Size: Status
size_of.status = 1

-- Display: Status
display.status = function(value)
  return "Status: "..value
end

-- Dissect: Status
dissect.status = function(buffer, offset, packet, parent)
  local length = size_of.status
  local range = buffer(offset, length)
  local value = range:le_int()
  local display = display.status(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.status, range, value, display)

  return offset + length, value
end

-- Size: Security Type
size_of.security_type = 1

-- Display: Security Type
display.security_type = function(value)
  if value == 0 then
    return "Security Type: Futures (0)"
  end
  if value == 1 then
    return "Security Type: Options (1)"
  end

  return "Security Type: Unknown("..value..")"
end

-- Dissect: Security Type
dissect.security_type = function(buffer, offset, packet, parent)
  local length = size_of.security_type
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.security_type(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.security_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Instrument Info Message
size_of.instrument_info_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.instrument_id

  index = index + size_of.security_type

  index = index + size_of.status

  index = index + size_of.is_last_message

  index = index + size_of.reserved

  index = index + size_of.symbol

  return index
end

-- Display: Instrument Info Message
display.instrument_info_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Instrument Info Message
dissect.instrument_info_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Instrument Id: 4 Byte Signed Fixed Width Integer
  index, instrument_id = dissect.instrument_id(buffer, index, packet, parent)

  -- Security Type: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, security_type = dissect.security_type(buffer, index, packet, parent)

  -- Status: 1 Byte Signed Fixed Width Integer
  index, status = dissect.status(buffer, index, packet, parent)

  -- Is Last Message: 1 Byte Signed Fixed Width Integer
  index, is_last_message = dissect.is_last_message(buffer, index, packet, parent)

  -- Reserved: 4 Byte Unsigned Fixed Width Integer
  index, reserved = dissect.reserved(buffer, index, packet, parent)

  -- Symbol: 32 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  return index
end

-- Dissect: Instrument Info Message
dissect.instrument_info_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.instrument_info_message then
    local length = size_of.instrument_info_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.instrument_info_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.instrument_info_message, range, display)
  end

  return dissect.instrument_info_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Instrument Info Request Message
size_of.instrument_info_request_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  return index
end

-- Display: Instrument Info Request Message
display.instrument_info_request_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Instrument Info Request Message
dissect.instrument_info_request_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Instrument Info Request Message
dissect.instrument_info_request_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.instrument_info_request_message then
    local length = size_of.instrument_info_request_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.instrument_info_request_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.instrument_info_request_message, range, display)
  end

  return dissect.instrument_info_request_message_fields(buffer, offset, packet, parent)
end

-- Size: Server Time
size_of.server_time = 8

-- Display: Server Time
display.server_time = function(value)
  return "Server Time: "..value
end

-- Dissect: Server Time
dissect.server_time = function(buffer, offset, packet, parent)
  local length = size_of.server_time
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.server_time(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.server_time, range, value, display)

  return offset + length, value
end

-- Size: Request Time
size_of.request_time = 8

-- Display: Request Time
display.request_time = function(value)
  return "Request Time: "..value
end

-- Dissect: Request Time
dissect.request_time = function(buffer, offset, packet, parent)
  local length = size_of.request_time
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.request_time(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.request_time, range, value, display)

  return offset + length, value
end

-- Calculate size of: Pong Message
size_of.pong_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.request_time

  index = index + size_of.server_time

  index = index + size_of.status

  return index
end

-- Display: Pong Message
display.pong_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Pong Message
dissect.pong_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Request Time: 8 Byte Signed Fixed Width Integer
  index, request_time = dissect.request_time(buffer, index, packet, parent)

  -- Server Time: 8 Byte Signed Fixed Width Integer
  index, server_time = dissect.server_time(buffer, index, packet, parent)

  -- Status: 1 Byte Signed Fixed Width Integer
  index, status = dissect.status(buffer, index, packet, parent)

  return index
end

-- Dissect: Pong Message
dissect.pong_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.pong_message then
    local length = size_of.pong_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.pong_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.pong_message, range, display)
  end

  return dissect.pong_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Ping Message
size_of.ping_message = function(buffer, offset)
  local index = 0

  index = index + size_of.correlation_id

  index = index + size_of.request_time

  return index
end

-- Display: Ping Message
display.ping_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Ping Message
dissect.ping_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Correlation Id: 8 Byte Signed Fixed Width Integer
  index, correlation_id = dissect.correlation_id(buffer, index, packet, parent)

  -- Request Time: 8 Byte Signed Fixed Width Integer
  index, request_time = dissect.request_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Ping Message
dissect.ping_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.ping_message then
    local length = size_of.ping_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.ping_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.ping_message, range, display)
  end

  return dissect.ping_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
size_of.payload = function(buffer, offset, template_id)
  -- Size of Ping Message
  if template_id == 102 then
    return size_of.ping_message(buffer, offset)
  end
  -- Size of Pong Message
  if template_id == 202 then
    return size_of.pong_message(buffer, offset)
  end
  -- Size of Instrument Info Request Message
  if template_id == 103 then
    return size_of.instrument_info_request_message(buffer, offset)
  end
  -- Size of Instrument Info Message
  if template_id == 203 then
    return size_of.instrument_info_message(buffer, offset)
  end
  -- Size of Set Account Message
  if template_id == 105 then
    return size_of.set_account_message(buffer, offset)
  end
  -- Size of Set Trader Message
  if template_id == 106 then
    return size_of.set_trader_message(buffer, offset)
  end
  -- Size of Set Ack Message
  if template_id == 205 then
    return size_of.set_ack_message(buffer, offset)
  end
  -- Size of New Order Message
  if template_id == 110 then
    return size_of.new_order_message(buffer, offset)
  end
  -- Size of Order Entered Message
  if template_id == 210 then
    return size_of.order_entered_message(buffer, offset)
  end
  -- Size of Replace Order Message
  if template_id == 120 then
    return size_of.replace_order_message(buffer, offset)
  end
  -- Size of Stream Order Message
  if template_id == 121 then
    return size_of.stream_order_message(buffer, offset)
  end
  -- Size of Order Reject Message
  if template_id == 221 then
    return size_of.order_reject_message(buffer, offset)
  end
  -- Size of Order Replaced Message
  if template_id == 220 then
    return size_of.order_replaced_message(buffer, offset)
  end
  -- Size of Cancel Order Message
  if template_id == 130 then
    return size_of.cancel_order_message(buffer, offset)
  end
  -- Size of Order Canceled Message
  if template_id == 230 then
    return size_of.order_canceled_message(buffer, offset)
  end
  -- Size of Cancel Order Reject Message
  if template_id == 233 then
    return size_of.cancel_order_reject_message(buffer, offset)
  end
  -- Size of Mass Cancel Order Message
  if template_id == 131 then
    return size_of.mass_cancel_order_message(buffer, offset)
  end
  -- Size of Mass Cancel Order Ack Message
  if template_id == 231 then
    return size_of.mass_cancel_order_ack_message(buffer, offset)
  end
  -- Size of Mass Cancel Order Reject Message
  if template_id == 232 then
    return size_of.mass_cancel_order_reject_message(buffer, offset)
  end
  -- Size of Unlock Trading Message
  if template_id == 132 then
    return size_of.unlock_trading_message(buffer, offset)
  end
  -- Size of Unlock Trading Ack Message
  if template_id == 234 then
    return size_of.unlock_trading_ack_message(buffer, offset)
  end
  -- Size of Unlock Trading Reject Message
  if template_id == 235 then
    return size_of.unlock_trading_reject_message(buffer, offset)
  end
  -- Size of Order Filled Message
  if template_id == 240 then
    return size_of.order_filled_message(buffer, offset)
  end
  -- Size of Spread Order Filled Message
  if template_id == 241 then
    return size_of.spread_order_filled_message(buffer, offset)
  end
  -- Size of Last Exec Id Request Message
  if template_id == 150 then
    return size_of.last_exec_id_request_message(buffer, offset)
  end
  -- Size of Last Exec Id Message
  if template_id == 250 then
    return size_of.last_exec_id_message(buffer, offset)
  end
  -- Size of Event Resend Request Message
  if template_id == 152 then
    return size_of.event_resend_request_message(buffer, offset)
  end
  -- Size of Event Resend Complete Message
  if template_id == 252 then
    return size_of.event_resend_complete_message(buffer, offset)
  end
  -- Size of Event Resend Reject Message
  if template_id == 253 then
    return size_of.event_resend_reject_message(buffer, offset)
  end

  return 0
end

-- Display: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
dissect.payload_branches = function(buffer, offset, packet, parent, template_id)
  -- Dissect Ping Message
  if template_id == 102 then
    return dissect.ping_message(buffer, offset, packet, parent)
  end
  -- Dissect Pong Message
  if template_id == 202 then
    return dissect.pong_message(buffer, offset, packet, parent)
  end
  -- Dissect Instrument Info Request Message
  if template_id == 103 then
    return dissect.instrument_info_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Instrument Info Message
  if template_id == 203 then
    return dissect.instrument_info_message(buffer, offset, packet, parent)
  end
  -- Dissect Set Account Message
  if template_id == 105 then
    return dissect.set_account_message(buffer, offset, packet, parent)
  end
  -- Dissect Set Trader Message
  if template_id == 106 then
    return dissect.set_trader_message(buffer, offset, packet, parent)
  end
  -- Dissect Set Ack Message
  if template_id == 205 then
    return dissect.set_ack_message(buffer, offset, packet, parent)
  end
  -- Dissect New Order Message
  if template_id == 110 then
    return dissect.new_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Entered Message
  if template_id == 210 then
    return dissect.order_entered_message(buffer, offset, packet, parent)
  end
  -- Dissect Replace Order Message
  if template_id == 120 then
    return dissect.replace_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Stream Order Message
  if template_id == 121 then
    return dissect.stream_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Reject Message
  if template_id == 221 then
    return dissect.order_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Replaced Message
  if template_id == 220 then
    return dissect.order_replaced_message(buffer, offset, packet, parent)
  end
  -- Dissect Cancel Order Message
  if template_id == 130 then
    return dissect.cancel_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Canceled Message
  if template_id == 230 then
    return dissect.order_canceled_message(buffer, offset, packet, parent)
  end
  -- Dissect Cancel Order Reject Message
  if template_id == 233 then
    return dissect.cancel_order_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Order Message
  if template_id == 131 then
    return dissect.mass_cancel_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Order Ack Message
  if template_id == 231 then
    return dissect.mass_cancel_order_ack_message(buffer, offset, packet, parent)
  end
  -- Dissect Mass Cancel Order Reject Message
  if template_id == 232 then
    return dissect.mass_cancel_order_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Unlock Trading Message
  if template_id == 132 then
    return dissect.unlock_trading_message(buffer, offset, packet, parent)
  end
  -- Dissect Unlock Trading Ack Message
  if template_id == 234 then
    return dissect.unlock_trading_ack_message(buffer, offset, packet, parent)
  end
  -- Dissect Unlock Trading Reject Message
  if template_id == 235 then
    return dissect.unlock_trading_reject_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Filled Message
  if template_id == 240 then
    return dissect.order_filled_message(buffer, offset, packet, parent)
  end
  -- Dissect Spread Order Filled Message
  if template_id == 241 then
    return dissect.spread_order_filled_message(buffer, offset, packet, parent)
  end
  -- Dissect Last Exec Id Request Message
  if template_id == 150 then
    return dissect.last_exec_id_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Last Exec Id Message
  if template_id == 250 then
    return dissect.last_exec_id_message(buffer, offset, packet, parent)
  end
  -- Dissect Event Resend Request Message
  if template_id == 152 then
    return dissect.event_resend_request_message(buffer, offset, packet, parent)
  end
  -- Dissect Event Resend Complete Message
  if template_id == 252 then
    return dissect.event_resend_complete_message(buffer, offset, packet, parent)
  end
  -- Dissect Event Resend Reject Message
  if template_id == 253 then
    return dissect.event_resend_reject_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent, template_id)
  if not show.payload then
    return dissect.payload_branches(buffer, offset, packet, parent, template_id)
  end

  -- Calculate size and check that branch is not empty
  local size = size_of.payload(buffer, offset, template_id)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(fairx_futures_orders_sbe_v1_3.fields.payload, range, display)

  return dissect.payload_branches(buffer, offset, packet, parent, template_id)
end

-- Size: Version
size_of.version = 2

-- Display: Version
display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
dissect.version = function(buffer, offset, packet, parent)
  local length = size_of.version
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.version(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.version, range, value, display)

  return offset + length, value
end

-- Size: Schema Id
size_of.schema_id = 2

-- Display: Schema Id
display.schema_id = function(value)
  return "Schema Id: "..value
end

-- Dissect: Schema Id
dissect.schema_id = function(buffer, offset, packet, parent)
  local length = size_of.schema_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.schema_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.schema_id, range, value, display)

  return offset + length, value
end

-- Size: Template Id
size_of.template_id = 2

-- Display: Template Id
display.template_id = function(value)
  if value == 102 then
    return "Template Id: Ping Message (102)"
  end
  if value == 202 then
    return "Template Id: Pong Message (202)"
  end
  if value == 103 then
    return "Template Id: Instrument Info Request Message (103)"
  end
  if value == 203 then
    return "Template Id: Instrument Info Message (203)"
  end
  if value == 105 then
    return "Template Id: Set Account Message (105)"
  end
  if value == 106 then
    return "Template Id: Set Trader Message (106)"
  end
  if value == 205 then
    return "Template Id: Set Ack Message (205)"
  end
  if value == 110 then
    return "Template Id: New Order Message (110)"
  end
  if value == 210 then
    return "Template Id: Order Entered Message (210)"
  end
  if value == 120 then
    return "Template Id: Replace Order Message (120)"
  end
  if value == 121 then
    return "Template Id: Stream Order Message (121)"
  end
  if value == 221 then
    return "Template Id: Order Reject Message (221)"
  end
  if value == 220 then
    return "Template Id: Order Replaced Message (220)"
  end
  if value == 130 then
    return "Template Id: Cancel Order Message (130)"
  end
  if value == 230 then
    return "Template Id: Order Canceled Message (230)"
  end
  if value == 233 then
    return "Template Id: Cancel Order Reject Message (233)"
  end
  if value == 131 then
    return "Template Id: Mass Cancel Order Message (131)"
  end
  if value == 231 then
    return "Template Id: Mass Cancel Order Ack Message (231)"
  end
  if value == 232 then
    return "Template Id: Mass Cancel Order Reject Message (232)"
  end
  if value == 132 then
    return "Template Id: Unlock Trading Message (132)"
  end
  if value == 234 then
    return "Template Id: Unlock Trading Ack Message (234)"
  end
  if value == 235 then
    return "Template Id: Unlock Trading Reject Message (235)"
  end
  if value == 240 then
    return "Template Id: Order Filled Message (240)"
  end
  if value == 241 then
    return "Template Id: Spread Order Filled Message (241)"
  end
  if value == 150 then
    return "Template Id: Last Exec Id Request Message (150)"
  end
  if value == 250 then
    return "Template Id: Last Exec Id Message (250)"
  end
  if value == 152 then
    return "Template Id: Event Resend Request Message (152)"
  end
  if value == 252 then
    return "Template Id: Event Resend Complete Message (252)"
  end
  if value == 253 then
    return "Template Id: Event Resend Reject Message (253)"
  end

  return "Template Id: Unknown("..value..")"
end

-- Dissect: Template Id
dissect.template_id = function(buffer, offset, packet, parent)
  local length = size_of.template_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.template_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.template_id, range, value, display)

  return offset + length, value
end

-- Size: Block Length
size_of.block_length = 2

-- Display: Block Length
display.block_length = function(value)
  return "Block Length: "..value
end

-- Dissect: Block Length
dissect.block_length = function(buffer, offset, packet, parent)
  local length = size_of.block_length
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.block_length(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.block_length, range, value, display)

  return offset + length, value
end

-- Size: Send Time Epoch Nanos
size_of.send_time_epoch_nanos = 8

-- Display: Send Time Epoch Nanos
display.send_time_epoch_nanos = function(value)
  return "Send Time Epoch Nanos: "..value
end

-- Dissect: Send Time Epoch Nanos
dissect.send_time_epoch_nanos = function(buffer, offset, packet, parent)
  local length = size_of.send_time_epoch_nanos
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.send_time_epoch_nanos(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.send_time_epoch_nanos, range, value, display)

  return offset + length, value
end

-- Size: Last Processed Seq No
size_of.last_processed_seq_no = 4

-- Display: Last Processed Seq No
display.last_processed_seq_no = function(value)
  return "Last Processed Seq No: "..value
end

-- Dissect: Last Processed Seq No
dissect.last_processed_seq_no = function(buffer, offset, packet, parent)
  local length = size_of.last_processed_seq_no
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.last_processed_seq_no(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.last_processed_seq_no, range, value, display)

  return offset + length, value
end

-- Size: Sequence Number
size_of.sequence_number = 4

-- Display: Sequence Number
display.sequence_number = function(value)
  return "Sequence Number: "..value
end

-- Dissect: Sequence Number
dissect.sequence_number = function(buffer, offset, packet, parent)
  local length = size_of.sequence_number
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.sequence_number(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Message Length
size_of.message_length = 2

-- Display: Message Length
display.message_length = function(value)
  return "Message Length: "..value
end

-- Dissect: Message Length
dissect.message_length = function(buffer, offset, packet, parent)
  local length = size_of.message_length
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_length(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.message_length, range, value, display)

  return offset + length, value
end

-- Size: Flags
size_of.flags = 1

-- Display: Flags
display.flags = function(value)
  return "Flags: "..value
end

-- Dissect: Flags
dissect.flags = function(buffer, offset, packet, parent)
  local length = size_of.flags
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.flags(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.flags, range, value, display)

  return offset + length, value
end

-- Size: Protocol Id
size_of.protocol_id = 1

-- Display: Protocol Id
display.protocol_id = function(value)
  return "Protocol Id: "..value
end

-- Dissect: Protocol Id
dissect.protocol_id = function(buffer, offset, packet, parent)
  local length = size_of.protocol_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.protocol_id(value, buffer, offset, packet, parent)

  parent:add(fairx_futures_orders_sbe_v1_3.fields.protocol_id, range, value, display)

  return offset + length, value
end

-- Calculate size of: Message Header
size_of.message_header = function(buffer, offset)
  local index = 0

  index = index + size_of.protocol_id

  index = index + size_of.flags

  index = index + size_of.message_length

  index = index + size_of.sequence_number

  index = index + size_of.last_processed_seq_no

  index = index + size_of.reserved

  index = index + size_of.send_time_epoch_nanos

  index = index + size_of.block_length

  index = index + size_of.template_id

  index = index + size_of.schema_id

  index = index + size_of.version

  return index
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Protocol Id: 1 Byte Unsigned Fixed Width Integer
  index, protocol_id = dissect.protocol_id(buffer, index, packet, parent)

  -- Flags: 1 Byte Unsigned Fixed Width Integer
  index, flags = dissect.flags(buffer, index, packet, parent)

  -- Message Length: 2 Byte Unsigned Fixed Width Integer
  index, message_length = dissect.message_length(buffer, index, packet, parent)

  -- Sequence Number: 4 Byte Unsigned Fixed Width Integer
  index, sequence_number = dissect.sequence_number(buffer, index, packet, parent)

  -- Last Processed Seq No: 4 Byte Unsigned Fixed Width Integer
  index, last_processed_seq_no = dissect.last_processed_seq_no(buffer, index, packet, parent)

  -- Reserved: 4 Byte Unsigned Fixed Width Integer
  index, reserved = dissect.reserved(buffer, index, packet, parent)

  -- Send Time Epoch Nanos: 8 Byte Signed Fixed Width Integer
  index, send_time_epoch_nanos = dissect.send_time_epoch_nanos(buffer, index, packet, parent)

  -- Block Length: 2 Byte Unsigned Fixed Width Integer
  index, block_length = dissect.block_length(buffer, index, packet, parent)

  -- Template Id: 2 Byte Unsigned Fixed Width Integer Enum with 29 values
  index, template_id = dissect.template_id(buffer, index, packet, parent)

  -- Schema Id: 2 Byte Unsigned Fixed Width Integer Static
  index, schema_id = dissect.schema_id(buffer, index, packet, parent)

  -- Version: 2 Byte Unsigned Fixed Width Integer Static
  index, version = dissect.version(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local length = size_of.message_header(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Display: Sbe Message
display.sbe_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sbe Message
dissect.sbe_message_fields = function(buffer, offset, packet, parent, size_of_sbe_message)
  local index = offset

  -- Message Header: Struct of 11 fields
  index, message_header = dissect.message_header(buffer, index, packet, parent)

  -- Dependency element: Template Id
  local template_id = buffer(index - 6, 2):le_uint()

  -- Payload: Runtime Type with 29 branches
  index = dissect.payload(buffer, index, packet, parent, template_id)

  -- Dependency element: Message Length
  local message_length = buffer(offset + 2, 2):le_uint()

  -- Runtime Size Of: Padding
  local size_of_padding = message_length - (index - offset)

  -- Padding: 0 Byte
  index = dissect.padding(buffer, index, packet, parent, size_of_padding)

  return index
end

-- Dissect: Sbe Message
dissect.sbe_message = function(buffer, offset, packet, parent, size_of_sbe_message)
  -- Optionally add struct element to protocol tree
  if show.sbe_message then
    local range = buffer(offset, size_of_sbe_message)
    local display = display.sbe_message(buffer, packet, parent)
    parent = parent:add(fairx_futures_orders_sbe_v1_3.fields.sbe_message, range, display)
  end

  dissect.sbe_message_fields(buffer, offset, packet, parent, size_of_sbe_message)

  return offset + size_of_sbe_message
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Dependency for Sbe Message
  local end_of_payload = buffer:len()

  -- Sbe Message: Struct of 3 fields
  while index < end_of_payload do

    -- Dependency element: Message Length
    local message_length = buffer(index + 2, 2):le_uint()

    -- Sbe Message: Struct of 3 fields
    index = dissect.sbe_message(buffer, index, packet, parent, message_length)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function fairx_futures_orders_sbe_v1_3.init()
end

-- Dissector for Fairx Futures Orders Sbe 1.3
function fairx_futures_orders_sbe_v1_3.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = fairx_futures_orders_sbe_v1_3.name

  -- Dissect protocol
  local protocol = parent:add(fairx_futures_orders_sbe_v1_3, buffer(), fairx_futures_orders_sbe_v1_3.description, "("..buffer:len().." Bytes)")
  return dissect.packet(buffer, packet, protocol)
end

-- Register With Tcp Table
local tcp_table = DissectorTable.get("tcp.port")
tcp_table:add(65333, fairx_futures_orders_sbe_v1_3)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.fairx_futures_orders_sbe_v1_3_packet_size = function(buffer)

  return true
end

-- Verify Schema Id Field
verify.schema_id = function(buffer)
  if 1101 == buffer(28, 2):le_uint() then
    return true
  end

  return false
end

-- Verify Version Field
verify.version = function(buffer)
  if 3 == buffer(30, 2):le_uint() then
    return true
  end

  return false
end

-- Dissector Heuristic for Fairx Futures Orders Sbe 1.3
local function fairx_futures_orders_sbe_v1_3_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.fairx_futures_orders_sbe_v1_3_packet_size(buffer) then return false end

  -- Verify Schema Id
  if not verify.schema_id(buffer) then return false end

  -- Verify Version
  if not verify.version(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = fairx_futures_orders_sbe_v1_3
  fairx_futures_orders_sbe_v1_3.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Fairx Futures Orders Sbe 1.3
fairx_futures_orders_sbe_v1_3:register_heuristic("tcp", fairx_futures_orders_sbe_v1_3_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Fair Exchange
--   Version: 1.3
--   Date: Monday, July 27, 2020
--   Specification: FairX_SBE_API_V1.3.pdf
-- 
-- Script:
--   Generator: 1.5.0.0
--   Compiler: 2.0
--   License: Public/GPLv3
--   Authors: Omi Developers
-- 
-- This script was generated by the Open Markets Initiative (Omi).
-- 
-- For full Omi information:
-- https://github.com/Open-Markets-Initiative/Directory
-----------------------------------------------------------------------