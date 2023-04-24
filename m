Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74EDD6ED48F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjDXSia (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 14:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjDXSi3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 14:38:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E498355A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 11:38:27 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pr14y-0006pS-1m; Mon, 24 Apr 2023 20:38:24 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pr14w-00086t-Eg; Mon, 24 Apr 2023 20:38:22 +0200
Date:   Mon, 24 Apr 2023 20:38:22 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 4/5] drm: Add RZ/G2L DU Support
Message-ID: <20230424183822.GA30248@pengutronix.de>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424161024.136316-5-biju.das.jz@bp.renesas.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Apr 24, 2023 at 05:10:23PM +0100, Biju Das wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
> 
> It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> along with 2 RPFs to support the blending of two picture layers and
> raster operations (ROPs).
> 
> The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> alike SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> new file mode 100644
> index 000000000000..af877d0dadc2
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -0,0 +1,716 @@
[...]
> +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> +{
> +	int ret;
> +
> +	/*
> +	 * Guard against double-get, as the function is called from both the
> +	 * .atomic_enable() and .atomic_begin() handlers.
> +	 */
> +	if (rcrtc->initialized)
> +		return 0;
> +
> +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> +	if (ret < 0)
> +		goto error_clock;
> +
> +	ret = reset_control_deassert(rcrtc->rstc);
> +	if (ret < 0)
> +		goto error_reset;
> +
> +	rzg2l_du_crtc_setup(rcrtc);
> +	rcrtc->initialized = true;
> +
> +	return 0;
> +
> +error_reset:
> +	reset_control_assert(rcrtc->rstc);

If deassertion did not succeed, there is no need to assert.
Worse, for shared reset controls this messes up the deassert_count.
You can just drop the reset_control_assert() here.

regards
Philipp
