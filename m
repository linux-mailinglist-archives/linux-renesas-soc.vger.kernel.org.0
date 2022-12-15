Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE5364D940
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 11:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiLOKI1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 05:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbiLOKIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 05:08:25 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659B45F50;
        Thu, 15 Dec 2022 02:08:25 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id h16so4755893qtu.2;
        Thu, 15 Dec 2022 02:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyC4bmCrq/k1NOP0H9lgD4zpFecxL+4K9IqBD2Pyo+0=;
        b=hRPnisUE9eM5n9rycxxP0R3c5orrHtS1eTqp455kl54zhijPPBqcrWTPD2GK5E+vg5
         hk5oiUazAtnJ0D2qhMT/ZuDG6OxOHSMp1ijlJuUdDhssdK8Pi0EM4JOsrn91dh6e8rh1
         W6HsAqJOlbgL550oMrNm8d8tTzYuHBEDAtoTP4QxhFs8jd/AXovQispNl0q+cms71JYf
         ZN4qi204A3v1YYdkJXqTI5hP3uxmfW8jCRlPbZWt5yC1Oh3hP9gDi9P53KswCnjdtT5Z
         TYy9q9/aL2X8TsbapNmmj5iIe61ATd2/LvcFMM62JaG4JLfnqzTpgGTHbEfj7MTkBF33
         sPjg==
X-Gm-Message-State: ANoB5pksQkKNCQrnQoGzW3s/e50Din2KXOH4qXpVeSMepvJumttPiIL4
        GGDU6+JMVNtbUBaDlIznVsCyc6k8zamYhw==
X-Google-Smtp-Source: AA0mqf74Zlf2o2I6IUo8O8m8UCSPCV9EiIsoFnzcbnRTb+Vu1oQ2RVykudLDYJu/FlhdOkA4IZRB2g==
X-Received: by 2002:a05:622a:5907:b0:3a6:7558:e0af with SMTP id ga7-20020a05622a590700b003a67558e0afmr41952267qtb.28.1671098904367;
        Thu, 15 Dec 2022 02:08:24 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id j4-20020a05620a000400b006fba44843a5sm11290844qki.52.2022.12.15.02.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:08:24 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3c090251d59so34724797b3.4;
        Thu, 15 Dec 2022 02:08:23 -0800 (PST)
X-Received: by 2002:a81:a8a:0:b0:37e:6806:a5f9 with SMTP id
 132-20020a810a8a000000b0037e6806a5f9mr12883745ywk.47.1671098903648; Thu, 15
 Dec 2022 02:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20221209171836.71610-1-biju.das.jz@bp.renesas.com> <20221209171836.71610-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221209171836.71610-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 11:08:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZRuBLD0pEfip0yPdWE2d=X9Hv2AFQP_xz-r1Ft2RQCA@mail.gmail.com>
Message-ID: <CAMuHMdWZRuBLD0pEfip0yPdWE2d=X9Hv2AFQP_xz-r1Ft2RQCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Update interrupt
 property as optional
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 9, 2022 at 6:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On some platforms(for eg: RZ/V2M EVK), interrupt is not populated. Update
> the binding to make interrupt property as optional.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
