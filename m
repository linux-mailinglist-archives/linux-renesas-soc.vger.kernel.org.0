Return-Path: <linux-renesas-soc+bounces-6812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB291835C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 602451C22243
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0045181BB1;
	Wed, 26 Jun 2024 13:53:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119814EC65
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410001; cv=none; b=FbEe4g4AUPFfy3jptrnf+Qu0J++ekzA7kPFem0c3hzdR6yF1yLzotvSBQ0QJPcEOqNrhSh3maZguoIYDrnelITmALc/085+dS7Y8cGzrYEFSxYbItVYaQIxMYAQSUfVfDUz8vrDIPS7z5FAkxy0Sn2k9dG6npIhq2qhe81Q7y2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410001; c=relaxed/simple;
	bh=cc8CToVMRSbpii4o7AP7UaIFF6e2shZN9jkWvaC/iYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwWDKZlJ1zFG4mMEYKgGDSV3Fq4wfGqiV0Og/7yn3qR6jNQavojUZykjTUhA6fS0j8iZVuTYxYQEReV7VYxOVny+W/a8MlEuloD2Uq3OVe4SAFIkXM0wZwtR/4QtCnB5Byya5xxz/UOomzSnl0AHoHcLeoq/sIztNqfiSE1zWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63b3a9ff064so63038447b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409998; x=1720014798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfciExwzBXYyOBGIVuikO8bLZhmkfMRfxDv89jcuzYo=;
        b=OrnDTgX7TdsDfbRXe4BhA7TuFg9i1tghJnxf/8BqA29AdgWTWMKdyZyluCHB9/XQCX
         B6aCAas8W4/0GMzFWh+oaZ3grYFTTm9FmMdOymg6rYOsD3qL9jfD86LP49dby4RoSLOo
         24qxR+h1hR3SVmJ2peAHDKe3bTEJq/fQ6wmAnlcRohrL2OxvcSLihAByBmC7Gn7wvMRi
         QTwlHCYlODvZeiLbKOr5aNVn0MGhsOgR31nj8Y51uAIEml/397Ls54+ASF1+ypEKelkP
         8QYAc0w/0hbU212AilDStIid53T00GeGoNM8T9pTm4dDcZTAAfJm24vOBC5jxDYoGQTT
         cT4g==
X-Gm-Message-State: AOJu0YwlacZOPReXkpz3uPUBDGtKyk0G6AnaM3UwWYy6wKtvwKkBjFZz
	zCbs6RFt8702kPvOB5EBLjXjdB/LKnt+4w8GbPZ9SKSMRG/2v/x8xveKXP0c
X-Google-Smtp-Source: AGHT+IFqCxhlEdpbL54n2mdax1WX03zhbuMKp55YVQl4Yn+R8VbpuDPhNedNb32R15tLMjeIu0eJmw==
X-Received: by 2002:a0d:c504:0:b0:644:548a:758d with SMTP id 00721157ae682-644548a75bcmr84384087b3.49.1719409998205;
        Wed, 26 Jun 2024 06:53:18 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f111748fdsm38318567b3.11.2024.06.26.06.53.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:53:18 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63bca6db118so64505077b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:53:18 -0700 (PDT)
X-Received: by 2002:a81:918e:0:b0:648:bc9f:b9f3 with SMTP id
 00721157ae682-648bc9fba1fmr6896447b3.46.1719409997772; Wed, 26 Jun 2024
 06:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
Message-ID: <CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: gray-hawk-single: Add Sound support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Because V4M supports only 1 SSI, it can't use Playback/Capture
> in the same time. It select Playback as default.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -5,6 +5,25 @@
>   * Copyright (C) 2023 Renesas Electronics Corp.
>   * Copyright (C) 2024 Glider bv
>   */
> +/*
> + * [How to use Sound]
> + *
> + * Because R-Car V4M has only 1 SSI, it can't handle both Playback/Captu=
re
> + * in the same time. You need to switch the direction which is controlle=
d
> + * by GP0_01 pin via amixer.
> + *
> + * Playback (CN9500)
> + *     > amixer set "MUX" "Input 1"    // for GP0_01
> + *     > amixer set "DAC 1" 85%
> + *     > aplay xxx.wav
> + *
> + * Capture (CN9501)
> + *     > amixer set "MUX" "Input 2"    // for GP0_01
> + *     > amixer set "Mic 1" 80%
> + *     > amixer set "ADC 1" on
> + *     > amixer set 'ADC 1' 80%
> + *     > arecord xxx hoge.wav

The use of "Input 1" and "Input 2" sounds a bit strange to me.
Looking at sound/soc/codecs/simple-mux.c, these are dictated by the
MUX driver.

> + */
>
>  /dts-v1/;
>
> @@ -59,6 +78,23 @@ reg_3p3v: regulator-3p3v {
>                         regulator-boot-on;
>                         regulator-always-on;
>         };
> +
> +       sound_mux: mux {
> +               compatible =3D "simple-audio-mux";
> +               mux-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;

Adding support to simple-audio-mux to override the default "Input 1"
and "Input 2" names, using e.g.

    state-names =3D "Playback", "Record";

would make this more user-friendly.

Still, I wonder if there are any side-effects of (ab)using
simple-audio-mux for your use case. This MUX driver is really meant
to pick one of two sources to connect to a single sink, as described
by the topology in simple_mux_dapm_routes[] in the driver.  Perhaps
there exists software which interpretes these routes, and offers the
user a graphical description of the topology, which would be wrong?

> +       };

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

