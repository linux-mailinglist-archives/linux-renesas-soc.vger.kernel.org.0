Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBAC6C20E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 20:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjCTTHv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 15:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjCTTHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 15:07:35 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3DD4A1D0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 11:59:34 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id ay22so3032533qtb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 11:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zwUgLsZ5jG7jQhXhGz4wwFx1TG5MBwKeAtALm1R53g=;
        b=bXr962w0VIb8059DwMd29CEf8qqqCOirZnXKh5yvSjNWYTVURbtIhkEWdR4XdOUIpo
         v0iq9Y6DlI/YsOlAr01y2XFH+LqKpOd471/2GjodMzmft/MuNTKdhaOwZNP1PJMIhAK3
         8GWhuUiCLiZi87iPMVn54r0t8ktp8EZvL+vDDnMClV1gF2tnvOcMDZWX1Qm93JMGA/UC
         L4REjYP9d8TWFeXQ2m6L8WUZrXSJ0z0wFEtkoeYYWpYxtzDbZG4RSbDGKnLhHNbY7FOh
         Yq1oTz13HqUyYqy2YaXJhN7+ku5pFnbB6ypolqZKVkUeeeX6TugHPwAuFH7qGvoPyJDy
         sGow==
X-Gm-Message-State: AO0yUKXXMpdBqnuYNTNtV5Zs/ZXJv64PvdzRQT/orqu/XvVNGvuahsJC
        RzUyiaQaIzF97nJGG3t3GfdPSex/agdBiA==
X-Google-Smtp-Source: AK7set8YcMJtFfTpYGt5cXmx/ttp6l94YWsfAX08QqdDxLnI2F5elGTcCa7z6vjaOcUDL76hGHBNfw==
X-Received: by 2002:a05:622a:1a88:b0:3d5:d35:8ace with SMTP id s8-20020a05622a1a8800b003d50d358acemr534471qtc.10.1679338676633;
        Mon, 20 Mar 2023 11:57:56 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h12-20020ac8548c000000b003d58d0297e5sm7103294qtq.3.2023.03.20.11.57.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:57:56 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5447d217bc6so240674887b3.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 11:57:55 -0700 (PDT)
X-Received: by 2002:a81:e508:0:b0:544:5fc7:f01f with SMTP id
 s8-20020a81e508000000b005445fc7f01fmr10128001ywl.4.1679338675613; Mon, 20 Mar
 2023 11:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
In-Reply-To: <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 19:57:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
Message-ID: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> Vignesh used to review CFI code, maybe he can intervene. I've never
> worked with CFI, but I can try to help. I'll need more debug data though.
>
> On 3/20/23 16:43, Geert Uytterhoeven wrote:
> > Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> > development board.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> > "mtd-rom" does not work:
> >   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
>
> I would first try to understand why the probe fails.

With debug code added, I saw that cfi_probe_chip() fails because
cfi_qry_mode_on() returns zero.  Printing actual vs. expected values
in map_word_equal() showed that nothing was read (all 0xff, IIRC).

Forcing big-endian (CONFIG_MTD_CFI_BE_BYTE_SWAP=y) didn't
help, and caused an unaligned access crash.

> >   2. The kernel crashes later in a spectacular way, cfr. the logs below.
> >
> > U-Boot flinfo says:
> >
> >     Bank # 1: CFI conformant flash (16 x 16)  Size: 64 MB in 512 Sectors
> >       AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E
> >       Erase timeout: 4096 ms, write timeout: 1 ms
> >       Buffer write timeout: 3 ms, buffer size: 64 bytes
> >       Sector Start Addresses:
> >       00000000   RO   00020000        00040000   RO   00060000   RO   00080000
> >       000A0000        000C0000        000E0000        00100000        00120000
> >       00140000        00160000        00180000        001A0000        001C0000
> >       ...
> >       03FC0000        03FE0000
> >
> >     Bank # 2: missing or unknown FLASH type
>
> Do you use "cfi-flash" compatible in u-boot and it works just fine? If
> yes, I would try to understand what are the differences between the
> probe paths from u-boot and linux. I know it doesn't help much, but we
> should start from somewhere if we don't have any other feedback.

It's a bit more complicated... This is a rather old board, and I only
have the originally installed U-Boot 2011.03, and no U-Boot sources.

U-Boot can write to the FLASH, as "saveenv" works (env at  0x40000).

Thanks for your help!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
