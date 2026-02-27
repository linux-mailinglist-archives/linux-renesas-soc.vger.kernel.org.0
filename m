Return-Path: <linux-renesas-soc+bounces-28515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDy3HuJxoWm6swQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:28:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D53921B6010
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B84B3004F58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07B83B8BD8;
	Fri, 27 Feb 2026 10:28:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A2936C0CE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188127; cv=none; b=A9DhCELYn+2z87liS8muvT2bMak6dBFJ96VfueIfc5N6qcpvXRTjTwQ1LiA/uXKManfKvL+0c90TYcQuRqgRsPLEKcw0WOVtnX61ArEgH+ezBb2m70DX89n17q8Aq/p8WBRe+I4dm54T/Gv5uexk/OM2e/3Aje1h626/KwOJD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188127; c=relaxed/simple;
	bh=/VtSt+MWX9wbKnqeRpjnPfu1cZfxAGSGozIUuU7S3HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7+qhLgRwfrWwK12YzrD78D3p6HTirQo1dYHryCKaZ/AkvUSY03N2Pp9L0F/54aLOo4Ed7/SMlOfbdz/55BScs2X0H+/U7s/3VfXKhYcUUOrMXrGtD3a2L8fvOk8yTbXoIRZR3rbK/+18V/aQv3Fu4+9XR9nJ+CQmXFRC8UBOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8395a68bso889931e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 02:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188125; x=1772792925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBYpjvacDqnBBB334ORhbaa0ojdywybiSfgdzKCudj0=;
        b=H15po1vN6ZfZ6g0hhKveWhv/V2aMHK5e8zDNCiK8ysipTW2k3tLRNb7AkQGkzHSZMW
         X7SHb7kx1i498uxGj69RNlbLOrlT2X1B/UYvNA9Xhx9WLqf48lQPbSbJwro0qV2DFEeT
         6xjqMrkfpV1mh/Q1CkP5SQMQR3Y8mp9aIJtM24ar78B2lMh5vLzSvEiGBCfXxjVhL9yt
         KQ1c/DBmGidQ+Grdy1os362jLZ8lr/llJxfNrSoiPrbyodT0ZcJ+biEY6lNM7Co2M66E
         m27P7f0uEjn0tgOsHmKSh33IhEmnUzhm9SXu6CLE/m4E9j9G6oEuwTYm4zvYCST4gV8a
         oV9A==
X-Forwarded-Encrypted: i=1; AJvYcCVi4rMqTQmy6ORu1KC4kOFI4Qw/hqwZsnjRZSrJ0Sc3pJug8JOYxTBJ/pLkjbmCt9snBM9gmTBrKPsrt4aE+YUSHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYh6VHtK0lzGAF/Ta+c8RLRRxYjah1elvc7rz7ICTaQ/r1kk8
	yog8TvoT5EiRYsIkL0+wayDKMAv9nqvRXlGkONAmJ+pAGAcOTbcGndSplSkE9XI4FFY=
X-Gm-Gg: ATEYQzxw30jcftNIduSq8hTWVf/fjtXS97HpJeU6J8+kDI/3qpEdIpdZgEj1rk2qBnY
	HviU9HD2XO0V20TgQddTt5+bqUbfgJrJlBgcDRZw0WyNtENoIO5FalwW6yJ7QPC+02LN7RWQgNN
	SEHKWYxZVQNmOBPHFiBCEKcrzsgp00FCfNvqzSg/Z5KiO9GBjL7nLPiO+wxZKPyvfjXFSOtExpO
	lDIdNKU6GNUGKdxKGMUI4HTArf3lKLzOYie0pdjZ9qM4WXBiOLjuHD7fWV2E9aJzoEpgkk0nzlT
	7LTm0vuMqoLe7ZvXgBSp/sWdmXiYwhp0tkR4Kxep6MGATApbydL2VjHvZULMntn5rhUTl4xoA7q
	cL+w607ZrrUfBZIAXTgjWBCW7Sh6LH4hZk1XHgw6MS5cqbniKp0J0x9o1uHPW2i+OvBZ4fC1pMy
	OtEzx5aZIduxCYAQQ3pCiEJQFRBzOkC9dbEMR2sDfk2kXd3Qv+1VmHtV28xQUJvd/J
X-Received: by 2002:a05:6122:829f:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56aa0a1826emr1285644e0c.4.1772188124639;
        Fri, 27 Feb 2026 02:28:44 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm5594242e0c.18.2026.02.27.02.28.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:28:44 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8dce7235so640824e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 02:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAddV2BcRD2+dc1JD/+NDsk55Re9LAVFCCup8bDScYe/gdFYRbC8nP9FeCcdrNCrk54AQe/3ngClUJiIoXnij+Lw==@vger.kernel.org
X-Received: by 2002:a05:6102:1629:b0:5fe:b030:ebcb with SMTP id
 ada2fe7eead31-5ff324b4b9dmr1032184137.26.1772188123983; Fri, 27 Feb 2026
 02:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260224175618.3160270-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260224175618.3160270-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 11:28:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUD-YoEV9qk7Ghr4AwpnOUyL+kTd0TRXphuzty5HdwHOg@mail.gmail.com>
X-Gm-Features: AaiRm51amG54i7xvYieU7vF8UKT5STnJp6bNkyiiPxLp9i33uM_zJh6JbVjVDZs
Message-ID: <CAMuHMdUD-YoEV9qk7Ghr4AwpnOUyL+kTd0TRXphuzty5HdwHOg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] irqchip/renesas-rzv2h: Replace single irq_chip
 with per-region irq_chip instances
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28515-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: D53921B6010
X-Rspamd-Action: no action

Hi Prabhakar,

On Tue, 24 Feb 2026 at 19:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace the single rzv2h_icu_chip and its dispatcher callbacks with
> dedicated irq_chip instances for each interrupt region: NMI, IRQ, and
> TINT.
>
> Move the irqd_is_level_type() check ahead of the scoped_guard in
> rzv2h_icu_tint_eoi() and rzv2h_icu_irq_eoi() to avoid acquiring the
> spinlock unnecessarily for level-type interrupts.
>
> Drop the ICU_TINT_START guard from rzv2h_tint_irq_endisable() since it
> is now only reachable via the TINT chip path.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -169,32 +169,50 @@ static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
>         return data->domain->host_data;
>  }
>
> -static void rzv2h_icu_eoi(struct irq_data *d)
> +static void rzv2h_icu_tint_eoi(struct irq_data *d)
>  {
>         struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
>         unsigned int hw_irq = irqd_to_hwirq(d);
>         unsigned int tintirq_nr;
>         u32 bit;
>
> -       scoped_guard(raw_spinlock, &priv->lock) {
> -               if (hw_irq >= ICU_TINT_START) {
> -                       tintirq_nr = hw_irq - ICU_TINT_START;
> -                       bit = BIT(tintirq_nr);
> -                       if (!irqd_is_level_type(d))
> -                               writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
> -               } else if (hw_irq >= ICU_IRQ_START) {
> -                       tintirq_nr = hw_irq - ICU_IRQ_START;
> -                       bit = BIT(tintirq_nr);
> -                       if (!irqd_is_level_type(d))
> -                               writel_relaxed(bit, priv->base + ICU_ISCLR);
> -               } else {
> -                       writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> -               }
> +       if (!irqd_is_level_type(d)) {
> +               tintirq_nr = hw_irq - ICU_TINT_START;
> +               bit = BIT(tintirq_nr);
> +               scoped_guard(raw_spinlock, &priv->lock)
> +                       writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);

With the big switch() decoupled from the scoped_guard(), the code
becomes easier to read. Do you actually need the scoped_guard()?
The write is not RMW, but just setting a single bit.

>         }
>
>         irq_chip_eoi_parent(d);
>  }
>
> +static void rzv2h_icu_irq_eoi(struct irq_data *d)
> +{
> +       struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
> +       unsigned int hw_irq = irqd_to_hwirq(d);
> +       unsigned int tintirq_nr;
> +       u32 bit;
> +
> +       if (!irqd_is_level_type(d)) {
> +               tintirq_nr = hw_irq - ICU_IRQ_START;
> +               bit = BIT(tintirq_nr);
> +               scoped_guard(raw_spinlock, &priv->lock)
> +                       writel_relaxed(bit, priv->base + ICU_ISCLR);

Likewise.

> +       }
> +
> +       irq_chip_eoi_parent(d);
> +}
> +
> +static void rzv2h_icu_nmi_eoi(struct irq_data *d)
> +{
> +       struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
> +
> +       scoped_guard(raw_spinlock, &priv->lock)
> +               writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);

Likewise.

> +
> +       irq_chip_eoi_parent(d);
> +}
> +
>  static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
>  {
>         struct rzv2h_icu_priv *priv = irq_data_to_priv(d);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

