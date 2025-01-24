Return-Path: <linux-renesas-soc+bounces-12455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12011A1B411
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 11:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 168C316DD35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DABE21CA06;
	Fri, 24 Jan 2025 10:53:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088D21C16F;
	Fri, 24 Jan 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716014; cv=none; b=ma1CGr1M1yhKudg9BYJsw6II1plkixS7ZVladFrDyIv3N3g6OEiyiENptpZ8xoRNiCgci5B5pYomzx8xCYB/E88Tw3fQf7joPBJg4w6rZaVHcD1CbAL80xE74tgb4kXX1s2N0PDbX+/+gwfCxPvlXtIBI4JOm7/UPGfgavpKito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716014; c=relaxed/simple;
	bh=VjppF6DswnHpRm5Fwshs39I9u4i31HrEG7KfmdpY3ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ysa6aaYbvYMgG7gEGnOqme9kDu6oALrU7gV4vvI0G0kKDa1LUpouNArv1kJOvm2hbWl53oBNHDuCkGo5uG8RFCTwnKbJj716nMegqUZ84uyGNk0y+l1/ev+3jKvNshq3XgujmFGPRpzY34jP0yFL2YPhXmNrBCDuAnzZG+sU2f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff31b77e8so708737137.1;
        Fri, 24 Jan 2025 02:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716009; x=1738320809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj4hPdmb2DsaCV9s/+5UOoJx/2EfGrUiMTE4Wn5/cFI=;
        b=PN7SElZUJ+9+1LZq7KFtcjTqTF3hu2WZZHODhbQN0/T/moyqr/tKiHRg2vmXeKvbQ4
         AVAT48m1cuEr95LFk+fIch7GRetfKQyuL6utn61b0HT6EtzJx8gr25UZ6yXJT4ov6ppR
         VgN5gaJ5XvqZO4WGhGHJ+v1mq51+v9MjlsWMrJ6dpjZ2Xx8ZmSGM9oY8+lbatAO+EUlt
         TBdqLzB3pXBAAnQXFcAF1zclxPI8HWmSGSdtHgZDI68emajJpHQEeZYt9blDOEZ51qVJ
         6Sw6x3qE5gN6h+AslzmboEMUjCbulWvgLucAbnRcCqOv+TAqZsIFWYbkifm0CIbzj5B9
         k/MA==
X-Forwarded-Encrypted: i=1; AJvYcCUAssiHeZBBpnBnYD0yBS+EROMusZ4pmEyl4hUdBcTtcH+1D301QRuTxmRIJtxxz2+Hq0pxd/hJuuY1@vger.kernel.org, AJvYcCUoPErBLfXPBtp9yZO3IaPrqd1/UDbO57RpK/dZay9Bwv/lsg+gPlP+01Hj6uGG05Y56cpw+8D8JgOdpLS0D5Fg8+Y=@vger.kernel.org, AJvYcCVHwYIRQoXqCApSXXrHWTpRsgHYqgd1ttq8cfem6aco7/aU9meohqLkW9E7lbsxpYZHdPFrmFCUgo9mYSCF@vger.kernel.org, AJvYcCX5ArFdZFWprXg4U/AYVw9EMDbKm0tPcuU0axMjq3tnvumxhEEcf2VRhlubzZU2oMbgnUreQOErOuwVZ7nV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00y3iR5EsRNsJzHlQ5+jb8vl1PlyxN0LblUUtE7EX3BsfczYJ
	lK9hicsAdQeXmQTN1OCqJ5NwCtrFf4pG504p+oD6qTE4cCPYMcPkRMcSMBbf
X-Gm-Gg: ASbGncujPg7pKShLYlmPpCdOl+uDUdzF+OY11kYvDiWEktY1bxpc1SHbSpIIRGcWnIx
	rzQ63Kx/gRNi94E84+Qk+i14nokmltX+QLLxcdidmwlqnIkPqgSVS00OJtFvMDCPOxAN8utqN/9
	n936JhfaYyOp2ZRJQNhk/MuUjSokN4EXYm3u2ZGCwlx3uMTsSxS4AIb0Itv35oMwoC6MNsFhRqj
	irS2I0VgmeUbEPevxbCeKdhKuZqR9fBk1M1eoC8HVVULYBs0zFj7ZfHZtD3JGQISqoS59Zf+Tm/
	dhwexChYEMaws+Pzl65cn5uTVdqxvOlM0koEDClIU6I=
X-Google-Smtp-Source: AGHT+IGy7IIGvAOxVmxgVnnWZnXFvAz9LnhfozRn1IIB0JRbo8XdjWszdTAiOOuFZHEMk2EOYSiBDg==
X-Received: by 2002:a05:6102:41a6:b0:4b1:1a11:fe3 with SMTP id ada2fe7eead31-4b690bbf701mr24954101137.8.1737716009517;
        Fri, 24 Jan 2025 02:53:29 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c17e31sm334419241.22.2025.01.24.02.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:53:28 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bb264993cso456068241.1;
        Fri, 24 Jan 2025 02:53:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNxsMV+tHRUDXagiYlWTgTFgK/t+uxode7jB9J8C+481D7rRhHPGgplQR2zmuRSKU2jRHxyhYNaSakB1rtinMMMCo=@vger.kernel.org, AJvYcCVZazJ3FbMzZSD3tBZX5fpHqJcEVNkNmQei9u1bsNPrhU3WBqSTprpy+71NX0qfaEeWTIyB0FPtxk6jIidO@vger.kernel.org, AJvYcCWMqmYMLaOw6OmiJpWYPpjTA9O8S/xGnHj2GPg2BW0UHKDO/65iT+eHzkW8lrVyxmDiUH2AoQQXJNz4obZD@vger.kernel.org, AJvYcCWVMvhqZXhbME/Ttv320WgsMcLkv21pKDPzb4qpZX+vbfmhONIqgEt+bjWJwMZ05hzxDIv4kZnCNH0O@vger.kernel.org
X-Received: by 2002:a67:e709:0:b0:4b1:3709:9361 with SMTP id
 ada2fe7eead31-4b690c9a9a4mr30426427137.19.1737716008203; Fri, 24 Jan 2025
 02:53:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com> <20250120130936.1080069-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250120130936.1080069-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 11:53:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYNs2vQTn07Xfx1Misk3Ry5y3PSYPrGbycZdt5LnU_vQ@mail.gmail.com>
X-Gm-Features: AWEUYZktYH6HHl2MnI_8EXdM11D4QvQDVN00Hrl-2t7g2L_TO726A24HCmctLaY
Message-ID: <CAMuHMdWYNs2vQTn07Xfx1Misk3Ry5y3PSYPrGbycZdt5LnU_vQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] serial: sh-sci: Update the suspend/resume support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thanks for your patch!

On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S supports a power saving mode where power to most of th=
e
> SoC components is turned off. When returning from this power saving mode,
> SoC components need to be re-configured.
>
> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
> returning from this power saving mode. The sh-sci code already configures
> the SCIF clocks, power domain and registers by calling uart_resume_port()
> in sci_resume(). On suspend path the SCIF UART ports are suspended
> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
> missing setting is the reset signal. For this assert/de-assert the reset
> signal on driver suspend/resume.
>
> In case the no_console_suspend is specified by the user, the registers ne=
ed
> to be saved on suspend path and restore on resume path. To do this the
> sci_console_setup() function was added. There is no need to cache/restore
> the status or FIFO registers. Only the control registers. To differentiat=
e
> b/w these, the struct sci_port_params::regs was updated with a new member
> that specifies if the register needs to be chached on suspend. Only the

cached

> RZ_SCIFA instances were updated with this new support as the hardware for
> the rest of variants was missing for testing.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -101,7 +101,7 @@ enum SCI_CLKS {
>                 if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
>
>  struct plat_sci_reg {
> -       u8 offset, size;
> +       u8 offset, size, suspend_cacheable;

This increases the size of sci_port_params[] by 300 bytes.
Using bitfields would mitigate that:

    struct plat_sci_reg {
            u16 offset:8;
            u16 size:5;
            u16 suspend_cacheable:1;
    };

(if we ever need more bits, the size member can store an enum value
 instead of the actual size (8 or 16 bits) of the register).

>  };
>
>  struct sci_port_params {
> @@ -134,6 +134,8 @@ struct sci_port {
>         struct dma_chan                 *chan_tx;
>         struct dma_chan                 *chan_rx;
>
> +       struct reset_control            *rstc;
> +
>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>         struct dma_chan                 *chan_tx_saved;
>         struct dma_chan                 *chan_rx_saved;
> @@ -153,6 +155,7 @@ struct sci_port {
>         int                             rx_trigger;
>         struct timer_list               rx_fifo_timer;
>         int                             rx_fifo_timeout;
> +       unsigned int                    console_cached_regs[SCIx_NR_REGS]=
;

u16, as all registers are 8 or 16 bit wide.

We reserve space for 20 registers, but at most 6 will be used.
This has a rather big impact on the size of sci_ports[], as
CONFIG_SERIAL_SH_SCI_NR_UARTS defaults to 18.

Also, this space is used/needed only if:
  - CONFIG_PM_SLEEP=3Dy,
  - CONFIG_SERIAL_CORE_CONSOLE=3Dy (see uart_console()),
  - The port is actually used as a console (unfortunately the user
    can specify multiple console=3DttySC<N> command line parameters, in
    addition to chosen/stdout-path).

>         u16                             hscif_tot;
>
>         bool has_rtscts;
> @@ -300,17 +303,17 @@ static const struct sci_port_params sci_port_params=
[SCIx_NR_REGTYPES] =3D {
>          */
>         [SCIx_RZ_SCIFA_REGTYPE] =3D {
>                 .regs =3D {
> -                       [SCSMR]         =3D { 0x00, 16 },
> -                       [SCBRR]         =3D { 0x02,  8 },
> -                       [SCSCR]         =3D { 0x04, 16 },
> +                       [SCSMR]         =3D { 0x00, 16, 1 },
> +                       [SCBRR]         =3D { 0x02,  8, 1 },
> +                       [SCSCR]         =3D { 0x04, 16, 1 },
>                         [SCxTDR]        =3D { 0x06,  8 },
>                         [SCxSR]         =3D { 0x08, 16 },
>                         [SCxRDR]        =3D { 0x0A,  8 },
> -                       [SCFCR]         =3D { 0x0C, 16 },
> +                       [SCFCR]         =3D { 0x0C, 16, 1 },
>                         [SCFDR]         =3D { 0x0E, 16 },
> -                       [SCSPTR]        =3D { 0x10, 16 },
> +                       [SCSPTR]        =3D { 0x10, 16, 1 },
>                         [SCLSR]         =3D { 0x12, 16 },
> -                       [SEMR]          =3D { 0x14, 8 },
> +                       [SEMR]          =3D { 0x14, 8, 1 },

Note that the driver always writes zero to SEMR.

>                 },
>                 .fifosize =3D 16,
>                 .overrun_reg =3D SCLSR,
> @@ -3374,6 +3377,7 @@ static struct plat_sci_port *sci_parse_dt(struct pl=
atform_device *pdev,
>         }
>
>         sp =3D &sci_ports[id];
> +       sp->rstc =3D rstc;
>         *dev_id =3D id;
>
>         p->type =3D SCI_OF_TYPE(data);
> @@ -3546,13 +3550,34 @@ static int sci_probe(struct platform_device *dev)
>         return 0;
>  }
>
> +static void sci_console_setup(struct sci_port *s, bool save)

sci_console_save_restore()?

> +{
> +       for (u16 i =3D 0; i < SCIx_NR_REGS; i++) {

unsigned int

> +               struct uart_port *port =3D &s->port;
> +
> +               if (!s->params->regs[i].suspend_cacheable)
> +                       continue;
> +
> +               if (save)
> +                       s->console_cached_regs[i] =3D sci_serial_in(port,=
 i);
> +               else
> +                       sci_serial_out(port, i, s->console_cached_regs[i]=
);
> +       }
> +}

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

