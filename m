Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCDE6D4DB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjDCQ33 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 12:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbjDCQ32 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 12:29:28 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D15C1FDE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 09:29:27 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536af432ee5so562843157b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 09:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJp/UHUUVWepRPEy8J9qP7lkAX18u/uBn6W1djkz/+Q=;
        b=nWTCh7q7KXQRlM3R1i6kMiJp6RvkxdcQSUarbDpI1NoYIqXtY9KkGoUjBKqr0PtLnh
         ryOBFBIND/tbH9rnZw+eynnUOgFTy8hAWuQzbUfA0dvKFbr1SoVPzWsOHM0e2AjomLfH
         /57qIdiqhjraPtiT5Xg7K8mDS1ngLMvIstd7GnV54kUGPvoKp4oEevAP6FzS7k8uZZVi
         O+BRXtyKN1x4vbnHeXbmDCyGdWy0gILeTsc630mWK9LbICmwvvoYXIebsvTlk+SkX7Ui
         O/8V3b7jgYRvrzfS6h47faOjnKRTe2SkMdEqZroRYigTuu/VA5YLfgSnp7mvLaW/chpU
         Mkhg==
X-Gm-Message-State: AAQBX9fQJePt1WqnJqKb5BhZOEWiGhv9960k2b61sN8EJYqYAAIoRGkW
        UZu4BNaLQKXPKr/K8uvoPgi8g5I2kKY/iDi3
X-Google-Smtp-Source: AKy350YMhbmuvazKylvvErSSR7SK4BpBzWoRO0pZAA4I8xTHUqrL1FPR4AR7dpx2nl3HFwfN/7eTWQ==
X-Received: by 2002:a0d:e28c:0:b0:544:7994:34dc with SMTP id l134-20020a0de28c000000b00544799434dcmr30395836ywe.43.1680539366054;
        Mon, 03 Apr 2023 09:29:26 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 2-20020a811202000000b00545a081849bsm2629331yws.43.2023.04.03.09.29.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 09:29:25 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-544787916d9so561385517b3.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 09:29:25 -0700 (PDT)
X-Received: by 2002:a81:a7c4:0:b0:546:264:a375 with SMTP id
 e187-20020a81a7c4000000b005460264a375mr13077370ywh.4.1680539365152; Mon, 03
 Apr 2023 09:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
In-Reply-To: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Apr 2023 18:29:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
Message-ID: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
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

On Tue, Mar 21, 2023 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Mar 20, 2023 at 7:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> > > Vignesh used to review CFI code, maybe he can intervene. I've never
> > > worked with CFI, but I can try to help. I'll need more debug data though.
> > >
> > > On 3/20/23 16:43, Geert Uytterhoeven wrote:
> > > > Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> > > > development board.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> > > > "mtd-rom" does not work:
> > > >   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
> > >
> > > I would first try to understand why the probe fails.

> I suddenly remembered I have a different board (APE6-EVM), where
> the CFI-FLASH stopped working after adding support for secondary
> CPUs. I always thought that was a hardware quirk...
>
> Turns out the CFI-FLASH on Marzen (quad Cortex-A9) is detected when
> booting with "nosmp":

> My first guess was that the probing process is migrated to a different
> CPU core during probing, but printing smp_processor_id() didn't
> confirm that; it's just running on a different CPU core than CPU0.
> Wrapping the body of cfi_qry_mode_on() inside a get_cpu()/put_cpu()
> pair to prevent migration also didn't fix it.
>
> Is CFI-FLASH known-broken on SMP?

After actively looking for more boards with CFI FLASHes, and finding one
more board where FLASH probing fails on SMP, I dug deeper.
Turns out they all have in common that (a) the CFI FLASH is located at
physical address zero, and (b) the secondary CPU bringup code relies
on mapping (by special hardware) the region at address zero to the
CPU boot code...

Hence fixing this involves making sure that accessing FLASH and bringing
CPU cores online do not happen concurrently...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
