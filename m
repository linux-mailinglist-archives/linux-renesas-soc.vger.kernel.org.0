Return-Path: <linux-renesas-soc+bounces-23460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3569ABFFAB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16396189ACB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 07:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD42C35B144;
	Thu, 23 Oct 2025 07:41:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A78BE5E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205306; cv=none; b=j8UQ0SecB93P2wu7U2IiwxJLn0Vp/t3t5+1mSiJxNyEXUTJK0Jxp9cbBur8CovweSH+eQFIooA2zuNPjEXdKarm3RNb7Om+Pk20XzhRwWwIll8RoDC+7t8pxWw4tfFwZzZg9UQhqp93w3i1qcIryCfh8D1Gp8oh9lnb9B53p5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205306; c=relaxed/simple;
	bh=JkgQHfArzg4D8ryOqFICWYyKto3V7a/LxnPvyrSPM20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yp92wVCtWZ6dO++P5JJKJgVksBeZiECJOsHaHUl0YYU5LwDzDJVE9ZvoQ9C/Sz4f3T1Xafsrx5oAr2so3BwzsuF4yihL3tg6L1Y3zkiHJrtbBywMWwn3/fXmS/ZLLOcQ6VDTyyp3i+PoWLbWPPccW3h9ti9aAVNpfRwRMsOwxJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932cb562289so153689241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205303; x=1761810103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St1Alf0zzo1z5RK7r5s4Db4Ti3BD0fEUTN5i4CJPn00=;
        b=krOYwrAk9vkfUBfSvar00QjqxuDI7LDQqjMxfhdLkk88WUlUGqU5V/VxLMbSmRWg/l
         Du1psetFmjCIhdrUfje50NGUPe6w/HrKb4tPxKrpwv08TVT09K+QXNWr17y3H0MCEmHZ
         TCG1jLkQW20bE/9EKvLZRfXlIyWJyLJiAUi72bj2JkdP/4HVkteb2QDhTrkwgSlaJeWX
         YIa13bS6tas6tVSkDquUiTE/tfEOyF/riVjr2sL0zyj7kN0BKfHTSUnEdzZOI0LfpzQu
         wn6unMS4sNmEw/cNr7ScZr2LuDrRVMNuy13PUMquaJa80/7pfNaDqfCHrASQlkCHXeN5
         kDwA==
X-Gm-Message-State: AOJu0Yx7MYIVGytSW75EsH89ydmqEAW8nhBH25lf6gDCORzpw+Qjbz2Z
	SYpXuK3NFjPM5+gN/2lXH4Yg7xrqv6gJ3HRg5bZwjTJ7Ly2YythJseP++aC2bqNJ
X-Gm-Gg: ASbGncsZ4j6lpUJoZjl3xWMsWcYf6CwZuIF5IcldADkC2he3/ALWNG/VzD3oLPqYXaI
	pid/LmvEVzEsGZ0uIsOPYE0qXWSc8w+4CRZ7AKPAn3TIYAwgAjD8iyB03m3gv3G2CSkvn65Qts9
	XOE5YTcdjm/OIdYksTtUcDW/gH13l4Susu/L0RcJjTyw8AogCMHK+daHmFeLbm+ujgSEU3MkHrw
	6Swodyu7oMX2U7yoTKi0sjMq4xgyhryqjeFUhPO0Gw8lnLJk8UXlY00YdCnbWP/C+qYgM+n272F
	SszGeDPpCuJtyqZAB/WBGgOU3ixagdbCZ9Ii81VOtSZafHHZ946IFZQn5V1GUE9/KirFFg+3YCu
	Ddo3saw0mgL2HTlaQfppcb17QBHDvqZ6M872ufST+ytE2NRdRrxBUPszBf2n4VyXv6KAguA3L0d
	AjJ8PmdV4uedR6Gw8/EYm/jHYZM6Y4qhc63Psj+fy9HDOzqOPk
X-Google-Smtp-Source: AGHT+IHozAuSf686EEUb7Mp9fpAxKy+yACk0uE8nqQSTtkw39dZo9O2BVdYpfcvMCf2xZMiyYZ43Kw==
X-Received: by 2002:a05:6102:5488:b0:5d3:feea:65d9 with SMTP id ada2fe7eead31-5d7dd6adb78mr7217609137.27.1761205303523;
        Thu, 23 Oct 2025 00:41:43 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c9d3asm597422137.6.2025.10.23.00.41.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:41:43 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso245664137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 00:41:43 -0700 (PDT)
X-Received: by 2002:a05:6102:32d3:b0:5d6:fcd:dc86 with SMTP id
 ada2fe7eead31-5d7dd568745mr6531880137.4.1761205303104; Thu, 23 Oct 2025
 00:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251011212358.3347-2-wsa+renesas@sang-engineering.com> <aPnUQtJECB9k5D41@shikoro>
In-Reply-To: <aPnUQtJECB9k5D41@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 09:41:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjvZKvwpH3E4noxKgZTW_to9t1dcTSb938EcQFU=JwMw@mail.gmail.com>
X-Gm-Features: AWmQ_bnR7Y31k8D-p6uCM8fhSDnIP6L3FunePkJdPsiRsgNvIqNJpRRw0XvcvOY
Message-ID: <CAMuHMdUjvZKvwpH3E4noxKgZTW_to9t1dcTSb938EcQFU=JwMw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: kzm9g: name interrupts for accelerometer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 23 Oct 2025 at 09:07, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I'd think we can apply this before my binding update patch goes in.
>
> Binding update is in -next now.

Thanks for notifying me, I had missed that, as adxl345 is not one of
the patterns I keep an eye on.
Will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

