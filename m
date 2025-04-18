Return-Path: <linux-renesas-soc+bounces-16151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59BA938B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 16:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F41920C24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 14:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE57C18F2FC;
	Fri, 18 Apr 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNLs05/C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C82AE6F;
	Fri, 18 Apr 2025 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986637; cv=none; b=ZW0rOwXb+T4qt0hAbzBFNpYXtgUq2tojAVePisGpmFQFZetWKXqpMXWnbNtu9w4HX7yb/vS6+9uy+ZO2SodU7ZDbKcUWIAzzujPq6bF6hdbaRjUgBU8pKl/JHrzqkrQH65QVkSmjf5RYZ3ozXQ+vAaXlUaOFODZAycYRRefKO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986637; c=relaxed/simple;
	bh=RMdr9RCsAmDBDpL2Q1fjaP6KuXUrNRzArbFdLtTAYw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZsy8qEKpiKL5Vq1uGNLgYthPtArwtL8DixAHasMbV/UnsP1ZrsfRGbcD6ZYhrdL0kvsTSMmTBfpaW57hl+VkwH1hwVp/92HIV4tCqrXR6F9N0sHOrx16W3ypwyu+4s4jmNZd7aMdqs7vwmOvxOOA2CnuG0hgrCXuAi09ybmV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNLs05/C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1076350f8f.3;
        Fri, 18 Apr 2025 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986634; x=1745591434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62uDSKULOQW8NIOGli1V4xfgLN9nhpayc/ZbXb4OndY=;
        b=MNLs05/CNdq3+Ub4eyMsyzT2j1p9byMal/bqXBDeU6idLZjkJxs0VrgSknLbkD/Icl
         cqG7nLJL/Mm9lmOpB2wJcmOTiLRw+qkLUgEs+M5QIx4diZ17D9ab4t2M590IQRfkJUqz
         PGYok8zyPkxw9xYstmNPc0qGLyS04jcC0NQFOp3RECaKXCQSC4vSl7ZYs7OVbuZv68JF
         OwwAbZ+F60bIc5P/J7lA2Y9BOcSTZpgb5vUr/0qou0U4k5LA5rm7M27tBipz+v0JQ4lx
         oMg6SV95j6Um5JDDgdhlvzFJmC2b22fu1xy1m181IxK7mQMHOHpmzFL7w+ehTwdXrV5W
         rUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986634; x=1745591434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62uDSKULOQW8NIOGli1V4xfgLN9nhpayc/ZbXb4OndY=;
        b=h8Rc/2DpO0v86z4x3D5TcwQYsKm3DQ74H3KgUVULjU24jPsrlrjq1s+XW5xln77opz
         MvVeaxU18Qc6Z4tmNwn25Ihpjsq0/OFpFOln1aNmhjskB9CTAFUvtG14G/VphsYvaHvl
         h+Coqdb9Ej0ra3uzA8oRHvbs2FO6j2dlvqhaCDfhZn4b1il+yDUXLCWZu0behIX+zuaf
         lNpgfnfHDgnldYIIBd43zGUKzfrkYBDnwwfjJ5X6xaLZyzW206lHb2exhc/zXoq7K5Oz
         xb49gZ7fqCJa8nyvMhtetiUd4ctF95X5CaQvyWu5ZytnSLHcf97Nhqawq4HMxvC/zjNa
         MpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc50TykKOiE+t/rhwo0KB1Hk2eb3f2B5PyqNgXJpW4OEdfjeZVdXoXkvEHDw8pzNQS9llTkeuwzj/C2gnFXMlRHLM=@vger.kernel.org, AJvYcCUh57YmabxAqC8A0jUQZ8YgC+Lm+L5ZtBbRJ5BIHuXeEwcdkOlcJLI6RkaU1zRj2UqKtnRtnf4Uepdn@vger.kernel.org, AJvYcCVbOgDkjESxRhmn5yQ9aeucb8RaZXDw18jHv6TIh/4E9p4BvpuOARtHGcbcXaUu9fJFgjymtFuWhBJ+@vger.kernel.org, AJvYcCWXsLKz213UdLSvorRMsm+nUbiKQpZ/Nu39SzptI17O967eeSXeEabwrcyyh5GgIu+kg7mXxFUeGg8xz30E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6yDo1Dso5mjyaKD5hSQhRTBUtEd6l5DBdJWQPaQA0LzAuOSYL
	GVPWayegOHPiQOWSxTtXzSJ78ATQjbDKDGcI+T9kfIKFB0zh+w3nm5RiQ5y52/dly0+mBHHmQ9H
	3DQ8R0WyQLyOKNAjCESZzXfggbX8=
X-Gm-Gg: ASbGncuAhmV4Q7N3tnnXRBTqH2985Vo1gtcblnqD1Q9Ntf7PrWcfHEQzRX3ESQGseME
	77azVf5wPOxZklXa1qIv2S+YUHj5XpFwWPzdorRxwREy273HmIKIcvWq7MzCFbBMz3duLq5mD2z
	SgRJCydk5DQalS5ynNxyv4VTSxd2h5ucepdRu3iRXCHGEe74Mr3kELqJM=
X-Google-Smtp-Source: AGHT+IF2YDFY26SFz6yJ6te4w1o3CM07r77TE60wclzSHhGI/3BbOPR9AyZkyyT+Ks7mBSB9PgtHJ74qZ3OP8eES/jc=
X-Received: by 2002:a05:6000:40dd:b0:39c:27cc:7ba3 with SMTP id
 ffacd0b85a97d-39efba6d50bmr2513996f8f.33.1744986634020; Fri, 18 Apr 2025
 07:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
In-Reply-To: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 15:30:07 +0100
X-Gm-Features: ATxdqUEqe-OZRpZOWalEsUu1IPPnxFVUfBtvGQi_mtWwVxlP_KYiJrsbtYHkusk
Message-ID: <CA+V-a8sbZ95xzhyg51TCzfrX3WrUWZm4DRHy15Uk4n3AFxKUqQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Apr 15, 2025 at 4:51=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for the DSI and LCDC peripherals.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No changes
>
> You did change CSDIV0_DIVCTL2 to the NO_RMW-variant...
>
Ouch missed that.

> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
> >         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCT=
L3, smux2_gbe0_rxclk),
> >         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCT=
L0, smux2_gbe1_txclk),
> >         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCT=
L1, smux2_gbe1_rxclk),
> > +       DEF_FIXED(".plleth_lpclk_div4", CLK_DIV_PLLETH_LPCLK, CLK_PLLET=
H, 1, 4),
> > +       DEF_CSDIV(".plleth_lpclk", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLE=
TH_LPCLK,
> > +                 CSDIV0_DIVCTL2, dtable_16_128),
>
> The clock names look strange to me: "plleth_lpclk_div4" sounds like it is
> "plleth_lpclk" divided by four, but that is not the case here.
>
Maybe ".cdiv4_plleth_lpclk" and ".plleth_lpclk_gear"?

> > +
> > +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
> > +                      CSDIV1_DIVCTL2, dtable_2_32),
> >
> >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DI=
VCTL1, dtable_2_64),
> >
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > @@ -117,6 +118,8 @@ struct smuxed {
> >
> >  #define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
> >  #define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> > +#define CSDIV0_DIVCTL2 DDIV_PACK_NO_RMW(CPG_CSDIV0, 8, 2, CSDIV_NO_MON=
)
>
> The documentation says:
>
>     DIVCTL2[3:2] is reserved.
>     When writing, read modify write is needed.
>
> So the NO_RMW-logic seems to be inverted?
>
Yes.

Cheers,
Prabhakar

