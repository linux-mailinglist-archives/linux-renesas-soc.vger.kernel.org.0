Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40FC21EA9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 11:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfEOJF2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 05:05:28 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41946 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOJF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 05:05:28 -0400
Received: by mail-ua1-f68.google.com with SMTP id s30so734008uas.8;
        Wed, 15 May 2019 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6lAQ9R3PikvadpZD3xhB2DjQbP5bNLPUHHpdSIWbuTA=;
        b=VlcFERiAL7VQms2MpJ/72XAA2KAMmw3zo2tetwhe1KGQIG0Kd1xGjBrWlE56ayn50a
         J4Gutmi0Z5YPvdT0VFikCy/AaTVEUj+iLhOgUzdOYmUo5e5cg+WS1di3MtlosxVbNQLW
         xs8RMCDfUGEJr4Pr9r3cMTp1DRom6d7LgAKEOE5DTuExfypV0213aTXzxd857lYsdJdh
         pSoSnLErkkA30NBlk5RfPEZ34a9MN7po76ZmICvg3j3o2BvlvVOAHWwBqPlHw2ZiY9e+
         3AVPTt60gmczsxK6e7r3SjZnqBdoySG5spZNwoEmPL2/zRtmyzf5jSraNSv/vBv+RpRI
         PkFA==
X-Gm-Message-State: APjAAAWZDrfl7DoLZI4c4prjC4/RyMXORHCpIkp1dJyrvRcm7g2Hyqx2
        XC1aNSt5ZbDriNyGUlUAiJqkjOXHfIfUyjjg0BI=
X-Google-Smtp-Source: APXvYqzsg6f6DUMuQ7gIu5agOb7uDDuzx96TZohqMK4b0wW1zg94Q0THeqHVr5B2MaEpmig5CszEXqTiRrdDW9W03hM=
X-Received: by 2002:ab0:42e4:: with SMTP id j91mr15010377uaj.28.1557911126802;
 Wed, 15 May 2019 02:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-14-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-14-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 11:05:14 +0200
Message-ID: <CAMuHMdW7z-segBTq_9Vjc54GZqKhCwsCFSz559fER=rwbhy7Cg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add EHCI and OHCI host support for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -329,6 +329,72 @@

> +               usb2_phy0: usb-phy@e8218200 {
> +                       compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
> +                       reg = <0xe8218200 0x10>;
> +                       interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 61>, <&usb_x1_clk>;
> +                       clock-names = "fclk", "usb_x1";

So this should be "fck" too, probably.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
