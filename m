Return-Path: <linux-renesas-soc+bounces-15837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614CA8593F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 12:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52903A1A91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EF722126B;
	Fri, 11 Apr 2025 10:08:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79662221260;
	Fri, 11 Apr 2025 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366081; cv=none; b=mPu25iirbwpePjnp2GzZGbDYHmOpRNhDJjUK4sHuhOxFnidG73dDLGtmxYxzIz8fYPnzDQZh/MuEkzEWIr0hDhcbC7X6d/YhmhSuDUXl3xc7IbeURZVlnEjy6ZdhizVfBAtmaXH35bWG/rI09xwt2lcYxXcj6fzBJrk/Ni9U72Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366081; c=relaxed/simple;
	bh=JQiOxEydpjkY3R4wf1viG+I3A66jmqhQqGDZShveHGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=HeX6Cn1UnkjPJqgq1cK0l4SGm4HyV+JJQhFpGmHJ5+uSF8ilS6FxsP5XRkJV0BT1c+TBtlY9O1HnYGZdTnnF0eNy4ftAUkMf2mzF6MfMyamUMr907H6/qEFBV4oFwFxYq+1FUR0eoK+G8rfNp07X6wMLXKh8GgaAvsPeC2a8suo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d69774081so759611241.0;
        Fri, 11 Apr 2025 03:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366076; x=1744970876;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aYMXTFEV2NalT55jsvEKisxIi9LMjUtCvvPVRHdMAY=;
        b=Su2/6nJXYy6HNsrAC+nRrqVQP/HhmjgQTzO34K1d6RAjw0lRHhQdlJz2r5Q+BzDqfx
         BE47i5osKOBSwUkIkdg+tBODCguufIKcuzWQymOYooBby93k9ziEbA1zEkon0wPRxSVb
         0phm+QcdLTT1iPMbVZ0kA2IDLE3OR/XB1q2VZWmZ1f5vEl/CzgijvCUg8ykniq7kF98e
         g06sV62DQsTuXR76F8fubrSqG9zdoELSUeylHAkolUoPl5UrsWjVfu0s3bco6Hkc8vtm
         boBjbQJHeerovJSPvQ8zwqIkwZ+JP8e6wWZGnzi2+NAxe3c5DecPvva1PgOb9Ry2Xupm
         CMNA==
X-Forwarded-Encrypted: i=1; AJvYcCU0vF7oYEmBIQrNiMkjUtIqoO1NAx+NWRCWSfRl1jkpY1xMzvnq2AXADOQulULpK8habH7R2aCwNzQ37Ki4Mpix4/Q=@vger.kernel.org, AJvYcCVQ0I9Uao6LKbLqSniJMMhk8LG1yPjIela2yW47FH9BJEOiJ1NEPJUjIvdSWNd7iXLA9xOQkcCJCv3Re2SR@vger.kernel.org, AJvYcCXGmqs3LcIPjM5PhMaiCzBvrz8pzGPsVlj2x2uz5mde9qrwqcONzbcg2iFk4YjTcE9cwhXKfKlKNiIv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DtzEQ0GhYmmXmynAY65BLzUa9KvzYYef57fBSXYprfPfqtAk
	E2/eTGMwV9lfw+pFtuCkde0jzCCY2/FfWN9YKU5bNnKX2KfLh1sm67kkzdzlYxE=
X-Gm-Gg: ASbGncuB/zxPy8Qu/aJLN/o2r9hKXxJCEZlxHaRJeMUC7wLFJVjRQa1vUAOGaEVT7cY
	5eATlFLoIx6Un95s3BMeKYrYlzK35Ker1jQXRqANdLcmbyEatNC3coHjJY7GJbKolg+rFr8WuKl
	QPBEec3KuIGsMAjacrrdcHu2WrkxlC6Sw0lvHp2T3O2xhM+p1GlrpRXw8sr8qCIQbKVrEAvMRmI
	bn0V3JacjC6QPKjzHi5O2EyhJUDQ0czaSK4e3o7G/sIBhKy3Dk3CAyu/fpZ8v/yZ8BEk0UzhJT/
	dH7xj1vQHsc7I7uOjix165HjheKMloG6xfgxUhXFU17Vi/ck9dCJezvg1Qghi//noZ/WsG4OXWl
	1ndo=
X-Google-Smtp-Source: AGHT+IEx9WqGNK1cP0Df4iBSbm9zeaLSNPa3OMsvpo0qjnyS2q781iB10q5n1v4vV8RdLD+QVdC/QA==
X-Received: by 2002:a05:6102:3f09:b0:4c4:e414:b4eb with SMTP id ada2fe7eead31-4c9e4f137c2mr973378137.12.1744366076294;
        Fri, 11 Apr 2025 03:07:56 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98afd1asm1013662137.21.2025.04.11.03.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:07:55 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso716925241.2;
        Fri, 11 Apr 2025 03:07:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUas0zOHx80b0ihqGxRCEb3AnmYytSG1pje23Fr5Y3gWrk0CcUFslSjAQOSDEnOEs1VpeZcea/aptno@vger.kernel.org, AJvYcCWfPPAxqCf69Hc/0HN49a9QbbKTaIv/7kiyHA85evXNUuebi5ym1bhuVBiQWqzj+g2YKtvJZG2wbr3Fb5OV@vger.kernel.org, AJvYcCXhZs66MzY5tgVIx1KDi3LcRFmUPI6fELO9BsIwx9iT8boq/Kk1QdA84cUNjm02ubnITAbPC3NRV2kqW/r2jgNslbU=@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:4bb:e36f:6a25 with SMTP id
 ada2fe7eead31-4c9e4f19dc0mr988215137.13.1744366075115; Fri, 11 Apr 2025
 03:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
 <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com> <Z_jmflS03VHFOE3d@shikoro>
In-Reply-To: <Z_jmflS03VHFOE3d@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 12:07:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH6Fcm5xzS5UWpqBm4gFZ4bJBL_paDmpqCYvCO=uyWYg@mail.gmail.com>
X-Gm-Features: ATxdqUF0bh9AK1tx6h_9egQNGo2RuMFqivgLKPOhWUILou5PveUK6j4x2NBWXIg
Message-ID: <CAMuHMdXH6Fcm5xzS5UWpqBm4gFZ4bJBL_paDmpqCYvCO=uyWYg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 11 Apr 2025 at 11:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
> > > +                   <&pins_mdio1>;
> > > +
> > > +       mdio {
> > > +               /* CN15 and CN16 switches must be configured in MDIO2 mode */
> > > +               switch0phy1: ethernet-phy@1 {
> > > +                       reg = <1>;
> > > +                       leds {
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <0>;
> > > +
> > > +                               led@0 {
> > > +                                       reg = <0>;
> >
> > color = <LED_COLOR_ID_GREEN>;
> >
> > > +                               };
> > > +                               led@1 {
> > > +                                       reg = <1>;
> >
> > color = <LED_COLOR_ID_ORANGE>;
> >
> > > +                               };
> >
> > The above should also have one of:
> >
> >     function = LED_FUNCTION_LAN;
> >     function = LED_FUNCTION_SPEED_LAN;
> >
> > I don't know the LED function mapping.
>
> I have an incremental fix for the LEDs to this patch. Thomas cannot
> really do it because he doesn't have the board. I was waiting with my
> patch until this patch is upstream, but I better send it out now, so you
> can squash it into this one?

Yes please.This patch is becoming too much of a dependency.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

