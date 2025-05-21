Return-Path: <linux-renesas-soc+bounces-17298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46EABF587
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 15:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B72D3A3CB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A66426A0EA;
	Wed, 21 May 2025 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chCvoH7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543842D613;
	Wed, 21 May 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832819; cv=none; b=TiYDgftZjLCOlSxcgYvkFDmaxwDt0cHtEqBChixIh5Wj2CR30El6a2M/kFv0hOQbMf0sUDVq0comBbpYdwU7E/Z+p3JcCtFlcWRUwDHniwkY887kTVW3bT9RpZbf0XyMjFn9R4LBPH+zPlyQWPwkpZ6M6IH8Fqim6dKsHtNMoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832819; c=relaxed/simple;
	bh=paVjfK+XRxRxA5/2pk+uNnNieSeINZNGJzqULLjhvhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdWfXyMButuYGgL1Z9HYSpNWUqULryABqu4GgBICV+9joqBw25hBGJz3LJGWnk13rirkRd5YMUzTCBEWMTLJNXjVvjM+BJ2QsJTIeitTEtmpVPLHBxocqrYGDTjXwuB8LRvASh0zSDet/kbZsrwTjwmapuuvkZsdwfUiH7jEIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chCvoH7d; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36e950e41so2267232f8f.0;
        Wed, 21 May 2025 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832815; x=1748437615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ImUjq0fgDHWqAteIZbQKYhLq5pbNfhy8eeFHxGuhiY=;
        b=chCvoH7dorQvuX4EYXZDgdTEbDjlZoVTTzs8VZZmEBA1/tioteAxCqPgIFHeDnEz2p
         Ti+xkNiQfNbM9u7ZidfEMJ6N2E7cKEqEaR0/hxzsVXBmEBgZyCDV2vOWMa2oWjYbRBZe
         H4T+PQulwcLSgEYHVuG2m4s4XON3vh2QRWkJXeAtxhnpp7el2pxD7+4YkGcBmJzrzIHv
         16l91dpAzekEFZatB+skYJfoqGS/LNzQfR5RDH3yzJk9bi+swyONHLtbJPeC+7ucfa/m
         /SlogOQehNIC0O9AsQ3PV7iuUCaQNKN5mfDrqC4ZnQqf6+/qQX0iDD/hD+lKdGi0rWRy
         s5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832815; x=1748437615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ImUjq0fgDHWqAteIZbQKYhLq5pbNfhy8eeFHxGuhiY=;
        b=PjzTg5xjr2VkB0oyISNXIb9lBvfkhbqopBe4c1DKVvC1Zm2BXbLzQ/eDcRcZ4XKX3J
         uz2wIe2X9OgWIlleIaaEP/jLdrBwa8JNoVJ43opAw/MHY3jAgasynQNNP6D7oDBwb/IY
         gO6u3K2obxk1lre7kf8MVussjKjjWfCrfjL5rExhaSK2yoOhKsfpsuubPg/mY12K91u9
         cH90+q0+iaII5CuL0kt7p6JI/fTeayeSpmJyGRJ+ZRXF9KKqjORjGUhW2Q+cNsA2a3EF
         jta28YUe9DpKaOSrH/AaD4DeTqGzlesXRJp1SQYiUQAY/Dhp9Zu4Fg1UXHJ84Su462CN
         MBEg==
X-Forwarded-Encrypted: i=1; AJvYcCU8t2iA/4yuBBoYhK0fL1GDR9BXRMEc1XdKSUQQDVT03BWaLYx4GKT4jFkVBX5A6kSbz+a3lHjaXe4Ide1h@vger.kernel.org, AJvYcCXFcQSGcASGCMnaAgQ5oebYDnzx1Ji/jmiS0AQ3dNPXDwc9ArBa2EqM1tMQ1d8W3422YolBfjz3+BhG@vger.kernel.org, AJvYcCXzryvyKBLa8VCKpyet0NLVJ3eTCxyRWPc+EFz3wVuQt8iVfr8B/5LyXyXzor974F8DUrueyOdukna3TM7QP2WJzAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDhL9U9832di88ypojPwccgvg8JIIetVe8Mpw/BWWB/EB3jTJ
	B8opkidhBXmdLRtmorVQ1Ddmpu2FXWA3bkYlu3zCLc3+oNaMc9nSkwg6iXH9xuiMoht3OPIbqlq
	kX5zVbLCzg86GlO/vUEHMzD4qiZFaUE8=
X-Gm-Gg: ASbGnctgzwV+vC6FS/vV4uGv/WvAYmS/lfWBjX6TL2Hd2gmCC8QnZQ+Cq0GZsHapEtc
	j7mI5Qh+RS20PXyr8gisTzC3zCArfYx9hXSLFSS9wwyNkvPxyObuCeBkGCTo/KD9Dqjqqetxo3c
	xRPKdTx8OcdrMpi9H2xIt5MiSwiBg=
X-Google-Smtp-Source: AGHT+IGw/flPUocN2KAZQ9vdKAbWbAcRjHYnIoWXNE7b6MhiAbmAH3CS1FTYcoZqP32a1zcOAnKla60J/JLjfbNq4SI=
X-Received: by 2002:a05:6000:1883:b0:3a3:5c05:d98b with SMTP id
 ffacd0b85a97d-3a35c8220bemr16554008f8f.5.1747832815212; Wed, 21 May 2025
 06:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
In-Reply-To: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:06:28 +0100
X-Gm-Features: AX0GCFsiM19rEOpmPdSQtniDQCiDvqMUju95_u3EML6LED_KnTgo4KZJyu9-l4U
Message-ID: <CA+V-a8vjjY94KX-oWY5gKqNsWRvmxs2gzc1hDFjqCxbg+Y8c4g@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, May 20, 2025 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 12 May 2025 at 20:23, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> > VCLK rate instead of the mode clock. The relationship between HSCLK and
> > VCLK is:
> >
> >     vclk * bpp <=3D hsclk * 8 * lanes
> >
> > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> > HSFREQ accurately reflects the clock rate set in hardware, leading to
> > better precision in data transmission.
> >
> > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> > when computing `hsfreq`. Also, update unit conversions to use correct
> > scaling factors for better clarity and correctness.
> >
> > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> > threshold comparisons to use Hz instead of kHz to ensure correct behavi=
or.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Added dev_info() to print the VCLK rate if it doesn't match the
> >   requested rate.
> > - Added Reviewed-by tag from Biju
> >
> > v3->v4:
> > - Used MILLI instead of KILO
>
> Thanks for the update!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>
> > @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mip=
i_dsi *dsi,
> >         u32 golpbkt;
> >         int ret;
> >
> > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       clk_set_rate(dsi->vclk, mode->clock * MILLI);
>
> drm_display_mode.clock is in kHz, so s/MILLI/KILO/
>
Agreed, I will update it to use KILO (and below).

Cheers,
Prabhakar

> > +
> >         /*
> >          * Relationship between hsclk and vclk must follow
> >          * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >          * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >          */
> >         bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -       hsfreq =3D (mode->clock * bpp) / dsi->lanes;
> > -
> > -       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > -       if (ret < 0)
> > -               return ret;
> > -
> > -       clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +       vclk_rate =3D clk_get_rate(dsi->vclk);
> > +       if (vclk_rate !=3D mode->clock * MILLI)
> > +               dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu=
 mismatch\n",
> > +                        mode->clock * MILLI, vclk_rate);
>
> Likewise.
>
> > +       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> >
> >         ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> >         if (ret < 0)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

