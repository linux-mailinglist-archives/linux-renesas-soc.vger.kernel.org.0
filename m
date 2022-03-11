Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144EC4D5EA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 10:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347363AbiCKJlR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 04:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343772AbiCKJlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 04:41:15 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A321A8065;
        Fri, 11 Mar 2022 01:40:12 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id j5so6535906qvs.13;
        Fri, 11 Mar 2022 01:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJTNfmctXP/UVPQLjbBJkIULiILCgJ8uCPGrrjaMgnM=;
        b=USC1ctS+2V8uMz2GxOIPyJZnqI84lkMvUgm/Eeq/8slH72M3a/ypfiVoFBszhHLMHV
         evUDO68BQcUjitUmEuCmdC1EVqfK/vmgwgFJzG9bS2UU0ouYetMqJpp9GXuvEQQIdiga
         Un7cjNTEKdc+Cv/+Iibyv6J3n/i1MGEWsiJQWBg0m6jx0l0kxt4Sg4XUNJMZ836We+qJ
         Q4K584ncgCKA2iuWOZ1A9dlBJfYhxPoOhh1koAfWtK1RioDQOY/nRkxA38PhHg3+RHtE
         IzjFpAJg4O6QarwaWLN76E3SrTQZzX6tDNcoJ2Mxx48iuXnmjwsNgeIhFidTdeJ3x2GW
         YJgA==
X-Gm-Message-State: AOAM531oFOfCbiiTuYxkuRN5NDJuILRfNE/tDFTpaDQWMglj5N2yh5uw
        14cMFv0t2YIZCgsFKUrCgnSfHTMMjNfjIw==
X-Google-Smtp-Source: ABdhPJzBvoPHWD4ozKCKvrePWRPMRIs+MAjKZTuriyGOis1YmvRGQJlr3FvpcxgeeI9ue/+l+CNo0A==
X-Received: by 2002:a05:6214:5186:b0:435:2bcf:7014 with SMTP id kl6-20020a056214518600b004352bcf7014mr6943285qvb.24.1646991611126;
        Fri, 11 Mar 2022 01:40:11 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id r4-20020a05622a034400b002e1a6750435sm3754350qtw.37.2022.03.11.01.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:40:10 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2db569555d6so86431857b3.12;
        Fri, 11 Mar 2022 01:40:09 -0800 (PST)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr7531598ywb.256.1646991609661; Fri, 11
 Mar 2022 01:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20220310161650.289387-1-miquel.raynal@bootlin.com> <20220310161650.289387-7-miquel.raynal@bootlin.com>
In-Reply-To: <20220310161650.289387-7-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 10:39:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW0VZsx-zAFr__PPBqKBVyu4v7sAU_yV-ROcTLq10fE6g@mail.gmail.com>
Message-ID: <CAMuHMdW0VZsx-zAFr__PPBqKBVyu4v7sAU_yV-ROcTLq10fE6g@mail.gmail.com>
Subject: Re: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Thu, Mar 10, 2022 at 5:17 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>
> The Renesas RZ/N1 devices have a modified Synopsys DW UART. The
> modifications are mostly related to the DMA handlnig, and so this patch
> adds support for DMA.
>
> The RZ/N1 UART must be used with the peripheral as the flow
> controller. This means the DMA length should also be programmed into
> UART registers.
>
> Aside from this, there are some points to note about DMA burst sizes.
> First, DMA must not remove all of the data from the rx FIFO. Otherwise,
> we do not get a 'character timeout' interrupt, and so do not know that
> we should push data up the serial stack. Therefore, we have the rx
> threshold for generating an interrupt set to half the FIFO depth (this
> is the default for 16550A), and set the DMA burst size when reading the
> FIFO to a quarter of the FIFO depth.
>
> Second, when transmitting data using DMA, the burst size must be limited
> to 1 byte to handle then case when transmitting just 1 byte. Otherwise
> the DMA doesn't complete the burst, and nothing happens.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/tty/serial/8250/8250_dma.c
> +++ b/drivers/tty/serial/8250/8250_dma.c

> @@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_device *pdev)
>                 data->msr_mask_off |= UART_MSR_TERI;
>         }
>
> +       data->is_rzn1 = of_device_is_compatible(dev->of_node, "renesas,rzn1-uart");

Explicit checks for compatible values are frowned upon if you have
a match table.
Please handle this through of_device.data, cfr. the various quirks.
Please rename "is_rzn1" to something that describes the feature.

> +
>         /* Always ask for fixed clock rate from a property. */
>         device_property_read_u32(dev, "clock-frequency", &p->uartclk);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
