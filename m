Return-Path: <linux-renesas-soc+bounces-24417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FEC475E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A8A7D34A0E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C404310647;
	Mon, 10 Nov 2025 14:54:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888A3009EC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786499; cv=none; b=GhtjVhEeNGowMdqITMXH5o6JDlf1zsMpGsgeEwie4UKtpAq2wgnXWTK+a15eb/aVVMHt/t7xC5j8xtuZa/YlvcIm/HlJHC5LBbEO7S7HtpXKoeRvhWsJzeMx/pvZ65iXRSHGFHkaX/Oc8OHumwb+qVkIuni56T3EiB7NTmHODa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786499; c=relaxed/simple;
	bh=vQ3cBdkCV5UnRvyJ+BfFBgghw/urt+jHpSl4y5jlUOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kT2lYCGQTYabDo3v+tlUNvGVFU10QZPBsjYx14QY1viFudfgAamncrXRkfe3p300BeSKB5pbfnzZXVC4cd9d61bNFfvUjuA5DYxO37jQAB7MxNIfcA+vGzKk/JD3FUg0pu36K+w/6x2v2K3XkDjMPC8QKUOrYcJ+FeI5KZ0M84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dbd3dbbde3so2541003137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786497; x=1763391297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz17y11bQKxObZgoQnh0w/nJtN9nCnBNZyOA3HIKdo4=;
        b=lPdD/gKxIq74ecf0CwNYoYmfyWDVVai7mbSJtwAIgofKKL0vDGaEkIcHM8CZr3jV2Z
         08SfPl4CN6ipmEQZD5hU4/yPNaeXshVlz4TEEmKV9u0C9mYeniIcJqMpMjJ3GoNiALXc
         Au7RImEjGFeJayElSUxWUCV9wEv/6qJlK4DI/Qa3EfCY0DM3QDObozhW15jPFztOWyxx
         WZ8xzPenY5Qd2dxRiUKrcPbRWGtHOL/cK/u+yv6x26jIqQgPYsjNP3ohbcEmSBmHKFmv
         6a9qKuiFKcI3UeUloBVlqiSNDsLodY0/1Nh9f+iWYlTcamxUx6WyrciZEkL6htE7Dscw
         7h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0a3A8IdowHXJ+jdR3U8AsCGnPqRZxuuolrfYtYLpEge9QT3IDkvvQ02x9udlUOhFrz0LdYPyxuA2e5SHOrJ0jvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF89f1ITfZTUWrNpmvuhTDXWMj2gkVXNwqQc7rK/bNrEg7BxpC
	Xz0qX+mn5Ncdyyh8l6haF6th1fpHAPXP6GRbPlH4dLzNl0ToN62fJoNJye84pBXY
X-Gm-Gg: ASbGncsS6LiC2eDj2PkFxveh7RgwnJd8GfEIOtyYGvLOpsxcYruH1OIcIvEvR4KTVOp
	SUNMXxQ14MX1l9BfugbUDS3OJoNQPv1WOBC86bj7Wlx0KWe1BakcvxCJjQL1TUGV51nvhzkwvC6
	7v1QzT+sk0kJe2vYnaC0q45erylhTfzTBYyCQzCoiLcVfBaB0A954lRYhAvgz2bxw50btVJwGx9
	Kmn6Xs70iaDZ6b44hYisivEqvw/8nXsv3Piu9q9/TPAy7QJLpBYR6Rud6xzjLIATYRcRdDNXwtB
	gU0iaz2zTidpBHWzPXFvvAx5ZGwK/WOl8tWR1FBFX6HfelzVGZLuQf20oWJMUMQ5UZzs9CK3vxL
	hozvudlKX5sZRExTlNvgH0WJm59uJZxGdruidy6Lw2zgCuKwsinllsKe/8hTlm8Cf2Tm/J3yXsx
	lZimnSX8ET1aiaQDrVY7LUjDmntEr1BdARQCPmj3eHHPlAOihanlLeQglMrnx3vn0=
X-Google-Smtp-Source: AGHT+IFMPYeAHKV7X3YoknLXdI/FzON454um7sarReTI/I7YfcF8TxiJHp4uzb7wJdrjdPTWSce0fg==
X-Received: by 2002:a05:6102:3a11:b0:5db:cfb2:e610 with SMTP id ada2fe7eead31-5ddc47e4af6mr2728080137.41.1762786496653;
        Mon, 10 Nov 2025 06:54:56 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d06baesm5856833137.2.2025.11.10.06.54.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:54:55 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-559748bcf99so2902022e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqipcBFcIh6m58ln+XrQI8NbCfChVwlzm0BR8k4Zz8JS1IS+4IKqjQ053bqwZMJY4zyXx8ayWNp6+mdeEE0WfLKA==@vger.kernel.org
X-Received: by 2002:a05:6102:c54:b0:5db:c9cd:673d with SMTP id
 ada2fe7eead31-5ddc4751f8bmr2690307137.26.1762786495201; Mon, 10 Nov 2025
 06:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028175458.1037397-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028175458.1037397-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 15:54:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwJ4VYeiBeNvmk2sD_dn3L5ofZAos7sVFL7_OiEZDTGw@mail.gmail.com>
X-Gm-Features: AWmQ_bnBtlYoemCwnENT_ZEy-kRSg4EiufR8QdhrtXxJ183JUY_R7_bVGhsumwI
Message-ID: <CAMuHMdVwJ4VYeiBeNvmk2sD_dn3L5ofZAos7sVFL7_OiEZDTGw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add GMAC nodes
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
> Add Ethernet MAC (GMAC) device nodes to the RZ/N2H (R9A09G087) SoC DTSI.
> The RZ/T2H integrates three GMAC interfaces based on the Synopsys

RZ/N2H

> DesignWare MAC (version 5.20).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi

> @@ -495,6 +936,13 @@ sdhi1_vqmmc: vqmmc-regulator {
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

