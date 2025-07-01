Return-Path: <linux-renesas-soc+bounces-18980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAADAEF9B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3726443FD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81082737FC;
	Tue,  1 Jul 2025 13:05:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C6925DCF0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375139; cv=none; b=Wu/p/JRhsNeY9HSm47v3CgVSHvhqJ0Zw+vuoFWCd0UcN1HEYa6888TcX4DuKmUT1RVDvcangq+AQCnkqNuTPCGtjA6qoA/ZdjOEwERkfHjiEypNuhBANZQhCv75lch9KjqoCjVshvUlha8GslbthXZMgTnKc/d3tjVLzchy04vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375139; c=relaxed/simple;
	bh=L262bUqLDfOXX1SO4aDf6p25OE5eTDq/EoEmI5ZlKPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFo5eSkcxDUEePgYsj5sGBnYG7PoZEjH9jT4NZEfOKcUxxCKB87WZzebZuKjG6fH/Ij9MywCabXNxunqp9B1fATuURsOJydWcCxlJV2D4tohVETqgbdqPYrYLtK33fxyO8FtWn5rY9nD2r8VKzqn3Y/MBRPYUxePto7AH5uSunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23636167afeso28663065ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375136; x=1751979936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+9et0Bu0wvWwQVQq3ngOqlQRpdjTwNg2Job3aRZ3R8=;
        b=RyBCqEwnIIi824JMf7QpEhGcy1C/fvEN55jQF7Yg+T+4Mbod/zCPUktsnEQFPmG0q6
         vcbf7Hn/EjGrMgO6sRGJUlE0Zj8e5c50TrMU74Omk4S04bF6I5WwdhCYZEMqU/YkZhzi
         jbeLuPgkIiDMeCY1G3yPCA+IO0D59ENJrOm6qblqzSVU1JY0Ik2YiQiYowO5io/McDA5
         OpyZbXzDCXbQrJuiat2wPG7GDoMZP4XFBJkbg8nIRO6cRhlPvmh8vlt+xu11gstoiZmm
         EeDfTfLzZUlenpOP5z3q8KigtCE9jSnObxPGf56XcBO/PxGwlzrVF9OxOOMA4OrtoqL6
         APrA==
X-Forwarded-Encrypted: i=1; AJvYcCVtzObdlMr6KDiADeXjySxn1vGIG1jR64I7DVzLM0aBwHl7gEwKIAhOOqv6Gl1NQsM5GnTCwN9eq7JE19872gdGvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyquJ9PQHwEZ4WewCD4/ievzNgarAtJs3uUMW2R00GH/TrlO2xw
	Hedhu0b1UhnnK/fNsMi1WconVYr31NM3bskyGC99WuJosfFe9Mi06DkqWX4Zt1i4
X-Gm-Gg: ASbGncvNgbhCri1VgTwfTIpIyjbK/B1b9AriOShEXFE/Bx6gJkG8TQTQ1sUZuMsCw63
	BeG/Q0EehUJZtn402vxxK/AO8J1k5Y3ehmMPpRK8mLS6TGlY57bS1IIoRTaW+77P5DuKB1mYJuK
	0Ikz4QaTFxAkHIozREKpApV1xB8S+4lZrnF2/UbKn2IOHxSk1UERc5fKzHHsOQ3srC+Kk9xdyZm
	BGsAdenCDnUnTELLpnbJuVWXx5mJ2oCJBMzV/7a45TMU8LjDuDb36gSoeCLbgXCZsInpPXneuwK
	k3yVhEpZTgFOipxxOfxqv/Yub3PBhLx8LiNbracF7xS4un5IBO7lRI0OtUSradmmGGBCVRABYdh
	8CDUqxT52ws8U0OSYLjmQc97pu+TR
X-Google-Smtp-Source: AGHT+IH46WZ8gRyJT3LWqsSHw+ddbBVrtHG9RVrS6IJcsyLDIPwqGFQseRHeQEb+jhUvloJUUKXs/w==
X-Received: by 2002:a17:903:2452:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23ac3afdaadmr276594595ad.19.1751375135847;
        Tue, 01 Jul 2025 06:05:35 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7a21sm109660705ad.168.2025.07.01.06.05.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:05:35 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so28237905ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 06:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk5gy+hfDKay3T4Nw4O/Lrruv/pKsMPPPcsqsSCKSDRETk6iCrXF0dFcw7fvPoI4hPhjdOm7L38Ldl8m0pBzaVYg==@vger.kernel.org
X-Received: by 2002:a17:903:3a88:b0:234:c8ec:51b5 with SMTP id
 d9443c01a7336-23ac463e7e3mr239510175ad.53.1751375134479; Tue, 01 Jul 2025
 06:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:05:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfusCsJawffmo1AUS4yPoC_MFyetcPCufuFEiGtvjuuQ@mail.gmail.com>
X-Gm-Features: Ac12FXxNZxDVJmWMRDZx4UgK158_HTYCY7uRa2_P4mwEdOy-SYMSes3rZqbdLDQ
Message-ID: <CAMuHMdVfusCsJawffmo1AUS4yPoC_MFyetcPCufuFEiGtvjuuQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 1 Jul 2025 at 12:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The interrupt controller found on RZ/G3E doesn't provide any facility to
> configure the wakeup sources. That's the reason why the driver lacks the
> irq_set_wake() callback for the interrupt chip.
>
> But this prevent to properly enter power management states like "suspend to
> idle".
>
> Enable the flags IRQCHIP_SKIP_SET_WAKE and IRQCHIP_MASK_ON_SUSPEND so the
> interrupt suspend logic can handle the chip correctly.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -427,7 +427,9 @@ static const struct irq_chip rzv2h_icu_chip = {
>         .irq_retrigger          = irq_chip_retrigger_hierarchy,
>         .irq_set_type           = rzv2h_icu_set_type,
>         .irq_set_affinity       = irq_chip_set_affinity_parent,
> -       .flags                  = IRQCHIP_SET_TYPE_MASKED,
> +       .flags                  = IRQCHIP_MASK_ON_SUSPEND |
> +                                 IRQCHIP_SET_TYPE_MASKED |
> +                                 IRQCHIP_SKIP_SET_WAKE,

This driver uses Runtime PM (but does not use a platform driver[1]).
So don't you need to implement .irq_set_wake() instead of setting
IRQCHIP_SKIP_SET_WAKE(), so the ICU is kept running when it is
part of the wake-up path (cfr.[2])?
Does wake-up from an ICU interrupt work?

[1] Perhaps it should be converted to a platform driver?
    That may also be needed before you can provide a
    dev_pm_ops pm_ops.suspend() callback.
[2] commit 734e036a9e1052da ("irqchip/renesas-irqc: Use wakeup_path
    i.s.o. explicit clock handling").

>  };
>
>  static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs,

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

