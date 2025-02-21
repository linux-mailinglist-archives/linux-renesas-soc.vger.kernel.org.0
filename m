Return-Path: <linux-renesas-soc+bounces-13504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF47A401B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 22:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F48B1899658
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 21:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916A3253B7E;
	Fri, 21 Feb 2025 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok8cpyoU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46BA253B62;
	Fri, 21 Feb 2025 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171942; cv=none; b=G5Rg9IXRp6VS3bxklhEFvwZrpbHuFhWW/9IXzIC38wjy5U3CdWdYOMpr+a5Uo9qcq89wLwZZQOcoJIY9me9aM4vj3Iruiip1xMEcaaiuEmJFOlagyxTLJVwOrfsy9foUH7+hPCMTcfimu6g0+M2aU8V796zsbuCUWAcWhOTNE2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171942; c=relaxed/simple;
	bh=7Pfl8aw3qhTmCH+E5sZnLIZAe8Zb3kp+T4MgqEHCs3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KenPhoKscoLpI3aR00v0kUotJMfs8/bm+VrZgINWfUCkpUALKV3bKY5j4f7wWNHedKxtWhAM2tYvtHQ04rpfO+YZ+qnKKe8XXn44mfT0gqwQ1IVAaXFtzdiLVAeiWxJMac/BEGvun0izYnIO/nPuK3Go4nLfwj3BDoQBcv96NUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok8cpyoU; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86718541914so1899014241.1;
        Fri, 21 Feb 2025 13:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740171939; x=1740776739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akxiV5AyxUKHb/z70st9KPeMZlHgKTT5ElAUCHcsWo0=;
        b=Ok8cpyoU1askTivPLdAXpd92QhvnRHCbhkBcVrsdJwA/DKG3FHsBoeshjsNHKdRQ26
         6MLafAjkdymFStvlw0hZSzZ6zw1E5UFf64AfOZVYSHBI1/lTr1ToS97ERJGX8P8jQXGN
         FYp7a27ZavXNKMPiZp8E9hNp8m4CV7azv6KVa/GbPHf0P8HK9koT/j5v7wbY0brjbbyi
         aZVgESfU1jNp+htaEjpFoWkxqvGA8ayO/2/v+tjAMZB6OAnRTeVdjxoXahwt+kVnvLdM
         kp0hVTglTrt70DapAndE65ec9QLmMHoa3DSIYG1haGCIDQHBQdF798iIzhsj3VWgFvD5
         +r8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740171939; x=1740776739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akxiV5AyxUKHb/z70st9KPeMZlHgKTT5ElAUCHcsWo0=;
        b=gkSJPwv0JTZLs+OokCewDtHxPtDmkFLmvsjszlubiJPEDOSDRrV128/J4dxEjPrS6M
         CXoWrxgzBfvbT3WtJ7HbJwvF7gfWtGVhcGdm+QPM3u0N6xZqpSRjMQhVyjDEjIgLnNUq
         PwzJUatLpphp+cZSSJkNuSKB1e7T+0HrIyNJi+n9OfrzoDJrBRlzD66N3CI+L62ZZfvd
         r6ddC+D56xDLBI1d9zpPkqO0pWyiTnByjqOet6Owr7FZZvqy30VFNBedWSlgi7j27Qc6
         mdwBhrv4FKRbgBOk2bPKP41Ix6YvQlEpXIXOb0CnhA1w6MuXs+Kyp/38xqYR5iMcJm6h
         oHOA==
X-Forwarded-Encrypted: i=1; AJvYcCVd1zVRhVON8gPJWDZYpK63UCNkNTUe3OhvXerjdpRQhqY7T3M1CkpKPh2Ie8326vI3fq0NLkOPA9Aebiw=@vger.kernel.org, AJvYcCXsgMQh5/9JQilg+TWOjt3VwsQCqo5ziGEkaFrt2qy6bjKNefWh0Eet1plMD3dJxL3QOFEx4UAhTe5hSLVgY5mCpSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxlxT+h5j5pVjVsMjocTe0+4jdVQEdWJubM5VHBlPuFP/E4Ut
	+ABeAV+8ZApHxdxn6YQfxrmvdzJ2KS+Ko7ClLDft0345qXtOcezshwCm5NBwogLxmU7AgFXlSHg
	kX5f7ktdhLE3NwWwYgEoy5B1/p9mHn2GLbms9dg==
X-Gm-Gg: ASbGncuLNVhshxzjdo1WCiGDDO+DrNcS8k10J5ZJ419YD1JnDzP/at5jAKkKyT0orT0
	G9TX2KmFk/q0NNSvLRzRn6meDveppv2pLq55gzsOHMoJP4OLsdnLvqfdiCtxnA4NaQNXgoXznBa
	QqsbKCNAaFNpFn+4hEl2ALLn+6QdStD+tn1lat9a/W
X-Google-Smtp-Source: AGHT+IFIdI1bnw9/RHrswWgsrCDZp1nad+fSvNSGwNcyjHcOwcCpFAxA0r4vDk14J4ClfkeOe4UOyy7mit6/46Iac4I=
X-Received: by 2002:a05:6122:4081:b0:51e:ffd1:67f3 with SMTP id
 71dfb90a1353d-521eed1ccfbmr2730401e0c.7.1740171939443; Fri, 21 Feb 2025
 13:05:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com> <20250220150110.738619-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250220150110.738619-5-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Feb 2025 21:05:11 +0000
X-Gm-Features: AWEUYZk5EDyEfXlYmI03ntsnnaka3hY8V0qXYeaBjMmkypatNv5sddUTfysheb0
Message-ID: <CA+V-a8sHjVri+5VGTQo8yNrZ8Qko5gG+7hc0qwTTpr0Do642Fw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req_ack()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 3:06=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
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
> v1->v2:
> * Improved macros.
> * Shared new macros for minimum values.
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c       | 56 +++++++++++++++++++++++
>  include/linux/irqchip/irq-renesas-rzv2h.h | 26 +++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 include/linux/irqchip/irq-renesas-rzv2h.h
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index fe2d29e91026..a8e9feda73b0 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -15,6 +15,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqchip/irq-renesas-rzv2h.h>
>  #include <linux/irqdomain.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -41,6 +42,8 @@
>  #define ICU_TSCLR                              0x24
>  #define ICU_TITSR(k)                           (0x28 + (k) * 4)
>  #define ICU_TSSR(k)                            (0x30 + (k) * 4)
> +#define ICU_DMkSELy(k, y)                      (0x420 + (k) * 0x20 + (y)=
 * 4)
> +#define ICU_DMACKSELk(k)                       (0x500 + (k) * 4)
>
>  /* NMI */
>  #define ICU_NMI_EDGE_FALLING                   0
> @@ -80,6 +83,19 @@
>  #define ICU_TINT_EXTRACT_GPIOINT(x)            FIELD_GET(GENMASK(31, 16)=
, (x))
>  #define ICU_PB5_TINT                           0x55
>
> +/* DMAC */
> +#define ICU_DMAC_DkRQ_SEL_MASK                 GENMASK(9, 0)
> +
> +#define ICU_DMAC_DMAREQ_SHIFT(up)              ((up) * 16)
> +#define ICU_DMAC_DMAREQ_MASK(up)               (ICU_DMAC_DkRQ_SEL_MASK \
> +                                                << ICU_DMAC_DMAREQ_SHIFT=
(up))
> +#define ICU_DMAC_PREP_DMAREQ(sel, up)          (FIELD_PREP(ICU_DMAC_DkRQ=
_SEL_MASK, (sel)) \
> +                                                << ICU_DMAC_DMAREQ_SHIFT=
(up))
> +
> +#define ICU_DMAC_DACK_SEL_SHIFT(field_no)      ((field_no) * 8)
> +#define ICU_DMAC_DACK_SEL_MASK(field_no)       (GENMASK(6, 0) << ICU_DMA=
C_DACK_SEL_SHIFT(field_no))
> +#define ICU_DMAC_PREP_DACK_SEL(sel, field_no)  ((sel) << ICU_DMAC_DACK_S=
EL_SHIFT(field_no))
> +
>  /**
>   * struct rzv2h_icu_priv - Interrupt Control Unit controller private dat=
a structure.
>   * @base:      Controller's base address
> @@ -94,6 +110,45 @@ struct rzv2h_icu_priv {
>         raw_spinlock_t                  lock;
>  };
>
> +void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 =
dmac_index, u8 dmac_channel,
> +                                   u16 req_no, u8 ack_no)
> +{
> +       struct rzv2h_icu_priv *priv =3D platform_get_drvdata(icu_dev);
> +       u32 icu_dmackselk, dmaack, dmaack_mask;
> +       u32 icu_dmksely, dmareq, dmareq_mask;
> +       u8 k, field_no;
> +       u8 y, upper;
> +
> +       if (req_no >=3D RZV2H_ICU_DMAC_REQ_NO_MIN_FIX_OUTPUT)
> +               req_no =3D RZV2H_ICU_DMAC_REQ_NO_DEFAULT;
> +
> +       if (ack_no >=3D RZV2H_ICU_DMAC_ACK_NO_MIN_FIX_OUTPUT)
> +               ack_no =3D RZV2H_ICU_DMAC_ACK_NO_DEFAULT;
> +
> +       y =3D dmac_channel / 2;
> +       upper =3D dmac_channel % 2;
> +
> +       dmareq =3D ICU_DMAC_PREP_DMAREQ(req_no, upper);
> +       dmareq_mask =3D ICU_DMAC_DMAREQ_MASK(upper);
> +
> +       k  =3D ack_no / 4;
> +       field_no =3D ack_no % 4;
> +
> +       dmaack_mask =3D ICU_DMAC_DACK_SEL_MASK(field_no);
> +       dmaack =3D ICU_DMAC_PREP_DACK_SEL(ack_no, field_no);
> +
> +       guard(raw_spinlock_irqsave)(&priv->lock);
> +
> +       icu_dmksely =3D readl(priv->base + ICU_DMkSELy(dmac_index, y));
> +       icu_dmksely =3D (icu_dmksely & ~dmareq_mask) | dmareq;
> +       writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
> +
> +       icu_dmackselk =3D readl(priv->base + ICU_DMACKSELk(k));
> +       icu_dmackselk =3D (icu_dmackselk & ~dmaack_mask) | dmaack;
> +       writel(icu_dmackselk, priv->base + ICU_DMACKSELk(k));
> +}
> +EXPORT_SYMBOL_GPL(rzv2h_icu_register_dma_req_ack);
> +
>  static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *d=
ata)
>  {
>         return data->domain->host_data;
> @@ -446,6 +501,7 @@ static int rzv2h_icu_init(struct device_node *node, s=
truct device_node *parent)
>                 goto put_dev;
>         }
>
> +       platform_set_drvdata(pdev, rzv2h_icu_data);
>         rzv2h_icu_data->irqchip =3D &rzv2h_icu_chip;
>
>         rzv2h_icu_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_n=
ode, 0, NULL);
> diff --git a/include/linux/irqchip/irq-renesas-rzv2h.h b/include/linux/ir=
qchip/irq-renesas-rzv2h.h
> new file mode 100644
> index 000000000000..d06e01bf969b
> --- /dev/null
> +++ b/include/linux/irqchip/irq-renesas-rzv2h.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) Interrupt Control Unit (ICU)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation.
> + */
> +
> +#ifndef __LINUX_IRQ_RENESAS_RZV2H
> +#define __LINUX_IRQ_RENESAS_RZV2H
> +
> +#include <linux/platform_device.h>
> +
> +#define RZV2H_ICU_DMAC_REQ_NO_DEFAULT          0x3ff
> +#define RZV2H_ICU_DMAC_ACK_NO_DEFAULT          0x7f
> +#define RZV2H_ICU_DMAC_REQ_NO_MIN_FIX_OUTPUT   0x1b5
> +#define RZV2H_ICU_DMAC_ACK_NO_MIN_FIX_OUTPUT   0x50
> +
> +#ifdef CONFIG_RENESAS_RZV2H_ICU
> +void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 =
dmac_index, u8 dmac_channel,
> +                                   u16 req_no, u8 ack_no);
> +#else
> +static inline void rzv2h_icu_register_dma_req_ack(struct platform_device=
 *icu_dev, u8 dmac_index,
> +                                                 u8 dmac_channel, u16 re=
q_no, u8 ack_no) { }
> +#endif
> +
> +#endif
> --
> 2.34.1
>
>

