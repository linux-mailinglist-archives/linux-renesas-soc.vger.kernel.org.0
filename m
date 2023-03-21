Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C816C34F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 16:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjCUPBl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 11:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbjCUPBj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 11:01:39 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B524ECE7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 08:01:38 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1755e639b65so16543082fac.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 08:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u64F8yDGgz21kRhxCXRNhTCJDfOEDsPDI4sBA/nJgKY=;
        b=3EOuFeL7b3cycVA/qSTsAcILotla8RX9KzA4anBezPy5KEKSROdynaJqk6NQMoc0HJ
         GzwdnYmmRZ4Kc2qIf0ZFE3oEqzrmFwvMlmjzeEi1MFbSLpikEqqMzMGtLjjCCPPh8rGs
         sl+gm30Eaj7b7Ul/xY4P0OF3wk3QatkMYfx9aMCk1oBYmS39p5/nJ16g26o+XAOPunxv
         v3lefajE7fUxSH3D91PGJ96c/h5TX8Ro569z9xyY98bue1+9sDbfrCF+NMr3e9a1CQ5A
         OMK87O7PbLwwOxNSIn6xtSO/DHfLOGomrwONvM+oC/mLlpGC3jK3Vzzw3JSEkFReynDJ
         4zxA==
X-Gm-Message-State: AO0yUKUh2Z093lZGVMiwVGgvCo0ByhH4HGmjvb0jHmFrs9KHp4uegnoq
        WQKsGzPwARRn+FALeyueBTXuwrH5Vv+4dA==
X-Google-Smtp-Source: AK7set/TeQ7+RCZjedRbUwuuxvsdazzkaXyb3YMaF9/hkSlOh1VNleQKIpr7XWg6dCFyHgdog0cBqA==
X-Received: by 2002:a05:6870:891c:b0:177:a1ab:8c53 with SMTP id i28-20020a056870891c00b00177a1ab8c53mr1461597oao.12.1679410897418;
        Tue, 21 Mar 2023 08:01:37 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id g19-20020a05620a40d300b007290be5557bsm9523099qko.38.2023.03.21.08.01.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:01:37 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id z83so17472765ybb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 08:01:36 -0700 (PDT)
X-Received: by 2002:a25:9e8d:0:b0:a09:314f:a3ef with SMTP id
 p13-20020a259e8d000000b00a09314fa3efmr1669792ybq.12.1679410896517; Tue, 21
 Mar 2023 08:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
In-Reply-To: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Mar 2023 16:01:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
Message-ID: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 20, 2023 at 7:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> > Vignesh used to review CFI code, maybe he can intervene. I've never
> > worked with CFI, but I can try to help. I'll need more debug data though.
> >
> > On 3/20/23 16:43, Geert Uytterhoeven wrote:
> > > Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> > > development board.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> > > "mtd-rom" does not work:
> > >   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
> >
> > I would first try to understand why the probe fails.
>
> With debug code added, I saw that cfi_probe_chip() fails because
> cfi_qry_mode_on() returns zero.  Printing actual vs. expected values
> in map_word_equal() showed that nothing was read (all 0xff, IIRC).

I misremembered:

    physmap-flash 0.flash: physmap platform flash device: [mem
0x00000000-0x03ffffff]
    cfi_qry_present:238: 0x5151 vs. 0xe0
    cfi_qry_present:238: 0x5151 vs. 0xe0
    cfi_qry_present:238: 0x5151 vs. 0xe0
    cfi_qry_present:238: 0x5151 vs. 0xe0
    cfi_qry_present:238: 0x5151 vs. 0xe0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x51 vs. 0xe0
    cfi_qry_present:238: 0x51 vs. 0xe0
    cfi_qry_present:238: 0x51 vs. 0xe0
    cfi_qry_present:238: 0x51 vs. 0xe0
    cfi_qry_present:238: 0x51 vs. 0xe0
    cfi_qry_present:238: 0x51 vs. 0x0
    cfi_qry_present:238: 0x51 vs. 0x0
    cfi_qry_present:238: 0x51 vs. 0x0
    cfi_qry_present:238: 0x51 vs. 0x0
    cfi_qry_present:238: 0x51 vs. 0x0
    physmap-flash 0.flash: map_probe failed

I suddenly remembered I have a different board (APE6-EVM), where
the CFI-FLASH stopped working after adding support for secondary
CPUs. I always thought that was a hardware quirk...

Turns out the CFI-FLASH on Marzen (quad Cortex-A9) is detected when
booting with "nosmp":

    physmap-flash 0.flash: physmap platform flash device: [mem
0x00000000-0x03ffffff]
    cfi_qry_present:238: 0x5151 vs. 0x51
    cfi_qry_present:238: 0x5151 vs. 0x51
    cfi_qry_present:238: 0x5151 vs. 0x51
    cfi_qry_present:238: 0x5151 vs. 0x1c0
    cfi_qry_present:238: 0x5151 vs. 0x1c0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x0
    cfi_qry_present:238: 0x5151 vs. 0x6002
    cfi_qry_present:238: 0x5151 vs. 0x6002
    cfi_qry_present:238: 0x5151 vs. 0x6002
    cfi_qry_present:238: 0x5151 vs. 0x6002
    cfi_qry_present:238: 0x5151 vs. 0x6002
    0.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer
ID 0x000001 Chip ID 0x002301
    Amd/Fujitsu Extended Query Table at 0x0040
      Amd/Fujitsu Extended Query version 1.3.
    number of CFI chips: 1
    3 fixed-partitions partitions found on MTD device 0.flash
    Creating 3 MTD partitions on "0.flash":
    0x000000000000-0x000000040000 : "uboot"
    0x000000040000-0x000000080000 : "uboot-env"
    0x000000080000-0x000004000000 : "flash"

My first guess was that the probing process is migrated to a different
CPU core during probing, but printing smp_processor_id() didn't
confirm that; it's just running on a different CPU core than CPU0.
Wrapping the body of cfi_qry_mode_on() inside a get_cpu()/put_cpu()
pair to prevent migration also didn't fix it.

Is CFI-FLASH known-broken on SMP?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
