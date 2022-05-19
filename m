Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A327852D3E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 15:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238750AbiESN0h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 09:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238748AbiESN0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 09:26:35 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BC57A833
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 May 2022 06:26:28 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id i187so6804089ybg.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 May 2022 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5eeUrHtwQHbc6kaHl37fkm5yyYSJ3/NPDe4LUQNYaQ=;
        b=lNW2+XcTGLbi1+LXuiK4XEnrpSLle5RMVnyjNvveZzNRjxf4nkBUmmVo/ruNTuf2H1
         FRL56+rcK5fujjAzKuS2aIiEt6TdXMxQ2rDuc9/2zLu4hPdhqfizoUhJ28ktwhsfwfJx
         iyCUnQLs199tkUf0OruWOAoG/rc4k8gP835uiyfPGQhIIX1rZKHtzdQkENvd6yKaxeyW
         TpQcrv8v6pz8UJS0UC0641dYqH7upkPFTXE7/dSbqO1eCIuBQgLhFg4fRE0HQE6ya/qh
         pjeJ3GpLiV9Z8fJHM9VFpVPtPp2GgE9G92HXmm50Q1IExX046y3eBcw1XIkZHXIzSxWl
         Q4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5eeUrHtwQHbc6kaHl37fkm5yyYSJ3/NPDe4LUQNYaQ=;
        b=dskPbGSWqN5UXtyEoWPkEcKKsnmepczhdIBek9xAvDfhak3vW5XCHenIvN7ljB3E80
         nnBOQlno4qgP3fjEt1XjeB/Ck5QPL4S9y1rGGkfYTW5YsAT3VWgF4mZy9RpmJCM6fypu
         TLgTxcwBLWlHtLZIP3Sws2FrD06RZv5avU3fQsV/gAasB19u7MCyzZGYFSw0W+//HuGJ
         5/hfyvwFk8K8GLrhiMbuJ5WlmC2vPBIfYe5OTwNCrz725KMEsupZ32LpbVUnohK86nhB
         aiE9Ggjs9hpZUvG/0QIzxOGnWRwzIhkNLnFzPipVYh4wKzEa0cWSXhJz9Xkb3ywcB6gq
         SU1g==
X-Gm-Message-State: AOAM531sfmBndkUxdP8/ok1Fwj1Zjqv0qZD3Agp1GS+J5xPJnk74MYsb
        BZLl+3Kud4XFkR5QqsLwv8Pn+r/eLY2C9+pPk8PAhg==
X-Google-Smtp-Source: ABdhPJytRO15F5eDU0jXHSWp5kq18gT9NfI7pAX6nfu7aDP5oAJbZzHxiDIaTQJqTR/TTs/Y+WBbEx/KIJBm/mEY+pw=
X-Received: by 2002:a25:e78a:0:b0:64d:672b:af3c with SMTP id
 e132-20020a25e78a000000b0064d672baf3cmr4567338ybh.369.1652966787547; Thu, 19
 May 2022 06:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220518192924.20948-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220518192924.20948-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:26:16 +0200
Message-ID: <CACRpkda1pfL8tk0S_0bHvj4kWYrLTTeOz3b_A9qK5DJwHWeTXw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
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

On Wed, May 18, 2022 at 9:30 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Supported GPIO IRQs by the chip is not always equal to the number of GPIO
> pins. For example on Renesas RZ/G2L SoC where it has GPIO0-122 pins but at
> a given point a maximum of only 32 GPIO pins can be used as IRQ lines in
> the IRQC domain.
>
> This patch adds ngirq member to struct gpio_irq_chip and passes this as a
> size to irq_domain_create_hierarchy()/irq_domain_create_simple() if it is
> being set in the driver otherwise fallbacks to using ngpio.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

NAK

As pointed out this is a property of the hardware and thus you should
derive this property of the hardware from the compatible string.

For example by passing per-variant .data in struct of_device_id.

Unique hardware properties means unique hardware means it should
have a unique compatible string. Otherwise something is wrong
with the compatibles.

Yours,
Linus Walleij
