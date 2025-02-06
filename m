Return-Path: <linux-renesas-soc+bounces-12897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B3A2A57F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75B5168966
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB122653A;
	Thu,  6 Feb 2025 10:04:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B4226525;
	Thu,  6 Feb 2025 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836280; cv=none; b=Wu2bd67ujYy0s4Fdg6B96OvajJ+4hH/yST3eLRwqCtrHTq3Af1vJiJXvetHb7wY2ndJtH8tL1TsJUnui2mVacrx42UgGrtgv89YKL8PEKxLhl26yQaerAxx6Btqc5ppS4vUrFTaO2TfW1IJmrXKFwm4fwiQDfkkvgry6lKFg6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836280; c=relaxed/simple;
	bh=gjPQF+s5EseZN7bS/YVAUyUM4cSaeN27DQmpoJ7DXAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C00WG6lkGAqwwd68yxsbHpkYL3eEnaj1QYFlDn2nYDmfDkhe8btWVUxHQfo1ondd6CZuvfuiww1jocafc2Xhd6hVSxcqrg6EEtHzqiScKJ0S9gOiQlQUN0Z6bib3RF3GJPXsccJdxoqwdQKWER5E8gWIXPEtv+QXDUNlDQtstvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1237109e0c.0;
        Thu, 06 Feb 2025 02:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836277; x=1739441077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzclxh30y5+yZHJ9M7rMj9P5hxOiH5EoaKGw9Bd544w=;
        b=rvN2JpGUfjZbE/nghl97tF4NVfCtGfi/ClwQyHZ5bXR4RjcAD0zG5lRyjzGz0ixMKw
         ihXhmPjqaAmqGM4NXj+eEdHHNoaL089HfcCDU8BsYW9ysZrdWiw4AVevmC1NQBt9KpRQ
         W9qjyFA0RieZjVm8Aq8m89bbobW8VK5JgQ+PQ0FztC7RwSnTsoLQN1jUWawiZL/MBitq
         fNZyckE8KPpsiNw6kgo50EMjSCtT8Qg9kibovOwz+mIjaa1JySXMCyG0NGmQZoyFCZ3q
         g3fP9GQu+69HD6B/Qh7drDeVcNljC0UFWsAOSldM6GrlyVU213fU4dZsysoDA/Weik0M
         0FdA==
X-Forwarded-Encrypted: i=1; AJvYcCV3DVcev8/b/znvnLKdt6eV0N6ywgmGkQJY309QEa3OgD29eN3vhCv9aZUDuznq+CzPLtYBzK+tsBaK@vger.kernel.org, AJvYcCWWeNAxqjMgh5r97Ve8pYqFUZY/k9WSjs5lBp1okFSYU/Er93bzxv1mIJGpveOUiSVnQdg/dZVfUvhHpwkQGF7Ef8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYpzYtGK1O29aJ7oRa4ixuMxZqrwBPTWaNHo0kIW+bd9ljN1r
	b5JDGnPHGpY7NqqBogCBC7s7wqDdZDbxyQhC24d8GWSztQaa/zX45Vo0yPCS
X-Gm-Gg: ASbGncuk0OViKXmbHxaw+7+4EqFf2OrhbRyebF8ske3rHzszVnl0lywt3sHmQC3mIAR
	+kh7g9YOrtMSDiR5Mx6QPHLaXXXsmSCq/afe2B0MzITDUsmJ28K7ObZzx/F+aijmqVzhBBL2E+v
	fQiyUqFwsgVZF2vKdpL+BqKt4JK8YNX03c7GK556kNQA2ZWe8GkmCSR7DsiIyaddcfm+DcMSpjk
	L5bD7xZAEnCAcUojqyN63CCjVJH96x7J2gWajD+N59p0I3Xl8g5Ir2H0Mh67vwq8Ejk5EF3mHu1
	SvKVtiR09LxCH6bsgvD/HAAc0lhPmk3HmsX38oRreTfloYYSOlx/Iw==
X-Google-Smtp-Source: AGHT+IE2MjStkLf4wHX64UNFrwlqyZmaF/XCvxw37qC/Nv+fF5eAXqCIRe4+fw1Bqb3GJZZg1P71lg==
X-Received: by 2002:a05:6122:608d:b0:516:1ab3:700e with SMTP id 71dfb90a1353d-51f1c157a73mr1363054e0c.3.1738836277395;
        Thu, 06 Feb 2025 02:04:37 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f228db814sm122805e0c.29.2025.02.06.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:04:37 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866e8a51fa9so461583241.1;
        Thu, 06 Feb 2025 02:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeX1VJavZpdE1x2je1o5EYFt6W6zK+8tsg//PGuhajEZR9yirlozugdtPilD4V5XeNC8AThoo9oIb92PzA09Upicw=@vger.kernel.org, AJvYcCW29pH2fW1qAE9dLTmEzLuM97s+PqU50P2HWlnN2OPXpE8HCA99aOFpKQ6Qe01ziz1e170Wbq8iwLol@vger.kernel.org
X-Received: by 2002:a05:6102:cd2:b0:4b5:aa81:7f12 with SMTP id
 ada2fe7eead31-4ba7210a578mr1459488137.12.1738836276994; Thu, 06 Feb 2025
 02:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 11:04:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUph6o0GNX2+YvO8yRn_cW-1MXpvFYKS-jBs2YajEX-sQ@mail.gmail.com>
X-Gm-Features: AWEUYZk3wnqrGrc7fzD43mLxDBHU0J8YpZt7STrAT9jo5iEJkgE8JRRxMz8qUAY
Message-ID: <CAMuHMdUph6o0GNX2+YvO8yRn_cW-1MXpvFYKS-jBs2YajEX-sQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
> voltage switching.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced the regulator usd_vdd_3p3v->reg_3p3v.
>  * Renamed the gpio-hog node sd1-pwr-en->sd1-pwr-en-hog.
>  * Sorted sd1 pin ctrl nodes.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -9,6 +9,7 @@
>
>  /* Switch selection settings */
>  #define SW_SD0_DEV_SEL         0
> +#define SW_SDIO_M2E            0
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
> @@ -20,6 +21,16 @@ / {
>         model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
>         compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
>                      "renesas,r9a09g047e57", "renesas,r9a09g047";
> +
> +       vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SD1_PVDD";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&pinctrl RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;

This is the patch that needs to add #include <dt-bindings/gpio/gpio.h>.

> +               gpios-states = <0>;
> +               states = <3300000 0>, <1800000 1>;
> +       };
>  };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

