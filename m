Return-Path: <linux-renesas-soc+bounces-13048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E514A30CB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 14:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F6E188214B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9A41EF096;
	Tue, 11 Feb 2025 13:21:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C7320F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280110; cv=none; b=uLT+i4hWr4wXdUnT/8dV/VShbDIrIJ65+hTGq4ov7LH0A/eEP120FufZQ3fDUXCNqAf8CDAJwTvnBf1cH6ym/96anXTu1xdNiTUSIrlvCXgx1nLzQn5habRfNhXejJTR3mzazSoaGjom+J6VO590Cz+oxIYX+laEtLy+HtdXQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280110; c=relaxed/simple;
	bh=4ItTSiinMTb+yDhre35WzG1kyFaea7CGT4DUmj5WZPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kW7xFzavODjy7S2MI0KmTHg0N4B/1kHcZBxXix8OvPUiYiBfEMBHYZuUSzAQ/qdGfKCx91Vfb1zByl1dyY730qQMr9bsVz6igf0oA9FJAecm2VtKmfUyDRi9OeEczZCHvG63IcrjaTFC7Bg9jwG2A2ZwShDg4qVWcpwUvksA5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5203bbb969cso581066e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280107; x=1739884907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA64Etw0B3/zhjq4OIi6NeOvD2im4l96fAQEQf9vF/I=;
        b=amy9ScW86gyz4zDFbxK+t8Ea46OgBdY/oiIuJgQRoRupXWECcXhdYK1wCQN1X29jnO
         eZjVeCVYfAU/PD01+ABMzh0qk9I40VsHfXrZWkG5bi70AhPvqK47dNva+kvg6vemyXT/
         95ZwI9uCaHUDYCcc7mSCzmepev5mmpRH7ZjKo6EpDhTp9Ijf+YoKBvTX/T33UpBg5CCO
         y/rlP4cCFzXILbHZ/FuOl5nKza4nysyT6Dy0x2BQGGHWEJ4VCZ7gwR1iyRhKZ0xbhbUX
         FSbmQF5CRel8O3MVnWvaihNVVoB7agN1YSkhuPwzvpxmhXyXjNi65jYwKGRi0xgCeXqp
         MGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqXDa2abgGHK75AHCzdLWPntVufgwQfP4dMEpBnLn7238g2UQXUimfnXObt7TuV1AjOMOWPz+NF57WvuLmyL8OPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQeX5Vrt5EgZopjmakgOPc03x2oFIjpd7S6HiDDKFj4yJjAcu
	sB96bZoqcXYTtqOx/RRgbWDp5LKRnZmaXEgl3NJg5Su37o/PwrRNFQbx5WxarTE=
X-Gm-Gg: ASbGncsk4FU+d9VzBCoQ90tgZ+TnyyjQkCccpvE7itoXLgCAH5bIQNd/ehsRWq6YT3Y
	/XiSwWngEwSoS59z+b//x1k2R+DVc39MJ3jQaR0ZUQGgakiiU1j9yMFT94DvGO3RoLKgOL4uFvr
	Y3NAB7mcg9Iq5n4PF59Zww/qMbP5bPJdS/iLaG5DFjjV15mSLXySsjiEsbUvaf9sb2d5iKdjJFG
	HN31SE3H9+S76Vh7JnAJytmptqGFKQX5251KewyGzL2uIOUCMtbWDM1vWufEdNeOZ/Prf8+1P3t
	LwVX+U6Q5P1wLe1+nQPOQda7iCGT/oWtLbBfBGr5dENNA7trNOroIHFbzg==
X-Google-Smtp-Source: AGHT+IEoIXCypMLW+f3nGpTp+Hb1mW2ONz6mwKYYrhr1L+YxeJUGopujnyjZCyof617/C2hEd98mUw==
X-Received: by 2002:a05:6122:d01:b0:520:60c2:3f1 with SMTP id 71dfb90a1353d-52060c22421mr517412e0c.0.1739280107159;
        Tue, 11 Feb 2025 05:21:47 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f925f702sm2062321241.0.2025.02.11.05.21.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:21:46 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5203bbb969cso581060e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:21:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsMZC9gtCp1aYw9q6UbGwDdzRyfluaCHeULNRFfkDjU8aLx5ll+TVIZ9vVx761Fo3hr5P5G10BhrknVSy+xxCKqw==@vger.kernel.org
X-Received: by 2002:a05:6122:17aa:b0:520:64ea:c482 with SMTP id
 71dfb90a1353d-52064eac76emr233986e0c.7.1739280106555; Tue, 11 Feb 2025
 05:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com> <20250207113653.21641-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250207113653.21641-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 14:21:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com>
X-Gm-Features: AWEUYZkoUsoDLuJsyWRZ3V1_6ElwTU6jqOh4qw-F_ioMxH9SEwSDFQiupPcqVfQ
Message-ID: <CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. The macro
> ICU_TSSR_TIEN(n) can be replaced with the inline logic
> BIT(field_width - 1) << (n * fieldwidth) for supporting both SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -66,7 +66,6 @@
>
>  #define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) * 8))
>  #define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PREP(0x7F, n)
> -#define ICU_TSSR_TIEN(n)                       (BIT(7) << ((n) * 8))
>
>  #define ICU_TITSR_K(tint_nr)                   ((tint_nr) / 16)
>  #define ICU_TITSR_TITSEL_N(tint_nr)            ((tint_nr) % 16)
> @@ -153,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
>         guard(raw_spinlock)(&priv->lock);
>         tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
>         if (enable)
> -               tssr |= ICU_TSSR_TIEN(tssel_n);
> +               tssr |= BIT(priv->info->field_width - 1) << (tssel_n * priv->info->field_width);

which can be shortened to:

    tssr |= BIT((tssel_n + 1) * priv->info->field_width - 1);

>         else
> -               tssr &= ~ICU_TSSR_TIEN(tssel_n);
> +               tssr &= ~(BIT(priv->info->field_width - 1) << (tssel_n * priv->info->field_width));
>         writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
>  }
>
> @@ -317,7 +316,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
>
>         titsr_k = ICU_TITSR_K(tint_nr);
>         titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
> -       tien = ICU_TSSR_TIEN(titsel_n);
> +       tien = BIT(priv->info->field_width - 1) << (titsel_n * priv->info->field_width);

This should use "tssel_n" instead of "titsel_n" as the index.
Note that this is a pre-existing bug, so you probably want to fix
that in a separate patch (and move the line up, next to the other
tssr calculations).

Given you'll be introducing more shifting in the next patch, it may
be worthwhile to store the shift value in a variable.

>
>         guard(raw_spinlock)(&priv->lock);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

