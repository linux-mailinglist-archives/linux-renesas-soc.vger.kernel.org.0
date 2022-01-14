Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9417048E856
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jan 2022 11:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237318AbiANK2P convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jan 2022 05:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbiANK2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 05:28:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4521AC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 02:28:15 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1n8JoZ-0007TH-K0; Fri, 14 Jan 2022 11:28:11 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1n8JoX-0006cp-EB; Fri, 14 Jan 2022 11:28:09 +0100
Message-ID: <936f9c0c1de0fcf485b8f5e7a9e1a07b04d0b040.camel@pengutronix.de>
Subject: Re: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date:   Fri, 14 Jan 2022 11:28:09 +0100
In-Reply-To: <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
         <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, 2022-01-12 at 17:46 +0000, Biju Das wrote:
[...]
> +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
> +{
[...]
> +	dsi->rstc = devm_reset_control_get(dsi->dev, "rst");
[...]
> +	dsi->arstc = devm_reset_control_get(dsi->dev, "arst");
[...]
> +	dsi->prstc = devm_reset_control_get(dsi->dev, "prst");

Please use devm_reset_control_get_exclusive() instead.

regards
Philipp
