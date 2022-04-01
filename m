Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291174EECA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 13:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245141AbiDAL7j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 07:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243520AbiDAL7i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 07:59:38 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A658A24A74B;
        Fri,  1 Apr 2022 04:57:49 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id t2so1913805qtw.9;
        Fri, 01 Apr 2022 04:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPDtdpNBYnbJxgBoxYuDKwthmJ39fp2VE6MBYoefo44=;
        b=eYv2Kv7V9VJL3CDrNKKEfX5OvOj6IER3eFuJkEJJuwXVWq0eu34pgbzNJadmxorDK5
         bazcgdzqfynpEbI7lyfX8D1kslke27pqVPLeOKOJAwhmitb+VTAvj5wJoAB5XXIY8obX
         CE96ND9ac7LWgNUjehpeJyhoOJWujrmZtVm1oQ+t/qCK3//8FkYxPjNvm/Pos7Jsv9//
         HllQAKOQYt2R6L2jjvsYBRHf5hVwxzy5pIG10gT5O0pinPmRVFg+a/PuEicpmQaDVKGP
         kQdiUjRyem6Bt83Wygp+apQChHXrY671RK7kXSG7BVhlPARRxVui5tHOf+TdEvjmOqoQ
         eiXg==
X-Gm-Message-State: AOAM532ZJmkXOluO0QDhLHC4ysYRwJSAYwZv1nLHwFfNsX2PQ3FRQp8z
        vnHCqaIKuQSTq6RJqKc80tNnaZ4nLG2Frg==
X-Google-Smtp-Source: ABdhPJyecbAg1JG5Qv+o6Cis8XmQGL7LSFSw8XMzZzMDeQ/I2pKNyugj8N+9SWyCG21hLqXAvhCVEg==
X-Received: by 2002:ac8:5a0b:0:b0:2eb:9af4:c920 with SMTP id n11-20020ac85a0b000000b002eb9af4c920mr4437943qta.221.1648814268337;
        Fri, 01 Apr 2022 04:57:48 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d3-20020a05622a15c300b002eb9af4c945sm1746412qty.3.2022.04.01.04.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 04:57:48 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id j2so4691552ybu.0;
        Fri, 01 Apr 2022 04:57:47 -0700 (PDT)
X-Received: by 2002:a05:6902:1146:b0:634:6b3f:4908 with SMTP id
 p6-20020a056902114600b006346b3f4908mr8114282ybu.613.1648814267325; Fri, 01
 Apr 2022 04:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 13:57:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_OYckvuo50o6q8qgCnLEY1qdvkRh3OUShqP6CROKdng@mail.gmail.com>
Message-ID: <CAMuHMdU_OYckvuo50o6q8qgCnLEY1qdvkRh3OUShqP6CROKdng@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable eMMC on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2UL SoM has both 64GB eMMC and microSD connected to SDHI0.
>
> Both these interfaces are mutually exclusive and the SD0 device
> selection is based on SW1[2] on SoM module.
>
> Set SW1[2] to position OFF for selecting eMMC
> Set SW1[2] to position ON for selecting microSD
>
> This patch enables eMMC on RZ/G2UL SMARC platform by default.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
