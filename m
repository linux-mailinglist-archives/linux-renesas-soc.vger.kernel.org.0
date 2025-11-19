Return-Path: <linux-renesas-soc+bounces-24764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF312C6D595
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CA9E4FD11E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E183032B9A6;
	Wed, 19 Nov 2025 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygix6mE0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA873329C59
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539306; cv=none; b=QxL4h8S0hw31v3oi+N1qVTqZ7MYdkni0yhzDJSou6RM0ajufesVBMifhIrE2y/SULr9g20SoZk87CL3ytasNQ/ofqFy/zZUbA7AeyaVf+ZpYRKc6On0XELC7zdV0X4TD0lzd9Xk+oCFCsHG4SpcO4fTtnALC1ri4N+4a+1LQVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539306; c=relaxed/simple;
	bh=z5K1y6faf5b2+1zAlrcaMcsQVzqujnONb2bvp8XlHlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFM1xnXRN+cvaT1m5QNL4cyt7qqmDumPKBF5Db8gbM2v4fL7nv/eaFvbtGg+TOpgbnGLeRa81w9M+9xlxzexbD1db3YwBj1OOEnccqAa0BcTbkn8IBNOOkme7ApaxOHSmkSoUI8iNlif5dMmYTskalSm03Rr+pmt0t1MT+d7aLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygix6mE0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7373fba6d1so751724766b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539303; x=1764144103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=Ygix6mE0t+lL9vVChi+j0aakCDJHrlG0vtP0LfLCxiMDI8cka2ystTXErlWmqFuvex
         DdjALhxDQYW0o3zjsP08QJB9W5LmaLPBvVcO2LNFGGv08vhND9Q6BnYME/rJPuU4RKUd
         2lp7IEyS1eo/yac4OYzpo9GTJ/h4k9MlCtWKFYDeCnRrz49R19dSV7+pTmOTXlToGDGm
         h2TxPOgdWfY8P4/f7QEJQTjVjmnF25azg2feGV3qcseMfOZdOjYwlgnTe5RiVsGnwj3L
         jL87/gTDwaKuGalT1Abb55cDuGn5pns1OKf3jK6orxZ80g6o0uQvrfEZzLh/+eYCvu0F
         fZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539303; x=1764144103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=VNF4jSzZ6BjIBG+AShO86bOejtY4IIkQ5tYiNz3WiiAELkS0ck6Fv77e4BZAk9WUh1
         t3iujl+uXLdMGFLldPEJQeFobKtrMqIpdyg3v54e5MoKInjXk5BMMYYYT3Ap1qH+5gn3
         yny6Waa45pAyIGKx5sWytTCSKc3Ul83D+eOTEDz+D0lCaa4HdRw9M45ZHecdmdnzEHsL
         guc6oZfWfCEgWeR+yftAG2b/oKqOdf/TTsmMFhhkYCZLVAsHIeibsysWELZXpXYAsX44
         q3lk8rDTju8r00WlR13svUAUXyRDF2+UBM3YFEhmWRRO5fWKQdwmja0mHRulHIPdS1G0
         6nEg==
X-Forwarded-Encrypted: i=1; AJvYcCW/MXAlwa/KGgT1gpfYX/52csOa565a1e9h0qeibasIiPcIyzIVYmgQ4zh1UHVcG44/cNDJ6twl2MzAhKPzam6rzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0PeIuN/zRMHrQIvyEI0COWBqb7qHa8w3MpFkMBlpH0wuV/1U9
	M0zaCfEW8diHXXWI3SA/d8vesbM5uflAYD3gESxz9U6qfsD8Lf2Vlle+Pcqi7/jYc9fMKPGG+1u
	Qo13OpEgKZP+X9wVUvKPd7EE1ncAiQKY=
X-Gm-Gg: ASbGncu08l+zdrmAzFVwCYQgRRyS0qS8A2LqZeqOOUL5+97mWN99k2OkkSB7aEgR2qI
	ek0MlxYaWULmlJYp1m1zea0MKanhJvoIKRjneO3njMDYFxx6iXnulXpjD+wkAxbizuwbOPw9rmp
	MCm0NIli8xT33vRLoT5mfmTh2GM+UHkRxoEb31U/AbrlV5w92zIi9LrxSVGJR4Xqa1ru+XRnPc+
	zwp8Dpl3nA3Xd6Xz5wauheSG2P+BtMH2e08RzpZ4m63aO4rfgMnsJ6gQX+n80XdGZYtNNnZiKrd
	hVAmh90M1UP49ND1a0yapvBOgMNWLbQbmf+XTiZN+Yrya6Zut4TRzrO1hDZ4myH2QkKubwi4Vra
	39SKWfDYE7Bx+Xm+oiQ==
X-Google-Smtp-Source: AGHT+IH9RLmrudJYiFQxGBpWdalp0RNvdPE1jKRqx1L9zjBC+zs6TZNN0Aq/tWyMeDQCJfcJOrE+KpnLw+AjClRbY58=
X-Received: by 2002:a17:907:d09:b0:b73:4816:7494 with SMTP id
 a640c23a62f3a-b7367868812mr1750251666b.8.1763539302927; Wed, 19 Nov 2025
 00:01:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 10:01:06 +0200
X-Gm-Features: AWmQ_bnZWE45z8dq-W-vFJmONbGs-165GBHB7vG7G8yZKHS0TzpNGV8dz1PBcfU
Message-ID: <CAHp75Vd56XYo6PgoJWeUcH328uD2svUCBX7SWT_WUZEH2AvoDw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
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

On Wed, Nov 19, 2025 at 1:24=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:

...

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
> Fantastic solution to a lack of GPIO lines.

I feel a poster "SARCASM" behind this line :-)
That's what happened when old-school (in a bad term) HW engineers who
try to enforce their experience on the modern SoC-based platforms that
run GP OSes in multi-tasking, multi-user manner.

> This reminds me of the Amiga 500 power LED which was connected
> to a GPIO which was cleverly also reused to control the audio filter,
> with the effect that when you turned off the audio filter the power LED
> went out and music toggling the filter off/on for effects would also
> give you an incidental stroboscope.
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
>
> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

This is my understanding as well.

--=20
With Best Regards,
Andy Shevchenko

