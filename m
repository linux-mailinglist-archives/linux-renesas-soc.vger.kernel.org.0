Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CB259826A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244441AbiHRLmr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiHRLmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:42:46 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656FC7D1C6;
        Thu, 18 Aug 2022 04:42:45 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id h27so861319qkk.9;
        Thu, 18 Aug 2022 04:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NFBWwsF8oFFVRfvNvXYoR8iHu2rXxVuKK8VL12CxglE=;
        b=DKSi0eUn9kL3+Ab0fp+xJI7K8g4iVO4h3KEj5ouFdXtAJOJnTrtV0tJD64LrZFPkJX
         1/3ESBYzQHiFTKhJzyRGCaqi5sY+14wfxWTmNz8+IJzyet5mly3MiWp8i6IFoiGhKt3p
         1D15igFxM+zB6rNLoqoJi33ug7FiBF3IsnLZV/UFlLHjigkUT8bMTUjhppfXVolwd22f
         dvNHvnpaVIWVKFkB2XdUTwpOzui9P9fei/aWXs40YD2UVIBOtNbNlS7wTvtAj0mYFsaa
         R0kUj7FAdc1QNbVh1oZGELo4xwHtZBkPb676gCusvMPmi4V4H8riUB9Np4mxWqMBeV2u
         Zu5A==
X-Gm-Message-State: ACgBeo2GkGrX8R7lektBGjSgpqGEViv3ah/Y3JIPhqN64THSmHxhtFlC
        I0jytSJf1N3a0C6zMaz7c653pO8gxhS/6A==
X-Google-Smtp-Source: AA6agR6zmCcnvAlNURT0q3r6zS21V754ttEF6xFM8gznXsm4teVToLK5pzOFG+6F0ZfT6QfRenQIwA==
X-Received: by 2002:a37:27c2:0:b0:6ba:ed29:9f3b with SMTP id n185-20020a3727c2000000b006baed299f3bmr1670733qkn.635.1660822964296;
        Thu, 18 Aug 2022 04:42:44 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id f12-20020a05622a104c00b003438a8e842fsm875173qte.44.2022.08.18.04.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:42:43 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3321c2a8d4cso33501067b3.5;
        Thu, 18 Aug 2022 04:42:43 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr2436519ybl.89.1660822962828; Thu, 18
 Aug 2022 04:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com> <20220802101534.1401342-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220802101534.1401342-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:42:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBonDhDGHh2yy9=3gp7nqFwzN680TVcPo7ySNOTf1urg@mail.gmail.com>
Message-ID: <CAMuHMdWBonDhDGHh2yy9=3gp7nqFwzN680TVcPo7ySNOTf1urg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g054: Fix SCI{Rx,Tx}
 interrupt type
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 2, 2022 at 12:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the RZ/V2L Hardware User's Manual (Rev.1.00 Nov, 2021),
> the interrupt type of SCI{Rx,TX} is edge triggered.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Fixes: 7c2b8198f4f321df ("arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
