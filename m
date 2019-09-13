Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22282B2325
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 17:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403805AbfIMPOi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 11:14:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390291AbfIMPOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 11:14:38 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47AC521479;
        Fri, 13 Sep 2019 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568387677;
        bh=3T9Q9sUaLhrkbNUz9itiLI8hNw/bZ4OSEdwwqFawRBk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p0JUzxOljyx5MU0pfObXCYvb4fB/+btO7ZimxmuTiSC5u4FLEd0ktKE1HWv3dgDfF
         h675iqNGcxZuh1zzO7Qv1DhqItQskQR4IqT9dW5qWj21n29dI+BY50NscSiyPLaZ2y
         OX5aS0/xsUo/GXuC2Kjodr2Z3qgnfebHz0RYlt0s=
Received: by mail-qk1-f182.google.com with SMTP id z67so28407579qkb.12;
        Fri, 13 Sep 2019 08:14:37 -0700 (PDT)
X-Gm-Message-State: APjAAAU0SVg2Ssrnzy+MUo/5VuqKEKJJCxpCnTnb+rDmQtZ3GmTOvtc0
        ocISw7MajHWuiTvssz7hz1xeQ9DAuZWAEf7tNQ==
X-Google-Smtp-Source: APXvYqzq8j/xc7fUp5Hvbk5M34W55dIuuG8GxWSVX3oTzDuxMHC/PvPV6Jj9KhzLVxJdP7bE8uK9xylKTHLsAA7XJUg=
X-Received: by 2002:a37:682:: with SMTP id 124mr46613503qkg.393.1568387676426;
 Fri, 13 Sep 2019 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161634.27378-1-marek.vasut@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 13 Sep 2019 16:14:24 +0100
X-Gmail-Original-Message-ID: <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
Message-ID: <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 7, 2019 at 5:16 PM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Add dma-ranges property into /soc node to describe the DMA capabilities
> of the bus. This is currently needed to translate PCI DMA ranges, which
> are limited to 32bit addresses.

FYI, I've started working on this problem and issues around
dma-ranges/dma_mask. Hopefully I'll get some patches out next week.

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> NOTE: This is needed for the following patches to work correctly:
>       https://patchwork.ozlabs.org/patch/1144870/
>       https://patchwork.ozlabs.org/patch/1144871/

First I'm seeing those... Well, I do have v7 from 2+ years ago...

Not sure if these take into account the new dma_bus_mask, but that
should simplify solving the issue.

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 95deff66eeb6..2102140a6723 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -330,6 +330,7 @@
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;

Is the limitation in the bus or the PCI bridge or both? The commit
message sounds like it's the PCI bridge in which case this is wrong
(or incomplete). 'dma-ranges' should be on the bus node where the
restriction/translation exists. For PCI devices, that's the PCI bridge
node. So a 32-bit only PCI bridge should have a dma-ranges size of
4GB. If the SoC bus has more restrictions, then that should be in the
PCI bridge parent assuming that restriction also applies to other
devices.

Rob
