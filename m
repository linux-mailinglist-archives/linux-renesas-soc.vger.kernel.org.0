Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0895B41DDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731331AbfFLHhb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:37:31 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40509 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbfFLHhb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:37:31 -0400
Received: by mail-lf1-f66.google.com with SMTP id a9so11270426lff.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2019 00:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLGWOKEe6QM5UY+pbGi3iUeKzW8p++aAOpZGDFj/kEE=;
        b=LJqRnn1g1pDQ7xxhXuXOnRVESfdbcAogb44ENIGklz3UdfjqvTtMm0UtKuJ6GNzSez
         YqxsmEcvLog9bIa7Cwn9Gtf1bEC+HGsY2e4MDgRWJxpO5x+T2sbvcrEXvqy2clH21G7s
         rBUA38dif1qHqMNaAjFSJLYLYPIDoDMy5GFChSXIHDoCTWMLdDW16zZ/Y2E/J/sWlolb
         0lqtX4bFSJHYPZuOx6lNza7we1uMGs7bClzr7mPjglaqTnAFxsQzDJA6AzfIHYW/OL3/
         yuUr+Fjl8aoyQrcGPei0m3q6fhr+Vc0BRvHHc7BCjXuHVttl2QtiR7RKTlt7hoUnqKMY
         BuKQ==
X-Gm-Message-State: APjAAAVb84bub2Emr/mo0daNmxmQJ0T3fUm/D5tEISVoazxNI94qE65k
        EpDVRn75QfwWK6C1W6t2h/VJWBQJ9CJUJwl2HSs=
X-Google-Smtp-Source: APXvYqy5Gb6G+AWzbA9YyUSLoC0IXrltzZHsQx1Xnij93SbOPifDjX9FNgrUiRdecRLVBlJyCXwuGvVMCvo+5K3VGSo=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr32772104lfk.20.1560325048995;
 Wed, 12 Jun 2019 00:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:37:14 +0200
Message-ID: <CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Add cpg reset for LVDS Interface
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Sun, Jun 9, 2019 at 1:11 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> It is necessary to reset the LVDS Interface according to display on/off.
> Therefore, this patch adds CPG reset properties in DU device node
> for the R8A77995 SoC.
>
> This patch was inspired by a patch in the BSP by Takeshi Kihara <takeshi.kihara.df@renesas.com>.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1001,6 +1001,8 @@
>                         clocks = <&cpg CPG_MOD 724>,
>                                  <&cpg CPG_MOD 723>;
>                         clock-names = "du.0", "du.1";
> +                       resets = <&cpg 724>, <&cpg 724>;
> +                       reset-names = "du.0", "du.1";

These are not the LVDS resets, but the (shared) DU channel resets.

The LVDS interface has its own separate device node, so if you want to
be able to reset that, you need to add reset properties to the LVDS
node instead.

Note that I haven't reposted a new version of "[PATCH v2] dt-bindings:
drm: rcar-du: Document optional reset properties"[1] yet, after the
split off of the LVDS interface into its own device node. Laurent wanted
to wait until the driver gained DU reset support.
However, the above differs from my proposal, as it also adds "du.1",
pointing to the same (shared) reset.
With a fresh look (2 years later ;-), that actually makes sense, so
perhaps I should change my proposal and repost? We do have shared
resets in other places (e.g. USB).
Laurent, what do you think?

Thanks!

[1] https://lore.kernel.org/linux-renesas-soc/1488817556-21410-1-git-send-email-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
