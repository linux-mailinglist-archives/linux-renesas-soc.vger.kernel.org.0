Return-Path: <linux-renesas-soc+bounces-23573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA691C05059
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8443AAFB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49B22ECD27;
	Fri, 24 Oct 2025 08:12:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9BB3019BD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293560; cv=none; b=RBV1B/N1rxGWGrEPQ282jJTkZriD9ZcC/Pc52ht4g3Et9Mqgd/1FHUpXxzAoDXOusa5FIGGIEo9PDmNvHDR3XZwrsTgWBJUxbuC6b0GxxbbJpmd5PLHymjsp+xfYoxG0F5HOe4ih3uPiyV9/j7/Jkd4J9XslSRr0dgTuLxGZwGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293560; c=relaxed/simple;
	bh=hpgcKlVV2a7usVfzDLt1zVdxgZvPff7TYeBH4JVUr2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp0vlwzKJvJm/VpMXSpbfWFdpLLYd5g3Oc2HVuAU04YDrqZtWNrqpTWh+QiOpMQA9hiJtrGTvehAdt+g2LE4pPBzr93ca69msIw1Xv3Ac/7T5fqbhI9Wu8ZOMAsJHaPqdCsxCE5rSbuDjo8B8Vnxuk2qFdDKTBRWz81V4A9qYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a880e2858so426611e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 01:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293558; x=1761898358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY48OolfC3m/XFrWtTQOSs1xiOIwkF1W9X+4X3p3eqE=;
        b=Ba2wBRkUkXcXOsI4zcLasUCk5C9e5haIvONMzADNDAs6dN8/Ym0m3P8dZD3Um2GZTs
         GY+piUWoqLvWScKzACzY1DOjU6SkgPy1VCaxjm+6m08qn5D/1wNcO3zNzMBxrgJVgfYW
         5Z/bRTdWPTdJSoPx/fF5mkblGy9YQnz2dgfeph49F6Jm9iNVspCVxGn2t9Y6kgr4j3FD
         fBeO+X262q5jBME9VYif9V8+xyF/rMRqt838CTDj8AQQw18d1xQrdt2rHBy0QIS8nqTp
         FhN1/LGJafK+lIj/8OxNRXICPBK4oui/x04X3Pq1MoZrSYJ0n39yGhCPpYMKflyrCpxM
         IOvA==
X-Forwarded-Encrypted: i=1; AJvYcCWXxODd/JGaHvJzGTg01kTsyc0KFItVyEDZipgXmfaipfOctMl2f5i7oLd0npIjm6Zb7N2feXxJa1mctWaiA6GBeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIvgHqIWIGQXf212H4EjZRAcefaG9auswtBa5SdsInBS3QqYNw
	HT/LAl0syBHUypx+TYzS6s3Zx/9xy+TLZ3ZLD5VxLd4Aqbj2tRIOD/c/usCoTOEM
X-Gm-Gg: ASbGncvsTUrPacBxt8wrCs5tAQ1ndMPJK4YxIkuZ559xFl/WSyy7wM7/Fxc2LLGRDAt
	LREog/I81KrhATZRbDtdK5tAQGcxQfPEC9vgN5yzdftAJYle8i9uUVcEl1+YVkZsZ0iUFGTPMWt
	/qrHCMd3M1GabT38IaM/ll4qZ5uA0QtG0eAmArNcm4r0ZEEMR5KcgFAzRkYVH5eMhepB9Skz/IJ
	qohrifxge7u+MjlQLhXigNuD7Nw9MtsKxlRrX8+i96cjAuutnGVUA5g6DiUl+IjUxkVk4cH69fC
	GrY+ZrARy6BABCh2+V9phxnVgyPjzAdgFgJru/aZP+g4hZwicHLIQr/2LsqThO0+wyboUBrzv+u
	hSwBJfa3Z/gYs9zFPqR/pRZeOcA3b4yoJXAUOiZpKaLjf9rhnzwx7l1Kh8AFHD6dP7VJ7o5A73+
	DK68zuVetSrTZzALtMohWxUWNQp4LrkwogZmBYCQ==
X-Google-Smtp-Source: AGHT+IHTMUM9h8ZshaiGb81PFM9LW6cYwMYJzLZ/6X5abnvaixG6F8qtqCYjwfjVK40z5nxmWPL6sQ==
X-Received: by 2002:a05:6122:2399:b0:542:59a2:731a with SMTP id 71dfb90a1353d-557cf1508d2mr375704e0c.16.1761293557609;
        Fri, 24 Oct 2025 01:12:37 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bef1a1fcsm1834580e0c.22.2025.10.24.01.12.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:12:36 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5c7fda918feso2126232137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 01:12:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI+ogjJVW10LroYyfvNcvX7buNtINNASI7tDCxUenzOqNXQ8zEOyJ5GiZGIlS5n5FMjPuzt622ce/+Z53RGuh8KQ==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5d5:f6ae:38ee with SMTP id
 ada2fe7eead31-5db3fa38842mr411609137.37.1761293556608; Fri, 24 Oct 2025
 01:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com> <87cy6cn7jg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy6cn7jg.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 10:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4nkLesGhPp+_RqsgWv02v=egLeH_1HNLKHC5yXPbvZw@mail.gmail.com>
X-Gm-Features: AWmQ_blHf3Lx7IusOtNYbKWAzZe9vKkY7XTZ8MHPSP2bH9Nd9dITHkmeD1XsiZs
Message-ID: <CAMuHMdU4nkLesGhPp+_RqsgWv02v=egLeH_1HNLKHC5yXPbvZw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Fri, 24 Oct 2025 at 08:22, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Masashi Ozaki <masashi.ozaki.te@renesas.com>
>
> Add Renesas MFIS mailbox driver for R8A78000 (X5H)
>
> Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/mailbox/rcar-mfis-mailbox.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas MFIS (Multifunctional Interface) Mailbox Driver
> + *
> + * Copyright (c) 2025, Renesas Electronics Corporation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static int mfis_send_data(struct mbox_chan *link, void *data)
> +{
> +       void __iomem *reg = link->con_priv;
> +
> +       /*Trigger interrupt request to firmware(SCP)*/
> +       iowrite32(0x1, reg);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t mfis_rx_interrupt(int irq, void *data)
> +{
> +       struct mbox_chan *link = data;
> +       void __iomem *reg = link->con_priv;
> +
> +       mbox_chan_received_data(link, 0);
> +
> +       /* Clear interrupt register */
> +       iowrite32(0x0, reg);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int mfis_startup(struct mbox_chan *link)
> +{
> +       struct mbox_controller *mbox = link->mbox;
> +       struct device *dev = mbox->dev;
> +       int irq;
> +       int ret;
> +
> +       irq = of_irq_get(dev->of_node, 0);
> +
> +       ret = request_irq(irq, mfis_rx_interrupt,
> +                         IRQF_SHARED, "mfis-mbox", link);
> +       if (ret) {
> +               dev_err(dev,
> +                       "Unable to acquire IRQ %d\n", irq);
> +               return ret;
> +       }

This looks a bit expensive to do on each and every client request ...

> +       return 0;
> +}
> +
> +static void mfis_shutdown(struct mbox_chan *link)
> +{
> +       struct mbox_controller *mbox = link->mbox;
> +       struct device *dev = mbox->dev;
> +       int irq;
> +
> +       irq = of_irq_get(dev->of_node, 0);

... and release.  Just store and request the irq in .probe().

> +
> +       free_irq(irq, link);
> +}
> +
> +static bool mfis_last_tx_done(struct mbox_chan *link)
> +{
> +       return true;
> +}
> +
> +static const struct mbox_chan_ops mfis_chan_ops = {
> +       .send_data      = mfis_send_data,
> +       .startup        = mfis_startup,
> +       .shutdown       = mfis_shutdown,
> +       .last_tx_done   = mfis_last_tx_done
> +};
> +
> +static int mfis_mbox_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mbox_controller *mbox;
> +       void __iomem *reg;
> +       int ret, count = 2, i;

unsigned int i (and count, but I doubt you need it)

> +
> +       mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +       if (!mbox)
> +               return -ENOMEM;
> +
> +       mbox->chans = devm_kcalloc(dev, count, sizeof(*mbox->chans), GFP_KERNEL);
> +       if (!mbox->chans)
> +               return -ENOMEM;

You can combine this into a single allocation, and provide space for
driver-specific data (e.g. irq), by using a driver-private structure:

    struct mfis_priv {
            struct mbox_controller mbox;
            struct mbox_chan channels[2];
            int irq;
    };

Where needed, you can convert from a struct mbox_controller pointer
to a struct mfis_priv pointer using containter_of().

> +
> +       reg = devm_platform_ioremap_resource(pdev, i);
> +       if (IS_ERR(reg))
> +               return PTR_ERR(reg);
> +
> +       for (i = 0; i < count; i++) {
> +               mbox->chans[i].mbox     = mbox;
> +               mbox->chans[i].con_priv = reg + ((1 - i) * 4);
> +       }
> +
> +       mbox->txdone_poll       = true;
> +       mbox->txdone_irq        = false;
> +       mbox->txpoll_period     = 1;
> +       mbox->num_chans         = count;
> +       mbox->ops               = &mfis_chan_ops;
> +       mbox->dev               = dev;
> +
> +       ret = mbox_controller_register(mbox);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, mbox);
> +       dev_info(dev, "MFIS mailbox is probed\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mfis_mbox_of_match[] = {
> +       { .compatible = "renesas,mfis-mbox", },
> +       {},

Please no trailing comma after the sentinel.

> +};
> +MODULE_DEVICE_TABLE(of, mfis_mbox_of_match);
> +
> +static struct platform_driver mfis_mbox_driver = {
> +       .driver = {
> +               .name = "renesas-mfis-mbox",
> +               .of_match_table = mfis_mbox_of_match,
> +       },
> +       .probe  = mfis_mbox_probe,
> +};
> +module_platform_driver(mfis_mbox_driver);
> +MODULE_DESCRIPTION("Renesas MFIS mailbox driver");
> +MODULE_LICENSE("GPL v2");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

