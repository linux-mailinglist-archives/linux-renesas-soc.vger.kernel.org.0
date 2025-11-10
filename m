Return-Path: <linux-renesas-soc+bounces-24416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F448C475C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B5645349FAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080B314B60;
	Mon, 10 Nov 2025 14:53:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D1314A67
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786432; cv=none; b=jg/WHK+EUI1pQvZC8Wj3JDf8rI2lBB1s/7GM+qaUkz3kUoQgiai+oyhcVzufP93u+KBbw8aWxY5gL28G/kJV5jkK3t+ZqwqkWDASk5KggO9YN9hrP05RkEtpH9eE74okCpbg1Url7EXRusAJGSifQ7jz7TmGniLTHkOfh3vkWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786432; c=relaxed/simple;
	bh=uh2nsHm1TccBHviN7yt6RF3Wbnsj4I0JcKQPHH3BVJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSgJ/oIvSNf7ypBW3nmFywHgxDvTRY3ciWaB5NvbASaQNSj9Z2Ako51ZNcMIF5NatQGsGWCM41RM14v2CAFv73SjANdLA9kk4M3LG0E8mSeUMCG1d4YHEo+Q2TfL6pBk1ssnSfLowflMld+lkg+Qvwm5DfQxlIrmIlyaZ6mGbdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-559876b6514so638442e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786429; x=1763391229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBDbEJ0nGZ51BHCYDbGr9xQJt2w4kKvCTSyIXM32/kQ=;
        b=CNKsf9EZrh9UR4sC7aTiBKTW6Cc4wj1wMuAGL7TDTJzPTm95aYhn4vamYT9BoK4TvF
         RvaDAk6qvFS/7CFpFygk8dylDbbu9xNaAod2IlR3vLVGmlsH9T116O6B+pkxrcVHCsPY
         0Ujit27SakS7MlV/5+J2B0hzB2TpPXsjiT3a7bXsea1wnybQwxamk4W7Kuqt9yOumTMd
         4U1b1tRWZWX0WSGmUk+HRkKjdwZHxZ8PkIPvPnEKdgYHbEInj+4URBfqJnRSeNzMZrCH
         YSDyKLUBbk7F1YiYD/6EXFHvC9dciaAkVIKyTw168gKRz6z1y2nmVW0OVXgv/kcltzEl
         8GLg==
X-Forwarded-Encrypted: i=1; AJvYcCXu5MBYdUYOutMTQwDyrJeZg/Eea+OYbVPJI9hQ65uao0UygZf/DuiLRvTQ0KuBpqYaIYUc0BIUhXo15O67qVPT1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7CmB9mMN9Zi69pE5WRcYFRK4SzV08k9IBJSSEcsaiBcb5ib1
	M3BCUyryeL9Jtb6WzMrpUqJNCUy9yGxLJqjx0v0EjeozYmVSoFaLFmMk0+681fJ7
X-Gm-Gg: ASbGncs52Gd981CbyQu7+7ba98JBOwWt3rDB8RWZ8yHt3rjJ6GjKXUjfav5ThLLX6s4
	Z5hDZA/YMaVSQGxV2ZZ0+sa+a+jhSZ1ZaWJo+7M/d+e/h+PbpAS4IpXbMExrsikZAHLHoK0xiMX
	OaLUWqY260EJZzhJ1tyAAI/m5mD+i9/zIuM0Letl8+XGgSWXQKYgn0fOaYnsEtS/o1gE4l4rPnG
	Uhd97x0MDXijYe3sEWkemaSdNl7sbUugp+ZAT6AdtxLj29JW59ir7eltPpmT4r7IAw8jKNuoiyY
	FYEtzx3kfQlssNp2y9ytWq5Rq///Y1pDEZappBqSOX93e0BcPtWrBMnwun4NSUCD1OuKaMGJxK9
	zmeCNLr3GYd5u3o9I9lWrZNhqrtea25cl+kZUBXHaTi++/+1tXuz+q2bejBHx5HNVgqkEAzZC6w
	VPX3atpTuaWPQq8PkKg0+HgCECfJS8+KPUkSSjlXMbDA==
X-Google-Smtp-Source: AGHT+IE1M1lWdPv63Px2WuBWvusGc7hGcxBPwNHANkFAUrFNpYwAShdR68G3f6AqSFdjkPw/i21HgA==
X-Received: by 2002:a05:6122:221b:b0:54c:5f47:9260 with SMTP id 71dfb90a1353d-559b324973cmr2427965e0c.7.1762786429273;
        Mon, 10 Nov 2025 06:53:49 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958286c8sm7331970e0c.17.2025.11.10.06.53.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:53:48 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55960aa131dso917999e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:53:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRJMncOSXf0TKyzV5I2KtDSy5sX/PfhrCPoyhU+4FEQQ8YVmShI+SX/j8TZEmO9+akdC1QNS8s5pIe/7nOyyTbHA==@vger.kernel.org
X-Received: by 2002:a05:6102:4423:b0:5db:ce1d:679c with SMTP id
 ada2fe7eead31-5ddc467ef04mr2317202137.8.1762786427413; Mon, 10 Nov 2025
 06:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028175458.1037397-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028175458.1037397-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 15:53:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1jaDDrAruoMK860UP7UXRBf88nY5rr9WaR8Nggy9yEw@mail.gmail.com>
X-Gm-Features: AWmQ_bliN2EbPfNna_bfXmkjvrkOSZzdIDZ9FQoc0Y55u7pPWnoWcSMG6AzvldQ
Message-ID: <CAMuHMdV1jaDDrAruoMK860UP7UXRBf88nY5rr9WaR8Nggy9yEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a09g077: Add GMAC nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 28 Oct 2025 at 18:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Ethernet MAC (GMAC) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
> The RZ/T2H integrates three GMAC interfaces based on the Synopsys
> DesignWare MAC (version 5.20).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi

> @@ -495,6 +933,13 @@ sdhi1_vqmmc: vqmmc-regulator {
>                 };
>         };
>
> +       stmmac_axi_setup: stmmac-axi-config {

I will move this up while applying, to preserve sort order
(alphabetical).

> +               snps,lpi_en;
> +               snps,wr_osr_lmt = <0xf>;
> +               snps,rd_osr_lmt = <0xf>;
> +               snps,blen = <16 8 4 0 0 0 0>;
> +       };
> +
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

