Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8256F8208F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfHEPm1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38354 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so84891595wrr.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UOOyGykR4exrts5mLOsqpvR/FvgLN8IQrdwmn4eiOZA=;
        b=HUY3yW46svH8/gL+ZgfTz9eacgQWYvHmN5UM1hGIl2ISv77ff3ZgO4urJvi3jXHcU7
         V6yd87rPfVXpWt1ncssGuUu//YD8ZCDQqjbpHs3P1foaqpI9SzGNx4PKJBl8r/cWjxn4
         MisO67CfN37SZKqUN3wH5VaMDo31rQXati7zX/ln1eW6I8ZT9nPVAVLrch/Se0/nR7uJ
         FTnGKikE/2inthxGX2Vkp62AjtDcCzMBKeFw9djki1NhFDBycKREEDl2lPAMr27ZTI9i
         HK2trTdZARwqEK54Bz9JCDmAb+LxugP3qOpLfGAxrA9Qy6briK0qMIF58Fig49fjX31P
         XZhg==
X-Gm-Message-State: APjAAAVsS4JVaZ+RJ1dMg36gRL/QLn9vFav1KXAK+9KAtnBG9KxmCj/4
        zsJGaLb2qsk8oyDF1ocZ079E1we6jCFxTMXW6XT7Zg==
X-Google-Smtp-Source: APXvYqyBggpKQBQTtKbD8kpA9IvhKu4dLpSWRVkaXps9OGX8/cHF5+iMHiNo/AvUM1LhsdpvW/in4OnEBYOlvV4iKLo=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr162624759wrj.16.1565019744920;
 Mon, 05 Aug 2019 08:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <1564669452-22631-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669452-22631-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:42:12 +0200
Message-ID: <CAMuHMdVkn1wq1xcLhU0GWujrmu492utmAAV2KKgiqsaersGt-Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990-ebisu: sort nodes
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

On Thu, Aug 1, 2019 at 4:24 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts

> @@ -157,15 +125,13 @@
>                 regulator-always-on;
>         };
>
> -       vbus0_usb2: regulator-vbus0-usb2 {
> +       reg_12p0v: regulator2 {
>                 compatible = "regulator-fixed";
> -
> -               regulator-name = "USB20_VBUS_CN";
> -               regulator-min-microvolt = <5000000>;
> -               regulator-max-microvolt = <5000000>;
> -
> -               gpio = <&gpio6 4 GPIO_ACTIVE_HIGH>;
> -               enable-active-high;
> +               regulator-name = "D12.0V";
> +               regulator-min-microvolt = <12000000>;
> +               regulator-max-microvolt = <12000000>;
> +               regulator-boot-on;
> +               regulator-always-on;
>         };
>
>         rsnd_ak4613: sound {

You forgot to sort the sound subnodes.

@@ -142,13 +142,13 @@
                simple-audio-card,bitclock-master = <&sndcpu>;
                simple-audio-card,frame-master = <&sndcpu>;

-               sndcpu: simple-audio-card,cpu {
-                       sound-dai = <&rcar_sound>;
-               };
-
                sndcodec: simple-audio-card,codec {
                        sound-dai = <&ak4613>;
                };
+
+               sndcpu: simple-audio-card,cpu {
+                       sound-dai = <&rcar_sound>;
+               };
        };

        vbus0_usb2: regulator-vbus0-usb2 {

As this kind of patches is a hell to rebase/rework, I'll fix that up myself
while appying.

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
