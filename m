Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2A88D65A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 16:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHNOjY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 10:39:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40060 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNOjY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 10:39:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so53185133pgj.7;
        Wed, 14 Aug 2019 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JMUiHJTsAwSZagRv5u1mIW6VordoKt5B7sVmqdI/15I=;
        b=Vn4hhpuFqTeNWbD1F1Eoy7rzWzynqyLG1XMGKCAH3ubHPbZRAA4jB/RmnUSR84PPEW
         iTYdoIJ1SPh1+s2JwNE2rD++IJwZT+krmtVTN5MFNapPOXbvxv7QScwACsW5fypf0/3U
         MHl3u5XPur/ap7gR3F5Z1PxeGaV4mmkdLvQLdRtkFztAW5p9m+XO/IwIVo1fTubSgP4G
         kC1ufrogrl6I4DZQX//noYCuMJntbF+i29tznjywK1nWrJ+sLJLOnDQL/acV34tOXj3I
         5UcfRFHzKIW/rWaAFXKNeh63SHPoqljaggm4WWeBkXPvyqLj6kGPYQHT1ISKh3/qgEBn
         lQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JMUiHJTsAwSZagRv5u1mIW6VordoKt5B7sVmqdI/15I=;
        b=tgmO9PvCSfB1BVURNwwDdmNrYpdv0o/+szPifcchGQSh+qd06v57/DI0zzel7wQ+L4
         o9yz+Oo3eSqqgsl1XToctpvRsItmXGrzmOYomUt0/nluMpOaVkE7RkS1IsPrsVsYhXzG
         T75Fffab+MPjhuwTrY4xqwYAUaI0LFsx7jgjTLquRfYjXO0NFm6caAR66/Mt1ok2MCiT
         lCdZ9THi08bPUKOMpugobQurlMaoypdpFbBCnlAp8R4DpypODNXBPUhbYCJ+lPyRPwf6
         GrOgE6tFo6oE2s8d20yI+DBDta+DP94acjZWt8shjfGkRa37O4fb9MoNpoZhKXLKiFzt
         XZRQ==
X-Gm-Message-State: APjAAAVpmiUmwNMt+qfNt6AagJOMbq3pAjaWR6y2G7PNW/f8wBg1U7ug
        PRGm69FDzcBhwsb6vXDZzKI=
X-Google-Smtp-Source: APXvYqxk9+PaPbwX9l+cfmGnvelXdoXFkB7yG+lB9YLeeCMPwLcf50CVzSOElPfZ/oV7p8L2OX4rDQ==
X-Received: by 2002:a63:2a08:: with SMTP id q8mr38916870pgq.415.1565793563173;
        Wed, 14 Aug 2019 07:39:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e9sm6411280pge.39.2019.08.14.07.39.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 07:39:22 -0700 (PDT)
Date:   Wed, 14 Aug 2019 07:39:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
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
Subject: Re: [PATCH] drm/bridge: dumb-vga-dac: Fix dereferencing -ENODEV DDC
 channel
Message-ID: <20190814143920.GA30613@roeck-us.net>
References: <20190813093046.4976-1-geert+renesas@glider.be>
 <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 13, 2019 at 02:01:26PM +0200, Neil Armstrong wrote:
> Hi,
> 
> 
> On 13/08/2019 11:30, Geert Uytterhoeven wrote:
> > If the VGA connector has no DDC channel, an error pointer will be
> > dereferenced, e.g. on Salvator-XS:
> > 
> >     Unable to handle kernel NULL pointer dereference at virtual address 000000000000017d
> >     ...
> >     Call trace:
> >      sysfs_do_create_link_sd.isra.0+0x40/0x108
> >      sysfs_create_link+0x20/0x40
> >      drm_sysfs_connector_add+0xa8/0xc8
> >      drm_connector_register.part.3+0x54/0xb0
> >      drm_connector_register_all+0xb0/0xd0
> >      drm_modeset_register_all+0x54/0x88
> >      drm_dev_register+0x18c/0x1d8
> >      rcar_du_probe+0xe4/0x150
> >      ...
> > 
> > This happens because vga->ddc either contains a valid DDC channel
> > pointer, or -ENODEV, and drm_connector_init_with_ddc() expects a valid
> > DDC channel pointer, or NULL.
> > 
> > Fix this by resetting vga->ddc to NULL in case of -ENODEV, and replacing
> > the existing error checks by non-NULL checks.
> > This is similar to what the HDMI connector driver does.
> > 
> > Fixes: a4f9087e85de141e ("drm/bridge: dumb-vga-dac: Provide ddc symlink in connector sysfs directory")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > An alternative would be to check if vga->ddc contains an error pointer,
> > and calling drm_connector_init() instead of
> > drm_connector_init_with_ddc(), like before.
> > ---
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > index 8ef6539ae78a6eb3..7aa789c358829b05 100644
> > --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > @@ -42,7 +42,7 @@ static int dumb_vga_get_modes(struct drm_connector *connector)
> >  	struct edid *edid;
> >  	int ret;
> >  
> > -	if (IS_ERR(vga->ddc))
> > +	if (!vga->ddc)
> >  		goto fallback;
> >  
> >  	edid = drm_get_edid(connector, vga->ddc);
> > @@ -84,7 +84,7 @@ dumb_vga_connector_detect(struct drm_connector *connector, bool force)
> >  	 * wire the DDC pins, or the I2C bus might not be working at
> >  	 * all.
> >  	 */
> > -	if (!IS_ERR(vga->ddc) && drm_probe_ddc(vga->ddc))
> > +	if (vga->ddc && drm_probe_ddc(vga->ddc))
> >  		return connector_status_connected;
> >  
> >  	return connector_status_unknown;
> > @@ -197,6 +197,7 @@ static int dumb_vga_probe(struct platform_device *pdev)
> >  		if (PTR_ERR(vga->ddc) == -ENODEV) {
> >  			dev_dbg(&pdev->dev,
> >  				"No i2c bus specified. Disabling EDID readout\n");
> > +			vga->ddc = NULL;
> >  		} else {
> >  			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
> >  			return PTR_ERR(vga->ddc);
> > @@ -218,7 +219,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
> >  
> >  	drm_bridge_remove(&vga->bridge);
> >  
> > -	if (!IS_ERR(vga->ddc))
> > +	if (vga->ddc)
> >  		i2c_put_adapter(vga->ddc);
> >  
> >  	return 0;
> > 
> 
> Looks sane,
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Guenter, can you confirm it also fixes qemu:versatilepb ?
> 

Yes, it does.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
