Return-Path: <linux-renesas-soc+bounces-22526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AFFBB0846
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 15:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DFF7A8FC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 13:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CF92EE5F5;
	Wed,  1 Oct 2025 13:36:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875F2EE268
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759325768; cv=none; b=Iwx4tRGSshVwW9D1iCcqtBohceeUZyJArzDhVhBMqQixR4CtDyGWTbz3P22cIs+WD08BAoHpPeiwDm3l0kGYb/M8bTX9QMeHHcY3fL+Knojx8FGC1oVzvQEY4fRDk/uwODQHe+xWWz+Q2LttDst/quaT+M+q6XMm/o6uUNEHD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759325768; c=relaxed/simple;
	bh=cCOspOg10LPIcpADaHReTKiZQPz1A+QQStO+5J4q0Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gg7JnHZ9gPUYmxutLFRCz9e6zgeaipOR9XxP9nUQIFMgXRxBMIoaMGp6Ysmfg27GUW3uDcjJclk4NAtJznVlXclDmVitaApswAZIj8h77J6FSgs7lDS0XaY9k/oG0zROAIEaf1k1c1Gx+s/k+b2jTzW78n7OznpfAoGcazz+SG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bbe260539so2813293e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 06:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759325766; x=1759930566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTnvOCbceGyglohEUcee1/fNsyqLgTdEhUXaZIqhQic=;
        b=OSPKur/PYons8vrx7uI65+EFcrydahIb1+priqNnKJ/RE/zra9ekA+tpEIoigASu1d
         gOrH3qbuFjKSGaX6+HyRsTyF6BU8fzXbNgM08oPLnHtl48MFFq2MPlmc3urZ+w6bv3rs
         EWpaKCFzyuS3+I6thmjVTLy/hXbHHKrGYg9DHPfwSq3qEaWGEn9LGlP226kUQdi0hcU2
         VRhayLVqCpePoiKuy9COI7AL2hDvf6lbqQjm10IDHZXMJZwgM3YzsVCPTt5eN5Twc2Wa
         Ac2ttQkM+2V8ERmTQU/lyGJ1PeSKyTc/VaH4uJ/ien1vu0J4FLtYzTo4BVaX9WupKjMe
         B3qw==
X-Forwarded-Encrypted: i=1; AJvYcCVl5Iz6vtn5L7s2TSTpOLZ0HiGO9m1UkK/tmRi1JArzSsaZyyf3VfBH3nu65owJiEQOTHvv83FI/RoISV659zc0Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyIoS/E99jRm5G+mz0XRvFKoHx0W1RqGhv+LG91GOebMOGzTkw
	Gs0CUJwd3X3Cn6WNlvi0yBOaIDu2pJxUcKICBOAAwIpX1dhWF6dmjG8RJfd4ZFm/
X-Gm-Gg: ASbGncviJteHN0hhy06wNT+rSA0WcgpwiPC9O/H2c0NWfeBHgzdKENzrWG7wXhm95jb
	DnzhtcSR1qnJTCGdU7/b3N3FrT5oR4vQl7jijV4C5s+K99I23sfOJV5FHdKGFIrsmOJsgV+TBqy
	JcL8hyVk/8HdxlMVWrwk9MsbV6KhKIN2G74Pw59KKoiB107aHLwW6XxvrbanQRPRNu5j4JjDa4l
	m74K3qkueQ3rb8I2+ax+TbKY0Yswkr9cgogyGc1Ot7R0I6tEqQLByPS4fho9X0Pp7WkO3ziVUO5
	25PmXZHag5in2+POSwztWRVO56qePRRpdqzA/6h7qp5LvBycSdiOo6jz6EFu4Livi0BDDmEhrJ+
	QdyEH9niba/jN5CqmawA/Km0gjw1Isu+9wI2+Q+UwrjfqZm4MYRmg0ZGKwUJJIH4pvaTBOeWpta
	ywpFPhwqyK
X-Google-Smtp-Source: AGHT+IFporhy2ne6bM7AqpmVPN0oIJSAKzJzFHEwIWUepUH0nswu5pPYGklmaBEB1b00ZzsojWHV2A==
X-Received: by 2002:a05:6122:201c:b0:54b:d7b6:2eee with SMTP id 71dfb90a1353d-5522d3828f3mr1270688e0c.11.1759325765798;
        Wed, 01 Oct 2025 06:36:05 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed88199csm3439262e0c.3.2025.10.01.06.36.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:36:05 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so1909255241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 06:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKwElzKuTACfLkIRb3Aim/Yxrc304CQb6dfXIOnqR4vmrThn1AGe2pOzlZqpTVEMK+zf8f5OIPqopvPc08w4gdaA==@vger.kernel.org
X-Received: by 2002:a05:6102:d86:b0:522:255d:4d19 with SMTP id
 ada2fe7eead31-5d3fe747011mr1261198137.23.1759325764988; Wed, 01 Oct 2025
 06:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 15:35:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUA5r519G=OQM66wSig9r2dDP4y1NTH8zOZCTLb5m2Tew@mail.gmail.com>
X-Gm-Features: AS18NWDLqgedMT7ALXpq29QgD05-Zz5HL5W7UgCB9wanWY8rYAtz-4hGklmKwbI
Message-ID: <CAMuHMdUA5r519G=OQM66wSig9r2dDP4y1NTH8zOZCTLb5m2Tew@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: renesas: r9a09g077: Add ADC modules clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have three 12bit
> ADC peripherals, each with its own peripheral clock.
>
> For conversion, they use the PCLKL clock.
>
> Add their clocks to the list of module clocks.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

As I have already queued v1 in renesas-clk-for-v6.19, there is no
need to resend it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

