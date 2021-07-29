Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDD53D9D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jul 2021 08:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbhG2GN1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jul 2021 02:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbhG2GN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 02:13:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7093BC061757;
        Wed, 28 Jul 2021 23:13:24 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DA65DD;
        Thu, 29 Jul 2021 08:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627539201;
        bh=R3bIRoMJigxo4p2zsGRPWQLBZtNi1OaMwnrZvxXIzUs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UHqT89lFKI8lt1u1fbSbMNICG7xkE54D7Zj4fMddWyWtk/Tg9T8ejBv8h0V+EK8xL
         xe/NaixlcBjGnfIPiZyYd1jskXItHlr1OwDtIMEnxzIcLIAoCgEleWhPDa9x0xLTt8
         rAm01G7OZSjbm/sYvAFyLgxuA7uy0ctxDbKLUPAk=
Subject: Re: [PATCH 1/7] drm/omap: Cast pointer to integer safely
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <69ac4474-3bbf-db72-3777-74c59f947d42@ideasonboard.com>
Date:   Thu, 29 Jul 2021 09:13:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728153736.15240-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28/07/2021 18:37, Laurent Pinchart wrote:
> On 64-bit platforms, the compiler complains that casting a void pointer
> to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
> to fix this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index f86e20578143..c05d3975cb31 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	priv->dss->mgr_ops_priv = priv;
>   
>   	soc = soc_device_match(omapdrm_soc_devices);
> -	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> +	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
>   	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
>   
>   	mutex_init(&priv->list_lock);
> 

Looks fine, although the subject sounds odd. Why was the cast "unsafe" before, and "safe" now?

There's also another bunch of warnings I see:

drivers/gpu/drm/omapdrm/dss/dsi.c: In function ‘dsi_vc_send_long’:
drivers/gpu/drm/omapdrm/dss/dsi.c:7:25: warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has type ‘size_t’ {aka ‘const long unsigned int’} [-Wformat=]
     7 | #define DSS_SUBSYS_NAME "DSI"
       |                         ^~~~~
drivers/gpu/drm/omapdrm/dss/dss.h:30:21: note: in expansion of macro ‘DSS_SUBSYS_NAME’
    30 | #define pr_fmt(fmt) DSS_SUBSYS_NAME ": " fmt
       |                     ^~~~~~~~~~~~~~~
./include/linux/dynamic_debug.h:134:15: note: in expansion of macro ‘pr_fmt’
   134 |   func(&id, ##__VA_ARGS__);  \
       |               ^~~~~~~~~~~
./include/linux/dynamic_debug.h:152:2: note: in expansion of macro ‘__dynamic_func_call’
   152 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
       |  ^~~~~~~~~~~~~~~~~~~
./include/linux/dynamic_debug.h:162:2: note: in expansion of macro ‘_dynamic_func_call’
   162 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
       |  ^~~~~~~~~~~~~~~~~~
./include/linux/printk.h:471:2: note: in expansion of macro ‘dynamic_pr_debug’
   471 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
       |  ^~~~~~~~~~~~~~~~
drivers/gpu/drm/omapdrm/dss/dss.h:36:2: note: in expansion of macro ‘pr_debug’
    36 |  pr_debug(format, ## __VA_ARGS__)
       |  ^~~~~~~~
drivers/gpu/drm/omapdrm/dss/dsi.c:2097:3: note: in expansion of macro ‘DSSDBG’
  2097 |   DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
       |   ^~~~~~
In file included from ./include/linux/printk.h:7,
                  from ./include/linux/kernel.h:19,
                  from drivers/gpu/drm/omapdrm/dss/dsi.c:9:
drivers/gpu/drm/omapdrm/dss/dsi.c: In function ‘dsi_vc_generic_read’:
./include/linux/kern_levels.h:5:18: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has type ‘size_t’ {aka ‘const long unsigned int’} [-Wformat=]
     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
       |                  ^~~~~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro ‘KERN_SOH’
    11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
       |                  ^~~~~~~~
./include/linux/printk.h:390:9: note: in expansion of macro ‘KERN_ERR’
   390 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~~~
drivers/gpu/drm/omapdrm/dss/dss.h:40:2: note: in expansion of macro ‘pr_err’
    40 |  pr_err("omapdss " DSS_SUBSYS_NAME " error: " format, ##__VA_ARGS__)
       |  ^~~~~~
drivers/gpu/drm/omapdrm/dss/dsi.c:2393:2: note: in expansion of macro ‘DSSERR’
  2393 |  DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
       |  ^~~~~~


  Tomi
