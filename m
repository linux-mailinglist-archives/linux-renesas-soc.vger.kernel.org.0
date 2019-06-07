Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFFF139840
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 00:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbfFGWJ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 18:09:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53170 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfFGWJ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 18:09:57 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE2DC334;
        Sat,  8 Jun 2019 00:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559945395;
        bh=ecavjF1sYBhZ1kRTb6ZPoNVpFpUPMOQ7R71824syAMI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sxOIvajC8npDtRDTfPvMf//2YahqAHbMyOLSQdhmN1MeYFlHGpmCynNqVHxXkxcbn
         zKacTRPDZXuXV87icL62waWcYAUGm3pb2PB5vwL07XBVBRkJgooRF0BkLS9uQKTrL2
         p3sX7LWt8IrzhYhgs6arQnZE4PLPcoYk5UwB7Qc4=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 05/10] drm: rcar-du: lvds: Remove LVDS double-enable
 checks
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <49ecf05d-cb25-0d61-b158-da8a43b6706f@ideasonboard.com>
Date:   Fri, 7 Jun 2019 23:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 28/05/2019 15:12, Laurent Pinchart wrote:
> The DRM core and DU driver guarantee that the LVDS bridge will not be
> double-enabled or double-disabled. Remove the corresponding unnecessary
> checks.

I'm glad to hear it - that's quite a few WARN_ON's removed which
hopefully is a good thing!

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 620b51aab291..a331f0c32187 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -63,7 +63,6 @@ struct rcar_lvds {
>  		struct clk *extal;		/* External clock */
>  		struct clk *dotclkin[2];	/* External DU clocks */
>  	} clocks;
> -	bool enabled;
>  
>  	struct drm_display_mode display_mode;
>  	enum rcar_lvds_mode mode;
> @@ -368,15 +367,12 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
>  
>  	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>  
> -	WARN_ON(lvds->enabled);
> -
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
>  		return ret;
>  
>  	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
>  
> -	lvds->enabled = true;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
> @@ -390,13 +386,9 @@ void rcar_lvds_clk_disable(struct drm_bridge *bridge)
>  
>  	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
>  
> -	WARN_ON(!lvds->enabled);
> -
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
>  	clk_disable_unprepare(lvds->clocks.mod);
> -
> -	lvds->enabled = false;
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
>  
> @@ -417,8 +409,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	u32 lvdcr0;
>  	int ret;
>  
> -	WARN_ON(lvds->enabled);
> -
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
>  		return;
> @@ -507,16 +497,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  		drm_panel_prepare(lvds->panel);
>  		drm_panel_enable(lvds->panel);
>  	}
> -
> -	lvds->enabled = true;
>  }
>  
>  static void rcar_lvds_disable(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  
> -	WARN_ON(!lvds->enabled);
> -
>  	if (lvds->panel) {
>  		drm_panel_disable(lvds->panel);
>  		drm_panel_unprepare(lvds->panel);
> @@ -527,8 +513,6 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
>  	clk_disable_unprepare(lvds->clocks.mod);
> -
> -	lvds->enabled = false;
>  }
>  
>  static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> @@ -592,8 +576,6 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  
> -	WARN_ON(lvds->enabled);
> -
>  	lvds->display_mode = *adjusted_mode;
>  
>  	rcar_lvds_get_lvds_mode(lvds);
> @@ -793,7 +775,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  
>  	lvds->dev = &pdev->dev;
>  	lvds->info = of_device_get_match_data(&pdev->dev);
> -	lvds->enabled = false;
>  
>  	ret = rcar_lvds_parse_dt(lvds);
>  	if (ret < 0)
> 

-- 
Regards
--
Kieran
