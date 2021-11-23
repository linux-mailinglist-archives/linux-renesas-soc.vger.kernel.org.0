Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A05459A41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 03:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhKWC6H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 21:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhKWC6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 21:58:06 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E07C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 18:54:59 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id l7so2793268lja.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 18:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dTf8vBYPTrCYrYok8uNqsVe5yli/Nz4CRKeRc0uq+4=;
        b=Umeh/NVkaOrdgm9enOw/O9v2Ul8yIpMnflI1boXvr5GMYIbimxOmWiyPhzEi9ZrE7W
         O5aMYldula/I6z/BUiG8RQUteg/QLwVjNvnKfKRGJWZcFrcUHcgIjUp5K206Ix5bGhkK
         qI4QJqSStja6HgPm95FzbLcX9b/05JVsr0cL7TlAUZd0/FFns0F+27v2wgdxvODQxJs1
         0G/ZqIlrIJWvileGQPhX3wIeaB5H3heEsSXNliSwuLyA9NvB51x4SiILO/afnoPm/Xtg
         wzq2uF9eKjEuQJPiUIKGb4yz/CDNjgbd4MrMLlkCjT9f5VQDP1Z3izCxf3Vafe4SX8KV
         WJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dTf8vBYPTrCYrYok8uNqsVe5yli/Nz4CRKeRc0uq+4=;
        b=C2uyk4kPH1hkZ7VaVMfXIPu0yQfvHLXMnGZjUNrbFJiLy7QEk9VECq02Vrif1lwKUl
         weK9B8Qlvoy7w7kCIp6TEacpivJqZc6I8zP3KSBJqzCXojrTCPmsx1iWA1lldDLh0pYC
         oYDI7NH2Md2aVmOsGmmjrPiULxthUMkkbcFgt9IEwyiyLLWzwKLWb4t1qtCpTyCtlZFF
         I4YWMA8y0h6bdBjNEyrzyf2pTWf1Kd6WbF1NrqUHikS/DZ85qnQXbukxMRCmy+c1Xh/O
         Y7n2NA5XYUcDGn6wrk0IgbRKlZvP48TA8sZ+LjM5qx3UinaT+X5XH2ETs+uDRDeQvaMh
         VmqA==
X-Gm-Message-State: AOAM5300cglRrwjNeN3TG0cZlqUO9cy4w3zSDrMCaVaXb+AvHM9EZvAI
        SzmHQiteIt7rg+TYqrY78Eghgl7TdNmMqfpHDasjnw3I4f8=
X-Google-Smtp-Source: ABdhPJy0aGiACguFh+ayCRSP4485TdGprKJmGIQWmKTx3rGopnrKp4IKRtQw2UttvZTF3ApflY4oLWztO2rCnSSvXDQ=
X-Received: by 2002:a05:651c:989:: with SMTP id b9mr1357545ljq.410.1637636097519;
 Mon, 22 Nov 2021 18:54:57 -0800 (PST)
MIME-Version: 1.0
References: <163742290656.715.15960553560678858057.sendpatchset@octo> <CAMuHMdV6-k2bd98sbjENPm6pJcjLmNgBGPc-KxeLiMrGi8sCwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV6-k2bd98sbjENPm6pJcjLmNgBGPc-KxeLiMrGi8sCwQ@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 23 Nov 2021 11:54:45 +0900
Message-ID: <CANqRtoQsmB-5Q7QZJJxnG7nftym+9C+s8GCtxgjHDobmwjNOaw@mail.gmail.com>
Subject: Re: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Nov 22, 2021 at 5:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Sat, Nov 20, 2021 at 5:32 PM Magnus Damm <damm@opensource.se> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Here's a work-in-progress patch for shared pin LED and KEY functionality:
> >  - UART TX Serdev LED driver prototype (functional)
> >  - UART RX Serdev KEY driver prototype (partial)
> >  - r8a77995 Draak DTS modifications to use above drivers with SCIF0
> >
> > With this code my hope is to use hardware to drive an LED and allow
> > detection of a key press without software performing any kind of polling.
> >
> > In theory on SoCs that support UART RX and TX on the same pin (and also
> > open drain output) with the above software it is possible to handle boards
> > with single pin shared LED and KEY functionality.
> >
> > This prototype on r8a77995 Draak makes use of 3 pins and an external circuit:
> >  - LED13/SW59/GP4_07 <-> EXIO_A:10 (CN46)
> >  - SCIF0_RX/GP4_20 <- EXIO_A:38 (CN46)
> >  - SCIF0_TX/GP4_21 -> EXIO_A:36 (CN46)
> > Ether-AVB PHY connector (CN23) has 3.3V on pin 54 and 56 and GND on 14
> > In the future SCIF1 and SCIF3 may also be used for other LEDs and switches.
> >
> > Currently two inverters on SN74HC05 together with pull-ups are used to extend
> > the D3 SoC and the Draak board with open drain functionality and also tie
> > together the TX and RX pins with LED13/SW59.
> >
> > The prototype LED driver allows user space to turn on/off the LED using:
> >  # echo 1 > /sys/class/leds/serial0-0/brightness
> >  # echo 0 > /sys/class/leds/serial0-0/brightness
> > Must be easy to extend the driver with some degree of brightness control.
> >
> > Apart from some general brush up the following issues have surfaced:
> >  - "controller busy" error happens when more than one serdev is used
> >  - it is unclear how to take RX errors from serdev and generate key events
> >  - there seem to be no way to silence "sh-sci e6e60000.serial: frame error"
> >  - the DTS "current-speed" property looks like sw config and not hw description
> >
> > Obviously not for upstream merge as-is. Might however be useful as SCIF error
> > test bench and/or as potential (corner) use case for serdev.
> >
> > Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Thanks for your patch, which is definitely an interesting approach!

Thanks! I've been meaning to look into serdev for a while now and
scratching an itch like this is one way to get acquainted with the
code base.

> > --- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts 2021-11-20 23:47:14.965609878 +0900
> > @@ -479,13 +495,29 @@
> >         status = "okay";
> >  };
> >
> > +&scif0 {
> > +       pinctrl-0 = <&scif0_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       status = "okay";
> > +#if 1
> > +        led {
> > +                compatible = "serdev,led";
> > +                current-speed = <9600>;
> > +        };
> > +#else
> > +        key {
> > +                compatible = "serdev,key";
> > +                current-speed = <9600>;
> > +        };
> > +#endif
>
> So LED and key are still mutually-exclusive, despite using 3 signals
> into the SoC?

In this patch indeed they are, yes. It is quite possible to enable
both LED and key in the DTS today, but during runtime I could not get
both drivers to load.

As you say, the three signals into the SoC (instead of 1) is currently
working around a hardware limitation. The mutual-exclusiveness with
one serdev driver enabled out of two is however working around a
software limitation. It seems that there is room for improvement both
on the hardware and the software side.

The main reason for the software limitation seems to be that currently
the serdev core does not support more than one driver at a time, see
"controller busy" error statement in:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/tty/serdev/core.c?h=renesas-drivers-2021-11-16-v5.16-rc1

To be honest, my approach of two serdev drivers in parallel with one
serial port device might not exactly be how multi-device support with
serdev was envisioned. At the same time I can't really imagine what
more of a sane multi-device serdev use case would be. Any ideas?

Cheers,

/ magnus
