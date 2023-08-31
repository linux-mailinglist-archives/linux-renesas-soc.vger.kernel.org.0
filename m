Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9028078EBDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjHaLUo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbjHaLUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:20:43 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51165E79
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:20:12 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a7e68f4214so408956b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693480807; x=1694085607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvSk/EJ3+mJV+DI450j6sRHdpmwF+1NljqzK7MsmgH4=;
        b=CBJKlApCGn+VU718pIl8y45YesuulqVUi0SJelT6x9xJ5tmppnj9cwiStsUMn4K7iV
         U9XRgkvWh+6rF4fAf3OrKcWol+7kkoXaVPpJxqnPTsiudDBw1TE+dM529JJzr9/k0BtV
         WahuTJEKV7W1dcHiZGpLlCDOilsKNg+tFiSPPgaWLnxIVbdJWht9MEjuN261Enpx8LwQ
         5gO7NdtL4rf7xbs0uSqzdLrRm9mXszWGtlqZUGoy9sPSInAYQdWdBcV7HuKJFQwYQvP+
         NciAZM64pWEmKjg+EFO/+0d5BQ9ioRtTh5FeQ/pp36jWdsOCI9W/GrYqbsZiCqGmO1Os
         hMIw==
X-Gm-Message-State: AOJu0YxgU7olSEcVQ7wyO+lpzqNIJmKVjFTYvDfrC9pUSNWp6HSd/vVS
        PLTfUzlPvqRNYvRW+IdKss+IQgRgr+iA0A==
X-Google-Smtp-Source: AGHT+IFvN8FNIrKVCgyX4ZN65m3rY5Q6QJRgx0V4uuFXd7NYSaNYyl93Eg8SOoxyk6uTEFY/sEfpVQ==
X-Received: by 2002:a05:6358:701:b0:134:ec9d:ef18 with SMTP id e1-20020a056358070100b00134ec9def18mr4020195rwj.28.1693480807051;
        Thu, 31 Aug 2023 04:20:07 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id v142-20020a252f94000000b00d17586ff1f7sm251860ybv.28.2023.08.31.04.20.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 04:20:06 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7ba4c5f581so468559276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:20:06 -0700 (PDT)
X-Received: by 2002:a25:2e4d:0:b0:d78:2ca3:b664 with SMTP id
 b13-20020a252e4d000000b00d782ca3b664mr4852412ybn.51.1693480806388; Thu, 31
 Aug 2023 04:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
 <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org> <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 13:19:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6cLnaxU3z5fMAc+JwXB8z531tN4YXzTYoUwWWyT3jNA@mail.gmail.com>
Message-ID: <CAMuHMdU6cLnaxU3z5fMAc+JwXB8z531tN4YXzTYoUwWWyT3jNA@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 10, 2023 at 11:25 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Apr 7, 2023 at 9:16 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> > On 4/3/23 17:29, Geert Uytterhoeven wrote:
> > > On Tue, Mar 21, 2023 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> On Mon, Mar 20, 2023 at 7:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >>> On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> > >>>> Vignesh used to review CFI code, maybe he can intervene. I've never
> > >>>> worked with CFI, but I can try to help. I'll need more debug data though.
> > >>>>
> > >>>> On 3/20/23 16:43, Geert Uytterhoeven wrote:
> > >>>>> Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> > >>>>> development board.
> > >>>>>
> > >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>>> ---
> > >>>>> Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> > >>>>> "mtd-rom" does not work:
> > >>>>>   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
> > >>>>
> > >>>> I would first try to understand why the probe fails.
> > >
> > >> I suddenly remembered I have a different board (APE6-EVM), where
> > >> the CFI-FLASH stopped working after adding support for secondary
> > >> CPUs. I always thought that was a hardware quirk...
> > >>
> > >> Turns out the CFI-FLASH on Marzen (quad Cortex-A9) is detected when
> > >> booting with "nosmp":
> > >
> > >> My first guess was that the probing process is migrated to a different
> > >> CPU core during probing, but printing smp_processor_id() didn't
> > >> confirm that; it's just running on a different CPU core than CPU0.
> > >> Wrapping the body of cfi_qry_mode_on() inside a get_cpu()/put_cpu()
> > >> pair to prevent migration also didn't fix it.
> > >>
> > >> Is CFI-FLASH known-broken on SMP?
> > >
> > > After actively looking for more boards with CFI FLASHes, and finding one
> > > more board where FLASH probing fails on SMP, I dug deeper.
> > > Turns out they all have in common that (a) the CFI FLASH is located at
> > > physical address zero, and (b) the secondary CPU bringup code relies
> > > on mapping (by special hardware) the region at address zero to the
> > > CPU boot code...
> > >
> > > Hence fixing this involves making sure that accessing FLASH and bringing
> > > CPU cores online do not happen concurrently...
> >
> > Would deferring probe for CFI work?
>
> Probe deferral of CFI FLASH would not help, as the FLASH is already
> probed after secondary CPU startup.
>
> Sequence of operations is:
>   1. Map first page(s) of physical address space to RAM containing
>      CPU startup code (not using the MMU, but using a special
>      register in the SoC),
>   2. Boot secondary CPU cores,
>   3. Probe CFI-FLASH: fails, as accesses to the first page(s) of
>      physical address space do not address the FLASH, but the CPU
>      startup code in RAM.
>   4. After boot, CPU cores can be offlined and onlined using CPU
>       hotplug through sysfs.
>
> When using "mtd-rom" instead of "cfi-flash", the system boots fine,
> but the first page of /dev/mtd0 does not contain the FLASH contents,
> but the CPU startup code, which I hadn't noticed originally...
>
> Disabling the special mapping for the CPU startup code after all cores
> have been brought up (in between steps 2 and 3) fixes the CFI-FLASH.
> However, if a CPU core is offlined and onlined at run-time, the special
> mapping has to be reinstantiated temporarily again, thus any FLASH
> accesses (by other CPUs) must be prevented temporarily, too.
>
> This issue is present on all Renesas SH/R-Mobile and R-Car SoCs
> that support SMP. I am wondering if there are any other SMP SoCS that
> suffer from similar issues, and that have solved them? I couldn't find
> any in-tree DTS for a board with CFI-FLASH or mtd-rom at address zero
> using an SMP ARM SoC...
>
> I guess the simplest "solution" is to disable in DT any device at address zero
> when SMP is used (when step 1 is executed)...

Or reserve the boot area using request_mem_region().
I have posted an RFC patch series doing that:
"[PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is enabled"
https://lore.kernel.org/all/cover.1693409184.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
