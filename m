Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D296DC511
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 11:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjDJJZW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 05:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDJJZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 05:25:22 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5941FC1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 02:25:21 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54bfa5e698eso242842667b3.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681118720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfFwcjvB6U/5N6JNSZwLTOh0Jzr0gq70ZwwmKsIUDA8=;
        b=LGsdj1su6MFL+XIoCb4ekc0yFmXCnnBcSIgQSPFrK+m59KPbToOisHKmooK5+Hebev
         wGaJhVZiIVxSrS9q72AZEQO8bWqMOBHdvtKNGJ5oboiHBLmB2ACp3cn52Zd3FQRmk9Q9
         7CIJtcFLYDSmMfs9nx8en0kKrD3SK8N0bDUkRvmqXrJmc6Ot0Xv2oSFWDbq9NyvkPVdK
         RrEb4HNCETf8b2ypZa5b7Y3HA35rusN1jInfYrU81BTBQCXmuqnoNp+OJAUimhW4a8CH
         rTvJMEAVjkOT5YY2hwd4PcgueEzhyCgPVceVYT9Jx9QH/ZGbt842U2COTO5KZd48qHlc
         v//w==
X-Gm-Message-State: AAQBX9fQ29i677Pk9xRKTn+Ey4pxcDY16EmnpXf+zqEIcKM+LxmPKy71
        /TiiQFHkVHaimFdZVoO7lwrMaBKHrzaaTg==
X-Google-Smtp-Source: AKy350aEHczZAOdHpgoyf30C3YRN9C5fBlvmusB/r7HR6FNbJ0hQa8N1E75Hp1DdKv/cLgYA9fxMIQ==
X-Received: by 2002:a81:6a84:0:b0:544:ccde:b6b8 with SMTP id f126-20020a816a84000000b00544ccdeb6b8mr4247761ywc.4.1681118719803;
        Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id l77-20020a815750000000b0054f12340ef9sm677259ywb.25.2023.04.10.02.25.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id a13so4010287ybl.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
X-Received: by 2002:a25:7182:0:b0:b8c:ad5:6b4e with SMTP id
 m124-20020a257182000000b00b8c0ad56b4emr6546708ybc.12.1681118718954; Mon, 10
 Apr 2023 02:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com> <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
In-Reply-To: <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Apr 2023 11:25:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
Message-ID: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
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
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Fri, Apr 7, 2023 at 9:16 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> On 4/3/23 17:29, Geert Uytterhoeven wrote:
> > On Tue, Mar 21, 2023 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Mon, Mar 20, 2023 at 7:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>>> Vignesh used to review CFI code, maybe he can intervene. I've never
> >>>> worked with CFI, but I can try to help. I'll need more debug data though.
> >>>>
> >>>> On 3/20/23 16:43, Geert Uytterhoeven wrote:
> >>>>> Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> >>>>> development board.
> >>>>>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> ---
> >>>>> Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> >>>>> "mtd-rom" does not work:
> >>>>>   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
> >>>>
> >>>> I would first try to understand why the probe fails.
> >
> >> I suddenly remembered I have a different board (APE6-EVM), where
> >> the CFI-FLASH stopped working after adding support for secondary
> >> CPUs. I always thought that was a hardware quirk...
> >>
> >> Turns out the CFI-FLASH on Marzen (quad Cortex-A9) is detected when
> >> booting with "nosmp":
> >
> >> My first guess was that the probing process is migrated to a different
> >> CPU core during probing, but printing smp_processor_id() didn't
> >> confirm that; it's just running on a different CPU core than CPU0.
> >> Wrapping the body of cfi_qry_mode_on() inside a get_cpu()/put_cpu()
> >> pair to prevent migration also didn't fix it.
> >>
> >> Is CFI-FLASH known-broken on SMP?
> >
> > After actively looking for more boards with CFI FLASHes, and finding one
> > more board where FLASH probing fails on SMP, I dug deeper.
> > Turns out they all have in common that (a) the CFI FLASH is located at
> > physical address zero, and (b) the secondary CPU bringup code relies
> > on mapping (by special hardware) the region at address zero to the
> > CPU boot code...
> >
> > Hence fixing this involves making sure that accessing FLASH and bringing
> > CPU cores online do not happen concurrently...
>
> Would deferring probe for CFI work?

Probe deferral of CFI FLASH would not help, as the FLASH is already
probed after secondary CPU startup.

Sequence of operations is:
  1. Map first page(s) of physical address space to RAM containing
     CPU startup code (not using the MMU, but using a special
     register in the SoC),
  2. Boot secondary CPU cores,
  3. Probe CFI-FLASH: fails, as accesses to the first page(s) of
     physical address space do not address the FLASH, but the CPU
     startup code in RAM.
  4. After boot, CPU cores can be offlined and onlined using CPU
      hotplug through sysfs.

When using "mtd-rom" instead of "cfi-flash", the system boots fine,
but the first page of /dev/mtd0 does not contain the FLASH contents,
but the CPU startup code, which I hadn't noticed originally...

Disabling the special mapping for the CPU startup code after all cores
have been brought up (in between steps 2 and 3) fixes the CFI-FLASH.
However, if a CPU core is offlined and onlined at run-time, the special
mapping has to be reinstantiated temporarily again, thus any FLASH
accesses (by other CPUs) must be prevented temporarily, too.

This issue is present on all Renesas SH/R-Mobile and R-Car SoCs
that support SMP. I am wondering if there are any other SMP SoCS that
suffer from similar issues, and that have solved them? I couldn't find
any in-tree DTS for a board with CFI-FLASH or mtd-rom at address zero
using an SMP ARM SoC...

I guess the simplest "solution" is to disable in DT any device at address zero
when SMP is used (when step 1 is executed)...

Thanks for your comments and suggestions!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
