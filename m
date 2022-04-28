Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8598512FBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 11:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbiD1JRP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 05:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345132AbiD1JNO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 05:13:14 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1834053E19;
        Thu, 28 Apr 2022 02:10:00 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id kj18so2782181qvb.6;
        Thu, 28 Apr 2022 02:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ckr8j2GN0jqMScfutldQkAKYzbRu3G1IkJTcIxhxO/Y=;
        b=nApdyyD7pbdJyGXcxL/9ya2A07WEEEQusNbsSk3wF86hEbn8kRQW5YYdbieBuzsb2d
         zcri+VgV2V0adio75C5V8DwSD72zL3osYPMbC/qWeaFKklkSb260eKVPTkcsy97RqY0X
         VgVZLs5nCT9iywF4w8Su5v5wFeySqEjH0uDgl6LKSEGALlODWqFLF0MIVqjr3qOGLG/w
         a96JrqlWErEa9oIT46lNGvKPJ5ePsCyinVSUk5iyz2ZVaK+skMe1DQOcn2kZoujo+sZG
         m+gr6txTpbVj0vnG8rZ6KxT/qgOWVroz3/XFDLlptZQr5v0wETg80dV33y5TREuJZO14
         /0xA==
X-Gm-Message-State: AOAM53396PhS6hF0RsOAhohFHk69GdTqb9+o8hoxxIvhFNZeOrb58dUS
        RsgbPa6zqkVOaSSmkhHvx1CJI+cz4D+jRQ==
X-Google-Smtp-Source: ABdhPJxsPBgQhin+FfAQbrWLn3VUyfs7Px7dHmCOpZ4Oo7cRss1CZGoCNTcqhrQ0fs6up1OwSu1p7w==
X-Received: by 2002:ad4:5c62:0:b0:444:560e:32ae with SMTP id i2-20020ad45c62000000b00444560e32aemr22643740qvh.76.1651136998773;
        Thu, 28 Apr 2022 02:09:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id e16-20020ac85990000000b002f3772de70asm5053865qte.69.2022.04.28.02.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 02:09:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id s30so7850799ybi.8;
        Thu, 28 Apr 2022 02:09:58 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr31120983yba.546.1651136997907; Thu, 28
 Apr 2022 02:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220421095323.101811-1-miquel.raynal@bootlin.com> <20220421095323.101811-11-miquel.raynal@bootlin.com>
In-Reply-To: <20220421095323.101811-11-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 11:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_oqwbDR4HMm-Kz7jmg8FyJg-Dzi-xyBekZEdcdzBZDg@mail.gmail.com>
Message-ID: <CAMuHMdW_oqwbDR4HMm-Kz7jmg8FyJg-Dzi-xyBekZEdcdzBZDg@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] ARM: dts: r9a06g032: Fill the UART DMA properties
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 21, 2022 at 11:53 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> UART 0 to 2 do not have DMA support, while UART 3 to 7 do.
>
> Fill the "dmas" and "dma-names" properties for each of these nodes.
>
> Please mind that these nodes go through the dmamux node which will
> redirect the requests to the right DMA controller. The first 4 cells of
> the "dmas" properties will be transferred as-is to the DMA
> controllers. The last 2 cells are consumed by the dmamux. Which means
> cell 0 and 4 are almost redundant, one giving the controller request ID
> and the other the dmamux channel which is a 1:1 translation of the
> request IDs, shifted by 16 when pointing to the second DMA controller.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
