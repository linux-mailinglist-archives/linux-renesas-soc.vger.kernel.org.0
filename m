Return-Path: <linux-renesas-soc+bounces-15656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD04A82286
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516B01B67CC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C7625D542;
	Wed,  9 Apr 2025 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7Y019Rd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1B252905;
	Wed,  9 Apr 2025 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195378; cv=none; b=m9d2JRyLDbveXSt87LfntJ5yXYkQFk5cLROswdtnsu7Zkl56xh3qjb7MPJmDSiC4tYdDhu67Dm0ZH+DcSym6TM+JXSIopGPWPRDNi4yaJG+7pcsyaATzfIYfLUWC3F7h7IO5TUquMHXfb0KaTRH65GOjuyRX7ULMP08BFb1YJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195378; c=relaxed/simple;
	bh=6CQFubr4+je96rCNMgjaAeTgjXmqMGkxOMH/uufy7gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isZvUEbC/dLPgI6PDFR+6ujK8Ub6CxkqxYblX+6Nv6ChwKJ0Tb+LDy7M4O8eff96ylrOu44AX3iHZXA9IqDQYhCuvx6SAlBs/2arTHHM/xRJpbnB92GZ1ZFC9cUFxv28GsHF3W9L4ZRCORhsLSfBl7DdqRZ0deTfmz6n5JuhFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7Y019Rd; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2866114e0c.2;
        Wed, 09 Apr 2025 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744195375; x=1744800175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbRSxw1byQg1pgd9qzKEpHjIHre9QD4xsag0B3LOMro=;
        b=j7Y019RdtQzmK57Am8f05bJrLMewqlJ0NtdlndNCvp9aO8QyrUtfdFebcdtWJIWHuH
         gkqr8OEhBud8C5D+W8HdVqRijCatG2H5hi4zTrQqX7KYrued1Xi+YV/7SS7aFMKaJPP7
         GUwFO5aUc99LeEZzhuobyFBHie8vOP2HgQ975j0QHQBXUgfgJl+YB6X/63C1RgJptNDH
         1imKqP96LWnhXhNRw02UbeZ4qEPVZTgjB6lhVhgHZDtOlMTmpGQHKqmSMOV2I4lHzMzN
         PzCSyW8DGrEmRWVBnU2U6na3FgWU2DjNsFwel0sbpR+JplKkWTRxojy7byy6pUuZJnz+
         w0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195375; x=1744800175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbRSxw1byQg1pgd9qzKEpHjIHre9QD4xsag0B3LOMro=;
        b=L0zBiwjOc8cgj6lY0IzaZW+MliBjYeWyoXXnTr2Jjbi0jL5Y0eHJK2OqmSQ3MBykmE
         +vK0SW+rSDt9eqPt1RAl19HW5YoUiL5lDoAEVnXWSzkVQB+VkVH1odpi8S29jzkELtgF
         uM01Xgaj1k3wj4BWPfl278puxyPdp8N3BCMjLeIA1LQEAHSfXgAtNArDXj/zMhaK6baD
         F2diQiFIFtoggKx8ivqitoVSvF8kYo6WynNjXnnzE5+440GnYTNDR15PLjD0POEClolo
         zE+QBNNATbFh/Ii9RQu2JTlBWwSu++JxFCsJum1NcQm3nRDVJt47NCuCpZ2lYmCO2g4B
         ZPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWiOYGu/v8a13b2fpkctUfCJgsnEoC5Hlwl10yvn8L4x9KhHgYukr6dk31fLQDgtwN5q03agtJTEo82s5JDLWn8M=@vger.kernel.org, AJvYcCX5DkwNPBBOHNgEK853V8xiErwPL3sHS4DRGNpcjbd5tMR5n/+R5Z5mC2fM/vshNH4TRbEcdqrI6r1oaH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/ZOd6f5DWV9sc5Gfe4oFcKz2R/2OEfwnkbShlfXaJSBYc89v
	LurNaQE3Isek8Q5HLF1GTQVzMxHBLm7C+A3Y9ETkop+UiPRbv/7warZ+2T53+OYz3K0vf7ZHxbb
	aQbot+nZhStkUoRuXF0CBFstggXM=
X-Gm-Gg: ASbGncutxIN0Eeom6FgXg6PmsrvmEZ43mBHthutNA7u6eJj0/C7SGNn5VPDsAevBJAu
	1k+6Stwn00tHS2KEqoLWD61WZ1xNQUODgXjTR4uo2A5ZGEMSRXqQQupwlzVxunq2k+yIEMTFlLz
	miIdvWewN1Suv27dbuDu6isJ0obqp3NG+jptSPJZz37qXyaE0EOPgiQts=
X-Google-Smtp-Source: AGHT+IHndy4Lq4n8PC/k556BtkOpTpyaeJq+uQHtP5W5Ei18u/AQBkTNX6M9/NsYBaBXiFiQX5q/TyDwYTq1Lxaj7zM=
X-Received: by 2002:a05:6122:1d0a:b0:520:420a:a07a with SMTP id
 71dfb90a1353d-527a9df67f3mr975085e0c.8.1744195375539; Wed, 09 Apr 2025
 03:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com> <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Apr 2025 11:42:28 +0100
X-Gm-Features: ATxdqUH40cse4zKZIhiA5smyjHH31QGBps6Re7h7ofsT7m2B8ft_XEw-h9e1JRc
Message-ID: <CA+V-a8s0rzEw5LksddoMhL1oF65sq-H_cb--8nM=pJ0wRz18yg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 12:22=E2=80=AFAM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> For DMA transfers, a request number must be registered with the
> ICU, which means that the DMAC driver has to be able to instruct
> the ICU driver with the registration of such id.
>
> Export rzv2h_icu_register_dma_req() so that the DMAC driver can
> register the DMAC request number.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v4->v5:
> * Dropped the registration of ACK No.
> * Removed some #define in the driver and in the header file.
> * Renamed the exported function to rzv2h_icu_register_dma_req.
> * Rebased on top of the latest ICU related changes from Biju.
> * Reworked changelog and title.
> * Dropped Thomas' Reviewed-by tag as too much has changed since v4.
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
>  drivers/irqchip/irq-renesas-rzv2h.c       | 35 +++++++++++++++++++++++
>  include/linux/irqchip/irq-renesas-rzv2h.h | 23 +++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 include/linux/irqchip/irq-renesas-rzv2h.h
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 3d5b5fdf9bde..c0322bdfc69f 100644
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
> @@ -103,6 +106,15 @@ struct rzv2h_hw_info {
>         u8              field_width;
>  };
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
>  /**
>   * struct rzv2h_icu_priv - Interrupt Control Unit controller private dat=
a structure.
>   * @base:      Controller's base address
> @@ -117,6 +129,27 @@ struct rzv2h_icu_priv {
>         const struct rzv2h_hw_info      *info;
>  };
>
> +void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac=
_index, u8 dmac_channel,
> +                               u16 req_no)
> +{
> +       struct rzv2h_icu_priv *priv =3D platform_get_drvdata(icu_dev);
> +       u32 icu_dmksely, dmareq, dmareq_mask;
> +       u8 y, upper;
> +
> +       y =3D dmac_channel / 2;
> +       upper =3D dmac_channel % 2;
> +
> +       dmareq =3D ICU_DMAC_PREP_DMAREQ(req_no, upper);
> +       dmareq_mask =3D ICU_DMAC_DMAREQ_MASK(upper);
> +
> +       guard(raw_spinlock_irqsave)(&priv->lock);
> +
> +       icu_dmksely =3D readl(priv->base + ICU_DMkSELy(dmac_index, y));
> +       icu_dmksely =3D (icu_dmksely & ~dmareq_mask) | dmareq;
> +       writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
> +}
> +EXPORT_SYMBOL_GPL(rzv2h_icu_register_dma_req);
> +
>  static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *d=
ata)
>  {
>         return data->domain->host_data;
> @@ -483,6 +516,8 @@ static int rzv2h_icu_init_common(struct device_node *=
node, struct device_node *p
>         if (!rzv2h_icu_data)
>                 return -ENOMEM;
>
> +       platform_set_drvdata(pdev, rzv2h_icu_data);
> +
>         rzv2h_icu_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_n=
ode, 0, NULL);
>         if (IS_ERR(rzv2h_icu_data->base))
>                 return PTR_ERR(rzv2h_icu_data->base);
> diff --git a/include/linux/irqchip/irq-renesas-rzv2h.h b/include/linux/ir=
qchip/irq-renesas-rzv2h.h
> new file mode 100644
> index 000000000000..618a60d2eac0
> --- /dev/null
> +++ b/include/linux/irqchip/irq-renesas-rzv2h.h
> @@ -0,0 +1,23 @@
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
> +
> +#ifdef CONFIG_RENESAS_RZV2H_ICU
> +void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac=
_index, u8 dmac_channel,
> +                               u16 req_no);
> +#else
> +static inline void rzv2h_icu_register_dma_req(struct platform_device *ic=
u_dev, u8 dmac_index,
> +                                             u8 dmac_channel, u16 req_no=
) { }
> +#endif
> +
> +#endif /* __LINUX_IRQ_RENESAS_RZV2H */
> --
> 2.34.1
>
>

