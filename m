Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E780A16C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 12:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfH2KvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 06:51:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36142 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfH2KvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 06:51:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id k18so2968977otr.3;
        Thu, 29 Aug 2019 03:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gb1RksLZCdZN7Gqwbk2B2Bw8bW0XoBsFuzP7b4DZug=;
        b=IUlMWt2Nvjkjq2XBlZKPSHYvVMjoUdC/541GYxFAHgd9XXs7k35zQPtgLJZF9cUxfy
         UgMoVARvNAAjd+/KBh3IKOrlq/MbqTC22iscklvKCeZPyAcD7jCXmyMPj9F4pYZxt3f1
         k6KTJQhEl4+AL6rMPFsen0NvjB2AxxVa6svAhpcLmJx4CDXw+xE/CedqiiFAC0zaqlqa
         WvJ3CpWD0Y45R8Pe79pHDEC9Nc3SQQLxomHafk59TKkwAe/tDcyHHKQm3qzCXjemr0Y+
         ZBbne3xpvI/PbdvF0+NwB54gUk/my2qSZ8JrZjXMnvAyAjxUAthA50I+x+GluEtkxK7F
         3NWg==
X-Gm-Message-State: APjAAAVa8O4GwrAlP/+0EN39fTFXrhBa36Yr3FysjY6gClmfv59vbJFh
        rdVVEBjoxKpC4XaH1aYTKXCelU65cG7RiSOR3+E=
X-Google-Smtp-Source: APXvYqwIAhcA/nWCNgJup5gdGLXZIeUPRMQV/UuyUh16eWUF27QHCqA90ZmP5kXNe/Ui1iwCsoSRaWrB2EecdmPsd+k=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr7124507oto.250.1567075860475;
 Thu, 29 Aug 2019 03:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com> <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 12:50:49 +0200
Message-ID: <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Aug 29, 2019 at 12:22 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The HiHope RZ/G2M is advertised as compatible with panel idk-1110wr
> from Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> work the HiHope RZ/G2M, is the most convenient way to support the
> HiHope RZ/G2M when it's connected to the idk-1110wr.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

> +&gpio1 {
> +       /*
> +        * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> +        * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> +        */
> +       lvds-connector-en-gpio{

Missing space before curly brace.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
