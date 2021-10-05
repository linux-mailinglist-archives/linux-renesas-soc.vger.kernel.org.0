Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AD8422B10
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 16:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhJEOcd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 10:32:33 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:43725 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbhJEOcc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 10:32:32 -0400
Received: by mail-vs1-f49.google.com with SMTP id p2so1469027vst.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Oct 2021 07:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pb6T1J9nyF+b77vnbgdaN04Hny1iS8LcsYlVq0kfJIk=;
        b=siOZWzLGljGWGLAIt5mwjTH4lb6cG80C92NxWxPhnmcVUF25gAYi5iqVVyj0/LfxhH
         C8WYPOwTa5VhdZDF2FPiqfS1006q5Pwac7uNXzfsmj3N59R+nkAS7ZjIxp3Z9EIgf/kC
         pW6plFoTEfRk/SrL+6uAYk/SGzbMSzlYHk0dXrSA/wLrk+8jn3QPq6ollSB30hXQJIIT
         vyMZ42Mqb0UPjOrahCJsOpU5JwktmCRFEv4OtpmVBxFL+CDoNWP9oaIhVWJLBhDUHRWB
         3NQFEbKRUJRFhLxXaWttA2OwGfKHSlHNwgUQpjbDkgOEaOv0Xm8YAlu62Kt6a+IA7ldS
         3vJg==
X-Gm-Message-State: AOAM531z7lQEmTZcTTcEHfs9xqlsY55hCeASe5FeWLxtyqiqUV3/fxGK
        dcXB4AMT2z2+XUtYbbdFNCTZK3fIR3n/1Q9xVlorSuSOBQQ=
X-Google-Smtp-Source: ABdhPJysMrJqeuMjXl8pcmk4EvGFiNepXQOXgKinWsmUq6c6lz+Dx9IVTGRTty1CiKaCwNBc/gUMle2OL3Ho5Wg6rP0=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr19082045vsl.9.1633444241461;
 Tue, 05 Oct 2021 07:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210924171905.347115-1-aford173@gmail.com>
In-Reply-To: <20210924171905.347115-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 16:30:30 +0200
Message-ID: <CAMuHMdXoLkh9Mt=8Q-dJeBrrHR_96MJUTA8ZJTtDSgMym0+J1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix memory corruption from TF-A
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Fri, Sep 24, 2021 at 7:19 PM Adam Ford <aford173@gmail.com> wrote:
> Trusted Firmware allocates a chunk of memory for a lossy compressor
> which makes the memory unavailable to Linux and any attempts to read/write
> from Linux result in memory corruption or a crash.  Fix this by reserving
> the section of memory marked as unavailable by TF-A.
>
> Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -13,6 +13,17 @@ memory@48000000 {
>                 reg = <0x0 0x48000000 0x0 0x78000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               lossy_decompress: lossy-decompress@54000000 {
> +                       reg = <0 0x54000000 0 0x03000000>; /* Reserved by TF-A */
> +                       no-map;
> +               };
> +       };
> +
>         osc_32k: osc_32k {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

I believe these days it's the responsibility of TF-A to create these nodes
in the DTB, and pass that to U-Boot.

What bootloader are you running?
Does "fdt addr $fdtcontroladdr ; fdt print" show the area as reserved?
Does TF-A print something about reserving the memory?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
