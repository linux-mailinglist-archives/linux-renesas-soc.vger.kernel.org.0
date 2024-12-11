Return-Path: <linux-renesas-soc+bounces-11218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A739ECC1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE2C2825F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6137D226871;
	Wed, 11 Dec 2024 12:36:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2F238E30;
	Wed, 11 Dec 2024 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920564; cv=none; b=icVKGEcLLwBCkawbneThEQet4nxKQfxjfnWYidbSW7SlTIkMwaut+i7H4MnmnTur9ZQe1ow2zdoGkdBpGOQDyF9GxMNWiJfUEavB9QCflPysK0Nj0CrDvFS9lqlYgpIXFgxiiNU+3koDfOVBEZzUS7Hh+sjfkmVlXSHwhsxTPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920564; c=relaxed/simple;
	bh=uZsQXcd5vSGXOLiVdRFzynM0Bajsbd1AvIBnR0Hwx54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJsJeuTRIo/DzcMbCo389Xtm9JnB24lM+FlOIYlG0AgkJXaQRutaKwY2stnaMQW6zEQPLO9qTeALipzlpxTciR/xAjN5Vk+G+7neahRbuXnvNv60n1p04IU5FlKPyru+HjXW2qi/9XsfK9E5VJQiSvoYSHKhKeS7B4a7Inip3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso1428547241.3;
        Wed, 11 Dec 2024 04:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920559; x=1734525359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miGebEfuJFDaOLaRLOxI6/4OetpOhwT5zM3bQDtOqEk=;
        b=LyDEHsg0UAU6953914hN0tmu0t/2emXdLwpmRiCvAZWdRrg/47p70FMvrXEMuuNghx
         AV+QyzvkO8CAwdvhjXr9aKYiWoMaWaLpJoR8K/TvyNIof7L5hu+xvZ+kHPqe8DxL9I2z
         kMsXNK4xYdh9yQbjMOE06rDiwgV+Awb/aAzjb8FVyxenta+qgRGKTTu2TFje+Cuo0iKi
         d1DqnsboVpkwzxcIhFryfiT4h82GNUEuXB2tDO4aF/acViJu7yozTqjMJkmtKZsnv7/A
         5TN3XlXUkGXYYlX6Tiy21WUwSpDv0BRJiLOYRkWN+Niv5wg/rZ2zsqwT/1bz0mNo8N33
         mzOw==
X-Forwarded-Encrypted: i=1; AJvYcCUjCBrmWJ6eCUv5N8NBz6MrgONqD5seaHHK3akwuWdDDoyiSQe23jWAzi6lciSkguWpFRBPKe2Y+y0b@vger.kernel.org, AJvYcCV502WW/yZLEdCitR5+hLwOnYRFEsz1bx3KdBEbZt7lqAI1H2ueqs9TWUsHLwrlt6/6qoRk3xaCkSrK8E+b@vger.kernel.org, AJvYcCV7JcxFREO+Dwna+uZ5ymDCKN/9+OIWYvJauC4mP0dDynNfcSfHAbtSdJMQFj57zlC6PhmgK3TV@vger.kernel.org, AJvYcCVIH7vxQanKVF7DfY59FyScmCbFRgbR2aaMLMJzUXaCrVmZOqWnR50YGmW09s3IV2QyY2uPLQPwvpi0XZjL8RANJzE=@vger.kernel.org, AJvYcCXfVn7sCu7lxaqdoeR2lRsoCHULVS3r5b7MmHwRHsr0zrMFCzeTLhV/6MvrbXIsgq3VYTiLuEuTVpX1@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4uJC5Ok632zsvdjD1YRVNcEodS5cOLMJ+iQQjr+A1zOmk2Ln
	Xwh7Uv8sTkIuWOPD1ThN0Cabd3M0tZlODEJutiERwMDf7eYQ35n/RBopWftu
X-Gm-Gg: ASbGncuqY4mSpXEVa07jzKAV+seYOEsc6KWZIvODsk318gNpjDOLzOVry6JfEQSAlqF
	cLr/sajyWFPQcwlunX6hwUh6EpXH4gjt02zAthQwLNfQsLzNu33aLlk7GrlPThSqZ/hcyIAij5+
	CaPcrFoquCIIQl1lJttu4UE4EO5WPBSBzR4o3aZgyPQAWnAA7gwAOYsKJwoijUO/QYPVSoMnXwx
	h6eo7eftzTdshHxb3EACgiLpu2Fz19ofKvfGkdu32VE8adNw87bECEmeM6rRIEEB/a31u/E6WLL
	3+D+52crxi8mDC8g
X-Google-Smtp-Source: AGHT+IFOpA89fy9JcGwGAVO55qw0Gdlxg0G5giQUGnnZwEnSlw8vcfV3KYvTN8Qu96fGp0PicB7Low==
X-Received: by 2002:a05:6122:221c:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-518a3a0e452mr2350435e0c.1.1733920559017;
        Wed, 11 Dec 2024 04:35:59 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c45e2ef2dsm1327413241.31.2024.12.11.04.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:35:58 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe2a1849bso1710524137.3;
        Wed, 11 Dec 2024 04:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPWKNIoE0jHtJvgRzu60G7jqhvD9KkXiE1vHqhJrFPsCenOmglvwAx2Gmpmym7lKVTubJfJ0HDcOb6@vger.kernel.org, AJvYcCUsbkv51FAg6YYaaK6WH7c9x/R9hE915GGBI4E9iBCnKlQfbmfcEQzFym1QJrlTfIF/JiKti/3MdhbtXfjKuOQognk=@vger.kernel.org, AJvYcCXB7K66Co57WPEr1zwxG7YnHABIB9RzYhIAW9yRxFqDrn4vWvd/+h405vPXe0huuM7c6zbSczax@vger.kernel.org, AJvYcCXMFxWOON4Yt5dwD47CodEaNhdo4XdhYiMXeBdNBvwgH5PAaTdTYreRH2iK7bPN8+UOzjtwo695wh74@vger.kernel.org, AJvYcCXrGHQL0QF0uAJrVJZx/LYxEWjti3JIqJoiwRZPRaQZy19G0Ht219r4dhdLkiXYyQvqntmwOVOTHTOymqtX@vger.kernel.org
X-Received: by 2002:a05:6102:5492:b0:4af:e61d:e22f with SMTP id
 ada2fe7eead31-4b1291b2b16mr2852897137.24.1733920558034; Wed, 11 Dec 2024
 04:35:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:35:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9K+2mqAg+4JUX3oY-HmHTtkP5NTZoTXJX-Y=jSJEcMg@mail.gmail.com>
Message-ID: <CAMuHMdX9K+2mqAg+4JUX3oY-HmHTtkP5NTZoTXJX-Y=jSJEcMg@mail.gmail.com>
Subject: Re: [PATCH v4 04/24] ASoC: renesas: rz-ssi: Terminate all the DMA transactions
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The stop trigger invokes rz_ssi_stop() and rz_ssi_stream_quit().
> - The purpose of rz_ssi_stop() is to disable TX/RX, terminate DMA
>   transactions, and set the controller to idle.
> - The purpose of rz_ssi_stream_quit() is to reset the substream-specific
>   software data by setting strm->running and strm->substream appropriatel=
y.
>
> The function rz_ssi_is_stream_running() checks if both strm->substream an=
d
> strm->running are valid and returns true if so. Its implementation is as
> follows:
>
> static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
> {
>     return strm->substream && strm->running;
> }
>
> When the controller is configured in full-duplex mode (with both playback
> and capture active), the rz_ssi_stop() function does not modify the
> controller settings when called for the first substream in the full-duple=
x
> setup. Instead, it simply sets strm->running =3D 0 and returns if the
> companion substream is still running. The following code illustrates this=
:
>
> static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *str=
m)
> {
>     strm->running =3D 0;
>
>     if (rz_ssi_is_stream_running(&ssi->playback) ||
>         rz_ssi_is_stream_running(&ssi->capture))
>         return 0;
>
>     // ...
> }
>
> The controller settings, along with the DMA termination (for the last
> stopped substream), are only applied when the last substream in the
> full-duplex setup is stopped.
>
> While applying the controller settings only when the last substream stops
> is not problematic, terminating the DMA operations for only one substream
> causes failures when starting and stopping full-duplex operations multipl=
e
> times in a loop.
>
> To address this issue, call dmaengine_terminate_async() for both substrea=
ms
> involved in the full-duplex setup when the last substream in the setup is
> stopped.
>
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - updated patch description

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

