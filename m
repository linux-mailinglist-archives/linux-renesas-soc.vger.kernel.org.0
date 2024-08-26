Return-Path: <linux-renesas-soc+bounces-8247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D295EE98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1DBA1F22A6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF0414A09F;
	Mon, 26 Aug 2024 10:38:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD264149DE8;
	Mon, 26 Aug 2024 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668713; cv=none; b=YTKvWOape0nUW9pUirUHocXWB8pZs1mGW1rzsJLHnoA+mbzWHTNYrMwST2WRfwgRoS5XyExD0vssFzv/aBq780CL3Zmmd5qMmeyo+F4Nql8AA8cEppqsTpL6At3LP4lrPrlDBgDyVy90I29oSpJQfxzaazeevjzsDPDKMv7a0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668713; c=relaxed/simple;
	bh=4HSgci5ey3CyoU67SNEojALGsTeyRLPQkiqz2Puqyhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ro/vX9x7sYbBqnrpEmDHHAYN1qTV0n1zELHNm2rH77qLsNGal1zPE1Mdlv6sLsVHpWjp26WDwAQCVFVsGlkSmc0Jf5xzzCp4rJvUzQHGEwXt+VKOiL6bIvvXgrveSYteHc5tluDqZ8hfVU0+sFDZuMEyXbsgfhpyhVEb3W7d9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e116a5c3922so3926517276.1;
        Mon, 26 Aug 2024 03:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668709; x=1725273509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nw/YPnfipNGWgqwK6wJ71IWbvCY63Sc9TUnNDiXF3a8=;
        b=P0Y/uwiUNg9yPJwZ5WNoPIZKj0lfRqOnkaHQLOOaM8A9mUUBXMU8LhiVRoKaT7St24
         xc5xSdLAIr/nLO5PBLSNBClWJ3PUqeJ+w/tTYIdMcCVlnV4uYQ2xWHoSujsWQnjUHfxQ
         iKjh+VHS1vWe8gb7Fgfds2DV5PY3aawzt3wNsExNEbxz0I+XN2UFlTFc99AvshA5eZmP
         LPSZJIRBf2837Z8FWB3kCnClY07VWLPN1YL8kaQy7UXL/vHV+T5RPvslxtZ4TEr+zc44
         B+TURiEPKzLvKHckl7sDOCEmJmLEGKpMi8A5HKSYtJVuwyQn1dVXMgKSRnzTBtSLD505
         KI4A==
X-Forwarded-Encrypted: i=1; AJvYcCU0Y4x3CkMi4exTD7i/diBevsTr8Glg7bFulWqG9Pz/bJvj19Ols6HozJakDXn0lW2vtVJSXEwoB0jT@vger.kernel.org, AJvYcCWnolFofEMiXPcWlw0Ekb1fEfjrIaCC1ED4MQBsN3VK/yhMB+psTdFGGK5sHtSRvdWuO8mt9UI6av3cPrvmSx1Pk74=@vger.kernel.org, AJvYcCXv7aKlSidJ/RKZLHy+UaeIAjjBC43b5XWqdBlC8BPrC5KlGQhq8OxISSWLwMfnDKile9r2bwIbIOCcjW4A@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+2Bt98fFnmaAKEQJTgwIfXtVsU3WIAbBWzymbHJ9MPdjsd/d
	QOzmrxQyhGmJxfvnzLz9G+5Mrt5iUoOfQr9KVDNvzeJ9093jCvw1sCUFISCz
X-Google-Smtp-Source: AGHT+IFkjFGBO93hDyawQ7tkpvkCjyeLURSbSwo+AZD65d2GMOJ23RcVYmTxoKlO64GF+JFUI3jJMQ==
X-Received: by 2002:a05:6902:1892:b0:e16:5343:ba60 with SMTP id 3f1490d57ef6-e17a8684fa6mr10398675276.43.1724668708673;
        Mon, 26 Aug 2024 03:38:28 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e680b1asm1913588276.58.2024.08.26.03.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 03:38:28 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6c0e22218d0so43354207b3.0;
        Mon, 26 Aug 2024 03:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWV9S61aCd4u8Otk8LHBLvaxRF39O4CVbifSkGpApc+W4s1IuIuZLjbgwe1pWput2JVJ5U/WtVz1ZTJeLmtFc4n0NI=@vger.kernel.org, AJvYcCXubAeMdQjqQIlIwpCsTVnKlMkTgjSjspB1HVRzIFfzfKP+BXQuCmltuUfv6dQ6p3yNgd3L4v3wMFAf@vger.kernel.org, AJvYcCXwR6L/ebCSHm7yr1PrVi3E+HwxBYpEIlLnmMJd8PpN3R6RPVUi4vumsJTlunIf2lNoOgdnMKAeCfBIe6HN@vger.kernel.org
X-Received: by 2002:a05:690c:1d:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-6c62576b7f7mr122879587b3.18.1724668707476; Mon, 26 Aug 2024
 03:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 12:38:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC0sgF48Thdg95zyPn04XJv1H+ZScXZrUfzcp8v738ag@mail.gmail.com>
Message-ID: <CAMuHMdWC0sgF48Thdg95zyPn04XJv1H+ZScXZrUfzcp8v738ag@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial SoC DTSI for Renesas RZ/V2H(P) ("R9A09G057") SoC, below are
> the list of blocks added:
> - EXT CLKs
> - 4X CA55
> - SCIF
> - PFC
> - CPG
> - SYS
> - GIC
> - ARMv8 Timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated GIC node to match with the coding-style of DTS

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/V2H(P) SoC
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible =3D "renesas,r9a09g057";
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       audio_extal_clk: audio-clk {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency =3D <0>;
> +       };
> +
> +       rtxin_clk: rtxin-clk {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency =3D <0>;
> +       };
> +
> +       qextal_clk: qextal-clk {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency =3D <0>;
> +       };

Please use alphabetical sort order (by nodename).

> +       soc: soc {
> +               compatible =3D "simple-bus";
> +               interrupt-parent =3D <&gic>;
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               pinctrl: pinctrl@10410000 {
> +                       compatible =3D "renesas,r9a09g057-pinctrl";
> +                       reg =3D <0 0x10410000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_CORE R9A09G057_IOTOP_0_SHCLK=
>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       gpio-ranges =3D <&pinctrl 0 0 96>;
> +                       #interrupt-cells =3D <2>;
> +                       interrupt-controller;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 165>, <&cpg 166>;

Please use hexadecimal reset numbers, cfr. the description in the DT
bindings. E.g. IOTOP_0_RESETN =3D CPG_RST_10 bit 5 =3D> 0xa5.

This comment applies to all resets in this series.

> +               };

> +               scif: serial@11c01400 {
> +                       compatible =3D "renesas,scif-r9a09g057";
> +                       reg =3D <0 0x11c01400 0 0x400>;
> +                       interrupts =3D <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "eri", "rxi", "txi", "bri", "=
dri",
> +                                         "tei", "tei-dri", "rxi-edge", "=
txi-edge";
> +                       clocks =3D <&cpg CPG_MOD 143>;

Please use hexadecimal module clock numbers, cfr. the description in
the DT bindings. E.g. CGC_SCIF_0_clk_pck =3D CPG_CLKON_8 bit 15 =3D> 0x8f.

This comment applies to all module clocks in this series.

> +                       clock-names =3D "fck";
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 149>;
> +                       status =3D "disabled";
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

