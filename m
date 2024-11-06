Return-Path: <linux-renesas-soc+bounces-10371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F59BF600
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 20:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F260D1C21B07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68479201106;
	Wed,  6 Nov 2024 19:04:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85597646;
	Wed,  6 Nov 2024 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919875; cv=none; b=CsHRua0PxZzCNkyvs0IMigkKKze7tWe6/dzTSo/Ke821jEHimIezEd2LuayBeqUAt+Bknf2gEfrjNN/v2lJXxuQFQQ9Otel6L7KnoG2dBY2kQyuqp/qu797aBh8/Mpv0Ixw/UNqtaj4NNqfPYi1T3RYK2OQYeVhuXLG80IDs4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919875; c=relaxed/simple;
	bh=mJZ5TO0smo2hNqp5yf+D/aMpfYGpzraLcz1Q8zSEumQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtPJKLEjy7zyBr2Wuc6Oyu8TSsRQ0HfI/qALT7xp2QyxdvWNEuYdhcpv9ytTF+TUB7mYf7dklQCnqYjZR3tvd5WX2rZlOr8s6NAwjUpD1fTU51Q8xJN85dBtBzPwK2ZQiLzrtGq3orQa1TEA8ZtmUSMPwxb6DAFebICHwFOxj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea5f68e17aso989087b3.3;
        Wed, 06 Nov 2024 11:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919872; x=1731524672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4e1o9gH37JUKKkKM3MHF++tZxAk2RGqLpVN0xBxsA0=;
        b=fLA0DmsrAQcqb5hcfAwDG0mymn4wtoVKmY06o2gARMsytckqmZyZB4YNnE0L/goN5w
         nLbicpkb/f7Pql3P/nkhFI36HdULU0g+xTxgIIz6wz9VyZrfvnI1XP2FJawyK2XOLMc7
         liL5D5Ir2bV7Ii9MqNSUAj0QxpICJ4L8MWMHqrv3yfsJf6s/n6dEKQaQitfmwTdt3IIH
         Bt6JuFI3c5ONA/IsT04I9+2/2pRprLyySAKm5fkt+XRNwNG7JExccImSIen24U1qfiyL
         EVty3J4D736uDEVWphfazXwInNbjZKHTFJkaJJ/6zZzVfIt+CqIOnAaaiNvju9xIEmRc
         yY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+Y80+MpVXHgaYFz8NUAG5koskfKJauc0svWRb2dmBy5IDkK+B1EoTtMfQ6Qo8229WaeYnvqeYiTNkMCGDIdEqBw==@vger.kernel.org, AJvYcCVtPuAy8K5TgZQDHXlEyavetw6UV83yAH4NSVfKUJJwrxsYH38JNe6NJFt4gtwgEb3SKvK5Iafx@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmLj6JlebFZbvN65Cx3G1zMHna5du0ROG0cy2omKdOi4eX1TF
	8gF+3We64taJH3/6eFgOXXsTtQKQKewoTbHp/OKJZTahKgHEYd1z3Gf3oEdz
X-Google-Smtp-Source: AGHT+IGzU8iQY9H6rrVp8FVNSmSUbkYBlyXtdJnFPvI1mKpOYENSv2vGn18GTlLQXg8WR2qRV1N03A==
X-Received: by 2002:a05:690c:e:b0:6e2:70e:e82a with SMTP id 00721157ae682-6e9d8aa4100mr397379317b3.31.1730919872047;
        Wed, 06 Nov 2024 11:04:32 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c85514sm28635517b3.117.2024.11.06.11.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 11:04:28 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e9f8dec3daso816347b3.0;
        Wed, 06 Nov 2024 11:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVew9HfZfqdJyTUUts2T5i23iEI/9fDikYmre2HLgQcInepx9/3IMYdcM1l+LaG56vvupA21babBYC7x7tjzPlZKw==@vger.kernel.org, AJvYcCXxbLEpjuodDEWM++LQv7oJqUERy1EnaghZlnVe3Hlqwsfr6CECTzNSTYAeJ0neSpLnAAgR4yCf@vger.kernel.org
X-Received: by 2002:a05:690c:6ac6:b0:6e2:43ea:552 with SMTP id
 00721157ae682-6e9d8939598mr463312207b3.16.1730919868139; Wed, 06 Nov 2024
 11:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com> <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 20:04:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
Message-ID: <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Nov 6, 2024 at 7:49=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The host_node pointer assigned and freed in adv7533_parse_dt()
> and later adv7533_attach_dsi() uses the same. Fix this issue
> by freeing the host_node in adv7533_attach_dsi() instead of
> adv7533_parse_dt().
>
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address

Thanks for the update!

> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -143,6 +143,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
>                                                  };
>
>         host =3D of_find_mipi_dsi_host_by_node(adv->host_node);
> +       of_node_put(adv->host_node);

This still looks fragile to me, as afterwards a pointer to a freed
node is left in struct adv7511.host_node. It would be safer to also
clear adv->host_node here.

However, taking a look from a distance, the code looks like:

    static int adv7511_probe(struct i2c_client *i2c)
    {
            ...
            adv7533_parse_dt(dev->of_node, adv7511);
            ...
            if (adv7511->info->has_dsi)
                    ret =3D adv7533_attach_dsi(adv7511);
            ...
    }

The only reason adv7511.host_node exists is to pass it from
adv7533_parse_dt() to adv7533_attach_dsi().
So what about making this explicit?
  1. Let adv7533_parse_dt() return the host_node or an error pointer,
  2. Pass the host_node as a parameter to adv7533_attach_dsi(),
  3. Call of_node_put() in adv7511_probe() after use.

>         if (!host)
>                 return dev_err_probe(dev, -EPROBE_DEFER,
>                                      "failed to find dsi host\n");
> @@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct a=
dv7511 *adv)
>         if (!adv->host_node)
>                 return -ENODEV;
>
> -       of_node_put(adv->host_node);
> -
>         adv->use_timing_gen =3D !of_property_read_bool(np,
>                                                 "adi,disable-timing-gener=
ator");

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

