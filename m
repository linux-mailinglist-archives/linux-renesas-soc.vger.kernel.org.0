Return-Path: <linux-renesas-soc+bounces-11568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D59F7D03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C82161073
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 14:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F25225404;
	Thu, 19 Dec 2024 14:21:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB12253E9;
	Thu, 19 Dec 2024 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618119; cv=none; b=n7yg+33xW7ZQnWzTE7Hs7DZ1Q+aKwX8zQ+igpZMHnhsxE000OcuQciGu0tZQcyG8ZqsyOs8ImA0urW/oVeGYKyYC8J6RTKgIufgfWp2RNoQaKlOAsAgu2RDR9LLVu/AIzSzsTyWiUXehHoR5NyG6Qotl1EDxjoWYSjHKECTKjt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618119; c=relaxed/simple;
	bh=oAzRbb7YrmdSiTLf6SPu16NTqjq1KAHkrHe87NDx4KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nk+uMBcZriW7Yon+naYqRb4xveXpJZnVDYZsxndmyq7dwQgnpf1xDSiwX3DCKct8N4KAVMutZeApl8skiD8sVkouPKaqptoi6qI029JksqA3MvW/P1Of+3oWBg8fVKYmAx67JTZvdp4+imGj1S1NE+67ViDTJfZ7TBGrrCyOgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51619b06a1cso475150e0c.3;
        Thu, 19 Dec 2024 06:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734618115; x=1735222915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWehN1B/7ArJm5ULF2ZMoyhbSHa5jjg3rtdTMM65k7c=;
        b=O05RCvzF20IMQP9aUcyZ0cwUqMyftE9pQNwnAdqslBSSlA3WPZ7HLHpnuRiKNKsHlU
         n0iDFMVpPCV2cbtW70EcGhbpio8kAAJgkMfsTfHAuJG6yFdWhFd1FZ2NcqHqcgyy3I6S
         FF4MUNtiNgUtvGqHP+AdBQy20YMGlgp8gDx88k5+1vieM0FPNbrLg5wqSnDzEHuYisps
         /madGBqbAkv6S3Kmsjclw+qenrVPlrmE4OsHQ7VIuTkKWdS5cySAfdwPMTAGJhAoEg39
         lRTk7VHPJefa7qMOyvKYG86CrvNsK5E3EPpDvrzwL4R1K/gfw0MCh2zzbIVvcVm9IZoZ
         EC/A==
X-Forwarded-Encrypted: i=1; AJvYcCV4AHv4KG9IDFdUfpz0spgxJZjri8WkaM4QLhaUKaJwh60CyhT1QhqtdwtuTqiqLTLvIeywjZ40gsikWoHA@vger.kernel.org, AJvYcCVMINMaKN7z+61FS0F0dL6Vr+yhttuj+Xtx/X9OCC3LzUPkaa+hVdFaqSSh3OytHaCYIJPoiBxsUOz21HEci2HWjJQ=@vger.kernel.org, AJvYcCWe3pSCTlzmwc+GomaGGwDQJYrGQOAcPPVrJigb37mGYLyfHmMJyA8t62GkMxN/O0aJARhBkhd+0YSiQko=@vger.kernel.org, AJvYcCXEI29P4ykRIn/YaifzR/ZPz+z+pSVjr86bVfUY5gQ+nHvNJRq7iSIqk/7Tx7q2x8pdFJmrJlio@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf74rIlWVipwmLoQK19nw7vaey1xioEjCSUtel3XxGwdmGcSJj
	im4mZQKvcy/qGoUsf/EwHe1rsJBjB4kmxWmg80TO8O3RnrBo6QC0CDvIU43X
X-Gm-Gg: ASbGncs3H/Jo9qA9gdrsQqYuKP9MjI/2J+b/SCy1JXzRc7iWoIQEqrRzAdrUd0Z4hXj
	4s3R6DRjxJr9w3ea0/l7M2+GVko90BWlulKnphBREbuycGbTRHxObN0j2jOJuRtXYYJa9mYy+if
	JJNJH1e98pD6BNHvIY1xxUgrFy5O1ZytXykVuTELg3j6Yxi/kRokqEAoVGl7EwRxZCWhWGl/zMD
	D4UEbeXjy5pz0Mrtaa0ZzIuvHf6w/2mbH0m8FSrPyBhl83/7yfeeHqeP/8xivXhduUjTEFOXuFa
	oaPBNMY9c4S5SNpkSlk=
X-Google-Smtp-Source: AGHT+IHewB5RycmIhNsRszFWzXxLrcR0Gh1psfOeCmPDwCae/2eSQMw+rgMOd+ddDXIxYuDCZWheLg==
X-Received: by 2002:a05:6122:250a:b0:516:1106:4c1a with SMTP id 71dfb90a1353d-51a36dc2f19mr6090260e0c.12.1734618114588;
        Thu, 19 Dec 2024 06:21:54 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bea724sm137604e0c.24.2024.12.19.06.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:21:53 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afe2a1849bso473111137.3;
        Thu, 19 Dec 2024 06:21:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ+Ig7Yxkk1foLUGg98y0GXE9M9Sv39q+SAlLLVu8wDEb1VQd8xPz4dwxVAP0uMZ7igeJDZUYl@vger.kernel.org, AJvYcCV1atvkwQySS+GSt73N4PPSGaircZpQF+XII1QW+dci+9FLC5axwnvuEJxGG09ASK49YKj11YyV+nf3r0Q=@vger.kernel.org, AJvYcCV71TR3lChKGP4cQOqhBc+xa09LGvH4ec2wEVhKJHWyuwDIPQCOXFzqt3+V0Y79UCevt7Lamq+mQvE2a4IHlHdISPc=@vger.kernel.org, AJvYcCW5WrUoByh2hkdBOGHriuMCItGo4UamUVGrxd+DdkXfvDO2uwMDJc3FQ1V+rQQuMZfbmUC6cSSOreocdE2X@vger.kernel.org
X-Received: by 2002:a05:6102:c0a:b0:4b0:a67c:5817 with SMTP id
 ada2fe7eead31-4b2ae711c43mr6817076137.5.1734618113507; Thu, 19 Dec 2024
 06:21:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 15:21:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8Sg4heCHuJXnMknXkY3iirjnTvTZ5fPLSN4kZ66dA2Q@mail.gmail.com>
Message-ID: <CAMuHMdX8Sg4heCHuJXnMknXkY3iirjnTvTZ5fPLSN4kZ66dA2Q@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] serial: sh-sci: Do not probe the serial port if
 its slot in sci_ports[] is in use
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org, 
	mka@chromium.org, ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Dec 4, 2024 at 4:58=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> In the sh-sci driver, sci_ports[0] is used by earlycon. If the earlycon i=
s
> still active when sci_probe() is called and the new serial port is suppos=
ed
> to map to sci_ports[0], return -EBUSY to prevent breaking the earlycon.
>
> This situation should occurs in debug scenarios, and users should be
> aware of the potential conflict.
>
> Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -158,6 +158,7 @@ struct sci_port {
>         bool has_rtscts;
>         bool autorts;
>         bool tx_occurred;
> +       bool earlycon;

This is only used in sci_ports[0], so it can be a single global flag,
instead of a flag embedded in each sci_port structure.

>  };
>
>  #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
> @@ -3443,6 +3444,7 @@ static int sci_probe_single(struct platform_device =
*dev,
>  static int sci_probe(struct platform_device *dev)
>  {
>         struct plat_sci_port *p;
> +       struct resource *res;
>         struct sci_port *sp;
>         unsigned int dev_id;
>         int ret;
> @@ -3472,6 +3474,26 @@ static int sci_probe(struct platform_device *dev)
>         }
>
>         sp =3D &sci_ports[dev_id];
> +
> +       /*
> +        * In case:
> +        * - the probed port alias is zero (as the one used by earlycon),=
 and
> +        * - the earlycon is still active (e.g., "earlycon keep_bootcon" =
in
> +        *   bootargs)

This is even true without "keep_bootcon", as nothing ever clears the
sci_port.earlycon flag once it is set.

> +        *
> +        * defer the probe of this serial. This is a debug scenario and t=
he user
> +        * must be aware of it.
> +        *
> +        * Except when the probed port is the same as the earlycon port.
> +        */
> +
> +       res =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENODEV;
> +
> +       if (sp->earlycon && res->start !=3D sp->port.mapbase)
> +               return dev_err_probe(&dev->dev, -EBUSY, "sci_port[0] is u=
sed by earlycon!\n");
> +
>         platform_set_drvdata(dev, sp);
>
>         ret =3D sci_probe_single(dev, dev_id, p, sp);
> @@ -3568,6 +3590,7 @@ static int __init early_console_setup(struct earlyc=
on_device *device,
>         port_cfg.type =3D type;
>         sci_ports[0].cfg =3D &port_cfg;
>         sci_ports[0].params =3D sci_probe_regmap(&port_cfg);
> +       sci_ports[0].earlycon =3D true;
>         port_cfg.scscr =3D sci_serial_in(&sci_ports[0].port, SCSCR);
>         sci_serial_out(&sci_ports[0].port, SCSCR,
>                        SCSCR_RE | SCSCR_TE | port_cfg.scscr);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

