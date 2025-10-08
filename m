Return-Path: <linux-renesas-soc+bounces-22787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A4BC43D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0AE19E14B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A185822D7B0;
	Wed,  8 Oct 2025 10:04:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EC2571DA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917867; cv=none; b=mtRbyCmHc+W7nSOlc7d4P4Gb+xapfa5Fagu7PT1OxKIsFM6z34MySblBgmKlxryrhNzwmmyE2+ooYnwmgQMgEGcSjH60HK8FdvSE9/XjSezkHr+jSmIiKSJEdAa+lu/NkeBbRvKiq7FjW2ZUwjLbWwiAr0Hshw6jOa7Wyb4lEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917867; c=relaxed/simple;
	bh=Pys5RX0y7I/eZwC5olc+dAVDGLe+5tU+vJUD3pxdTi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWxq6u7sUJvat/4nqrg1jWOhDMvEQxcymhoNUUNAWn1wFw/67mMTOpHnY0C5GC5+h2tzOgdJFh+WI9mBKw5E2bkN40YScCBO5MCXfTuX3tVDYs7IeYyhfInHag0cpd7rqWvYMhIOKJO4d3VzeyhchJS0luIPsA0gH1aIAiGwZag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so6035802137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917865; x=1760522665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieF93s43yzJZCogiWT8EWDvW3aNVlQXB3xmuuiyuM8k=;
        b=eU1BfwhayAlKNNKdFnZPH29eHfnMTMH288yiZdXFgH7UXkI8LYFbQdoe7XS4poZjVl
         ZatOlIPgV8sStnNOiEmwo4bWkUnmzEarY8lLDlx0wUjHfvT84Zg2sntzSaHBOh3Rf2wN
         G/1GTmD2IaxAkHCerMupYtTo3y2yXa2u7N2oUs0o36T7TDX0Wm7uLC5dYw3GnsZ7y9f1
         jFwqGTQifT5KQ2nye10a/z5OlYk1RHCJIh6tUkehXSvqc5YmcnDjSZE77EyFW84xgwEM
         l9t6GSepW+j+O721pkey1fHR3d65d1DWKz3kvkBrdq/wLvjMKJ7UV/NzlTPCQkNmAcze
         91ww==
X-Gm-Message-State: AOJu0YyuyVWrKfsq7QhaPAkOAhOnP4pue3UYmf8PZCEabMHqqFiphEsu
	3Xr4e2ZOGrnIBsc9O1WymInZWTrBl2wWaUYKmkBlWEttmTA6K+rmJF32qzqNxjUa
X-Gm-Gg: ASbGncsSRFZSiaHgzNcMGFht5q3eBzRuvcAyQ9qxtWb8O4KtyiVJXhT0VVwvXf3K6z+
	Zqw5ItnVnSSrnNyNwVwU42dYejExnRD3zdqvdtkauel+HobBT3/8aksFQdrgGDfF4+nIq3y1zie
	2ufkcdz0fjUvY8fLv5VL7cwuFd6AcAi6JTbEGcvfdtq7dOmLKdj//wch07ysJ6NlA/RGffXNv9a
	IGAYhHSy1Y1yY0DDB+o2rvjwmbuoR7v+xZhETyt5+qVX62IXtVSSA324bpcFwGYnuAvtPF84OV6
	uKEysNM1a47WrUHohz/2AHwUi6tsSL/8y2erXl12lcOWkcd1dqvrlqC05pNt1e9EUeqR5tcRmJH
	5V3XPCheoDVgo4c3rxqPvC/WrCI8f5HaGNLGfn2bNhVlaSNMaaa3qtt0YFTfrwDw6IA1xlN0PbK
	4EJjoLaUb9
X-Google-Smtp-Source: AGHT+IFg9ZDyN12Ip7FFKmJyOH8lbdJkyss2RBemJ1530L6zVUUTA46JO3aH/CWcrOVYUnQKW9Kugw==
X-Received: by 2002:a05:6102:5e84:b0:5d4:1e69:fdbe with SMTP id ada2fe7eead31-5d5e21d6a6emr1046648137.3.1759917864713;
        Wed, 08 Oct 2025 03:04:24 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4ede9e8sm3857229241.15.2025.10.08.03.04.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:04:24 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so4454394241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:04:23 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-5d5e2322d22mr1062500137.22.1759917863777; Wed, 08 Oct 2025
 03:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:04:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXokiKb6-mii8yKO5XY=WSDtoMsRmzYos+My-6fKZMM3Q@mail.gmail.com>
X-Gm-Features: AS18NWBoSyztjseC5S_f1PtB13ycGpgmlyzACUqpDmkv3PExchVdnWXjGtN11vE
Message-ID: <CAMuHMdXokiKb6-mii8yKO5XY=WSDtoMsRmzYos+My-6fKZMM3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: watchdog: factor out RZ/A watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/A
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

