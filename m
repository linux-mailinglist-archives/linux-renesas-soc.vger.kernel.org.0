Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DF1AD4AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 10:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfIIITd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 04:19:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44244 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfIIITd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 04:19:33 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so11589676otj.11;
        Mon, 09 Sep 2019 01:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpNgmTfgs+Y6rqNSVh0GjVp5y0qF00Dm+QjFQehUQnM=;
        b=KQsJCJfVbxXA6gYbG/faONqsJmAz6V3gD3QoTqKgJzulVRWIP6fkfju8LDV1nBBEwd
         JUClkLgZV5/P3hPdi9ajgZn8HE9uUO2vn0gVCj9nq6z9QFkEQ+aUFFFkxP+9YkqjsHzt
         0+L8bi2iD5MSdESwq84aZ7GxxkstDUjzhZTK1AqjIUYWigQs58DCO1O1dk2vm+YpExdI
         9AqrGuldZIPcJjtnkQP7BDAaS9ZVj1TG90ELFOoQ7OfK75sZ+VPV/j1qUbIdsi5F1ylE
         5R67nj69lCW29d9GoLpES1xEYPVafcfVeenoeNo9f4e/Cc9kVX247JIX/1kHaIWJEomU
         sbwg==
X-Gm-Message-State: APjAAAV+1N2thJWCRUYN9SVdP6TVW/KhEAxPMeKwZyZAE+1OPipsU09H
        GWyT27aM8SfI7NkooNyG/x1IUWLFU1H5/Cd9sy0=
X-Google-Smtp-Source: APXvYqxHyZJaWZdZUyPi2ApqFXT7o6ts5V7EdJCAfrN0VKZvw8Iysfc9E3B7ZPbwU6l0QzjgF99yP96BUWWHfygy+TU=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr18888843otq.39.1568017172441;
 Mon, 09 Sep 2019 01:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161634.27378-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 10:19:21 +0200
Message-ID: <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
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

Thanks for your patch!

> NOTE: This is needed for the following patches to work correctly:
>       https://patchwork.ozlabs.org/patch/1144870/
>       https://patchwork.ozlabs.org/patch/1144871/

What happens with the above patches applied, and without this one?

As PCI/OF driver patches go in through different trees, is it safe to apply
this patch now?
Should they go in together?

>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +

Do we need similar patches for the other R-Car Gen3 and RZ/G2 DTS files?
What about R-Car Gen2 and RZ/G1?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
