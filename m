Return-Path: <linux-renesas-soc+bounces-13053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C1A30F52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 16:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577A418833E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79D4250C16;
	Tue, 11 Feb 2025 15:12:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95D3D69;
	Tue, 11 Feb 2025 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286735; cv=none; b=fIiwNQh0geCffpqVI0CNqBbPYwy1T5bMZCkExKBUZ81eP9C/v5O539fMJSPozOplF2b6oPZfEjV52dhXMAkTLd29N4ebeVR7GpEpur84t4IoVxsFeUQ+6IKUlXbxJylR8ewPKc/blBQiloeYupgmXwUG5tuNyjZHQMM54ogp9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286735; c=relaxed/simple;
	bh=WrAeQyT0w83FAwh+/gKyIZZw5fW1VdOL2NmaproJR0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIesWKAQfFb8rOH1zRl+m3uXA6D0BYMQHlPw9StC2Nkoeo2h5pOH9w5F2ZZ2Mm81anjjP89r3OXnk4IY/UsWACrdz0O8p/cfqMZrz2zEiPZlJ3s4X1TvY+JIUq3io/nFYvD/n556/r54V7F5WC0TMQCVkH8OlytsdKisPNSiCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c04e5018dbso272510785a.0;
        Tue, 11 Feb 2025 07:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286731; x=1739891531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLckW6Z2HLaNJS6BSwb6xhcxk6omd8iTniBF4N/VpSY=;
        b=IWe1S2VvZLa56S09WoQeyrqahx0VwfwkMAvxVIylamjLDO6Wt9bWY/VSFbwsIX4KZY
         dehmX1dQZ2InAFmQFP3jRVcWzBcsYB7Hf33MsrmQxqWt0QOb4ODy1/IrsiscpV1eO59e
         XZKAWLBF0M1JYxhvy/7oI6gZXW6SHSOWskF68utsTAhDlN5YIwRLemZFt+cJLov13ang
         RTID6KLbi1fA1KiLDHLGcyLJ+qeFxoAG0SR+W1SrvEWHIHyMx2Eksho7I0qm8Zs/O6cZ
         0dtbhENd65is0fmnoAoTU1g4obdtuMqqcwGtOewgQE/0B//rXBTEoBptT1uapu1SmFpm
         LoOg==
X-Forwarded-Encrypted: i=1; AJvYcCUMVh8IuzNkEuCNUHZ7tisIhyN1L+UsdSZx1fKos3RpjnO7b2k2bwBGs42KpvfjTR/w76n0/riyhfABnGFI6f/FaJ0=@vger.kernel.org, AJvYcCWC6piQTR25pU3FOrApc204/G7lztU01ZIMXBzkl24Np/fjkh1P2+OyFOQ8QHPHG1qI2bIJFxeYSXYaRy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBke/R7g8dP2QP5DG6J7TeTR/y9JdeE6tgFKidMiF1ibcjx2lz
	amBavUSZG5BKQ6nh0+WO/nyLyyADJQTrdsZ4ADPhqQc1uSDb8hkPwYdja4X/jEM=
X-Gm-Gg: ASbGncuf2aAGYBniDwgag9d1tlFNFqwTwPotY+NecR2MjIl0UKCF0fU8A1XY7xF/UKJ
	nKimvd3HTAOaEmFUcwc4JJxb4mnAhABnpGtqKNfVtj52av1OoLpaZdRvQnmmK7xyz0KiS3aYBJZ
	3cG0PDkKaYVIsPzKZpOEBDL4pyBtZdedgCmibZmb4B/lFvwbMVvV2A731j6d8gLUSswZ7ru/8BL
	8i8KdAfKG2XGej59EplyVjWQXVYUr3+exFN3oyU7hFfNW+4j+XNgJQHX64oiE4pZVV6YzKka4Tx
	2m5vyYBKDc5RHT7I3jPSwKGRPg9ESE5E/wmOo46FbBAOJjuMe83p+jI4Ww==
X-Google-Smtp-Source: AGHT+IH0Stu3DoSMkTHfDJn+WsAwuSlPDjeidovHgCXpFdz5Uk1NKLkH6Te5w0h9gwh+AFbkn30mLg==
X-Received: by 2002:ac8:5e4c:0:b0:467:5cd2:4001 with SMTP id d75a77b69052e-471a124e378mr38294811cf.3.1739286731224;
        Tue, 11 Feb 2025 07:12:11 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4718ae2d381sm31554241cf.78.2025.02.11.07.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:12:11 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47192f4bc53so20474231cf.1;
        Tue, 11 Feb 2025 07:12:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVip3SKk09hVxLA+4m3/LjBp8+a67+rHkIUZAeC8Kd09UpokD7ZYmGUBmty+dLOXTvn9Ig4/nAh6/cUgEQw+8ZLmZM=@vger.kernel.org, AJvYcCXBlD8X/LEUtxhaNyA1B+e/970v9W556VM3qfgLkGY8pg2TgKAnrOvQtViLbWn0gCT8N1v5X7c5UEXwSys=@vger.kernel.org
X-Received: by 2002:a05:622a:5a8c:b0:467:517b:90ca with SMTP id
 d75a77b69052e-471a141a8b9mr56032561cf.21.1739286730191; Tue, 11 Feb 2025
 07:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:11:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrg+gqJsg2LaBkzaLPzh4nZefqVdqH2rLhCEGQDya88g@mail.gmail.com>
X-Gm-Features: AWEUYZnqJpxPq9YVK6hy5fgwSS8z_kXjTuxM2kX5zK_uIrxN5olJ7CPMxaZkObw
Message-ID: <CAMuHMdUrg+gqJsg2LaBkzaLPzh4nZefqVdqH2rLhCEGQDya88g@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Markus Elfring <elfring@users.sourceforge.net>, 
	Markus Elfring <Markus.Elfring@web.de>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

On Fri, 11 Oct 2024 at 19:20, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> rzg2l_irqc_common_init calls of_find_device_by_node, but the
> corresponding put_device call is missing.
> This also gets reported by make coccicheck.
>
> Make use of the cleanup interfaces from cleanup.h to call into
> __free_put_device (which in turn calls into put_device) when
> leaving function rzg2l_irqc_common_init and variable "dev" goes
> out of scope.
>
> Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
> completes successfully, therefore assign NULL to "dev" to prevent
> __free_put_device from calling into put_device within the successful
> path.
>
> "make coccicheck" will still complain about missing put_device calls,
> but those are false positives now.
>
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Revisiting commit d038109ac1c6bf61 ("irqchip/renesas-rzg2l: Fix missing
put_device")...

> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> @@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
>  static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *parent,
>                                   const struct irq_chip *irq_chip)
>  {
> +       struct platform_device *pdev = of_find_device_by_node(node);
> +       struct device *dev __free(put_device) = pdev ? &pdev->dev : NULL;

Now there is a variable holding "&pdev->dev", all below references
to the latter can be replaced by "dev"...

>         struct irq_domain *irq_domain, *parent_domain;
> -       struct platform_device *pdev;
>         struct reset_control *resetn;
>         int ret;
>
> -       pdev = of_find_device_by_node(node);
>         if (!pdev)
>                 return -ENODEV;
>
> @@ -591,6 +592,17 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
>
>         register_syscore_ops(&rzg2l_irqc_syscore_ops);
>
> +       /*
> +        * Prevent the cleanup function from invoking put_device by assigning
> +        * NULL to dev.
> +        *
> +        * make coccicheck will complain about missing put_device calls, but
> +        * those are false positives, as dev will be automatically "put" via
> +        * __free_put_device on the failing path.
> +        * On the successful path we don't actually want to "put" dev.
> +        */
> +       dev = NULL;
> +
>         return 0;

Can't the above be replaced by

    no_free_ptr(dev);

? Or would Coccinelle still complain?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

