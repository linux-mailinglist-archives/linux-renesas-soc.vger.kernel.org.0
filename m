Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4567D4D5ED5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 10:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347411AbiCKJxR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 04:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347384AbiCKJxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 04:53:14 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0992A1BF90C;
        Fri, 11 Mar 2022 01:52:08 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id o22so6858061qta.8;
        Fri, 11 Mar 2022 01:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkmWo/M+JXND5dIBXyXfHk8mdEDkeGDFSxUmIrgdUYk=;
        b=s5dNVibjSnPeLl0ROZHVoyAkMOWS32aActECbN3QFnfmi0hHa/+n7TW/wo3ibAhsVs
         GNM6jb6LVuDmrSI7+kyk2WHHQn+XjGyJCDyoKjE/MC9OCDweVavrhFOL684+4YWz2gT0
         lggHEG/xtP5w6a8y1Jpjx0sKQ57ZolNuv83KIJU8OTgyz3dC6/AJLrqa3dBL+N3l1KwO
         0nUDVD7N3lUsTrHknalX3ZZ35EI6HNx9ppoxkEipUDeBVunwMnNJA6E2BU9YqDNY40bS
         JugsmLwKca/470KVkO9sFqUqqF0gtHvZ2JNB6OjfNYCc+MPG4cusTIgyXy5SSyzJYt5Q
         QVww==
X-Gm-Message-State: AOAM532rs+YOzjFGQ83aIo4VnTbO78KiEaPiYPp34SGTiHIEYegXYO7J
        Qd8JpcpAH++PxefPT58SNBeb/AaY/xEnGA==
X-Google-Smtp-Source: ABdhPJwTjOk8jG9ra9zTc3nJgbO0z80xxyQJyhLVEKYFLzPQxzdiCpWUHd8zxVCx9aBZHq4Ie+4WhA==
X-Received: by 2002:ac8:7e8d:0:b0:2e0:6314:d5f3 with SMTP id w13-20020ac87e8d000000b002e06314d5f3mr7555292qtj.352.1646992326717;
        Fri, 11 Mar 2022 01:52:06 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a034500b00476e85c85b9sm3601180qkm.110.2022.03.11.01.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:52:05 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2dbd8777564so87656197b3.0;
        Fri, 11 Mar 2022 01:52:05 -0800 (PST)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr7555666ywb.256.1646992324942; Fri, 11
 Mar 2022 01:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-7-miquel.raynal@bootlin.com> <CAMuHMdW0VZsx-zAFr__PPBqKBVyu4v7sAU_yV-ROcTLq10fE6g@mail.gmail.com>
In-Reply-To: <CAMuHMdW0VZsx-zAFr__PPBqKBVyu4v7sAU_yV-ROcTLq10fE6g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 10:51:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUC2ndMJr1DhPxsg6JX2o0Bh9odq3rvpfzHN+T9miuQg@mail.gmail.com>
Message-ID: <CAMuHMdXUC2ndMJr1DhPxsg6JX2o0Bh9odq3rvpfzHN+T9miuQg@mail.gmail.com>
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
        Clement Leger <clement.leger@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

CC esmil

On Fri, Mar 11, 2022 at 10:39 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Miquel,
>
> On Thu, Mar 10, 2022 at 5:17 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >
> > The Renesas RZ/N1 devices have a modified Synopsys DW UART. The
> > modifications are mostly related to the DMA handlnig, and so this patch
> > adds support for DMA.
> >
> > The RZ/N1 UART must be used with the peripheral as the flow
> > controller. This means the DMA length should also be programmed into
> > UART registers.
> >
> > Aside from this, there are some points to note about DMA burst sizes.
> > First, DMA must not remove all of the data from the rx FIFO. Otherwise,
> > we do not get a 'character timeout' interrupt, and so do not know that
> > we should push data up the serial stack. Therefore, we have the rx
> > threshold for generating an interrupt set to half the FIFO depth (this
> > is the default for 16550A), and set the DMA burst size when reading the
> > FIFO to a quarter of the FIFO depth.
> >
> > Second, when transmitting data using DMA, the burst size must be limited
> > to 1 byte to handle then case when transmitting just 1 byte. Otherwise
> > the DMA doesn't complete the burst, and nothing happens.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks for your patch!
>
> > --- a/drivers/tty/serial/8250/8250_dma.c
> > +++ b/drivers/tty/serial/8250/8250_dma.c
>
> > @@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_device *pdev)
> >                 data->msr_mask_off |= UART_MSR_TERI;
> >         }
> >
> > +       data->is_rzn1 = of_device_is_compatible(dev->of_node, "renesas,rzn1-uart");
>
> Explicit checks for compatible values are frowned upon if you have
> a match table.
> Please handle this through of_device.data, cfr. the various quirks.

Oops, these are not yet upstream, but present in my tree due to including
support for StarLight, cfr.
https://github.com/esmil/linux/commits/visionfive/drivers/tty/serial/8250/8250_dw.c

But you do already have:

+       { .compatible = "renesas,rzn1-uart", .data = &rzn1_pdata },

since "[PATCH 4/7] serial: 8250_dw: Provide the RZN1 CPR register value".

> Please rename "is_rzn1" to something that describes the feature.
>
> > +
> >         /* Always ask for fixed clock rate from a property. */
> >         device_property_read_u32(dev, "clock-frequency", &p->uartclk);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
