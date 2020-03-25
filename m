Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BC4192956
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 14:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgCYNNA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 09:13:00 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37152 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbgCYNNA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 09:13:00 -0400
Received: by mail-oi1-f193.google.com with SMTP id w13so2011718oih.4;
        Wed, 25 Mar 2020 06:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMFbpqQtr7cfA8P6JMOVPRMI4YeodTSgPu+QdwEFvgg=;
        b=SpRe6ctjhassD2q+8ECHoUH2OLIvWeUCUvgiMNRBgknSpksCh95lPROGdvqL3VQ8ep
         GOlBdN+a0jDKFJBp4HWqMm4H/uMwkN6ASdxb/JoAXH3xvdxz662HTOv3/iS28Apx+N6+
         SlJx4l/szbMnSPN5OK/oD3b/ivknrloLMUH04qIcUAzYBTAMemmcxnJ6EaNhGxILKEF3
         PWz3+J+CMt58L26AjN568VsUENQgHrED5bVKVY3Wzw/lKzgQHQ5QkRrf0B7c/m5PngKZ
         6OKNNt7NemUCvfXF0wGEWlmosjoGVic2D+gOmNScwvpModjS7ZQ2AoqIXgZ7/Plkalme
         GZKg==
X-Gm-Message-State: ANhLgQ279Z/MsjxJHAZqGy9FIt6CMyqTtaDFEvR2mwfNqTC6d8oox/LJ
        IkiY516VRGkmQOKW+EBP3Uke/AQPPxOJkDLH2Qj7dZKQ
X-Google-Smtp-Source: ADFU+vsNDEdg1F8hPijvsLFyvHHitKA4ory4nZVXRl1S+hm/OicpNrMFCepOYg3jm26hpjKSAqk5h51lFwvkOjEFSFc=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr2320356oib.148.1585141979523;
 Wed, 25 Mar 2020 06:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <1585117204-8469-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117204-8469-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 14:12:48 +0100
Message-ID: <CAMuHMdXopMkeBwAQRpphCUXOLeCVRaDEFi-fQzy8_8jzD=MNEw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add
 r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 25, 2020 at 7:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -28,6 +28,8 @@ Required properties:
>               an R8A7795 SoC.
>               "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
>               an R8A7796 SoC.

While at it, you may want to update "R8A7796 SoC" to "R8A77960 SoC", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+ (R8A77961).

> +             "renesas,r8a77961-rcar-usb2-clock-sel" if the device if a part of
> +             an R8A77961 SoC.
>               "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
>               compatible device.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
