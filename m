Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937284691E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 10:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239853AbhLFJGS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 04:06:18 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42053 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhLFJGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 04:06:18 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B925DE0010;
        Mon,  6 Dec 2021 09:02:43 +0000 (UTC)
Date:   Mon, 6 Dec 2021 10:02:43 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: rzn1: Add new NAND controller
 driver
Message-ID: <20211206100243.463ef310@xps13>
In-Reply-To: <20211201211850.GA3132024@maple.netwinder.org>
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
        <20211126140625.351697-3-miquel.raynal@bootlin.com>
        <20211201211850.GA3132024@maple.netwinder.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ralph,

ralph.siemsen@linaro.org wrote on Wed, 1 Dec 2021 16:18:50 -0500:

> On Fri, Nov 26, 2021 at 03:06:24PM +0100, Miquel Raynal wrote:
> >Introduce Renesas RZ/N1x NAND controller driver which supports:
> >- All ONFI timing modes
> >- Different configurations of its internal ECC controller
> >- On-die (not tested) and software ECC support
> >- Several chips (not tested)
> >- Subpage accesses
> >- DMA and PIO
> >
> >This controller was originally provided by Evatronix before being bought
> >by Cadence.
> >
> >Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> I've given it a try and all seems to be well. Thus:
> Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Great! Thanks for your feedback.

> >+	mtd = nand_to_mtd(chip);
> >+	mtd->dev.parent = nandc->dev;
> >+	if (!mtd->name) {
> >+		dev_err(nandc->dev, "Missing MTD label\n");
> >+		return -EINVAL;
> >+	}  
> 
> Minor item: could the node name be used as a fallback when label is not present?

That's not the policy that we tried to enforce so far because node
names are too generic and define the nand-controller, not the chip
itself. That is something which may evolve if we ever decide to do
things differently at some point but I guess we would need to do that
at MTD level in this case.

Thanks,
Miquèl
