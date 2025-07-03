Return-Path: <linux-renesas-soc+bounces-19074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47271AF6F64
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E3F18884BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11E22DFF17;
	Thu,  3 Jul 2025 09:56:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6F2D6632;
	Thu,  3 Jul 2025 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536564; cv=none; b=q8vlyJ0K/7jSemz060bYZQCbDGv0Fn66fxlTG0FzbSDvEQRCEq8eQQKmz1D2iujlRYlC7x0c0Zy9dAsNn0OMlyXlvRdbNcLpZWszkWGK7qtbbO6/lwVoEHPovFQACryqGxjk+i6LUl+d8N50UTjpdDiHzWeSnMqJ3VVzBo0iSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536564; c=relaxed/simple;
	bh=BacjBBfMYBpi9NV3JM7kqy5QRyTAmHqzbPyhsxloO6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaWdNHyHTqVck+LAaAfNsUQSfhZj7h7ShDoJl9m/QavP3NPCw5AHQvQwHwNghinw4jv50Q5u+tGIs79pEYl1i/zANGqZYhpb4pyacvngDsGI4r6MYsnIxGpgYiH5AfyHYmweuDNwd+5uNKBM5wGNWVbELkH7LwaOXKWb1vFazQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f30519147so1615750241.0;
        Thu, 03 Jul 2025 02:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536562; x=1752141362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUiiIKD0lUTItPi1CnCx/nn/P2433OkxYlP7+gl/pyc=;
        b=ElG91yLGETLLoDW88zBmcYAjycmE6oRFsTYaT7BAJ7xpUepVQS58H3vvebYoKzbOSj
         VD4n17ICsweG8ylua6Fj0RAB4vSO1FsLH35pAl9o5yHc6La9OT78YxCoR/SCRXsz7lT2
         ITuu+iy70AYNQsmVlM7iIq7ZZOrpjpBMniWmL66/XoJKuH3xcPc3LgRoWE9puouo2IH+
         G4emMCcbqxc04+l0Ezrr33HAcOu1dzrHgtjzY0mAaE1dZuHG7WLdEGPOnHrdZx/nF1OK
         uMRWS9bbO1397OdFXSCpn1xj2xV0bubo4zPNKC/c0TOOruYKPOfT7CKt2a42elut6pG8
         toKg==
X-Forwarded-Encrypted: i=1; AJvYcCW9XTj6keijvDYP45kvkAhy8pN29/4b4mKZLZvTTtOVT8dU1qfbmbj+WHcf23ytxPvcXxxJJcU5gaTx7Vnt@vger.kernel.org, AJvYcCX+SO46T3CJfMa/D9BQhFwIMXeysLPYVXIGc01P4BDWyuWs9BUcEUImhuM56OYZ33Q27es6kR+XMO8Og36SDSjBJsc=@vger.kernel.org, AJvYcCXFvIWOhx3PLQv1LjQEW/utPtM18HzR+W/gtZHkLnQkIJOxVLwgbwmD0/Np9LgTAgVC9wtmQjs/fGrc@vger.kernel.org
X-Gm-Message-State: AOJu0YwkXwb23QRIqEBtUR/HWK7cqRp6raGMtfh0ZksPSrujqtn7vFVy
	5SVf8a9zPvQdJWgMJrakT9DRQEddhnRwWkDBEGWWO+HQiKWvQh9annfB/Q8G7NWL
X-Gm-Gg: ASbGncsQKIRYNFulsneLnXFiD19NmYi2aRxC+rZimrm0qwDABwVY2YrunHXbqLGhCn7
	JoHupPdtip1h2bG3juLWbMc0hMn5f3sz93lFnEBBuJBkRHLAYNcNJ9xCElsUtA4J77qUrtjn6+y
	Z8+5t9wJFKRYr4oxcQ8Gte2t3zmVJ9LBteyHIPECIm5OMofSb/0mZPF/7LYSAduVyHKjU20H085
	vkWyvuhqOePIgSTwkmgrYAticnJpECKz0ezZ1LzAYHug6pvMsxKB+Y8Fs1JamanROg44qGor0s7
	zcQVatjW0qIGjruWqwj6jrxhy110Q0UVA0Q55pERajXV9LrlLu0kSPB/IcFPEJvhY1zGRnD8eu1
	YRj4RdusmcrhDoooy4d+I8hIUT+BQ
X-Google-Smtp-Source: AGHT+IG8hEfcI+Jv+G+uBCM9avGAQ2JbDMXly56VC+pQcWOpZpS4Pm3QM1a1g3L7e/RABjoCtJJfPw==
X-Received: by 2002:a05:6102:3048:b0:4e5:997a:748f with SMTP id ada2fe7eead31-4f1747e464fmr2062406137.22.1751536561597;
        Thu, 03 Jul 2025 02:56:01 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f1745d469esm236219137.27.2025.07.03.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:56:01 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-53167fb5690so2804870e0c.3;
        Thu, 03 Jul 2025 02:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+xdR2mqsF4+0cim2HLQywddGFzA9ISXGob5mA3ixMK7DyWgFpBgvhMiCw3HHqmwhzgWit9k9HDGrsFawu@vger.kernel.org, AJvYcCWF/EMFExJrxbw8c4J6BC6knYiS1+wPwFFMtWb+iWHFDuQdE4PpBSBdaHVh0DMwjvm/pANB5KobLY8t@vger.kernel.org, AJvYcCX0obQDf0GhbEArzq/zYDLb6F86PFwIun4sOtScZGzz5H2LQLWMPu52ivcCBhZu1tYUwTOnx/lRMxe2BGYz09hcxnE=@vger.kernel.org
X-Received: by 2002:a05:6122:6216:b0:534:69b3:a230 with SMTP id
 71dfb90a1353d-53469b41444mr815611e0c.11.1751536561150; Thu, 03 Jul 2025
 02:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 11:55:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com>
X-Gm-Features: Ac12FXzW3YNmL7fyTjxzXkgoVv1aLPfErnuGIFoPYkh0a7V_m04VM5PhljaJKrs
Message-ID: <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r9a09g077: Add SDHI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
>                         interrupt-controller;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@92080000  {
> +                       compatible = "renesas,sdhi-r9a09g077",
> +                                    "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x92080000 0 0x10000>;
> +                       interrupts = <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 1212>,

1112?

> +                                <&cpg CPG_CORE R9A09G077_SDHI_CLKHS>;
> +                       clock-names = "aclk", "clkh";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi0_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI0-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               sdhi1: mmc@92090000 {
> +                       compatible = "renesas,sdhi-r9a09g077",
> +                                    "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x92090000 0 0x10000>;
> +                       interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 1213>,

1113?

> +                                <&cpg CPG_CORE R9A09G077_SDHI_CLKHS>;
> +                       clock-names = "aclk", "clkh";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi1_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
> +               };
>         };
>

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

