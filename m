Return-Path: <linux-renesas-soc+bounces-10541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DD9CF091
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 16:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F481F2A58C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 15:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0221D63DE;
	Fri, 15 Nov 2024 15:41:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66D1DA23
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685271; cv=none; b=Bu4THrUKoB/E1cYqwpc1qieUlOwoiMD1sCWAfP4N//sSs+RgbrWU92hhP0YQHHD3bvI5tcP2G14cOEUrFyCbPBmpiX/PLXsyCN4BkEnV40gCd8u3EKHTEVz9K958N30leA0iHrKlOSK2jrUKGtWCtKcKymzJb6wlmHPUu76KDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685271; c=relaxed/simple;
	bh=IwcWL9noBhnrXNkKWPZEX0fe61sz3sYzX7u7aAfB4GU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pk9C3Imf6P99x5YoPtin3yqwuAWzvTNNNwqBR9FcfC12IlauYrx1BYPz2UT7ip33/i3Jpg1CKdHryVTjBQWSAiC0/ljXwCiTs9yEB18mVJZfbKbDgEK54fEIFQbicetwqOoE2R3r+k+mv7g2+V2Oh5FEtaWkvsWu0SWdZAPSQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tByR6-00052q-GD; Fri, 15 Nov 2024 16:40:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tByR5-000vi2-1A;
	Fri, 15 Nov 2024 16:40:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tByR5-0008Oe-0r;
	Fri, 15 Nov 2024 16:40:39 +0100
Message-ID: <81e131554a34c7b2f795a904f2b561f3c86e0baf.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/8] serial: sh-sci: Update the suspend/resume support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be, 
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  mturquette@baylibre.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org,  jirislaby@kernel.org, lethal@linux-sh.org,
 g.liakhovetski@gmx.de
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>
Date: Fri, 15 Nov 2024 16:40:39 +0100
In-Reply-To: <20241115134401.3893008-4-claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
	 <20241115134401.3893008-4-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Fr, 2024-11-15 at 15:43 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S supports a power saving mode where power to most of th=
e
> SoC components is turned off. When returning from this power saving mode,
> SoC components need to be re-configured.
>=20
> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
> returning from this power saving mode. The sh-sci code already configures
> the SCIF clocks, power domain and registers by calling uart_resume_port()
> in sci_resume(). On suspend path the SCIF UART ports are suspended
> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
> missing setting is the reset signal. For this assert/de-assert the reset
> signal on driver suspend/resume.
>=20
> In case the no_console_suspend is specified by the user, the registers ne=
ed
> to be saved on suspend path and restore on resume path. To do this the
> sci_console_setup() function was added. There is no need to cache/restore
> the status or FIFO registers. Only the control registers. To differentiat=
e
> b/w these, the struct sci_port_params::regs was updated with a new member
> that specifies if the register needs to be chached on suspend. Only the
> RZ_SCIFA instances were updated with this new support as the hardware for
> the rest of variants was missing for testing.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v3:
> - none
>=20
> Changes in v2:
> - rebased on top of the update version of patch 2/8 from
>   this series
>=20
>  drivers/tty/serial/sh-sci.c | 53 ++++++++++++++++++++++++++++++-------
>  1 file changed, 44 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index ade151ff39d2..e53496d2708e 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -101,7 +101,7 @@ enum SCI_CLKS {
>  		if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
> =20
>  struct plat_sci_reg {
> -	u8 offset, size;
> +	u8 offset, size, suspend_cacheable;
>  };
> =20
>  struct sci_port_params {
> @@ -134,6 +134,8 @@ struct sci_port {
>  	struct dma_chan			*chan_tx;
>  	struct dma_chan			*chan_rx;
> =20
> +	struct reset_control		*rstc;
> +
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>  	struct dma_chan			*chan_tx_saved;
>  	struct dma_chan			*chan_rx_saved;
> @@ -153,6 +155,7 @@ struct sci_port {
>  	int				rx_trigger;
>  	struct timer_list		rx_fifo_timer;
>  	int				rx_fifo_timeout;
> +	unsigned int			console_cached_regs[SCIx_NR_REGS];
>  	u16				hscif_tot;
> =20
>  	bool has_rtscts;
> @@ -298,17 +301,17 @@ static const struct sci_port_params sci_port_params=
[SCIx_NR_REGTYPES] =3D {
>  	 */
>  	[SCIx_RZ_SCIFA_REGTYPE] =3D {
>  		.regs =3D {
> -			[SCSMR]		=3D { 0x00, 16 },
> -			[SCBRR]		=3D { 0x02,  8 },
> -			[SCSCR]		=3D { 0x04, 16 },
> +			[SCSMR]		=3D { 0x00, 16, 1 },
> +			[SCBRR]		=3D { 0x02,  8, 1 },
> +			[SCSCR]		=3D { 0x04, 16, 1 },
>  			[SCxTDR]	=3D { 0x06,  8 },
>  			[SCxSR]		=3D { 0x08, 16 },
>  			[SCxRDR]	=3D { 0x0A,  8 },
> -			[SCFCR]		=3D { 0x0C, 16 },
> +			[SCFCR]		=3D { 0x0C, 16, 1 },
>  			[SCFDR]		=3D { 0x0E, 16 },
> -			[SCSPTR]	=3D { 0x10, 16 },
> +			[SCSPTR]	=3D { 0x10, 16, 1 },
>  			[SCLSR]		=3D { 0x12, 16 },
> -			[SEMR]		=3D { 0x14, 8 },
> +			[SEMR]		=3D { 0x14, 8, 1 },
>  		},
>  		.fifosize =3D 16,
>  		.overrun_reg =3D SCLSR,
> @@ -3380,6 +3383,7 @@ static struct plat_sci_port *sci_parse_dt(struct pl=
atform_device *pdev,
>  	}
> =20
>  	sp =3D &sci_ports[id];
> +	sp->rstc =3D rstc;
>  	*dev_id =3D id;
> =20
>  	p->type =3D SCI_OF_TYPE(data);
> @@ -3507,13 +3511,34 @@ static int sci_probe(struct platform_device *dev)
>  	return 0;
>  }
> =20
> +static void sci_console_setup(struct sci_port *s, bool save)
> +{
> +	for (u16 i =3D 0; i < SCIx_NR_REGS; i++) {
> +		struct uart_port *port =3D &s->port;
> +
> +		if (!s->params->regs[i].suspend_cacheable)
> +			continue;
> +
> +		if (save)
> +			s->console_cached_regs[i] =3D sci_serial_in(port, i);
> +		else
> +			sci_serial_out(port, i, s->console_cached_regs[i]);
> +	}
> +}
> +
>  static __maybe_unused int sci_suspend(struct device *dev)
>  {
>  	struct sci_port *sport =3D dev_get_drvdata(dev);
> =20
> -	if (sport)
> +	if (sport) {
>  		uart_suspend_port(&sci_uart_driver, &sport->port);
> =20
> +		if (!console_suspend_enabled && uart_console(&sport->port))
> +			sci_console_setup(sport, true);
> +		else
> +			return reset_control_assert(sport->rstc);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -3521,8 +3546,18 @@ static __maybe_unused int sci_resume(struct device=
 *dev)
>  {
>  	struct sci_port *sport =3D dev_get_drvdata(dev);
> =20
> -	if (sport)
> +	if (sport) {
> +		if (!console_suspend_enabled && uart_console(&sport->port)) {
> +			sci_console_setup(sport, false);
> +		} else {
> +			int ret =3D reset_control_deassert(sport->rstc);

With this, is the reset_control_deassert() in sci_parse_dt() still
needed?

Likewise, does the reset_control_assert() in sci_suspend() remove the
need for the sci_reset_control_assert() devm action?

regards
Philipp

