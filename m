Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDD9AD7C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 13:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391046AbfIILSW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 07:18:22 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42633 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731115AbfIILSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 07:18:22 -0400
Received: by mail-ot1-f65.google.com with SMTP id c10so12017613otd.9;
        Mon, 09 Sep 2019 04:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zh4V8eaNqjPb0Ic/4Yf7AfafCdOdwH/svi7VuLX2orY=;
        b=lLN11C23xfAH7i8bFQztnzIUJN81i90GGniVnzsT2bmlyFYCLNrQGkWJob05jaN5Tc
         1+AK6jUxUmy+WuYw7ruNK11Ua85dawghegS6qiFg85Unr4yqzA7ar2vr3qf/DXW6KPp9
         KVp2ZL96vMi/niRA20+Zrbk8bfuq7BSsP5NhpGIQJlpQUrApK1PRRwTT+5KceYW7q6v5
         DgZuGyr5myrXrko2UYb1g5rrEuQ01tQWUYyV1s99xjGpl4pZg8ylnkiHUP2869R5WO5G
         wS7NWD6eKWAmDOFFJzEnQsEogmxFg62zFdpuF8EAGlLoFeOeOteCQ5wqluIM3G51rHV+
         BD/A==
X-Gm-Message-State: APjAAAVbDR8NDNeUcE/mvg7XAZroA0fhM/l2EWgBGwRfO0TR+evpDvxi
        Ys+Bh9rs/QEwzaJMaTHtPoZ6NLXgBHx9pJRMzBQ=
X-Google-Smtp-Source: APXvYqxoJ5YE9dczWZW9yBoBQ0LHRTHR+SjV1aqmUHb5bh9Jk8Mb4XXtlEmXIZODlEij2FTkD0l0LwW/9wgClhVgq6E=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr18090742oth.250.1568027900747;
 Mon, 09 Sep 2019 04:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161634.27378-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 13:18:07 +0200
Message-ID: <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Sep 7, 2019 at 6:16 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Add dma-ranges property into /soc node to describe the DMA capabilities
> of the bus. This is currently needed to translate PCI DMA ranges, which
> are limited to 32bit addresses.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -330,6 +330,7 @@
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;

Shouldn't the length be 0x80000000 (for all SoCs)?
Or should we allow DMA to internal System RAM, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
