Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA521E9A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEOIA6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:00:58 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41421 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfEOIA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:00:58 -0400
Received: by mail-ua1-f66.google.com with SMTP id s30so670425uas.8;
        Wed, 15 May 2019 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dspARU9S/NfR/sn7uBJW29p4uHzZIpscpZhkQyFmJ/g=;
        b=bKltwQhNe19FfbuPE045dhtv/yCRv9lD/+e9tLGRMvmyCqCALgjOLj3tbhNOPDNva9
         edkUOTeseAEVg28XkdGcm98dCpyVBBpxYWYGw4rzbEpxq6BKbgDKL90VnRIz1h7zRR+r
         oyC78OEwP53IQxUp8Z0njyGGuZNzvAboxWZQVMo04ZeR9GGmgvozD28frMmja32PfSsY
         AmSu9tEKnRw6SwGxT7yWtgmppiJLyYAAUqvVwIqUkltBQgVtx4A9nYZBUH4Q01Z5R9vP
         5pkHY+FGlveYoP4GULS3ckX+wObimjszo4BkQ/Z5zGHppKoh1OpX9A/2OuDQlyWdwXqu
         1FNw==
X-Gm-Message-State: APjAAAUMkMUB4S5cDuAdRwNt4KMwEqUvxFHlRSb9esYIjJX8gI0HfQ7Z
        bohjzaxyLmzaysByOAGHNvzh/jPw9etKGUAmv/Xjr6Qb
X-Google-Smtp-Source: APXvYqxwOmHJLDKe7dggc0SxnTXs5j9fXu/OM/RgT74SBTHl7QoL9rjMTK9nK4XKAv4gnc+kk8EPvivd8moWc2JhFSc=
X-Received: by 2002:ab0:3119:: with SMTP id e25mr340366ual.96.1557907257090;
 Wed, 15 May 2019 01:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-13-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-13-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 10:00:45 +0200
Message-ID: <CAMuHMdVKAB0CtqgEgyeoeFoFrg5sFdm03F_PDHztq224G_ugXg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support for r7s9210
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for r7s9210 (RZ/A2M) SoC
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index b8acc2a994a8..11c99d079dfb 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -20,9 +20,11 @@ Required properties:
>         - "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
>         - "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
>         - "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
> +       - "renesas,usbhs-r7s9210" for r7s72100 (RZ/A2) compatible device

for r7s9210 ...

>         - "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
>         - "renesas,rcar-gen3-usbhs" for R-Car Gen3 or RZ/G2 compatible devices
>         - "renesas,rza1-usbhs" for RZ/A1 compatible device
> +       - "renesas,rza2-usbhs" for RZ/A2 compatible device
>
>         When compatible with the generic version, nodes must list the
>         SoC-specific version corresponding to the platform first followed

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
