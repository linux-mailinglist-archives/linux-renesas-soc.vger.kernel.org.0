Return-Path: <linux-renesas-soc+bounces-25324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99711C92100
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 14:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 374364E01FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5041132B99A;
	Fri, 28 Nov 2025 13:05:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A6F19049B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764335102; cv=none; b=swqt9du54PVAmkOQYkS5+spR1Kl1/l3kW52bdBwxv55JP+8qhLxCvWy0SZLd9elf1k2+spnaG+doEpnUIZoa2yy0Bsfx3tpbLBf4kxY5Hyvqtv7BnvLBzrqSJ2bNRi8w19U+OLM4nVQU36Zhyd0PtNyI8VSsLs/NtVrovoH2C/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764335102; c=relaxed/simple;
	bh=au23iHuxQvv/fGzuf/GlcIem5PnCzbrCs9hwqDlmKyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjUmH/jn/q91UNktKWw+rWMsyGRKXdxmyysJrZEzY3NdfeaSGciCMBogSE9RqjwLbVa35YIfR/9afEhbUJA/tL8BbzbsIuyOdCqB3BtmEPcJFNSZR1fVCn75uHaDKdro3VJGvP5/MJIY020nvq594jywfIaExxEFDuOinUjMbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so1274182137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764335099; x=1764939899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM4j5YOf8sT3vVFGb+zNY6anYGnUfAZyNnVoHw+EbUA=;
        b=etr9KSUG0IVgSl/SxCpohAy0ldEgrqnRqxy/l/Q1tl51iqMgbkqkP5jANM84HNhcPj
         De/J+OkNyx3Zsw/J2dk74wHQn41WzRvXHBEf9E7Dt2V9mAHE/1+pYJmq7jTJ8l8/LeuT
         8J92moatAy5CVgjUfZCHsOcacvEritGwn2uh4cQaF8Aoxj99z4hWYZH7smEmf+Ngti4T
         XGRVadG/0Y8u7NvxBNsVFtIFUor5XW7xYLweNn529fNhq+trrttSgC+/EYL74R1HAu1O
         SFyzTh9dyx1ItcMj1YLtj5JIcbg0Q5N0fX/ua7FGuwIerTdy8Ug6V+oZQ4quq8vyvAip
         ZAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+NAUIfw9LivlHMlsjuQueAvOFr+eycQXzWeULzlZvf1xHNC0NgjklFoqDAzl1/VW7DM5IgATiMt0C8X9FSiUV7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZryWm1jobpOvNrpnWPsO3Z0CdPppF0NV6BS6mEhz7cC/Cbag+
	Ect9B178QI1YRYMu5CZ9PliGgRRlrnJO3kcwSgFebqy4HlWW2ut9yIlXj5Mxl+H+
X-Gm-Gg: ASbGncv2TtjVcqSOMaj1hPncqTpK3LRf26wCEGpJf3AeTfIoniFMnXiwNkiQa9mHCNl
	ahv6TuDT7iDXWpzj5gYYvoi3wFn0dx7gJaIivao/k7rTekpu/4sEV63+jfAVXVbfvFEPgmtIuIg
	xjf9XdOCh00snJsPfPt9JFypDePM55oFEPL4NPuleBxkj8d76IjgLQ3r6HlAE6qVz76Q9VEoUAL
	RKxk/hSwdstBsExqj2Rr2X4GCIocEse3olLD6+fhY+aC6LAxxE57dlG3zdVX1xDcNm5fl1K+zms
	7mncC/Y2OTSqX/9N049CRDcl4GJGpUIYOgsHFQqpcrSbEwVXJDY+G8YiPpjwSVqtxsm+89rbZH+
	EDb56llIJQ4pEg3mHfaCyKT84yJhBcBfKy9zTUxtD6rh2XABPySXmYWYNKVwhpes1tTJec6xZJf
	JsKS2SP4YyaqkqHjmt+zbUWQa2w1vubdekUs9Za40eNKJo0pEe
X-Google-Smtp-Source: AGHT+IFebOc2LTGD3BgFCSduqpQbJzwQxtIQgeIgdfFGCYArBWA7sJuMLbD9LiGzXvtz5S6gU4COZg==
X-Received: by 2002:a05:6102:512b:b0:5df:b45c:9ccb with SMTP id ada2fe7eead31-5e1de3af7c3mr9536826137.25.1764335099367;
        Fri, 28 Nov 2025 05:04:59 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd69da72csm2048635241.0.2025.11.28.05.04.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 05:04:58 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so1274152137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQYT3QgSVvQMJzfsRt9M9AMe7sc5P5O2dSxJnMvuVFGMM7szIeAmk6+t35KOQJG3biOmPoo9OH/3JUSX+JpJNrUw==@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:5db:1e80:7813 with SMTP id
 ada2fe7eead31-5e1de4a62a9mr9458870137.43.1764335098266; Fri, 28 Nov 2025
 05:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com> <20251027154615.115759-18-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251027154615.115759-18-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 14:04:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3GP6o=3tRZOQ5gmh7ty80KO15yjymDUzzwB75dv9K3g@mail.gmail.com>
X-Gm-Features: AWmQ_bkHMYYJWMCUXNN9aQEu2x2efnHZ7JBcct5_vJEk0KE8N3rfaxtwsaleFjQ
Message-ID: <CAMuHMdV3GP6o=3tRZOQ5gmh7ty80KO15yjymDUzzwB75dv9K3g@mail.gmail.com>
Subject: Re: [PATCH 17/19] arm64: dts: renesas: r9a09g047: Add RSCI nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 27 Oct 2025 at 16:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add RSCI nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -823,6 +823,196 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               rsci0: serial@12800c00 {
> +                       compatible = "renesas,r9a09g047-rscif";

"renesas,r9a09g047-rsci", as per the updated DT bindings.

> +                       reg = <0 0x12800c00 0 0x400>;
> +                       interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eri", "rxi", "txi", "tei";

Missing "aed" and "bfd" interrupts, as per to-be-updated DT bindings.

> +                       clocks = <&cpg CPG_MOD 93>, <&cpg CPG_MOD 94>,
> +                                <&cpg CPG_MOD 95>, <&cpg CPG_MOD 96>,
> +                                <&cpg CPG_MOD 97>;
> +                       clock-names = "bus", "tclk", "tclk_div64",
> +                                     "tclk_div16", "tclk_div4";

Third and fifth clock and clock name should be exchanged, as per the
updated DT bindings.

> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 129>, <&cpg 130>;

Please use hexadecimal numbers for module clocks and resets, for
easier matching with the documentation.

> +                       reset-names = "presetn", "tresetn";
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

