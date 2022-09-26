Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D8B5EAB43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 17:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234666AbiIZPkP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 11:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbiIZPiO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 11:38:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC20217A8B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 07:24:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ocp23-0000p7-Kw; Mon, 26 Sep 2022 16:24:27 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ocp23-0033B4-Gl; Mon, 26 Sep 2022 16:24:26 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ocp21-000BfY-GC; Mon, 26 Sep 2022 16:24:25 +0200
Message-ID: <b63073642723dd3ca188809ad9ba388dd6b91320.camel@pengutronix.de>
Subject: Re: [PATCH RFC 3/8] mfd: Add RZ/G2L MTU3 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 26 Sep 2022 16:24:25 +0200
In-Reply-To: <20220926132114.60396-4-biju.das.jz@bp.renesas.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
         <20220926132114.60396-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mo, 2022-09-26 at 14:21 +0100, Biju Das wrote:
[...]
> +static int rzg2l_mtu3_probe(struct platform_device *pdev)
> +{
> +	struct reset_control *rstc;
> +	struct rzg2l_mtu3 *ddata;
> +	unsigned int i;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ddata->mmio))
> +		return PTR_ERR(ddata->mmio);
> +
> +	rstc = devm_reset_control_get(&pdev->dev, NULL);

Please use

+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

instead.

regards
Philipp
