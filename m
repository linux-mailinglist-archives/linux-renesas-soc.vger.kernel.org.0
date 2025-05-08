Return-Path: <linux-renesas-soc+bounces-16812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC84AAFE17
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 17:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CB781C26D2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4316313635C;
	Thu,  8 May 2025 15:01:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40A1ACEC8;
	Thu,  8 May 2025 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716461; cv=none; b=m/Ah9pA7hbksYocNE6NWubQmzvoYzrb+dSlRs8CiV9oUQY8zwivg2uq86+1UZ3V0jOK3ylVY7OJFd78US/XaMnsNllGU+NweitZ27XRk53q655qOe7cjilNOAR/9jJhMEbF/2eE7Wu923Y06WoP5BAKSi4BEPYMcZyxjlbLxRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716461; c=relaxed/simple;
	bh=8RDhFYDwcDVc1DiFxEIWmEdG9plvXdidftKG2jeBThk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av/rseag+eEErZGXJyc8QhXkMceIj7LRAux6LnX+JLJgTHent2kINYPn9U8b8Bs4hYRMPlDrAAwXJaljbgZZTS4qSv6eJTJju0J6W6d/281nJp1v3UMdEiFO+YFlfBNSrqHBRULK+V0YMzV3LoJu7fi4AcOc0UbtEGJF/+xcb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-400fa6b3012so1417510b6e.1;
        Thu, 08 May 2025 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716457; x=1747321257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWdphALhe5f4zB5EveV6hmkBIZsTsV0+HcDvgxaTdFQ=;
        b=c+Iru3Encp17GmxdpqNrgGmD5G0onrpnP28rMdKn8Et8YCm1mOmuqbh2+mvksG1gUD
         BO0WDqoPTvEd6AimUKEmls/L9lO+65NkY1EPfuXmJi4x1P0DbN3CYecoHvbuP5AQ6sg3
         j6PjHY3rxpmz7N3HJL/iuhZR2BN1tghRqpDb0FBGC+7nLqjaUB8yyn1gAW/Y/QsYMCUK
         2ToOGHSkUrOd/IppF5Ph8uJb1dri6aXvrtgXrlyf7YLUjE0Xa0ndsaHhVWXu5sXH3lGB
         XOjLBte0CVewxFnjnAOLLD6Im7InVV62J/5vVf8g7Y2MwT62DJu6zulWM8I/T1QUOWel
         tCYw==
X-Forwarded-Encrypted: i=1; AJvYcCUc7N/ZZcrg8FEy3jJcEgL6mXjeNVfSfArwFrutoPKKjY+dsKkhTXJBRRgQ+Pz8EaeO+9fCWVj/tA5T0qfTCN1v2YQ=@vger.kernel.org, AJvYcCXvKoE7/EOBIvacAqZH45JerDh/CgNhIvQ26QUHFDM/06kEMrpjJtFtS/+6YirZC38EhJOnvX1HA69fVonA@vger.kernel.org, AJvYcCXzWIFeb+4hXU/wuxbvnc61FLIKaRS84MuWycdJ1isKt9Rk91jnWtFgCTO8cGCuEHPJewblhehOb1bL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkms0FsKr+tCZsb9xz0hi/GTqhFkW7ldyuwzEAT8RE60PAf5E0
	SmttYO+X6Le43I7J5WNXLf9fUdeExl51tUintjN24fMF+e1JoKJAhN9ljlnH
X-Gm-Gg: ASbGnctRrxXofNXotf7Wwa1dMbeNpMs4GS2DUAmYs+lMDuEATJSOP+/SmwO5M4Ui6yz
	im/tefl7K/e94AF+IkSr6nTl62fZpqS6D/ZLjEId5SrcWH3P0u980/XphCJjPi3Z1IV1UzmgyB7
	oPPQaClpWjmEjeoTw621qPGGTpOU1X+ZgGcJU/0mFL40BTxEUYUsVugEsXCtMnb43PV5w3+3DXk
	bJXlZqFs4rywUBwNlNVDsqGqo0Ws8+RzEn8407xebJ0MCvJEEJxcOF43pCLMfKgQ5clpZczYICb
	ZTwVK94OGF7E3eQZTinR/2ajJXb4aShcBkl9abVTbO4DfBN1CKq4zgZCDMJfquZG3+SXKreRyHV
	0dHk=
X-Google-Smtp-Source: AGHT+IFmWjX4W2vQO7Lumf7RsOh5dXtRh/wQlEzLeCt/s9tw+ajIJYzjHR5p/umm3CSyVt6e0vyzcg==
X-Received: by 2002:a05:6808:2016:b0:403:5af1:b05 with SMTP id 5614622812f47-403779f2b54mr2256834b6e.16.1746716451084;
        Thu, 08 May 2025 08:00:51 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4036f3b1604sm1298419b6e.50.2025.05.08.08.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:00:50 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bc3987a05so725139a34.1;
        Thu, 08 May 2025 08:00:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdqjictZvHJYzc8KYZpIVdnn7iiu9etxYu3Abxp/rNQVlWPALaieBms9dwGaKYnu9gT6MQh4lU+7m1@vger.kernel.org, AJvYcCXWxNlc0Dqb+E5vsYhMfsR5N3kvx0CSjfl6TPlNiFgSaDd7Ncn0RBYMYMC4t9Mfh1MbR/TPrGgHQYIHom4m@vger.kernel.org, AJvYcCXeEz3J+2GJzNA6TjoEc2+Cscb51L2qlLtQEWzcy+8DYEA1QsC7p6OU6hzv9u1fqFme8Wh81+o/h8JNuR2DE9S+TRo=@vger.kernel.org
X-Received: by 2002:a05:6102:825:b0:4c0:435b:5dd2 with SMTP id
 ada2fe7eead31-4ddac83476amr2563946137.1.1746716440300; Thu, 08 May 2025
 08:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250428205518.454960-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250428205518.454960-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 17:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNkrGHAyYFTqt_EEhMzRG-cKQEVM9B1vOv5h3bzKDfmQ@mail.gmail.com>
X-Gm-Features: AX0GCFsTLCCFQZneEK-FVcmYtwaudAVBsgt7SR7xNi7vIiJc7LxTqmpl6veCuos
Message-ID: <CAMuHMdUNkrGHAyYFTqt_EEhMzRG-cKQEVM9B1vOv5h3bzKDfmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 28 Apr 2025 at 22:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Renesas RZ/V2H(P) SoC is equipped with 2x Synopsys DesignWare Ethernet
> Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G057
> RZ/V2H(P) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -701,6 +701,200 @@ sdhi2_vqmmc: vqmmc-regulator {
>                                 status = "disabled";
>                         };
>                 };
> +
> +               eth0: ethernet@15c30000 {
> +                       compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth",
> +                                    "snps,dwmac-5.20";
> +                       reg = <0 0x15c30000 0 0x10000>;
> +                       interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>,

775?

> +                                    <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
> +                                         "rx-queue-0", "rx-queue-1", "rx-queue-2",
> +                                         "rx-queue-3", "tx-queue-0", "tx-queue-1",
> +                                         "tx-queue-2", "tx-queue-3";
> +                       clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
> +                                 <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
> +                                 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
> +                                 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                     "tx", "rx", "tx-180", "rx-180";
> +                       resets = <&cpg 0xb0>;

power-domains = <&cpg>;

> +                       snps,multicast-filter-bins = <256>;
> +                       snps,perfect-filter-entries = <128>;
> +                       rx-fifo-depth = <8192>;
> +                       tx-fifo-depth = <8192>;
> +                       snps,fixed-burst;
> +                       snps,no-pbl-x8;
> +                       snps,force_thresh_dma_mode;
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,mtl-rx-config = <&mtl_rx_setup0>;
> +                       snps,mtl-tx-config = <&mtl_tx_setup0>;
> +                       snps,txpbl = <32>;
> +                       snps,rxpbl = <32>;
> +                       status = "disabled";
> +
> +                       mtl_rx_setup0: rx-queues-config {
> +                               snps,rx-queues-to-use = <4>;
> +                               snps,rx-sched-sp;

Any specific reason the first instance has this property, while the
second has not?

> +               eth1: ethernet@15c40000 {
> +                       compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth",
> +                                    "snps,dwmac-5.20";
> +                       reg = <0 0x15c40000 0 0x10000>;
> +                       interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
> +                                         "rx-queue-0", "rx-queue-1", "rx-queue-2",
> +                                         "rx-queue-3", "tx-queue-0", "tx-queue-1",
> +                                         "tx-queue-2", "tx-queue-3";
> +                       clocks =  <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
> +                                 <&cpg CPG_CORE R9A09G057_GBETH_1_CLK_PTP_REF_I>,
> +                                 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
> +                                 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                     "tx", "rx", "tx-180", "rx-180";
> +                       resets = <&cpg 0xb1>;

power-domains = <&cpg>;

> +                       snps,multicast-filter-bins = <256>;
> +                       snps,perfect-filter-entries = <128>;
> +                       rx-fifo-depth = <8192>;
> +                       tx-fifo-depth = <8192>;
> +                       snps,fixed-burst;
> +                       snps,no-pbl-x8;
> +                       snps,force_thresh_dma_mode;
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,mtl-rx-config = <&mtl_rx_setup1>;
> +                       snps,mtl-tx-config = <&mtl_tx_setup1>;
> +                       snps,txpbl = <32>;
> +                       snps,rxpbl = <32>;
> +                       status = "disabled";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

