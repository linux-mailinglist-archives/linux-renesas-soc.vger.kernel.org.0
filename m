Return-Path: <linux-renesas-soc+bounces-13592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E26A42215
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 937C17A661A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7BA24A079;
	Mon, 24 Feb 2025 13:52:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1224889F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405120; cv=none; b=i2sPuSqv2JSamzHgDHGWF4+21c3z4PbNSJjbuxwbpaQdaweDWI6zz8+Br4RPRMAyFlhfZ6E3p9YJ0u1bGXVp+4mfsS93C2S9bxbOSmF6oJVeyWY7zpII5CwRDan+zxDhRZG7Z8CIXy1ZdkS5LcjO3uBa6q7+IGLKKElfFiRdhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405120; c=relaxed/simple;
	bh=1IeeGvNxJ+6GzvlmUsiy0d1DnjceHW67P+DwsE18K8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcLU7Nqm5c6b5pMZ/mKOGimYdsrZjyAKWroRK8VTdanDBwR2ZqAF6lcBGeE1ZlLoaowi2RdnKuqVlUyhsbgNTJGIldSj4w71VcrcEiEI46OHIycE6v/FjytM3IgCnQ8r8VLgZ5arKFPl7+rUDptjfUHkELD3vEepZY5L4IocBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51e902b58c0so2684370e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 05:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740405117; x=1741009917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaxNv4LyuqmTW8nSrEGDgp3hzD6ZQwWJWexMiVxlK2M=;
        b=DAR2D1ytXYLeuvbs0lCfSXQtA51sZAVZ+9QfEjOy9nykcGa7WSp4qR6yBYyGFMo/yi
         m8UpQ9YgJsVNyNhi1rtcY/p8EK+1BoWdZ8wi2UdwKYstDbYqZeTSGMBD2gqn/J0Y9BS2
         479AchWTY4Mt5HWMttmkQf2X8uEB8OBAWFGFLM09bzoPRcvVHhUq61pcNbUS7Yv4UKHY
         +F+AAgpjrAbwk4KCujAsghhaw+JRlWZh15G2u9rtDCsMQuGnuDev/pJ8BCpsEo/Kpj1v
         epetrbM5kje1tOXO+xo+Rpx7xOBRAZD2zpxuR1v1cv38tzJ6uBvGOl+bBYMp1QhuFjBj
         51dA==
X-Forwarded-Encrypted: i=1; AJvYcCVX6uDiRsarUDPdXxAourd0ifk+uYHvZJGcxtYdkPnNFK0goHssMkneWw/oGEyjYmIE9Luv6OS+wlEyqc96b2XqOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMIlnAsG1MjMhi+7t9Tp252jeRQOlM97qRIG1pMKXz7SkMsFF
	lfoe6WsKEQ25uFMB/yB48HUHnhfllQIHMlLL20f6GbHiT0fi57uDpfozd0bFLLw=
X-Gm-Gg: ASbGncsTKhdjF9SkEbyRY26fW3F8uUj5yroNQE4xq+t2fXjkXERdVxGqhUIsKdz81pd
	rripZkX1wwptxqEzQpeU15wqXjhnJ14DYDcWly8HdFfL5n0WakbUbBFIu0X08S+KnrieFBnw0fG
	Ej8FSYD6mnhx62Ff1k9l5VpFDFqxH1TkQvniiFDvIhcqgRIXqQgGD/NpnTFTR4ucjGe0G5K1ltS
	3InQRAiJE01RGqBQWeEwyGcteGrcpLnuevKjGYEUpWJB5yHt8g9D2H4wHc3iBmT+TQ/4DwmlRQs
	/Zsypj3XvzV6gRg++/yEdPHgStFhcwiRihCohy5lAa3kdo9wUEpa9SyZGIXEuIl3
X-Google-Smtp-Source: AGHT+IE+TvUFkdwT/aOQQ2yKI0316wKpfB0U3o+XnYyPo78tauIScjYe+1Kx0ReZKwC83LbOvNTa+A==
X-Received: by 2002:a05:6122:886:b0:520:5a87:66ff with SMTP id 71dfb90a1353d-521ef89321bmr5891789e0c.0.1740405116932;
        Mon, 24 Feb 2025 05:51:56 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520a97ad82fsm3577078e0c.48.2025.02.24.05.51.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 05:51:56 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bd73f93215so2801817137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 05:51:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUk8QdFKsAIbKwDNOX5AJO586MR3A0WFY3bJ84TByjZzApmXcnB189nj/b1W/1X8moei9Q2DryHrUbJHKldw08RHg==@vger.kernel.org
X-Received: by 2002:a05:6102:d91:b0:4bb:623:e1f7 with SMTP id
 ada2fe7eead31-4bfc28ed564mr5735905137.16.1740405116387; Mon, 24 Feb 2025
 05:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com> <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 14:51:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
X-Gm-Features: AWEUYZkwPGtlZ_T4yunMDS5yvOXRDu4ZwUk3u0m8W3XpKMHZK3v0G4i8rHIPhOs
Message-ID: <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros ICU_TSSR_TSSEL_{MASK,PREP}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 24 Feb 2025 at 14:13, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E, TSSEL register field is 8 bits wide compared to 7 on RZ/V2H.
> Also bits 8..14 is reserved on RZ/G3E and any writes on these reserved
> bits is ignored. Use the bitmask GENMASK(field_width - 2, 0) on both SoCs
> for extracting TSSEL and then update the macros ICU_TSSR_TSSEL_PREP and
> ICU_TSSR_TSSEL_MASK for supporting both SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Dropped Rb tag from Geert as it retain macros instead of dropping it.
>  * Retained the macros  ICU_TSSR_TSSEL_PREP and ICU_TSSR_TSSEL_MASK by
>    adding field_width parameter.
> v4->v5:
>  * Used tssr_shift_factor in rzv2h_tint_set_type to optimize the
>    calculation.
>  * Dropped unnecessary parenthesis for calculating tssr.
>  * Added Rb tag from Geert.

Thanks for the updates!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -64,8 +64,13 @@
>  #define ICU_TINT_LEVEL_HIGH                    2
>  #define ICU_TINT_LEVEL_LOW                     3
>
> -#define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) * 8))
> -#define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PREP(0x7F, n)
> +#define ICU_TSSR_TSSEL_PREP(tssel, n, f_width) ((tssel) << ((n) * (f_width)))
> +#define ICU_TSSR_TSSEL_MASK(n, _field_width)   \

Nit: please use f_width or field_width consistently.

> +({\
> +               typeof(_field_width) (field_width) = (_field_width); \
> +               ICU_TSSR_TSSEL_PREP((GENMASK(((field_width) - 2), 0)), (n), field_width); \
> +})
> +
>  #define ICU_TSSR_TIEN(n, _field_width) \
>  ({\
>                 typeof(_field_width) (field_width) = (_field_width); \

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

