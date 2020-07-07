Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C6F2169A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgGGJ7Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:59:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39134 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgGGJ7Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:59:24 -0400
Received: by mail-oi1-f193.google.com with SMTP id w17so33715158oie.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 02:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uTij7f0GuLeppKh5/3wAamEVh+oySvEkRjV8S4iZsqo=;
        b=NIkV5KMpfd5ZaGtQWoPvZ3IgSKEixLglr9YAFy/Ny5EtGbi0dmIjNSZFW5N/xuWbSG
         XYHVih66GqpMdcwHg38Ne6rcMXkFjcspNjm7WAIuTQ+gGElnlr93yNwgUGq5frgmuxn6
         cMXxdab5Zjguyq4+wUfXiHYy5XoFnMde04wQ6vMWUfhhZt7uHVkTOJc3ROriPsGyyId8
         +nlKfraOn/kJxAJB8s9oPvyXjIPrdPrIsoGYhtbSvKoh7FVkCeZH799rSdH1qyy0drDI
         kgJ3xGL51XugvA/GfakEeKKK+3qAaNbA4GMPjn5um/N9ctsy/sn1VgDpPTr579sgosbL
         6CuA==
X-Gm-Message-State: AOAM532w079dzDiTjMqwRMK1Qfb1KIiHZJJuh+FPU/W8vePY959y6Ctv
        ZhzdpOzBHjPAos8UZUvrOu76ZHAhKLkS99JXJHv+hL2H
X-Google-Smtp-Source: ABdhPJyoskj2X50nVbDPLJOI4XPhyo09h4K+DyOB8nHD8XZCXhoQ8bLeS146blcM/PYuDnG91ED14TIavw7pYmc7vnc=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr2655334oih.54.1594115963683;
 Tue, 07 Jul 2020 02:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se> <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 11:59:12 +0200
Message-ID: <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Sat, Jul 4, 2020 at 5:59 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding the adv7180 device node the ports node was misspelled as
> port, fix this.
>
> Fixes: 8cae359049a88b75 ("ARM: dts: gose: add composite video input")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> @@ -336,7 +336,7 @@ composite-in@20 {
>                         reg = <0x20>;
>                         remote = <&vin1>;
>
> -                       port {
> +                       ports {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>

Does this have any run-time impact, or dependencies?
Don't we need the same fix for the other boards?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
