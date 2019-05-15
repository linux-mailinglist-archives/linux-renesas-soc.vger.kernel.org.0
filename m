Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00DDD1E9F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfEOIVn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:21:43 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33140 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOIVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:21:43 -0400
Received: by mail-vs1-f65.google.com with SMTP id y6so1143959vsb.0;
        Wed, 15 May 2019 01:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQ7CuFfcK6T5K16afMKd2BR4xgi0R5jLtN70np9Dx74=;
        b=PhfnFkWBZzWj/Es1Xt2TkK5ZENcyvO7XTYSz6B7p6ISmVmr9l/HPGJCKQVqz/v0UcB
         1T42QtJA5rC0WQYg1bwWZhuV0hfp1MeYi3PICg5UvbcNi/fSzC4ZfgW1FHpP3QnfGK49
         n7P+fGNhh/52zDeYWCmqev3n21pL4z/oh7Aw0T9UI/3XWHRs8f0X5BKr7nbeiwnEZ0DT
         3mO2hS+ijcu/YJYy3njenxTDLDqnZHOuf29fABVlt/BG80htfE8KgryA8H7w30WEILrm
         9QLrYtRWo+LNDuMxIP22lIATwjz2T82wpA6OaLW136jruYeFFoYLPLyFhue6iBnDDuoP
         QVtQ==
X-Gm-Message-State: APjAAAW0SA7fwNd8ZXpZeHxY0BiOJdEbbRWxzXuSZgxGKbegyF/LKJ24
        pSQPX6fMnY9QTuqz8p9LO+mHuMarvD7+lojVzrU=
X-Google-Smtp-Source: APXvYqzDBqvI2NtOjS81btHiHLLO9lZSqulQg4i4TJCnXLKAV6ezf5jvEpgHoE4eepfRC6148Uscx8VcZj8WcdSDhBA=
X-Received: by 2002:a67:f303:: with SMTP id p3mr8121197vsf.166.1557908501768;
 Wed, 15 May 2019 01:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-16-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-16-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 10:21:30 +0200
Message-ID: <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
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

Hi Chris,

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Enable USB Host support for both the Type-C connector on the CPU board
> and the Type-A plug on the sub board.
>
> Both boards are also capable of USB Device operation as well after the
> appropriate Device Tree modifications.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One question below.

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts

> @@ -161,3 +173,28 @@
>         bus-width = <4>;
>         status = "okay";
>  };
> +
> +/* USB-0 as Host */
> +/* NOTE: Requires JP3 to be fitted */

This not applies to the dr_mode property below, right?
So perhaps it should be moved there...

> +&usb2_phy0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&usb0_pins>;
> +       dr_mode = "host";

... like:

    dr_mode = "host";    /* Requires JP3 to be fitted */

Does resistor R78 need to be mounted, too?

> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
