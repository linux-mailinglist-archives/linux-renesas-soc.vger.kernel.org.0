Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5608D674
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 16:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfHNOqN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 10:46:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35712 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfHNOqN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 10:46:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so25510626wrq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Aug 2019 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RZ9MbKBjKXb7iIKtVB/tWj9mxwXvCyRq6iVWKlfTB1I=;
        b=NZk2tv5jY4v6sFIqx6wIPHqHYFjbJWPmdrAvktTExwEHbkhtkCLYeORBKPJsMsfbWs
         8UDhtwnKatbRMWt03VfQb0gEZxaJFy6Audxfufrmjr2bTLGXeOMX3R5/jjFR2E/5ZXCb
         XI1naaktsPW3++iepV5p5ajEGvfZmtu2OZS3hh4NImb9LQPYKQCKvPiU+7XvWOP/lEs6
         173yQ3CtzlaG53ySubWC8bPWaMKkbPfFyFjE91Mq/pPZNab+pN+spvkVZEu5K2w86R30
         ZvZo1ckyi0FhhQ0ttKfXijRIDkL/jiwHemPUv7b3HEwYP8AIhOaD8/iiki3wFBM85kcP
         JlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RZ9MbKBjKXb7iIKtVB/tWj9mxwXvCyRq6iVWKlfTB1I=;
        b=BmNLiJNbyLvmH7vJ6wR33YGTFLEO7X8usFEUUQ7M8oM9kUc2Ph8MMwOG0ubqnjEk4E
         bwsvLZH+XBA+JN5X6kcAtj1F479OK3bruryUKIB0PDb/kVnYlhcMUoo1gPaOHPOzTWS4
         74VML8MJiTL27vDcz0+C+JqPAnWAP7EoUNmIp5PV1DdOJSD7hZklVq/jxnHP5wb/jiHt
         SOd0bJ/dBGtb8bRiHon2pykHcpvCNGH9LWnjQQlLEugK0CHzBwVQcYI1qBR4V//4BKdn
         1P41IIbH9bvdezPVXTdagCgAI39UVhem3Wo1g2HTSkhultd4qLb2UF6eHM8DbAoMNySF
         oICA==
X-Gm-Message-State: APjAAAWkhDBERq3wd2ARAARuPaXPYvE3BcPoe/vdKQmiMKseULbMg3ci
        YwXkZcXmDMgUksAmT0BeoAEltQixXE0Puw==
X-Google-Smtp-Source: APXvYqwazZFY70ioUsjFttLt5TL4D6ggiqgiQj9/JbjqN8ER/sNJMCKgouRA7gbKTx7MPxVkp8KddQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr50315wrm.262.1565793970098;
        Wed, 14 Aug 2019 07:46:10 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id 39sm16965wrc.45.2019.08.14.07.46.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 07:46:09 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dumb-vga-dac: Fix dereferencing -ENODEV DDC
 channel
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190813093046.4976-1-geert+renesas@glider.be>
 <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
 <20190814143920.GA30613@roeck-us.net>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <591b2c3d-0c12-511a-c044-82459d4b81d0@baylibre.com>
Date:   Wed, 14 Aug 2019 16:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814143920.GA30613@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/08/2019 16:39, Guenter Roeck wrote:
> On Tue, Aug 13, 2019 at 02:01:26PM +0200, Neil Armstrong wrote:
>> Hi,
>>
>>
>> On 13/08/2019 11:30, Geert Uytterhoeven wrote:
>>> If the VGA connector has no DDC channel, an error pointer will be
>>> dereferenced, e.g. on Salvator-XS:
>>>
>>>     Unable to handle kernel NULL pointer dereference at virtual address 000000000000017d
>>>     ...
>>>     Call trace:
>>>      sysfs_do_create_link_sd.isra.0+0x40/0x108
>>>      sysfs_create_link+0x20/0x40
>>>      drm_sysfs_connector_add+0xa8/0xc8
>>>      drm_connector_register.part.3+0x54/0xb0
>>>      drm_connector_register_all+0xb0/0xd0
>>>      drm_modeset_register_all+0x54/0x88
>>>      drm_dev_register+0x18c/0x1d8
>>>      rcar_du_probe+0xe4/0x150
>>>      ...
>>>
>>> This happens because vga->ddc either contains a valid DDC channel
>>> pointer, or -ENODEV, and drm_connector_init_with_ddc() expects a valid
>>> DDC channel pointer, or NULL.
>>>
>>> Fix this by resetting vga->ddc to NULL in case of -ENODEV, and replacing
>>> the existing error checks by non-NULL checks.
>>> This is similar to what the HDMI connector driver does.
>>>
>>> Fixes: a4f9087e85de141e ("drm/bridge: dumb-vga-dac: Provide ddc symlink in connector sysfs directory")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> An alternative would be to check if vga->ddc contains an error pointer,
>>> and calling drm_connector_init() instead of
>>> drm_connector_init_with_ddc(), like before.
>>> ---
>>>  drivers/gpu/drm/bridge/dumb-vga-dac.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> index 8ef6539ae78a6eb3..7aa789c358829b05 100644
>>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> @@ -42,7 +42,7 @@ static int dumb_vga_get_modes(struct drm_connector *connector)
>>>  	struct edid *edid;
>>>  	int ret;
>>>  
>>> -	if (IS_ERR(vga->ddc))
>>> +	if (!vga->ddc)
>>>  		goto fallback;
>>>  
>>>  	edid = drm_get_edid(connector, vga->ddc);
>>> @@ -84,7 +84,7 @@ dumb_vga_connector_detect(struct drm_connector *connector, bool force)
>>>  	 * wire the DDC pins, or the I2C bus might not be working at
>>>  	 * all.
>>>  	 */
>>> -	if (!IS_ERR(vga->ddc) && drm_probe_ddc(vga->ddc))
>>> +	if (vga->ddc && drm_probe_ddc(vga->ddc))
>>>  		return connector_status_connected;
>>>  
>>>  	return connector_status_unknown;
>>> @@ -197,6 +197,7 @@ static int dumb_vga_probe(struct platform_device *pdev)
>>>  		if (PTR_ERR(vga->ddc) == -ENODEV) {
>>>  			dev_dbg(&pdev->dev,
>>>  				"No i2c bus specified. Disabling EDID readout\n");
>>> +			vga->ddc = NULL;
>>>  		} else {
>>>  			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
>>>  			return PTR_ERR(vga->ddc);
>>> @@ -218,7 +219,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
>>>  
>>>  	drm_bridge_remove(&vga->bridge);
>>>  
>>> -	if (!IS_ERR(vga->ddc))
>>> +	if (vga->ddc)
>>>  		i2c_put_adapter(vga->ddc);
>>>  
>>>  	return 0;
>>>
>>
>> Looks sane,
>>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Guenter, can you confirm it also fixes qemu:versatilepb ?
>>
> 
> Yes, it does.
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
> 

Thanks for testing,

Applying to drm-misc-next
