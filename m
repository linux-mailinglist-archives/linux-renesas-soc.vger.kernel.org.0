Return-Path: <linux-renesas-soc+bounces-20712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0DCB2C656
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1FE4161ED8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D842833EB1C;
	Tue, 19 Aug 2025 13:53:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD2202C2B;
	Tue, 19 Aug 2025 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611617; cv=none; b=USKqWto9GAt+CwO3Oih4clircDjQrwQzc7oVa3bPW5P7UZMGoDi2n6gszOdhBzzXXgn3qooXOHeJYroEI+crJJ/S87O4rfWC6zhjNjTQTTeboyDfoodbZoxaqJemgJRiwCaPsztbFqypy8jiCaBeaq3+e4EnqY6Vk5iqp09HCvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611617; c=relaxed/simple;
	bh=sjCbpxSUHEfPb1ZxJ6/kPd85FQCs4RnOuqvLQFHp9YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Acbr2PcoJF00xOYAIsHFc2n6jwyDrkDHaxZaUH8imi+yA2rcr94vnO7zNGe8aUfMmH2jdd+2FLWB2PhYlJf9BT6aDeZAXwdX5sxLYuFoHUure7dhR8Ep29yyIB5IKQgiMUu3qnAAg1kXjRcCbli7+qHv366bTTbIvWd9JQv7PmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8902ee514deso1727883241.1;
        Tue, 19 Aug 2025 06:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611614; x=1756216414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeuW/6flpc2I+1hROrA6g3LcPwOigpLFE6GBluj/xEc=;
        b=hI4IEdUUD8FPIbJ/FszB5WjAcOv5VtuaazEBOXnKmDq7jQYD0CdkyO8HJLrkKDYWcK
         VfXUGEeWZdF5IB4/bmk/qmUG7DsioszfNKfG0cto5wVuiyQsvO0Hczd0AajAda6mYcWV
         vdL0yENxR2HVIgWZPHlie4WmFpLAOD27j0YILh1iQFfEGlUGYsmTypora/NC8oZt9luH
         0MQsErFKS6lXFl6g0LJUFXR9Ov19hXpXFM/jyFZNh0LhaxAssG6P4nYpiIhQ4wRkGcCl
         04UawDWap9JPr10byc4nzIvtTRai7dqhhVGaC0fR6IUSaPANslO51uqe7qh2h/ZR+lsZ
         MMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyEh30O73oPvQrsvUbMCzaAJ3DZdPcZqTeyRC6r1X/IJCGaJWkhu9SRD2FNUKfLFxMIctqrHxVrNq@vger.kernel.org, AJvYcCUjIipOe06PnNH1ZwSLwDR5hdESI8UHMRmT+OVg2+f8fWH2+jcvvL7PfWBs5KoiAxdq7zwTDgPvip1i/5laYj6Ei40=@vger.kernel.org, AJvYcCWVP43cCmH34dzPwAaYETjfWipeEFVZfZ0xunSPWdpFhV0PrIxBNKhC+R/YtQadPIqygSrC+DCVW3rV8bF0@vger.kernel.org, AJvYcCWbURJ9mFdEiZH8wkDRpcMp1L0NjZZOT/Gjop1kXb3rUNhFRouic/P14ffCgOuXj+Hk3nKM5eMBSfjP@vger.kernel.org
X-Gm-Message-State: AOJu0YzM0+f8g2vjyxEJsu++eiKkZzN/KZFmm1SdhrXt0ogtPjgDJO/F
	cpsaxdnvKpn5Rp4S7SoF0je3H5nUQO2hIVQ2q0gR7cWXeo1cSohKItgtDEd/4xYJ
X-Gm-Gg: ASbGncv/2yW1VlyTFuqBI5sTT2C1AsCXO9dDeyteizFhqTBAS/b0lzxuqwMQ3uC3uFn
	PZDuymYF+xKm7NX9NrfQKifAkDWqTKa/51ES5GbQWWJYxapCVNSaloGF916oeO1AfQRNZe7QG/Z
	5y6lF7sPWSDwpGhlxAS86/Y+TB6+gF4xlYpSUMfJobvLf7+RD10T8S1BkjSQFZS0V/OJBuApaOT
	zszxOVqdj8+yEo/li+chapF+OqBu3SRNVCGiKP1Xb3RuPXDdQluG4mlVCwLqTWItKjcX5j9jZtq
	ZWr+EdFh/UHpLPvcQ56Ns7EFQwr/g5ybnm6UZyPmyumllOPI1Uvgu0fhPD8zg6IybvYQnzzwpZi
	PT5pJRd4ot8W7FU5sciu174eTrwLtzB0AdEirq/bqEtOEC2wF6751FTqWUbrq
X-Google-Smtp-Source: AGHT+IHHpjioCPjgXccsZlThj8bgKsr8YTjqiogVlvjduqtaYs53U7Mh6wj/hMpMUDdI6kcJu2x31g==
X-Received: by 2002:a05:6102:4497:b0:4df:9281:5ec3 with SMTP id ada2fe7eead31-51929a189a0mr708934137.2.1755611613754;
        Tue, 19 Aug 2025 06:53:33 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51713f939edsm1450417137.15.2025.08.19.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:53:33 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f7e78cc12so3702833137.0;
        Tue, 19 Aug 2025 06:53:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUokFAvD5mCzPsA/W2KX/Oh4IVaO5VUwzGoj3pxEuYfJbODg+gddxRJiQLZZre5qNIPm3Du+EoXqh3L@vger.kernel.org, AJvYcCV9pJEeEsVk4gLRuhJa2C2btL2MGS1u3FXwOgaqdDqKiv+5WjNtxWLm9MfJFb+XnVStbKEvNd9UsgTjibrZ@vger.kernel.org, AJvYcCX+pyq+KfN7gpgD+checYwYOLouycuS11P73DdrOJClEGFqDv00vYKzfpPdhQN3B2APOKiqppJ1kIQU@vger.kernel.org, AJvYcCXf+670aOZv8QBxbtMCM1xqW/yqYAbziIMnAnAKintSezBUL/EV4+dT7WzJr0TNxi8mGFkkJuz60WiQBtYqeiAHrA4=@vger.kernel.org
X-Received: by 2002:a05:6102:8343:20b0:4fb:fbdb:283c with SMTP id
 ada2fe7eead31-5192628620bmr577370137.13.1755611300964; Tue, 19 Aug 2025
 06:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:48:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
X-Gm-Features: Ac12FXwqlAmfXivz66Sd55gS12RpO00X1Drkt6QaRo03rpO2tR6AE4qWRsOFRew
Message-ID: <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds DU/DSI clocks and provides support for the
> MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
> series [0], but has now been split into 6 patches due to dependencies
> on the clock driver, making it easier to review and merge.

Thanks for your series!

> Lad Prabhakar (6):
>   clk: renesas: rzv2h-cpg: Add instance field to struct pll
>   clk: renesas: rzv2h-cpg: Add support for DSI clocks
>   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
>     RZ/V2N
>   drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

On the renesas-clk side, I am (almost) totally happy with this.
Any feedback from the renesas-drm side?
The last patch depends on a header file introduced by the second patch,
so I will need to provide an immutable branch containing the first
two patches (probably/hopefully based on v8).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

