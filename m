Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A5A459D3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 08:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhKWIBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 03:01:10 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:34705 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbhKWIBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 03:01:10 -0500
Received: by mail-ua1-f44.google.com with SMTP id n6so42036820uak.1;
        Mon, 22 Nov 2021 23:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RP0XAREHWk1vXPFirIfjRxCE78Uip3ePtiPHMwe8l64=;
        b=FXGe52fhnwNuooktQ9XuAFbnsMtqrtSjViSj2DRMF7Oe4+0ePOlksu9wNpxTQ5ez3p
         g+lDu6fQflLjkvbtzQfJPI5tGdEyg/+h/Ak03zzynnhmdD7PbwYO6NqHc7GFb3U5e+hn
         0uDkddGisKibaeNPf1OIsa/xreYnfUjyOyncl8cdz1cdlIOHS/8aXOhPoHZle347+y41
         HTw03xhVB8M4OtbhJzZ0lnkYeYnepaUjgHNp4vhFxmbN7k7OT+VixZ8WSyBrzUW75sYC
         6wmgB6o1PXU+wOOeNvigIFuyoXnqEdMID7qikTPTR2JMBp0DYBPMvWQl2FuR+YnoXTw7
         D7AA==
X-Gm-Message-State: AOAM531hjL3phcv3y/1FHGy/TCcqVPy6uIvlZ1zgCJkVbUympyqSeDGO
        mkySlDGXh8EILFsg2vpwu6Gvpz6odIKMag==
X-Google-Smtp-Source: ABdhPJy32HlZalqS0X8Yj2vYRKWi502PpYDuEDhKc2Usp8onCIL1+ilnrIkgp1jIKeyHtio45DvtgA==
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr6066672vsl.0.1637654281354;
        Mon, 22 Nov 2021 23:58:01 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 62sm5923050uam.6.2021.11.22.23.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 23:58:01 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id o1so42004104uap.4;
        Mon, 22 Nov 2021 23:58:00 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr5698415vsb.9.1637654280203;
 Mon, 22 Nov 2021 23:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org> <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
 <8735no70tt.wl-maz@kernel.org> <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 08:57:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
Message-ID: <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kernel-team@android.com, Rob Herring <robh@kernel.org>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Mon, Nov 22, 2021 at 5:58 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Nov 22, 2021 at 2:54 PM Marc Zyngier <maz@kernel.org> wrote:
> > On Mon, 22 Nov 2021 13:10:32 +0000,
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Mon, Nov 22, 2021 at 11:30 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > Since 041284181226 ("of/irq: Allow matching of an interrupt-map local
> > > > to an interrupt controller"), a handful of interrupt controllers have
> > > > stopped working correctly. This is due to the DT exposing a non-sensical
> > > > interrupt-map property, and their drivers relying on the kernel ignoring
> > > > this property.
> > > >
> > > > Since we cannot realistically fix this terrible behaviour, add a quirk
> > > > for the limited set of devices that have implemented this monster,
> > > > and document that this is a pretty bad practice.
>
> > > > --- a/drivers/of/irq.c
> > > > +++ b/drivers/of/irq.c
> > > > @@ -76,6 +76,36 @@ struct device_node *of_irq_find_parent(struct device_node *child)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(of_irq_find_parent);
> > > >
> > > > +/*
> > > > + * These interrupt controllers abuse interrupt-map for unspeakable
> > > > + * reasons and rely on the core code to *ignore* it (the drivers do
> > > > + * their own parsing of the property).
> > > > + *
> > > > + * If you think of adding to the list for something *new*, think
> > > > + * again. There is a high chance that you will be sent back to the
> > > > + * drawing board.
> > > > + */
> > > > +static const char * const of_irq_imap_abusers[] = {
> > > > +       "CBEA,platform-spider-pic",
> > > > +       "sti,platform-spider-pic",
> > > > +       "realtek,rtl-intc",
> > > > +       "fsl,ls1021a-extirq",
> > > > +       "fsl,ls1043a-extirq",
> > > > +       "fsl,ls1088a-extirq",
> > > > +       "renesas,rza1-irqc",
> > > > +};
> > >
> > > Are you sure "renesas,rza1-irqc" handles this wrong? How should it
> > > be handled instead? I read the other thread[1], but didn't became
> > > any wiser: interrupts are mapped one-to-one with the RZ/A1 IRQC.
> > >
> > > In both v5.15 and v5.16-rc1, interrupts seem to work fine on RSK+RZA1
> > > and RZA2MEVB, both with gpio-keys and when used as a wake-up interrupt.
>
> Oops, it turned out my "v5.15" tree was not plain v5.15, but v5.15 with
> some parts of next, including an older version of commit 041284181226.
>
> > This is odd. 5.16-rc1 should actively breaks the behaviour, as each
> > interrupt is directly routed to the GIC. Here's an extract of the DT
> > for r7s9210:
> >
> >     interrupt-map = <0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> >                     <1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> >                     <2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> >                     <3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> >                     <4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> >                     <5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> >                     <6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> >                     <7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> >
> > I expect v5.16-rc1 to honour the routing described here and not
> > involve rza1-irqc, because that's what the DT says.
> >
> > > With this patch applied, I see double keypresses with evtest: when
> > > pressing a key, I get a key-down event, immediately followed by a
> > > key-up event. When releasing the key, I again get two events.
> > >
> > > Good (v5.15 or v5.16-rc1):
> > >
> > >     Event: time 1637585631.288990, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > >     Event: time 1637585631.288990, -------------- SYN_REPORT ------------
> > >     Event: time 1637585631.499924, type 1 (EV_KEY), code 2 (KEY_1), value 0
> > >     Event: time 1637585631.499924, -------------- SYN_REPORT ------------
> > >
> > > Bad (v5.16-rc1 + this patch):
> > >
> > >     Event: time 1637585341.946647, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > >     Event: time 1637585341.946647, -------------- SYN_REPORT ------------
> > >     Event: time 1637585341.960256, type 1 (EV_KEY), code 2 (KEY_1), value 0
> > >     Event: time 1637585341.960256, -------------- SYN_REPORT ------------
> > >     Event: time 1637585342.146775, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > >     Event: time 1637585342.146775, -------------- SYN_REPORT ------------
> > >     Event: time 1637585342.160092, type 1 (EV_KEY), code 2 (KEY_1), value 0
> > >     Event: time 1637585342.160092, -------------- SYN_REPORT ------------
> >
> > Is there any chance you could trace whether rza1-irqc gets called at
> > all when setting up and handling the interrupt?
>
> I reran my tests ([A] pristine v5.15, [B] my current tree based on v5.16-rc1,
> [C] my tree plus your patch).
>
> [A] and [B] behave the same:

Sorry, [A] and [C]:

>
>   Boot:
>
>     rza1_irqc_translate:152: domain :soc:interrupt-controller@fcfef800
> hwirq 3 type 3
>     rza1_irqc_alloc:115: domain :soc:interrupt-controller@fcfef800
> virq 41 nr_irqs 1
>     rza1_irqc_alloc:127: param[0] = 0
>     rza1_irqc_alloc:127: param[1] = 3
>     rza1_irqc_alloc:127: param[2] = 4
>     rza1_irqc_translate:152: domain :soc:interrupt-controller@fcfef800
> hwirq 2 type 3
>     rza1_irqc_alloc:115: domain :soc:interrupt-controller@fcfef800
> virq 42 nr_irqs 1
>     rza1_irqc_alloc:127: param[0] = 0
>     rza1_irqc_alloc:127: param[1] = 2
>     rza1_irqc_alloc:127: param[2] = 4
>     rza1_irqc_translate:152: domain :soc:interrupt-controller@fcfef800
> hwirq 5 type 3
>     rza1_irqc_alloc:115: domain :soc:interrupt-controller@fcfef800
> virq 43 nr_irqs 1
>     rza1_irqc_alloc:127: param[0] = 0
>     rza1_irqc_alloc:127: param[1] = 5
>     rza1_irqc_alloc:127: param[2] = 4
>     rza1_irqc_set_type:76: hwirq 3 type 3
>     rza1_irqc_set_type:76: hwirq 2 type 3
>     rza1_irqc_set_type:76: hwirq 5 type 3
>
>   Pressing all 3 keys on RSK+RZA1:
>
>     rza1_irqc_eoi:62: hw_irq 3 IRQRR 0x8
>     rza1_irqc_eoi:62: hw_irq 3 IRQRR 0x8
>     rza1_irqc_eoi:62: hw_irq 2 IRQRR 0x4
>     rza1_irqc_eoi:62: hw_irq 2 IRQRR 0x4
>     rza1_irqc_eoi:62: hw_irq 5 IRQRR 0x20
>     rza1_irqc_eoi:62: hw_irq 5 IRQRR 0x20
>
>   /proc/interrupts:
>
>     41:          2  rza1-irqc   3 Edge      SW1
>     42:          2  rza1-irqc   2 Edge      SW2
>     43:          2  rza1-irqc   5 Edge      SW3
>
>   evtest:
>
>     Event: time 1637597938.224621, type 1 (EV_KEY), code 2 (KEY_1), value 1
>     Event: time 1637597938.224621, -------------- SYN_REPORT ------------
>     Event: time 1637597938.232198, type 1 (EV_KEY), code 2 (KEY_1), value 0
>     Event: time 1637597938.232198, -------------- SYN_REPORT ------------
>     Event: time 1637597938.532939, type 1 (EV_KEY), code 2 (KEY_1), value 1
>     Event: time 1637597938.532939, -------------- SYN_REPORT ------------
>     Event: time 1637597938.542304, type 1 (EV_KEY), code 2 (KEY_1), value 0
>     Event: time 1637597938.542304, -------------- SYN_REPORT ------------
>     Event: time 1637597941.772467, type 1 (EV_KEY), code 3 (KEY_2), value 1
>     Event: time 1637597941.772467, -------------- SYN_REPORT ------------
>     Event: time 1637597941.782309, type 1 (EV_KEY), code 3 (KEY_2), value 0
>     Event: time 1637597941.782309, -------------- SYN_REPORT ------------
>     Event: time 1637597942.110321, type 1 (EV_KEY), code 3 (KEY_2), value 1
>     Event: time 1637597942.110321, -------------- SYN_REPORT ------------
>     Event: time 1637597942.122303, type 1 (EV_KEY), code 3 (KEY_2), value 0
>     Event: time 1637597942.122303, -------------- SYN_REPORT ------------
>     Event: time 1637597945.256109, type 1 (EV_KEY), code 4 (KEY_3), value 1
>     Event: time 1637597945.256109, -------------- SYN_REPORT ------------
>     Event: time 1637597945.262132, type 1 (EV_KEY), code 4 (KEY_3), value 0
>     Event: time 1637597945.262132, -------------- SYN_REPORT ------------
>     Event: time 1637597945.630469, type 1 (EV_KEY), code 4 (KEY_3), value 1
>     Event: time 1637597945.630469, -------------- SYN_REPORT ------------
>     Event: time 1637597945.642299, type 1 (EV_KEY), code 4 (KEY_3), value 0
>     Event: time 1637597945.642299, -------------- SYN_REPORT ------------
>
> So despite seeing only 2 interrupts per key, gpio-keys generates
> 4 events per key.
>
> With my v5.16-rc1-based tree, rza1_irqc_translate(), rza1_irqc_alloc(),
> rza1_irqc_set_type(), and rza1_irqc_eoi() are indeed not called.

Hence this is [B], i.e. after the bad commit:

>
>   /proc/interrupts:
>
>     41:     242419     GIC-0  35 Level     SW1
>     42:     142771     GIC-0  34 Level     SW2
>     43:     136355     GIC-0  37 Level     SW3
>             ^^^^^^
>             Oops
>
>   evtest:
>
>     Event: time 1637598499.076306, type 1 (EV_KEY), code 2 (KEY_1), value 1
>     Event: time 1637598499.076306, -------------- SYN_REPORT ------------
>     Event: time 1637598499.350985, type 1 (EV_KEY), code 2 (KEY_1), value 0
>     Event: time 1637598499.350985, -------------- SYN_REPORT ------------
>     Event: time 1637598501.979770, type 1 (EV_KEY), code 3 (KEY_2), value 1
>     Event: time 1637598501.979770, -------------- SYN_REPORT ------------
>     Event: time 1637598502.370948, type 1 (EV_KEY), code 3 (KEY_2), value 0
>     Event: time 1637598502.370948, -------------- SYN_REPORT ------------
>     Event: time 1637598504.660146, type 1 (EV_KEY), code 4 (KEY_3), value 1
>     Event: time 1637598504.660146, -------------- SYN_REPORT ------------
>     Event: time 1637598505.030947, type 1 (EV_KEY), code 4 (KEY_3), value 0
>     Event: time 1637598505.030947, -------------- SYN_REPORT ------------
>
> So despite receiving an interrupt storm, gpio-keys behaves as expected.
>
> I will retest tomorrow with an old kernel, as I do not remember seeing such
> behavior when I wrote the rza1-irqc driver.

Summarized:
  - Before the bad commit, and after your fix, irqc-rza1 is invoked,
    and the number of interrupts seen is correct, but input events
    are doubled.
  - After the bad commit, irqc-rza1 is not invoked, and there is an
    interrupt storm, but input events are OK.

Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
