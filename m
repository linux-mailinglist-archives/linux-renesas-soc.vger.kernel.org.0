Return-Path: <linux-renesas-soc+bounces-20020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B25B1C303
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05690626F4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1201128A3ED;
	Wed,  6 Aug 2025 09:11:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D644289E3F;
	Wed,  6 Aug 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471501; cv=none; b=q2sefN2DtySnmQnsKyW8hQWfXIKfgn+sMSUnqx2G2tn10yixi9YhCEiPmXxcLuYprC8uvQVBk40Y2/T4l0G0sh0E90Xc516ukrTPnXD1+DpNO5wPxUNnlgQQQsKGTjI+fWqYQULi9v7h9VXSoCpS4JjXOPbhUVo/YCqJhTinW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471501; c=relaxed/simple;
	bh=Fc+NuSJ8sTbe/qqphy+mVsy/5Ttay2x978Cfkhs1/uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qR90iYkLt0O02C31S8ftAS/NsY3XiuT9dwt/PgBvK2MXHDU/LsErO/t0Q0c9htogi/dCT44C4oZwCIFeunviIMZNgsxn/kvoNrFY5n6lqaaXUvBMkOk+5WyrFzgxfauPW1F73IYL4VakK5VO6NhdlOHRa0WyymrK3OvNecc2GTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-88dc7abaf5cso898185241.3;
        Wed, 06 Aug 2025 02:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754471498; x=1755076298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xm7RyDlMo9WT+Jn3TQ7VCvAt66o0eLzEm8Xyy1akUbQ=;
        b=W+wKriP4hJUBAXN4e55uWHKHilCCDlbHI+3waFg79KRgHiof3/RBnmOZmTkwUfA6hj
         q6kGKiiDQIBy1SkCK7XsF6aPUkkzG37dREj6wKCPI20qUPlZWWKukru9ArNwH7ys1Xg1
         C2CmuKNx1cYOkB1GvrRPkrg/OsnIJAXjMtAnoUejDnu/3Jnm4suCbBn/5sCBBxYmXUa0
         rY/noU0MjfC0LYHp4lA+558V150yHa27O3lkDg9Tjipb7yilJOgHA6j/CfhEJQ3c0uqz
         rMO5okgTSPQdPVhvDeO+KLqMoHeyX/hA6enC6K+/bEJ+Qz3MPlBQLZgWcSfzwkdA8UrB
         tZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu5KlIWdzyIQ/N58mMCFbLkyh6/GsbHRJFppQ5e1Xbg6wtopahGrLnHhhOopa1Sjl5C//LPTjio9bJ70gS@vger.kernel.org, AJvYcCX74VK3ij5hDy8xpOz8zpRmUu4oSDouMyiDztG8TwoYqBtnhdLFQXvOx4OzdbgcdsM9QFmZ/8CCa7F3@vger.kernel.org, AJvYcCXnH2ccT4hcsreRKxBLUdq4qwt5yFeD9mdK2+i/UlAxZzM59lVrVkT92vyhWhJ4HUCkCDZnifoLUEROE3GfDhVghTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkP4uozromUFzBaon0sxzpsmqT1MPwwVlRjbbrWXH6Re60NJAm
	wlIg33Nao+1PSi0l2ez1xcgR7PJaj5gqraBEWg+lFOQpFIy9pKUPv5MzYsqdnbgU
X-Gm-Gg: ASbGnct8TOdXyOqqzRtYDQcsqOcDKjQpQlDiKVMQzbUOFSBfgCpOJisZPvUQULHPOrq
	P9zgDCTOuRmaoEXjR/67npcrQW+m4iTcN7IMfYIGfwwi+gQPJONPxSqsIpE+N4QTbEUyLhEJ4ey
	vtDQPIw7FOSZRP2k5LvD1QqWwpp0wyWpHeLZmhqc17dj+QClEL2y0lvhtvQWsUq1CaVXJE361yk
	vRIM4jXL5ImUQ9Z6wyPt3uBt71Ny9LRhRIvOQ0AopA5LbTPxGoqGR/SpTwi85veubOXeCEn41x9
	NIAjt6E4FAx1vIw+Hpbz6rVyMuZiBL0NWa5qFAIB6+OSoCQ2WQ8droZcUBBVBQKbezxyfEqFTme
	FW8eMaOgFVIXNAZ19/kgDjBmPkufBTGO5BYP9tjdCwF07TByt83J3s7c2tmQFkniF3cK4Xfg=
X-Google-Smtp-Source: AGHT+IEo9/AftlsC8iOEVLs0wdLMt2XdtTThqXjHvP7kyKBVRC1ko58Ig9FsT7zY7qAc97fy36ei3A==
X-Received: by 2002:a05:6122:7c8:b0:530:72da:d13d with SMTP id 71dfb90a1353d-539a1353375mr572534e0c.1.1754471497843;
        Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b169ffsm4080042e0c.6.2025.08.06.02.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5006f7e71aeso1246167137.1;
        Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCA6yEjir4ASJRnBmiANU04pkxbMAuUl98n3VYgqSU3UMf3qDUtP8ECS/Iz29KEkeJwK/7CL+M3MAciGBw@vger.kernel.org, AJvYcCVq5bMk2x8B1/qeFbtTdnafCDl5iDdPdvrO+SGHIrRVIR9CuduSEGBEqmBQ1M/WQZy3SP3ZZXFUsPkv@vger.kernel.org, AJvYcCXj9EHciU2RjXDpM3enAYlijW3+/1+AdOsiQOZQLZZomiGAArKy4b5kAMyXb+fuQAv9YuLkppFASqYF45drWzzzOk0=@vger.kernel.org
X-Received: by 2002:a05:6102:e13:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-5037aae01f0mr648606137.15.1754471497092; Wed, 06 Aug 2025
 02:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:11:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
X-Gm-Features: Ac12FXyTLkQ8Fim5zNUDUaYka6FZ4b931A7kHxZ4txshhqX1WT490uS4CUxX-bc
Message-ID: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 30 Jun 2025 at 00:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/A1 SoC.
>
> All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
> stages of the boot process, those are marked using bootph-all property, and
> so is the SoC bus node which contains the PFC and OSTM IPs.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
> @@ -41,6 +41,7 @@ bsc: bus {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges = <0 0 0x18000000>;
> +               bootph-all;
>         };
>
>         cpus {
> @@ -108,6 +109,8 @@ soc {
>                 #size-cells = <1>;
>                 ranges;
>

Please drop this blank line.

> +               bootph-all;
> +
>                 L2: cache-controller@3ffff000 {
>                         compatible = "arm,pl310-cache";
>                         reg = <0x3ffff000 0x1000>;
> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
>                         interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>                         clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
>                         power-domains = <&cpg_clocks>;
> +                       bootph-all;

Please move this to the board-specific .dts files, where this node
is enabled.

>                         status = "disabled";
>                 };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

