Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38C9243725
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgHMJF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:05:29 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:44821 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgHMJF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:05:28 -0400
Received: by mail-oo1-f65.google.com with SMTP id g1so1065809oop.11;
        Thu, 13 Aug 2020 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2AvIhR4VMBCPleNB4MD/t7+rUWOqAWwlH0ujr1BxGlw=;
        b=ARde/XfI66VeOmJdsynQQ/WH4TLxMDPByoINkPLaJVOhIuy/fLUcv2GYe/Vso3zGZT
         KY3BtooINHlOXZ6JF+5wPIKq/hgMuZiWvAgxDsCjQjJVnZ5bmxe40TRTwE20e5bmaiUK
         lalU0G+mI9nv+VgdThATprdSF1VkhYjB41IdHJqFrlEDc0OuBWBWRjShad9cDhTDke0w
         /E9as2FbDbv7/qbIqOwUPj8S2RMMxhTktdSc5JhIGJOefnEtNspb2G1XkwvUo1Ayi6yt
         YHZwS44PgnDypE+6akbvdgru5qGGZjSPXiKRDcOPgRi5/17ni9LGiya04NxFLfsYejnl
         yI9g==
X-Gm-Message-State: AOAM532gyL3ElfAzS0bdPiIMafdx24lByKofjNvH8eauj5vk3zcCJWOg
        C+d2bPHaKgnZmzr1FubIxHB4GTBsSzbiMlEHiJk=
X-Google-Smtp-Source: ABdhPJyUVskr8e/cEyjDxvkGzZdvsxqJxwiGe6jUX0tZXjbkklpncAUVA0TsyDuRFcZ55z9cv4D0LKrgJqG/ccdMfWs=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr3744544ooc.11.1597309527049;
 Thu, 13 Aug 2020 02:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:05:14 +0200
Message-ID: <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1 bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar, Laurent, Kieran,

On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..67cded5ad827 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -10,6 +10,7 @@ Required Properties:
>      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
>      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> @@ -75,6 +76,7 @@ corresponding to each DU output.
>   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
>   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -

As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
instead of port 2?

I know we did it the same for R-Car M3-N and RZ/G2N.
But my main worry is adding support for R-Car H3-N later.

>   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
>   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
>   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
