Return-Path: <linux-renesas-soc+bounces-5656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53D8D3A30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CCC71F284CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C18015B12C;
	Wed, 29 May 2024 15:01:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF85336F;
	Wed, 29 May 2024 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994899; cv=none; b=jbLl8yvTpi1alLiHqEDnrCcHRTSy4+TBiSdCOGqBwbDhRHE78JUJmr6Ez4iTGboL5LPG2v/0fBvol5Ed99Jri7dXT5fsQC+u7QI30aFwZKOz/dEPGbQok64wcD6pYCvI2cE7yuMwSFJssPn18lw4TqJxPkq0ZF7ajEByqamh/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994899; c=relaxed/simple;
	bh=5tDB9mcgpr0BHNJx76yFXc/GeR+vMOwGLGHMZ+RXE8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUutemnDqx6g2f6mmTTv6eK0Qd/kXB6cW0ANiwcG37Gmj6Fe/OwLFgPtk4TbWTlJ6gr2MyKBEPtI1U9WEBfVBBNRoCa0vWq3LBYs1PB0p7N5GbZ4fgVvaNWhW8k8UXY5TggO9iVGLNnsRda36JbX/5tpeOOw/FfZn+llHLEi7x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df7721eee79so64369276.0;
        Wed, 29 May 2024 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994896; x=1717599696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeKVUIkeDBALapGV5Rmuxw+WaOWpHpihAR7cLzV5Alo=;
        b=ho6FEgK2YwJ0j0kOrDcpqDx7W1W4lRKFluNPNyN0C+Wx0dlVqlK7eMsJ12XdCQ2Y2N
         QTgMdHYz2hGiz6nQ1GhZVivIN0D8lSWcrNFw97QcnanokdGgPHqbhBHAAEb8UsDc4E1C
         w2Ig60oCC35KCY3UDrNzc+ESRabRcHKPgYLammUqphoBPQAZXjmpTefp/js2jFTJoef4
         RS4oTfj+ORK3qhUs/DsrOnignbuSa+5HLpHOx6CYh5h7RlOU+Y87j2+tkgCZmZkPydIB
         rxFuaZw9jQOzmw7D7D6iOAVCmkThgDWpnFriCdxunWSK96KHH+erzC05YyLtr+5X7CHk
         k7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXp5/W6OCAykXMS9TKU02KYjwHKTMCItnqc1tsWaMFRAm7noQa/p8DP1mwy70I0OxLtAguLrtuA/OnWZWjwIxZJ5ULV22N6AD3d
X-Gm-Message-State: AOJu0YyCoLNweo4k9o4z5kH4pFB0R2YHrYsIHJVBfR2LB9DgKXcmVCzX
	yHbwo/WgNkeKrG2wDHe8d/ih7Qv8k8ykY6JoRomP70nviCUMK/w3VWoQ4/O4
X-Google-Smtp-Source: AGHT+IFRSgw72Iwpvc1mkvM2HjpOSdfZ2TtMFaf1v5sUgtg7dHQ4L/d8gE2QGgXDih8eT8SwLSVRxg==
X-Received: by 2002:a25:d808:0:b0:df4:db70:c045 with SMTP id 3f1490d57ef6-dfa4646ca6fmr1703150276.13.1716994894606;
        Wed, 29 May 2024 08:01:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df7746ab768sm1604779276.31.2024.05.29.08.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:01:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df79380ffceso45998276.1;
        Wed, 29 May 2024 08:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTtKG0dOxskfD7upeZDAyOqkyxeMoBvsg1Z9KGSCgXrwrsrL48IW85dYgEDSuelDsIemBnSKbacY7NcUll/Eml7fi6hPr6rQnm
X-Received: by 2002:a25:a28a:0:b0:df7:ab1b:671a with SMTP id
 3f1490d57ef6-dfa464b5f98mr1773684276.24.1716994893923; Wed, 29 May 2024
 08:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se> <20240527131541.1676525-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527131541.1676525-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 17:01:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyZGE6p2D-LRiZHOZn2wiB0=qK3n4DtOQSboc16-=KtA@mail.gmail.com>
Message-ID: <CAMuHMdUyZGE6p2D-LRiZHOZn2wiB0=qK3n4DtOQSboc16-=KtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779h0: Add VIN clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 27, 2024 at 3:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VIN module clocks, which are used by the VIN modules on the
> Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -188,6 +188,22 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[]=
 =3D {
>         DEF_MOD("sdhi0",        706,    R8A779H0_CLK_SD0),
>         DEF_MOD("sydm1",        709,    R8A779H0_CLK_S0D6_PER),
>         DEF_MOD("sydm2",        710,    R8A779H0_CLK_S0D6_PER),
> +       DEF_MOD("vin0",         730,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin1",         731,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin2",         800,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin3",         801,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin4",         802,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin5",         803,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin6",         804,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin7",         805,    R8A779H0_CLK_S0D1_VIO),

According to the documentation for the Module Stop Control Registers
7 and 8, these are called "vin0[1-7]" instead of "vin[1-7]".

> +       DEF_MOD("vin10",        806,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin11",        807,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin12",        808,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin13",        809,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin14",        810,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D1_VIO),
> +       DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D1_VIO),

According to Table 8.1.4a ("Lists of CPG clocks generated from PLL1")
the parent clock is S0D4_VIO.

>         DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
>         DEF_MOD("pfc0",         915,    R8A779H0_CLK_CP),
>         DEF_MOD("pfc1",         916,    R8A779H0_CLK_CP),

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

