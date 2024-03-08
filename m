Return-Path: <linux-renesas-soc+bounces-3617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119F876B46
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 20:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2BD28191A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4189B5A4CD;
	Fri,  8 Mar 2024 19:40:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AA5916F;
	Fri,  8 Mar 2024 19:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709926800; cv=none; b=h8MmgMgiX8ewhKN8hulCrBdcWcvbd7fFJn267x2J7Jn2aR44NBbMpmf9HuCwxkzHJjUjc+RRgrRF294sHkMQR4Fcl7uZHJiZ4pq938IKABIqMy3Hyv54ty+tvAV95bLTjHGSz5d9TS2j31k885a1xOSLEmKBMb1iExeokMMA0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709926800; c=relaxed/simple;
	bh=UkXlsPEwVQjJD2YwrrEfOEQVcEppt4qQgMtCoq33INk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/KRMLh6F6AcQyWsZVxh7j9WpiyBNecK6QwtJxaSeAGhVqqltMvRAi76TkR46eNvjO3nWAMSnVbnIoooIUU41VXzOGslwFjs3iPN8vdAVAWgo+9XXa/U2APndTQ2VwUuALfTZNhfubuVIhtXWIkCdnsB4VVxbJ0sOnETYtYKsK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1476022276.2;
        Fri, 08 Mar 2024 11:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709926796; x=1710531596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxG71Cp+K18IWjPzMWn9MfzDgajo6y/DgQyC/QJvD8A=;
        b=SHQh4pXJr4yTwvFFyH6+WufcyqHuRaI2TvUba0s1X1mS86xPL4vFDClq8rz4WgLQ2q
         3rOqbIhj3xD7hQtB2kmMICxkQ17wrBo76BHeFQGOXO0jdVOvKDfkNi99bvZmwJVpODYE
         hWjWEZVIVfiaDUke3wZXYGFy6hqn/OQz/zlTJJoviRRGTX+iXlMkuyh9FnB5OZi6EHS+
         R3BYSOGw+TGSqq8YPGaNtfXM+nmNYaroBTDXSGbC0vPxkPVEMrKrpUXvtQNTHvaUhTKz
         ys+Na6q+LxykSF+JV9WEqCIGgsAO3GA/V0gPhybE7Koz4VmcP5yP9tK4Pcn25PuUWAEF
         LpqA==
X-Forwarded-Encrypted: i=1; AJvYcCV/t+GGakmLZk4zVY2VxlyrCsdyOrhZKxSx09961lVpYBySlCJ00gHy5Y0aGOKfrDjS7hh9fiKZkSoptRVHD+SKCwRnJv6UjhUQeN3yzBGxVw20HX7k2wcziTrYRqt5x9eGrgz0oGtDDsm809Q=
X-Gm-Message-State: AOJu0Yw2JRs4P4FPgUkREEM8tVGddBEWh0x9x7ETiUrG6VDwk9rU5aWR
	cNJ/grthuv/riYRh6QeRRIzlEa77Zp8uplH0dWg1fj35M3/6q8fpOFh/PV5ZzkY=
X-Google-Smtp-Source: AGHT+IG94/+7MdDdNV1+C45bDZmug2bnMMFVwVLZKvlZIb6vsR8v563gMo6L7Xhmwfb8JD2n1Dbw/w==
X-Received: by 2002:a25:810b:0:b0:dc6:e75d:d828 with SMTP id o11-20020a25810b000000b00dc6e75dd828mr18216808ybk.18.1709926794839;
        Fri, 08 Mar 2024 11:39:54 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id d28-20020a25361c000000b00dcc7b9115fcsm7505yba.3.2024.03.08.11.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 11:39:54 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609eb2cbeccso11390517b3.2;
        Fri, 08 Mar 2024 11:39:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEv4VaiTiycrLLrRvbggtn4r4fG9EGWELJledv+cu3p/4Kcarc1C8BlyFy83nwMyAmaVZrheDGGkm4TZurA6D9u2ESUcmkkknCqO/u5Xzt7N6K+Ep2YqcjU+VZpmfwJBVNkBiNXZf3VKi/pro=
X-Received: by 2002:a0d:db42:0:b0:609:ef6f:1207 with SMTP id
 d63-20020a0ddb42000000b00609ef6f1207mr209413ywe.5.1709926793412; Fri, 08 Mar
 2024 11:39:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com> <20240308180919.6603-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240308180919.6603-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Mar 2024 20:39:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3VFc7Njn9Cbxu6k62S7yXX8f3Z3avF6RqhEVBPm7h3Q@mail.gmail.com>
Message-ID: <CAMuHMdX3VFc7Njn9Cbxu6k62S7yXX8f3Z3avF6RqhEVBPm7h3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: renesas_usbhs: Update usbhs pipe configuration
 for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen <huy.nguyen.wh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Mar 8, 2024 at 7:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> From: Huy Nguyen <huy.nguyen.wh@renesas.com>
>
> The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe
> buffers on RZ/A2M. Update the pipe configuration for RZ/G2L family
> SoCs. For the backward compatibility SoC specific compatible is used
> and will remove the same after few kernel releases.
>
> Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -397,6 +397,20 @@ static struct renesas_usbhs_driver_pipe_config usbhs=
c_new_pipe[] =3D {
>         RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0xd8, true),
>  };
>
> +/* commonly used on RZ/G2L family */
> +static struct renesas_usbhs_driver_pipe_config usbhsc_rzg2l_pipe[] =3D {
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x58, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x68, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x07, false),
> +};
> +
>  /*
>   *             power control
>   */
> @@ -581,6 +595,10 @@ static const struct of_device_id usbhs_of_match[] =
=3D {
>                 .compatible =3D "renesas,rza2-usbhs",
>                 .data =3D &usbhs_rza2_plat_info,
>         },
> +       {
> +               .compatible =3D "renesas,rzg2l-usbhs",
> +               .data =3D &usbhs_rza2_plat_info,

Is usbhs_rza2_plat_info correct for RZ/G2L?

> +       },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, usbhs_of_match);
> @@ -645,8 +663,17 @@ static int usbhs_probe(struct platform_device *pdev)
>
>         /* set default param if platform doesn't have */
>         if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
> -               priv->dparam.pipe_configs =3D usbhsc_new_pipe;
> -               priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> +               /* for backward compatibility check soc specific compatib=
le */
> +               if (of_device_is_compatible(pdev->dev.of_node, "renesas,u=
sbhs-r9a07g043") ||
> +                   of_device_is_compatible(pdev->dev.of_node, "renesas,u=
sbhs-r9a07g044") ||
> +                   of_device_is_compatible(pdev->dev.of_node, "renesas,u=
sbhs-r9a07g054") ||

Please no of_device_is_compatible() checks in a driver's .probe()
method. Just add entries to usbhs_of_match[] instead.

> +                   of_device_is_compatible(pdev->dev.of_node, "renesas,r=
zg2l-usbhs")) {

Ah, that's where you really handle RZ/G2L.
Please use renesas_usbhs_platform_info instead.

> +                       priv->dparam.pipe_configs =3D usbhsc_rzg2l_pipe;
> +                       priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_rzg2=
l_pipe);
> +               } else {
> +                       priv->dparam.pipe_configs =3D usbhsc_new_pipe;
> +                       priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_=
pipe);
> +               }
>         } else if (!priv->dparam.pipe_configs) {
>                 priv->dparam.pipe_configs =3D usbhsc_default_pipe;
>                 priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_default_pipe=
);

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

