Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7951D5A226C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245543AbiHZHy6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 03:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245678AbiHZHy5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 03:54:57 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CD420F6E;
        Fri, 26 Aug 2022 00:54:54 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id h12so516434qvs.3;
        Fri, 26 Aug 2022 00:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fL8b3+HSS1hWMBgkDRO4fObvjRvb6mb1AqBpq8sCS00=;
        b=KhR8Nv6UraIf9rbxh2PmeFKQxvsoQ13j4UhsfsD5+2kDQUBwV5he2QzsRwJh++hLHX
         YAGwiCzhaWi1P9Dwplf5vIqt6R4OO7Dj5zimbYykpAhQLxKvUzWQQlzdiySw1X402otl
         bYOEbtqN9j+AkvVjaAB8hN1NiDwtLKDhG1bICQjZ1QszgxhwJF26vQqB7PyG80tDmxOc
         c1zA4c62KR3/WdeG+9vBh748qgYDMzi/3+41OKL7hKWLIwAwM+w8fSuI9Zn0sW7MSbrj
         Xtj5p/vQRO0gQLi8eZt3wYX6I/cwpY8mTEwymM/N8ms1eNhP2mPW+x8L58UzljscFq8E
         TFIg==
X-Gm-Message-State: ACgBeo0eBTv45EieHs8tWFELx6RyTWMireittmRZ+jvZLOGXrNL4OlHu
        xrf1ciW68D66FspYso27qIjvxYHwc/ImiA==
X-Google-Smtp-Source: AA6agR6ccNPLs7OnO22pHf0sBU0i3uoYoMfDjeAJs16zV1x7w+X1KvT2TfXn4/w9kH5+OS44XecIyQ==
X-Received: by 2002:a05:6214:2387:b0:497:15b3:f792 with SMTP id fw7-20020a056214238700b0049715b3f792mr6904617qvb.118.1661500493083;
        Fri, 26 Aug 2022 00:54:53 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id q30-20020a05620a039e00b006bbf85cad0fsm1217679qkm.20.2022.08.26.00.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:54:52 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-33dbbf69b3dso17172907b3.1;
        Fri, 26 Aug 2022 00:54:52 -0700 (PDT)
X-Received: by 2002:a81:1e45:0:b0:336:bade:e0 with SMTP id e66-20020a811e45000000b00336bade00e0mr7575383ywe.358.1661500491908;
 Fri, 26 Aug 2022 00:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220816172638.538734-1-bvanassche@acm.org> <decc1ef4-ec85-d947-ec81-ebeaa982f53f@redhat.com>
 <CAMuHMdVDWrLs_KusG8vXA_1z8ORdPnpfxzNqw4jCG_G0D-fn+A@mail.gmail.com>
 <ecf878dc-905b-f714-4c44-6c90e81f8391@acm.org> <CAMuHMdW0WzgQjR33hz9om7ahE5StbDCLozVnZzYAS1WEzStR0w@mail.gmail.com>
 <026ad7cc-5be9-e90b-8c95-0649caf68779@acm.org>
In-Reply-To: <026ad7cc-5be9-e90b-8c95-0649caf68779@acm.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 09:54:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYqceaamrYXK9bFW1mQ+m7HMUA-jhW_+co3b-GB6fAeA@mail.gmail.com>
Message-ID: <CAMuHMdVYqceaamrYXK9bFW1mQ+m7HMUA-jhW_+co3b-GB6fAeA@mail.gmail.com>
Subject: Re: [PATCH] scsi: sd: Revert "Rework asynchronous resume support"
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hannes Reinecke <hare@suse.de>, gzhqyz@gmail.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Bart,

On Tue, Aug 23, 2022 at 8:10 PM Bart Van Assche <bvanassche@acm.org> wrote:
> On 8/22/22 23:41, Geert Uytterhoeven wrote:
> > A lock-up (magic sysrq does not work) during s2idle.
> > I tried bisecting it yesterday, but failed.
> > On v6.0-rc1 (and rc2) it happens ca. 25% of the time, but the closer
> > I get to v5.19, the less likely it is to happen. Apparently 100
> > successful s2idle cycles was not enough to declare a kernel good...
> >
> >      Freezing ...
> >      Filesystems sync: 0.001 seconds
> >      Freezing user space processes ... (elapsed 0.001 seconds) done.
> >      OOM killer disabled.
> >      Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> >      sd 0:0:0:0: [sda] Synchronizing SCSI cache
> >      sd 0:0:0:0: [sda] Stopping disk
> >
> > ---> hangs here if it happens
> >
> >      ravb e6800000.ethernet eth0: Link is Down
> >      sd 0:0:0:0: [sda] Starting disk
> >      Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached
> > PHY driver (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=186)
> >      ata1: link resume succeeded after 1 retries
> >      ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> >      ata1.00: configured for UDMA/133
> >      OOM killer enabled.
> >      Restarting tasks ... done.
> >      random: crng reseeded on system resumption
> >      PM: suspend exit
> >      ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
>
> I'm not sure that is enough information to find the root cause. How

Sorry for not making it clear I didn't expect this to be enough
information.

> about enabling the tp_printk boot option and to enable tracing for
> suspend/resume operations, e.g. as follows?
>
> cd /sys/kernel/tracing &&
> echo 256 > /sys/kernel/tracing/buffer_size_kb &&
> echo nop > current_tracer &&
> echo > trace &&
> echo 1 > events/power/device_pm_callback_start/enable &&
> echo 1 > events/power/device_pm_callback_end/enable &&
> echo 1 > events/power/suspend_resume/enable &&
> echo 1 > tracing_on

Thanks, that generates lots of output (362 KiB/cycle)!
Unfortunately it also has an impact on the probability of lock-ups.
Combined with 'scsi: sd: Revert "Rework asynchronous resume support"',
s2idle now works almost always.

I did manage to trigger the lock-up once with tracing enabled:

     device_pm_callback_end: gpio_rcar e6055400.gpio, err=0
     device_pm_callback_start: gpio_rcar e6055800.gpio, parent: soc,
noirq power domain [suspend]
     device_pm_callback_end: gpio_rcar e6055800.gpio, err=0
     device_pm_callback_start: renesas-cpg-mssr
e6150000.clock-controller, parent: soc, noirq driver [suspend]
     device_pm_callback_end: renesas-cpg-mssr e6150000.clock-controller, err=0
     device_pm_callback_start: sh-pfc e6060000.pinctrl, parent: soc,
noirq driver [suspend]
     device_pm_callback_end: sh-pfc e6060000.pinctrl, err=0
     suspend_resume: dpm_suspend_noirq[2] end
     suspend_resume: machine_suspend[1] begin
     suspend_resume: timekeeping_freeze[5] begin

---> hang

     suspend_resume: timekeeping_freeze[0] end
     suspend_resume: machine_suspend[1] end
     suspend_resume: dpm_resume_noirq[16] begin
     device_pm_callback_start: sh-pfc e6060000.pinctrl, parent: soc,
noirq driver [resume]
     device_pm_callback_end: sh-pfc e6060000.pinctrl, err=0
     device_pm_callback_start: renesas-cpg-mssr
e6150000.clock-controller, parent: soc, noirq driver [resume]
     device_pm_callback_end: renesas-cpg-mssr e6150000.clock-controller, err=0
     device_pm_callback_start: gpio_rcar e6055800.gpio, parent: soc,
noirq power domain [resume]

Oops, timers...

At least it's not related to SCSI ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
