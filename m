Return-Path: <linux-renesas-soc+bounces-13501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C495A40148
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 21:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFDA863C77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 20:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D202505BD;
	Fri, 21 Feb 2025 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0ScXuby"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7181FF1A2;
	Fri, 21 Feb 2025 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170736; cv=none; b=c+MZUyE3/TCvgXPdp3Ona1kRaUClsiI8CP+Zr+R0vnX1eux5zpGA7n292niFNhpydCkvTEjlEuiKmw5yLTtKXZhXn8Xkcm5ocd+zqAEA8V6oyPVU/MHGpwyXwemhzeOkD8eZx2zABHc4bGAM2jnHoseF718TEe6XSeIRRc/k1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170736; c=relaxed/simple;
	bh=IDwXYbAbaaa0cLeEfHTnnJ8xgcFKZKRtfaPS4fpKv2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAEBUsc1enMmajNjJwG7dpnBX0olYtpBDb69uGLrNhUWmXelBbvlGFoAqJDDVlfvWy/JvEcUrKh/bfErgq8eVgTpyvImFStgH1DOsbzL7mBFInUCKagIsC3hDnaQ2nJ5MWzTMqSBCskhhrE0IcyomPmI+EDrO8lL3k2x2An9qgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0ScXuby; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5209dad13b5so458335e0c.2;
        Fri, 21 Feb 2025 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170734; x=1740775534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/BI4f5Zyto4/LMtAo+yFdAx69tWDkP/W/A9uk7AjEE=;
        b=K0ScXubycGC+lCTJh2yztqeABYZceS199VTJ9HbkmF/JTR8qAHZWftQZ0vklPfxy/5
         2I+8JD7EjvPfO89wLZhF0ji8b7OGy9Jnzpo+aH09iNOr5oQGyR4H8Q+7Ly63xODPRzUx
         wg7igrbzs6sV/z8b8r0vTBvN27fLiHvgrUn/sHCIdvwF77kKC2UvWo3rIidIzGsyh5OL
         b434Pnn/OwRozmrknCQp+TYkmCGDvtTkRIvzBtTGx8NuJGqqYVXwEWcdJC/XPWd/FVvD
         eb1T0Ilz+Od+VUnVHXsz07u980TtZitx1Fk+dsFlwTLFCLt8z9FSuKP5JGjWjBasgoew
         4exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170734; x=1740775534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/BI4f5Zyto4/LMtAo+yFdAx69tWDkP/W/A9uk7AjEE=;
        b=Fx5kNnDTDZ8KnPsIahV6cRip/lu3iswXkF/ZxFngHPr5VAwJMmmMIu/e/UIYd5Trc5
         ZGHRLcWe2LnPFCMRe6tQcL+FZTUoFNUSJimCAteCgM/usT9+Fv2iBCg5qdCRxcv/oaTZ
         zgPMf6Z3CAfGMjDzNpky0XkzkYKpt7Y8PSAL4M2i9KFl2AT25Qx/DpA9DIQsNvw0CKdu
         pQpS9b/Fjl4AIgipdQXavRZKnnTD4nhs5vVMs4HC5pbRuSZDqAftwwGxEPZRGS38gtWQ
         Ji95UevMSvbpQ0o9tQbZ0t12e8ONnZD0gLg6zThlaPvOQoB4c7IUvj8HEK2/t2+AuMoD
         5u/w==
X-Forwarded-Encrypted: i=1; AJvYcCU3Wxlg9JrzZmvw1NCdCy6ng+fKsVn6qYY2psyzvOTClmCm2ZS+PLP/5G783og2taZkRIRh8ioMS5A=@vger.kernel.org, AJvYcCUbDMKgEQlDCE5UiGXhs+UE8JI/21q1O8vhunV6wYjiZ5SR6dfedc2i7qiluVLcmIx3J6Mw06FbxHqI+gOm@vger.kernel.org, AJvYcCVMyFL1oTjpUwUQVEsETB/cripmsm5sEEhxG9ppt80a3GUphEluwJ0ey5ljPZ9UTT0S73lLcYr1ddP+KErI+pBc5vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo485IgGfgbLkFIndc3ZBeL72D39X3ZfpYiXRwNfc1qmHVGjKw
	LH2OhcqjVRAfA5q0XyN4wpQdeuH4OZiSZb55G8BFAU88xiLuJYMChZEWNdpNH/UHEn1GUMQde/c
	bNZvLAvGfrCAWBn+gVQ0ZK+jtnb0=
X-Gm-Gg: ASbGncv3nVZ8XlvMVkXNzvm2eISGuWyDmYFeNF+yOGiea4OWpMokRFGIFg2bEG6NeRr
	Ak+Hdt0512OxJx9EqCT05l0RYNMZ9hOvW0VVz2kkp7aCAUjUYKG0wRxfuwWvq7g7VKKD6CrKRJk
	j594PR1p28r4/oKk1Yhsrkl6zHlNRl0/kkoboDU0nY
X-Google-Smtp-Source: AGHT+IHLr1VHf1D0vuJZbfMW80rKDumx3wgqwp/1CIbZvZpjPwB0sPaC8wpyzawoyNUTqJ5JNrLXyahhZsjNs9RE3/g=
X-Received: by 2002:a05:6122:3544:b0:520:5a87:66fd with SMTP id
 71dfb90a1353d-521ee435514mr3338955e0c.7.1740170733827; Fri, 21 Feb 2025
 12:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com> <20250220150110.738619-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250220150110.738619-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Feb 2025 20:45:06 +0000
X-Gm-Features: AWEUYZnshaVDPS8IS-SGk5a9yuCIBL9snVJ8f3mGAzFu2ftI2qtH-6QgorYlHO8
Message-ID: <CA+V-a8vX9CT-XcG=FW+qWZMbJzJOP=SQBbMncVASgBfKmicFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] clk: renesas: r9a09g057: Add entries for the DMACs
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 3:03=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Add clock and reset entries for the Renesas RZ/V2H(P) DMAC IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v3->v4:
> * No change.
> v2->v3:
> * No change.
> v1->v2:
> * No change.
> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 24 ++++++++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
>  2 files changed, 26 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index 3705e18f66ad..d63eafbca780 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -31,6 +31,8 @@ enum clk_ids {
>         CLK_PLLVDO,
>
>         /* Internal Core Clocks */
> +       CLK_PLLCM33_DIV4,
> +       CLK_PLLCM33_DIV4_PLLCM33,
>         CLK_PLLCM33_DIV16,
>         CLK_PLLCLN_DIV2,
>         CLK_PLLCLN_DIV8,
> @@ -39,6 +41,8 @@ enum clk_ids {
>         CLK_PLLDTY_ACPU_DIV2,
>         CLK_PLLDTY_ACPU_DIV4,
>         CLK_PLLDTY_DIV16,
> +       CLK_PLLDTY_RCPU,
> +       CLK_PLLDTY_RCPU_DIV4,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_CRU1,
>         CLK_PLLVDO_CRU2,
> @@ -85,6 +89,9 @@ static const struct cpg_core_clk r9a09g057_core_clks[] =
__initconst =3D {
>         DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
>
>         /* Internal Core Clocks */
> +       DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
> +       DEF_DDIV(".pllcm33_div4_pllcm33", CLK_PLLCM33_DIV4_PLLCM33,
> +                CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16=
),
>
>         DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> @@ -95,6 +102,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[]=
 __initconst =3D {
>         DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_A=
CPU, 1, 2),
>         DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_A=
CPU, 1, 4),
>         DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
> +       DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVC=
TL2, dtable_2_64),
> +       DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_R=
CPU, 1, 4),
>
>         DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVC=
TL3, dtable_2_4),
>         DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVC=
TL0, dtable_2_4),
> @@ -115,6 +124,16 @@ static const struct cpg_core_clk r9a09g057_core_clks=
[] __initconst =3D {
>  };
>
>  static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
> +       DEF_MOD("dmac_0_aclk",                  CLK_PLLCM33_DIV4_PLLCM33,=
 0, 0, 0, 0,
> +                                               BUS_MSTOP(5, BIT(9))),
> +       DEF_MOD("dmac_1_aclk",                  CLK_PLLDTY_ACPU_DIV2, 0, =
1, 0, 1,
> +                                               BUS_MSTOP(3, BIT(2))),
> +       DEF_MOD("dmac_2_aclk",                  CLK_PLLDTY_ACPU_DIV2, 0, =
2, 0, 2,
> +                                               BUS_MSTOP(3, BIT(3))),
> +       DEF_MOD("dmac_3_aclk",                  CLK_PLLDTY_RCPU_DIV4, 0, =
3, 0, 3,
> +                                               BUS_MSTOP(10, BIT(11))),
> +       DEF_MOD("dmac_4_aclk",                  CLK_PLLDTY_RCPU_DIV4, 0, =
4, 0, 4,
> +                                               BUS_MSTOP(10, BIT(12))),
>         DEF_MOD_CRITICAL("icu_0_pclk_i",        CLK_PLLCM33_DIV16, 0, 5, =
0, 5,
>                                                 BUS_MSTOP_NONE),
>         DEF_MOD_CRITICAL("gic_0_gicclk",        CLK_PLLDTY_ACPU_DIV4, 1, =
3, 0, 19,
> @@ -223,6 +242,11 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks=
[] __initconst =3D {
>
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {
>         DEF_RST(3, 0, 1, 1),            /* SYS_0_PRESETN */
> +       DEF_RST(3, 1, 1, 2),            /* DMAC_0_ARESETN */
> +       DEF_RST(3, 2, 1, 3),            /* DMAC_1_ARESETN */
> +       DEF_RST(3, 3, 1, 4),            /* DMAC_2_ARESETN */
> +       DEF_RST(3, 4, 1, 5),            /* DMAC_3_ARESETN */
> +       DEF_RST(3, 5, 1, 6),            /* DMAC_4_ARESETN */
>         DEF_RST(3, 6, 1, 7),            /* ICU_0_PRESETN_I */
>         DEF_RST(3, 8, 1, 9),            /* GIC_0_GICRESET_N */
>         DEF_RST(3, 9, 1, 10),           /* GIC_0_DBG_GICRESET_N */
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-=
cpg.h
> index fd8eb985c75b..576a070763cb 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -38,11 +38,13 @@ struct ddiv {
>  #define CPG_CDDIV3             (0x40C)
>  #define CPG_CDDIV4             (0x410)
>
> +#define CDDIV0_DIVCTL1 DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
>  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
>  #define CDDIV1_DIVCTL0 DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
>  #define CDDIV1_DIVCTL1 DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
>  #define CDDIV1_DIVCTL2 DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
>  #define CDDIV1_DIVCTL3 DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
> +#define CDDIV3_DIVCTL2 DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
>  #define CDDIV3_DIVCTL3 DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
>  #define CDDIV4_DIVCTL0 DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
>  #define CDDIV4_DIVCTL1 DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
> --
> 2.34.1
>
>

