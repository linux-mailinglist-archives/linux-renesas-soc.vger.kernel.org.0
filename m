Return-Path: <linux-renesas-soc+bounces-21926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B118FB597AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D9A488093
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E081EBFE0;
	Tue, 16 Sep 2025 13:31:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE320D51C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029480; cv=none; b=mCdSfRgvaCxZbn/FPDeGJl5MFOExlUhFC/D+I8dJaI9fgxu0fxDMBZ1mlpaV87byiY2oIAKOG0+c+rz4K65ESAuhoK1LgkY2QvjD+SeVuPgkeQ7hOVKdKleo4i0CEQPoekat4DFDtSb2eMHM+znK3Ve7rq1RL1Zy19MP3cCE6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029480; c=relaxed/simple;
	bh=lRwGS+EzOykdHSjihfKZFNIAo3QDxUC71G1I5pU5mBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WI3k7wd97JsxIfyHzNhkP438y/uEQGCnQZjMhVWy6dPS6pHUBtIBzrJOGnHvn2vZe7mIh+mPSulcHtCJAMw+u6N2d/ecd46JuuLtj9eySHJl3qb3k52740TklCbsKG5TyLn26nPP1z17iwskDg2B4njuuppOtCqAhVG6wUCTibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso2839619241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 06:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029477; x=1758634277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDQooxDkD5fz4sLWBIH6i0SDIPVUTbpTi303GssaIAI=;
        b=d1rDLHDYjDYwEpIYdB+Svq4B16XzF9i/CT61ANz6I8tP0heL4p1FCAl3ljy9ABQxfL
         4HlDJpPaWqwCXMrM83La7q43WdOU0sqo96A6wr/VSdWXtrlYHKNlHQM5poIy5kFDJAeT
         8oRDuUkusvxax6Sz/PYVhrvOv6a9LnWzWcCPoZ7xOcV0IWT9GRyV97T3axVWkzwHLfBG
         PZpPik+2/ayrtH6JnNFeTbOXDuE1F0iMSsTQUpSFzH3gKpuhvP2Rzh8eSp1zQqoj8649
         hWGJ+Uire97YwQvsdJ2nDWGduv5m3bSWdOHMW8aqwQZnf1+pleScjAxWqdPuQGFLHzaZ
         qn2w==
X-Forwarded-Encrypted: i=1; AJvYcCXsbl6W79gZX+sm3DOZW5IYH0kMJ6BfARdL/my1KmoFSzIIjLlJlD3zHIV2b3OJP1sCejclFtuxHJUwcx/iPnMzzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkrm4OG2eAWZC21R/LHpDuosGtZTYMxoqccKRNCcRy7zpMLTiS
	h1JlcCz6tiAo9q0sFwjPmgPOdUKwT7Z06D1w81ZoJp7qymK5JE4CLNb4qgOiOTlE
X-Gm-Gg: ASbGncuU5mRDxa9Aa7al/BPmdZ4+B2JwD7xX6W7YhHq9yoFm0cAhj6mxWAbT0f1vIef
	Rggy3NvNspoe1pEEX3Vq1Yu0tDBy2yzU074canakeKaMG7Bax3rXuPawDtM6sA5DYYWkrNBnpyp
	aSbOCjdllop7oMJLi4FD+KPX6uaczQcOYqL05oYcoqEPAeEDE+uZLq9iQX7v/4uBa7gse9jcTRY
	70zAfAdlOqU7Gp5FiKUtZyMvOwAmAibdKIqGIiLx/pjMVkVglf3K+x6hQDBS/+eBLRMXKyfAkQW
	fTPFupw1UkxaQk/8uVk3OHVB/xQ6RGUUGbjebCS3e583C9INaYmNn1Z+k2FakZiXaYwIFfjp354
	sFg84IVfYW5qwps9/pBz4pmfXNQ0vq3sRIXy0Vb7h+QKAH0JOpeDS7YF9/yY/yIxv
X-Google-Smtp-Source: AGHT+IGLA8oHPNKmdqca/HN3bN/cGrcBEaGLdjDpVRphHCb/nQQs/48XwSOdBOtCIYnI8sqz29DC3Q==
X-Received: by 2002:a05:6102:548d:b0:52e:68:770a with SMTP id ada2fe7eead31-5560d760c81mr5235867137.24.1758029476703;
        Tue, 16 Sep 2025 06:31:16 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5598571bbc0sm2510204137.2.2025.09.16.06.31.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:31:15 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54a1bef404fso2955657e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 06:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPFbrW+8Pji2c1WGYXR2x5sMV7jcqwCTAYFD16vqYKrugHNvNNVKm72IZIvBxcBBje+X5TwFN55q72EuEJRIusLA==@vger.kernel.org
X-Received: by 2002:a05:6122:1d8c:b0:53b:174d:98f2 with SMTP id
 71dfb90a1353d-54a16b20009mr5200853e0c.3.1758029474999; Tue, 16 Sep 2025
 06:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aMlgg_QpJOEDGcEA@monster>
In-Reply-To: <aMlgg_QpJOEDGcEA@monster>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 15:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
X-Gm-Features: AS18NWCih78Z1mvXR97O_iR6cJDURxsOD6O73Iub1rATQe0jxKnm2iY0iJuCAa8
Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/T2H SoC
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anders,

On Tue, 16 Sept 2025 at 15:05, Anders Roxell <anders.roxell@linaro.org> wrote:
> On 2025-09-08 11:59, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> > where the GMAC is connected through a MIIC PCS. Introduce a new
> > `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> > handling is required.
> >
> > When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> > instance with `miic_create()`, and wires it into phylink. Proper cleanup
> > is done with `miic_destroy()`. New init/exit/select hooks are added to
> > `plat_stmmacenet_data` for PCS integration.
> >
> > Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> > driver so the PCS support is always available.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
> >   as it is always set for all the SoCs.
> > - Updated Kconfig to include RZ/T2H and RZ/N2H.
> >
> > v1->v2:
> > - No changes.
>
> The following warning is seen when doing a defconfig build (make
> defconfig) for arm64 on the Linux next-20250915 tag.
>
> First seen on next-20250915
> Good: next-20250912
> Bad: next-20250915
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> This is the build warning:
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
>
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
> I: config: PASS in 0:00:01.592356

Thanks for your report!

    config DWMAC_RENESAS_GBETH
        depends on OF && (ARCH_RENESAS || COMPILE_TEST)
        select PCS_RZN1_MIIC

    config PCS_RZN1_MIIC
        depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPILE_TEST

"ARCH_RENESAS" is wider than "ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087".
I would just change the latter to ARCH_RENESAS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

