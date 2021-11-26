Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8903D45EF64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 14:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349871AbhKZNuF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 08:50:05 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47613 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353482AbhKZNsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 08:48:05 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 916D4E0014;
        Fri, 26 Nov 2021 13:44:48 +0000 (UTC)
Date:   Fri, 26 Nov 2021 14:44:47 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211126144447.4fb300af@xps13>
In-Reply-To: <TYYPR01MB7086AF009C6D6A4440B0CB21F59C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
        <20211118111940.1275351-3-miquel.raynal@bootlin.com>
        <TYYPR01MB7086AF009C6D6A4440B0CB21F59C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

phil.edworthy@renesas.com wrote on Fri, 19 Nov 2021 15:04:55 +0000:

> Hi Miquel,
> 
> Thanks for your patches.
> 
> > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > - All ONFI timing modes
> > - Different configurations of its internal ECC controller
> > - On-die (not tested) and software ECC support
> > - Several chips (not tested)
> > - Subpage accesses
> > - DMA and PIO
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---  
> It might be worth mentioning that this controller was originally provided
> by Evatronix, then Cadence bought the Evatronix IP business.

True I've added this in the commit log as well as the main header.

> > +	rzn1_nand->tim_gen_seq2 =
> > +		TIM_GEN_SEQ2_D8(TO_CYCLES64(sdr->tRR_min + sdr->tREA_max,
> > period_ns)) |
> > +		TIM_GEN_SEQ2_D9(TO_CYCLES64(sdr->tRR_min, period_ns)) |
> > +		TIM_GEN_SEQ2_D10(TO_CYCLES64(cle - cyc, period_ns)) |
> > +		TIM_GEN_SEQ2_D11(TO_CYCLES64(bef_dly, period_ns));  
> In our out-of-tree driver for this controller [1], we allowed time for
> the signal to propagate through the RZ/N1 io buffers; We just added 5ns
> to all the timings. Don't you need to do something similar? I vaguely
> recall that some values programmed to 0 caused issues.

I have not experienced any issues yet, I don't think with these
calculations there are many values set to 0 anyway. But thanks for the
feedback, if anybody reports errors with these timings on another board
then we'll know where to look.

> > +static int rzn1_nand_chip_init(struct rzn1_nfc *nfc, struct device_node  
> ...
> > +	for (i = 0; i < nsels; i++) {
> > +		ret = of_property_read_u32_index(np, "reg", i, &cs);
> > +		if (ret) {
> > +			dev_err(nfc->dev, "Incomplete reg property (%d)\n",
> > +				ret);
> > +			return ret;
> > +		}  
> Check cs is <= nr of bits in assigned_cs.

I believe you mean that I should check that we don't request
non-existing CS values (< 4). I've just added such a check, thanks. The
fact that a CS might be selected twice is handled by the test_and_set()
call right after.

> > +static int rzn1_nfc_probe(struct platform_device *pdev) {  
> ...
> > +	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(nfc->regs))
> > +		return PTR_ERR(nfc->regs);
> > +
> > +	rzn1_nfc_dis_interrupts(nfc);  
> You need to enable the clock before writing to the registers.

Absolutely, thanks for the remainder.

> > +static struct platform_driver rzn1_nfc_driver = {
> > +	.driver = {
> > +		.name   = "renesas-nfc",  
> nit: whitespace
> 
> btw, there was an attempt to upstream a driver for this IP a few years back, see [2]

Didn't know about this attempt :)

> 
> Thanks
> Phil
> 
> [1] https://github.com/renesas-rz/rzn1_linux/blob/rzn1-stable-v4.19/drivers/mtd/nand/raw/evatronix_nand.c
> [2] https://patchwork.ozlabs.org/patch/629096/
> 
> 
> 


Thanks,
Miquèl
