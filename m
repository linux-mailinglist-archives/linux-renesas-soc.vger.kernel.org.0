Return-Path: <linux-renesas-soc+bounces-11962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6BA05C48
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 14:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD407A02A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 13:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D291F3D53;
	Wed,  8 Jan 2025 13:01:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288014A82;
	Wed,  8 Jan 2025 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341316; cv=none; b=oU0HpkAg3mUkrVsFX82bG3lMxZ3IMBo5yqsiSSb7Z0GKo6hEP6GMyxD7lEHe9Cy/ghcNGx2dfa40HvcS+HoRYqyK4tkBHbRAjDwF8PHu9eryoUpmeu67b7gRVikcMhmpGrwgLmVCmg8ZH15hPya+k+aNrCZ1iUOj8yetvoCBW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341316; c=relaxed/simple;
	bh=00s/VYsuB9ND1dR6ygEJ0bPI546crCnvjdTjUa2ST3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uo0LM3VDL0ZRtYhbQRV7JfEFxDzw2JnouZBeR+U1sKD7xEN7mi5KlXbShMLmCsu4v7oN7+WsbzTBIv459Fg5i0lg5qaHnb+Wsfe7xM86nlVULYpY3rgG/kWDtxlNil/Mx+Tncb8+q3hAE9AENJzVj8Y6FDoes4CLcl5TwQeJpUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678664e22fso147761911cf.2;
        Wed, 08 Jan 2025 05:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341313; x=1736946113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DPVgWRoBgp5UUwkNErzWNpDubic5Irpv9/KSUHnOLo=;
        b=rSgc8IojNK1qUTjSECYM4XRVFbFDveDtYsleKXZs9mgQie1HY4vpRwXjeq0fvB07hj
         z+ydb0GuxIzALOFskB8MWGvSS7rKyUg5ehrph9j9SbQ58ztkz0hbAMMC5v/yIbx8O8ag
         NGbvMe462UJp+BM2Z43LR8DOYfd6ulwepP9+6PXCwObU+V0GqozIDnRRVft24C5UxcUU
         mv7pVM8fgiP6iAcfOmAx25Kg+BhOdmmLjxzrmTgm8vxMDbaRp2Al1Cc5Zd0Cs4BseL/H
         ZKwKxrP6cglexo+gzFzmeQgvJ6vt2iFPdig0qd/SP+hokze2UgEKAAsJ/yiKMCYGTs9T
         BLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCrumsBC7UeX5hfrqN09ru/3a3lmGAGu9jixbKrr/XSpY0tqHUV/qAjwww+TSMsW8lAgYFPc9doD01lOrTUQ==@vger.kernel.org, AJvYcCUHPKltlCB1qUio9RF/jqWJN5PrmhNHid3ycCoyVjhJJESVlQ2ztbIIhJLjHZ6q1+zfmuV1jRS1fYivbUNfkOh7gic=@vger.kernel.org, AJvYcCVtfnzklwKvs/kliMARuXxrKzBxoNWQXWUt7W0Od/T9+MUDiYwryW0Rdm8iyZwvfcwPMv1jhgn0WO00@vger.kernel.org, AJvYcCXxeghsAE8KJSdZUYWh2LfX2yTsGlko5sncC64qhdU/7hfbu6tj44Axp3Ooomj5G6fvK8sgvnxLVPT+EUOx@vger.kernel.org
X-Gm-Message-State: AOJu0YytBypTzjmmb/VjoXa03+LNN42LQhxJJXjPjYIp/HfJ1wfOX+m+
	Ov1Blk1Tq3k3stlHO6uH0y9Xi1ToRGNK3rHuJ6gn3BzDjvpAj5WSm05Fhh4L
X-Gm-Gg: ASbGncuVPDwfnpLEZFQMkbN+ot8H+pkd82TX9Xf5mFIU4zndxxSp0/QAtna6teVprDo
	OlMAY5BAztGkGwR+NSHDewcKFTieXcsRwxf30jv9PJg/AH333v6M2ZQJA6JjfPl3iSmFxNVEqpy
	cUjeh/ALt38qg006jTWHCGvNPCr2Cmn7Bi2k2hUwvMUKVvIuLrHLgIGm+MhKH2fttTUN2BVmvnw
	4VOTrOXeS6pz+2HOUjmNQiYrmGIo/4i8hOasv+zRx8o4BwY7s4mbnbkcWcUd7Xg3e6Cni04Uy6M
	/bcKjsN6ZymeKfC7gkE=
X-Google-Smtp-Source: AGHT+IEBskDmJozukL6DSOYDIRDsvJ9O0t54RjendDD1DcMkEB2z4k/woaPDDe9cR/00l5q+7jlURA==
X-Received: by 2002:ac8:5a11:0:b0:461:7467:e9f1 with SMTP id d75a77b69052e-46c710aad11mr39767261cf.26.1736341313132;
        Wed, 08 Jan 2025 05:01:53 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46b2b534419sm39444081cf.67.2025.01.08.05.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 05:01:52 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dccccd429eso149985136d6.3;
        Wed, 08 Jan 2025 05:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4MS966PXi6DqjcZR7IJ6gDrXA0Mq2c4By6IettWkclabye+YOC2HOXue65eVcxqWAg4ky7Rbkeld84R+kU6ZEvlU=@vger.kernel.org, AJvYcCXgZzLNv+j1wDze/tE+N6gpYCZT0LCKXZQwYL7NoKBx1XxIj4bg6h7YFu9CNmLlmeiGUaxZA7A4htiVsCbFug==@vger.kernel.org, AJvYcCXj9PnIn1N81ufVA/1I/d0kLO1pDmVKUmME/TDJw9eUAKr70fTjP766lHJsnt/Y1BUI28SJlHJKm6i3@vger.kernel.org, AJvYcCXzPzIYX8o3UsPZsPrqSOI5fVnMITU9Kx84UNiLRMR/3SO0m8IB4GiBPkDDBlup3qlet1PA59qUXP90Ec2w@vger.kernel.org
X-Received: by 2002:a05:6102:f11:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b3d0f94834mr1605383137.7.1736340813382; Wed, 08 Jan 2025
 04:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
X-Gm-Features: AbW1kvb03s6-ioyEsxQhihv8HJWEPeM4AbdJ5u2RlFP_T025eauQBHNT5poBSNc
Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> @@ -58,10 +58,10 @@ examples:
>      #include <dt-bindings/power/r8a7796-sysc.h>
>
>      cmm0: cmm@fea40000 {
> -         compatible =3D "renesas,r8a7796-cmm",
> -                      "renesas,rcar-gen3-cmm";
> -         reg =3D <0xfea40000 0x1000>;
> -         power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> -         clocks =3D <&cpg CPG_MOD 711>;
> -         resets =3D <&cpg 711>;
> +        compatible =3D "renesas,r8a7796-cmm",
> +                     "renesas,rcar-gen3-cmm";

Nit: the compatible values fit on a single line.

> +        reg =3D <0xfea40000 0x1000>;
> +        power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> +        clocks =3D <&cpg CPG_MOD 711>;
> +        resets =3D <&cpg 711>;
>      };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

