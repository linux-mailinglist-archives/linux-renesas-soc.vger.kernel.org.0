Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73291A42D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgDJHOW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:14:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgDJHOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:14:22 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAC99329;
        Fri, 10 Apr 2020 09:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586502861;
        bh=lfCNwAmaQnVPJbk/paMtaACl1jBo/SKFifR0M7Mf3Jg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MxfUa3TiVs0szpPu2B9C0JRDGtd5wlVNoIboeFEdMQ+5214VYQqK7H9Sf6j+iuCzI
         /bWAokWzXCn/3He+lDWc+XPYV+mwHRy894xb9jw9WHpCKvbhI9IaWNHLcYTZAQAH0N
         LkHlGTmiew+Jacz1UlZmZujm8K56iAre0ERo2s+U=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v8 11/13] squash! max9286: Disable overlap window
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-12-kieran.bingham+renesas@ideasonboard.com>
 <20200409163236.mudhnpvq37wqn3y4@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cd390e5b-1da6-32c9-458a-a9aa5a29094c@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409163236.mudhnpvq37wqn3y4@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 09/04/2020 17:32, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Thu, Apr 09, 2020 at 01:12:00PM +0100, Kieran Bingham wrote:
>> Provide a function to control setting of the overlap window, but disable
>> it by default.
>>
>> The function will allow the value to be easily updated in the future,
>> either statically in the code, or via an external control mechanism.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 42 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 008a93910300..61178ae363d6 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -118,6 +118,9 @@
>>  #define MAX9286_REV_FLEN(n)		((n) - 20)
>>  /* Register 0x49 */
>>  #define MAX9286_VIDEO_DETECT_MASK	0x0f
>> +/* Register 0x64 */
>> +#define MAX9286_ENFSINLAST		BIT(5)
>> +#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
>>  /* Register 0x69 */
>>  #define MAX9286_LFLTBMONMASKED		BIT(7)
>>  #define MAX9286_LOCKMONMASKED		BIT(6)
>> @@ -632,6 +635,34 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  	return 0;
>>  }
>>
>> +/*
>> + * The overlap window is a 13 bit value with the low byte in register 0x63 and
>> + * the high byte(5bits) stored in the least significant bits of register 0x64.
>                    ^ space
> 
> But I'm not sure this is useful comment. The register layout is
> actually the only documented thing of this register :)

Sure, but readers won't necessarily have the documentation :-) I think I
was just trying to explain what was happening because we have so many
unidentified registers (i.e. they're all just numbers, so we can't do,

  max9286_write(priv, MAX9286_OVERLAP_LOW, overlap & 0xff);
  max9286_write(priv, MAX9286_OVERLAP_HIGH, (overlap >> SHIFT) & MASK);

I can drop this comment all the same, although I'd like to document
clearly that it's a 13-bit value as an input, (not a full 16 bit)

Will this be better suited?


/*
 * The overlap window is a 13 bit value stored across two registers.
 * The definition and units of the value is undocumented.
 */



>> + */
>> +static int max9286_set_overlap_window(struct max9286_priv *priv, u16 window)
>> +{
>> +	int ret;
>> +	u8 val;
>> +
>> +	ret = max9286_read(priv, 0x64);
>> +	if (ret < 0)
>> +		return -EIO;
>> +
>> +	max9286_write(priv, 0x63, window & 0xff);
>> +
>> +	/*
>> +	 * Process the high byte, while preserve existing bits set in 0x64.
>> +	 * TODO: Convert this all to regmap so we can utilise regmap_update_bits
>> +	 */
>> +	window >>= 8;
>> +	val = ret & ~MAX9286_OVLP_WINDOWH_MASK;
>> +	val |= window & MAX9286_OVLP_WINDOWH_MASK;
>> +
>> +	max9286_write(priv, 0x64, val);
>> +
>> +	return 0;
>> +}
>> +
>>  static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
>>  {
>>  	if (!priv->pixelrate)
>> @@ -942,6 +973,17 @@ static int max9286_setup(struct max9286_priv *priv)
>>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
>>  		      MAX9286_HVSRC_D14);
>>
>> +	/*
>> +	 * The overlap window seems to provide additional validation by tracking
>> +	 * the delay between vsync and frame sync, generating an error if the
>> +	 * delay is bigger than the programmed window, though it's not yet clear
>> +	 * what value should be set.
>> +	 *
>> +	 * As it's an optional value and can be disabled, we do so by setting
>> +	 * a 0 overlap value.
>> +	 */
> 
> This is useful instead :)


:-)


>> +	max9286_set_overlap_window(priv, 0);
>> +
>>  	/*
>>  	 * Wait for 2ms to allow the link to resynchronize after the
>>  	 * configuration change.
>> --
>> 2.20.1
>>

