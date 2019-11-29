Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C4910D493
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2019 12:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK2LNG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Nov 2019 06:13:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2LNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Nov 2019 06:13:06 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B25A23F;
        Fri, 29 Nov 2019 12:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575025983;
        bh=OoE7RTG9wJW8/pgGGt+3dLmA9xXR+PMpQWm0eT6mKNM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AhT+oyVnUUmq/SceVvll0C9XdbXTNGajuh+KmG0h20jZIppPpNdrfFPyWqzeMxcYB
         hSTAEfL0iGeTMfO0vS3rs57bQ+hzGhi/qyvz2pa04d/JNAKC3q7V55jceecKLGOpq1
         fBXoTcMf5r46XiaRCzPCoK0B3Z0xeHOBgPMi6rGs=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] max9286: Improve mux-state readbility
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191128162706.704-1-kieran.bingham@ideasonboard.com>
 <20191129091420.tgqzm4jqj7lknbfz@uno.localdomain>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <dab13648-9559-5a41-b08e-499cf6b58aea@ideasonboard.com>
Date:   Fri, 29 Nov 2019 11:13:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129091420.tgqzm4jqj7lknbfz@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for reviewing this :D

On 29/11/2019 09:14, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Thu, Nov 28, 2019 at 04:27:06PM +0000, Kieran Bingham wrote:
>> The MAX9286 implements an I2C mux which we maintain in an open state
>> while we are streaming from the cameras.
>>
>> The development code for the MAX9286 uses an integer value with
>> arbitrary state values to control these state transitions. This is
>> highlighted ith a FIXME and is difficult to interpret the meaning of the
> 
> s/ith/with

ack.

> 
>> values 0, 1, 2.
>>
>> Introduce an enum to declare the intent of each state, and comment the
>> states accordingly.
>>
>> This state transition is only needed for the multi-channel support, and
>> will not be included in the single-channel max9286 posting.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 63 +++++++++++++++++++++++--------------
>>  1 file changed, 40 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index eed00ff1dee4..a9c3e7411bda 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -144,7 +144,7 @@ struct max9286_priv {
>>  	struct media_pad pads[MAX9286_N_PADS];
>>  	struct regulator *regulator;
>>  	bool poc_enabled;
>> -	int streaming;
>> +	int mux_state;
>>
>>  	struct i2c_mux_core *mux;
>>  	unsigned int mux_channel;
>> @@ -221,16 +221,39 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
>>   * I2C Multiplexer
>>   */
>>
>> +enum max9286_i2c_mux_state {
> 
> Let the bikeshedding begin here
> 
>> +	/*
>> +	 * The I2C Mux will enable only a single channel (both forward, and
> 
> s/Mux/mux

Ack.

> 
>> +	 * reverse) at a time, and to reduce I2C bus bandwidth, it will only
>> +	 * reconfigure the channel when a write is requested to a different
>> +	 * channel.
> 
> I won't here explain what a mux channel select does

I was trying to explain what /this state/ does ...
I can streamline this.

> 
>> +	 */
>> +	MAX9286_I2C_MUX_STATE_CHANNEL = 0,
> 
> To me, this should be the initial state of the mux, where all channels
> are closed.
> 

I actually started with a _CLOSED here, but I determined that _CLOSED
was redundant, as _CLOSED is simply _CHANNEL with a channel id of -1.

And when in _CLOSED, the next 'write' should be of type _CHANNEL, as in
it should configure only a single channel, and open only that channel.


> The state machine to me should look like:
> 
>         init() -> i2c_mux_close() -> mux_state = CLOSED;
>         all transaction selects/deselect a single channel>
>         s_stream(1) -> mux_state = REQUEST_OPEN

I also had a REQUEST_OPEN, but I deemed it also to be a bit redundant,
as the external (not mux components) which adapt the mux_state should
only care about two states - Either it's open or on channel.

I almost wonder if I should put in a helper function to make mux_state
private to the i2c_mux functions ... but I think that's overkill.


>         first transaction opens all channels -> mux_state = OPEN
>         all successive transactions with (mux_state = OPEN) are nop
> 
>         s_stream(0) -> i2c_mux_close() -> mux_state = CLOSED
>         all transaction selects/deselect a single channel until next s_stream(1)
> 
> For this state I propose MAX9286_I2C_MUX_STATE_CLOSED
> 
>> +
>> +	/*
>> +	 * The I2C mux will be configured with all ports open. All I2C writes
>> +	 * will be transmitted to all remote I2C devices, and where multiple
>> +	 * devices have the same address, the write will be received by all of
>> +	 * them.
>> +	 */
>> +	MAX9286_I2C_MUX_STATE_OPEN,
> 
> I propose MAX9286_I2C_MUX_STATE_REQUEST_OPEN
> 
>> +
>> +	/*
>> +	 * The I2C mux is configured with all ports open.
>> +	 *
>> +	 * No reconfiguration of the I2C mux channel select is required.
>> +	 */
>> +	MAX9286_I2C_MUX_STATE_DISABLE_SELECT,
> 
> I propose MAX9286_I2C_MUX_STATE_OPEN

I had this as 'MUX_STATE_OPENED', but it felt like what it was really
doing was just 'disabling select' operations, hence I renamed it.

It's also 'internal' and I wouldn't expect the no nmax9286_i2c_mux_
functions to reference this enum value.

My further reasoning to keep this as DISABLE_SELECT is that ifsomeone
set this state (not that anyone ever should), when the mux was closed -
it would remain closed.


> Could all these be shorten to MAX9286_MUX_.... ?

I think so, I was just following the function naming.


>> +};
>> +
>>  static int max9286_i2c_mux_close(struct max9286_priv *priv)
>>  {
>> -	/* FIXME: See note in max9286_i2c_mux_select() */
>> -	if (priv->streaming)
>> -		return 0;
> 
> I don't get why we had this one here. Do you agree it was not
> necessary ? I guess so, since you dropped it...


Exactly, I couldn't see any reason for this to be here, and I also
couldn't see it being used, as _close It doesn't get called after an
s_stream operation as far as I can tell. It's only currently closed
during _probe and _init.

However, if at some other point, someone wanted to call _close, I would
expect it to close all of the channels.

> 
>>  	/*
>>  	 * Ensure that both the forward and reverse channel are disabled on the
>> -	 * mux, and that the channel ID is invalidated to ensure we reconfigure
>> -	 * on the next select call.
>> +	 * mux, and that the channel state and ID is invalidated to ensure we
>> +	 * reconfigure on the next max9286_i2c_mux_select() call.
>>  	 */
>> +	priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;

Note here that we set the mux_channel to -1, and thus the state is set
to _CHANNEL as discussed above, because on the next operation - we
expect either the write to go to the specific channel, /or/ if someone
has set MAX9286_I2C_MUX_STATE_OPEN explicitly the select call will send
it to all channels.

Those are the only two options as far as I can tell, so adding extra
states of '_CLOSED' seems redundant, and adds unecessary complexity to me.

>>  	priv->mux_channel = -1;
>>  	max9286_write(priv, 0x0a, 0x00);
>>  	usleep_range(3000, 5000);
>> @@ -242,23 +265,19 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
>>  {
>>  	struct max9286_priv *priv = i2c_mux_priv(muxc);
>>
>> -	/*
>> -	 * FIXME: This state keeping is a hack and do the job. It should
>> -	 * be should be reworked. One option to consider is that once all
>> -	 * cameras are programmed the mux selection logic should be disabled
>> -	 * and all all reverse and forward channels enable all the time.
>> -	 *
>> -	 * In any case this logic with a int that have two states should be
>> -	 * reworked!
>> -	 */
>> -	if (priv->streaming == 1) {
>> -		max9286_write(priv, 0x0a, 0xff);
>> -		priv->streaming = 2;
>> +	/* channel select is disabled when configured in the opened state. */
> 
> Channel

Ack.


> 
>> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_DISABLE_SELECT)
>>  		return 0;
>> -	} else if (priv->streaming == 2) {
>> +
>> +	if (priv->mux_state == MAX9286_I2C_MUX_STATE_OPEN) {
>> +		/* Open all channels on the MAX9286 */
>> +		max9286_write(priv, 0x0a, 0xff);
>> +		priv->mux_state = MAX9286_I2C_MUX_STATE_DISABLE_SELECT;
> 
> Shouldn't we sleep 3-5ms when changing the forward/reverse channel
> configuration ?

Based on the comments below, we probably do - and this has been missing.

> 
>>  		return 0;
>>  	}
>>
>> +	/* Handling for MAX9286_I2C_MUX_STATE_CHANNEL */
>> +
> 
> Empty line
> Do you need this comment ?

I wanted to clarify that of the 3 states, the lines above explicitly
handle the MAX9286_I2C_MUX_STATE_DISABLE_SELECT,  and the
MAX9286_I2C_MUX_STATE_OPEN states, so it's left 'implicit' that the code
below is MAX9286_I2C_MUX_STATE_CHANNEL.

I added the comment to make it more explicit.

I didn't want to move all the code into a switch statement which would
be my only alternative otherwise I think.




>>  	if (priv->mux_channel == chan)
>>  		return 0;
>>
>> @@ -441,8 +460,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  	int ret;
>>
>>  	if (enable) {
>> -		/* FIXME: See note in max9286_i2c_mux_select() */
>> -		priv->streaming = 1;
>> +		priv->mux_state = MAX9286_I2C_MUX_STATE_OPEN;
>>
>>  		/* Start all cameras. */
>>  		for_each_source(priv, source) {
>> @@ -490,8 +508,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  		for_each_source(priv, source)
>>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
>>
>> -		/* FIXME: See note in max9286_i2c_mux_select() */
>> -		priv->streaming = 0;
>> +		priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
> 
> Shouldn't we call i2c_mux_close() here, and let it close all channels
> and reset the mux state ? If the mux is not closed by writing
> 0x0a = 0x00 but the state is here reset to STATE_CHANNEL all
> successive i2c_mux_select() call will re-open channel-by-channel a mux
> that is already open, won't they ?

I have not modified the actual state transitions from your original
implementation, so I think you're the expert here. This is your code,
just renamed.

(Ok perhaps that's not true, I removed the state check at
max9286_i2c_mux_close above)

So - thinking it through ... Yes, you are right - this will leave all
the channels open. This is the behaviour we had before this patch though
so I wonder if this could explain any of the issues we've had.

I don't /think/ so - because
  A) we probably reset the board a lot,
  B) I don't think we've had issues starting and stopping streams, but
     we haven't done enough testing there.



> Overall, I very much agree we need this patch, so thanks for having
> addressed it!

No problem, I needed to go through to understand what the three states
(0, 1, 2) were, so this is what I came up with.

Thanks for your comments, I'll await any further comments to the above
then do a respin before collapsing it into the multi-stream support patch.

Or do you think we should keep things as separate patches on top of the
'single' camera support? I don't want to end up in a GMSL==100 patches
to track case again if we can avoid it .., So I'd like to keep it down
to three managable topics :

 Patch 1) A single camera support, (should apply and run on linux-media)
 Patch 2) Support for multiple streams (requires v4l2-mux)
 Patch 3) Support for 2 MAX9286 on one bus (not upstreamable currently)

--
Kieran


> Thanks
>    j
> 
>>  	}
>>
>>  	return 0;
>> --
>> 2.20.1
>>
