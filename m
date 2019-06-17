Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA68547D62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfFQInY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:43:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33740 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQInY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:43:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so5902485lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4VKAprg7mXUJd6G8Qf2jpLDJEVAi1L24CO1vzj3CGU=;
        b=JetUfSQRpg5yQOEHQ1APh3iRuQhd/suHBZ6ZnMtvnIpQKVlDKDvvWiuwlmcyNCW5Xd
         A6V4LpWcy8+LujYTz5FA9HwQf813z0MyyAayEuC6jX69kgkn5nU+dMyLMSGKm0h0BOgp
         +sGLlCVd/X8nTMHtw7Glt9K0mQoLyW87zLq6gRxwRbtYMEq/2jkOckMiedl6TKWDaooc
         4/YCzIaP2i01MSwHNCHcJ6LT6mcv8JtKazMWujNd1pFbd4JWRot+3+fdllaXkypKqPQN
         KZUwiI5NuTS8tsrc2uS8LxIZpsrT546aIr1Xz7+kh5+sMQ9lwQUk8zxniaF42/W0kfQf
         rh4w==
X-Gm-Message-State: APjAAAXD0z2UFsb/CJ6hauYzguVJRBoyZQa8Zr51ZM6YnVFQl0ysObg9
        ubA0H+dcW0gDBfyvmKrQNnLW4wBfQMzWoxpKyEZxPQ==
X-Google-Smtp-Source: APXvYqyzlinULIwCTQjvK3dU45P5C1mboR5bQEvnqFKJJDzMHrNXC72e93q8r138d5PLeAGt7y20WxK5UyK4E8ydR1k=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr15739604lfp.90.1560761002181;
 Mon, 17 Jun 2019 01:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190617083704.3941-1-horms+renesas@verge.net.au> <20190617083704.3941-2-horms+renesas@verge.net.au>
In-Reply-To: <20190617083704.3941-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jun 2019 10:43:09 +0200
Message-ID: <CAMuHMdUu2T2+Ri_xEq+Nr1qD_Dm067TDkfxTDpduX4xia2FGDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for
 LVDS Interface
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jun 17, 2019 at 10:37 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> It is necessary to reset the LVDS Interface according to display on/off.

This is not the LVDS interface.
The LVDS interface has its own device node.

> Therefore, this patch adds CPG reset properties in DU device node
> for the R8A77990 SoC.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient. For this
> reason <&cpg 724> is not listed as a reset for "du.1" as was the case in an
> earlier revision of this patch.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> - only add one reset entry per group
>
> v1 [Yoshihiro Kaneko]
>
> v0 [Takeshi Kihara]
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index b4318661f35e..84d1f58e73e7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1766,6 +1766,8 @@
>                         clocks = <&cpg CPG_MOD 724>,
>                                  <&cpg CPG_MOD 723>;
>                         clock-names = "du.0", "du.1";
> +                       resets = <&cpg 724>;
> +                       reset-names = "du.0";
>                         vsps = <&vspd0 0 &vspd1 0>;
>                         status = "disabled";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
