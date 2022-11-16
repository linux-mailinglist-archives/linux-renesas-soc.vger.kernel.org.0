Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B39C62B544
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 09:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiKPIcO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 03:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238979AbiKPIby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 03:31:54 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAD026495;
        Wed, 16 Nov 2022 00:29:22 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id w10so11468369qvr.3;
        Wed, 16 Nov 2022 00:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+K4RKT1VeUzqWatYjjiz4vNUMOLyvspXx68HXp6C1M=;
        b=UkF0RPo1kbn1caRSOx1xY7W+KKC3OAc/T6ydNLEK0xljlENdnQuZ5/lZ4hij62p0jU
         M9b/IwONn1UfnSI4f0aeYyWZ6shbyrsugrHsSXv1m4FaPhbCjf/zoiAuyrZEgKu1IzJs
         nuWcWlHWr2t8xik8Y77KhvCgXg6gBX5cQymDiZH8pGPW7yc2KNDMjRklh5nKYTgyCqJx
         eOymJLibjkzlMU3Igw4180QjnEpX8sZyr5Nn6Y5WKJ3zK0+Rm/PnXyuuDons3k1ll+S3
         fSv3S4i613vKx8+VDwKztq/YkKcokFVZ/9mku9053ZREgcq+LGd+hsfCGl2VtS01WSAP
         pURw==
X-Gm-Message-State: ANoB5pnAmTQkdhegKelrmuyFoq+W21CNaA7nEPnPjYFvIgOG7kygzNS5
        UrO3LhS0enCubTvM9bDvr93UCywhznoQTA==
X-Google-Smtp-Source: AA0mqf7FgL2tYDv7FSDWqSByxS1mLANHt72eMX5RqfXH56xyuzfs07P+JTOXxu27R2olB+fM8gVm5Q==
X-Received: by 2002:a05:6214:380d:b0:4c6:4ac0:12c1 with SMTP id ns13-20020a056214380d00b004c64ac012c1mr8713489qvb.111.1668587361644;
        Wed, 16 Nov 2022 00:29:21 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a254800b006fa16fe93bbsm9679631qko.15.2022.11.16.00.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:29:21 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id b131so19430199yba.11;
        Wed, 16 Nov 2022 00:29:21 -0800 (PST)
X-Received: by 2002:a25:844b:0:b0:6de:6c43:3991 with SMTP id
 r11-20020a25844b000000b006de6c433991mr19127160ybm.604.1668587360788; Wed, 16
 Nov 2022 00:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20221115123827.736141-1-biju.das.jz@bp.renesas.com> <20221115123827.736141-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221115123827.736141-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Nov 2022 09:29:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU20a7XVZ+Hpa1G9YQ4_cgo+yeLKS3CMPyCZ-bmho86zw@mail.gmail.com>
Message-ID: <CAMuHMdU20a7XVZ+Hpa1G9YQ4_cgo+yeLKS3CMPyCZ-bmho86zw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 15, 2022 at 1:38 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>
> Add DT binding documentation for System Configuration (SYS) found on
> RZ/V2M SoC's.
>
> SYS block contains the SYS_VERSION register which can be used to retrieve
> SoC version information.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Renamed the file based on the compatible
>  * Dropped quotes from id and schema
>  * Updated description
>  * Renamed device node from system-configuration->system-controller
>  * Renamed label name from sysc->sys
>  * Fixed the indentation in example
> v1->v2:
>  * Moved the file from arm->soc/renesas
>  * Updated the path for binding file
>  * Updated the example

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
