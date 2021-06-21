Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0853AE219
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 06:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbhFUEPj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 00:15:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhFUEPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 00:15:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0443610A3;
        Mon, 21 Jun 2021 04:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624248805;
        bh=HXX8RkH8FI9Ns0ul+bANhuI1hFDKkHFVq6JZa+s543c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dQeUe2ng/CRGnszcjVcP5VnVquKi4anNuNPV8OtSbugLvxAYMqeISuKScXA4E5iQf
         sYME/dKS68aQFkUmrK85fw7RXdMBTDF/0ihUfD9uYWv7iVyJCfHL2azKfMHAn74Yl4
         8+ouZCnwPfzrOqMxjwxGAGWp2L7ucWi5ozArL/DeLG3wdSmzJ7Ah9VSMhFZStgYrmP
         nxnCc7flftXGRIIg+L/hXI9NUAUKFgJcJe1okz7wJoan3kc4WSCwiuvp1iOJlplnIC
         Pqr4WItvFeWOl+SHqlKbo/bKWhSw1sTUBK+S2+2DCh2eLSxz5UkDRHwcXe2pK/j4se
         5m8eTwtnmqTeA==
Date:   Mon, 21 Jun 2021 09:43:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] phy: renesas: Add RZ/G2L usb phy control driver
Message-ID: <YNAR4XKMLHsdWzbM@vkoul-mobl>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611134642.24029-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11-06-21, 14:46, Biju Das wrote:
> +static int rzg2l_usbphycontrol_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg2l_usbphycontrol_drv *drv;
> +	struct phy_provider *provider;
> +	u32 val;
> +	int n;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev, "device tree not found\n");
> +		return -EINVAL;
> +	}

why do you think this would happen?

> +
> +	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	drv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drv->base))
> +		return PTR_ERR(drv->base);
> +
> +	for (n = 0; n < NUM_PORTS; n++) {
> +		struct rzg2l_phyctrl *phy = &drv->phyctrl[n];
> +
> +		phy->phy = devm_phy_create(dev, NULL, &rzg2l_usbphyctrl_ops);
> +		if (IS_ERR(phy->phy)) {
> +			dev_err(dev, "Failed to create USBPHY Control\n");
> +			return PTR_ERR(phy->phy);
> +		}
> +
> +		if (n == 1)
> +			phy->phy_reset_port_mask = PHY_RESET_PORT2;

this looks inverted, should this logically not be:
                if (n == 0)
                        phy->phy_reset_port_mask = PHY_RESET_PORT1;
?

> +		else
> +			phy->phy_reset_port_mask = PHY_RESET_PORT1;
> +
> +		phy->drv = drv;
> +		phy_set_drvdata(phy->phy, phy);
> +	};
> +
> +	provider = devm_of_phy_provider_register(dev,
> +						 rzg2l_usbphycontrol_xlate);

single line pls

-- 
~Vinod
