Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83C3424CAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 07:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhJGFK6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 01:10:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58940 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhJGFK6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 01:10:58 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D166B9DC;
        Thu,  7 Oct 2021 07:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633583344;
        bh=7171Ndy50gFxFpXiFi0FN6GE3tm/eWyME6D9mBEyKlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hb60qUgMyze5tzBe4f1668XAoU4AwWKC+3k58SuaDsgXOyhKhnCRiPGEM6RdBlxMO
         pAxhlEYp+KkBgq+/ONSskQB2w2vnGMGhJlHbbCEEsfbX22SQGI6d693Msy6webRmof
         x7l5VM1vyeyBiKHPZRfz+xcg2LmY95YrIjhRZQP8=
Date:   Thu, 7 Oct 2021 08:08:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Message-ID: <YV6A5xAWth6dkHor@pendragon.ideasonboard.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Oct 07, 2021 at 01:50:18PM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> Thank you for your reply
> 
> > > I noticed that ULCB+KF board on v5.15-rc1 doesn't probe HDMI.
> >
> > Is that the M3 or H3 ULCB ?
> 
> I'm using H3 ULCB + Kingfihser
> 
> > > commit d0f44e0dac29aca3f85d238dfbcd2e52450b38dc
> > > Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Date:   Mon May 25 07:05:26 2020 +0300
> > >
> > >     drm: rcar-du: dw-hdmi: Set output port number
> > >
> > >     Report the DT output port number in dw_hdmi_plat_data to connect to the
> > >     next bridge in the dw-hdmi driver.
> > >
> > >     Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >     Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> # On V3U
> > >     Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > I've tested v5.15-rc1 on a M3-N Salvator-XS, and can't reproduce the
> > issue. If your kernel log doesn't show anything useful, I'll test it on
> > my ULCB.
> 
> I'm not sure what is related, but I noticed something.
> 
> This is OK case.
> DRM failed ? rcar-dw-hdmi was probed
> 	...
> 	[    0.499485] gpio_rcar e6055800.gpio: driving 4 GPIOs
> 	[    0.511240] SuperH (H)SCI(F) driver initialized
> 	[    0.512316] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 123, base_baud = 0) is a scif
> 	[    1.465894] printk: console [ttySC0] enabled
> =>	[    1.476935] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> =>	[    1.485684] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> =>	[    1.496248] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C bus driver
> 	[    1.535173] loop: module loaded
> 	...
> 
> This is NG case.
> DAM failed. rcar-dw-hdmi is not probed.
> 
> 	...
> 	[    0.490286] gpio_rcar e6055800.gpio: driving 4 GPIOs
> 	[    0.501956] SuperH (H)SCI(F) driver initialized
> 	[    0.503027] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 123, base_baud = 0) is a scif
> 	[    1.432046] printk: console [ttySC0] enabled
> =>	[    1.443177] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> 	[    1.481426] loop: module loaded
> 	...

Strange. I will test it with my H3 ULCB.

-- 
Regards,

Laurent Pinchart
