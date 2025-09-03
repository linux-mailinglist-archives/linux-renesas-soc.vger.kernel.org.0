Return-Path: <linux-renesas-soc+bounces-21268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A6B41DBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A41C548DCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38333009DE;
	Wed,  3 Sep 2025 11:51:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3831B2F8BC8;
	Wed,  3 Sep 2025 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900309; cv=none; b=WSAU4VgFSxq6Q+JlN+ohVUHCtMbFIq5TdiTIWW7jo68+N1MFnuCfMqmHFQVIbh3h1aKESv0aamYhRJ2/9VXUTRF1cefKlg/8+5Sly2spS8G9R/fUycSS7O0D723wW6fb++3li5IAYLUJYgsSDlBqzBgHX5cNM8TfjalKHdLDD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900309; c=relaxed/simple;
	bh=0NXeswWcFkSes/1u7HlPYfIoa8uwoRCkHcU+Hpz0TkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzLOGT5EYZu1rnRRdTdXVdhFX7vwV1c3O+c/cTKrVDx96S78fOQAEdkSsZy3F6KGuYhyEo1Dgi09cuxlC+NouXVTDtjgvAPrH7sqkMKJ7ujKMEx4at1wIeZVTYZMsSjRkgwRevE+quINKsLQH+GJ7LDOLVS5NTUaffAkCJ9zc1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544aa9b536eso2512480e0c.3;
        Wed, 03 Sep 2025 04:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900307; x=1757505107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toCPkhyQcLa7UGoBW0B7LlcW/gOJN4+iEDFwyf7gIlE=;
        b=t4BNbuRe86pT6o9EmtHvvxD49ZdwbeX+r/nbqCcJoWOTt6R5DrxGpR4tmpjBOUGwRU
         hLSxn0iZXuX5Eq2836xlgELr/C6Ch1NRgMRI2nGLEbBDHX5DhrInq3wyfZlHD9ZsF6Pa
         wilpyw8xBDTXeR9VTn/8FHgnke2Le3BCH9tDp4UFmo3+57kOl0HsMy5qWYka5omqeHdp
         devwVoVp82d0EVQ6Z8k/aRfzLnkyJ73ONICc77bBp77bWhGbjxeEPvN/xJZbztzQwUhv
         DRRl9oyUIX1ul+YNqk3bube3PMWNkxeuirrzSdfPMLvr1CJrRp5od3VO7j4Qf1H6Yez5
         K+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG5fgnGyQ/+xDZpcP0Fy429719f4s+sjbGFPjlN+4aqd5eLMSM/FvPWkB9wq0FhET1ue/agf14R7v4u6Cd@vger.kernel.org, AJvYcCUdag6hZbMzYWD5hhyFoyekKM87Z5VK5qB9MM+mpAxfRrS+EtbBi/ZLhu4t2e3mQs/FIpkN60JcLLmU@vger.kernel.org, AJvYcCXptXLBMD9IQS+9S/nAe4adDWl3ABG2ld9rZcmm0Wf8ajScPYVE1z4bQZuBAtl1GjqnDVnHFDcQlQaIwtXLwwEZKG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQt6Uob46fZ0bGNtjE6hxOCdHFC7b7i5tpqAqnfYWXf++4ZCwe
	DeBQALY5HNoQip4MozuqL+rrgYj3MQKGQM8vlMk2lGJENHPV8CTpy4jKobG6bh1M
X-Gm-Gg: ASbGnctOYl4q92rbFiw0TX67/C5F7hzb1BVHIX5683UBpnVVhGuDnb8PUMA572KLdt7
	UpiRq1djjUdAqGhFaPtYfVPFmWArhY5NeksI8zJxO+htgWeBxt6Ya+Wf+KW8gWM/qR5TGyN/CNs
	DkZnpvfzutKOJh5KVQ/yIhhbkXzNmPBNcbQROFxILKxjySksgA4MPtQksRPhisLCcRRsFKCiqo8
	KMwkULpjM+Bkhsv7xKL0eH/eJEQL6rZYPJyAf0av4r1S/4g1oMIGyxMIY7VVh4+Xef+c7oC2qGX
	rEGxp2x4EfIlQFV5doRiIn6qbicwFeQfBNeO065mhBOfCZ02/ZcQioUanVuVSMl/FfKbGEz3pkA
	gk1ZMPK1rjTDXDpphnfa2pk53ZHDaXbvHUKJvffICvxdcXKttXpvak5K4A2zk7J7yFrm1kUs=
X-Google-Smtp-Source: AGHT+IHJUQyyvtpnrglyyB3oGJfEotkpU59L6XoNRvv/c1YeXVKKdJx1IP4XqAfr3iZhhoiX9wFFqQ==
X-Received: by 2002:a05:6122:554:b0:530:7ab8:49ab with SMTP id 71dfb90a1353d-5449ff8da92mr4910749e0c.0.1756900306873;
        Wed, 03 Sep 2025 04:51:46 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5449131bfabsm6618909e0c.12.2025.09.03.04.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:51:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-531fe8d4619so681464137.2;
        Wed, 03 Sep 2025 04:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfpQjxgjQpUJxV8O0Vklo3SSlHlO1q71e4o2dBI4n/hBiKRxbnAvBiHXX70g4868Wx+r3Iq5aFuKB6+L7O@vger.kernel.org, AJvYcCW9LDpUYsb95MbeIQ1HTAmeBZC5D5o2Rf73Pf5gv32GqoCj28rnYaDwXyxstWAe/46LWWM2mp0EFeIt@vger.kernel.org, AJvYcCWY4TIwpzqxptpdTpOwIvyvWstscoW1+t3J4U200qozOJOMFSL6X/T0QBuLk9wIHwa94IA3L1Qje6am4w9eQfflOv0=@vger.kernel.org
X-Received: by 2002:a05:6102:6447:b0:524:1bc6:c80e with SMTP id
 ada2fe7eead31-52b1ccb408cmr5305054137.35.1756900306497; Wed, 03 Sep 2025
 04:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:51:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCSdLerSq8B5NYUumwG5btZji8dPLCvRkN6we1D+93ow@mail.gmail.com>
X-Gm-Features: Ac12FXzLZJmboPTeikYmN3kcCRtNfEjmbUe7fbxyEeHHwhZLJJLD0XUgqO7zpoo
Message-ID: <CAMuHMdXCSdLerSq8B5NYUumwG5btZji8dPLCvRkN6we1D+93ow@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable SD card slot which is connected to SDHI0 on the RZ/T2H and
> RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped sd0-sd-prefixes
> - Dropped DATA4-7 from data-pins

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

