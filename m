Return-Path: <linux-renesas-soc+bounces-10802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FD9E1549
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C02E28556A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9013B1DB922;
	Tue,  3 Dec 2024 08:05:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED701DB37B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213139; cv=none; b=btmekXUClcFr2hoxC1LVnddOmNHosNatvM6dD9w7YX3JR4SMNzMIDNEvAx0plhbVG1myjZwkh/wMt9nbULbqkRdkRVkHNbKOk/QD+/jhVA71j88MRK/TmuyWc0Up4GUezOrclQboa3Qh6JbIIxA4mQkJsXlWoEyn3ssjGFhO6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213139; c=relaxed/simple;
	bh=Q7urY8lA7TMhqxkSe7Sh8w9aPfriZgBnj4d5edj28PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFbTxZ+XUbcmwL0dwKP/7pbdpmpLE5oCx9ndFAZl4PvIrVTbtt7hc9gLGlxHVEzH53zpXF7R80+x4MpWB70RkeevzxolmQaRukJVYuz1nAJv6Fc2PrZR6vKE7upQnFxMHv7sXnykbV3hU7YGyhk7ZumjHJ/O3yKUxNF+2iF6Yo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85b0a934a17so2674320241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 00:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733213135; x=1733817935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBn79w4x83Sxn7N1tfhbMVj69kOIEGZ3+lkyFTQeQu4=;
        b=AdJAvYNNM7gwflh0AxyatyFxKgtSJ86gM81Gp5CchWGb+XEjxzPsmASWV5Llaz825D
         ahavbLvWamGbo4H9hJPCj/1Ozllu9bkgMdY/qaREcxd6oGwqt3QzzMq2SiOgAdXTW5Ll
         buzLVnN2kYQiO5YIOpMMhkU4IkCMy7Rz0FzZLkdfMY137Z+8qv0U803ABCD0Ji8J/1nt
         mbujGJROQOtlFBdrSBAb2FJjMpEefCAbuH7GlQUwNw9LcFbNxedGsWbUUpwrBnkNZFZC
         sFupuencEKyA6xt3KPP3NznN2zPhu9Tb7J+SpxubK2amUshbmPWvoy0ccxWoA1m+Uq1v
         HYUA==
X-Forwarded-Encrypted: i=1; AJvYcCX77YVD2Vlo7frZ73+PuodINyficxbAJB3ihsSs9Wx64JWBon7gTy2fBjGg5NWH2QPhVYJBTI+j9u/rXF6xXpww7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YykY3qdiireOivlKwIaTFDD+6T8E34nBnVwf0URIpieoUodkg3d
	StI1sKmSEY4wn91Kmtz5br26xjbqNn6Xr/r5w9x5EKnc1TDMBC0UhREGASAj
X-Gm-Gg: ASbGncvf+n9hEMdfUMM5TvxSqV3NQYkmbFgWAZwbWufwGgWPVgyqd2K2j75IWxwphou
	zXZzM+vtA/VbMyThlZcykXwhdol4keLbgLSsWPY3ERZ5uBv8E4j4n0bI0veHHHWtlwTBbwxCHV0
	F4p+TcKyvNKvVjETZHy90Y2Y4bOblanYwc4h3Utqqp1+074mSVWrcPprn2xVk59WRaaiolppVn0
	rBoaGXz90wFAYlSAM3T869KZxK1mHE+w1JmzIvlzbeaB78jXb9fc6tUDoLfeV1IltEtHWOmB4Og
	lwjsqYvwq+Xe
X-Google-Smtp-Source: AGHT+IFhwWL2RXlZ2pPllDJ4f/cZ0wSzER2ZmtpdAQ4Ul2d8rRIpa/6222vbwjPSA9ZYhf6lP+pbtg==
X-Received: by 2002:a67:fa4e:0:b0:4af:9d7d:8bbf with SMTP id ada2fe7eead31-4af9d7d8d11mr78082137.12.1733213135564;
        Tue, 03 Dec 2024 00:05:35 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af592352b8sm2047648137.27.2024.12.03.00.05.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:05:35 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4af6031095bso1711050137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 00:05:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXm/Vef5HClW3jGBMGZr413bMEQt+r/gVMsxUZ/EKP/Hjiy3QdppVJrW0He4MVp0Gg1jyquqmSf2eZynYqn2XUFlg==@vger.kernel.org
X-Received: by 2002:a05:6102:3748:b0:4af:14e6:a45f with SMTP id
 ada2fe7eead31-4af556c3502mr25638940137.9.1733213134933; Tue, 03 Dec 2024
 00:05:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be> <CAMuHMdXok5W7d5XBOCrUY3gqd5_xKXrOmqOC33re0-OiZjOH6w@mail.gmail.com>
 <4ae5fa1a-27b9-451c-978e-6e92aff5bebc@ideasonboard.com>
In-Reply-To: <4ae5fa1a-27b9-451c-978e-6e92aff5bebc@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 09:05:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaoTkpn4r0hvNauYm_CRU=V+z1e7K_SNd4sDzCn=Akdg@mail.gmail.com>
Message-ID: <CAMuHMdUaoTkpn4r0hvNauYm_CRU=V+z1e7K_SNd4sDzCn=Akdg@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, Dec 3, 2024 at 8:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 02/12/2024 17:49, Geert Uytterhoeven wrote:
> > On Fri, Oct 18, 2024 at 11:32=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >> As I had to test Tomi's WIP patches to add mini-DP output support to
> >> Gray Hawk Single, I moved my (old and new) DisplayPort gear to my boar=
d
> >> farm, and thought this was a good opportunity to test mini-DP output o=
n
> >> White Hawk as a baseline (CN5), and add support for the second mini-DP
> >> output on the White Hawk BreakOut board (CN15).
> >>
> >> For testing, I used the following hardware:
> >>    (A) BenQ BL2420PT desktop display (2560x1440),
> >>    (B) Joy-It Joy-View 15 portable display (1920x1080),
> >>    (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
> >>    (D) Passive mini-DP to HDMI cable,
> >>    (E) LogiLink Mini DisplayPort to VGA Converter.
> >>
> >> (A)-(C) are known to work with my Intel desktop.
> >> (D)-(E) are known to work with an old Dell XPS13.
> >>
> >> Software-wise, I used the frame buffer text console, "modetest -M
> >> rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
> >> 86:2560x1440@XR24", and fbtest.
> >>
> >> White Hawk CN5
> >> --------------
> >>
> >>    1. Mini-DP to (A) DP:
> >>         - 2560x1440 works but flickers (flickering shifts image
> >>           horizontally; perhaps a cable issue, as 2 below does work?)
> >>         - 1920x1080 is stable
> >
> > While I don't have a second Mini-DP-to-DP-M cable, I tried a few
> > other combos (now on Gray Hawk Single):
> >    7. (D) + HDMI-F-F adapter + passive HDMI-F-to-DP-cable to (A) DP,
>
> D is passive DP->HDMI, it won't work. Are you saying it works, and the
> result matches the test case 1.?

It doesn't. I had hoped combining the two passive adapters would
provide a valid galvanical DP conduit...

>
> >    8. Mini-DP-to-DP-F cable (=3DX) + plain DP cable (=3DY) to (A) DP,
> > unfortunately with the same results.  Note that (X) is the same cable
>
> "same results" means same as in 1.?

Oops, IIRC both 7 and 8 didn't work at all (monitor not detected).

> > as used in scenario 2 below, and (Y) works fine with my Intel desktop.
> >
> > However, the maximum cable length for eDP seems to be 30 cm, so that
>
> Where did you read that? I don't think there's such a thing as "eDP

https://www.lv-tron.com/edp-made-simple-quick-start-guide-with-experts-tips=
/

> cable". In laptops etc. eDP is connected to the panel via custom made
> cables, and the cable design affects how long it can be. eDP and DP are

i.e. an eDP cable ;-)

> identical wrt. signaling, so using a DP cable with eDP or DP should
> behave the same.
>
> That said, I don't think the eDP->DP connector designs we see in these
> development boards are really made to match what one would expect from a
> consumer device with a DP output.

Indeed. And using a (too) long cable probably breaks this.

> > may explain why 2 below is the only wiring that works at 2560x1440
> > (despite cable (X) being 1m, i.e. still too long)?
> >
> >>    2. Mini-DP to (C) to (A) HDMI:
> >>         - 2560x1440 OK
> >>         - 1920x1080 OK
>
> My guess is that this works, because there's an active component there
> which decodes the DP input and re-encodes it to HDMI output, probably
> with different timings (read, more standard). So the (C) is more
> tolerant on not-so-standard DP input than (A) is.

Yes, it has an active component, and a shorter cable.

> The eDP chip is limited in its capabilities, e.g. back porch registers
> are 8-bit, so they max out at 255. While those are checked in the
> driver, I wouldn't be surprised if some other limitations are not (the
> driver has clearly been written for eDP panels).
>
> You could try different custom timings with kmstest, to find if there's
> something obvious that makes the case 1. work. For example, if the issue
> is indeed the cable, probably lowering the pixel clock would fix it. So
> using the same timings but dropping the pclk in half might get a stable
> picture (then again, lowering pclk might fix many other kinds of issues
> too...).

The modes reported by modetest differ slightly between (1) and (2).
(1) contains one additional 1920x1080 mode, but all other modes are
the same.

> Can you send your monitor's edid blob? I don't have a board up here, but
> it should be available from somewhere in sysfs. On my desktop it's:
>
> /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-DP-2/edid

And in the modetest output. I'll send these by PM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

