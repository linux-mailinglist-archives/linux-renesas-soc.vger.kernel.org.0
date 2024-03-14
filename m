Return-Path: <linux-renesas-soc+bounces-3775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0487BD3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 14:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 984581C20D59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4565A0ED;
	Thu, 14 Mar 2024 13:04:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C25914E;
	Thu, 14 Mar 2024 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421487; cv=none; b=KynuO7N868j3aJcIRmfHhhsTm2b6to0TxW0rNMBM4yN7Dw0J/Xu4kGoQ/S67SGiCjkSMfpe6mJOSBrSyltje67qKRR4ig/ewxp6OpL/iXnhiTG2t6BgZS2NZv+rqhNwXAwBjqtIazPwgGkBJekeU6kCUeJuDXKgSTJ8E4DfzPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421487; c=relaxed/simple;
	bh=oN/Suplky2WREBBkofEnWky69rIUocuFFOuR7GOODqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7zOobOFEIqb50ZBdlTpD4aw4MEl63gpDzMJ/bGIHxJjkjO1wT6OClKD6aP7GwJP00q4oZLn2QrTlJDyuXOZaBb5sKiN1PYwVsfXFkJ9qCmdkruqX2SLPAGcLCsDE8eDAbQ+TX/S87girh6o2GIJmdo24HeGDGQzx1BfMj4Y8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so781847276.1;
        Thu, 14 Mar 2024 06:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710421481; x=1711026281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srIuOcu64Am4aw6QGP73uY2LpO277zav8MQ/JrV7vTI=;
        b=sObJcG2T6orhL4nC1w4vsu2azMfbeLeOYeA+++dKTPVurzZVEJQrSoQrfkzWWpluNm
         eKE5o2uxvf4HEyIm0OXsoYN+su6lo1qR3MxWLw5j8plQPZypkqvjatN+BVgJYTqZV+Qy
         Vqg3TLzr7mMJ+lUdJiD9j2RDexAdj7zMHplyRk0jnHxTXDCBKFe8cfKeXGTVLlKZYg68
         UOozOPq5YLVQ4qpjx/CyC2EbsLkWBNA2kLH56rM4d11AQGOrFswnue3sMf7uD3D4/KGA
         U9nSJERhCX/RaWLU42P88xmz0kjhAZZg3KyTfJi2JNmrUYQ8FP1B1/LHf7pj1Z2+90ul
         TKaw==
X-Forwarded-Encrypted: i=1; AJvYcCUO6f0lfSc4o1bgklj72r6+LWIkr3jdkjSxdo13mabk2BIpSWSs241jXfPBuKtz+4AhSivvi/MpXZnKzffNjoHbXOYXUkSxPleD0T0haTuUz5scd4IxVzbpAStfYKZ6Xls1SPfL/ee9GxaldOC5cY/Z6wIyZ8sb8gu0PzVKIZUvLcBAf9G6aA==
X-Gm-Message-State: AOJu0Yw5FLBtHQbhRq3ZcIFvsWUjU9Cf809qh2WCMAPCX2K0u6j7fHFZ
	VshS4Cz3QVQwFNQxx/37Imno43V9ftriOqaqf2o4taoLgZOkPHeF0+5R1lcS1Ts=
X-Google-Smtp-Source: AGHT+IH7tnqHtUKoKPCU/IS9gaSFZ+3JXmWW9/7hWoaHKJ3LWt8DkQdOgwb6l+HXa7W/ZJmIHfQ3nw==
X-Received: by 2002:a25:3357:0:b0:dd0:bb34:1e77 with SMTP id z84-20020a253357000000b00dd0bb341e77mr1411929ybz.53.1710421481336;
        Thu, 14 Mar 2024 06:04:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id b8-20020a25bb48000000b00dcc620f4139sm239411ybk.14.2024.03.14.06.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:04:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso698044276.2;
        Thu, 14 Mar 2024 06:04:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdtTt2uYQ11yRJxQwSNME3IC9eFMrSVuAV+1eZQW3pvarqJtDlWvRRSBPNNC3RVoA52wZNigvqYGLI/CpAO6Yvamaa4WPf4k54H+eOJHU8+C27ptzztqiMh30YJYJA2xAsr7AkX0mOIOsCmOXf2qsr1PaeaaOxLlWJZ/CK3xtOVsDWr8f5gg==
X-Received: by 2002:a25:ce13:0:b0:dc7:43fe:e124 with SMTP id
 x19-20020a25ce13000000b00dc743fee124mr1577816ybe.11.1710421479845; Thu, 14
 Mar 2024 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
 <20240313181602.156840-4-biju.das.jz@bp.renesas.com> <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
 <OSAPR01MB15874373FDCB149EA67D4BD086292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15874373FDCB149EA67D4BD086292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:04:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOZdJujd7+Tycn144-fqM7a6bsnJ0+82Ndqk69jTTf+w@mail.gmail.com>
Message-ID: <CAMuHMdWOZdJujd7+Tycn144-fqM7a6bsnJ0+82Ndqk69jTTf+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen <huy.nguyen.wh@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Mar 14, 2024 at 1:49=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, Mar 13, 2024 at 7:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > From: Huy Nguyen <huy.nguyen.wh@renesas.com>
> > > The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe buffer=
s
> > > on RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and
> > > use family SoC specific compatible to handle this difference.
> > >
> > > Added SoC specific compatible to OF table toavoid ABI breakage with
> > > old DTB. To optimize memory usage the SoC specific compatible will be
> > > removed later.
> > >
> > > Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/usb/renesas_usbhs/common.c
> > > +++ b/drivers/usb/renesas_usbhs/common.c
> > > @@ -640,8 +656,13 @@ static int usbhs_probe(struct platform_device
> > > *pdev)
> > >
> > >         /* set default param if platform doesn't have */
> > >         if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
> > > -               priv->dparam.pipe_configs =3D usbhsc_new_pipe;
> > > -               priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe=
);
> > > +               if (info->driver_param.pipe_configs) {
> > > +                       priv->dparam.pipe_configs =3D info->driver_pa=
ram.pipe_configs;
> > > +                       priv->dparam.pipe_size =3D info->driver_param=
.pipe_size;
> > > +               } else {
> > > +                       priv->dparam.pipe_configs =3D usbhsc_new_pipe=
;
> > > +                       priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_=
new_pipe);
> > > +               }
> >
> > I think it would be cleaner to populate
> > renesas_usbhs_platform_info.driver_param.pipe_{configs,size} everywhere=
, and use info-
> > >driver_param.pipe_{configs,size} unconditionally.
>
> You mean, drop static and share the usbhsc_rcar_new_pipe[] to {rcar3,rcar=
2,rza,rza2}
> Like [1]??
>
>
> [1]
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usb=
hs/common.h
> index 3fb5bc94dc0d..9dde537c4e2f 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
>
> +extern struct renesas_usbhs_driver_pipe_config usbhsc_rcar_new_pipe[];
> +
> diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbh=
s/rcar2.c
> index 52756fc2ac9c..3117f76ab556 100644
> --- a/drivers/usb/renesas_usbhs/rcar2.c
> +++ b/drivers/usb/renesas_usbhs/rcar2.c
> @@ -69,7 +69,8 @@ const struct renesas_usbhs_platform_info usbhs_rcar_gen=
2_plat_info =3D {
>                 .get_id =3D usbhs_get_id_as_gadget,
>         },
>         .driver_param =3D {
> +               .pipe_configs =3D usbhsc_rcar_new_pipe,
> +               .pipe_size =3D 16,

Yes, something like that.

> > >         } else if (!priv->dparam.pipe_configs) {
> > >                 priv->dparam.pipe_configs =3D usbhsc_default_pipe;
> > >                 priv->dparam.pipe_size =3D
> > > ARRAY_SIZE(usbhsc_default_pipe); diff --git

> > > --- a/drivers/usb/renesas_usbhs/rza2.c
> > > +++ b/drivers/usb/renesas_usbhs/rza2.c
> > > @@ -58,6 +58,36 @@ static int usbhs_rza2_power_ctrl(struct platform_d=
evice *pdev,
> > >         return retval;
> > >  }
> > >
> [1]
> > > +/* commonly used on RZ/G2L family */
> > > +static struct renesas_usbhs_driver_pipe_config usbhsc_rzg2l_pipe[] =
=3D {
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false=
),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x58, true),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x68, true),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
> > > +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x07, false), }=
;
>
> > This is similar (but slightly different) from usbhsc_default_pipe[].
> > Can RZ/G2L work with usbhsc_default_pipe[] instead?  If yes, you could =
just set  .has_new_pipe_configs
> > to zero instead of adding new code/data.
>
> All our customers are using [1] compared to default_pipe[2], from HW manu=
al, I feel [1] is better
> as it involves fewer interrupts. Can we replace [2] with [1]?
>
> The difference is setting double buffer on Isochronous Transfers.
>
> Setting the buffer operating mode enables high-speed data transfers with =
fewer interrupts
> to be performed by using double-buffering and continuous transfer of data=
 packets.

OK.

> Since [1] is better compared to [2], if SH can work with [1], we can
> replace [2] with [1], do we have any SH platform to test this?

I don't have an sh7757lcr or ecovec24 to test. But the risk looks low.

So it looks like a good idea to have two patches:
  1. Improve usbhsc_default_pipe[] for isochronous transfers,
  2. Fix support for RZ/G2L using the default 10-entry pipe.

> [2]
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x18, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x28, true),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x38, true),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x07, false),

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

