Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADDE0CFB36
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 15:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731118AbfJHNV6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 09:21:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36647 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731116AbfJHNV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 09:21:57 -0400
Received: by mail-ot1-f67.google.com with SMTP id 67so13978055oto.3;
        Tue, 08 Oct 2019 06:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plp5lj2z9Sew4eEcI+/BUfxkWT1Lj1K2I2tCeBa+8Qg=;
        b=pcJrlMfVoztW7WQD2mDd0fkPvLU4fwUnXaXroB6cjEDst+MDj5hBECKw0oyfKGZV+9
         0e6Nsqn4AovItNzUZrEx+sszDscxXA7wGuEcvqni+sIcrSco547DJqSn29Aondegccw8
         QaO2x8HMtIVBwgGV3uvQQgusYTKIU6r8lyIbj1bl4bQ6LzWPQLPtk3P6hI00zsQzA/dr
         GwWLcgfHZ11vb98l/i68Yhl3153lHgXDewpbgl6pE76DSPqftEpRel0svyXc+ATlBljH
         5aq0CLB6oWzjnDsnBlq/0cFbSQ9o6XsIu0F6uzGXIBgLmW7S9t6cQRZBh3kBJH4RCflw
         FdNA==
X-Gm-Message-State: APjAAAXzAyPVkEajq8fsQxKv9XU/HdSQwA7LXFVJ4SgsB772IMminSkx
        qwt1qb6+9uqQrWhOSlwdaGLdTXaKz5XJGN2UIQY=
X-Google-Smtp-Source: APXvYqyLDFEJiOKignpxaXhU+M/sIK79tUMewK7XvbTPDg8JdqksJE66B4MxZAYwmU/3nj8tiq8OrJCqfokt5ZSJtJI=
X-Received: by 2002:a9d:7311:: with SMTP id e17mr23854767otk.107.1570540916795;
 Tue, 08 Oct 2019 06:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Oct 2019 15:21:45 +0200
Message-ID: <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port node
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Fri, Oct 4, 2019 at 4:53 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch removes audio port node from SoC device tree.

Standard review comment: "Why?"

> Fixes: e2f04248fcd4 ("arm64: dts: renesas: r8a774a1: Add audio support")
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>  * New patch.
> V2-->V3
>  * Fixed the commit message. Thanks to Fabrizio.
>
> This patch depend upon
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=182581

Why the dependency?
This looks like a fix for r8a774a1, too?

> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 20 +++++++++-----------
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi      | 11 -----------
>  2 files changed, 9 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 355d0a2..2c942a7 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -86,7 +86,7 @@
>
>                 label = "rcar-sound";
>
> -               dais = <&rsnd_port0>;
> +               dais = <&rsnd_port>;
>         };
>
>         vbus0_usb2: regulator-vbus0-usb2 {
> @@ -183,7 +183,7 @@
>                 port@2 {
>                         reg = <2>;
>                         dw_hdmi0_snd_in: endpoint {
> -                               remote-endpoint = <&rsnd_endpoint0>;
> +                               remote-endpoint = <&rsnd_endpoint>;
>                         };
>                 };
>         };
> @@ -319,17 +319,15 @@
>         /* Single DAI */
>         #sound-dai-cells = <0>;
>
> -       ports {
> -               rsnd_port0: port@0 {
> -                       rsnd_endpoint0: endpoint {
> -                               remote-endpoint = <&dw_hdmi0_snd_in>;
> +       rsnd_port: port {
> +               rsnd_endpoint: endpoint {
> +                       remote-endpoint = <&dw_hdmi0_snd_in>;
>
> -                               dai-format = "i2s";
> -                               bitclock-master = <&rsnd_endpoint0>;
> -                               frame-master = <&rsnd_endpoint0>;
> +                       dai-format = "i2s";
> +                       bitclock-master = <&rsnd_endpoint>;
> +                       frame-master = <&rsnd_endpoint>;
>
> -                               playback = <&ssi2>;
> -                       };
> +                       playback = <&ssi2>;
>                 };
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index d179ee3..34a9f47 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -1726,17 +1726,6 @@
>                                       "ssi.1", "ssi.0";
>                         status = "disabled";
>
> -                       ports {
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -                               port@0 {
> -                                       reg = <0>;
> -                               };
> -                               port@1 {
> -                                       reg = <1>;
> -                               };
> -                       };
> -
>                         rcar_sound,ctu {
>                                 ctu00: ctu-0 { };
>                                 ctu01: ctu-1 { };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
