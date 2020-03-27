Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DB319535D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 09:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgC0IzV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 04:55:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35641 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0IzV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 04:55:21 -0400
Received: by mail-ot1-f67.google.com with SMTP id v2so4400551oto.2;
        Fri, 27 Mar 2020 01:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D46z9tNyEwtB4r2ilezd68LjnjQ7ZyQLw368VCk74Os=;
        b=NBOEjREtos5J4SioliSeBGAmmPe0QdBfdzzHfUkoLJRP9QS59XcCUeSUZLLhbAU9G9
         +0fSeX+rAhekPcssCJq8odL/hsdOhej6o4EbK6KR5dKmtwXw+FSKvplzzxaQazZEo7pA
         8FnAxqiBdFvv22k5pOCt8DzYHE9Jme/zenzzebSzbat1mjGe3KDIwAwfe/95edKC5hOl
         7QSkw36oek9hax00aaJgLUPL5D4A14fPblsBNduc1QLV2VQfzy9M5mOckqslkNHbKFJs
         T/He8mv/1CglE2sVAy7i6YQvftThAVEAoCVTcM4HK8H6+YxgRjQneMcL3oaAH0fSIoOz
         yNvw==
X-Gm-Message-State: ANhLgQ2vH9Em8ZbTY86j8Vf3T0ezP34wJe9agr6gYRZohvmZVYAS8nK9
        aQ0cVYhe8Gd8X8e/h88VwexkO/ZoksGj0rvGlTibBg==
X-Google-Smtp-Source: ADFU+vsvbZDYQtwnEXPnDPJRl59UQ/joKED/Ns1jpjG4Fy355gqjn1pegySbmFbk6eTulJSAJ1ORhk8Ny/ILjPjaATs=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr9487286otk.145.1585299318781;
 Fri, 27 Mar 2020 01:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <1585286923-11740-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585286923-11740-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585286923-11740-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Mar 2020 09:55:07 +0100
Message-ID: <CAMuHMdV+kPei=4tBb8FGC1oE2+sRffXRz2KZtKU7svyz=22AGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
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

On Fri, Mar 27, 2020 at 6:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the update!

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ /dev/null

> -The phandle's argument in the PHY specifier is the INT_STATUS bit of controller:
> -- 1 = USBH_INTA (OHCI)
> -- 2 = USBH_INTB (EHCI)
> -- 3 = UCOM_INT (OTG and BC)

Sorry, I failed to notice during my previous review that the above information
is lost during the conversion.  I think it would be good to retain it in the
description for #phy-cells.

With that added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
