Return-Path: <linux-renesas-soc+bounces-3880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762C87FA16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 09:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439F2B21073
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 08:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16B654BE2;
	Tue, 19 Mar 2024 08:44:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C374594C;
	Tue, 19 Mar 2024 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710837847; cv=none; b=fYn9jUC5XzVsl6O7WCzf6AIibWauRGVgLMxY0zqdKC7iFldry6UNk5f+k49cp2oRcCjpm2tc8rQ8jpH0hc/TZWFCGs3OCwD/N8sV639lRTQqEFCAOV3aDRoWoiCr4K0Q8Q38UzNxpgUDpw+ML31ndvylFif9nxPC9CPP2qJZNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710837847; c=relaxed/simple;
	bh=mFcYM9EYi3FGiP2DVka2PX2YxbSGQuobRuE2Z+EsIh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnOxtUOdkwRGL/ba5LCwVkmtJ4pRvN2tNO1csm0Koka8gZdgr+YGTkdz2aqQL7uSNm452yv7X9Di/FCCQ033K+4DuYsqI90Sgorx9Japp6gKQ5njCOkc7P8A9XnGY+UoBmU+hqGf858NGbwgJSqvF3uJ/1pV6RrO6amDun09V+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a104601dcso55875087b3.2;
        Tue, 19 Mar 2024 01:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710837844; x=1711442644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05WIgHUwypx0RCMuCnQ/P6RT3691E8n6FqHNwT4EeMU=;
        b=GnLFgs2TeyyFFLMqYY4izMtnHz4iI2gyGyi3kCqhJDSqnaIbC7/+GkNVzl2rconid5
         KRyLPeiObCiXIR59OHbtMhEe9iKX5iMHpJSMbWpr22SMG0sbK2Rnw4q+t+jeZqecgS8J
         rxTyEBk1QChPtjPsunWqvS7ADWsEcpkxM4f0NqI/uDEHMz9eoNWN8CtShTLqNuDwZsce
         h4iW2GACLP9/CuxrA+PbwzMXbCDoSVZW/yqnxkpwn8+Cy4Pn+8M2TKwbciiU7CRPML42
         8ynCRKXn+XvsY0WHwPxd1QARJyvNZiuFW1ORleg5tq/r8xKnxF4OGvHCKwEzbheSACsx
         ydJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMVX/hW5RdFy9PuYaQP5fRRNLm8g577xettY8HH8AmNd++Hly/vDBA55jZS79B2nyj0UGRfrIqDgPSAdXBUmS8cViFFH6Ucy6ewvv1AyL1wBfcUjKxsfVQBosY8QWMnqHFyGAOYL8LWZ/eIkQEkBlPacIefK4vNRhCL35xmhzPnTnPvhKvvQ==
X-Gm-Message-State: AOJu0YxTqL/UrEK7dLv+id0uUwWcbH7dr8gz4PCK/t5sV2CQefkBC2HB
	lPf6lsNbwP7D5dxhQlcGCRlmywYFCJJtru4XrxreaLYYBkTzM03wM6712qg32P0=
X-Google-Smtp-Source: AGHT+IFL93ICBnidl2AXA0GSeLZBEMuhCXBNnprzIWwHEVCVO71vG9z7/yfCZE17/SHXrjZqf1CtLQ==
X-Received: by 2002:a05:690c:2e92:b0:60c:c974:5ee9 with SMTP id eu18-20020a05690c2e9200b0060cc9745ee9mr12941644ywb.2.1710837843067;
        Tue, 19 Mar 2024 01:44:03 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id en17-20020a05690c2b9100b0060867d09de2sm2235750ywb.29.2024.03.19.01.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 01:44:02 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so4694729276.1;
        Tue, 19 Mar 2024 01:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7qJ+laneZarvw4rv9UFAa9EqR3M0LyjXLt/h9HfVju/LnmPXayKJVyLbof44Ib+2WB6OhZP25HaRvAOR8UCnqPQZW+a/3XG0HWP9Nj2LQCFQPVmqgW2sHZZFKRib/2ZhTZD7L98oNrjtFqUbgEzUDiJszdBkk79LZWMYb6fFMQu85gnN2HA==
X-Received: by 2002:a05:6902:1889:b0:dc6:17d2:3b89 with SMTP id
 cj9-20020a056902188900b00dc617d23b89mr12226265ybb.61.1710837842470; Tue, 19
 Mar 2024 01:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318173319.201799-1-biju.das.jz@bp.renesas.com> <20240318173319.201799-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240318173319.201799-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Mar 2024 09:43:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqgBWmb1ovwDn+Xx0RVLdBCAZnSj48Dse6YPNDx1A6Pg@mail.gmail.com>
Message-ID: <CAMuHMdUqgBWmb1ovwDn+Xx0RVLdBCAZnSj48Dse6YPNDx1A6Pg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Mar 18, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The RZ/G2L family SoCs has 10 pipe buffers compared to 16 pipe buffers on
> RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and use
> family SoC specific compatible to handle this difference.
>
> The pipe configuration of RZ/G2L is same as usbhsc_rzg2l_default_pipe[],
> so select the default pipe configuration for RZ/G2L SoCs by setting
> .has_new_pipe_configs to zero.
>
> Add SoC specific compatible to OF table to avoid ABI breakage with old
> DTB. To optimize memory usage the SoC specific compatible will be removed
> later.
>
> Based on the patch in BSP by Huy Nguyen <huy.nguyen.wh@renesas.com>
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Credit  Huy Nguyen's work in the commit message and dropped his name
>    from Signed-off-by tag.
>  * Selection of usbhsc_rzg2l_default_pipe[] by setting the variable
>    has_new_pipe_configs to zero.
>  * Updated commit description.

Thanks for the update!

>  * Dropped the check 'priv->dparam.pipe_configs' as it is same as
>    checking !has_new_pipe_configs.

I disagree: it is used to specify the pipe config through platform
data on non-DT platforms.  There don't seem to be any upstream SH
platforms doing that, though.

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -642,7 +658,7 @@ static int usbhs_probe(struct platform_device *pdev)
>         if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
>                 priv->dparam.pipe_configs =3D usbhsc_new_pipe;
>                 priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> -       } else if (!priv->dparam.pipe_configs) {
> +       } else {

Hence I'd rather drop this check.

>                 priv->dparam.pipe_configs =3D usbhsc_default_pipe;
>                 priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_default_pipe=
);
>         }

The rest LGTM.

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

