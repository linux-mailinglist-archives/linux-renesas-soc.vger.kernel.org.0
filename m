Return-Path: <linux-renesas-soc+bounces-21284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDAB42317
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1D86162399
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613E2311C3D;
	Wed,  3 Sep 2025 14:05:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958F3112D5;
	Wed,  3 Sep 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908337; cv=none; b=iQTdlqgHTuh2kOSr6gfDiGDENoYinLrFz7lUQVbtc4hWPhNGHlD14cNGwP6j6GJ7COrItsxjE+AgGpfA5lP+vNDlvf/Y4ZkjIv95pubSKaz0I8RSeAUWnAP98AC45WyCM+rTxbzRMFXtm1Tataweyk3PL5PAnhL9HaSKK8KGByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908337; c=relaxed/simple;
	bh=iXp8HSDTdwY5DmqRI+0Mxlc4cmzuOiwvHRGosXlakII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiqD2QPS2+Oq6kjKr8na0cDmUxIvQA8NUXQftfjxLjd/9EmgulDx+us332pbrIpxFh6fJv333T/Imgyb57kyX+N71VDfjrmAtaTF2gi9hMZV7E6HkjzrdX8FM++TMi41L3mSZXJncYyz9ABDQLgQSvkwxVfJ9R//0FR3LHDCp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52a73cc9f97so1609997137.3;
        Wed, 03 Sep 2025 07:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908334; x=1757513134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+cvu6EvGlNcLjycyZdd2oEZU0V7LAk2mk1teEIGf4s=;
        b=lRZjI+NpGt0ASSzxrGg4UPJ08bndUtbZ+RJ0yhuXjalCaCgA+zBYSZwoQyqHSaPKcE
         ltkf4DwNDitsEeHl/l9iWKOQ4bpm8ZENI4rCRuddUcfYG5XE52rzmcWYW+nJMyVE5zu4
         hzk3MPNS5duDD9Lc1s9mO4wzTIWU8lWDLxuUTSNkye8CNQV687ih6PFJNKp8troAWLUX
         SFW1g99m5RQ4H8YHeXT9yfjUd2YB2KhtWZtIsn8YE2O36sVqWq6zLrT1kSShdA0vl2D7
         mrWKzkGyhMAXRB6yqMh5nbBqbuwkj4D45zf31WmVAEHT/CfCae52S/z3hW28AudnZ55n
         2MWA==
X-Forwarded-Encrypted: i=1; AJvYcCWOQaZgxcMXGJaiimyuQjxtE4QZGPCCZbtKIq5icbkliDElryJJlj3K3TMIn+BmIME59z9YyUeW0PNf7UC9fTtqZEE=@vger.kernel.org, AJvYcCXmdXnuZIjWTa3hBY6geezyoR/nFxlJ4LIQD9N5BrpiCwuef9a4ZBjR7fOYVogpEuXqrzOuZu+I7CR4yfzI@vger.kernel.org, AJvYcCXzOQswoNPhMHZokvzeeVkF2SzM46SAl+z9uqxl+0dpoH5pRM7Jj5hfZZwIXgPRR7DqxV/8nF7CJByo@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBxdPrDX275RZEyE0PcvmzlpzzySm7vL37LnAdMBqfJjhsGR7
	1pXChTTQHpmWt6UN4XMSzP6tqe/koQiDmz6o4OU+m1Z/uUzf+jSL2FH7rpXuMZ51
X-Gm-Gg: ASbGncvc9javZDM+LHn8wj/poqwl+yBoLCXpbXwtPbHK3P7OnnZjIyjJ6J0tNnN50r4
	ukT+PqUkYP2G44giQGvnrAUo7CCNgdo9x+N3WYEWahnIGklBsnGlQU8aFArlcLpJTrHmcHemxFR
	K39UaYCmO8AediFAu2vNhX7ckU94/Oe5Fhz5nGiYWiN9yzWqmM/9BDMbm1+cIGddCDFA9SdjcmE
	gTJNiTeryYhzydXxqWFmXdkLnbKxG+aDifIZSv586/Le6VoKv2hZGBO/aUCzDlCJsGlgi3F4MTM
	bhlJ2yEhF0uWhT6B5blbtCQUAMinzNIHkSYomAuK50NMieEemOyyMQ2U4z0EaWBj4qk9lBNwg7P
	JI3damk4oQUxZHvkc3PFEVUOr558zUs985Cw+QZwJ7b8cqkNhTk72kkPFjAhO
X-Google-Smtp-Source: AGHT+IEwLDVO0pMUZ7AE7H7hPHl9DghGWCfRKTy7MT7DIDM728fXV2Unw50e8zEJ2gRQqU3RXel/dQ==
X-Received: by 2002:a05:6102:6446:b0:51e:92cc:6e6a with SMTP id ada2fe7eead31-52b1c359d84mr4338205137.33.1756908334203;
        Wed, 03 Sep 2025 07:05:34 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-898364cdf79sm2519183241.1.2025.09.03.07.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:05:33 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52a73cc9f97so1609965137.3;
        Wed, 03 Sep 2025 07:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBM7Qmio9ExWM0ZDRY6XIFWaVJXgfY3NUDGGjEIPfFpf/9UycXgEcpYtRfjgU8TobzOralAlAv6VEqvnIV@vger.kernel.org, AJvYcCUk3Bu0h8QDp/uvw9cb1+TpBFCfrvJGO+83hk52/noqer9a9m8PsTQg+kRcqoABqBiRMjQXDVeo/BUb@vger.kernel.org, AJvYcCWhOydeRMH6FBu+djpYS2agWn7O3VIG7rYNu4pjIrzMXeWeW05lSeieZcDem6c5OM7ylfeq4JiGXwlugIBEOBbHv3g=@vger.kernel.org
X-Received: by 2002:a05:6102:5809:b0:527:8b63:78e1 with SMTP id
 ada2fe7eead31-52b19532b98mr4817203137.1.1756908333491; Wed, 03 Sep 2025
 07:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 16:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPst=JAbyL43SZAHTrCR=wajs15JZXCH4kmM41cdAh5w@mail.gmail.com>
X-Gm-Features: Ac12FXyZrnxtSY-6RsRk8_dv6d3svCQcb4w0x1zUw1epH97KQsL6SFr4wzNGRoU
Message-ID: <CAMuHMdWPst=JAbyL43SZAHTrCR=wajs15JZXCH4kmM41cdAh5w@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g077: Add USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add EHCI, OHCI, PHY and HSUSB nodes to RZ/T2H (R9A09G077) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi

> +               hsusb: usb@92041000 {
> +                       compatible = "renesas,usbhs-r9a09g077";
> +                       reg = <0 0x92041000 0 0x10000>;

"0x1000", as the region starting at 0x92043000 is marked reserved?
I can fix that while applying.

> +                       interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 408>;
> +                       phys = <&usb2_phy 3>;
> +                       phy-names = "usb";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 sdhi0: mmc@92080000  {
>                         compatible = "renesas,sdhi-r9a09g077",
>                                      "renesas,sdhi-r9a09g057";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

