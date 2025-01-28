Return-Path: <linux-renesas-soc+bounces-12679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BBA20D36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F7C18867CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0031A2387;
	Tue, 28 Jan 2025 15:38:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43356150997
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078698; cv=none; b=NJ5ORaSleQQj/+jgvIAN52bjyBvduyeqWbGykCmK7F/GSZW47BuCmnBNul5/ChZt63vZRsr0ap+8kjrh0Ld4mjcEcRMyEoxrKfB4bRPqZmfUr7A7ZIUF67jo87z9znZsr4nUnVOccxWBT6MElrMa/AOgmMa8c6Z9IRZ87T2/A2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078698; c=relaxed/simple;
	bh=YfAetrCHj4JcjapWPwRLzKUCcC/QVl+PUEywOZehQnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hstSBzNPmizX/69508ouNf4udpEBqy97WPODB25ivy8oxPh7T62nw8gfNVbT8yPAaHb1LtbaWqH/Tfjg+m993x8DYOJyOHps7J6ZtGkDaUFS7gutLHqUGM+u6w2Mt88wWkfQlG4fgX3tPreS/G6YcRwkiAmwbdubm/lWu75WBjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6e9586b82so504168785a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738078694; x=1738683494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBmOr40UWDHvdSQEBQET/IepM6PiyGClnBI/hfaul38=;
        b=cUiGFKu6B3AKT+5aaqY6/Ne3soAY4FWHkFJ+kD1ZI6QNy9K7TtDt+GfA9rdqofdCNP
         YprLW1sMM4tXQO9k8IMPG9L0un+gdizWp8ZwOhWKb7+Tm+BGKvVK/oiT3tHmO4Z8ZNc7
         QOcKorX3kawOvOeqoLwla67oA8g/u7Kp/zYsY3QxSACm2bYikkJoGFveqTHyHGf0LhnP
         ZE/QtrjDfUtrRMjyruWzGAiVwiVxrBZFT+QxbfYCyH9GnPKzDMrqOD5w97eIt1jD6r+a
         C4dN42pecQibGRxjOl4H1Y4xzZv4IRIwU6BpLbRbJVtsT3IfOsbI4GS91MlkKNA4Eram
         x9vg==
X-Forwarded-Encrypted: i=1; AJvYcCXQuoJDUpYpG8SDZAAYjpA45o/yxmKZ/+gN4PHU6trrtFoMH0tWEh8MMypmwe//7z43dchaEU31ZLOFk+mavGVSwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJN9JCBiImxyS7LxmvEN/LOrRlHLn4+kuXzpNzBi7TxVcaQX6W
	2i2RR4pe/ABtK5gRFaER2EjYAaT++l/alFqo7/AO1KJhgsyewNat6itQuMCN
X-Gm-Gg: ASbGncveDGfNuYQFeccgJfb8xxZAyQHAQT5+03/eZc4F81RAvSxZ2gn66ScDP2hGo8A
	4dG3eN3GJ4pFkAvsglK6OfVtpwOVh4ot2oPXystTyGrrMEn2otc6vk69BgbVzvxZZoR9hGjr9MJ
	9hJ4VE7hen2hgB6seRB9QpIYgKZmgtczsx5S/DcEATKoE2/jLP5iixlpEZaWiwUTMfrRaYftXa/
	5YRUJ27RR0Rdvn/Yy8stY0jQUw31nMT/vvhNEF6tt5+Pk1nEXO8ek+GCzCxgvGQYWbqJtuISy8G
	60oevZl/X70xUHIp3KVBDMEfWl7G7E4ONDiD4GamHmRbV+qQx0D76DkhUQ==
X-Google-Smtp-Source: AGHT+IHt4YJG86J3cXkQ3mhoS78YCFOKMf8eiOqpZrl0bdJBhf9D9ZaP+aDYa87kyjVABUff8xrvww==
X-Received: by 2002:a05:620a:298e:b0:7b1:113f:2e55 with SMTP id af79cd13be357-7be63289e2dmr7458546785a.58.1738078694554;
        Tue, 28 Jan 2025 07:38:14 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9af0d2f0sm519838085a.103.2025.01.28.07.38.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:38:14 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso496333385a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:38:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6Y0PLAw1gz8N/6lGmjfLh9OBLeoXi4M2RVKTe/04d1XSy0zr4BxVWiPxAUfJOx3O0Yb8D0xmo/haOouAGaQAx3w==@vger.kernel.org
X-Received: by 2002:a05:620a:2588:b0:7b6:d241:d4ae with SMTP id
 af79cd13be357-7be6327c505mr6447139385a.42.1738078693913; Tue, 28 Jan 2025
 07:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 16:38:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeSQPPVUFDD75vJywLQeEDJq8zSb9ZFHkKdmzB7=J3nA@mail.gmail.com>
X-Gm-Features: AWEUYZnjsRfIOr7YkWKIgVqvd9ureglkStOUZbVSuGlU1OQREz5R2c83ZeT8VLo
Message-ID: <CAMuHMdUeSQPPVUFDD75vJywLQeEDJq8zSb9ZFHkKdmzB7=J3nA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] irqchip/renesas-rzv2h: Add tssr_k variable to
 struct rzv2h_hw_info
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E the number of TSSR registers is 15 compared to 8 on RZ/V2H and

s/15/16/

> each TSSR register can program 2 TINTs compared to 4 on RZ/V2H.
>
> Add tssr_k variable to struct rzv2h_hw_info to handle this difference and
> drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -64,8 +64,6 @@
>  #define ICU_TINT_LEVEL_HIGH                    2
>  #define ICU_TINT_LEVEL_LOW                     3
>
> -#define ICU_TSSR_K(tint_nr)                    ((tint_nr) / 4)
> -#define ICU_TSSR_TSSEL_N(tint_nr)              ((tint_nr) % 4)
>  #define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) * 8))
>  #define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PREP(0x7F, n)
>  #define ICU_TSSR_TIEN(n)                       (BIT(7) << ((n) * 8))
> @@ -84,10 +82,12 @@
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
>   * @t_offs:            TINT offset
>   * @max_tssel:         TSSEL max value
> + * @tssr_k:            TSSR index k
>   */
>  struct rzv2h_hw_info {
>         u16             t_offs;
>         u8              max_tssel;
> +       u8              tssr_k;

So this is 4 on RZ/V2H, and 2 on RZ/G3E.
In the next two patches you are adding:

    u16 tssel_mask; /* GENMASK(6, 0) resp. GENMASK(7, 0) */
    u8 tssel_shift; /* 8 resp. 16 */
    u16 tien;       /* BIT(7) resp. BIT(15) */

I think you're going a bit too far in the parametrization.
The key difference between the two variants is that RZ/V2H uses a
field width of 8 bits, while RZ/G3E uses 16 bits.  From this single
parameter, you can easily derive all other values, so there is no need
to store them in struct rzv2h_hw_info:

    tssel_mask = GENMASK(field_width - 2, 0);
    tssel_shift = field_width;
    tien = BIT(field_width - 1);
    tint_nr / tssr_k = tint_nr * field_width / 32;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

