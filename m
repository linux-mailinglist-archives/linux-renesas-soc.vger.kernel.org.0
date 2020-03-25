Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE1119293F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgCYNJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 09:09:39 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41235 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgCYNJj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 09:09:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so1799167otf.8;
        Wed, 25 Mar 2020 06:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqsELC9cKGaRUt6dPmh5XjOR0XHPDFuPHCIFnulfGr0=;
        b=n7mBsTyjGStJPjv2UWnGTblvXmdGrshT5sU9o0rTLk4eKfilZmvjynKGkUi5/DIVMK
         1r/nkih3uq3ZKU7DEio7oTXutnSGMtlken6AoWc1xp6LLUHeIdqHUBjdSct5mnbqU35d
         qaurEjC5ocwKMn9YPahLGS1TnCgrRxOH7hpNMxNbC9/SfxwanABlMtpmGGWsWySzg+8c
         uhvV0hOpf5fi2xgSX9JJOW8wITB6bLlDdvh1Mv+U3NDrxToIJf9ozIrk6Yb9BQMDoFVO
         WUYS49qMpJC3UqnxeXxDsHqzzSvGBLU2uwNfvZbB+BFnxC952CS6HeVTI/nZHu+5JSFy
         Cpvg==
X-Gm-Message-State: ANhLgQ2H2E1ZKt8ETLWnBE+Lf9KWUK5ig7gDcdggvrvpodVysqgXLDVx
        GwyfvPLeIrp/nF3hzXsXpOMuZLLm2kjkx+1DuoM=
X-Google-Smtp-Source: ADFU+vskbkR1y7CFNybGztTqzqn0VJKb+y8/284jk5uiv1O8D1RDyCZQvdQtsvsa4iRJ2N9kFyID2IXG0EYo3jvwc9o=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr2259883otr.107.1585141777948;
 Wed, 25 Mar 2020 06:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <1585117100-8359-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117100-8359-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117100-8359-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 14:09:26 +0100
Message-ID: <CAMuHMdUu9KF8NU-4d+8xUF8_iqicHq1QOOhoqrvSCOrPLEwWEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: rcar-gen3-phy-usb3: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 25, 2020 at 7:19 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> @@ -15,6 +15,8 @@ Required properties:
>               SoC.
>               "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
>               SoC.
> +             "renesas,r8a77961-usb3-phy" if the device is a part of an
> +             R8A77961 SoC.
>               "renesas,r8a77965-usb3-phy" if the device is a part of an
>               R8A77965 SoC.
>               "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 or RZ/G2

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Likewise, a rebase on top of "[v2] dt-bindings: phy: renesas: usb3-phy:
convert bindings to json-schema"
(https://lore.kernel.org/linux-devicetree/1572592771-12444-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/)
would be nice.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
