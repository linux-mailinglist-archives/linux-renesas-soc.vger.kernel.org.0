Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47126115166
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 14:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLFNxE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 08:53:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLFNxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 08:53:04 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E72AD2E5;
        Fri,  6 Dec 2019 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575640382;
        bh=ZXaTpLOMkeiWHunpRmfKBNTn/Q2PfK4tewpGVFE0hiQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n54HM4JScbSjBdsdrOga66lq9Cs08SB6jnG4egLi7kvdmroNmqfG8Kp2fi2xITfwU
         FixIm2gVgF13igwyfpAvrAMYvEO/mjvA21s3Dt8GtvUgXLGCZYCzWKF8EWHl1alEHW
         J6ovcwPb2YB4jr5Wac4/BIxM4tdqyCBtO1cvFJjI=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] max9286: Improve mux-state readbility [v2]
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
 <20191129132643.6429-1-kieran.bingham@ideasonboard.com>
 <20191203081902.jqwqmfsrdztpcudg@uno.localdomain>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <afa1b25c-17bf-ee71-d39d-6af53028c2ef@ideasonboard.com>
Date:   Fri, 6 Dec 2019 13:52:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203081902.jqwqmfsrdztpcudg@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 03/12/2019 08:19, Jacopo Mondi wrote:
> Hi Kieran,
>     only a really minor nit, you could fix when squashing this patch
> 
> On Fri, Nov 29, 2019 at 01:26:43PM +0000, Kieran Bingham wrote:
>> The MAX9286 implements an I2C mux which we maintain in an open state
>> while we are streaming from the cameras.
>>
>> The development code for the MAX9286 uses an integer value with
>> arbitrary state values to control these state transitions. This is
>> highlighted with a FIXME and is difficult to interpret the meaning of the
>> values 0, 1, 2.
>>
>> Introduce a new function call max9286_i2c_mux_open() to make it clear
>> when a component opens all the mux channels, and update the usage
>> in s_stream() to max9286_i2c_mux_close() the mux on stop stream.
>>
>> We previously had missed an occasion to sleep after an update to the I2C
>> Fwd/Rev channels, so all writes to this configuration register are moved
>> to a helper: max9286_i2c_mux_configure() which guarantees the delay.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 74 ++++++++++++++++++-------------------
>>  1 file changed, 37 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 5b8dfa652d50..b34fb31c6db5 100644
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
>> @@ -221,57 +221,59 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
>>   * I2C Multiplexer
>>   */
>>
>> -static int max9286_i2c_mux_close(struct max9286_priv *priv)
>> +enum max9286_i2c_mux_state {
>> +	MAX9286_MUX_CLOSED = 0,
>> +	MAX9286_MUX_OPEN,
>> +};

This is now down to just two states, so I think this probably warrants
being changed to a bool mux_open;

I've already folded /this/ patch into the main max9286 driver, so I'll
make this small fix and post it here along with the next two fixes I have.

>> +
>> +static void max9286_i2c_mux_configure(struct max9286_priv *priv, u8 conf)
>> +{
>> +	max9286_write(priv, 0x0a, conf);
>> +
>> +	/*
>> +	 * We must sleep after any change to the forward or reverse channel
>> +	 * configuration.
>> +	 */
>> +	usleep_range(3000, 5000);
>> +}
>> +
>> +static void max9286_i2c_mux_open(struct max9286_priv *priv)
>> +{
>> +	/* Open all channels on the MAX9286 */
>> +	max9286_i2c_mux_configure(priv, 0xff);
>> +
>> +	priv->mux_state = MAX9286_MUX_OPEN;
>> +}
>> +
>> +static void max9286_i2c_mux_close(struct max9286_priv *priv)
>>  {
>> -	/* FIXME: See note in max9286_i2c_mux_select() */
>> -	if (priv->streaming)
>> -		return 0;
>>  	/*
>>  	 * Ensure that both the forward and reverse channel are disabled on the
>>  	 * mux, and that the channel ID is invalidated to ensure we reconfigure
>> -	 * on the next select call.
>> +	 * on the next max9286_i2c_mux_select() call.
>>  	 */
>> -	priv->mux_channel = -1;
>> -	max9286_write(priv, 0x0a, 0x00);
>> -	usleep_range(3000, 5000);
>> +	max9286_i2c_mux_configure(priv, 0x00);
>>
>> -	return 0;
>> +	priv->mux_state = MAX9286_MUX_CLOSED;
>> +	priv->mux_channel = -1;
>>  }
>>
>>  static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
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
>> -		return 0;
>> -	} else if (priv->streaming == 2) {
>> +	/* channel select is disabled when configured in the opened state. */
> 
> All other comments in this driver start with a capital letter.

Thanks, this is fixed up.


> Otherwise, I really like this patch! thanks!
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>    j
> 
>> +	if (priv->mux_state == MAX9286_MUX_OPEN)
>>  		return 0;
>> -	}
>>
>>  	if (priv->mux_channel == chan)
>>  		return 0;
>>
>>  	priv->mux_channel = chan;
>>
>> -	max9286_write(priv, 0x0a,
>> -		      MAX9286_FWDCCEN(chan) | MAX9286_REVCCEN(chan));
>> -
>> -	/*
>> -	 * We must sleep after any change to the forward or reverse channel
>> -	 * configuration.
>> -	 */
>> -	usleep_range(3000, 5000);
>> +	max9286_i2c_mux_configure(priv,
>> +				  MAX9286_FWDCCEN(chan) |
>> +				  MAX9286_REVCCEN(chan));
>>
>>  	return 0;
>>  }
>> @@ -441,8 +443,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  	int ret;
>>
>>  	if (enable) {
>> -		/* FIXME: See note in max9286_i2c_mux_select() */
>> -		priv->streaming = 1;
>> +		max9286_i2c_mux_open(priv);
>>
>>  		/* Start all cameras. */
>>  		for_each_source(priv, source) {
>> @@ -490,8 +491,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  		for_each_source(priv, source)
>>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
>>
>> -		/* FIXME: See note in max9286_i2c_mux_select() */
>> -		priv->streaming = 0;
>> +		max9286_i2c_mux_close(priv);
>>  	}
>>
>>  	return 0;
>> --
>> 2.20.1
>>

-- 
Regards
--
Kieran
