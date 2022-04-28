Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D73513460
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346708AbiD1NHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346629AbiD1NHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:07:15 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F9584ECE;
        Thu, 28 Apr 2022 06:04:01 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id t11so3328453qto.11;
        Thu, 28 Apr 2022 06:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0lvBJdjSvNUYgcTFiszj2H9e/jo/EQ1g9OpmlufkMWk=;
        b=jFYuVaExSsDL+HKoQXPoYC186bu2CN4IWwVNmcN02lKOJUj+gzyhmOd5rHspwhkvNe
         1VlXLTM8GlMkn4Z7nSrxvyv6jnlCCkZsaL6wyXMDYcxanmxnWirUoVBeXGFFCZeT2Tfa
         lBjvSVI3Cj6xAsrQUYZeCAyh/m+3kaS8a2HlAkhlyka8/RSdK/U8S5lwc7GpppQD+Lcv
         6+lPVaSFZktdC5y3x7/tuHpn/7G9rgZVc+WfzDTT3VU74ykQGdSYIKpUQcggG8PO4j97
         oZnP7K0/e0TeyxlbRR3t61Ityb769+2CaTizMZu9DG9pAjs75RDT9tOcq6ZTlyjKkfBN
         oSEg==
X-Gm-Message-State: AOAM532MeCi30LOLZ9KsZtCg/GdDxu9cOfNqo9pq5vObcOFyZf782M1e
        I6LEmx2MlOjbcua3j1/wLk2M/nfYLeb/Vw==
X-Google-Smtp-Source: ABdhPJzOkco5eZVTDVi0GtHnzNqlCHuUwST9orasLXRwB6BO5dZ/2e9z4ckwqSWgm8KZukm9mG0YTg==
X-Received: by 2002:a05:622a:594:b0:2e1:d59e:68ed with SMTP id c20-20020a05622a059400b002e1d59e68edmr23283067qtb.204.1651151040486;
        Thu, 28 Apr 2022 06:04:00 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id v126-20020a37dc84000000b0069f9c375519sm1637882qki.46.2022.04.28.06.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:03:59 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id w187so8909494ybe.2;
        Thu, 28 Apr 2022 06:03:59 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr31523906ybq.393.1651151039519; Thu, 28
 Apr 2022 06:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:03:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHo3tPw7=2iAnMFqX0GY+yjymJuTF32N+KXbWGeoVAbw@mail.gmail.com>
Message-ID: <CAMuHMdVHo3tPw7=2iAnMFqX0GY+yjymJuTF32N+KXbWGeoVAbw@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm64: dts: renesas: r9a07g043: Fillup the WDT{0,2}
 stub nodes
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fillup the WDT{0,2} stub nodes in RZ/G2UL (R9A07G043) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
