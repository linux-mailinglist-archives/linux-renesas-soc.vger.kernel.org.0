Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B467E78F9C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 10:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjIAIRL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Sep 2023 04:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjIAIRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 04:17:11 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90AF8F;
        Fri,  1 Sep 2023 01:17:07 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5922b96c5fcso18437277b3.0;
        Fri, 01 Sep 2023 01:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693556227; x=1694161027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdHaDXHtYr3ML3gRgEjVJjdfXKNvKOVFfI7tWyAzqws=;
        b=E5XUbGLMSXdSGcsgwBZPqM+HdS30CQdfLvrUiPHXXoP/zkzgX7KfbTW8mGM7dK7tIg
         2GPVvscP7AOaxI3xCotR88zHX+B2lNqfGe3G/M1ooT/kNZoKDrizD2bkz4xTZ819jkWe
         C8jqxemNtO48sfAl0AoEOZumcCDIL3VinUUcxUy2GlTTn9z8YlYP54a/Dgivj5b1zuQk
         ogqYClMHJOVLWjAF1e7uDycA0GkQYwpNKW0xlQlnrIX/+oyO2RlJRjSeh4Y42JId/hIn
         c/IFJH4pN5z0BGxZZBrtwcdskdGldWhEik6YQIOFbwWrRG9p2RecWrVGXxeyq4Z2CEZo
         dfdg==
X-Gm-Message-State: AOJu0YwS0RQmaeRwq4dBQwsByiLz69BlSW0HQidPFbjcsJQqUSUuYHpr
        0DTkT7CInqVoiKJOU9r2qYNQF2MhPy+p5Q==
X-Google-Smtp-Source: AGHT+IEl/b2UIUFki2a7Vr/mxj/pBn1EHS2VpDZAEncnXIYzNaF/o0qJTNJzKN2ddja+1gzIdiCHXw==
X-Received: by 2002:a81:62d7:0:b0:586:c0bc:77a2 with SMTP id w206-20020a8162d7000000b00586c0bc77a2mr1906564ywb.0.1693556226814;
        Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id g191-20020a8152c8000000b0058fb9863fe7sm922597ywb.103.2023.09.01.01.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d78328bc2abso1326737276.2;
        Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
X-Received: by 2002:a25:bc8c:0:b0:d7a:d923:4493 with SMTP id
 e12-20020a25bc8c000000b00d7ad9234493mr2039914ybk.64.1693556225863; Fri, 01
 Sep 2023 01:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230901075932.105822-1-biju.das.jz@bp.renesas.com> <20230901075932.105822-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230901075932.105822-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Sep 2023 10:16:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh7TLORPJQBtX+8wisVeFEGwVX8+p_xxNmAsA7e0zU8Q@mail.gmail.com>
Message-ID: <CAMuHMdWh7TLORPJQBtX+8wisVeFEGwVX8+p_xxNmAsA7e0zU8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 1, 2023 at 9:59 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Renesas at25ql128a flash connected to QSPI0. Also disable
> the node from rzfive-smarc-som as it is untested.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped subnodes, as all pins use the same power-source value.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
