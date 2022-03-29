Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351044EA93D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 10:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiC2Ibk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 04:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiC2Ibk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 04:31:40 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F915FB7;
        Tue, 29 Mar 2022 01:29:56 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5424820009;
        Tue, 29 Mar 2022 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648542595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j5GWTy6NIAfg/vAYQJzWg3+aSkvKpg08FMN6BwsyIdY=;
        b=AXg2gqxny4w87SQK9erjxAFYkh/RFuLDxipTe3+6EWjGUN+dyIKGbe/G83jcbB4rS0ZSvO
        zpXP28oG6Ubd83cjuEMuDKvL3dCepdpPTX/1r3xymgqK04Tfu/1XTXnwO/WvCJQoP/hcI6
        Q8tYJrIPhJwfkj6cUWnYvktLV6esnnDsNDGZPA1i95RikWpG0aBrnzdQTyjeN2Y1Nwpb8X
        n2axH402dw66BCE5FVZdX+tuGoFJqH3v9pRxoXGBW59uThnbwOTBh5AyG7rVLjGdIs6aFi
        25XamlamV0adGl9NejIt+woMglIyTi10OTsMieXj628eDdkDTU2jqOmv3PQbSg==
Date:   Tue, 29 Mar 2022 10:29:51 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/10] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <20220329102951.579e154d@xps13>
In-Reply-To: <YjSWM5ilahNBXF1b@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
        <20220317174627.360815-9-miquel.raynal@bootlin.com>
        <YjSWM5ilahNBXF1b@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

andriy.shevchenko@linux.intel.com wrote on Fri, 18 Mar 2022 16:24:51
+0200:

> On Thu, Mar 17, 2022 at 06:46:25PM +0100, Miquel Raynal wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >=20
> > DW based controllers like the one on Renesas RZ/N1 must be programmed as
> > flow controllers when using DMA.
> >=20
> > * Table 11.45 of the system manual, "Flow Control Combinations", states
> >   that using UART with DMA requires setting the DMA in the peripheral
> >   flow controller mode regardless of the direction.
> >=20
> > * Chapter 11.6.1.3 of the system manual, "Basic Interface Definitions",
> >   explains that the burst size in the above case must be configured in
> >   the peripheral's register DEST/SRC_BURST_SIZE.
> >=20
> > Experiments shown that upon Rx timeout, the DMA transaction needed to be
> > manually cleared as well. =20
>=20
> ...
>=20
> > +#define DW_UART_TDMACR	0x10c /* DMA Control Register Transmit Mode */
> > +#define DW_UART_RDMACR	0x110 /* DMA Control Register Receive Mode */ =
=20
>=20
> These are not Synposys ones.

Ok

> ...
>=20
> > +static u32 dw8250_rzn1_get_dmacr_burst(int max_burst)
> > +{
> > +	if (max_burst >=3D 8)
> > +		return DW_UART_xDMACR_8_WORD_BURST;
> > +	else if (max_burst >=3D 4)
> > +		return DW_UART_xDMACR_4_WORD_BURST;
> > +	else
> > +		return DW_UART_xDMACR_1_WORD_BURST;
> > +} =20
>=20
> Redundant 'else' in all cases.

I'm sorry but dropping the else statement here does not make any
sense. I find it much easier to the eyes the current way.

Thanks,
Miqu=C3=A8l
