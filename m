Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E940456BF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 09:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhKSJAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 04:00:34 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:37615 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhKSJAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:00:34 -0500
Received: by mail-ua1-f42.google.com with SMTP id o1so19850644uap.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDmEtlUJW/U2TV/6uXra9mxD+3D+ySGPKfAlnRkVzM4=;
        b=4eVmeQYQ8K2N101suMR4ftsIbxCHoTdzeqxIQl8r10wFtChv+p071npIpCS/v3EWrf
         9pifqzEzS6OHPOuLXsfXrrw0epU8Wt7wCrl4EFg1iLno6EmifnFfrpEalCH64f2xV1Ow
         +BCUXBX++WkvgwF+2xtDiN5KnAhfd0pNvpo5jvCI/YM86/7RCV1mAz6lnST4ClIkmDju
         yhspZMU3sVLm3fmVkJ7f8wvn6DMROlXgVkPSM4SjwlzKsW1lT4Rg4FyezYxs1F+dcpIu
         bDtTxGzfyJti1Rvc19L7Wi03rrI8GVxwftV+tZh8agcaLQoxiEq4VWRvUqlOKIcfXcbk
         hNBg==
X-Gm-Message-State: AOAM532z40hD1tT28uhLyT0Blxnp5Ku16tr0G9ogbasgbrU0A820ygTW
        N/FcAGw2zgwWipISWdQXlYknUlFtctdWJA==
X-Google-Smtp-Source: ABdhPJxIX+jU2Wrzda7gzbgky/EPf+dOBb7yqTeqi5B9jq02jdTpdnghPLc62KV/AStBWDGTXL7gGA==
X-Received: by 2002:ab0:7095:: with SMTP id m21mr46876937ual.82.1637312252677;
        Fri, 19 Nov 2021 00:57:32 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id w2sm1333327vsw.29.2021.11.19.00.57.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:57:31 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id l24so19860355uak.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:57:31 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr91656903vsb.9.1637312251119;
 Fri, 19 Nov 2021 00:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com> <20211118111940.1275351-4-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 09:57:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=QgdrVHZXcZtQvtx=BUrugM6sPynt4EXMyA3=JxUV4g@mail.gmail.com>
Message-ID: <CAMuHMdW=QgdrVHZXcZtQvtx=BUrugM6sPynt4EXMyA3=JxUV4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

CC Gareth

On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Point to the driver and the bindings.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16004,6 +16004,13 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
>  F:     drivers/iio/adc/rzg2l_adc.c
>
> +RENESAS RZ/N1X NAND CONTROLLER DRIVER
> +M:     Miquel Raynal <miquel.raynal@bootlin.com>
> +L:     linux-mtd@lists.infradead.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml

.../renesas,rzn1-nand-controller.yaml

> +F:     drivers/mtd/nand/raw/rzn1-nand-controller.c
> +
>  RESET CONTROLLER FRAMEWORK
>  M:     Philipp Zabel <p.zabel@pengutronix.de>
>  S:     Maintained

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
