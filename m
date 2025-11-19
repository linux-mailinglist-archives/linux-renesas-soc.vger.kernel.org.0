Return-Path: <linux-renesas-soc+bounces-24767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D3C6D779
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6EE0B2DA46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD1232C935;
	Wed, 19 Nov 2025 08:38:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D932C934
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541526; cv=none; b=PXuhy3krCON+yj4QEWUf6sYSolzvSSQWI7bcS269XlkrJsGA31FbkJhgRWc3RV644yGaifqDY3mersSZWDTZPePV7/leGGoJ4kOE/DnPyC00p+xTtoC+QsVjzM9n8EbNSaXjxyfiGgebW9JkdchV3W3K0slC4skw7HQ2NVc2oM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541526; c=relaxed/simple;
	bh=Dz2RNjo2Pw0XOcm+SGn1fEPdASUKESrZTRijPS7lbP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqjW/TyZfusdyH9CVtHB5xL7ORhLsmbx/TWP8thiSfMCJ1kaT0ax8GLlj3HkutBwfsdZtj/StsMs90vJ8AdAPnT/pJvaQlUg/y/2tNqyckcbEriyGCPJMbtTlNOXw1q+aJcrGZNGctI1kIsBUnHwPgxND+R0HXfU2GF7dVQgdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55982d04792so3740576e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541518; x=1764146318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=;
        b=I3UyQDENomjB4k3FTDwqoTZYyd0XmST4Dfge2mbj8UB0YGoME3coNZb8oEOd8TjenF
         EA/qcgykh+cOgVeWWwfeyhKgZOtx3V0voDZaY1EtITaKV/Ovii2QBqwSgAs7P7newCu3
         4oo8rXguuHH6wmZaLVrKoKoVygyXFO0fh0DWKHjweSlc8HooLx0WpEOt+of7xenlei5U
         rVaRB3+nI4D4pa19axCLrOq3yQQG3wh4f3wl66EaLJHhBJL5KemcI/4KvqWWb/Kycc7e
         D4WNl0k/r1VIcBsygamya6GeJtVBu9z2mD51Kom2rI1laJ9ydufTciE/GCy1/AqPUo0Z
         sqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlC4eScyNtBooJVaYiHefuyxwzlDG2RHzMf84hHKqkYD3NgD8GuVROPxFcMHSmEerSrzLDukd2WxJcCTPHV3tqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTS88qfm6LFu51xcd15dEQ/mO4aw7MEKYBSzb2v6xBNyDMXwXb
	IGPm2f0tcGO/KZTGcGO97loL17W4m8diemAxzCbRFzo5SPM6OOqPWodHQEC1L4pk
X-Gm-Gg: ASbGncuM0XfeHjrEHhp6umkKWs1gh9q4h4vXe3eY+LnBdeUJrTjl+Jlz/nWI/4A3zUV
	Rv/Gp2+wglNCI/rwY5dGRk1Mqt5pksCtykpNNfiSTYbWhIUzMqhB19+N/9UKKSAxQUTC58F6KeW
	oiSVTcHLC+YBZK9JMUjE+orq7iRMGm1MfHioXsWQIa441Gc4pR/C9emIhcDTyqm0Lg5yd/J2z9t
	/Tl7sFqLpJ3j0UioHwy+A+z3CZGBCzQ2t+BiQjuD8P0y95O4rOxOV5MWZv3ZAET1OxScwovrzcJ
	DjfiMOCgDfBUX3MDcZYoa+LkmumN59aw8dT0zXjvtr7W/cv5oc0BhM/ULmN5DpVkIp8Z9Wm8SFL
	eYbrHaP38zW6q4WMaUfLbGKcD5kSlabAgWqYJnLu5ikN83F/q4ReBkJLeFNejbA5YiV+RO1aUMb
	jdCGiVc6dtAXV2Ckd1nZY5sztkbKTlXpdACXNdkuwUr8mO2wmG/PrWp7B508w=
X-Google-Smtp-Source: AGHT+IF3k9m0quP97QyLIDvgdmm6SbgMTUbjKwJcUzZZ0iYp5aA0TqFxlu8/u/U/tIMJB4eRvpw2Tw==
X-Received: by 2002:a05:6122:219e:b0:559:63e6:d06 with SMTP id 71dfb90a1353d-55b1bcdd1d2mr7084612e0c.3.1763541517959;
        Wed, 19 Nov 2025 00:38:37 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f32e47asm6371993e0c.1.2025.11.19.00.38.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:38:37 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5e18598b9b1so1646846137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYHi/xBqzt636CtOldyHmrqLlChxPteWMw+9WZk2BNrbYrIvyWrr3vFhmJPMZ8845Uf7iqTsJqCJ8PxdAqO+zQyw==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id
 ada2fe7eead31-5dfc5c0488dmr6881252137.41.1763541207113; Wed, 19 Nov 2025
 00:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
X-Gm-Features: AWmQ_bnsTpUUScnL6xOjY4S7f_b3_VnG_mVkF87eF8BY7eFC84gNc7MAR704Al0
Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 19 Nov 2025 at 00:24, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
>
> > If you have any idea how to handle this, feel free to reply ;-)
>
> Isn't it pretty clear from the system-level DTS how the line
> is used?
>
> If it is connected to a gpio key it gets assigned for that usecase
> and handled by that driver and if it is connected to a gpio LED
> it is handled by that driver.
>
> For the input usecase the status of the LED is a byproduct and
> should not reflect in software I think. It surely should not be
> controllable and possible to set into output mode because
> that sounds like a recipe for HW damage if you drive it
> actively high and press the key at the same time.

Suitable resistors are present to prevent hardware damage.

> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

But only one of the gpio-keys and gpio-leds drivers can bind to the
GPIO, or am I missing something?
So I do think I need a new combined key-and-led driver, like Bartosz
suggested:
  - When the user turns the LED on, the GPIO is switched to input mode,
    and the switch works,
  - When the user turns the LED off, the GPIO is switched to output
    and driven low, and the switch does not work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

