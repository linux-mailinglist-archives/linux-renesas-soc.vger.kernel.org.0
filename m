Return-Path: <linux-renesas-soc+bounces-24716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBCC69935
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 911F8348D89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446CD22A4F8;
	Tue, 18 Nov 2025 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ph27r6sT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517DE2737F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472107; cv=none; b=eV11Xf2HiL7uLE0m57cgsnKsMAHFYG9JEBERYCwRzqA1I7KjQZV9O0eQ/5SjzE7bRqa6bxPxYTlVbBUBr3yvJfQVVJScOT28lhETf4D5CwTw5Kass1Z7kSqu3hufPowc0tNkQzBi8zkOJ8zGTFpb7CM79jkssGfSaHJELENYvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472107; c=relaxed/simple;
	bh=E5V/vfphfgkZe38UOECGMAO1aduhoV4x1WIT54usrgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bidVbahWYsjaLdTTE6hyL3NDKhzpT9+QZWHgOZmdijf9cwckR6P/S4TadcKq1+J4TOY0mAhqI93qY+qyRP666eU2NCe4UTKiq1sqPe2/vj2kUPdr+g5S+IPVgKFWjvvmSMZFi5IlvNVs9T50faQjduMUVlfysZFm73WSqp7RZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ph27r6sT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b96cbd875so38285241fa.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763472103; x=1764076903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=Ph27r6sTzqLPKi+GnwrFGLObYPA4jXb5/Ex1ykBIXTlJm9iUNCPBAZ/UTdcFMRNuha
         W83jRYGNB+gQsGuJMJYB75JDj0WBx1Jiasts7mcT4lB5gjqpNQFIux7T6KrSzeUDm7Zn
         ZRqnp/Fu2bY6iwh9dYwMAoWNovab6ZlliA0rh/jRxlwDRso6OFlggy5YcoWxQikLKwax
         u77K7rPo8AiT9Regc3v4A3q8YHS7+SMdHYkCWGDvboNKRuGR1wcFcIAifAcPxHlzxME7
         sRxIvTy7SamOMQ5ge1MCMaun7cE+bMFSa0t4vNcwvvVlmOKy0IEnuNojs98Nnm7gRSOV
         kAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472103; x=1764076903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=HIF1mQF6Zg/kC+KWL+7G1QdoOQjnBPnRsFFypD9oDkswTLUwk3a9orBjnu/3CXlezy
         KIQJGABQl+mJfejwXPtxOj5/94G9jbuL4kuEciOQRtkGRDdL85F3+NUIBPdvfNkB5R/t
         LjCWbHPimtOlOvseLbdEwBlLQtDg2lyhtDReSXG9i56YzW32KTcYfz+ftBM9+2IyPF/a
         7vH+gj0x93QyyafpVLTBWk0DkJn9BV89NZvOe5mZib6wBx1I51cOzSo5BzUQLjE0oF4B
         36Kriwwr6l01iBecvWDlS97nSLKyMB4RSit1GCIYn4cuuc16bQo1+pXhWn9U0L9ZkmrK
         Y/9A==
X-Forwarded-Encrypted: i=1; AJvYcCWO3Mn7o2C52oNdl8fQnngIOGWaPXVh+/9UvcANa8a+o5HbIxcFcHYAJKpGUrh+5aJ3mty7jCujyTP6Bj671M274Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+O5uJPM/woM3WiHDTUdUTEAN5gP/ass7bP3d5YxOfo4Xlnox
	tIRwMTjltC20jBAO/lJhrNI81nh3AIGmU20zIli57qAr0y31iUADzhv7bV4LwkovWkqNw1N7O26
	tjmPEN77/2/Wt2Dg9j65bxFbRFEsvkQTOhEwv9nmkxA==
X-Gm-Gg: ASbGncvcvJipGaV8Ng7afJ8DrC2fWuyaqvXsdW/XjJHqujT+NuziGaWBjQVNxNs23Gl
	fXz2fUS2bxaF32C9JrQFLAmj9cGVIt3yf8Ezul+2Oz8itwMwPkp5qhYrIQdBHFTfFJZ6OVDkxYB
	/uijmlCRVHLytT3Xhc9mgMEarxrScbtFX5qazFfBht2EPKOC+g8eQhaM/0xwnz36FA+fP5bjEEv
	aADNjh2ks1vwTxhWv5z2Twn1kTbs9V33Buf+hSWkvvahNqUXENOxsQC5KINvGcsMVtQjIBsm5MC
	3IQgw5PZM1thjpdzwi1I475Uhg==
X-Google-Smtp-Source: AGHT+IFLx4rEab/wbUDo4EkSCUHDw6GWYiJjtIbCHDB1xl+ZlXv5nLLQYI54hMzgwVsRu8daEpH3NSYMy9pTQDZmbZ8=
X-Received: by 2002:a05:6512:3c9e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-595841f842bmr5089204e87.46.1763472103404; Tue, 18 Nov 2025
 05:21:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com> <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 14:21:29 +0100
X-Gm-Features: AWmQ_bmgN3bhvSn3FjfwQqs5x52sLWvM37dbNjtnEqn6scQIfee74Ky62f9fPdU
Message-ID: <CAMRc=Mf_j8jNMrJrnGp_bVmYQPLheE55AN4gXCtRrCDkF5CXsw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Nov 18, 2025 at 1:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > >
> > > Thanks for your series, part of which is now present linux-next.
> > > IIUIC, this requires the direction of the GPIO to be fixed?
> > >
> > > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > > key switches.  Basically, the GPIO is connected to:
> > >   1. A key switch connecting to GND when closed, with pull-up.
> > >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> > >      high.
> > >
> > > Hence:
> > >   - In output mode, the LED can be controlled freely,
> > >   - In input mode, the LED is on, unless the key is pressed,
> > >   - Hence the switch state can only be read when the LED is turned on=
.
> > > If you have any idea how to handle this, feel free to reply ;-)
> >
> > How is this done currently? Even without this series and using the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> > direction so it's not possible for two drivers to request it as input
> > and output simultaneously. The second requester will override the
> > previous settings.
>
> We do not handle it yet:
>   - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
>     the keys (key-[a-c]),
>   - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
>     (key-1), and the others as LEDs (led[56]).
>

I see. This series cannot possibly address this. Off the top of my
head: I would create an auxiliary device binding to a dedicated driver
that would be a consumer of this pin and register a LED and an input
key. By default it would set the direction to input and if the user
decided to configure the LED, it would change direction to output.

Obviously, there would be a DR quirk to handle as we already have this
described in DT as gpio-keys on salvator.

Bartosz

