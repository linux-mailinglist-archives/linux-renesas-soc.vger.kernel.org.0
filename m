Return-Path: <linux-renesas-soc+bounces-3433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8586FFA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22131C21F4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 10:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635ED374FC;
	Mon,  4 Mar 2024 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hNBiSeJI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DE0374F7;
	Mon,  4 Mar 2024 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549982; cv=none; b=huKa27uI+pRXwtI3h3NYrosUo4SF7eovtA3j5H7I2pJIJqJ4dtKt1lPa4dMyxzFDkpTl4erSXs/197m4XbW7RKWoOOUq6XTktOZRdLYK6lxiUVYHywU3U+0nU8tYtosTMoqb+7bEjO/vSa//q5VgTvpol3HyNni5GxsG+nasfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549982; c=relaxed/simple;
	bh=DCjgu3mhdOfEg3ZB2KNRQUdV33S0rs2tEjcVSzzk7aw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A7zr7JjZMHwgf+hPv2Bb1vSu+ASQvj3Ye6UVRZ6I4gJDUIrUzdKZjHIVC38NurUEjvb2zm+RyAdHA/hbaUPylPmXzwUa7jaRvNKuQNjGogCIfBcKtAsM3p4dZXfeQLyvouiNZoX5aAx44efa+ervgtcw5n3toFk6K7Tva0F79Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hNBiSeJI; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4n4WjzpyANl+xgh5V8kbu/lTE6aWqhl8IGWjstbaQiQ=; t=1709549977; x=1710154777; 
	b=hNBiSeJIhQagKImDaijjEWojSbGpX66a5UjffUXnJ/Pl1+R6lH91oK4qz6uVz6ev40LNR3xiOkH
	YjBNR1zOXRDg5QQO/XEN+Dq6m0YX8SsoRO/eCK0RRH3+idhX0iJObFpOwJL3EuGfPQZMitpNfDV2h
	/pGw0unzRQz+ftyAQhhNXaBal2uKy18IfcUXQFtotvwn94eAT2GxmwyzjurhgbRHR/smleCNFJGH0
	etuf8gBQCpQVQCQiKO14PWb73rdHMmdNZQFdXOZlFcXAVKVsnN1U94kSOLFkamah1+WYl7zGGXVPV
	MKcC+FCLT0JlwMrsZ/kZGjZEgiUXREdMQ7cA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1rh62b-000000019X9-0iJp; Mon, 04 Mar 2024 11:59:29 +0100
Received: from dynamic-077-011-167-239.77.11.pool.telefonica.de ([77.11.167.239] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1rh62a-00000002mSb-3mIX; Mon, 04 Mar 2024 11:59:29 +0100
Message-ID: <dcd874f37b1201171142b53d43cc336c72e5c316.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] serial: sh-sci: Call sci_serial_{in,out}() directly
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sh@vger.kernel.org
Date: Mon, 04 Mar 2024 11:59:28 +0100
In-Reply-To: <51e79d601cb9d9d63822d3773d3cf05a96868612.1709548811.git.geert+renesas@glider.be>
References: 
	<51e79d601cb9d9d63822d3773d3cf05a96868612.1709548811.git.geert+renesas@glider.be>
Autocrypt: addr=glaubitz@physik.fu-berlin.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2024-03-04 at 11:52 +0100, Geert Uytterhoeven wrote:
> Unlike the 8250 serial driver complex, the sh-sci driver uses only a
> single pair of functions to read and write serial port registers.
> Hence there is no need to incur the overhead of calling them through
> indirection, like the serial_port_{in,out}() wrappers do.
>=20
> Replace all calls to these wrappers by direct calls to
> sci_serial_{in,out}().
>=20
> Remove the setup of the uart_port.serial_{in,out}() callbacks.  After
> removal of all calls to serial_port_{in,out}() in the sh-sci driver, the
> only remaining user is uart_xchar_out(), which the sh-sci driver does
> not use.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car Gen2/3, RZ/Five, and SH7751.
> ---
>  drivers/tty/serial/sh-sci.c | 245 ++++++++++++++++++------------------
>  1 file changed, 119 insertions(+), 126 deletions(-)
>=20
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index a85e7b9a2e492391..fd6b941d66266fe8 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -576,13 +576,13 @@ static void sci_start_tx(struct uart_port *port)
> =20
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
> -		u16 new, scr =3D serial_port_in(port, SCSCR);
> +		u16 new, scr =3D sci_serial_in(port, SCSCR);
>  		if (s->chan_tx)
>  			new =3D scr | SCSCR_TDRQE;
>  		else
>  			new =3D scr & ~SCSCR_TDRQE;
>  		if (new !=3D scr)
> -			serial_port_out(port, SCSCR, new);
> +			sci_serial_out(port, SCSCR, new);
>  	}
> =20
>  	if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
> @@ -599,7 +599,7 @@ static void sci_start_tx(struct uart_port *port)
>  	if (!s->chan_tx || s->cfg->regtype =3D=3D SCIx_RZ_SCIFA_REGTYPE ||
>  	    port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
>  		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
> -		ctrl =3D serial_port_in(port, SCSCR);
> +		ctrl =3D sci_serial_in(port, SCSCR);
> =20
>  		/*
>  		 * For SCI, TE (transmit enable) must be set after setting TIE
> @@ -609,7 +609,7 @@ static void sci_start_tx(struct uart_port *port)
>  		if (port->type =3D=3D PORT_SCI)
>  			ctrl |=3D SCSCR_TE;
> =20
> -		serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);
> +		sci_serial_out(port, SCSCR, ctrl | SCSCR_TIE);
>  	}
>  }
> =20
> @@ -618,14 +618,14 @@ static void sci_stop_tx(struct uart_port *port)
>  	unsigned short ctrl;
> =20
>  	/* Clear TIE (Transmit Interrupt Enable) bit in SCSCR */
> -	ctrl =3D serial_port_in(port, SCSCR);
> +	ctrl =3D sci_serial_in(port, SCSCR);
> =20
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB)
>  		ctrl &=3D ~SCSCR_TDRQE;
> =20
>  	ctrl &=3D ~SCSCR_TIE;
> =20
> -	serial_port_out(port, SCSCR, ctrl);
> +	sci_serial_out(port, SCSCR, ctrl);
> =20
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>  	if (to_sci_port(port)->chan_tx &&
> @@ -640,41 +640,40 @@ static void sci_start_rx(struct uart_port *port)
>  {
>  	unsigned short ctrl;
> =20
> -	ctrl =3D serial_port_in(port, SCSCR) | port_rx_irq_mask(port);
> +	ctrl =3D sci_serial_in(port, SCSCR) | port_rx_irq_mask(port);
> =20
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB)
>  		ctrl &=3D ~SCSCR_RDRQE;
> =20
> -	serial_port_out(port, SCSCR, ctrl);
> +	sci_serial_out(port, SCSCR, ctrl);
>  }
> =20
>  static void sci_stop_rx(struct uart_port *port)
>  {
>  	unsigned short ctrl;
> =20
> -	ctrl =3D serial_port_in(port, SCSCR);
> +	ctrl =3D sci_serial_in(port, SCSCR);
> =20
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB)
>  		ctrl &=3D ~SCSCR_RDRQE;
> =20
>  	ctrl &=3D ~port_rx_irq_mask(port);
> =20
> -	serial_port_out(port, SCSCR, ctrl);
> +	sci_serial_out(port, SCSCR, ctrl);
>  }
> =20
>  static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
>  {
>  	if (port->type =3D=3D PORT_SCI) {
>  		/* Just store the mask */
> -		serial_port_out(port, SCxSR, mask);
> +		sci_serial_out(port, SCxSR, mask);
>  	} else if (to_sci_port(port)->params->overrun_mask =3D=3D SCIFA_ORER) {
>  		/* SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 */
>  		/* Only clear the status bits we want to clear */
> -		serial_port_out(port, SCxSR,
> -				serial_port_in(port, SCxSR) & mask);
> +		sci_serial_out(port, SCxSR, sci_serial_in(port, SCxSR) & mask);
>  	} else {
>  		/* Store the mask, clear parity/framing errors */
> -		serial_port_out(port, SCxSR, mask & ~(SCIF_FERC | SCIF_PERC));
> +		sci_serial_out(port, SCxSR, mask & ~(SCIF_FERC | SCIF_PERC));
>  	}
>  }
> =20
> @@ -688,7 +687,7 @@ static int sci_poll_get_char(struct uart_port *port)
>  	int c;
> =20
>  	do {
> -		status =3D serial_port_in(port, SCxSR);
> +		status =3D sci_serial_in(port, SCxSR);
>  		if (status & SCxSR_ERRORS(port)) {
>  			sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
>  			continue;
> @@ -699,10 +698,10 @@ static int sci_poll_get_char(struct uart_port *port=
)
>  	if (!(status & SCxSR_RDxF(port)))
>  		return NO_POLL_CHAR;
> =20
> -	c =3D serial_port_in(port, SCxRDR);
> +	c =3D sci_serial_in(port, SCxRDR);
> =20
>  	/* Dummy read */
> -	serial_port_in(port, SCxSR);
> +	sci_serial_in(port, SCxSR);
>  	sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
> =20
>  	return c;
> @@ -714,10 +713,10 @@ static void sci_poll_put_char(struct uart_port *por=
t, unsigned char c)
>  	unsigned short status;
> =20
>  	do {
> -		status =3D serial_port_in(port, SCxSR);
> +		status =3D sci_serial_in(port, SCxSR);
>  	} while (!(status & SCxSR_TDxE(port)));
> =20
> -	serial_port_out(port, SCxTDR, c);
> +	sci_serial_out(port, SCxTDR, c);
>  	sci_clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
>  }
>  #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
> @@ -736,8 +735,8 @@ static void sci_init_pins(struct uart_port *port, uns=
igned int cflag)
>  	}
> =20
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
> -		u16 data =3D serial_port_in(port, SCPDR);
> -		u16 ctrl =3D serial_port_in(port, SCPCR);
> +		u16 data =3D sci_serial_in(port, SCPDR);
> +		u16 ctrl =3D sci_serial_in(port, SCPCR);
> =20
>  		/* Enable RXD and TXD pin functions */
>  		ctrl &=3D ~(SCPCR_RXDC | SCPCR_TXDC);
> @@ -756,10 +755,10 @@ static void sci_init_pins(struct uart_port *port, u=
nsigned int cflag)
>  			/* Enable CTS# pin function */
>  			ctrl &=3D ~SCPCR_CTSC;
>  		}
> -		serial_port_out(port, SCPDR, data);
> -		serial_port_out(port, SCPCR, ctrl);
> +		sci_serial_out(port, SCPDR, data);
> +		sci_serial_out(port, SCPCR, ctrl);
>  	} else if (sci_getreg(port, SCSPTR)->size) {
> -		u16 status =3D serial_port_in(port, SCSPTR);
> +		u16 status =3D sci_serial_in(port, SCSPTR);
> =20
>  		/* RTS# is always output; and active low, unless autorts */
>  		status |=3D SCSPTR_RTSIO;
> @@ -769,7 +768,7 @@ static void sci_init_pins(struct uart_port *port, uns=
igned int cflag)
>  			status &=3D ~SCSPTR_RTSDT;
>  		/* CTS# and SCK are inputs */
>  		status &=3D ~(SCSPTR_CTSIO | SCSPTR_SCKIO);
> -		serial_port_out(port, SCSPTR, status);
> +		sci_serial_out(port, SCSPTR, status);
>  	}
>  }
> =20
> @@ -781,13 +780,13 @@ static int sci_txfill(struct uart_port *port)
> =20
>  	reg =3D sci_getreg(port, SCTFDR);
>  	if (reg->size)
> -		return serial_port_in(port, SCTFDR) & fifo_mask;
> +		return sci_serial_in(port, SCTFDR) & fifo_mask;
> =20
>  	reg =3D sci_getreg(port, SCFDR);
>  	if (reg->size)
> -		return serial_port_in(port, SCFDR) >> 8;
> +		return sci_serial_in(port, SCFDR) >> 8;
> =20
> -	return !(serial_port_in(port, SCxSR) & SCI_TDRE);
> +	return !(sci_serial_in(port, SCxSR) & SCI_TDRE);
>  }
> =20
>  static int sci_txroom(struct uart_port *port)
> @@ -803,13 +802,13 @@ static int sci_rxfill(struct uart_port *port)
> =20
>  	reg =3D sci_getreg(port, SCRFDR);
>  	if (reg->size)
> -		return serial_port_in(port, SCRFDR) & fifo_mask;
> +		return sci_serial_in(port, SCRFDR) & fifo_mask;
> =20
>  	reg =3D sci_getreg(port, SCFDR);
>  	if (reg->size)
> -		return serial_port_in(port, SCFDR) & fifo_mask;
> +		return sci_serial_in(port, SCFDR) & fifo_mask;
> =20
> -	return (serial_port_in(port, SCxSR) & SCxSR_RDxF(port)) !=3D 0;
> +	return (sci_serial_in(port, SCxSR) & SCxSR_RDxF(port)) !=3D 0;
>  }
> =20
>  /* *********************************************************************=
* *
> @@ -824,14 +823,14 @@ static void sci_transmit_chars(struct uart_port *po=
rt)
>  	unsigned short ctrl;
>  	int count;
> =20
> -	status =3D serial_port_in(port, SCxSR);
> +	status =3D sci_serial_in(port, SCxSR);
>  	if (!(status & SCxSR_TDxE(port))) {
> -		ctrl =3D serial_port_in(port, SCSCR);
> +		ctrl =3D sci_serial_in(port, SCSCR);
>  		if (uart_circ_empty(xmit))
>  			ctrl &=3D ~SCSCR_TIE;
>  		else
>  			ctrl |=3D SCSCR_TIE;
> -		serial_port_out(port, SCSCR, ctrl);
> +		sci_serial_out(port, SCSCR, ctrl);
>  		return;
>  	}
> =20
> @@ -847,15 +846,15 @@ static void sci_transmit_chars(struct uart_port *po=
rt)
>  			c =3D xmit->buf[xmit->tail];
>  			xmit->tail =3D (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
>  		} else if (port->type =3D=3D PORT_SCI && uart_circ_empty(xmit)) {
> -			ctrl =3D serial_port_in(port, SCSCR);
> +			ctrl =3D sci_serial_in(port, SCSCR);
>  			ctrl &=3D ~SCSCR_TE;
> -			serial_port_out(port, SCSCR, ctrl);
> +			sci_serial_out(port, SCSCR, ctrl);
>  			return;
>  		} else {
>  			break;
>  		}
> =20
> -		serial_port_out(port, SCxTDR, c);
> +		sci_serial_out(port, SCxTDR, c);
> =20
>  		port->icount.tx++;
>  	} while (--count > 0);
> @@ -866,10 +865,10 @@ static void sci_transmit_chars(struct uart_port *po=
rt)
>  		uart_write_wakeup(port);
>  	if (uart_circ_empty(xmit)) {
>  		if (port->type =3D=3D PORT_SCI) {
> -			ctrl =3D serial_port_in(port, SCSCR);
> +			ctrl =3D sci_serial_in(port, SCSCR);
>  			ctrl &=3D ~SCSCR_TIE;
>  			ctrl |=3D SCSCR_TEIE;
> -			serial_port_out(port, SCSCR, ctrl);
> +			sci_serial_out(port, SCSCR, ctrl);
>  		}
> =20
>  		sci_stop_tx(port);
> @@ -883,7 +882,7 @@ static void sci_receive_chars(struct uart_port *port)
>  	unsigned short status;
>  	unsigned char flag;
> =20
> -	status =3D serial_port_in(port, SCxSR);
> +	status =3D sci_serial_in(port, SCxSR);
>  	if (!(status & SCxSR_RDxF(port)))
>  		return;
> =20
> @@ -896,7 +895,7 @@ static void sci_receive_chars(struct uart_port *port)
>  			break;
> =20
>  		if (port->type =3D=3D PORT_SCI) {
> -			char c =3D serial_port_in(port, SCxRDR);
> +			char c =3D sci_serial_in(port, SCxRDR);
>  			if (uart_handle_sysrq_char(port, c))
>  				count =3D 0;
>  			else
> @@ -907,11 +906,11 @@ static void sci_receive_chars(struct uart_port *por=
t)
> =20
>  				if (port->type =3D=3D PORT_SCIF ||
>  				    port->type =3D=3D PORT_HSCIF) {
> -					status =3D serial_port_in(port, SCxSR);
> -					c =3D serial_port_in(port, SCxRDR);
> +					status =3D sci_serial_in(port, SCxSR);
> +					c =3D sci_serial_in(port, SCxRDR);
>  				} else {
> -					c =3D serial_port_in(port, SCxRDR);
> -					status =3D serial_port_in(port, SCxSR);
> +					c =3D sci_serial_in(port, SCxRDR);
> +					status =3D sci_serial_in(port, SCxSR);
>  				}
>  				if (uart_handle_sysrq_char(port, c)) {
>  					count--; i--;
> @@ -932,7 +931,7 @@ static void sci_receive_chars(struct uart_port *port)
>  			}
>  		}
> =20
> -		serial_port_in(port, SCxSR); /* dummy read */
> +		sci_serial_in(port, SCxSR); /* dummy read */
>  		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
> =20
>  		copied +=3D count;
> @@ -944,8 +943,8 @@ static void sci_receive_chars(struct uart_port *port)
>  		tty_flip_buffer_push(tport);
>  	} else {
>  		/* TTY buffers full; read from RX reg to prevent lockup */
> -		serial_port_in(port, SCxRDR);
> -		serial_port_in(port, SCxSR); /* dummy read */
> +		sci_serial_in(port, SCxRDR);
> +		sci_serial_in(port, SCxSR); /* dummy read */
>  		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
>  	}
>  }
> @@ -953,7 +952,7 @@ static void sci_receive_chars(struct uart_port *port)
>  static int sci_handle_errors(struct uart_port *port)
>  {
>  	int copied =3D 0;
> -	unsigned short status =3D serial_port_in(port, SCxSR);
> +	unsigned short status =3D sci_serial_in(port, SCxSR);
>  	struct tty_port *tport =3D &port->state->port;
>  	struct sci_port *s =3D to_sci_port(port);
> =20
> @@ -1000,10 +999,10 @@ static int sci_handle_fifo_overrun(struct uart_por=
t *port)
>  	if (!reg->size)
>  		return 0;
> =20
> -	status =3D serial_port_in(port, s->params->overrun_reg);
> +	status =3D sci_serial_in(port, s->params->overrun_reg);
>  	if (status & s->params->overrun_mask) {
>  		status &=3D ~s->params->overrun_mask;
> -		serial_port_out(port, s->params->overrun_reg, status);
> +		sci_serial_out(port, s->params->overrun_reg, status);
> =20
>  		port->icount.overrun++;
> =20
> @@ -1018,7 +1017,7 @@ static int sci_handle_fifo_overrun(struct uart_port=
 *port)
>  static int sci_handle_breaks(struct uart_port *port)
>  {
>  	int copied =3D 0;
> -	unsigned short status =3D serial_port_in(port, SCxSR);
> +	unsigned short status =3D sci_serial_in(port, SCxSR);
>  	struct tty_port *tport =3D &port->state->port;
> =20
>  	if (uart_handle_break(port))
> @@ -1051,7 +1050,7 @@ static int scif_set_rtrg(struct uart_port *port, in=
t rx_trig)
> =20
>  	/* HSCIF can be set to an arbitrary level. */
>  	if (sci_getreg(port, HSRTRGR)->size) {
> -		serial_port_out(port, HSRTRGR, rx_trig);
> +		sci_serial_out(port, HSRTRGR, rx_trig);
>  		return rx_trig;
>  	}
> =20
> @@ -1092,9 +1091,9 @@ static int scif_set_rtrg(struct uart_port *port, in=
t rx_trig)
>  		return 1;
>  	}
> =20
> -	serial_port_out(port, SCFCR,
> -		(serial_port_in(port, SCFCR) &
> -		~(SCFCR_RTRG1 | SCFCR_RTRG0)) | bits);
> +	sci_serial_out(port, SCFCR,
> +		       (sci_serial_in(port, SCFCR) &
> +			~(SCFCR_RTRG1 | SCFCR_RTRG0)) | bits);
> =20
>  	return rx_trig;
>  }
> @@ -1102,9 +1101,9 @@ static int scif_set_rtrg(struct uart_port *port, in=
t rx_trig)
>  static int scif_rtrg_enabled(struct uart_port *port)
>  {
>  	if (sci_getreg(port, HSRTRGR)->size)
> -		return serial_port_in(port, HSRTRGR) !=3D 0;
> +		return sci_serial_in(port, HSRTRGR) !=3D 0;
>  	else
> -		return (serial_port_in(port, SCFCR) &
> +		return (sci_serial_in(port, SCFCR) &
>  			(SCFCR_RTRG0 | SCFCR_RTRG1)) !=3D 0;
>  }
> =20
> @@ -1219,8 +1218,8 @@ static void sci_dma_tx_complete(void *arg)
>  		s->cookie_tx =3D -EINVAL;
>  		if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB ||
>  		    s->cfg->regtype =3D=3D SCIx_RZ_SCIFA_REGTYPE) {
> -			u16 ctrl =3D serial_port_in(port, SCSCR);
> -			serial_port_out(port, SCSCR, ctrl & ~SCSCR_TIE);
> +			u16 ctrl =3D sci_serial_in(port, SCSCR);
> +			sci_serial_out(port, SCSCR, ctrl & ~SCSCR_TIE);
>  			if (s->cfg->regtype =3D=3D SCIx_RZ_SCIFA_REGTYPE) {
>  				/* Switch irq from DMA to SCIF */
>  				dmaengine_pause(s->chan_tx_saved);
> @@ -1296,7 +1295,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port=
 *s)
>  	u16 scr;
> =20
>  	/* Direct new serial port interrupts back to CPU */
> -	scr =3D serial_port_in(port, SCSCR);
> +	scr =3D sci_serial_in(port, SCSCR);
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB ||
>  	    s->cfg->regtype =3D=3D SCIx_RZ_SCIFA_REGTYPE) {
>  		enable_irq(s->irqs[SCIx_RXI_IRQ]);
> @@ -1305,7 +1304,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port=
 *s)
>  		else
>  			scr &=3D ~SCSCR_RDRQE;
>  	}
> -	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
> +	sci_serial_out(port, SCSCR, scr | SCSCR_RIE);
>  }
> =20
>  static void sci_dma_rx_complete(void *arg)
> @@ -1714,8 +1713,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *=
ptr)
> =20
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>  	if (s->chan_rx) {
> -		u16 scr =3D serial_port_in(port, SCSCR);
> -		u16 ssr =3D serial_port_in(port, SCxSR);
> +		u16 scr =3D sci_serial_in(port, SCSCR);
> +		u16 ssr =3D sci_serial_in(port, SCxSR);
> =20
>  		/* Disable future Rx interrupts */
>  		if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB ||
> @@ -1733,10 +1732,10 @@ static irqreturn_t sci_rx_interrupt(int irq, void=
 *ptr)
> =20
>  			scr &=3D ~SCSCR_RIE;
>  		}
> -		serial_port_out(port, SCSCR, scr);
> +		sci_serial_out(port, SCSCR, scr);
>  		/* Clear current interrupt */
> -		serial_port_out(port, SCxSR,
> -				ssr & ~(SCIF_DR | SCxSR_RDxF(port)));
> +		sci_serial_out(port, SCxSR,
> +			       ssr & ~(SCIF_DR | SCxSR_RDxF(port)));
>  		dev_dbg(port->dev, "Rx IRQ %lu: setup t-out in %u us\n",
>  			jiffies, s->rx_timeout);
>  		start_hrtimer_us(&s->rx_timer, s->rx_timeout);
> @@ -1786,9 +1785,9 @@ static irqreturn_t sci_tx_end_interrupt(int irq, vo=
id *ptr)
>  		return sci_tx_interrupt(irq, ptr);
> =20
>  	uart_port_lock_irqsave(port, &flags);
> -	ctrl =3D serial_port_in(port, SCSCR);
> +	ctrl =3D sci_serial_in(port, SCSCR);
>  	ctrl &=3D ~(SCSCR_TE | SCSCR_TEIE);
> -	serial_port_out(port, SCSCR, ctrl);
> +	sci_serial_out(port, SCSCR, ctrl);
>  	uart_port_unlock_irqrestore(port, flags);
> =20
>  	return IRQ_HANDLED;
> @@ -1802,7 +1801,7 @@ static irqreturn_t sci_br_interrupt(int irq, void *=
ptr)
>  	sci_handle_breaks(port);
> =20
>  	/* drop invalid character received before break was detected */
> -	serial_port_in(port, SCxRDR);
> +	sci_serial_in(port, SCxRDR);
> =20
>  	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
> =20
> @@ -1816,7 +1815,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *=
ptr)
> =20
>  	if (s->irqs[SCIx_ERI_IRQ] =3D=3D s->irqs[SCIx_BRI_IRQ]) {
>  		/* Break and Error interrupts are muxed */
> -		unsigned short ssr_status =3D serial_port_in(port, SCxSR);
> +		unsigned short ssr_status =3D sci_serial_in(port, SCxSR);
> =20
>  		/* Break Interrupt */
>  		if (ssr_status & SCxSR_BRK(port))
> @@ -1831,7 +1830,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *=
ptr)
>  	if (port->type =3D=3D PORT_SCI) {
>  		if (sci_handle_errors(port)) {
>  			/* discard character in rx buffer */
> -			serial_port_in(port, SCxSR);
> +			sci_serial_in(port, SCxSR);
>  			sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
>  		}
>  	} else {
> @@ -1856,12 +1855,12 @@ static irqreturn_t sci_mpxed_interrupt(int irq, v=
oid *ptr)
>  	struct sci_port *s =3D to_sci_port(port);
>  	irqreturn_t ret =3D IRQ_NONE;
> =20
> -	ssr_status =3D serial_port_in(port, SCxSR);
> -	scr_status =3D serial_port_in(port, SCSCR);
> +	ssr_status =3D sci_serial_in(port, SCxSR);
> +	scr_status =3D sci_serial_in(port, SCSCR);
>  	if (s->params->overrun_reg =3D=3D SCxSR)
>  		orer_status =3D ssr_status;
>  	else if (sci_getreg(port, s->params->overrun_reg)->size)
> -		orer_status =3D serial_port_in(port, s->params->overrun_reg);
> +		orer_status =3D sci_serial_in(port, s->params->overrun_reg);
> =20
>  	err_enabled =3D scr_status & port_rx_irq_mask(port);
> =20
> @@ -2038,7 +2037,7 @@ static void sci_free_irq(struct sci_port *port)
> =20
>  static unsigned int sci_tx_empty(struct uart_port *port)
>  {
> -	unsigned short status =3D serial_port_in(port, SCxSR);
> +	unsigned short status =3D sci_serial_in(port, SCxSR);
>  	unsigned short in_tx_fifo =3D sci_txfill(port);
> =20
>  	return (status & SCxSR_TEND(port)) && !in_tx_fifo ? TIOCSER_TEMT : 0;
> @@ -2047,27 +2046,27 @@ static unsigned int sci_tx_empty(struct uart_port=
 *port)
>  static void sci_set_rts(struct uart_port *port, bool state)
>  {
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
> -		u16 data =3D serial_port_in(port, SCPDR);
> +		u16 data =3D sci_serial_in(port, SCPDR);
> =20
>  		/* Active low */
>  		if (state)
>  			data &=3D ~SCPDR_RTSD;
>  		else
>  			data |=3D SCPDR_RTSD;
> -		serial_port_out(port, SCPDR, data);
> +		sci_serial_out(port, SCPDR, data);
> =20
>  		/* RTS# is output */
> -		serial_port_out(port, SCPCR,
> -				serial_port_in(port, SCPCR) | SCPCR_RTSC);
> +		sci_serial_out(port, SCPCR,
> +			       sci_serial_in(port, SCPCR) | SCPCR_RTSC);
>  	} else if (sci_getreg(port, SCSPTR)->size) {
> -		u16 ctrl =3D serial_port_in(port, SCSPTR);
> +		u16 ctrl =3D sci_serial_in(port, SCSPTR);
> =20
>  		/* Active low */
>  		if (state)
>  			ctrl &=3D ~SCSPTR_RTSDT;
>  		else
>  			ctrl |=3D SCSPTR_RTSDT;
> -		serial_port_out(port, SCSPTR, ctrl);
> +		sci_serial_out(port, SCSPTR, ctrl);
>  	}
>  }
> =20
> @@ -2075,10 +2074,10 @@ static bool sci_get_cts(struct uart_port *port)
>  {
>  	if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
>  		/* Active low */
> -		return !(serial_port_in(port, SCPDR) & SCPDR_CTSD);
> +		return !(sci_serial_in(port, SCPDR) & SCPDR_CTSD);
>  	} else if (sci_getreg(port, SCSPTR)->size) {
>  		/* Active low */
> -		return !(serial_port_in(port, SCSPTR) & SCSPTR_CTSDT);
> +		return !(sci_serial_in(port, SCSPTR) & SCSPTR_CTSDT);
>  	}
> =20
>  	return true;
> @@ -2108,9 +2107,8 @@ static void sci_set_mctrl(struct uart_port *port, u=
nsigned int mctrl)
>  		 */
>  		reg =3D sci_getreg(port, SCFCR);
>  		if (reg->size)
> -			serial_port_out(port, SCFCR,
> -					serial_port_in(port, SCFCR) |
> -					SCFCR_LOOP);
> +			sci_serial_out(port, SCFCR,
> +				       sci_serial_in(port, SCFCR) | SCFCR_LOOP);
>  	}
> =20
>  	mctrl_gpio_set(s->gpios, mctrl);
> @@ -2120,21 +2118,21 @@ static void sci_set_mctrl(struct uart_port *port,=
 unsigned int mctrl)
> =20
>  	if (!(mctrl & TIOCM_RTS)) {
>  		/* Disable Auto RTS */
> -		serial_port_out(port, SCFCR,
> -				serial_port_in(port, SCFCR) & ~SCFCR_MCE);
> +		sci_serial_out(port, SCFCR,
> +			       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
> =20
>  		/* Clear RTS */
>  		sci_set_rts(port, 0);
>  	} else if (s->autorts) {
>  		if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB) {
>  			/* Enable RTS# pin function */
> -			serial_port_out(port, SCPCR,
> -				serial_port_in(port, SCPCR) & ~SCPCR_RTSC);
> +			sci_serial_out(port, SCPCR,
> +				sci_serial_in(port, SCPCR) & ~SCPCR_RTSC);
>  		}
> =20
>  		/* Enable Auto RTS */
> -		serial_port_out(port, SCFCR,
> -				serial_port_in(port, SCFCR) | SCFCR_MCE);
> +		sci_serial_out(port, SCFCR,
> +			       sci_serial_in(port, SCFCR) | SCFCR_MCE);
>  	} else {
>  		/* Set RTS */
>  		sci_set_rts(port, 1);
> @@ -2187,8 +2185,8 @@ static void sci_break_ctl(struct uart_port *port, i=
nt break_state)
>  	}
> =20
>  	uart_port_lock_irqsave(port, &flags);
> -	scsptr =3D serial_port_in(port, SCSPTR);
> -	scscr =3D serial_port_in(port, SCSCR);
> +	scsptr =3D sci_serial_in(port, SCSPTR);
> +	scscr =3D sci_serial_in(port, SCSCR);
> =20
>  	if (break_state =3D=3D -1) {
>  		scsptr =3D (scsptr | SCSPTR_SPB2IO) & ~SCSPTR_SPB2DT;
> @@ -2198,8 +2196,8 @@ static void sci_break_ctl(struct uart_port *port, i=
nt break_state)
>  		scscr |=3D SCSCR_TE;
>  	}
> =20
> -	serial_port_out(port, SCSPTR, scsptr);
> -	serial_port_out(port, SCSCR, scscr);
> +	sci_serial_out(port, SCSPTR, scsptr);
> +	sci_serial_out(port, SCSCR, scscr);
>  	uart_port_unlock_irqrestore(port, flags);
>  }
> =20
> @@ -2239,9 +2237,9 @@ static void sci_shutdown(struct uart_port *port)
>  	 * Stop RX and TX, disable related interrupts, keep clock source
>  	 * and HSCIF TOT bits
>  	 */
> -	scr =3D serial_port_in(port, SCSCR);
> -	serial_port_out(port, SCSCR, scr &
> -			(SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
> +	scr =3D sci_serial_in(port, SCSCR);
> +	sci_serial_out(port, SCSCR,
> +		       scr & (SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
>  	uart_port_unlock_irqrestore(port, flags);
> =20
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
> @@ -2390,19 +2388,19 @@ static void sci_reset(struct uart_port *port)
>  	unsigned int status;
>  	struct sci_port *s =3D to_sci_port(port);
> =20
> -	serial_port_out(port, SCSCR, s->hscif_tot);	/* TE=3D0, RE=3D0, CKE1=3D0=
 */
> +	sci_serial_out(port, SCSCR, s->hscif_tot);	/* TE=3D0, RE=3D0, CKE1=3D0 =
*/
> =20
>  	reg =3D sci_getreg(port, SCFCR);
>  	if (reg->size)
> -		serial_port_out(port, SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> +		sci_serial_out(port, SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> =20
>  	sci_clear_SCxSR(port,
>  			SCxSR_RDxF_CLEAR(port) & SCxSR_ERROR_CLEAR(port) &
>  			SCxSR_BREAK_CLEAR(port));
>  	if (sci_getreg(port, SCLSR)->size) {
> -		status =3D serial_port_in(port, SCLSR);
> +		status =3D sci_serial_in(port, SCLSR);
>  		status &=3D ~(SCLSR_TO | SCLSR_ORER);
> -		serial_port_out(port, SCLSR, status);
> +		sci_serial_out(port, SCLSR, status);
>  	}
> =20
>  	if (s->rx_trigger > 1) {
> @@ -2540,8 +2538,8 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  	 * It controls the mux to select (H)SCK or frequency divided clock.
>  	 */
>  	if (best_clk >=3D 0 && sci_getreg(port, SCCKS)->size) {
> -		serial_port_out(port, SCDL, dl);
> -		serial_port_out(port, SCCKS, sccks);
> +		sci_serial_out(port, SCDL, dl);
> +		sci_serial_out(port, SCCKS, sccks);
>  	}
> =20
>  	uart_port_lock_irqsave(port, &flags);
> @@ -2554,7 +2552,7 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  	bits =3D tty_get_frame_size(termios->c_cflag);
> =20
>  	if (sci_getreg(port, SEMR)->size)
> -		serial_port_out(port, SEMR, 0);
> +		sci_serial_out(port, SEMR, 0);
> =20
>  	if (best_clk >=3D 0) {
>  		if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB)
> @@ -2569,9 +2567,9 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  			case 27: smr_val |=3D SCSMR_SRC_27; break;
>  			}
>  		smr_val |=3D cks;
> -		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
> -		serial_port_out(port, SCSMR, smr_val);
> -		serial_port_out(port, SCBRR, brr);
> +		sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
> +		sci_serial_out(port, SCSMR, smr_val);
> +		sci_serial_out(port, SCBRR, brr);
>  		if (sci_getreg(port, HSSRR)->size) {
>  			unsigned int hssrr =3D srr | HSCIF_SRE;
>  			/* Calculate deviation from intended rate at the
> @@ -2593,7 +2591,7 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  					 HSCIF_SRHP_MASK;
>  				hssrr |=3D HSCIF_SRDE;
>  			}
> -			serial_port_out(port, HSSRR, hssrr);
> +			sci_serial_out(port, HSSRR, hssrr);
>  		}
> =20
>  		/* Wait one bit interval */
> @@ -2601,10 +2599,10 @@ static void sci_set_termios(struct uart_port *por=
t, struct ktermios *termios,
>  	} else {
>  		/* Don't touch the bit rate configuration */
>  		scr_val =3D s->cfg->scscr & (SCSCR_CKE1 | SCSCR_CKE0);
> -		smr_val |=3D serial_port_in(port, SCSMR) &
> +		smr_val |=3D sci_serial_in(port, SCSMR) &
>  			   (SCSMR_CKEDG | SCSMR_SRC_MASK | SCSMR_CKS);
> -		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
> -		serial_port_out(port, SCSMR, smr_val);
> +		sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
> +		sci_serial_out(port, SCSMR, smr_val);
>  	}
> =20
>  	sci_init_pins(port, termios->c_cflag);
> @@ -2613,7 +2611,7 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  	s->autorts =3D false;
>  	reg =3D sci_getreg(port, SCFCR);
>  	if (reg->size) {
> -		unsigned short ctrl =3D serial_port_in(port, SCFCR);
> +		unsigned short ctrl =3D sci_serial_in(port, SCFCR);
> =20
>  		if ((port->flags & UPF_HARD_FLOW) &&
>  		    (termios->c_cflag & CRTSCTS)) {
> @@ -2630,7 +2628,7 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  		 */
>  		ctrl &=3D ~(SCFCR_RFRST | SCFCR_TFRST);
> =20
> -		serial_port_out(port, SCFCR, ctrl);
> +		sci_serial_out(port, SCFCR, ctrl);
>  	}
>  	if (port->flags & UPF_HARD_FLOW) {
>  		/* Refresh (Auto) RTS */
> @@ -2645,7 +2643,7 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>  	if (port->type !=3D PORT_SCI)
>  		scr_val |=3D SCSCR_TE;
>  	scr_val |=3D SCSCR_RE | (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
> -	serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
> +	sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
>  	if ((srr + 1 =3D=3D 5) &&
>  	    (port->type =3D=3D PORT_SCIFA || port->type =3D=3D PORT_SCIFB)) {
>  		/*
> @@ -3017,9 +3015,6 @@ static int sci_init_single(struct platform_device *=
dev,
>  	port->irq		=3D sci_port->irqs[SCIx_RXI_IRQ];
>  	port->irqflags		=3D 0;
> =20
> -	port->serial_in		=3D sci_serial_in;
> -	port->serial_out	=3D sci_serial_out;
> -
>  	return 0;
>  }
> =20
> @@ -3056,21 +3051,21 @@ static void serial_console_write(struct console *=
co, const char *s,
>  		uart_port_lock_irqsave(port, &flags);
> =20
>  	/* first save SCSCR then disable interrupts, keep clock source */
> -	ctrl =3D serial_port_in(port, SCSCR);
> +	ctrl =3D sci_serial_in(port, SCSCR);
>  	ctrl_temp =3D SCSCR_RE | SCSCR_TE |
>  		    (sci_port->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0)) |
>  		    (ctrl & (SCSCR_CKE1 | SCSCR_CKE0));
> -	serial_port_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
> +	sci_serial_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
> =20
>  	uart_console_write(port, s, count, serial_console_putchar);
> =20
>  	/* wait until fifo is empty and last bit has been transmitted */
>  	bits =3D SCxSR_TDxE(port) | SCxSR_TEND(port);
> -	while ((serial_port_in(port, SCxSR) & bits) !=3D bits)
> +	while ((sci_serial_in(port, SCxSR) & bits) !=3D bits)
>  		cpu_relax();
> =20
>  	/* restore the SCSCR */
> -	serial_port_out(port, SCSCR, ctrl);
> +	sci_serial_out(port, SCSCR, ctrl);
> =20
>  	if (locked)
>  		uart_port_unlock_irqrestore(port, flags);
> @@ -3503,8 +3498,6 @@ static int __init early_console_setup(struct earlyc=
on_device *device,
>  	if (!device->port.membase)
>  		return -ENODEV;
> =20
> -	device->port.serial_in =3D sci_serial_in;
> -	device->port.serial_out	=3D sci_serial_out;
>  	device->port.type =3D type;
>  	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
>  	port_cfg.type =3D type;

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

