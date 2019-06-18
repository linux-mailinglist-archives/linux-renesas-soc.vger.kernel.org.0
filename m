Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137F34A1A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfFRNHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:07:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37451 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRNHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:07:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id 131so13075321ljf.4;
        Tue, 18 Jun 2019 06:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BbuGY1jCiWptbJxHFe5JdIU4v7Wn/UJnE8dJB2nkfo=;
        b=B20phqOFwYhx1Kn0p8mnG+js200ZY4xJXygDlXeRZ6vHQCiX07R0KrJKuENzZ6nCP6
         BALmFaNWnhPKKfoqHgWvUa1cpAY5J4paM9bnrvD0M+mK8dJuTW+dwAzQPicfvOydJuV2
         KYSf8LhI+1fusVVOq0vR8PuT5XI2HR19kZ0X+zz/oX3AittoCXUpFuZ5g7+XRxdP6poP
         hHVhLgHIBLth3/p8MVDv1AyEPaRKHpGhDBO5Agkw6uo/00JvyvPRLKLNQe9w2XGipEgg
         DG5v3vaicBB6cJP7qLf/396hqNLq0uril0YzdoCwmeMA9wttCxyPQwwMvqX2PBKayWmM
         +bTg==
X-Gm-Message-State: APjAAAV8iE8t0ZCGnsOjxbIPRrdEHhI3lFXUBTDO1ktWSqXFQEFlYjyR
        AnXlCCqbqVUd6BSjsn7P1FftyOhJwjV4zUjE1ls=
X-Google-Smtp-Source: APXvYqxddLRHYzAJqfjM0OT62TXvWFK9gCVwwnTv0PdwKEtv+rAxHqQp+LPf7LPv15p2pefMZBO0CJN7ZWdjhS6oUOw=
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr14493869lji.133.1560863230065;
 Tue, 18 Jun 2019 06:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <156076224112.4736.5038116002723317642.sendpatchset@octo>
In-Reply-To: <156076224112.4736.5038116002723317642.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:06:57 +0200
Message-ID: <CAMuHMdWvfdYvS3255SmY_VSGzYkXxSGDOGWd+dS2XyE8u80S-w@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3
 CMT1 usage
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Jun 17, 2019 at 11:02 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
>  - CMT0
>  - CMT1
>  - CMT2
>  - CMT3
>
> CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
> CMT devices support 48-bit counters and have 8 channels each.
>
> Based on the data sheet information "CMT2/3 are exactly same as CMT1"
> it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.
>
> Clarify this in the DT binding documentation by describing R-Car Gen3 and
> RZ/G2 CMT1 as "48-bit CMT devices".
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- 0014/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt        2019-06-17 14:07:46.502422801 +0900

> @@ -42,34 +42,34 @@ Required Properties:
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>      - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> -    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT devices included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
> -    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a7796-cmt1" for the 48-bit CMT devices included in r8a7796.
>      - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> -    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT devices included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
> -    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
> +    - "renesas,r8a77970-cmt1" for the 48-bit CMT devices included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
> -    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77980-cmt1" for the 48-bit CMT devices included in r8a77980.
>      - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> -    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT devices included in r8a77990.
>      - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
> -    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
> +    - "renesas,r8a77995-cmt1" for the 48-bit CMT devices included in r8a77995.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
>      - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
>      - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
>
> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 device included in R-Car Gen2

I think plural was fine here, though, as it applies to the whole family.
If you disagree, you should probably add a "the".

>                 and RZ/G1.
> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 device included in R-Car Gen2

Likewise.

>                 and RZ/G1.
>                 These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>                 listed above.
> -    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 device included in R-Car Gen3

Likewise.

>                 and RZ/G2.
> -    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
>                 and RZ/G2.
>                 These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
>                 above.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
