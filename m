Return-Path: <linux-renesas-soc+bounces-5824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD88FB7E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF831F21B74
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 15:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AE51487FE;
	Tue,  4 Jun 2024 15:47:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18B1487CC;
	Tue,  4 Jun 2024 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516025; cv=none; b=Rg7sJomWwscGqTx5j5LtTa/SHRJqYWonIVL51QlE/Hs0I/tT518weGkxBQflzGie+f6LEIltcxC4bFaCeiH0dT5ADv/cLWYmF61AoOYn6ZqQQUO/xsJKnK3bWJ9D0A7Xc4ZatN/lIPsHGpYP68+ScojgxrEvaMqT7GrWKv9QxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516025; c=relaxed/simple;
	bh=z2sfDyZiRCznFZZfHqgUfC2pvUChPIsKP4NCw4mRGSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk8y+TqfdcKgt25Ayprh+TojKUh62dyOwd/7+R/8a5Gm5mUb9xlllLW/6iiBXCP/Oea/pf3au+tC4KN6Vvvsn/iEPqINZRPV+OsixtmZgPadOXDtlnCcr3UKNfvXcFcBTC867/ePpKUU2VJB9ZA2Ufg0SBS6x13KK6JtYVbG6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a0827316eso44861007b3.1;
        Tue, 04 Jun 2024 08:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516022; x=1718120822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XykWmvMVGXDGknRmrx6u5uZa8kB/wreyKKJg4nQZDhQ=;
        b=k1334kURnGlo06Bme5QO2LXu8/X0MjqQwp/Yi9XT6qh6eYY/acSy9w5K1/3nmDyR+E
         OI6wCf/TV3vQqUFlN5ZCuBBBjT8N44PTZx8678krfVrRh8zjbHO3TmC35LP/Tw6Ki35f
         gaq5a4QEeOrzE2ZejljTAquuY7cqgwkBh22HC8FUDHK1JUkEYn2LtpPOivQcRheZcoNi
         WObtA32hRynoi8SWZ2PXWw76SdQAWmkIUoWfHirrC6M2QEGErE/fZ0CerDvKuO/i4N81
         IeX5v/zoNcuxysFttlmdo0n2shqjnGp712ITI+HCmtNy7huddUERkd/FdjyF2cZPru3f
         BmJw==
X-Forwarded-Encrypted: i=1; AJvYcCXiadLC50zjbJDOz3MhYW9cHkR16YPNY53watpUb5V36254HaIpmtlCjr/8YSgRizaj+fX2TQ0qZoS8Lf8VOW+qFU4vwKsgj0qwZ38PL9nHTnJHGJ0KFA4+doFYwuUiQgA5/l9oU4b7it56qkNdk2bxpy3NAfHADcLyCKNEAMSuQvoXOrwQ5t99I4RA1DnJLTYUkJqdm90iQzO6r0o00yAztWZTZFAs
X-Gm-Message-State: AOJu0YwrhB/IorBOhS1BPhHGqFB77beohXlKNxCHjRlBKiSdVJ/NbzZj
	0wxjaXJ+ntLwaSLNCU5ALk7BAnJdHkUZz4d8kQXoCGgBkludvE2EJBR5exo5
X-Google-Smtp-Source: AGHT+IEINCehKQMZTXmcAx5qlnP+s09xyFmj4p7ENeE5bwZ3oeKWK37cB9CfMhQ+sEHOL2DLHjmP7g==
X-Received: by 2002:a0d:cc4a:0:b0:61a:da7e:1f66 with SMTP id 00721157ae682-62c79666aefmr131080707b3.2.1717516021587;
        Tue, 04 Jun 2024 08:47:01 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b8bc8sm18504847b3.18.2024.06.04.08.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 08:47:01 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa6e0add60so4855589276.3;
        Tue, 04 Jun 2024 08:47:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7I74DeOulb56n7o9bTpheYMmggexvlAbeQgK8LKd8Pfpa4RnsTRcMDK5tpWHqBSn2DmyelqjPXMdUAc71jRfn5SA5SDpsr2XqG7i2Sp5+4hzBdnbQfxZwLN+vaxEck1S04gBiIC4unSo8Ckve4M0olFaFThmFllTaSgnZHvsiuspgiELXX9yNqtKhamBAY9dbjGncFU51+ib2duy0hwi6U9uoqhIQ
X-Received: by 2002:a25:ad03:0:b0:df4:a607:2429 with SMTP id
 3f1490d57ef6-dfa73d90ac6mr12970872276.45.1717516021094; Tue, 04 Jun 2024
 08:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 17:46:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7+O-+v=2V83AjQmTWyGy_a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com>
Message-ID: <CAMuHMdU7+O-+v=2V83AjQmTWyGy_a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outputs
> (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/V2H(=
P)
> Hardware User's Manual (Rev.1.01, Feb. 2024).

Hmm, I must have a slightly different Rev. 1.01 ;-)

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a09g057-cpg.h

For new binding headers, please include the vendor prefix, i.e.
"include/dt-bindings/clock/renesas,r9a09g057-cpg.h".

> @@ -0,0 +1,644 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* Clock list */

[...]

> +#define R9A09G057_USB30_CLK_RESERVED0                  197
> +#define R9A09G057_USB30_CLK_RESERVED1                  198
> +#define R9A09G057_USB30_CLK_RESERVED2                  199
> +#define R9A09G057_USB30_CLK_RESERVED3                  200

R9A09G057_USB3_0_ACLK
R9A09G057_USB3_0_PCLK_USBTST
R9A09G057_USB3_0_REF_ALT_CLK_p
R9A09G057_USB3_0_CLKCORE

> +#define R9A09G057_USB31_CLK_RESERVED0                  201
> +#define R9A09G057_USB31_CLK_RESERVED1                  202
> +#define R9A09G057_USB31_CLK_RESERVED2                  203
> +#define R9A09G057_USB31_CLK_RESERVED3                  204

R9A09G057_USB3_0_ACLK
R9A09G057_USB3_0_PCLK_USBTST
R9A09G057_USB3_0_REF_ALT_CLK_p
R9A09G057_USB3_0_CLKCORE

> +#define R9A09G057_USB20_CLK_RESERVED0                  205

R9A09G057_USB2_0_U2H0_HCLK

> +#define R9A09G057_USB21_CLK_RESERVED0                  206

R9A09G057_USB2_0_U2H1_HCLK

> +#define R9A09G057_USB20_USB21_CLK_RESERVED0            207

R9A09G057_USB2_0_U2P_EXR_CPUCLK

> +#define R9A09G057_USB20_CLK_RESERVED1                  208

R9A09G057_USB2_0_PCLK_USBTST0

> +#define R9A09G057_USB21_CLK_RESERVED1                  209

R9A09G057_USB2_0_PCLK_USBTST1

> +#define R9A09G057_USB20_CLK_RESERVED2                  210

R9A09G057_USB2_0_CLKCORE0

> +#define R9A09G057_USB21_CLK_RESERVED2                  211

R9A09G057_USB2_0_CLKCORE1

> +#define R9A09G057_GBETH0_CLK_RESERVED0                 212
> +#define R9A09G057_GBETH0_CLK_RESERVED1                 213
> +#define R9A09G057_GBETH0_CLK_RESERVED2                 214
> +#define R9A09G057_GBETH0_CLK_RESERVED3                 215
> +#define R9A09G057_GBETH0_CLK_RESERVED4                 216
> +#define R9A09G057_GBETH0_CLK_RESERVED5                 217
> +#define R9A09G057_GBETH0_CLK_RESERVED6                 218

R9A09G057_GBETH_0_CLK_TX_I
R9A09G057_GBETH_0_CLK_RX_I
R9A09G057_GBETH_0_CLK_TX_180_I
R9A09G057_GBETH_0_CLK_RX_180_I
R9A09G057_GBETH_0_CLK_PTP_REF_I
R9A09G057_GBETH_0_ACLK_CSR_I
R9A09G057_GBETH_0_ACLK_I

> +#define R9A09G057_GBETH1_CLK_RESERVED0                 219
> +#define R9A09G057_GBETH1_CLK_RESERVED1                 220
> +#define R9A09G057_GBETH1_CLK_RESERVED2                 221
> +#define R9A09G057_GBETH1_CLK_RESERVED3                 222
> +#define R9A09G057_GBETH1_CLK_RESERVED4                 223
> +#define R9A09G057_GBETH1_CLK_RESERVED5                 224
> +#define R9A09G057_GBETH1_CLK_RESERVED6                 225

R9A09G057_GBETH_1_CLK_TX_I
R9A09G057_GBETH_1_CLK_RX_I
R9A09G057_GBETH_1_CLK_TX_180_I
R9A09G057_GBETH_1_CLK_RX_180_I
R9A09G057_GBETH_1_CLK_PTP_REF_I
R9A09G057_GBETH_1_ACLK_CSR_I
R9A09G057_GBETH_1_ACLK_I

> +#define R9A09G057_PCIE_0_ACLK                          226
> +#define R9A09G057_PCIE_0_CLK_PMU                       227
> +#define R9A09G057_DDR0_CLK_RESERVED0                   228
> +#define R9A09G057_DDR0_CLK_RESERVED1                   229
> +#define R9A09G057_DDR0_CLK_RESERVED2                   230
> +#define R9A09G057_DDR0_CLK_RESERVED3                   231
> +#define R9A09G057_DDR0_CLK_RESERVED4                   232
> +#define R9A09G057_DDR0_CLK_RESERVED5                   233
> +#define R9A09G057_DDR0_CLK_RESERVED6                   234

R9A09G057_DDR_0_DFICLK
R9A09G057_DDR_0_AXI0_ACLK
R9A09G057_DDR_0_AXI1_ACLK
R9A09G057_DDR_0_AXI2_ACLK
R9A09G057_DDR_0_AXI3_ACLK
R9A09G057_DDR_0_AXI4_ACLK
R9A09G057_DDR_0_PCLK

> +#define R9A09G057_DDR1_CLK_RESERVED0                   235
> +#define R9A09G057_DDR1_CLK_RESERVED1                   236
> +#define R9A09G057_DDR1_CLK_RESERVED2                   237
> +#define R9A09G057_DDR1_CLK_RESERVED3                   238
> +#define R9A09G057_DDR1_CLK_RESERVED4                   239
> +#define R9A09G057_DDR1_CLK_RESERVED5                   240
> +#define R9A09G057_DDR1_CLK_RESERVED6                   241

R9A09G057_DDR_1_DFICLK
R9A09G057_DDR_1_AXI0_ACLK
R9A09G057_DDR_1_AXI1_ACLK
R9A09G057_DDR_1_AXI2_ACLK
R9A09G057_DDR_1_AXI3_ACLK
R9A09G057_DDR_1_AXI4_ACLK
R9A09G057_DDR_1_PCLK

> +#define R9A09G057_CRU_0_ACLK                           242
> +#define R9A09G057_CRU_0_VCLK                           243
> +#define R9A09G057_CRU_0_PCLK                           244
> +#define R9A09G057_CRU_1_ACLK                           245
> +#define R9A09G057_CRU_1_VCLK                           246
> +#define R9A09G057_CRU_1_PCLK                           247
> +#define R9A09G057_CRU_2_ACLK                           248
> +#define R9A09G057_CRU_2_VCLK                           249
> +#define R9A09G057_CRU_2_PCLK                           250
> +#define R9A09G057_CRU_3_ACLK                           251
> +#define R9A09G057_CRU_3_VCLK                           252
> +#define R9A09G057_CRU_3_PCLK                           253
> +#define R9A09G057_ISP_CLK_RESERVED0                    254
> +#define R9A09G057_ISP_CLK_RESERVED1                    255
> +#define R9A09G057_ISP_CLK_RESERVED2                    256
> +#define R9A09G057_ISP_CLK_RESERVED3                    257

R9A09G057_ISP_0_REG_ACLK
R9A09G057_ISP_0_PCLK
R9A09G057_ISP_0_VIN_ACLK
R9A09G057_ISP_0_ISP_SCLK

[...]

> +/* Resets list */

[...]

> +#define R9A09G057_USB30_RST_RESERVED0                  183

R9A09G057_USB3_0_ARESETN

> +#define R9A09G057_USB31_RST_RESERVED0                  184

R9A09G057_USB3_1_ARESETN

> +#define R9A09G057_USB20_RST_RESERVED0                  185

R9A09G057_USB2_0_U2H0_HRESETN

> +#define R9A09G057_USB21_RST_RESERVED0                  186

R9A09G057_USB2_0_U2H1_HRESETN

> +#define R9A09G057_USB20_USB21_RST_RESERVED0            187

R9A09G057_USB2_0_U2P_EXL_SYSRST

> +#define R9A09G057_USB20_USB21_RST_RESERVED1            188

R9A09G057_USB2_0_PRESETN

> +#define R9A09G057_GBETH0_RST_RESERVED0                 189

R9A09G057_GBETH_0_ARESETN_I

> +#define R9A09G057_GBETH1_RST_RESERVED0                 190

R9A09G057_GBETH_1_ARESETN_I

> +#define R9A09G057_PCIE_0_ARESETN                       191
> +#define R9A09G057_DDR0_RST_RESERVED0                   192
> +#define R9A09G057_DDR0_RST_RESERVED1                   193
> +#define R9A09G057_DDR0_RST_RESERVED2                   194
> +#define R9A09G057_DDR0_RST_RESERVED3                   195
> +#define R9A09G057_DDR0_RST_RESERVED4                   196
> +#define R9A09G057_DDR0_RST_RESERVED5                   197
> +#define R9A09G057_DDR0_RST_RESERVED6                   198
> +#define R9A09G057_DDR0_RST_RESERVED7                   199
> +#define R9A09G057_DDR0_RST_RESERVED8                   200
> +#define R9A09G057_DDR0_RST_RESERVED9                   201

R9A09G057_DDR_0_RST_N
R9A09G057_DDR_0_MC_PRESETN
R9A09G057_DDR_0_AXI0_ARESETN
R9A09G057_DDR_0_AXI1_ARESETN
R9A09G057_DDR_0_AXI2_ARESETN
R9A09G057_DDR_0_AXI3_ARESETN
R9A09G057_DDR_0_AXI4_ARESETN
R9A09G057_DDR_0_PHY_PRESETN
R9A09G057_DDR_0_RESET
R9A09G057_DDR_0_PWROKIN

> +#define R9A09G057_DDR1_RST_RESERVED0                   202
> +#define R9A09G057_DDR1_RST_RESERVED1                   203
> +#define R9A09G057_DDR1_RST_RESERVED2                   204
> +#define R9A09G057_DDR1_RST_RESERVED3                   205
> +#define R9A09G057_DDR1_RST_RESERVED4                   206
> +#define R9A09G057_DDR1_RST_RESERVED5                   207
> +#define R9A09G057_DDR1_RST_RESERVED6                   208
> +#define R9A09G057_DDR1_RST_RESERVED7                   209
> +#define R9A09G057_DDR1_RST_RESERVED8                   210
> +#define R9A09G057_DDR1_RST_RESERVED9                   211

R9A09G057_DDR_1_RST_N
R9A09G057_DDR_1_MC_PRESETN
R9A09G057_DDR_1_AXI0_ARESETN
R9A09G057_DDR_1_AXI1_ARESETN
R9A09G057_DDR_1_AXI2_ARESETN
R9A09G057_DDR_1_AXI3_ARESETN
R9A09G057_DDR_1_AXI4_ARESETN
R9A09G057_DDR_1_PHY_PRESETN
R9A09G057_DDR_1_RESET
R9A09G057_DDR_1_PWROKIN

> +#define R9A09G057_CRU_0_PRESETN                                212
> +#define R9A09G057_CRU_0_ARESETN                                213
> +#define R9A09G057_CRU_0_S_RESETN                       214
> +#define R9A09G057_CRU_1_PRESETN                                215
> +#define R9A09G057_CRU_1_ARESETN                                216
> +#define R9A09G057_CRU_1_S_RESETN                       217
> +#define R9A09G057_CRU_2_PRESETN                                218
> +#define R9A09G057_CRU_2_ARESETN                                219
> +#define R9A09G057_CRU_2_S_RESETN                       220
> +#define R9A09G057_CRU_3_PRESETN                                221
> +#define R9A09G057_CRU_3_ARESETN                                222
> +#define R9A09G057_CRU_3_S_RESETN                       223
> +#define R9A09G057_ISP_RST_RESERVED0                    224
> +#define R9A09G057_ISP_RST_RESERVED1                    225
> +#define R9A09G057_ISP_RST_RESERVED2                    226
> +#define R9A09G057_ISP_RST_RESERVED3                    227

R9A09G057_ISP_0_VIN_ARESETN
R9A09G057_ISP_0_REG_ARESETN
R9A09G057_ISP_0_ISP_SRESETN
R9A09G057_ISP_0_PRESETN

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

