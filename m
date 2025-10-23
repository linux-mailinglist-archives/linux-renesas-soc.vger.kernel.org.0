Return-Path: <linux-renesas-soc+bounces-23462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5040BFFC1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93BDA4EFDF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 08:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70AD2E764E;
	Thu, 23 Oct 2025 08:00:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F942E6CA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206437; cv=none; b=t/zi9Q5qssAyxyjXi67o3DxjV5v4T6xIuKO4QxQLKW7sLX6VTfpRbMjQr1O1B9lBuld39OMqHmjtWpgYxw6/cCzCG+4qKU5lDA4YSimTmDZw622QJOE0R/p65KxenfKIH6zs1C9we80kuTXiKxfQeHa4YCm2ng4cKwYWcMpXCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206437; c=relaxed/simple;
	bh=KpSaMjSEZziIYn4V8EA3oAQHYYGym/G8ks3Kmoko+Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbOyhwOGN5xt5ifho9x6T9GpHo/L2l6MQdMZ9V6feViZGy/VTGgZK6pfPpo8IeOEvJoHxmkOoBKGLwESWagZ/fQnfN5T2x4NBDUJcxJEolfXzCt9G3nMF7YZi1DwdGPy3emm/ls+5X+IS1GWrt82+xTOdINLQUW1zdYF+usGvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so254832e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 01:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206435; x=1761811235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XF9ym20BXQJuQdpG7CWrlv8nMa2KXEsJ8BzTyt5Bosk=;
        b=K2nfM3VuKm0b+oU0sZr/gtEOXMXsJebFLagQOfTD0DPhrYRThxh4GhofMtfTh21Tsm
         a63D+DSFEubLSoKnzAqrys/kQaMA3vYU+6GhzvQTqII4WFBf7p8y+kc7Q5TJOl090LDM
         r48k3u13QHAN9Sp6trY+wT1rWBluoKn/zbjecsScIFO7fZFkQ0Yx25H77AmA7iJx34my
         4Juz7qwybcmUpRdiKHfpw4UzK9r+nnLlL97yzWiZA6yUYdpB2s7hwxVKoM7hX2gzVyzQ
         qP0X+bzb50J5dLhdpoe1pn8pL6H8/Fwn7qBZa5/csyhl24SLbvmXf8ylOzw/U5dg3RA7
         XDrw==
X-Forwarded-Encrypted: i=1; AJvYcCXbTR4JfChoNr/2hde/+rwPm8zgtBufLsK/zppxHQS+94anMqg+GecdxYJsbw2mqBneoqmC21PL6WpR574pybcduw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ElkDpfCKx1Gp/ZNQC2K7mER4msHb80OYP1DI/ZrSQqRTbBaa
	3T/xijyWSs5ADEciLdDafO/DxeI6+JJGLIS0BXDvMTDzb383e8q1xqsa3k/QOpeZ
X-Gm-Gg: ASbGncspMptG4u11sjen3kEEq8TB3ohmYGekOEXzL5J36tVnNPDRyZ1URlj8YYW08L6
	jcDYd8saB4A2IKoQu1QXZ1qF5DqXeg/RnfO+qPDyQFOZWD+MhdiX7ZcBJ5wDg9KK9KuG53Ulrod
	b33jMO9Jde5+jORIW3HOvX67nHGjA/jh+TMrwo6JjWVkt9Kj/KlVfJYGjejf5yIhJbhajnScCho
	L3/sMy+qeK9K4XkAlCr4pN+xh8Zdoo8rv0q/NpiX2u4FDSTAhGqeV8BRksJnqlzlblATubzLQYI
	iqohkMja8HbM8WOQF7rglZvJ0ooORSp4MIjfCPCZ6p66I/flAteOJZmVbS0JHWDwXzTE4WgXDjb
	Q9vofXf+wchkq6tdrVeaB5akVRA0rQf8F61qptGZ5z+cKpSxf04gePCTM9DiNjophOXQlcdMG6v
	rn5KPUjMLe50RmOt+u+Crq5tE+zMPprlPJqmlArknlmg5jlFco9KhImwiP0S0=
X-Google-Smtp-Source: AGHT+IFuG/DplVZ1PiZkHRqNY3B+01e9m8yzp4T4IUP8iJJ1L6+O52IYHNDaivaAndhqaZowS/tBXQ==
X-Received: by 2002:a05:6122:2008:b0:557:c3b1:a28a with SMTP id 71dfb90a1353d-557c3b1a746mr93519e0c.5.1761206434663;
        Thu, 23 Oct 2025 01:00:34 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8c4f15sm546118e0c.8.2025.10.23.01.00.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:00:34 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5db1e29eed0so202531137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 01:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf5HOlcMvJy94H4ZB5lG/DmSjfNsTePUXZNucNVUMKSCEz0kwE2nrFiWN/KgeD4wDY4wS6Ik0/Ftwsq9QD6TX8sw==@vger.kernel.org
X-Received: by 2002:a05:6102:32d3:b0:5d5:f40a:4cf1 with SMTP id
 ada2fe7eead31-5d7dd6a4e59mr6656672137.24.1761206432910; Thu, 23 Oct 2025
 01:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com> <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 10:00:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXF14x68Wk5YdOBS2D2N6LtnQjfGzrsMdSJegX-gc3faQ@mail.gmail.com>
X-Gm-Features: AS18NWB9_OOBrClG3W5gj81JVaeCg1e2FLiq_rBpovw0Id2oH40EKE5zSy4p5SM
Message-ID: <CAMuHMdXF14x68Wk5YdOBS2D2N6LtnQjfGzrsMdSJegX-gc3faQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 7 Oct 2025 at 15:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustments.
>
> Hardware manual can be downloaded from the address in the "Link" section.
> The following steps should be followed to access the manual:
> 1/ Click the "User Manual" button
> 2/ Click "Confirm"; this will start downloading an archive
> 3/ Open the downloaded archive
> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>
> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c

> +static void rzg3s_pcie_irq_compose_msi_msg(struct irq_data *data,
> +                                          struct msi_msg *msg)
> +{
> +       struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(data);
> +       struct rzg3s_pcie_host *host = rzg3s_msi_to_host(msi);
> +       u32 drop_mask = RZG3S_PCI_MSIRCVWADRL_ENA |
> +                       RZG3S_PCI_MSIRCVWADRL_MSG_DATA_ENA;

This should include bit 2 (which is hardwired to zero (for now)),
so I think you better add

    #define RZG3S_PCI_MSIRCVWADRL_ADDR  GENMASK(31, 3)

> +       u32 lo, hi;
> +
> +       /*
> +        * Enable and msg data enable bits are part of the address lo. Drop
> +        * them.
> +        */
> +       lo = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) & ~drop_mask;

... and use FIELD_GET() with the new definition here.

> +       hi = readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRU);
> +
> +       msg->address_lo = lo;
> +       msg->address_hi = hi;
> +       msg->data = data->hwirq;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

