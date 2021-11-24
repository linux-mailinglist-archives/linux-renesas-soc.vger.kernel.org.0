Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496A945C73A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350433AbhKXOaY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349324AbhKXO3x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:29:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7C0C126F50
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 04:53:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AB87993;
        Wed, 24 Nov 2021 13:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637758406;
        bh=hC+LaNLJwL8XEqJokCOAoVKCBuXebJ/PyWBChzNM4oA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=neoLYr1Iij8xm/M55sP5Heye7D8o+uxr4MD3KnQHDK6RrU3xuszrZX5zKs7GvH7+H
         I015tkccf+bMN80N6DN3kWZN7DGdMp6ffCGA100PvXTxBsbjrNa17h0sDxOBJHUhDJ
         wmNthrL05Sxn02r9pToKHNgaonWIS9aL8KMeOnoE=
Date:   Wed, 24 Nov 2021 14:53:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Message-ID: <YZ41sPmt5VSLr9Y5@pendragon.ideasonboard.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
 <YV6A5xAWth6dkHor@pendragon.ideasonboard.com>
 <87tuhtmn8u.wl-kuninori.morimoto.gx@renesas.com>
 <87ilxc1ibv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ilxc1ibv.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

Until I can get my ULCB to boot to test this here, I'll try to help you
debug the problem.

On Mon, Nov 01, 2021 at 03:49:24PM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent, again
> 
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

Do you get any error message from the dw-hdmi driver ? In particular,
I'd like to know if the dw_hdmi_parse_dt() function fails. There are
error messages in all error paths but the last one, the following patch
may help debugging the problem.

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..8be3a1042ede 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3209,10 +3209,14 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 	}

 	hdmi->next_bridge = of_drm_find_bridge(remote);
-	of_node_put(remote);
-	if (!hdmi->next_bridge)
+	if (!hdmi->next_bridge) {
+		dev_err(hdmi->dev, "no bridge found for port@%u (%pOF)\n",
+			hdmi->plat_data->output_port, remote);
+		of_node_put(remote);
 		return -EPROBE_DEFER;
+	}

+	of_node_put(remote);
 	return 0;
 }

Is the CONFIG_DRM_DISPLAY_CONNECTOR option enabled in your kernel ?

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

-- 
Regards,

Laurent Pinchart
