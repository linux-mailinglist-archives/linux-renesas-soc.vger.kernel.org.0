Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644985325F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 May 2022 11:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbiEXI7x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 May 2022 04:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbiEXI6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 May 2022 04:58:49 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C619D068
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 May 2022 01:57:36 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2ff90e0937aso99808727b3.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 May 2022 01:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Zw+PnzWB8h+ThHJTVyyQUjiYecVhb2sE120uBGAUZA=;
        b=VTh31M1eL6e8UIMPcgJIYcPPvfYj8HWqbmtoodidhzI5aBLBhG2vv24AOZeU9xSZ+/
         ZTevit+H4DUP8hiJpvK1iwmh7W2g+sex1D+1WqunmXX/WtdNtYQBS5SWboZr0RMC/2vD
         FGkIUt5tWnvP6ROrccfgpJMshWGiLJfi6V6aXmUDBM4jkVEfth+gZqeYxajbpMs9KtXo
         +GeJ2h9IgLFVZUerBt/v/vLznVkLB4MK6vih5SVCl4Eb0ata5H8t1Kg1pDuX1m9xJP39
         jmBxi7ShOVUH1X0HJ5u0kh8A9Vv6DUPHqkeBlnlV+KjBnlM5SBS7q9dxYsOM8EA/QmXt
         gK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Zw+PnzWB8h+ThHJTVyyQUjiYecVhb2sE120uBGAUZA=;
        b=muU+ciPNaKv8QwbifQ+EOsoLgbCKxgzyMAh2hIXBU0Z7+2I6FztWtnj0zxEf53smA7
         Vtguduj/Yzfxl2cURDbtRrlgaI43wluea3c8KEjlVIbzpCR8zIi1bE0D0qMgasRCwf34
         4UI9INh8FGbEANBUPenVCNBW5xc6K56qxWWNMGSVhX4+4Mh/K3mX9CzBxZZ6QddqeHbr
         k7NA4ICDYHW4BMh53iaIXAkjwHDk/R9oCGuwdALGWhZgzDRnWHSDldA3lUz/vBW3HDCU
         PBy1lmP94c2fHZ50vmuVYBsxGNzwaA/ZyNWzgRD7X71Sx+LhBSrxIrBaW9r3G/M6J32V
         msmQ==
X-Gm-Message-State: AOAM530bbsrX+gYEoD2bVDEM/E4AX4utJDUBLGgYnDXYz0KPDMCWwTaE
        4bTnm/CIeP/HHswP9IMLyQBPkmWjtc2KkNtAGwC1yQ==
X-Google-Smtp-Source: ABdhPJxLp2LEKH5I0AtfIDdj4e3IuUqumlkL+hld/RK7gmmNjMHIGITRXK8Wg5qz0XNOw4mg1FnJjztwD0FFVdXrgXU=
X-Received: by 2002:a81:9ad3:0:b0:300:364b:a78a with SMTP id
 r202-20020a819ad3000000b00300364ba78amr712012ywg.118.1653382651718; Tue, 24
 May 2022 01:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 10:57:20 +0200
Message-ID: <CACRpkda5x-O+RT-=4AU0MYgeR2j7ToH5maYGCUH5NDyx6T7CFw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 23, 2022 at 7:43 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add IRQ domain to RZ/G2L pinctrl driver to handle GPIO interrupt.
>
> GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> used as IRQ lines at a given time. Selection of pins as IRQ lines
> is handled by IA55 (which is the IRQC block) which sits in between the
> GPIO and GIC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I don't know if I'm too tired or reading it wrong, but it seems you
went through the trouble of making it possible to override .free() in
the irqdomain in patch 3/5 and yet not using it in this patch 5/5?

Yours,
Linus Walleij
