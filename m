Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED02455AD64
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jun 2022 01:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbiFYXSY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Jun 2022 19:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiFYXSX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Jun 2022 19:18:23 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45A41209D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jun 2022 16:18:22 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ef5380669cso54899667b3.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jun 2022 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1lEsJtkNZbW6pyj+UEBzWbQKiimWRk8J2D2WyS2PI8=;
        b=KoacatgMZZBpRCXPbvLZYAuPJOuGRaP35V6GQGHzf9ip4nu9ZN9GwQlkv3whLZ0elc
         D9kt8nEMn5EyqAgr1MgXuUXmo+Y0AC0DKSofvzMmYPR66Y2eIjJs19NYd6tlwVcdg5rB
         5IEwg8iIs1HeVvM63yEp97Oi/ceOx/401MffbkHaBjrwn1COYHG7b+eEbefwOyKep/RW
         Skt9O7k/YCCZnuZcIPuB0t3+vYCeRM00BZljm6MiALd71OaTlVSPVZAKM9A3PyWHUiae
         ibgHzU8NsukO2X+n2LiDbprvSUDbfmRciABJ1jKdCflBIdAuUOe8hunRtgUtQ8kATAHH
         80lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1lEsJtkNZbW6pyj+UEBzWbQKiimWRk8J2D2WyS2PI8=;
        b=YyfiPII82NgtqkhvOPoo3SwNhhqUFPBFghQAtgONKFmheUkLmO06Sx8wsPpTy7owov
         7Z0oyqxH9/V/Np2+Rr7dzcy5RSUW4pBLHEJYsNhGmgHzAF4+MsR2j1OfNiSIW5K51npP
         5EBoqE3LtVyzXmGGWB14U28kvkE3ZX4/u1gr+5FXCks7A/OyBcsxFxvC8hsjEheylTlY
         sVw+psLodaKt8vy/yuLjd1QA1ABHqK89ruN2HFf5fk4Rov0mvWhhJfO3ElCcam6c8g96
         pyuAcjg2YOngz7of2jquNTcZoIcHx8ITDhV3PAbBxFEqz5MkPfkiNQ+gk1eRueMlX2wB
         jVlQ==
X-Gm-Message-State: AJIora8Vr7HPjeeP5F8a8WcDVe0s5GCUI82uLvpwKnTrChCotYFQ/MEQ
        dgcsVqXI/uUHbdZL8Nwr6TXlj1ZPS0nTZLEpWstCrw==
X-Google-Smtp-Source: AGRyM1vPgaDOnRXygiHaY2iEqka3XlgQt2gTMAnBu+rU9CZe9K4dmUR22BvkxFs8sAUWLBKQ4L3Y0aeMiNfUdKfZCEk=
X-Received: by 2002:a0d:d487:0:b0:318:48dd:95b3 with SMTP id
 w129-20020a0dd487000000b0031848dd95b3mr7009019ywd.140.1656199102016; Sat, 25
 Jun 2022 16:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220625200600.7582-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220625200600.7582-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220625200600.7582-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:18:11 +0200
Message-ID: <CACRpkdbYbRnjEB+LdUGPxj1T2KbxtieGMY2uzbThD2ffY8zkJw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jun 25, 2022 at 10:07 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add IRQ domain to RZ/G2L pinctrl driver to handle GPIO interrupt.
>
> GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> used as IRQ lines at a given time. Selection of pins as IRQ lines
> is handled by IA55 (which is the IRQC block) which sits in between the
> GPIO and GIC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks OK to me, as long as I get Marc's approval I'l merge this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Maybe Marc want to apply all patches to the irqchip tree?

Yours,
Linus Walleij
