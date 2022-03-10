Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A173A4D51AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 20:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236880AbiCJT2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 14:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239797AbiCJT2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 14:28:50 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F82012A91;
        Thu, 10 Mar 2022 11:27:48 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C25D8100007;
        Thu, 10 Mar 2022 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646940466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yz+e4AzgHZWP8a7a3bFwgwlhz7dj0OY6LR+zqVJ1aGI=;
        b=Mfbyee2DeD5+Wb5tpA8TSuwywzx+PIZzXkY1DiYKWC9PEaco9Du3YG0UMqG48PCfpdU57k
        Cybd5xBykBvpWdRhEMswiKc7B2e3VvKQy38VLNQ94TX6FtCrpzhVxd4g05uzZunonoxxCg
        69gSyFw4P+7vVcAYfNAcj0omGeqmgNa9ACIRA2hPuMjcsw5qqd7XmfoX9YDjW1MbAgaPMH
        yyhOb81iDf2hv2zpR+3TI64Eui3lDteF5m65Hx8aL++spAvbxKpXH43YG00sRBAZsSrKVq
        7MOGfiD5/6N0Z+yvt1QH3k+BGWygguEaNTwFBUd5AudkLr/cNxAEdDlWAC4k1w==
Date:   Thu, 10 Mar 2022 20:27:43 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
Message-ID: <20220310202743.1a2bf51d@xps13>
In-Reply-To: <YipCsO+UMcGOqLaG@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
        <20220310161650.289387-7-miquel.raynal@bootlin.com>
        <YipCsO+UMcGOqLaG@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

andriy.shevchenko@linux.intel.com wrote on Thu, 10 Mar 2022 20:25:52
+0200:

> On Thu, Mar 10, 2022 at 05:16:49PM +0100, Miquel Raynal wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >=20
> > The Renesas RZ/N1 devices have a modified Synopsys DW UART. The
> > modifications are mostly related to the DMA handlnig, and so this patch
> > adds support for DMA. =20
>=20
> > The RZ/N1 UART must be used with the peripheral as the flow
> > controller. =20
>=20
> (1)
>=20
> > This means the DMA length should also be programmed into
> > UART registers. =20
>=20
> (2)
>=20
> Hmm... DMA controller vs. Peripheral flow control is about signalling on =
the HW
> level on who starts the transaction. This is programmed in the DMA contro=
ller
> device driver. Is it what you do in DesignWare DMA patch series?
>=20
> Ah, I see now, you set fc here.
>=20
> But still it's not clear how (2) and (1) are related.

Both come from the system manual:
(1) table 11.45 "Flow Control Combinations" states that using UART with
DMA requires setting the DMA in the peripheral flow controller mode
regardless of the direction.
(2) chapter 11.6.1.3 "Basic Interface Definitions" explains that the
burst size in the above case must be configured in the peripheral's
register DEST/SRC_BURST_SIZE.

> > Aside from this, there are some points to note about DMA burst sizes.
> > First, DMA must not remove all of the data from the rx FIFO. Otherwise,
> > we do not get a 'character timeout' interrupt, and so do not know that
> > we should push data up the serial stack. Therefore, we have the rx
> > threshold for generating an interrupt set to half the FIFO depth (this
> > is the default for 16550A), and set the DMA burst size when reading the
> > FIFO to a quarter of the FIFO depth.
> >=20
> > Second, when transmitting data using DMA, the burst size must be limited
> > to 1 byte to handle then case when transmitting just 1 byte. Otherwise
> > the DMA doesn't complete the burst, and nothing happens. =20
>=20
> ...
>=20
> > +/* Offsets for the Renesas RZ/N1 DesignWare specific registers */
> > +/* DMA Software Ack */
> > +#define RZN1_UART_DMASA			0xa8 =20
>=20
> Is it specific to Renesas? IIRC it's Synopsys DesignWare register, makes
> sense to use appropriate prefix or no prefix.

I have no idea, I can use a more common prefix.

>=20
> ...
>=20
> > +#define RZN1_UART_xDMACR_1_WORD_BURST	0
> > +#define RZN1_UART_xDMACR_4_WORD_BURST	BIT(1)
> > +#define RZN1_UART_xDMACR_8_WORD_BURST	(BIT(1) | BIT(2)) =20
>=20
> This looks like incorrect use of BIT() macro.
> Please, use plain decimal integers. Something like
>=20
> 	1	(0 << 1)
> 	4	(1 << 1)
> 	8	(3 << 1)
>=20
> If I'm mistaken, describe the meaning of each bit there.

Matter of taste, I believe, whatever.

>=20
> ...
>=20
> > +static void rzn1_8250_handle_irq(struct uart_port *port, unsigned int =
iir)
> > +{
> > +	struct uart_8250_port *up =3D up_to_u8250p(port);
> > +	struct uart_8250_dma *dma =3D up->dma;
> > +	unsigned char status; =20
>=20
> > +	if (up->dma && dma->rx_running) { =20
>=20
> With
>=20
> 	if (!)up->dma && dma->rx_running))
> 		return;
>=20
> maybe easier to read the rest.
>=20
> > +		status =3D port->serial_in(port, UART_LSR);
> > +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> > +			/* Stop the DMA transfer */
> > +			writel(0, port->membase + RZN1_UART_RDMACR);
> > +			writel(1, port->membase + RZN1_UART_DMASA);
> > +		}
> > +	}
> > +} =20
>=20
> ...
>=20
> > +	if (d->is_rzn1 && ((iir & 0x3f) =3D=3D UART_IIR_RX_TIMEOUT))
> > +		rzn1_8250_handle_irq(p, iir); =20
>=20
> A few years ago it was a discussion about broken timeout on some platforms
> with Synopsys DesignWare UART + DMA. Can it be that this is actually requ=
ired
> for all of them that uses same combination of IPs?

I am not sure because I went through the fix for this issue and for me
there are two different things

>=20
> ...
>=20
> > +static u32 rzn1_get_dmacr_burst(int max_burst)
> > +{ =20
>=20
> > +	u32 val =3D 0; =20
>=20
> Redundant assignment and variable itself. Use return statements directly.
>=20
> > +	if (max_burst >=3D 8)
> > +		val =3D RZN1_UART_xDMACR_8_WORD_BURST;
> > +	else if (max_burst >=3D 4)
> > +		val =3D RZN1_UART_xDMACR_4_WORD_BURST;
> > +	else
> > +		val =3D RZN1_UART_xDMACR_1_WORD_BURST;
> > +
> > +	return val;
> > +} =20
>=20
> ...
>=20
> > +static int rzn1_dw8250_tx_dma(struct uart_8250_port *p)
> > +{
> > +	struct uart_port		*up =3D &p->port;
> > +	struct uart_8250_dma		*dma =3D p->dma;
> > +	struct circ_buf			*xmit =3D &p->port.state->xmit;
> > +	int tx_size;
> > +	u32 val;
> > +
> > +	if (uart_tx_stopped(&p->port) || dma->tx_running ||
> > +	    uart_circ_empty(xmit))
> > +		return 0;
> > +
> > +	tx_size =3D CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE); =
=20
>=20
> > +	writel(0, up->membase + RZN1_UART_TDMACR);
> > +	val =3D rzn1_get_dmacr_burst(dma->txconf.dst_maxburst);
> > +	val |=3D tx_size << RZN1_UART_xDMACR_BLK_SZ_OFFSET;
> > +	val |=3D RZN1_UART_xDMACR_DMA_EN;
> > +	writel(val, up->membase + RZN1_UART_TDMACR); =20
>=20
> Can this be added as a callback to the serial8250_tx_dma()?
> Ditto for Rx counterpart.

Fair enough.

>=20
> > +	return serial8250_tx_dma(p);
> > +} =20
>=20
> ...
>=20
> > +	data->is_rzn1 =3D of_device_is_compatible(dev->of_node, "renesas,rzn1=
-uart"); =20
>=20
> Device property API.

I'm not sure to get what you mean here again. The Information is in the
device tree, the compatible string already gives us what we need, why
would we need a device property? (or perhaps I misunderstand what
"device property API" means)
>=20
> >  	/* Always ask for fixed clock rate from a property. */
> >  	device_property_read_u32(dev, "clock-frequency", &p->uartclk); =20
>=20


Thanks,
Miqu=C3=A8l
