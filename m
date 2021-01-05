Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123452EAFFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 17:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbhAEQZY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 11:25:24 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:45073 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAEQZY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 11:25:24 -0500
Received: by mail-ot1-f50.google.com with SMTP id n42so145883ota.12;
        Tue, 05 Jan 2021 08:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pabrFAOrfyjBDuaXLbxg74Eu7UTVIQDOTfs8dfkksOk=;
        b=mZZRo/i9nujmK0iwjvdBU2i6wNC2oMjc4wbXH0bj6kdnst0UNpozz0cCQ3Vs5Rj8Zi
         epUZFbp+ALRJsgGmLUpBGyDhKaNW3BxDc5yYNydlq3CcYoKQjksn37II6P1lPl9G+WhF
         SnbLFHX9ZoBlcWsxpnWSHjGGQSpJrOtsWH2TOpOyrVCwdwP4Hpy0pexzuTff/mBW0Ury
         2yC9V1MQ2n36wLDNGsU35ZRT7ud4EMe21Vl0IwtIhteSNECfyzCc1VYRs5QfaUd428uP
         saRAHdg/yEv8s5uVeT/ZI8u+6q2n56bZ5tjT+lcib65pFTTw4YPIR7ebeAimRxu1uZyy
         m2sQ==
X-Gm-Message-State: AOAM533P3UHrAk/HAXZBaMovJl2nncEpxMps2zdD4NyTlJxYJreN/fpA
        54sI5a9y7uQSQAHhbLF7/WO/2wTsbH7/Ul7aVyU=
X-Google-Smtp-Source: ABdhPJxg7Sj7je9fzBZZG3rqx2gyPNs5HI+dc5+sCbU6bcEv1Hyldl6PDnY4Rv7mhtvf4jmakg7M0kuRVbxlYD2LJ2M=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr124613otr.107.1609863883827;
 Tue, 05 Jan 2021 08:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 17:24:32 +0100
Message-ID: <CAMuHMdXZmhTovjjopm01E4X2a4QoE-p0QU+vXdB4H_CFKKB06w@mail.gmail.com>
Subject: Re: [PATCH 6/6] WIP: arm64: dts: renesas: falcon: switch to from
 SCIF0 to HSCIF0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Dec 28, 2020 at 12:28 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Mainly for testing the HSCIF0 node. We could make this switch permanent,
> but we never did for any other SoC. So, I think this is not to be
> applied.

The choice of serial console has to match the bootloader.
That's why we didn't do it for other SoCs where the serial console can be
muxed to different serial instances.

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -14,7 +14,7 @@ / {
>         compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
>
>         aliases {
> -               serial0 = &scif0;
> +               serial0 = &hscif0;
>         };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
