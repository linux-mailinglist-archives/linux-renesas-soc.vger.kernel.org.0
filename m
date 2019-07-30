Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33307A3BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbfG3JOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:14:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40082 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfG3JOd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:14:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id r1so64897652wrl.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yyyyivOFALWUjQNYz7gWNvYjCdrc1ktC7R8Wm+E1v/s=;
        b=gV4qdqFvrVC64vgVp2rU8HhLSNUEZa7ncllglk7vORl4eqa/jWbHZiWYzD0FjkTv/I
         vywj/WeMfOBGS+qpX0MF6Uw9j7RfH4W/OioP6EBgTgdYpCYF9EZc2PfEH5JU2xh2BHNt
         NfxCUicmcoYhDmRuozJ0eJ48t3GBBh1CwKCIcvYInz4m+tWa/bHjunZC7gMZi62hUtTO
         YvN0AeUwgZWm6vOfTEy5QQKPZKOtCBZGL6ynxyQVNiPB9RqKpxlTEr1tOcBS/Cjw07xk
         +I7NF0bbRkZwMpYwKuqCu8gyISSiYE1VZFWbfX5rmNt2/3V5HJGJqStdOnn5l29Id1k6
         FT/Q==
X-Gm-Message-State: APjAAAUde7WajgVxruKnC/B0hLMAuS8KeNtznzwRWyZpXy4Nb+o3zVzO
        tvj1IwNnjZPZeL8tQsVSv5c8TDno5t2BgG7Fz6byErow
X-Google-Smtp-Source: APXvYqx/MtvzULwd4Zw4vIfrVj6xW7FZXJYlJY/iLXjJX1DmBhrY9D4vmmCoYkq6454PB+kg830HfifUIgkd3kuOOx4=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr124853646wrj.16.1564478070273;
 Tue, 30 Jul 2019 02:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:14:18 +0200
Message-ID: <CAMuHMdWwMfduK_G3_YRxyuYsmd51Hmj5UJshRvZjZ+zNVo-CVQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: sort nodes
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

--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -83,6 +83,56 @@
 };

 &i2c2 {
+       i2cswitch2: i2c-switch@71 {
+               compatible = "nxp,pca9548";
+               #address-cells = <1>;
+               #size-cells = <0>;
+               reg = <0x71>;
+               reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+
+               /* Audio_SDA, Audio_SCL */
+               i2c@7 {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+                       reg = <7>;
+
+                       pcm3168a: audio-codec@44 {
+                               #sound-dai-cells = <0>;
+                               compatible = "ti,pcm3168a";
+                               reg = <0x44>;
+                               clocks = <&clksndsel>;
+                               clock-names = "scki";
+
+                               VDD1-supply     = <&snd_3p3v>;
+                               VDD2-supply     = <&snd_3p3v>;
+                               VCCAD1-supply   = <&snd_vcc5v>;
+                               VCCAD2-supply   = <&snd_vcc5v>;
+                               VCCDA1-supply   = <&snd_vcc5v>;
+                               VCCDA2-supply   = <&snd_vcc5v>;
+
+                               ports {
+                                       #address-cells = <1>;
+                                       #size-cells = <0>;
+                                       mclk-fs = <512>;
+                                       port@0 {
+                                               reg = <0>;
+                                               pcm3168a_endpoint_p: endpoint {
+
remote-endpoint = <&rsnd_for_pcm3168a_play>;
+                                                       clocks = <&clksndsel>;
+                                               };
+                                       };
+                                       port@1 {
+                                               reg = <1>;
+                                               pcm3168a_endpoint_c: endpoint {
+
remote-endpoint = <&rsnd_for_pcm3168a_capture>;
+                                                       clocks = <&clksndsel>;
+                                               };
+                                       };
+                               };
+                       };
+               };
+       };
+
        /* U11 */
        gpio_exp_74: gpio@74 {
                compatible = "ti,tca9539";
@@ -153,56 +203,6 @@
                interrupt-parent = <&gpio6>;
                interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
        };
-
-       i2cswitch2: i2c-switch@71 {
-               compatible = "nxp,pca9548";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x71>;
-               reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
-
-               /* Audio_SDA, Audio_SCL */
-               i2c@7 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <7>;
-
-                       pcm3168a: audio-codec@44 {
-                               #sound-dai-cells = <0>;
-                               compatible = "ti,pcm3168a";
-                               reg = <0x44>;
-                               clocks = <&clksndsel>;
-                               clock-names = "scki";
-
-                               VDD1-supply     = <&snd_3p3v>;
-                               VDD2-supply     = <&snd_3p3v>;
-                               VCCAD1-supply   = <&snd_vcc5v>;
-                               VCCAD2-supply   = <&snd_vcc5v>;
-                               VCCDA1-supply   = <&snd_vcc5v>;
-                               VCCDA2-supply   = <&snd_vcc5v>;
-
-                               ports {
-                                       #address-cells = <1>;
-                                       #size-cells = <0>;
-                                       mclk-fs = <512>;
-                                       port@0 {
-                                               reg = <0>;
-                                               pcm3168a_endpoint_p: endpoint {
-
remote-endpoint = <&rsnd_for_pcm3168a_play>;
-                                                       clocks = <&clksndsel>;
-                                               };
-                                       };
-                                       port@1 {
-                                               reg = <1>;
-                                               pcm3168a_endpoint_c: endpoint {
-
remote-endpoint = <&rsnd_for_pcm3168a_capture>;
-                                                       clocks = <&clksndsel>;
-                                               };
-                                       };
-                               };
-                       };
-               };
-       };
 };

 &i2c4 {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
