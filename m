Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFD647D66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfFQIn6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:43:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32847 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQIn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:43:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so8471103ljg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 01:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZR1yDHqUmbFJgvygvorNZChQNS+ZH5Vm3CebMOqstI8=;
        b=FRrnljFwQuW3YIoqS6Jgq7CGoOU2lT7EPT32JfgJeXHjTsNlBpx8o0jvW4FsLh69mu
         n1GvS3NMYKyzukSz4anwyYSMRulWcqHU3YXBnIRyEXrXyiF8Cd8bFlcNNeiNslQkcY/O
         KBJPW0Y5ENwIM1n6lMKnkzAEYS8pWj+H5VxC//7YlFEeqT2jDRRqecyNF7uZptyqVQsX
         HDhANVd4aiyLopsKytfolseJHEsanGQGXR6g0Zh4CUGjapjmONUakYlSEVDQ1uQeABYG
         NTeDL3hwzQZo6fYdQ8xpfo+jBB608oxN8U+FMY4LAjKd0FNBhWTeV1VJEsnXZ2TuFY4n
         IANQ==
X-Gm-Message-State: APjAAAXs+IW9Ofo82UIb8lpsgGC30W8d19P/m0ZtuWcnvN0x4gUAieYZ
        iUQFX+KafFfsyWaD8OS2eqwhsW0aOTrB6p6K9No=
X-Google-Smtp-Source: APXvYqzyRsaX9lggOJEIeLixo7B3/WaZ1Swx1xmE7jR3IuhkQ2+ocPE8yYoi6Hw36yqAKgFSNvObaopuU6KByVgUzdk=
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr11708556lje.105.1560761036254;
 Mon, 17 Jun 2019 01:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190617083704.3941-1-horms+renesas@verge.net.au> <20190617083704.3941-3-horms+renesas@verge.net.au>
In-Reply-To: <20190617083704.3941-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jun 2019 10:43:41 +0200
Message-ID: <CAMuHMdXVrGDM+zQggk=Enyu_w=waZWkYx9iQDJEuTUz6kOQE0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a77995: Add cpg reset for
 LVDS Interface
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jun 17, 2019 at 10:37 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> It is necessary to reset the LVDS Interface according to display on/off.

This is not the LVDS interface.
The LVDS interface has its own device node.

> Therefore, this patch adds CPG reset properties in DU device node
> for the R8A77995 SoC.
>
> This patch was inspired by a patch in the BSP by Takeshi Kihara
> <takeshi.kihara.df@renesas.com>.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient. For
> this reason <&cpg 724> is not listed as a reset for "du.1" as
> was the case in an earlier revision of this patch.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> - only add one reset entry per group
>
> v1 [Yoshihiro Kaneko]

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1001,6 +1001,8 @@
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
