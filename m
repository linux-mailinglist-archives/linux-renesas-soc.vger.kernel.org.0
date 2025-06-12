Return-Path: <linux-renesas-soc+bounces-18193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA6AD7413
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F7ED170B08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF45B24C66F;
	Thu, 12 Jun 2025 14:37:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6A248898;
	Thu, 12 Jun 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739061; cv=none; b=C1M2uJ1ba1AxLT0i5iKu4IBMrKqRkWwKWv4o3dIC4Nri3/cSuhb+ocDd7501Cd1K9HUcffwq7iRiQ1UhroIq4LQCxmglAfpZsqmTVXFZhlAu4gPewq6H1s/4TJ0SXd5ml18Il5PpI4hdj+UnYPi2GKW5eIrDTrs2rvgPUuYYs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739061; c=relaxed/simple;
	bh=I0gga3/prf2yW/2Rgu96cc0OhRZ2RNlPN4GZaRSC/B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9Z3mJQIKCS1uzxMBe2LiQeCKp9yDksWU52SqdWe5y6NMmA/madpL5LuSN5BFvSV9UJMW0uPK6y/t/OPL65dMBdDwPf+bnpNuxl+0Xkczi5sZ0iWdnJEIrz3eoanwnwI9iCBEO5iw4JWzBsQ6rt/6om6GJ4p0yrTPcp4m+dhKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so109796985a.1;
        Thu, 12 Jun 2025 07:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739058; x=1750343858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzO6ta/nkwEKv80MmXJ/NzmLz0Qy3PfJgXbDfDVkKho=;
        b=ZKt0aGv0aploGkFsS+AMIpzaO/ou+/xRQNxEAPGUnSI52diDDdngKm7RPghqeRghCN
         vX3Revw+LUDwolu7hM0hnB8fpgUnoLBwwS2DtLyJIVikViylldBZeYy0kB+oBag+RJL3
         HBLFpzwcsOd6Wk/k254Y5O8pX9TN6tD0GDzY0SmN7KYCvuJaq9kFCek4IXRkeY9rQsr1
         yJUqBSZJ0zgXneF4CNEno59rCOb46gTynkkCzj1b6MziSSSc2Q19ZCJh2nc9tLTGp4WI
         DYxa4fV9Kxa3Q08xxi02/PXa2QEy3jyxXjO8HwmzUTB0+XREdJy9uAtJA2E7pZo8gVJh
         TJVg==
X-Forwarded-Encrypted: i=1; AJvYcCU3MMNKcyI1wmrwdQFxVXNH0ukiygUZxICIR6ihE6kIwBLzsUDOlt1Og2tGmsnWsAgZSt8fkuHvPB+w8SoCPZzQUBc=@vger.kernel.org, AJvYcCUQfJHeUz2fXdMTOtUqIx+Wufj8C4RnnkeH1vsCwmoBOzRQ44Tuj4dZb34Pkgt3PmIguevv9FgJvX/u@vger.kernel.org, AJvYcCUszeCJqU0/HPaqenRh+c8Wzlnf8RtIgizYsZ6uXb1gP5eWlMxSTp165ehqtpZBFrxbBrK3JEcIlYKcdO5X@vger.kernel.org, AJvYcCX8xidEvKLxaXm9I5b85WuLveDFjNuWk12pLZHxTeXAcqXoleAFTrC8voMEGBTimu/vA6EeLmVGHdGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24EQMN8lYnRiR5/AFyG0eJrQPDzSKnnwmylVMrp2EWwwEdV+4
	PgwHKzXTzQcFoHb533EBy+k0L0t+BISOq35XS7XmiQv32lmyJ3+JHT+f9ZhzKK0n
X-Gm-Gg: ASbGnctLhZCM7o/B/SMRcqjG2fKTdeq6dBgq1EHM1o4QjI6Kdyxk/P2KNO+/CXb/e42
	mrw2zddUOYSW2VYN/ihgWa+QTX/OAGkp1KkzGLQFNgFRLEApvZZhA84u1bPGd5VhU5T9Ap1W5pr
	dsHAnXnERte5KuQ6quUAvqrX9a3mgvQ2/5lpLWv50Uwbu5XzxcFGNQew7tsn+ot9jmM3pKYEO6j
	+StevCIrdW/+D5c0L80zIsUJd/4K/3QS4V8P0KGLFR21MYkI5rMUlelmeUGUPcwmzcUp3LjBnRl
	GKpw5fYXPvxFLReYtDTAiyZnHyw6poG1Bdec7fk/SoEtYqW0HtDoRBtLJqy//hbBOJd2VskNUar
	0WCChffMO+0kBBd36PUsUtbCxylMbitkx7/A=
X-Google-Smtp-Source: AGHT+IFzWfQ+Mbhi9yAkSsr8d8gkYYMVvFYyRtgH0++NHbnBfZLX5TIMmZ2G0uOkDasY7VQI3XL8mQ==
X-Received: by 2002:a05:620a:a215:b0:7d2:18f2:e8c3 with SMTP id af79cd13be357-7d3b2c6d45bmr517510285a.2.1749739057732;
        Thu, 12 Jun 2025 07:37:37 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f2301asm46168685a.114.2025.06.12.07.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:37:37 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafb6899c2so12187116d6.0;
        Thu, 12 Jun 2025 07:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIXV+RSf3HCFcINjLhyMLiVXCJp8Utr/spkKjnbSOjtKVFBGhLG9cVwFFJmRzc8RvJc5aCkwVWg0lq@vger.kernel.org, AJvYcCVR1RiL3wmduOLzbLnryOKEJRZ0SvHsLUG5LgFcMgr8ZEAFxea1LuuWQNLgdMIXkwut5HYf4m7rL49a0oNoOlXqt90=@vger.kernel.org, AJvYcCX3VTijhjGNS8Jo/prSLGrrGkdmVbRUrwUwd7lDwB5nhQGz0vBQosqBgYgwYFAh5R6pV87nOjQ/Ab8S5hzO@vger.kernel.org, AJvYcCXRyR9/mOzEAitOO6L22CSvoa+mwD4xFeQZu8BPpqq1ARW0iPK6m9CgxAhyL4M6whe7cPB/JBvDEKON@vger.kernel.org
X-Received: by 2002:a05:6214:202e:b0:6fa:f59f:f349 with SMTP id
 6a1803df08f44-6fb347f3f5fmr56720356d6.10.1749739057314; Thu, 12 Jun 2025
 07:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:37:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyce8qxwStb-adR=ywJRdPynOSdZn9DV106VRptaa67w@mail.gmail.com>
X-Gm-Features: AX0GCFsuq2UTCzvbMhu6t2eErAlrMWnHmknmauMa46mODIPLG40ClLlm4kMFDTw
Message-ID: <CAMuHMdUyce8qxwStb-adR=ywJRdPynOSdZn9DV106VRptaa67w@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial SoC DTSI for Renesas RZ/N2H ("R9A09G087") SoC, below are
> the list of blocks added:
> - EXT CLKs
> - 4X CA55
> - SCIF
> - CPG
> - GIC
> - ARMv8 Timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/N2H SoC
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#define RZN2H_PINS_PER_PORT    8
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 16 bits the alternate function identifier
> + */
> +#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + (p) | ((f) << 16))
> +
> +/* Convert a port and pin label to its global pin index */
> +#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin))

These 3 defines belong in the (future) patch that adds the pinctrl node.

> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";

Thanks, this brought to my attention that the node in the posted RZ/T2H
patch is wrong ;-)

> +       };
> +};

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

