Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83950458A46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 09:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbhKVIGD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 03:06:03 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:46951 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhKVIGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 03:06:02 -0500
Received: by mail-ua1-f48.google.com with SMTP id az37so34718256uab.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 00:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DdfwXKMcyH6yhEepab/nIKboMNc0CqIbCfH232cmKcU=;
        b=sid1T7NAWGEd0v836Nz0X2m+vwtKaJnPokQE6NYlgT572MBvLu9w3OS4y4sMx4R+Vt
         6LCPwtXMnV2tPsoAqrmxFm53+OMXNwV/p0Ht6fjs7kfppd6l2yJczKNwgYecRrUHvFS/
         vwRyzVj6+j/1SbGKsuDqWqNFtdaYxTjc/vBc3AZIhyFzwo53V6d/DaWWBfN+XcDIIAnA
         Zar3RAM9T0LaT6vP0SvXKaUGfFVMIQjCLS7I4BlKW7D9c0pLZcWoMEeAMIdHeiN7PUcA
         dXNp+OhtS76abKScMT3Z8cfJqE4vmEoh41UGcH3Fr6k6aW7WmOOkxNNyNdNxLCBkWF1d
         dbZg==
X-Gm-Message-State: AOAM532uPAXMVc1fGG7T74KQuFai8qupILdfaF1OOKK6nhYTXjJLgj/V
        gE0YQFGu9mUUqD4Q4uXERjuDtTtYGr4GLQ==
X-Google-Smtp-Source: ABdhPJylYx4Wc9Wc3LqcIYRM4+oQ6nn6JhWc2J5FXpTFjalSG8i4gjinV3QtW5Zber2jToTsEZlNiw==
X-Received: by 2002:ab0:72c8:: with SMTP id g8mr81149001uap.86.1637568176034;
        Mon, 22 Nov 2021 00:02:56 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id g16sm4302295vsp.18.2021.11.22.00.02.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 00:02:55 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 188so6728876vku.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 00:02:55 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr157590788vkh.11.1637568175225;
 Mon, 22 Nov 2021 00:02:55 -0800 (PST)
MIME-Version: 1.0
References: <163742290656.715.15960553560678858057.sendpatchset@octo>
In-Reply-To: <163742290656.715.15960553560678858057.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Nov 2021 09:02:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6-k2bd98sbjENPm6pJcjLmNgBGPc-KxeLiMrGi8sCwQ@mail.gmail.com>
Message-ID: <CAMuHMdV6-k2bd98sbjENPm6pJcjLmNgBGPc-KxeLiMrGi8sCwQ@mail.gmail.com>
Subject: Re: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
To:     Magnus Damm <damm@opensource.se>
Cc:     linux-renesas-soc@vger.kernel.org, robh@kernel.org,
        johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sat, Nov 20, 2021 at 5:32 PM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Here's a work-in-progress patch for shared pin LED and KEY functionality:
>  - UART TX Serdev LED driver prototype (functional)
>  - UART RX Serdev KEY driver prototype (partial)
>  - r8a77995 Draak DTS modifications to use above drivers with SCIF0
>
> With this code my hope is to use hardware to drive an LED and allow
> detection of a key press without software performing any kind of polling.
>
> In theory on SoCs that support UART RX and TX on the same pin (and also
> open drain output) with the above software it is possible to handle boards
> with single pin shared LED and KEY functionality.
>
> This prototype on r8a77995 Draak makes use of 3 pins and an external circuit:
>  - LED13/SW59/GP4_07 <-> EXIO_A:10 (CN46)
>  - SCIF0_RX/GP4_20 <- EXIO_A:38 (CN46)
>  - SCIF0_TX/GP4_21 -> EXIO_A:36 (CN46)
> Ether-AVB PHY connector (CN23) has 3.3V on pin 54 and 56 and GND on 14
> In the future SCIF1 and SCIF3 may also be used for other LEDs and switches.
>
> Currently two inverters on SN74HC05 together with pull-ups are used to extend
> the D3 SoC and the Draak board with open drain functionality and also tie
> together the TX and RX pins with LED13/SW59.
>
> The prototype LED driver allows user space to turn on/off the LED using:
>  # echo 1 > /sys/class/leds/serial0-0/brightness
>  # echo 0 > /sys/class/leds/serial0-0/brightness
> Must be easy to extend the driver with some degree of brightness control.
>
> Apart from some general brush up the following issues have surfaced:
>  - "controller busy" error happens when more than one serdev is used
>  - it is unclear how to take RX errors from serdev and generate key events
>  - there seem to be no way to silence "sh-sci e6e60000.serial: frame error"
>  - the DTS "current-speed" property looks like sw config and not hw description
>
> Obviously not for upstream merge as-is. Might however be useful as SCIF error
> test bench and/or as potential (corner) use case for serdev.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch, which is definitely an interesting approach!

> --- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts 2021-11-20 23:47:14.965609878 +0900
> @@ -479,13 +495,29 @@
>         status = "okay";
>  };
>
> +&scif0 {
> +       pinctrl-0 = <&scif0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +#if 1
> +        led {
> +                compatible = "serdev,led";
> +                current-speed = <9600>;
> +        };
> +#else
> +        key {
> +                compatible = "serdev,key";
> +                current-speed = <9600>;
> +        };
> +#endif

So LED and key are still mutually-exclusive, despite using 3 signals
into the SoC?

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
