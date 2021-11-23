Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1988F459A70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 04:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhKWDWz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 22:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhKWDWy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 22:22:54 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DC4C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 19:19:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id l22so87027971lfg.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3HebcSh34LsYsBPxLenl8PvVExAhre2aJvxFwi4RQ10=;
        b=A8m6wTiacfZZC+9K8b5fZfX3lTn1S+9cVA9sIJYQ+57pxFX18cPxTZNnyXHBhqvccr
         Sgjur+K+Mnfkxjn2gML8OxsfM+9KsDo2uz5HS/kmkqehQmY7dMUJ3JNrfMuyvccNl2fK
         XA+nqoqCK75gFIyOVy5vyCMFiaeRjyHngUPy+rYBG2sNCAix5ASp7r3UES3iyP9s4jcz
         mK7/X9X544b9U1XwbUVa5Nw/LD+6vxwOLFVeSU08SYThu788ePw7lcRYLqG9kPEuDSAF
         uZqEym3CBooDmxckbNFpCUs0JlXtDjBFDYhs9AgzyaDBPog+bLSe7nKqPDgocUROVQQ7
         DcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3HebcSh34LsYsBPxLenl8PvVExAhre2aJvxFwi4RQ10=;
        b=vYRCnMV+HoPj6QnoWq9GvklH3BWJEWea/FoPCG8EWoBGXBUHBarAueWZV3R/r+CzJc
         uF58gYcgyCo1iymD99fzPBCMQcCs2wCo9rfxb3dZ7wkxB+Gz/DqXnxo4ktoiFLVL0Bti
         Jd0YlXMITUQfLJ3XNbM7THiMpLJzjyGRBf4nliHJ+4CSSWvIDeSRKjQyr8pr3QwNyYXu
         OOoRInypYR11U20lsZOMrzHXLp659nyMEW12DIAfAO4VU/tA9iX6DpQCkTYVGKAuOgaR
         9/I6dFU9KEPzAZMePedt1vWQo8Fear6QVuMshDwgdFi+bAOgR2B/2/9T4BjJPvb9a/5S
         hGug==
X-Gm-Message-State: AOAM531XIap0Z8fvYlFP/2ICvqVjoRnp5qLYh0qEBj3QA+J2suzOib1C
        LFNbnLnU6mbdKkG7MJLfJcOUAqBsPk0dQelV6v5/EW0oaMQ=
X-Google-Smtp-Source: ABdhPJwSZ8v5fTpzEbcenUioJ53xv3pIQI9GTWXpY+Zhd5HOA8PGvusL8REO33kVVvy/fmzlu9BYwiuXnXii+JivBdA=
X-Received: by 2002:a05:6512:3456:: with SMTP id j22mr1449854lfr.89.1637637585378;
 Mon, 22 Nov 2021 19:19:45 -0800 (PST)
MIME-Version: 1.0
References: <163742290656.715.15960553560678858057.sendpatchset@octo> <163758390064.2984710.8277487311059323967@Monstersaurus>
In-Reply-To: <163758390064.2984710.8277487311059323967@Monstersaurus>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 23 Nov 2021 12:19:33 +0900
Message-ID: <CANqRtoQgXGLr421s4MOMFiLOiHVfoYX-MVAmKhUPLHu_ndR6dw@mail.gmail.com>
Subject: Re: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, johan@kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Nov 22, 2021 at 9:25 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Magnus,
>
> Quoting Magnus Damm (2021-11-20 15:41:46)
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
>
> Very interesting use of the DMA capabilities for the SCIF to generate
> output on the lines.

Indeed there are quite a few hardware components working together to
emulate a low signal by sending a mostly-zero pattern on the UART TX
line. So far I've adjusted the size of the data buffers to avoid too
many wake ups per second for transmitting. In my opinion it would be
even better to use some sort of circular DMA mode and have zero wake
ups. I'm quite sure the hardware would support such configuration, but
how to make it happen with software is a different story.

> What's the maximum speed of the SCIF? I could see this being further
> used to provide a software defined controller for RGB LEDs [0], which
> have often previously used SPI in a similar fashion to your proposal [1].
>
> https://github.com/msperl/rgbled-fb/blob/master/ws2812b-spi-fb.c
> https://www.arrow.com/en/research-and-events/articles/protocol-for-the-ws2812b-programmable-led

Thanks. Indeed a software defined controller for RGB LEDs would be
very interesting to see.

The maximum speed of the SCIF is most likely in the Mbit-range but it
really depends on the SoC type and perhaps also board specific
external crystal configuration. And of course the device that the UART
is connected to together with the quality of the PCB.

Initially I had planned to rely on UART hardware break condition
detection for the key press event, but with the 9600 bps on my
SN75HC05 breadboard prototype the signals are looking pretty noisy.
Now I have adjusted my expectation to "any UART error condition" for
the key detection to make something work with what I've got. =)

But to get those UART errors related to the key event into the serdev
driver some framework extensions would most likely be needed.

Cheers,

/ magnus
