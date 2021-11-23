Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4305045A441
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 14:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhKWOAS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 09:00:18 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:41695 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhKWOAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:00:17 -0500
Received: by mail-ua1-f50.google.com with SMTP id p37so43861777uae.8;
        Tue, 23 Nov 2021 05:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64qNhLYDAnibsiQRxDwqF5iQsL89eDuQztvwQLMyjco=;
        b=iyqmXclZhNfOsaW27Dxy7J+N8ePgTGIThVrkFSKVdYOcO5Erv2COLTkSLdR+rt5PYj
         GmgN/oXYAwCr2GCErE7vGywdsylCnTnahuhkKSkjTQ/8Mt/jA6bsbweRffiMwT6hPv0t
         l8Dy1gqnU3imcFypuQyoqG8StnTVlI5c/nrLbKkyvDfP0CU1n9u6yFHlVMHSm/ZFrjvh
         sw5QSb0yGrSvhQFfs7O72TcAZSnsTOgUCzH9F/K9tCknqC4LBrfbpEnl1zqOQUBM/D0H
         ioUBXQez3z+KrgYYWwOaZ7aUqcvIPR5dC5NxMOBSLX6bXULHT1i1bBj1DPIpzSS/xboc
         tgRA==
X-Gm-Message-State: AOAM532hr3iX5m8dUrNSLjCO5LCae0+vFm+X/VVkykfnu30e2VSAXqhW
        NNlmoAnI8nQh87Si9W1Ag208u3UXxkx0BQ==
X-Google-Smtp-Source: ABdhPJzzEikM+BlpLBjGptgKzNt6H74xYRJ1hf25gQcLfzQvi7hJnEUB3RJzVUxZfQhmIHWT78aazw==
X-Received: by 2002:a67:e3ca:: with SMTP id k10mr9589581vsm.45.1637675828715;
        Tue, 23 Nov 2021 05:57:08 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id n27sm1092585uab.5.2021.11.23.05.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:57:08 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id t13so43842869uad.9;
        Tue, 23 Nov 2021 05:57:08 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr8581086vsl.41.1637675828003;
 Tue, 23 Nov 2021 05:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20211121234906.9602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211121234906.9602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 14:56:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpo+L3qNrppCiDGoE6VRqjwDb=6cZK5pJL4bMLhFBKDg@mail.gmail.com>
Message-ID: <CAMuHMdXpo+L3qNrppCiDGoE6VRqjwDb=6cZK5pJL4bMLhFBKDg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2l-smarc-som: Enable serial
 NOR flash
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 22, 2021 at 12:49 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable mt25qu512a flash connected to QSPI0.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17...

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -178,6 +178,18 @@
>                 line-name = "gpio_sd0_pwr_en";
>         };
>
> +       qspi0_pins: qspi0 {
> +               qspi0-data {
> +                       pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> +                       power-source  = <1800>;

... with the bogus spaces ...

> +               };
> +
> +               qspi0-ctrl {
> +                       pins = "QSPI0_SPCLK", "QSPI0_SSL", "QSPI_RESET#";
> +                       power-source  = <1800>;

... removed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
