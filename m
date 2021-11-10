Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D944744BE41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 11:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhKJKIg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 05:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbhKJKIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 05:08:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CCAC061764
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Nov 2021 02:05:48 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkkU1-0000DR-Lh; Wed, 10 Nov 2021 11:05:33 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkkTy-0005Rw-GD; Wed, 10 Nov 2021 11:05:30 +0100
Message-ID: <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 10 Nov 2021 11:05:30 +0100
In-Reply-To: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
         <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
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

On Wed, 2021-11-10 at 08:31 +0000, Biju Das wrote:
[...]
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
> +	int ret;
> +
> +	rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
> +
> +	reset_control_deassert(rstc);
> +
> +	ret = ostm_init(dev->of_node);
> +	if (ret) {
> +		reset_control_assert(rstc);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +	{ .compatible = "renesas,rzg2l-ostm", },
> +	{ }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +	.driver		= {
> +		.name	= "rzg2l_ostm",
> +		.of_match_table = of_match_ptr(ostm_of_table),
> +	},
> +};
> +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> +#endif

I assuming the corresponding reset controller driver is builtin as well.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

