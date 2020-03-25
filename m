Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F9A192908
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 13:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgCYM6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 08:58:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33135 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgCYM6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 08:58:05 -0400
Received: by mail-ot1-f68.google.com with SMTP id 22so1811518otf.0;
        Wed, 25 Mar 2020 05:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZVt+NwwY0gDhq0kAajr/kEyB1TX6Ts1GTxN6FWpqYs=;
        b=ScG2iSCndSjDX9cSwJzejn8aQ2bkP5IC+wxDy18ZAK2zTnCCdoEznNbi8DWL+iZhTB
         IwDhdJ9+IP9Gy8aJwpq1XBC+7BBSBHG2jotVfoBbN5+iG4nkEbp1T6nC7upYKVvzkA9X
         ttutcPjI4J7T7+XiBLtNchCU4XmZKOe+zKGMuNW59EKPaNlkBw3sHwZORJcqd50yVqLk
         SMd2fzTWoNH8B0Hwj+jG+bOo1LnP1hEPdNHQySj0qEDPcuJbWyg/bgj/RIpHJXLD7qnX
         DgoLH0yYBzYYG2zJ0ZySkjjCADbg3+coxKg6WOtUPcEdSV4yJ16IWweWHEft9TzVtLwB
         PZhw==
X-Gm-Message-State: ANhLgQ1z5NP4kNtm3FaJx1qLM1ZFFfmhFQW8i2e7W1aRqcUkWh/iIcdc
        VexaRlqap31IlAXfPG+igl4kfQJoMjpPHbIaI1c2gPVf
X-Google-Smtp-Source: ADFU+vtwED7M9Uto3cr43QiuLpBVfPOkL/EsUkYuzOFsEqfWKQULpOeGXJQtO3kMiGxnVJTTo8NX1+BPCCgnNMBZg3o=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr2317567otk.250.1585141085101;
 Wed, 25 Mar 2020 05:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117006-8266-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117006-8266-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 13:57:53 +0100
Message-ID: <CAMuHMdXxbzR=boveEoynjFwV8=KSkOzCTdQVmtN4Hh6PVMj-Bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: usb-xhci: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 25, 2020 at 7:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -17,6 +17,7 @@ Required properties:
>      - "renesas,xhci-r8a7793" for r8a7793 SoC
>      - "renesas,xhci-r8a7795" for r8a7795 SoC
>      - "renesas,xhci-r8a7796" for r8a7796 SoC

While at it, you may want to update "r8a7796 SoC" to "r8a77960 SoC", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+ (R8A77961).

> +    - "renesas,xhci-r8a77961" for r8a77961 SoC
>      - "renesas,xhci-r8a77965" for r8a77965 SoC
>      - "renesas,xhci-r8a77990" for r8a77990 SoC
>      - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
