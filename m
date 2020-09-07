Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7E025FDA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbgIGPyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:54:08 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44492 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730014AbgIGOuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 10:50:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id 185so13748344oie.11;
        Mon, 07 Sep 2020 07:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NocdxbzOwXFNFlWIr6/cqeHsmP04fNIWa9z1kM4h3ac=;
        b=Sblszzmw/jDfgffc+vY7E+ulIz/1vCdo21SrsyrgcT9/aJEKxmw8SrkZTG3wWfi95d
         DXsvDDtShIcmNeBCA4gDMDPNq2JR9ndB/JQcqioVvfaFaYk1bNKu0JMqPoQbaaFP0SLF
         +wtTSB8rHy/pbudgWcuHszPQcLWs2vd5cD42c4DSRd/Dy96AS9TaZdot35RcXoR0z2aN
         DQiHF5t7KJgrPAoZkRv3/0Rk/9+Qw+p9D+mG4qGekmJa1rDMryNcG+9S/cROjVL2gPc2
         A05kwi6m+zgj6kzsJgRx7K42xsv6WjOMSdnOu1v6A9kp1z6lZC3LALCj59250G5QQCnR
         yqUQ==
X-Gm-Message-State: AOAM533R1Zh62R3h1WeKJupPHvGH5lZfUV5SDusDVFltt7SPtlXISWUV
        aRV4AGvgIzyYxV8Bmd4GxbQEY82AsGheg4ONBV8=
X-Google-Smtp-Source: ABdhPJxPEeOz9rD4CfjHYipCYAJC4QkIqyBMHvsKbLfrLvLKIyCWCxxTkUZb5VVmim8i5VZiOO3KPF8rJoL+7tO1GAQ=
X-Received: by 2002:aca:b742:: with SMTP id h63mr12128676oif.148.1599490245942;
 Mon, 07 Sep 2020 07:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com> <87r1re70sv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r1re70sv.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 16:50:34 +0200
Message-ID: <CAMuHMdVvnDLogOgQaASYLhFxNCq=eVpdZKV2J2eX=h5UzvNtfw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas: du: Document the
 r8a77961 bindings
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Sep 7, 2020 at 4:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -18,6 +18,7 @@ Required Properties:
>      - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
> +    - "renesas,du-r8a77961" for R8A77961 (R-Car M3-W+) compatible DU
>      - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>      - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU

Looks good to me, but please also add an entry to the table below
describing the port mappings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
