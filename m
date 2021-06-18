Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6F83AC5BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhFRIHn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 04:07:43 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:33448 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhFRIHm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 04:07:42 -0400
Received: by mail-vk1-f177.google.com with SMTP id j19so1979516vkj.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 01:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UkeNYeyS7jeygefv31Kc95a1m86KH7EaECxU89wx/r4=;
        b=tCGBuGsWJHL8+Ln/zkx7/gM7BqLFb3aNvmZVye8GR3D5BSzskQhtKpTiGOp4jDhlGc
         jXeddtssszstXKhf3lmzEwmvbOten0Yitw3WeUSaACqym/lsx5u6SnC7J5qAL8DdplRS
         mwD8rz6+2Mvr2fnHQcgLNahagt9YWfr2O4rG1QkHgSjXJ6Quc/2mFYx4zzqZw5uRcFPk
         tWkhTMOmGeTBO2LNT92yCRSNrfGr2fjsfhyQKsmWoz99zhsg+wi7AwJZgNGKqTZlT2k9
         CCFbfe//8t2G0ifeSBUZuoWB6pnD54vUVw7HiB1CVnVGWgzkH+AnHHjUnKUHEdBX4tUG
         whyg==
X-Gm-Message-State: AOAM530ID1IEUlZuVvkpV6qeqlKkfcHtkouOXe/+cnSGjc2dHJKhexLS
        9lHXhgyQzysCeedAKD1fkHKqeNg8TDUjih+4ywI=
X-Google-Smtp-Source: ABdhPJz2SVqip1zzlENCFchvRkz7tvxlJ/9pQpBzKUNepZ3OTTWlC3Da5XnnWg+LjoH7XVYh4vowe606JW4FDYmW7I4=
X-Received: by 2002:ac5:cf08:: with SMTP id y8mr4727768vke.2.1624003532133;
 Fri, 18 Jun 2021 01:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com> <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 10:05:21 +0200
Message-ID: <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r8a77995: draak: Enable HDMI
 display output
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, Ulrich,

On Tue, Sep 25, 2018 at 6:34 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Ulrich Hecht <uli+renesas@fpond.eu>
>
> Adds LVDS decoder, HDMI encoder and connector for the Draak board.
>
> The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> EXTAL externals clocks. Two of them are provided to the SoC on the Draak
> board, hook them up in DT.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts

> @@ -190,6 +225,43 @@
>
>         };
>
> +       hdmi-encoder@39 {
> +               compatible = "adi,adv7511w";
> +               reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> +               reg-names = "main", "edid", "packet", "cec";
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +
> +               /* Depends on LVDS */
> +               max-clock = <135000000>;
> +               min-vrefresh = <50>;

Where do these two come from? They fail to validate with commit
cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt: convert
to yaml").
I can't find where it is used in the driver, nor in the driver history.
Perhaps it was set in some obscure place, and is no longer needed since
commit 67793bd3b3948dc8 ("drm/bridge: adv7511: Fix low refresh rate
selection")?

> +
> +               adi,input-depth = <8>;
> +               adi,input-colorspace = "rgb";
> +               adi,input-clock = "1x";
> +               adi,input-style = <1>;
> +               adi,input-justification = "evenly";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
