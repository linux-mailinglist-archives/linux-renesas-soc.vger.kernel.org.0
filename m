Return-Path: <linux-renesas-soc+bounces-24709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CADC690D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 12:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5A514E2329
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 11:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18482F1FD2;
	Tue, 18 Nov 2025 11:24:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520581EB9FA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465050; cv=none; b=N+eIqFF1yvNsR4mgXyZNyBv/jd+2aw8C/wsXMZ4ky7mMos/txbHiC97rDkK8yL6kq1WyVqVWayxZYCZUb3uwpKYSvF16xg+FRudzk4HhTn/+tWJeD2gpLvzBSMRd6JXh3DNyqbhlD4Hv/abIcUEw0WSLtzZqp3TagkvudBFFCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465050; c=relaxed/simple;
	bh=B1FsBCLZ1091fdu3CKfazhUK9tOtY4FVr3EaczDF5Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsXMJHd1v5R90I1f2/Jc6YeS8HP5TbfIlwwq77uHhlamaP06IduANZ/AJaeFiZ6zF5L7CnWCdzTSI/TGbS/uZeAF5oK0regEog6OmXLAh3ThyrHzgi1ZVAe2QjIav+NnTue7jV5rHQLvD49sLYDUxdUjNxzb/gm1+z7TjZ31W1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93728bac144so2956896241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 03:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763465048; x=1764069848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=;
        b=Bw9CGi8f0NMY73G+yry6Y4drdag7EWn5+mFk+fQBwiSiYOkFH1pKA0SekMr5I/g7B3
         XSBUgMWWVeHHqJD0ZZd74t99ip4B8kdjjIeodcRZ3dEPnLQify6cLL495rr2sDCvihVL
         vUwz5L1c4CYY1qTlg9NCrubAN/UHOSjaSnNMCn2Q/t9DrsOQSdREW3mVyh8cYexCcjl1
         uDMcbxSuj0pBwqbP1N1vpvMeIZfifygNuG28Cb0K9k6QckQeRBHpKV0FPKiqgUNdznI3
         /kstoHPepCc9hi+fpG/ZLOz6SMjPgD4PieMFi9iihzOEBzgngwZqaURjBgOiJgQW7eLR
         XiTA==
X-Forwarded-Encrypted: i=1; AJvYcCVFSkoLg7hSZgAQzc9tE0kc8BCQPv+ud8otbWYoBHjmChPn69K54452YC7IzvxbGhH78lE9EQnHm51erroDJu7wNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YystB0Ku4fyVqzWv0iBMypPl6xdzgxbrYNjA5eOwRs/6Mb2PW5L
	O4jEshrdqm5EeIhjxVVnlKpVcP6Axrs35DIbUXG4bL1Qz1GCXD5jY6hgvL60k7epsg0=
X-Gm-Gg: ASbGncu5OxnJoi87Es0XEUbGf71oKUviJ83zcFR2OypJmuyTnijbCtQfHZSzabcPDGz
	Z48ACrr5IgewCsUZJDdK+QZmarHE49Jgs0JCGt/T6zACn/wZKOAX2kwIQ7Iw+GK8eA78FG6rZVL
	eyJvy5ac0LA+G/fNryZkwpuL/BZcxpkNnG+q+8Q9j6PDs13r5HDTKRlVY3Nbm/fNjrJgs7MwRHl
	AyjHv6Q+3JFESeMMbL2ab9RzwRHJysWi/3gHxEIR36XvawkrNicndwyEndtXRIVMBcwazWeL3rd
	HYGvlnhOd/BrrUtmbhlSyo2eEH8KsmLZP8sXmSbPTB1LdFL+Oyb+gmRMlUkp+2pZv3YXzwGlt8q
	3ZAZthvEXxLvaT/3W0fvic7V0BN0U2mlca6EUR/cOKwrOTXPu5AZx0rHbv2o454FgzIYYg9smT+
	QTAzdvE+qIsbR+6yW/rf0XLTjE590t1PoKbCsAssNBBzamNoHoMfzl
X-Google-Smtp-Source: AGHT+IEJshpMbzHP3plBai2d4q1ruqm9nx30wYgdgo3Ah8PrfOFUtE0rbBaR9OrjwsHq7tn74PUxFQ==
X-Received: by 2002:a05:6102:26d1:b0:5df:b36c:2f05 with SMTP id ada2fe7eead31-5dfc5ba1823mr4966181137.44.1763465047939;
        Tue, 18 Nov 2025 03:24:07 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e18685814bsm1212893137.1.2025.11.18.03.24.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:24:07 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-559836d04f6so3389937e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 03:24:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmXqRoKXsQQwBpMqs2HdY+eVJBmtauOMGQlG6VP0TEbULlq5l96Ne+qXTMI8YKB0AF6FPRxW7xr4Q9MAnVTDNsBQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:5dc:7fe3:1d0 with SMTP id
 ada2fe7eead31-5dfc5586babmr5642681137.19.1763464547898; Tue, 18 Nov 2025
 03:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 12:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnG1e_JZjF_t0LAgzvKf5wM6L4cWt2t2bx5VV8t6YS3prQ_Mx2gaFVEov0
Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

Thanks for your series, part of which is now present linux-next.
IIUIC, this requires the direction of the GPIO to be fixed?

We have a long-standing use-case on various Renesas R-Car Gen3 boards
(e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
key switches.  Basically, the GPIO is connected to:
  1. A key switch connecting to GND when closed, with pull-up.
  2. The gate of an N-channel MOSFET, turning on an LED when driven
     high.

Hence:
  - In output mode, the LED can be controlled freely,
  - In input mode, the LED is on, unless the key is pressed,
  - Hence the switch state can only be read when the LED is turned on.
If you have any idea how to handle this, feel free to reply ;-)

Thanks!

[1] https://www.renesas.com/en/document/sch/r-car-starterkit-schematic
    (needs a (free) account) Page 15 aka schematic 12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

