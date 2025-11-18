Return-Path: <linux-renesas-soc+bounces-24715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE664C69819
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A21A64F0739
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 12:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFB2258EF0;
	Tue, 18 Nov 2025 12:56:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9A324886F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470570; cv=none; b=Kz5ExkKlgKCQT4JLEHgomoLT76KIBdd28RSrC0t3U7FonprFhg3difrz3bmJynCPrevPzgWpiBjUxWA35AklY5r0eN2+j5gM/qt8BNrIrrxg40sxPHbBo/i1vgVLi0WuNlbmfE6Wh1uXULyidlmYXOvt0PxwRFjVe3Su1Qj1lz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470570; c=relaxed/simple;
	bh=/zVQ3caVQJG3gQBJgK50MyXyKcMooS7fUfIbjJLVF6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCgIdI3wozsD/6e18Jvl+T/a6ZZ9W9+l8wUS4y1iwmkCRcO+ynT3ResAjfHdQkyET5Gc1aEmChFAyik8xRBplX3tqqBzb4mX+PfWOcqx1c66eJBCu+b3IQ1LUdjXzA396YnTlEQO71i95wXKFNYJgwDPh9DWSskmRXm0BtxzoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so3403360137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 04:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470567; x=1764075367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=;
        b=KPuUJjM8taX5xb6X9M3cPIejfCg7tulbHpHWof1UdfOhFbAoYfckhfjHvcVknfijvm
         ZGq1o3XmPjyXYibDHQdXSOF4LpD7Tfhg6S0V9icM2GGsSWe7bfaWMKbyuWkRUXzXHjmj
         FJA1EBVLm1EkEmtj2m/ghxWT+W3Np+a6A/LJ3mwfi19lqGvl7OuXGcLl3n8xOIIqfgUn
         uAb/pLYeNXr0QFh1vmFiVbQ5wuS0h+XMksK2VB35bhQoEuxxFcVJEjGzGTzGraRcmRas
         0GCsTUI3gapLVYIb7z9ydq8uv+7IAzl1YJnkRuH/SI37lpE2w3if4pmYhH/ZGSg9MC4v
         zHzA==
X-Forwarded-Encrypted: i=1; AJvYcCVU45Kc4qtzD88Q1saWxXPG3/rJNV9El9ZI2gnZqyrJKIr1lQftXt6ZhyRlztFg+oJ4w14VI65kHucBimJ3ZcLKFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2tONfwoA5nedxf8LbtHvLJ5BG83COzCm3LQ0hEhbSSG2B9ZR
	b/L5dJDHWtAB4RhIUYkxq49bPYQVDrqtTfEU1GI+MhufesuK+P/fRs3cIsKRGuX9
X-Gm-Gg: ASbGncsDclm88se77ldu0a8H5SswoDylrjcMDS8M+jVQeTULS7zKaBqVEU66WGAGOsR
	aDdo1Up/qJpl6r2t05Og3GiLhAWXKBMGzSdvDgikLvm2baJPtY5Ug/BJC2+EtUU6YVl9+CnL+l+
	IV137/yr2inJ7fYJD00HA7MzDDkI+SEGmwcnwL6613h3H4LHvjZ70ZUq8NPAM7HHJA4c+bDMcaF
	LA1xtJyBFiESrptJa7x0g01UBA6RnSua0wqHd59kkYFYhcFimudZ77NAhZ5quw2mvgV4K7FG0gn
	buWO06cuNQ4CTwuxtmY51WNoryqSLfUouTK5dTyzRMk/PBkwM/VJ+gvZIV3QVK7AJPLhwehBS/B
	Eiz9nKnPv0akVhMEhDpXdemmmInURT/+tjgkr+p/wRIUq5DDTUswYrprG2zQRE8vOwTrZFKKTGG
	Wn992d3qnCOPuGkPzF069CTpVF7pgoRBrvB00ab27gfwljMzBA
X-Google-Smtp-Source: AGHT+IGPW9aYN9uUStoTP/g2uUyM1Gr4UadcKQ4eh6ZwDMrVWImRV5nnX6Znj1Gd+/DfKztoggSoBQ==
X-Received: by 2002:a05:6102:ccb:b0:5df:a98f:ca85 with SMTP id ada2fe7eead31-5dfc5651159mr5443465137.21.1763470567000;
        Tue, 18 Nov 2025 04:56:07 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e18685814bsm1284442137.1.2025.11.18.04.56.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:56:06 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93754419e10so3016451241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 04:56:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVs2uWr0JJexkLRj+q+Lgc5WjyqkJikp8rY7UoY2Sm1h5tCt1YvCrcDo9MEmw2vtoWHp1Tlxgu/YhFJM19DgxlrYg==@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:5db:e0fe:985c with SMTP id
 ada2fe7eead31-5dfc54fcc32mr4842088137.10.1763470566608; Tue, 18 Nov 2025
 04:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 13:55:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
X-Gm-Features: AWmQ_bkC98gq3Hx-nk9zI-w6kSG9BC0TZLZ6VioIzu7f0ulaeAjNY59_KJ5q6hs
Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 18 Nov 2025 at 12:55, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with wha=
t
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime depend=
ency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it in=
to
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > >
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which singl=
e
> > > pin is shared by multiple devices which don't communicate so need som=
e
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just h=
and
> > > the same GPIO descriptor to all interested users.
> > >
> > > The proposed solution is composed of three major parts: the high-leve=
l,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level share=
d
> > > GPIOLIB module that scans firmware nodes and creates auxiliary device=
s
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > >
> > > The changes are implemented in a way that allows to seamlessly compil=
e
> > > out any code related to sharing GPIOs for systems that don't need it.
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > Thanks for your series, part of which is now present linux-next.
> > IIUIC, this requires the direction of the GPIO to be fixed?
> >
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
> > If you have any idea how to handle this, feel free to reply ;-)
>
> How is this done currently? Even without this series and using the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> direction so it's not possible for two drivers to request it as input
> and output simultaneously. The second requester will override the
> previous settings.

We do not handle it yet:
  - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
    the keys (key-[a-c]),
  - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
    (key-1), and the others as LEDs (led[56]).

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

