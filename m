Return-Path: <linux-renesas-soc+bounces-26075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A34CD99F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3643074378
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68146331235;
	Tue, 23 Dec 2025 14:25:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD31C330B2E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499937; cv=none; b=ASGlAcIlRbAutcQbmPfpx12QUNaaEuxuL1xx595twjs/El3QUJw/Ss1byYUQhql0xea0tY2cErg+K8j5MmjSI+N2hpdsDz2un/d0ViLhMA6eFcXldHTpvpdWe4bCUDy4I2KAxa0DKc+L5kLzAQsgTiGk+JaAFPj7YzRFtCg3OgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499937; c=relaxed/simple;
	bh=p/yCjY8u171GpGGHaFI9kezO5mhBvA9uh3H/9co9+sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0ca9Gbd5wICB+ABsNAiHHoSvUYbOwyguHYOJBdw/cpWLf482FQjecrPokDPoNvk12EHXaaLKhfdW8hdEuVbyfv3CEbYmyM/UWAM6EeukwbZomUUXwPJaXhYXyeqYa0PBd84Sdk64AK/h0CwBnVgtv38NKdBQEjgW0fJKaH0yAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso4525297241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499935; x=1767104735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIC0rikwFGHXRYQ21Y9JsVA9Qraw4AvBReoBxo8fio0=;
        b=ljYcpTAxBRNc5UK0McPUxGZJkZpsZwz6ZUXF3a4UqGCQA7SAlgNgUTvxWwjiX+LyXA
         cLy84+kUi04M04GTIBvgnvnMSSEIBGhm47Uzx1JJYQX+zvsj6FtD/ngM067F1AqB7GA8
         kkruGFploiIimz4AqNBfxhlkB8DfiJpewDx1/hlcM1P8EtN2pfGr9Bxz8pXrkHayIhne
         qywsRXquxmyVPXoDf8dVyVKFvRLofYiHib/uv9eZxe55Ibk//iMsS1FdyNH4LZeS0MCa
         D/K/CD+jlL4H2SGEgfPbxjMGfb42b4eBOOZ3ixd9MyYWf+jEilSGyRs20mBQdiuBfZlE
         cLQg==
X-Forwarded-Encrypted: i=1; AJvYcCVbRDcOa2lFVil2Gn3/r/ek01m+ZYetM0YDQRhQwM6ASbsqHZCNVc9NEbo2kQU9OycHY0COwLlD6RMNRNnRPsEujQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvslot9rcAGbEvlL/N4YGcq2apEUwDADdlxECdP9io7FwiLFXN
	veXoKOh0qvddMcGyycN/yr6ZUq/XlRkq3BiB50yTyhLPM1Tcyr8GH3nZ/ZZfsqSNm6Y=
X-Gm-Gg: AY/fxX7Vk/hpSbggIqWB+fK9KFyfqQEz13pvLe007uo1TqivL8mFJc15a6Y0tkOxIKd
	zZ8MToEt6ct9EfxQG3fqJ8MBPTpUJuhGddnGOqNPkCiJzEPr2ofkbbWyaQUPrFNUlvJ2DyFgTD7
	nFpWLWsFy+tLfOxpWZ4u4EhAzbHHlNC9tDaSI8KDcyboio1YZFXhXCoUKjOIaAFJLJCquQq9v3F
	HuNtnmnRNnfqSryX9AAaoaICl7uSSkD+GeM9hyB5EGQMuuIy1P3dso23HVdNPLu+bPIg6sz+jGF
	IT9sRz9S8MtnA0cP7aCRVc02rE5nbPq3OYtjOUy6dLvkN9Ass5oT2mt6ACCnyekr5CJ5m/W7koY
	uBTpVZ20a00E8SK60AhIsA+iVkAA5IQrCnrjBib+PwAIa/mRg+gmhuksdylbkivRl40LMidoQb9
	AUk+hcXDNj8UPEI2eqT5CoIXxpRuUnadnCLIsz8A03J4GQ/l4AaUZs59HcKVE=
X-Google-Smtp-Source: AGHT+IHDGa+MFfQq6x6zJmrz8a8d3EI2aBBsB58mLW72ebvEiQ3sLTmXhUKTCtw/ZPwjLwduUBwUWw==
X-Received: by 2002:a05:6102:2928:b0:5db:de8f:3278 with SMTP id ada2fe7eead31-5eb024c578amr6676965137.10.1766499934529;
        Tue, 23 Dec 2025 06:25:34 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9434176c1d3sm3859901241.9.2025.12.23.06.25.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:25:33 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfaceec8deso3078966137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:25:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0I5Z/FfaG6Mj0a0GP4xk8LQwZ0yNgLnKb+ejxfdKBRjQyvcVZPSYclBLe/zEXscVZCe6F7oi+wGerUvlMVqAmCQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f56:b0:584:7aa3:a329 with SMTP id
 ada2fe7eead31-5eb0237d7f4mr7071522137.4.1766499933176; Tue, 23 Dec 2025
 06:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201134229.600817-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201134229.600817-14-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201134229.600817-14-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 15:25:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNmx=o4Vi=2o4BcBpkV6gjeOj9CEbbkYMtdVTOakhv0Q@mail.gmail.com>
X-Gm-Features: AQt7F2oCaB4_nkSocOGONFf0pCyIN-Ja9bMJ4xn0DqXAemYEO2QdHhg1pDxyWjU
Message-ID: <CAMuHMdUNmx=o4Vi=2o4BcBpkV6gjeOj9CEbbkYMtdVTOakhv0Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: renesas: r9a09g087: wire up DMA support
 for SPI
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 14:44, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/N2H (R9A09G087) has three DMA controllers that can be used by
> peripherals like SPI to offload data transfers from the CPU.
>
> Wire up the DMA channels for the SPI peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -200,6 +200,8 @@ rspi0: spi@80007000 {
>                         clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKM>,
>                                  <&cpg CPG_MOD 104>;
>                         clock-names = "pclk", "pclkspi";
> +                       dmas = <&dmac0 0x267a>, <&dmac0 0x267b>;
> +                       dma-names = "rx", "tx";

Same comment as for RZ/T2H:
RZ/N2H does not seem to have restrictions about which DMA controllers
can be used by which SPI instance.  Hence shouldn't these point to
all three DMA controllers?

    dmas = <&dmac0 0x267a>, <&dmac0 0x267b>,
           <&dmac1 0x267a>, <&dmac1 0x267b>,
           <&dmac2 0x267a>, <&dmac2 0x267b>;
    dma-names = "rx", "tx", "rx", "tx", "rx", "tx";

Note that this requires updating the DT bindings, as they currently
restrict dma to two entries.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

