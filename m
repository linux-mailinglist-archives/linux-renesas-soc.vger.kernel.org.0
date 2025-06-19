Return-Path: <linux-renesas-soc+bounces-18548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF9FAE0A36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EDC73AED90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4078230D2B;
	Thu, 19 Jun 2025 15:17:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49056189905;
	Thu, 19 Jun 2025 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346221; cv=none; b=XR+TV+j/cK3RtvKA6WxGig1QTucByQdnks2Jv73MoJIwPTfkTT1MfJDO0k9Xk2e6IvvMZEghHT9DTiQUfS7XWZ7lceNSk1v8YzzewSjUgfYSr0wDLI9llgndIi2JAdSYUVMWM4A6vCTues9NNCS3I0HRzWvCalcoCFlcjBC4FUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346221; c=relaxed/simple;
	bh=FynZUrOWo1OBRsrSlMyUpJKAiRROjGE99tAwiKFyEr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHw8/j4N0amq1krGboZWbdMVoHuFHYei7FvRmea17Afa91n246Atji94grn9KwTtbXQ/BjSJNwBhXtfFjNEw2GcBXSHA/UgxSqbXyP4ZKaa4qkh6TS4KJwgHODvnx/j4BnUMixzKRHinoedyDLIUeN+6receO05lKgPhXFEW4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so12603466d6.3;
        Thu, 19 Jun 2025 08:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346219; x=1750951019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb4d+jU9LktUZoo7Q80d2jjPMRXxQ5XDUnbXoqjilQk=;
        b=pXwVffm2uaPpiKcmAY6AE8uPnq83s1I9dML3Ev3Qo+WwzZ5IyYqLS2QtouNUmxAjqw
         chrRWgsm8ORvFuBT8vdm2yyTHo/zdr9tnbYhnpvGpLjzxdDKMv9ABrikM0p0hdVrCEK6
         Iw79u4d5IzRYMXTpcXUS/tkj22eJWHX5NDudG6jgaCfYPu9IfysWFfePc0TRmrlDEAk3
         8IzPX3Y28dphAFXq2VYQC3bv8Nh5wm5YdqfH5l4urBf2sTxWrtnVrk6KiegT1C03b2qR
         pd298Nl0At5RejmJ61a59+gBLbrRqTko7rmEE2sp3/nVdv6FRCfDk9SfL7e4O4YTRzrK
         djfg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8jK6X1r3DIv9NnH/hkGb8jztbx1YMf6xiiwnU1jWU1nWnx68Q4/jl46OiLYQiOyeKqCrGo9IaH6r@vger.kernel.org, AJvYcCUuAiDOKLUJ/ZOayqU/bcR8m0N2fO5nEThtmkINsPj7+hmvy/1D9NDI89a6YSxZCdBFntsG4vY5Gq0U4At1iMTiVKs=@vger.kernel.org, AJvYcCXYSHAq2yGBBAsF/YNBvNyEGgj+1tLYLA1pIXgkKBHQZR68yYCEZIoVC4AKnneuUkqNgc2R/n7Gtdb4LC1a@vger.kernel.org, AJvYcCXrpY0rZofOU1P6RclmBmULtPPdzV3bHZ6U7HKZgF+Go+0v/lhUNzOtBw0S2ip4xOv24B8RxKq+PsN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvjac3W9kX68BFSch7bqGTqUIy/81ZfHz+MNY2OkR3rGJAdDU5
	vduON+LuwUEBJ3vaKbTOjqPZ8uOQflAW60Q7g1EGpJGmvn6DwOI5hUyNHIpxOVDz
X-Gm-Gg: ASbGnct364KgMk4ZqAKXyQBl/Wx1B77QZ+HWFDSc5OBErKTtC09z232EdKQFSR5NUbN
	9lREfyeT2aERI0U8LNMBRY3A22AES3RytNXx5Wr1Mqkl3A4fj9vFXUp4UiCcC60TYmBLNn79YOI
	UPZQN3s9VRYd/8zPqO0iTN9u7pkAPUTjF6R62OVSrlIGBR41DsKgP+DHsXkfmyCUs/thXPiEiOr
	ApN4ll9AINugKKCkAMLSy+PYm4apesp8FbPwHyAXb24pXbZ6bZh2WMZRWTIEZ5H4m9HXWrmi6px
	Tny9mEJPYSoM600nLkqNc2c4yHdRWDo2sfHyaKFz9vbBV5jzy6PnmidLm2A/WH4UkaWnOyflGSp
	BEcwB9PtBxMmtxdAefVdiTJi8kFxy
X-Google-Smtp-Source: AGHT+IHucctIUHC/fZIjQ10En3uvdaTo2TdApWVwyzB5BpL1TjfoNuBzKXmtQhsje19cgO4j4eCsHw==
X-Received: by 2002:a05:6214:19ec:b0:6fb:f03:6b24 with SMTP id 6a1803df08f44-6fb478019b0mr362498736d6.40.1750346218822;
        Thu, 19 Jun 2025 08:16:58 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0957756esm746216d6.83.2025.06.19.08.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:16:58 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d20f79a00dso139295285a.0;
        Thu, 19 Jun 2025 08:16:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqkUt2qc4hHT1HTZzyCGDRd+MBubRkZHVWs4eHRU2kG3X8WTbXIgS9NnKM0qe4Bh3wvw6OWSUrChWh@vger.kernel.org, AJvYcCW1pZQH/xaTbrOVJTYvFwFSynFQSBIpSE7iVmYyug+p754ExubfQXjDdXVLuc7AWT7INZkEg3ehim3CCEOo@vger.kernel.org, AJvYcCXdLcvJ9pSs8X/MUNRtw5Z74f+tRwUZ63zuXSTuCO9URrWXLqE179hwmBmaXqm4Fb1flleVquwLxzryWkseq9OTbcg=@vger.kernel.org, AJvYcCXx70ji7JwoTlgmdGSNwOIlOxuZ3l0kZI20yXYOHgQi1OoLlHFU4To58mkWEBaCByGuQzuqDZ1eq3J7@vger.kernel.org
X-Received: by 2002:a05:620a:8392:b0:7d3:ed4d:a423 with SMTP id
 af79cd13be357-7d3ed4da47bmr881977185a.7.1750346218363; Thu, 19 Jun 2025
 08:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617155757.149597-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWNGPTNMw=JJtoy02kEEpzpRTwsjfdnFe1ffevNmJb5dw@mail.gmail.com>
In-Reply-To: <CAMuHMdWNGPTNMw=JJtoy02kEEpzpRTwsjfdnFe1ffevNmJb5dw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:16:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=7VoJr8pr14fYsm9SoRNVsdtMgb_y7paz4AM+ovPE=Q@mail.gmail.com>
X-Gm-Features: Ac12FXys6bHdFUDdE89YA8F6cZp87qAVDewo7OQq7-Rj0miDlziIsIlK3CcncT0
Message-ID: <CAMuHMdW=7VoJr8pr14fYsm9SoRNVsdtMgb_y7paz4AM+ovPE=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: renesas,r9a09g077: Add PCLKL
 core clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 17:03, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 17 Jun 2025 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the Peripheral Module Clock L (PCLKL) core clock ID for the RZ/T2H
> > (R9A09G077) SoC. This clock is used by peripherals such as IIC, WDT,
> > and others.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - New patch to add PCLKL core clock ID.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.17.

Actually in renesas-r9a09g077-dt-binding-defs, which will be merged
in my clock and DTS branches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

