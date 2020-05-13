Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334071D162A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 15:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388073AbgEMNoC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 09:44:02 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:43873 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388412AbgEMNoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 09:44:01 -0400
Received: by mail-oo1-f65.google.com with SMTP id u190so3451603ooa.10;
        Wed, 13 May 2020 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGKMJBv6IVV+ZJVKpbzNCSGNRznENNkFR7QK8ZNTnxA=;
        b=U5dd+wYfit5FH4KM99ZRZDznk9ox0Q/oodmxHBiogSvoV1YLgfHt4YG1dIcr746DXa
         GxrU1xMQUYg+Q5qufxJltwBGzzCQ9yaKX1xrvzDr/U9MakT2MXflu92pvVkl6hIooNzG
         VCrqB6AFqVKs99oSc/QGq2997q5rcGnR1Qgz1QfThjkLczTx4T0IPBxVuGzRvv169IOc
         rMgLPmVJgst4N/TdSoRG5lrD9/3GO1+gI1qjjyOg0Iq2rqvO8W+yHaHBAIGwZb2nkBXH
         bSuBBqnQixL/caJPAOnJDMg+wWlnKY5RtFokr2noLl90Dn5O5hki0dyGDajKl/8Qbex6
         Drpw==
X-Gm-Message-State: AGi0PuZB40Xbn5LOzXhKHmadiPVy5dx9ZzPOQwh168gPvzgpZX0YWexf
        Crr02p4NNeLUlBVFFLe2+Slf4bErQo32CqxCbdACMb2m
X-Google-Smtp-Source: APiQypL+2lJnUROW1UEEKWpONZKDcso4AD8SYMWDqL70oePtirqIs+zY8nx+QxAg1IJ2NhLGhotKSqXPjpCnhQFJpD4=
X-Received: by 2002:a4a:95d0:: with SMTP id p16mr9973911ooi.40.1589377440348;
 Wed, 13 May 2020 06:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200508100231.6575-1-geert+renesas@glider.be>
In-Reply-To: <20200508100231.6575-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 May 2020 15:43:49 +0200
Message-ID: <CAMuHMdVpTVdcMDxpvtxHYTYHNNrZA018nrGNoQ2cXdNgbSa-ww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas: cpg: Convert to json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 8, 2020 at 12:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the Renesas Clock Pulse Generator (CPG) Device Tree
> binding documentation to json-schema, combining support for:
>   - R-Mobile APE6 (R8A73A4) and A1 (R8A7740),
>   - R-Car M1 (R8A7778) and H1 (R8A7779),
>   - RZ/A1 (R7S72100),
>   - SH-Mobile AG5 (SH73A0).
>
> Keep the example for R-Mobile A1, which shows most properties.
> Drop the consumer examples, as they do not belong here.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml

> +  renesas,mode:
> +    description: Board-specific settings of the MD_CK* bits on R-Mobile A1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 7

The "allOf" is no longer needed.  Will remove for v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
