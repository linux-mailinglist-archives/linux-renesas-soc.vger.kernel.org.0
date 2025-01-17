Return-Path: <linux-renesas-soc+bounces-12223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D78A1543C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C7BB188BFDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B41819D09C;
	Fri, 17 Jan 2025 16:29:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839519C574;
	Fri, 17 Jan 2025 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131377; cv=none; b=flis3q3HnkCr+k6OcaUTojRoQmigIoIUHI+UELTOHoVz8bggF7w4h2/nMvAzup71Zsv+CecTxmN3XpmPj0TVP3jYsFV11GyKUWJ2Ji4VhpEjdY1oFA07gcHGN36Mu37NzEZi5oBuWqJMieqNdKoyhFtc5bTZkusJU/Lux7df16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131377; c=relaxed/simple;
	bh=XjbJprMKqlYVrK1ZK2RJjSsXCB3MTmXOzo82LedHGNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uj9kwxNA6VBPMS8OyPi0b/FKfB2XzigwFClG85I7x8WXCGb3waWY6sJHhkwMaWDtEy83nhNdc0lH0IMYA469H6UDeH8r2eg/oeh6rOQPyYu4VQF15fjjGUoHi6yusHq3P6mNt7vNzA3D5lDKABFnxnNmPhbRB43dcKzpqzsCzaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5189105c5f5so1176123e0c.0;
        Fri, 17 Jan 2025 08:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131374; x=1737736174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yvKpAH7h1LpXVoXeJqCGWPtRAgm0n4tcRsoTWDHrY4=;
        b=wt1WcuLGaWA4IC9331aDzjdT/DliUbw4f5+F+F1AR1rX9BKd08oBLcN6SPXQEf0WQu
         /48mHOcNC+EgpB87MpNvHbt9EUcZnmFGp/oLdGzrZxf+Tb1FVmwsvx0wJcfupLjyVtbD
         pdxPZoW+BJZjn4+kWslLrtmm+odC4wTNUoPc9gYfZPjhZZ2foSHhY/s6qnD7zePqxWQF
         xtQecDaK51a21Q9MhEohNnovzkYYOOSs8EBCJbGIBy0oldqkFZ8PSnR4KPjKQjz810Ad
         JQ70pokTTaiJAjp9R/2D3B1mOdQhG+2nssnI8rtPSrqY9c7p7QoTpUWHP6XOxRgzXg36
         Vw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhwEL2cji4dYI8HRaruFU3qXDxQ8ZMfn0w3mzmUulKUTRKqtDhd4X7Htzk+IVKaK+7fcEkrBRnkms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/QR0MXab2zPWp7Dij2HED6yGwwRbb07oE4DdJYG9bwy0iads
	OV7n3xWo9wPzTsMVCMtyAtPe12isyisBmMPoJQTPchmOrg4gjbzeN3eOhQJB
X-Gm-Gg: ASbGncsxxRlYkoLZBKXIAi+6BKiRAnxSoS0kI2t1apI7+yKgQdoVKwnrdXP/5o1XZFt
	05NL4kjKBqJOHUSitbOEBz6COyyRMyzEipUqFEIDcGLoiPbOtscpv84JCKUcoIUyTQKA5PcxbZA
	7PKNH5gREsnYlICYkHcBSzlQkIMO6cPQfFFfj7ubGbvhtaQHuF4x01RgUeWR6Q5ljR6W5DQIQVz
	ojYVzjBluAXA1mxbVndYO3yn82csRPfqkFMkiPNKIE+KfCEfmXlyVNfYQ7WqNwI0tBwWW3c66a1
	oryq8HiwrmsOyAcdV8U=
X-Google-Smtp-Source: AGHT+IGKKzSHTV4cVwu13L9iK1i5OHbI0Fh5luDWIRNd/40hCM5IrMaRWUqiLCKlTHcG4Cm+ONI1SA==
X-Received: by 2002:a05:6122:d91:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-51d592b421amr2700711e0c.1.1737131373849;
        Fri, 17 Jan 2025 08:29:33 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642ccaf42dsm554259241.30.2025.01.17.08.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:29:33 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afeccfeda2so1191748137.1;
        Fri, 17 Jan 2025 08:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7Fcpdz6Jl8AeMXnEN70+z6RFZCGp60TcwedudW8Bc6bWeuybdQ4jw2tb5LSKSrJ4Mc2i3V8j4HUc=@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4b2:4877:2de4 with SMTP id
 ada2fe7eead31-4b690c475b4mr3313002137.15.1737131373395; Fri, 17 Jan 2025
 08:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se> <20250115175927.3714357-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250115175927.3714357-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:29:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgRJB03rGrVzG2Ft3XJ+0eXbHMHtxbpOkh2A5vRzRhtA@mail.gmail.com>
X-Gm-Features: AbW1kvYo4RUzAfvzWraM1H1LtLf_7oTO95JfCP9FndWkl2rjDzqyrFzWlhq7zqw
Message-ID: <CAMuHMdUgRJB03rGrVzG2Ft3XJ+0eXbHMHtxbpOkh2A5vRzRhtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779h0: Add FCPVX clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, Jan 15, 2025 at 6:59=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the FCPVX modules clock for Renesas R-Car V4M.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -239,6 +239,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("pfc1",         916,    R8A779H0_CLK_CP),
>         DEF_MOD("pfc2",         917,    R8A779H0_CLK_CP),
>         DEF_MOD("tsc2:tsc1",    919,    R8A779H0_CLK_CL16M),
> +       DEF_MOD("fcpvx0",       1100,   R8A779H0_CLK_S0D4_VIO),

Any specific reason you are not using S0D1, like on R-Car V4H?
I can update this while applying.

>         DEF_MOD("ssiu",         2926,   R8A779H0_CLK_S0D6_PER),
>         DEF_MOD("ssi",          2927,   R8A779H0_CLK_S0D6_PER),

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

