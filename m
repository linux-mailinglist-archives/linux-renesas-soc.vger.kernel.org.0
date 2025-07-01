Return-Path: <linux-renesas-soc+bounces-18968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF1AEF7E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59431BC3327
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A152737E5;
	Tue,  1 Jul 2025 12:08:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741C272811;
	Tue,  1 Jul 2025 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371706; cv=none; b=A4oi899vwDWoDNvRok5AdrxDLZIb3IaRl0+nVicwYaVQEpK2P/i33oq1TfoMmvlkWaXYlppl90qMa7WolJV138GaAGveObTQifOCiCdaBBBt39QEF0Kb2Yrz45xq6GSocRBZxn+AdAF5qGG+CALhxqSE/Bm/g6QiJV7eKrjDhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371706; c=relaxed/simple;
	bh=ZtWMnNs93dbR9aNFNiHFIEma/yL8FNd0BF7lG5Ouv0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDJyXpwSy4STPYHUK6FMwJ7ybkJzAD/xhutsEi+tYhB53mxiTJup5a02kMnSR04ndbmbqckE8NK0Z3pkqkrU1QD3jrsFBUfCoAyO3gDouDFmH45apBVoYwpULpmmAZ9mswUc8ai/UqshOIgsPpUx4khm6No4fljLVvvfyXouu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fae04a3795so59984696d6.3;
        Tue, 01 Jul 2025 05:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371703; x=1751976503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hb7h5o3Z3SHRmkV5QpQJDs20BcvG/ga4TovqIGM5xnM=;
        b=MigvWZV4rEKGdyBSHIJS/h3p3TTRKCjBMwL+mIdrz8EsHw+khu5zQAfsFaQnE8UF1n
         B5C89UeQ6dFuJKJXTjnAwbZPDyLrVi5y3ZKk7JD7KZVSkLGNQiI1BHPQzVdG6zwFzqtA
         gBdD9qZQVvfq3A0ZqT5EJkY3Y6xVDEPwM83o7CCIZ8frAutHKmy8pa8B5ggtVs1fAhXX
         ECHYS+2RLLREMjtL0+Z3sY1FetGd4InIDX/AkeqNIvMuz5yn7PYEePcxlobyDaVr00Rg
         urD7JivXDZ/i6gWeR1KgZVy5yxdzjTnORaCv1fJ1w3P+UhbvvtLS1G7PjWUcmdGYFwWE
         0cWg==
X-Forwarded-Encrypted: i=1; AJvYcCUEQzqWQ2MSzWqPC9YkFsWHXSVzPj7qMmFpASBv4xGVfz9jHUURsoxOnyTdqEG6iV0498+jTTDMfCq4FI31xeiNfq0=@vger.kernel.org, AJvYcCULdymfeNff/fBLvMDwqMuLh70OJJ1BNxVcAByR2/eT95gEDmaqUrG93p1/Y3fYtNN2CdFOyfik8woFYN9R@vger.kernel.org, AJvYcCUz4QPi7lR1nRc+K3C9NI60XWiRJvIfmUEPLsDGYZJBv6WSwRRio9uovzNVTillXpMySFskKxjcvet8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEztNIO5xPDPY8TZoa9d7CDNfTMNTBpuHHI6oxnQm1X3fYZpO
	iif/dlt076wacCGoHBDMwJ1itTwb+2uLBCxGiuI+iJZF9RJMwVWiKq9CzlqjlBPp
X-Gm-Gg: ASbGnctZjsH6fhAM5eFK2J+Ml45LwtLtnZK+pHF01yLLqz8iCKQWJureVgzXgURixfu
	rTt8r4kXUt0HEDAKj3cheYEaVOnn2HlMxFxv3bNAHoQxUWJmY8A3V467wHT5yQCz//q53de0t4w
	2Cr1Rn3vyA1KhWBYs4BOaVVEu9XvKqAE9c2oqWb9uPb5zIu/qZHnm3sxJuBKV/PaxOgXCciNF/Q
	O9Xehzw8eLMwgMdf+3C309pU6lMFTciVQDJinbepmcyMZJyx8sJraDZF2AFB65DoTRzXm1Ubunk
	9eW1sgaqwfymS1b4k07uTk6ItgNNjr8scNisWJOt/oRZKY8i5oZ1PBpYMQ63XDawVZ8Y9zsxiEH
	AGpn7JSYrINyHRFosOpbiHWaEPyH4
X-Google-Smtp-Source: AGHT+IGC/1CLLDimb7FZ1/m74qD3WEzlnaXd/grNcjL20rJUEnRVo7vAzMtc0GHA7q2GaIIwbyTXIQ==
X-Received: by 2002:a05:6214:801c:b0:701:923:8980 with SMTP id 6a1803df08f44-701092389a4mr60556786d6.4.1751371702937;
        Tue, 01 Jul 2025 05:08:22 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771dcd5dsm82869326d6.51.2025.07.01.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:08:22 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d412988b14so569562885a.3;
        Tue, 01 Jul 2025 05:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWY3lEUEZ+xVRMs9/N32PqV8is9o4ha3ErLrTmJ6K/Zzr1RhA8EkrVy8D7GQPNApM/sgwbakGVEq2a59Hdq@vger.kernel.org, AJvYcCXPcxLP6rsW0slyAY1O4Xlei2FXDb465MA+/4luh6/nl5X0T7ALPM5TBpPmpCspxOKQ1u+bIEwELQr3MgIu9LHv9HQ=@vger.kernel.org, AJvYcCXZ0uh4S1oZPkRSkaQPaQfW37U5UfBp+k0aH1LCZzm7KFXw6yAkozT2fr94MEQIW1twISwyfORSWVrw@vger.kernel.org
X-Received: by 2002:a05:620a:4623:b0:7d1:fc53:c6b2 with SMTP id
 af79cd13be357-7d443974577mr2478327385a.41.1751371702104; Tue, 01 Jul 2025
 05:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250624174033.475401-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624174033.475401-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:08:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2fkQZf_WG5X5oOnJJiU13gw16soH+V8xyb8X2WtoiWA@mail.gmail.com>
X-Gm-Features: Ac12FXyHp1c3fNK4d_55dLmyCa2_Rc1m0vo3vGVcYi2i-kyWjuY5jauEF4RAF3g
Message-ID: <CAMuHMdW2fkQZf_WG5X5oOnJJiU13gw16soH+V8xyb8X2WtoiWA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g057: Add XSPI node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add XSPI node to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -280,6 +280,29 @@ sys: system-controller@10430000 {
>                         resets = <&cpg 0x30>;
>                 };
>
> +               xspi: spi@11030000 {
> +                       compatible = "renesas,r9a09g057-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x11030000 0 0x10000>,
> +                             <0 0x20000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 0x9f>,
> +                                <&cpg CPG_MOD 0xa0>,
> +                                <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
> +                                <&cpg CPG_MOD 0xa1>;
> +                       clock-names = "ahb", "axi", "spi", "spix2";
> +                       assigned-clocks = <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>;
> +                       assigned-clock-rates = <133333334>;

Same question as [PATCH 1/4].

> +                       resets = <&cpg 0xa3>, <&cpg 0xa4>;
> +                       reset-names = "hresetn", "aresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>                 dmac0: dma-controller@11400000 {
>                         compatible = "renesas,r9a09g057-dmac";
>                         reg = <0 0x11400000 0 0x10000>;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

