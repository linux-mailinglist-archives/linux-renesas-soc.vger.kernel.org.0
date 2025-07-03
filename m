Return-Path: <linux-renesas-soc+bounces-19071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CBAF6F1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C612318830ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB812DCF4A;
	Thu,  3 Jul 2025 09:46:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E42D5C69;
	Thu,  3 Jul 2025 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535961; cv=none; b=sxch1iiEUzN1YBojRtptX0mrkC6Y8ANrNjvwq95GslSxNbSUlDZtpHP5b4kvq2trJcN/1IOgW9ihZJaq3/Ke3GhrGiwumZfYh8dfWuoTzrdzKcxgKTf+7/Qql+LzlHFK/rqpLktvwg0Jzs1OS0e804A5JCaCe83IafAVNk8iIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535961; c=relaxed/simple;
	bh=8+99WZhB2XAT3145ZR5edaUt2NhsspSftiUtjBs/P/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMZCKL+Qs1Cl4D3YIoI4wb+miptdNX2RWGP3oJJ9sAaCT64HOlhEcomnklL+0LcIxoQtS5KHm5TTs61HfjZ+/kGWrpqgMf4sBcQexJ11g2rz4CP++FMGlcAS0Hwd8xq/Czo+nRGZp3Vb3WFMdylDvo7f2h+jfNw3wTzMF3fA42w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5315972826dso535300e0c.1;
        Thu, 03 Jul 2025 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535957; x=1752140757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gr1T1NsM4mbKj05LLAEjbw1p0jrjWQGqngqTAr50Bdw=;
        b=ECA121MBvMmLTw4+qxxhmW1z+axKm1indRDI8Y0Tdpxr0JNSdDAO/501rY8jhHnMbC
         bfVR/bc/adPHr75DbnNn3zALQ/0FWpytRrsgyBEnLnKL1AMg1pr6mZI/q7eMHyR/BqtC
         D77CnE7bMaCUQv9VvvxybHvaFt4vfreroGm6VkORE6Oi1C9vtgufgt2yNEW8gSQ2lEzg
         ZldbXc7CSF4scsrYXr4lG0a3fPORRjW0J8aGjR3jrXfa904xJoGTvrcwzXK3aXaPGAKW
         hX1MDf/xQK9lmTX928jd6nePvhIX7pXEbeFyO5TAikroALmEnB6pBSwN1xYHNIQVnlQF
         oX8w==
X-Forwarded-Encrypted: i=1; AJvYcCUiUZsHdVl6qLdp6vzvEjo/mKwNEe7gauP729+jABRNQdhlL9foCzw9/R3UOddJHrPuuF0iDNSGz2M8PkH6KSN8fvI=@vger.kernel.org, AJvYcCWMCJgb+UP9uPCZXv9UtfpuTOw9J5RAYs7I5TjGY+zs+K0vnlZuFXv4MLIA6vz02iO0T+KTLFmVI/+33/Gq@vger.kernel.org, AJvYcCXJaisc1oXVSgcj54FcciDhglqnRKv+NDkBv87cV67/WT0ehVYNNT+TBq8q9/WJfGyYaiGHRfewGTys@vger.kernel.org
X-Gm-Message-State: AOJu0YwztGQiNlgDJ3LYayvpkL7CJ3H9dNHVWQJG32xwvJLI8HwVjZOC
	GqvtcuvCguTvz+oJ+S4IRH7WFSmIkWygnl/gMeotPBvAyJQ3yLNDlmovQVeDjG9u
X-Gm-Gg: ASbGncuSGgIKaicEBFNfOBSqquVO57CzzVKpLswp39s1ly6G5DTBgKHcCFbfgK5hVie
	/D4Rz8BCbC+36Ft9Lax0hvKCxYE15Rin27Oq1/IVglJT8091kWaqZi4gykBu6xAnJjqbnNH5jwE
	ZUClTfni4Ot7pPG4DSEZjDjJQeV1+2brLv1CLTFFVwjUahkoclF+C8WnITnnBOaW+0pMcsiEN+6
	VrWeECJXu0ntWcPooD6ExFEzNfWW9X+W9G5W7dsQ/MwTZ00z5entPQwbQmOJCAPcaDvl7ROfqWY
	OCHsqEZbwPMzxgDJqQG/axITtmVDwxGPHP/oEF6MCKl32N2Bxeos41YlJMjjV5GQNJ12WbS2xNn
	EH61WnEA8coTMBkQGk7FW9Qt3FPX7Wnb0GKK6d3M=
X-Google-Smtp-Source: AGHT+IGmVlg7nw6GSCIl/O6qKUwGtTz0k2qz3Xte6wtkUc2bLybgkZ3xGkIqYISeP7bnkFqvJbIENw==
X-Received: by 2002:a05:6122:6d06:b0:534:5cd0:19fd with SMTP id 71dfb90a1353d-5346beb37e3mr460754e0c.4.1751535957442;
        Thu, 03 Jul 2025 02:45:57 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5345ae35c6esm530073e0c.37.2025.07.03.02.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:45:56 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53185535ed9so524733e0c.0;
        Thu, 03 Jul 2025 02:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHwZzY7Sfu9aPBXmmfL1qHrCcyjOT0kqeeyq4FphUeFb4MaVs5+uboxUvyzUaNjOfrGJMxgwyN6zNqgRgY@vger.kernel.org, AJvYcCWKerVUAEoUT4ymj3PnPFL0BworOTkyq8Of2Ef3YDZ5sfBmNRX1Dudv/t8Bi3kSu1fAZ9e1zYi+5YiG@vger.kernel.org, AJvYcCX1SXatfLICE3tg0gewcFatqTz1exhoXYOC29JGr8UOqbmv8Z2T+F/c9iG3q3Pw49nbXzfVki1II7ZIcuTxPgvHlJA=@vger.kernel.org
X-Received: by 2002:a05:6122:8f0a:b0:531:8a64:78bd with SMTP id
 71dfb90a1353d-5346bd64c3bmr642383e0c.1.1751535955720; Thu, 03 Jul 2025
 02:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625153042.159690-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625153042.159690-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 11:45:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDjdgKDPA3ARPby=Os=WnrXRZQSTc_54oPJpbJ9GV8-g@mail.gmail.com>
X-Gm-Features: Ac12FXxkx4fDa1whRiAsv_xaSVh2mIgGRqTPcNNeFvo5G9Qz61n8Jgjl7_56Kjc
Message-ID: <CAMuHMdVDjdgKDPA3ARPby=Os=WnrXRZQSTc_54oPJpbJ9GV8-g@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/T2H ("R9A09G077") SoC includes three I2C (RIIC) channels.
> Adds the device tree nodes for all three I2C controllers to RZ/T2H
> SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -90,6 +90,51 @@ sci0: serial@80005000 {
>                         status = "disabled";
>                 };
>
> +               i2c0: i2c@80088000 {
> +                       compatible = "renesas,riic-r9a09g077";
> +                       reg = <0 0x80088000 0 0x400>;
> +                       interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 100>;
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               i2c1: i2c@80088004 {

80088400

Aha, the related warning was demoted to W=1:

    Warning (simple_bus_reg): /soc/i2c@80088004: simple-bus unit
address format error, expected "80088400"

> +                       compatible = "renesas,riic-r9a09g077";
> +                       reg = <0 0x80088400 0 0x400>;
> +                       interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 101>;
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               i2c2: i2c@81008000 {
> +                       compatible = "renesas,riic-r9a09g077";
> +                       reg = <0 0x81008000 0 0x400>;
> +                       interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 501>;

601

> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>                 cpg: clock-controller@80280000 {
>                         compatible = "renesas,r9a09g077-cpg-mssr";
>                         reg = <0 0x80280000 0 0x1000>,

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

