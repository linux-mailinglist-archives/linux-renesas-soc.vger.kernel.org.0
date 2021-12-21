Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C7547BCAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Dec 2021 10:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhLUJQu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Dec 2021 04:16:50 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54765 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhLUJQu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 04:16:50 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5AC5C6000B;
        Tue, 21 Dec 2021 09:16:45 +0000 (UTC)
Date:   Tue, 21 Dec 2021 10:16:44 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v6 3/4] MAINTAINERS: Add an entry for Renesas NAND
 controller
Message-ID: <20211221101644.70bb4fdd@xps13>
In-Reply-To: <Yb0CYpCBFA/bQFjF@kunai>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
        <20211217142033.353599-4-miquel.raynal@bootlin.com>
        <Yb0CYpCBFA/bQFjF@kunai>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

wsa@kernel.org wrote on Fri, 17 Dec 2021 22:34:26 +0100:

> > +RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
> > +M:	Miquel Raynal <miquel.raynal@bootlin.com>
> > +L:	linux-mtd@lists.infradead.org  
> 
> Could you add
> 
> L:      linux-renesas-soc@vger.kernel.org
> 
> as well please?

Sure! I'll add this line when applying.

Thanks for the feedback and for the overall review!

> 
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> > +F:	drivers/mtd/nand/raw/renesas-nand-controller.c  

Cheers,
Miquèl
