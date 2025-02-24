Return-Path: <linux-renesas-soc+bounces-13571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F5A41FD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8ECB3B3810
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45838219311;
	Mon, 24 Feb 2025 12:59:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6F10F2;
	Mon, 24 Feb 2025 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401975; cv=none; b=WlYXL7j05ftsQavUiiW0phvtRrQSMm3MIWALwg3ZXyIJ4wG26UBh2Yi99sav54GOc/PJNTXYfZ9Vwj8QfXLCquPcdbjs5rXJlwRDxtZQKzgZybJmgrWjq4VcGkBGtIkKfuEa1mvKUOHW0q0ryhY41/Tn37dsSTsGKtD23v+JAyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401975; c=relaxed/simple;
	bh=cmw+oD3Yrv54lHLTwZhEC54nKJJHqCcOOFHA0zyda1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqJHwnWJPzJNKQNXI8CjyBeZEYMbLCkFiQH42oRu3DqlEhUGvLrNYXBHR9PhyKv3LcQ+TOW9TtC96pLB9q936/udH2Gx45XQabYOd3BNjJs/LYffZPSf0eCb/xakFPeFvXqog3Y8O/OJCd1PjU1sqDcS6QbnkFnTiTedOYpmEy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb18130f9so1005565e0c.3;
        Mon, 24 Feb 2025 04:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740401972; x=1741006772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTQnMpdUnv7pSZnMJlyG0p78QjlYP/5DALh1843MbRw=;
        b=nkzP5xTFkmrzBDJKqxXJ+7o/MuP4knon17xcg+jF6FmStv+SqoHSgWWobeLqiBvDny
         MnJXgSOgku9/b0tDIrRwIfdXRx+zugB1Db75aJMDE8RUtH9b6w5hTvYbBfHNzBnncV9Y
         4CeyJXsXq1cmrEFFcshKlT5ire89eSH8LjvBV6G4ity0/1pW6oIHeUNkf5SkqBnYtEjX
         iyz8yjHB7K13+Jvhtz6leE8FdRnLrSmX6tMg0+JvN0r/YvQZb4rIBpOPHR71SqjLQZEb
         RSoIZstqFdhrENjOXyGVBcLYANJAzivNdQ/WgC8g1wt25Jl/9h+afyyUED/WQ+/bo1Ti
         jPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQXc/CqTKEqI/K5hPG7rBm9Ik8WjCsrLlPE+bCRwkJ1GSqVlaklVSGP0scIS9WrTFudWaCTlem0G+vSU=@vger.kernel.org, AJvYcCWLGxago/WLoAn7yiw8Qf1g2YoCP1HygHqt31sXx0Rza1K4Z7ByS18l162BAiSUrmHliiTfZJqDK5FILRDSQ7ARYCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEajVQgKNlWDoM8X45PkSQxIAdSIBsjyEQuiUA8uNL72WBzXhX
	NiVownhecvrzXHPbZKFHiPngL0ryUgaPuhjjsen5c02lXrLcqemZiKx842mJVvc=
X-Gm-Gg: ASbGnctlSf+qKQ8CmMP2uD/KaBVggtSNhkjJggdM1kjz70a7X//auFYz1WGMRV3GFKE
	lCvCFX2ah1iPbYKZu+ANDUPd95iOtVNZaYxHq0Q24hLKtsCrmHQB9apznW25AwiMcIsmFghJ1S9
	nsP3yGsRTMDHX0GQs+3lu6z4Fj/Y+2aXXYLvoidjW+7DpQWBKCdNd0lG+zh+fIhZDbXKcFbVAV2
	1yV1jFsTwilvdr45QP8dtLckRI/xcv2tFqmNV461F4lrP/beWbE6jHsLRBAunsplZFNWP/+lyzd
	8gN1cCHGPTAdU2N54brVZpiX1G408/cmcG5I1kC0EqwnIGMkL+Bg0fqqbB77/U5A
X-Google-Smtp-Source: AGHT+IHtQxlMgKNqiDW9ry1rSEYERhBrcvYD8G8EaKMI/kC4VAOv/SlEGKhHsL0Sy6w67oACdjgdpQ==
X-Received: by 2002:a05:6122:3c94:b0:518:791a:3462 with SMTP id 71dfb90a1353d-521ee45c3e6mr4688801e0c.9.1740401971866;
        Mon, 24 Feb 2025 04:59:31 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520be32e8c0sm3050262e0c.38.2025.02.24.04.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 04:59:31 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4be5033a2cbso1860863137.1;
        Mon, 24 Feb 2025 04:59:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9QfnnCBxC0hTZ3CMDefDfWZD/Re2VDy+Ce7unR8I0zGE+RVAt70SThWD3qNlNeNXi5KJVvozf4vVl6z8=@vger.kernel.org, AJvYcCWv1VpQxumu4cgURifjkubedzbWtZ7ihRy/Fuc68yq96POZS6ThzsbzhWE1F5aql5dGBFxT9mnLGmD0tGqPp7qOulM=@vger.kernel.org
X-Received: by 2002:a05:6102:3588:b0:4ba:9abf:800f with SMTP id
 ada2fe7eead31-4bfc0086088mr5446644137.6.1740401971451; Mon, 24 Feb 2025
 04:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com> <20250220150110.738619-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250220150110.738619-5-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 13:59:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpNJiaGf3OTaSjjh4SA+nXODQj38P1-M0gG2mnxC_zLw@mail.gmail.com>
X-Gm-Features: AWEUYZmF1ZoTHCf6CoUcoKQLNfCs0at94EyuNhWx6ksve-l25vhlA8AXwydxfCc
Message-ID: <CAMuHMdUpNJiaGf3OTaSjjh4SA+nXODQj38P1-M0gG2mnxC_zLw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req_ack()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

On Thu, 20 Feb 2025 at 16:01, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> For DMA transfers, a request number and an ack number must be
> registered with the ICU, which means that the DMAC driver has
> to be able to instruct the ICU driver with the registration of
> such ids.
>
> Export rzv2h_icu_register_dma_req_ack() so that the DMA driver
> can register both ids in one go.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> v3->v4:
> * No change.
> v2->v3:
> * Replaced rzv2h_icu_register_dma_req_ack with
>   rzv2h_icu_register_dma_req_ack() in changelog.
> * Added dummy for rzv2h_icu_register_dma_req_ack().
> * Added Rb Thomas.

Thanks for the update!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c

> @@ -94,6 +110,45 @@ struct rzv2h_icu_priv {
>         raw_spinlock_t                  lock;
>  };
>
> +void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
> +                                   u16 req_no, u8 ack_no)
> +{
> +       struct rzv2h_icu_priv *priv = platform_get_drvdata(icu_dev);
> +       u32 icu_dmackselk, dmaack, dmaack_mask;
> +       u32 icu_dmksely, dmareq, dmareq_mask;
> +       u8 k, field_no;
> +       u8 y, upper;
> +
> +       if (req_no >= RZV2H_ICU_DMAC_REQ_NO_MIN_FIX_OUTPUT)
> +               req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT;

What is the purpose of this check?
The hardware register field size is 10 bits, so I think it is better
to just limit it to 0x3ff.
Checking for RZV2H_ICU_DMAC_REQ_NO_MIN_FIX_OUTPUT means you will have to
update this check when a new SoC supports higher values than 0x1b5.

> +
> +       if (ack_no >= RZV2H_ICU_DMAC_ACK_NO_MIN_FIX_OUTPUT)
> +               ack_no = RZV2H_ICU_DMAC_ACK_NO_DEFAULT;

What is the purpose of this check?
There are only 23 DMACKSELk registers, so using
RZV2H_ICU_DMAC_ACK_NO_DEFAULT = 0x7f will write beyond the last
register below. And drivers/dma/sh/rz-dmac.c does call this
function with req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT and ack_no =
RZV2H_ICU_DMAC_ACK_NO_DEFAULT...

> +
> +       y = dmac_channel / 2;
> +       upper = dmac_channel % 2;
> +
> +       dmareq = ICU_DMAC_PREP_DMAREQ(req_no, upper);
> +       dmareq_mask = ICU_DMAC_DMAREQ_MASK(upper);
> +
> +       k  = ack_no / 4;
> +       field_no = ack_no % 4;
> +
> +       dmaack_mask = ICU_DMAC_DACK_SEL_MASK(field_no);
> +       dmaack = ICU_DMAC_PREP_DACK_SEL(ack_no, field_no);
> +
> +       guard(raw_spinlock_irqsave)(&priv->lock);
> +
> +       icu_dmksely = readl(priv->base + ICU_DMkSELy(dmac_index, y));
> +       icu_dmksely = (icu_dmksely & ~dmareq_mask) | dmareq;
> +       writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
> +
> +       icu_dmackselk = readl(priv->base + ICU_DMACKSELk(k));
> +       icu_dmackselk = (icu_dmackselk & ~dmaack_mask) | dmaack;
> +       writel(icu_dmackselk, priv->base + ICU_DMACKSELk(k));
> +}
> +EXPORT_SYMBOL_GPL(rzv2h_icu_register_dma_req_ack);
> +
>  static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
>  {
>         return data->domain->host_data;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

