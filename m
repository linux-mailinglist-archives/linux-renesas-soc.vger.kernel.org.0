Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBF835FC03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 21:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353555AbhDNTzU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 15:55:20 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:41621 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353541AbhDNTzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 15:55:18 -0400
Received: by mail-vk1-f173.google.com with SMTP id o17so4672219vko.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Apr 2021 12:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2OeXz2Jnb4laeSJFSDPreC3xu1dTJoNg0iDqWvO4U7Y=;
        b=r86Stfq5lKymIdRmGi7urE111igD2H4wHpD12S+yGaJuTawapkl47mWLj62ngBGYY3
         qASvaxy63vbAA2PObFCMG1PhuXw+ZJuIY+7Pfsxcoey9VNZG1xkxvN94V06bvCAfI3y2
         QEHejSRrDOFxPw+qDaGf+2Dq7/F+JBln8qb064iL/n3zIDHRWef7H7VOpT2CmE9bgyV0
         EYaYOezTNA8YmEI5Yk+cKWuzsKoZ+ISyNfYYbYJE1wC9hRnSR/J1e4YLBiQ8+JXVe3QV
         AL9EYjBVa/KpLkE9hS7E/2x2LInr5XMPqSong7IXtip0Fkddb5sMb6FNnL7j3XYsa88b
         6x0A==
X-Gm-Message-State: AOAM531vfJXOmo/S5uKjk9ZQnWGCB0oqFNwE57SSN81Bdm2Dy3Nm5SjE
        WjrO9I/2AQB8xIfGKkUQsT6tVlp9/Q1LOvbXe270dvtX
X-Google-Smtp-Source: ABdhPJynwPF+qbk+wIFQacPOt/97PQlBNTQD5i0q9uhumyPSaN+4pY/TNgAxUubkpiG8cOOJMHjJuzCHTPgomixdjKc=
X-Received: by 2002:ac5:cc76:: with SMTP id w22mr16572748vkm.1.1618430094928;
 Wed, 14 Apr 2021 12:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210413181447.2588084-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210413181447.2588084-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Apr 2021 21:54:43 +0200
Message-ID: <CAMuHMdU68TrCR2LemSQGg7uFaTEiTqFG3vDwu0zx1+3g3JuxYQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: falcon-csi-dsi: Add GPIO extenders
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thanks for your patch!

On Tue, Apr 13, 2021 at 8:17 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> We need to configure its GPIOs to power on the MAX96712.

... their GPIOs ... MAX96712s?

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
> @@ -12,4 +12,25 @@ eeprom@52 {
>                 reg = <0x52>;
>                 pagesize = <8>;
>         };
> +
> +       pca9654_a: gpio@21 {

Please obey numerical sort order by unit-address.

> +               compatible = "onnn,pca9654";
> +               reg = <0x21>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       pca9654_b: gpio@22 {
> +               compatible = "onnn,pca9654";
> +               reg = <0x22>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       pca9654_c: gpio@23 {
> +               compatible = "onnn,pca9654";
> +               reg = <0x23>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
No need to resend, will queue in renesas-devel for v5.14 with the above
fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
