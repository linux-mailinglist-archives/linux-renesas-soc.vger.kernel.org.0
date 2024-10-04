Return-Path: <linux-renesas-soc+bounces-9378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4798FF7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB6B81C21219
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 09:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D4F144D01;
	Fri,  4 Oct 2024 09:22:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C9139D0B;
	Fri,  4 Oct 2024 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033732; cv=none; b=eKJhcqcwVSiABiZpb04tEVV0YoIJRKNa7M9JVe3241bAa9tdwjuIkVOjVk76HeKc7sNoHUZaUWMc3xAjHWDI4zKk/KyQtrv/1tRFBlxqhU8IptBo2aLZ/KOqk+Oy/GCR1TkJZHk2gDsz4Cl0JqFXU1nPSPT7uXJVNqCk1e848Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033732; c=relaxed/simple;
	bh=ATAdfPBE9H0Vz4T9XWUMDeJ2pGNSLALHxLj9h6/+NmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zg0sj8bjU03gGurB8n2CrWzEpI2gTVx2eDX9hvE875CVDxsSOt57f5TTuTflM4FhmyQoKEumUv6wa1ogcnFA4G3cSBUtt2SM50ljaiway/VVZ7j2ixTCFdnLEAbRyAAS/ZZJzpchJt2QqYDO27wjVvk+f4uERUPGGimI3G41kXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e260b266805so1782642276.0;
        Fri, 04 Oct 2024 02:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728033729; x=1728638529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdCCrhKQ8W9P1x12aLOjmY/pkDteCc59FMGKuExrtrY=;
        b=B4/QZXeEV19PmNzPZ+dXFa0ZgBOi7GzQktag78nUXB3WQFrOvFRSbdgP9bZ8oK/8cM
         mjLUxMKbMfBS/oaJqGgFiVRsVfCVkxnViyK17IDPKCcD00QmdhDdF1QIK/pxTrLs/B2P
         ZbuC9EDWYKmEpjX+FqTZLkKZb00yhdJd33SjiWdJ4H7ep1QqJKoFrAX4eYrOVXzd84nA
         KXZdWGMgn4XZaWn+fBIC6YpJUMKAp4E3+fOsEt52ND0UlU1o8Qs/+ya5/R/4zhtz+RF2
         JBb195nKLUkclQv48i6r/z5bJ8YYB9c7+su9ChtQrmfSBbBiOOvjMu/mPanAPCm/5SAP
         hzSw==
X-Forwarded-Encrypted: i=1; AJvYcCW079sVgBDoyDm+HUlMDa3VZ9flImClbfxBuY1ZTMqNZclWT5liRtLgvi2ZndQPlhtWCNyya55liY+10A2A@vger.kernel.org, AJvYcCX8P6XinZC3uLavYJfgwaJfoIGl4dBMP5A43Z/9k5a20yAjcaQW70rJmdLjIHLSAbwZ/0qDly0c+52cjhioK1hn/DM=@vger.kernel.org, AJvYcCXoPLxqPxmye9U3K26WVHNSNSD2Do9n7BY9W34HnLK+PoNisC8sE9eRoXLV/6rv3zduQct+iIJcFqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzju/sZoW4x0BShoOtMrHI6vjH+/d9fX6usPtS6+6fKuRMSVguE
	Iu8COFU/8DoF4Cx91+6o+dt4IgV41LwHkFTqePg+p+b7USTpwCg+rdC5rOCM
X-Google-Smtp-Source: AGHT+IFA6omFwb5pPjlMOrOAlKPT+niYQmlrTJ3W84wtBim2ldbxnRMbh0fFLyv+vptkSSkdGweK7w==
X-Received: by 2002:a05:6902:1025:b0:e28:30f5:f33 with SMTP id 3f1490d57ef6-e289392b5admr1446776276.28.1728033728625;
        Fri, 04 Oct 2024 02:22:08 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d2b9d9sm523706276.22.2024.10.04.02.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 02:22:07 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ddceaaa9ddso18416317b3.1;
        Fri, 04 Oct 2024 02:22:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUr2f2rF+SPWpKMQjAWG6nDkOT98r7MAkKU7C1CIpTtTx5HS9bHJ3o/bF370OUkEWsoww1JS2MtvWuD3a0f9+ylnY=@vger.kernel.org, AJvYcCVdLWDyxu2oOTCU13QoTtksgIMomRtZ0DWolw9lADoyLUUBI/geN/aqksf/xYjAdRwiLDyYgA3aGx0=@vger.kernel.org, AJvYcCXA/kHP7te7nFW6mWOBb3JR3mD9YqXrRwASl+7sFZ1A3Gcx7wL/vvSwaI7mcAQ5ghyJoETUxwbzEu9bt+nI@vger.kernel.org
X-Received: by 2002:a05:690c:63c8:b0:6e2:50a:f43b with SMTP id
 00721157ae682-6e2c7289f5fmr21471627b3.35.1728033727643; Fri, 04 Oct 2024
 02:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918135957.290101-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240918135957.290101-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 11:21:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiGAo2jz5oeiYzzHMNaaDmpjUo7eR7F1i50iPXEv18MQ@mail.gmail.com>
Message-ID: <CAMuHMdUiGAo2jz5oeiYzzHMNaaDmpjUo7eR7F1i50iPXEv18MQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g057: Add CA55 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Sep 18, 2024 at 4:02=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CA55 core clocks which are derived from PLLCA55.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -74,6 +82,14 @@ static const struct cpg_core_clk r9a09g057_core_clks[]=
 __initconst =3D {
>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
> +       DEF_DDIV(".ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0,
> +                CLK_PLLCA55, CDDIV1_DIVCTL0, dtable_1_8),
> +       DEF_DDIV(".ca55_0_coreclk1", R9A09G057_CA55_0_CORE_CLK1,
> +                CLK_PLLCA55, CDDIV1_DIVCTL1, dtable_1_8),
> +       DEF_DDIV(".ca55_0_coreclk2", R9A09G057_CA55_0_CORE_CLK2,
> +                CLK_PLLCA55, CDDIV1_DIVCTL2, dtable_1_8),
> +       DEF_DDIV(".ca55_0_coreclk3", R9A09G057_CA55_0_CORE_CLK3,
> +                CLK_PLLCA55, CDDIV1_DIVCTL3, dtable_1_8),

I will drop the leading dots from the clocks' names while applying,
as these are not internal clocks.

>         DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_D=
IV16, 1, 1),
>  };

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

