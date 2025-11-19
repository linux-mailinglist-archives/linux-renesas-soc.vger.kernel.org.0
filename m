Return-Path: <linux-renesas-soc+bounces-24820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AEC6F6B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4BAD4F973D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2753369211;
	Wed, 19 Nov 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s18TSfPU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C40369200
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562600; cv=none; b=eftH8oPES89UP/KIzgYLb/YD28HE0J/rIbmGUD+PnjDcL+l9cf5ARjkljyA/C2tDQqxsFkmzvLK87497yMAnhZCfVcqedO8ri+Niqa+Nw3Aj2taTcx5sLzOHZ6zo8Ph2Jd/hTR9onP/MBSStASenzsJeBEjp0t0RDCacOZoR1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562600; c=relaxed/simple;
	bh=QYkJ+KAJptP8x+/Lo+OPyvZfeeVlUCQUdUVwwHK0tdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdPxu9F4I9v8ab6Rj/SsOuY/t5DBC5FjuB1DN4qxak5OvX1NizRq0M1kSSTUAsjdUvp9j3YpGfHwh1wuzBPisJyOZpWh6bjKNPRFt/pPlPjgiZjlf9afdagKoFOcfbc6LAarDaYRiU5NsTvebwtVTGe/EvjyJtyf50RQt8Wakk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s18TSfPU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5959187c5a9so2612081e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763562595; x=1764167395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=s18TSfPUarVrfVD9Q289QlNx1XEDTfcU8bi5GXrz3W+DSMQoea3Lv3herjQOmTFxWf
         RnCJCTg1nmGcgFlw4R2OxLtmInTDyHf5IZhwpwNhJxOsxEN/gjUh5N96v0rM4nXMsgHj
         3/ZFfkBTBzj/4pRjkvMtZmZIbjctGR8/BGbLbGmewCcwCUrg36LgPbevDP2cNPjovcfk
         eME/KNWlNnmFtlL4BNoV2wwmA8rwPnCeI0jJUXxeHWqN3rrElCznudkbcVbYx8FLHJ6+
         gpqHIvcybbH5PGjn7hX4wZRttrc6/Bpj/4/qlsbYFUAQiDGbBGd2KwHR7vsxt5H1MEVi
         RsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562595; x=1764167395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=SiBbud2zjWQmAD0QV+CgzPabs8Py4qioqIAhpJ5hrmekvrcc5UQVKnT7FCm85e0Kkv
         VfcU1easivmQo16PSWrvFtuZ00cAAJEoCyPFRwVsv+8YWIqFUj/3FqmQzfk4ZPLR7Zpn
         6Td82h4rYYlTjyLOG/S+EHGwFv1dn1N8bFCS2FZPGZWjM2mqueB+anc+KXCkWeXJ4Tix
         KMeuNk5ld7wl3anOzbiIPxTuU/DB6RObIivtLSuWhmggul7zBCshi+pow3/xYiIFFomg
         Df+Y3YMgy3lbBwQRN/s12Swle2zHe5vn61uLVZ1mxcPkUKH3e5jKmJ9rv47SzBycbVlE
         E20Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDNyTCKYNK1HczdNpaLkXXjVvP9iYULgn70i6GHLqb6HoKidkS9+wjO5oP2hx3PtAwA47Ym5y+nppK3opEHZ7HRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwh01fb7KWD8qbZWU4F7XJXsRzzPHIPyJOIeWW5ps3foi1NPp
	ZDt8b7Gf/D06qLgXD2ewIkcKXyFwg87YZt7zF0Ot7h2X9qX/ypIqlzDQ922+l3kDbxodkEAgA0w
	YilKyJOTfaxtgyGepPl7aKTS0lhMPtWuP+oKAcU9zDw==
X-Gm-Gg: ASbGncsYFvsvcDXVDGFDEsJIuvAsBAICj7NenTUazgH1sTB8J9PkOsRJtQjEWwxOY+f
	1PEtuhPoOysKIYZVyOzAcmr58UvXEfqZUwBwTFMnY2S3e9yBrGJlqblI2nDyRPtzDZHA+bVqn8t
	ZEdXjixezIs8CMTtSFEfudk/S59xsvXhoVK8tlaaKRZdRT/i/nL+MVRjf9Ix3qlKduL6RlZVfic
	pzY5BQDE4KnCYWY68PgT5wEaRV5tJMu/igJ5oAzc/siHc/xBSObvqWAekoAaxBPoXJ79bg=
X-Google-Smtp-Source: AGHT+IGp7GKe1RKdp3EifTfSeaou18jsyywYSKyMxPvf6+wpNti41ngxOAgDWBsE8YIo1EJMFQbA1mHAun4y/oak87Q=
X-Received: by 2002:a05:6512:138a:b0:57d:b8a1:832b with SMTP id
 2adb3069b0e04-595841af20bmr6916107e87.24.1763562594938; Wed, 19 Nov 2025
 06:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com> <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:29:43 +0100
X-Gm-Features: AWmQ_bmc-n1cuVY24_yDbxt_0pYfljkKCrIONDdezzzLDg_EEB1-VOCfHUUS2FA
Message-ID: <CACRpkdZp3zKVCeJPXJP4UCAbXz-j=81zYfXntxuBp5BK5ettzw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, Nov 19, 2025 at 9:38=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > For the input usecase the status of the LED is a byproduct and
> > should not reflect in software I think. It surely should not be
> > controllable and possible to set into output mode because
> > that sounds like a recipe for HW damage if you drive it
> > actively high and press the key at the same time.
>
> Suitable resistors are present to prevent hardware damage.

Aha, clever.

> > gpio_keys {
> >     compatible =3D "gpio-keys";
> >
> >     button-ok {
> >         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
> >     };
> > };
>
> But only one of the gpio-keys and gpio-leds drivers can bind to the
> GPIO, or am I missing something?
> So I do think I need a new combined key-and-led driver, like Bartosz
> suggested:
>   - When the user turns the LED on, the GPIO is switched to input mode,
>     and the switch works,
>   - When the user turns the LED off, the GPIO is switched to output
>     and driven low, and the switch does not work.

You will also have the byproduct that the LED being "on" in software
does not necessarily reflect the actual LED status, someone
may be pressing the key and then the LED is off even though
in sysfs it is clearly "on".

So the status in the LED classdevice also has to be forced to "off"
(brightness 0) anytime the input subsystem detects that the switch
is pressed.

It's going to be a lot of work I think, but I guess it can be done,
with a lot of special-casing and custom APIs.

Yours,
Linus Walleij

