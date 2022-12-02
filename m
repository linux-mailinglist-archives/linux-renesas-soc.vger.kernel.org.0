Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5056402E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 10:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbiLBJEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 04:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbiLBJEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 04:04:13 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7711FBA097;
        Fri,  2 Dec 2022 01:03:57 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id h16so4289629qtu.2;
        Fri, 02 Dec 2022 01:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huPi3mO3JwmcKD8PXnAQJA0W3KS/sLn8mZJ3LPlDLCA=;
        b=6GPsNnf3ISFdoi1GN7ZHY6JMFTIlJeyimFDXshH4cCZF/+uiD/PqVcxBFFOMgZaltj
         eT2A8mh7hQAXk4CN93Lys77qg72oTC+z5IpLZ53Mfn4CDX2Q2t4//ZRZ6dZQqNOFw/NR
         bIGF5GUuLIGOOb1p7bEMkXj/Og6dCTErcSHyJZuG/d8OLO1zGfKWNUWZBHnHaRWfQlyP
         7+Skr2P9/qgOzcgMlCYNrbd87/oJflKacpKaS+4jXjAYprpHV5Xf8kfhEF5BYC48Omce
         c73ZAA6x7+JkeoiVCcjTUsKuMjeSAtv2weSgrFyHIKpxbVAVR0KXNxEchJULgYFZ5bd7
         /Cvg==
X-Gm-Message-State: ANoB5pnHbY6vktMXtqFlpBQ3rAY7hDqN7MTGeuBMZ9LtihwAfZIvRoQu
        LTmoHy4OOIMya2pRwMWHkbV8cBj5X6v6MA==
X-Google-Smtp-Source: AA0mqf4gJ6XFiMctjQmnolvaXCjI657slbAH+3T2rN7JpeVYuK+Ky3IR0/44DqMzrlVqYCatn360fA==
X-Received: by 2002:a05:622a:1e94:b0:3a5:8423:ebb7 with SMTP id bz20-20020a05622a1e9400b003a58423ebb7mr47461339qtb.593.1669971836866;
        Fri, 02 Dec 2022 01:03:56 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bp39-20020a05620a45a700b006cbe3be300esm5159766qkb.12.2022.12.02.01.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:03:56 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3c21d6e2f3aso42241727b3.10;
        Fri, 02 Dec 2022 01:03:56 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr63421672ywm.283.1669971836163; Fri, 02
 Dec 2022 01:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 10:03:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ+SRrPhpZxj2_nuGU+Na1T1K4HeWUOEf+YLXeMDkeAA@mail.gmail.com>
Message-ID: <CAMuHMdXQ+SRrPhpZxj2_nuGU+Na1T1K4HeWUOEf+YLXeMDkeAA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r9a07g054: Add fcpvd node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
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

On Tue, Nov 22, 2022 at 10:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add fcpvd node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  This patch depen upon binding patch [1]
>  [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122193415.1873179-2-biju.das.jz@bp.renesas.com/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
