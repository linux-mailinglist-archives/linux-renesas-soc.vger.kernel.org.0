Return-Path: <linux-renesas-soc+bounces-17199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C6ABBE5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65DFC173BD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ECC278E44;
	Mon, 19 May 2025 12:54:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0441E4C9D;
	Mon, 19 May 2025 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659257; cv=none; b=rpFYxqKdvLX9VbEWJIu9IVUuSFfp3BJhxWz0Q5axk1+5N97xX5UEcR14qvJjma4HiKA5EwGh/PY4A8Ysf1P8UKl4t08Lltwuu2LrmWZcVBripnBhiBai//MzL7EFXOnQQLsaiSBr92cnlC6xiemjLwXcYcp8XXU0fCLUzR+HgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659257; c=relaxed/simple;
	bh=x78X5Qk2wOaNaE24klYJQRG2UWjwRL7c+W6Yq5b8398=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qouszRaYMOtHm5VWqFWsbPKLenzsv3eo1f+3pShOJ+1YOP+OB0MfI6F9PU25Rd5B568DYj1VmJRQzr+HSA3eY/XShkcUsUAksASExNXFC4TeR4fQrSeOpVn0h/Edmhpdb40gVA0l/MnlziufiV0RlMVOuRtaaUZoOkaAUVXtMZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1038229241.2;
        Mon, 19 May 2025 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659252; x=1748264052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRBvgTHgZntCXNJBY5rtdZ4n3FATvNkFDQYn5xNJfuw=;
        b=IA0CvQOMNcwtc/J8s2/xCh9BtgIahNamxIAvas1hJNZ+wD4LT/PbUEFNp3Z1hgQzRp
         6lNw0j6WdI6VWYmjfmw6cjicReTP/VRyK5Gbrf66o+DmxbIUJZC4qbhQGIBERYWvfP3K
         x5LndV8/oykpzT17evFYhrTe2tftRgvL6z/ToH0Ecyux4GFAaDw15yxcNrbhvbh1n8wf
         x2YKboGR03BUK2UzanhKJDRtHd93xhV8dh62BpCEKZhgyOE4680VbMasbSLJNZVeh1QI
         xySbmnvb0RxW2Jew9WvJEy3mPoMWQzU9uWu44I/kPi2CgMyoCqFK5oUCy3f4kurgEipy
         J1vA==
X-Forwarded-Encrypted: i=1; AJvYcCUy60Re13IhPu5xcdzjROw6pfxmThb8nlj8q6xJ3iOLzAQERze7Q847eSHSmvJcB6VDg80mLZKE7VuD8gOJAhO8jIc=@vger.kernel.org, AJvYcCVrURbcSHcJFcAEzhrm/P4PxbbqJWgwi2ln4SVh4p77jS9z4xayy3FYzxKoy3pIUILtvE3CQKgUSA7v@vger.kernel.org
X-Gm-Message-State: AOJu0YzMa+B9cR8p4eNmW0qSdXbxBiOoVkgUXKulsZFWVltWX4sQp0s+
	Bhe+B36wnKI9+UE1JTP9iCmJrNmp50QS5H+C1eKPvuFzsIWfDFM1p7MEU32ulOUM
X-Gm-Gg: ASbGnct7+0A3rgERRsluoYLN5FOAclX9Cxr4b5ciDpHYtJZfabR29TKUFBBEAP3OOJh
	rFfPErMmqunUKAiW2O8V2ihrgxDMjviLI3U1rp0g+6YOLRCXaA6ln4eNmiu5GPxdKWvBmtimlp5
	myvxvWfMpPfakmqfiThOK/6WaC2POzBqWtongMfLQ/xb5LjzGO2EHW1PIR1Rnpd9suIghYVhe77
	87vwSI/ImilYUeQcmfPsW9xsLTW+AkT16fwFKUW4XUisO+LVWgPxxqFT89/i3ULkOwYNychfDvZ
	l9d/6CLd21C+W0YYhGoiIz8o30pSxZHToHu0PTfr2v2N3b9Q14vUiL2vi20Em1ARKSBxKoHsMw5
	zm94L/9HOPbWwVw==
X-Google-Smtp-Source: AGHT+IEaVKDT7wtrBnDLmo8umZ2fbONSvWm6zxOOeAX428UyruS9ddCvdA5UcXPkRlqAC4vHw01haQ==
X-Received: by 2002:a05:6102:334c:b0:4c3:c9:c667 with SMTP id ada2fe7eead31-4dfa6c5b2f5mr12488448137.24.1747659252473;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bf9b4f657sm4560833241.2.2025.05.19.05.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso1492654137.2;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWS+XyEUzZjaced9rAGJLili8mW/FsmrZR3LPqFjGw+FszREerqv5WRW+hhwdY6aUifbQPdsjZJEzoColKthYOeKY=@vger.kernel.org, AJvYcCX1cQuXOGNu7aSozo8EAE86r4dA5NGWYNoMnLYmloPju+ZLem9b0P2DL09kqhGtWE/5yh+b0X+1Hy+h@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4dfa6c4654bmr11600429137.22.1747659251869; Mon, 19 May 2025
 05:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 14:54:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
X-Gm-Features: AX0GCFs8QnZ4h0I_0NgB8aYbEDIYXLj_xXnsltgGbg-TV1xw1OOT1Ne11-uflm8
Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	loongarch@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 19 May 2025 at 14:15, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.
>
> Based on linux-next as of 20250516. Build bots are happy. ARM patches
> depend on another cleanup series[1], the rest has no dependencies. I
> suggest that patches go via their subsystem trees.
>
> Tested on Calao USB boards using AT91 chipsets and a Renesas Lager board
> using R-Car H2.

Thanks for your series!

>   arm64: dts: exynos: use proper node names for GPIO based I2C busses
>   arm64: dts: mediatek: use proper node names for GPIO based I2C busses
>   ARM: dts: microchip: use proper node names for GPIO based I2C busses
>   ARM: dts: samsung: use proper node names for GPIO based I2C busses
>   ARM: dts: stm32: use proper node names for GPIO based I2C busses
>   LoongArch: dts: use proper node names for GPIO based I2C busses
>   riscv: dts: allwinner: use proper node names for GPIO based I2C busses

Hmmm... which of these changes affect the R-Car board? ;-)
Am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

