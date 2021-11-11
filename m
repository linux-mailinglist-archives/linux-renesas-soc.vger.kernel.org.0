Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B7544CE5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 01:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhKKAiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 19:38:00 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:18566 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230311AbhKKAh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 19:37:59 -0500
Date:   11 Nov 2021 09:35:10 +0900
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100153194"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 09:35:10 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 723654015FB7;
        Thu, 11 Nov 2021 09:35:10 +0900 (JST)
Message-ID: <87r1bny1fl.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
In-Reply-To: <87ilxc1ibv.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
        <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
        <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
        <YV6A5xAWth6dkHor@pendragon.ideasonboard.com>
        <87tuhtmn8u.wl-kuninori.morimoto.gx@renesas.com>
        <87ilxc1ibv.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Laurent

You back !

This is gentle ping mail not to buried in a large amount of emails,
it had happen before ;P

> About this topic, v5.15 was released, but it still
> has "No soundcards" issue.
> There is no dw-hdmi, thus no soundcards
> 
> 	...
> 	[    1.431196] printk: console [ttySC0] enabled
> =>	[    1.442432] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> 	[    1.481179] loop: module loaded
> 	...
> 	[    9.568307] ALSA device list:
> =>	[    9.571446]   No soundcards found.
> 	...
> 
> I re-start works for me if I reverted this patch
> 
> 	--------------------------------
> 	commit d0f44e0dac29aca3f85d238dfbcd2e52450b38dc
> 	Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 	Date:   Mon May 25 07:05:26 2020 +0300
> 
> 	    drm: rcar-du: dw-hdmi: Set output port number
> 
> 	    Report the DT output port number in dw_hdmi_plat_data to connect to the
> 	    next bridge in the dw-hdmi driver.
> 
> 	    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 	    Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> # On V3U
> 	    Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 	--------------------------------
> 
> 	...
> 	[    1.431130] printk: console [ttySC0] enabled
> =>	[    1.442219] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> =>	[    1.451050] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> =>	[    1.461560] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C bus driver
> 	[    1.501043] loop: module loaded
> 	...
> 	[    9.180464] ALSA device list:
> =>	[    9.183519]   #0: rcar-sound
> 	...
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
