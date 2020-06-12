Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27751F78BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 15:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgFLNWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 09:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgFLNW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 09:22:29 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363C9C03E96F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 06:22:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y17so9699927wrn.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L1qYFiXdrWRLGehThfw+VGc3K2F+7G7hE4TLQnF4A4A=;
        b=d0N9W5uZ/m8EXBts1qB6HaMHra7R+qboeLzq+V99FKehGB+ZtsMSKtKBjpciZ6y1rd
         9GlMMGQkx6+G+d5mPiFRZtGI9r+Jr0ikoE1XoaXQxtj/MGbJojc/zw9VVpbwVhsaSSqb
         veaQeiR4ioxh+JBMfLoqcOP9QAW42isCz86Z4IyyeX0AXtdEsVm4vM8bbiWKM3MFNiRf
         TUZEHj8vYyDlyeoy06hejTFlPlHleYtbkiUkAkDS3doXHYhxznE2JaUFRYHX3TS+W1PH
         RoL+frmI7Uiuo0W0pkjrAEuy8gwXC1nekzMhDShZKrHs76ofgdNCc5zUkONKV9dUaxpa
         0u9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L1qYFiXdrWRLGehThfw+VGc3K2F+7G7hE4TLQnF4A4A=;
        b=LdmkUxFb3a579M5Ghp1T0+dUriCe6JeFCiQmqZE+SX/mNQFwMS1E1DCYMGU5hqFBQx
         h6VEJ6cc+Lp5Cxl9WSBIRoZJES8NpnmMomhIW9QfsZltoIKkq+NQdDLWljRWYZOvN8lu
         njKxrNArnkk/k7nNCAQlT4GVPDRXgQJ+8noaGJF5akWVV70QANAJ64kq6Z9ot5RstDZ+
         NY5lvlPmDrMCNU2QX5wHRqqkBmbcd1cBguwQruswkk/lbzFGBvpXR1v4ENvBjh4W0AoR
         nPYLDviF+3ShFQ7r33WF6I0pvIMOxZn0tiZpcF9hXzRCAhV6h7/QilCGuB85Isy9Boyg
         9hEQ==
X-Gm-Message-State: AOAM531UHsHHw38oyhUozxUMy6ToQrSvSG+u6WUuy0I2HbXfi3zAMeIK
        6aZjld1HC8FZ7E7bdEH+BCRkputaL1I=
X-Google-Smtp-Source: ABdhPJyxuw+l5AyB7en4cHy7qfauS3qoxhdw8+Xdt8/+Ii8blutdK3mGUxseH0Ejk058lHzS1vhEuA==
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr16413706wrq.153.1591968146887;
        Fri, 12 Jun 2020 06:22:26 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id l204sm9424178wmf.19.2020.06.12.06.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 06:22:25 -0700 (PDT)
Subject: Re: [PATCH v9.2 2/9] fixes! [max9286]: Validate link formats
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-3-kieran@bingham.xyz>
 <20200610150246.ovw6n2amobg5ynmm@uno.localdomain>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <ad7311db-8677-d3de-5219-87f6e7161e5d@bingham.xyz>
Date:   Fri, 12 Jun 2020 14:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610150246.ovw6n2amobg5ynmm@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 10/06/2020 16:02, Jacopo Mondi wrote:
> Hi Kieran,
>   a few small nits.
> 
> The patch is fine, feel free to squash it in v10.

Thanks,

> 
> On Wed, Jun 10, 2020 at 01:46:16PM +0100, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Disallow setting a format on the source link, but enable link validation
>> by returning the format of the first bound source when getting the
>> format of the source pad.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index ef824d2b26b8..7e59391a5736 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -711,7 +711,11 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>>  	struct v4l2_mbus_framefmt *cfg_fmt;
>>
>> -	if (format->pad >= MAX9286_SRC_PAD)
>> +	/* TODO:
>> +	 * Multiplexed Stream Support: Prevent setting the format on the shared
>> +	 * multiplexed bus.
>> +	 */
> 
> I am not sure I would mention multiplexed stream support, and this is
> not a TODO item. Simply, max9286 does not allow any format conversion
> on its source pad, so the format is propagated from one of its sink to
> the source (assuming all sinks have the same format applied).
> 
> Quite a common thing, isn't it ?

Ok - I'll just drop the comment then.


> 
>> +	if (format->pad == MAX9286_SRC_PAD)
>>  		return -EINVAL;
>>
>>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
>> @@ -743,11 +747,18 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>>  {
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>>  	struct v4l2_mbus_framefmt *cfg_fmt;
>> +	unsigned int pad = format->pad;
>>
>> -	if (format->pad >= MAX9286_SRC_PAD)
> 
> I was about to comment we'ra nowe allowing pads > MAX9286_SRC_PAD, but the
> core actually checks that for us.
> 
>> -		return -EINVAL;
>> +	/* TODO:
>> +	 * Multiplexed Stream Support: Support link validation by returning the
>> +	 * format of the first bound link. All links must have the same format,
>> +	 * as we do not support mixing, and matching of cameras connected to
> 
> nit: is the comma in 'mixing,' intentional ?

No, it should be removed.

> Same comment about multiplexed stream support in comment.
> 
> Theoretically, a set_fmt on a sink should propagate the format to the
> source pad, and you could access it through
> priv->fmts[MAX9286_SRC_PAD] and drop this check.
> 
> The result is actually the same, so it's up to you.

I'll stick with what we've got then, and just remove those comments, if
you think they get in the way.



> 
> Thanks
>   j
> 
>> +	 * the max9286.
>> +	 */
>> +	if (pad == MAX9286_SRC_PAD)
>> +		pad = __ffs(priv->bound_sources);
>>
>> -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
>> +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
>>  	if (!cfg_fmt)
>>  		return -EINVAL;
>>
>> --
>> 2.25.1
>>

