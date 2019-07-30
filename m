Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D970D7A3B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfG3JM5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:12:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50992 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfG3JM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:12:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so56411149wml.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZdzMobYUwq2ZULfPBMLs1rbn9/+VYycXKoQFmA7wzHA=;
        b=jQC3HpcIAz246gd+IefRDUds+jT2b29/vzTavDV6IoZ+WC36JLogeQeImtqmiA4SN+
         TEU8DRvCnuuYBOTiEQPKyWEn9F8vagS+AIM/RO/9gLbxny7PuCIQ/u4TYvV59oy9/KUc
         Wt/pewUKG/GMeNNAAegVs1PuyguTBxI803J4PoG64Rjh6WHLNberRmEYa9fbSAX4leyB
         rWkyrR75UnXHCOTzG2Nm4LJ7xJtZgQQuWLraLaIOKn2NnMWf3uDo94RqcZYcu93ZHqGg
         BxbSKzdambg+GO0diGCqcDELbi+TpbYV9alBW9gMb7kNLFSXPxFfNM62YoOxTB2XnJ3U
         c9KQ==
X-Gm-Message-State: APjAAAUejkaYl8kl711yAvtaX8KWFKaIB1C9Uo05dszTg98VG4yOl3+3
        EQ5HmOs1DHxOKFw7gXNE5lwg+Et7tt3F8useII8=
X-Google-Smtp-Source: APXvYqy4bZTMMkFiuhItLBqjH/dgVkj/98T+vxp1Sb/90t816n8uKjofi8jVlSr1vm0LuEimV5KJdaZdkadYqGBRLSk=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr97149223wma.171.1564477975098;
 Tue, 30 Jul 2019 02:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <1563904990-2873-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563904990-2873-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:12:43 +0200
Message-ID: <CAMuHMdU8TJKB04VA=Nwz0SOR2q8jj7b+kFRhD-1_POLbhPoABg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Tue, Jul 23, 2019 at 8:03 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

You forgot to sort the i2c slave nodes.
As this kind of patches is hard to rebase and rework, I'm fixing that up while
applying:

--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -462,20 +462,6 @@
                #gpio-cells = <2>;
        };

-       csa_vdd: adc@7c {
-               compatible = "maxim,max9611";
-               reg = <0x7c>;
-
-               shunt-resistor-micro-ohms = <5000>;
-       };
-
-       csa_dvfs: adc@7f {
-               compatible = "maxim,max9611";
-               reg = <0x7f>;
-
-               shunt-resistor-micro-ohms = <5000>;
-       };
-
        video-receiver@70 {
                compatible = "adi,adv7482";
                reg = <0x70 0x71 0x72 0x73 0x74 0x75
@@ -527,6 +513,20 @@
                        };
                };
        };
+
+       csa_vdd: adc@7c {
+               compatible = "maxim,max9611";
+               reg = <0x7c>;
+
+               shunt-resistor-micro-ohms = <5000>;
+       };
+
+       csa_dvfs: adc@7f {
+               compatible = "maxim,max9611";
+               reg = <0x7f>;
+
+               shunt-resistor-micro-ohms = <5000>;
+       };
 };

 &i2c_dvfs {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
