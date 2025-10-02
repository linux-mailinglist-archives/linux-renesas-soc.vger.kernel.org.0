Return-Path: <linux-renesas-soc+bounces-22580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C7BB3E12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C828A19C789E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A383101BC;
	Thu,  2 Oct 2025 12:23:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136D280317
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407833; cv=none; b=mGgT6w97LxBYFrj9XpKJ0nyjmxqu86LVeIk7kLXg2i4TfkiQJvWukwe47cEc7LkJIkVA7RNEc4X7s9nk1PbjKJHcGDYRkOhReSRzJs0WwWO9FRFi6Oxl7Oic6s78XCvw7GEWf1Z8jOIezQJN3iNirVk+BkyqobK8/mTMQhNA/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407833; c=relaxed/simple;
	bh=AC0onUH/KWR12euPrEMMEF6CxzSfY+hS18p7k/rNiSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGN18b+JonHhhAO3tJ/R0mzzkoxl7l0z3sDtqX0xeL+YSZZncLRmt7CFdxwXZGGMARveePxnim6K5lnWiXUp2rukynVYbSXj+QVLI/pL5xSaySqxPqVdKTAtMX92zap4RZ8euD3BBLs69vEm1XbmPOUAf2CGQFgo4+8WrgaKU5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07e3a77b72so408395466b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407829; x=1760012629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHq3klzPYB8yjcAVOmszOfkdhflrtsWL0PRMLhhvkhU=;
        b=rAhRobJfd69BOy7KGHVwJWvljU8+UiH1P6kn2Dz36Jksm+ThwRAtO4Hh7uudpL4GZ8
         939ymhA1CbcyVjnVNBpzE2JVk9bMoFGGq6wFXVY3JvGFpqvxnJ9wBRRvv+duX8FzO6U8
         VHDw7KHndOQvwexTbIZSzSwP2fRQkhpoA4Jr1BiPRCCi4EtlQwAnI1DLGvInFFimM9fo
         TOxgyaUKuFC1iLtJpzkW5HqoD+I6Za0BkmojQzDlJBSiAW9ZTlaykHECxk2IzSXFPMkD
         ghAlkHwokzYAGSemAPaxLvWAavs/nr+NH+6W6ov1xhCIpkyvv6ZjgJeTlDFCV4mp9Ok3
         PQQw==
X-Forwarded-Encrypted: i=1; AJvYcCVIMEvrkvZ79UCw8AMtCaM/Vu9QsqqT7FyXyWr7ZFeWTK0oazzldQp+HdXK+bf2011qhCM4rNh3aeLMtEmP0el1kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweqB16/ukccdiZFerbdMMOmtlX5wfyyNvLH0BlYIXtyudBlP/M
	Zr2Ml9JsMWCGYNYLTkKxTd40P4hkebBVTFotPbELPNwwqOeiUu++ZVGKZzO9Vk8jo0Y=
X-Gm-Gg: ASbGncvXnZ3Xqot25q9x3TuZYr61mvj41Nks1CQCrDF/xANQnQtfHFyif037on5VTto
	jTWmntOgg6TJOD6NJmykPYshdNlIeA1djPWqcf3TwbubsNfMrcu+oZU7JeE6OkopUT36PrdZ/kI
	1jVmAfUkzrmBKQU66L1cyLByRBAXZaMdfNP/CFA0g5un4bZX6pC7S9FppDKcmhSiNPkuXASNNwq
	ucviAqxSjc3TWlPMTHMYRgwDe4MET+2skZyUhRqdW9GNUYqH3lZCLBbT6SnTwYns7xSOL0hfdkr
	miV/E7fXWFG/fkF0oNEkb+WCzn2r5/DtVyRoluijiykVZD0jYh4b5dALAYE/urdWO959mLwevfw
	NZbYFuFoSDUkqZNPGp2syJDgsndwm/LXlTP25/fdaaZBYFQpCojO5rlUozCN3ahFTULsaItuxDl
	O3tLpiQbWq
X-Google-Smtp-Source: AGHT+IE5OaCpoy3UtLwZSHNn1SZB8caGT7mjyvTLjoaXykez+ic3N095oBReyAFhJl+rtELuP1X0AQ==
X-Received: by 2002:a17:907:3d88:b0:b3b:b646:8c50 with SMTP id a640c23a62f3a-b485bece72bmr387851066b.32.1759407829024;
        Thu, 02 Oct 2025 05:23:49 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm197601066b.51.2025.10.02.05.23.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:23:45 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso2127999a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3s+EnNMFR7bhWlxelittZYx24AuryU2J2OtYwTzAoThgdayiwiwg8RuWTfHyn4F5hEJFQuzDLzMtqiP1fGFV8pQ==@vger.kernel.org
X-Received: by 2002:a50:99db:0:b0:631:6acd:fa3a with SMTP id
 4fb4d7f45d1cf-6376a8cbaebmr2386247a12.4.1759407825048; Thu, 02 Oct 2025
 05:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:23:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQZzgv-St7a05Z0nr6ijDG=a5UT6dkz0apx4Ympxowgw@mail.gmail.com>
X-Gm-Features: AS18NWAPPSWmlScZEb54OFRRxiDbKu9VBgdxP80maayV33NLkOLsg7T87DMtor8
Message-ID: <CAMuHMdWQZzgv-St7a05Z0nr6ijDG=a5UT6dkz0apx4Ympxowgw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: defconfig: enable RZ/T2H / RZ/N2H ADC driver
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs include three
> 12-Bit successive approximation A/D converters.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Enable the driver for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

