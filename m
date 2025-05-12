Return-Path: <linux-renesas-soc+bounces-16958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95346AB3055
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 09:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D8B1891CC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 07:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059712561BF;
	Mon, 12 May 2025 07:13:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7212550CC;
	Mon, 12 May 2025 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034035; cv=none; b=ZUf9yY7WSTaO18qc/0STizTtc2tH9ti7jry+XxnhZ6WXQ9OvQi0a7jKB0i9+wP8uQI1IfPk3sCg+S9KNOziuK/vBccEnZu2DZcaqsQW5L2f+RYu4qx3iCZYeYfsDB18dZtIgdv65lVozdw3iuVT5MMAw81CY7CCKC6q3cR7LdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034035; c=relaxed/simple;
	bh=MiHYB400XPXzuVuSmbmy6Ae2GnTT2SFpWdfVL+mLBH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsdnJHCrf+SDLL7Hi2Nuev0aMi/a4hLxwquHPePAX0rYYsSigwHBKBtkh6j3zuwX9Ltsu3AEo2e+DlbRvFiXxwRE8ERxvXz9TvzBx4iVinOqDS12RPJ96EidxXAniZwNitXXgr59/tK9c0zO4Gp6gEoencxYBaDDpn0VnOWm3q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ddbb0fc1e7so1173100137.2;
        Mon, 12 May 2025 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747034032; x=1747638832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXUxCsC3gl+d/1qqVBV5rMq7iPm0soQTOdcW0w9ozEo=;
        b=RLa1AD7Tj6fL75udwKEtw0aLkanSxMbnpK6n9uhNau7Sz8oaAbCySO5ZfGYYHpTmVm
         5BxYZIbgxKdJoOVV4unmISUw3WnsJR0+6i7bCTgkVWYTcyYqR+ynHjUjHnNBgxToQON2
         +gtLvBvQLm/5dLF8v4oJ+fAVv88fQCZfTLjbwfqTxRlp99NbxG2M44nJre/KvFj8qNZ6
         RLNBT4FDTLOxQkMaPu9DAL71k2Y/KNl5cgsbHlTgkRlaMC/EeClHHUGxFbPDmf5AdBlE
         YQT/isS1tha1piZdr06a6wJ36AvbJb6pLNRUCefuSMW5j2D9hKFLYg4MbZc2vubX//q9
         gnwg==
X-Forwarded-Encrypted: i=1; AJvYcCWT333K7rOZjaqfbopu99/CL1lU/9aiy8ImwCeml4C0hHxSrAR2gLnZ75FxI8+RdqYi3rWft0/59uoIOg==@vger.kernel.org, AJvYcCX7m3XwxAOlHOZsLwFgWn9m8Rz0GECG+PkYtNPNV8v89Ib61I50LKYWxweYJ1Y18o+asoDK+ijhOhMQnezgurXm+r4=@vger.kernel.org, AJvYcCXRGvbz/SdjViyavDsjAFejRl1jiQgz5shz8D82FvSe0TsgawgrFTMo6HeVo6z+/sWIAglzinBR7wZi@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiWZQ9PzymHap79VBikpG4VRj7cxckbpWHdiwemnCrLKeYMCe
	Gu3SVuIjt8qCMde++lWoIwV1OzjsTGpZZr4GHDGWlZ9pR0+kDMFVC/k71IEY
X-Gm-Gg: ASbGncuIqihY2Cmlw8tze+lUuubLnjulVN2Cauu3b3fGg9MQgwQmC3b1jsVfV8TYcRc
	4eBMMIYhl5xqyTzyUgF+2VD9xntC9OIqUosvthXze1fRZ6207OEZHMtzdySmfvM6DWbsAoR3B95
	yqM7PA9EBdEMXcZwV4H/JfeQ6v2MBrwKaPyZ197Q94wcFXXXZsoX9qJpeGop77AUHAXiT0OEsxI
	VrxC+u7Dz85jU1a4TymazkZ4UehMkCYfyOw0sZ99PZNmN36EWFwdBhoZgREQTyRbQJYsZ2LERiT
	HOxyVNAhAX+D/mLgXfdxwZrzcNvb6XgfJvx9ZHeIrQKnOIuw5AwmAXu9tk1/mhG8mza8TZbKdvl
	hMR+7dUiDQEMorQ==
X-Google-Smtp-Source: AGHT+IFMe26aLVTNktEBUTpQ9150F7qv/ZkZcYYEfF0do5NNkPXSizjfd9HA+hM7PO4Vf5tc9X6vfw==
X-Received: by 2002:a05:6102:2b99:b0:4cb:5e02:754a with SMTP id ada2fe7eead31-4deed367340mr10432804137.11.1747034031905;
        Mon, 12 May 2025 00:13:51 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f613b570sm4690679241.7.2025.05.12.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 00:13:51 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4c9cea30173so1546487137.3;
        Mon, 12 May 2025 00:13:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlp7/CVaq1AJCrGGn3oxC/apmBFKKEclykcPDCA9KftLg2b5935RellWy6a+UUWxCTMmdzHt85RWBW@vger.kernel.org, AJvYcCWIT99DbMUetk/xYnODv28+KuhStuA9cFKZ+3rnAlARwI/c9evM3TFFydXCEh+zLKWiB7ypbxZmfpIZ6w==@vger.kernel.org, AJvYcCXjBnvDUnGwUsbO5nybOlr5SFxBdDflBYFuyWsVtDDaxoZQfbW+uF40IbdgSI8ErVUvmXZr6cG0sHLt11Am6LT2u6g=@vger.kernel.org
X-Received: by 2002:a05:6102:15a0:b0:4c1:a66f:a468 with SMTP id
 ada2fe7eead31-4deed3ec0c3mr9681496137.22.1747034031568; Mon, 12 May 2025
 00:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro> <20250508134930.GM3865826@google.com> <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
In-Reply-To: <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 09:13:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
X-Gm-Features: AX0GCFsUkDUlBrPJqlQydDJkEnvu_GkmiELRETEKx3ApDmYs_k_btrWooRQ2Qa4
Message-ID: <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	linux-leds <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacek,

Thanks for your answer!

On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> On 5/8/25 15:49, Lee Jones wrote:
> > On Thu, 08 May 2025, Wolfram Sang wrote:
> >> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> >>> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> >>> <wsa+renesas@sang-engineering.com> wrote:
> >>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> ---
> >>>>
> >>>> Changes since v2:
> >>>> * using function, color, function-enumerator properties now
> >>>>
> >>>> Honestly, this is better than using node names? With V2, the LEDs were
> >>>> named as in the schematics, now they are called:
> >>>>
> >>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> >>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> >>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> >>>> ...
> >>>>
> >>>> Which gets even more confusing if we might later add LEDs not on this
> >>>> board, but on the expansion board. 'green:programming-8' sits where?
> >>>>
> >>>> I really wonder, but if this is the official way now...
> >>>
> >>> Good point!  So I'm inclined to take v2...
> >>>
> >>> Let's raise this with the LED people. I don't want to fight Pavel when
> >>> v2 hits the CiP tree ;-)
> >>
> >> So, if there is no other opinion here, can we remove function, color,
> >> function-enumerator and just use the node names which match the
> >> schematics? Basically apply V2?
> >
> > I didn't author the semantics nor the rules surrounding them, but I am
> > obliged to enforce them.  Therefore "LED people" say, please stick to
> > convention as stated in the present documentation:
> >
> > https://docs.kernel.org/leds/leds-class.html#led-device-naming
> >
> > Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
> > that is more appropriate to your use-case.
> >
> > Let's also bring Jacek into the conversion, since I know that he did a
> > bunch of work around this topic.
>
> The question is if the LED name from the schematics tells anything to
> the user of the equipment?

As this is a development board and not a finished product, I would
answer yes.

> The idea behind LED naming is to facilitate matching the LED class
> device name as reported by the system with the LED location on the
> equipment.
>
> The LED naming standardization intended to enforce consistent
> LED naming, and not allowing to add multiple interchangeable
> names like wifi/wlan. It also helps to keep LED name sections order in
> accordance with Linux documentation, which before had been often
> abused by allowing to assign anything to the now deprecated 'label'
> DT property.

I agree this all makes perfect sense for a final product, where the
purpose of each LED is clear, and sometimes indicated by an icon
on the case.
For a development board, some LEDs may have a fixed purpose.
But typically there is also a collection of generic user LEDs, which
do not have a fixed purpose, and are identified by a label on the
schematics.  Imposing an arbitrary numbering scheme on the latter is
confusing for the user (developer).

> Regarding expansion boards - we never have control over what
> LED names DT overlays will define, thus LED core adds numeric suffix to
> the LED class device name in case of the name clash.

FTR, the RZN1D400 Expansion Board does not use a DT overlay.
Linux carries a DTS for it, which just includes the base board .dts,
and treats it as a single system.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

