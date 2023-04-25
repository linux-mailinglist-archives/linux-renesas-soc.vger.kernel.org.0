Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424136EDD1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 09:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbjDYHs7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 03:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbjDYHsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 03:48:25 -0400
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD7CE4E;
        Tue, 25 Apr 2023 00:47:44 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b992ed878ebso16582930276.0;
        Tue, 25 Apr 2023 00:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682408864; x=1685000864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXATlI8zQFpvioDHoFlOVVEH9bB1ha5NF20/P873Yjo=;
        b=Wsoxl8OtAm49xICjgfwSLaBGb/f2ApthJMa6P3BoK8JjPOZ+DubtQ+G2XCQPbBbEli
         ob1bXJqwUp3CbO8Bbai5TPiik8mnc1VrsqBa+lPMOFyETQbG66JdQC/sXEHU3yERBDtr
         WdsXQVwApzMYkWBY8bX3JiZOPWavteBFs6mQIYaKzIpuP9Lg4aD0CDIWg2S8XvBhMTx3
         OVF7hZqLOAj/RV9Okg157dPtrdlKcDU9jvNqtScsxV/JxX3UIlIsS/wgbrItCvsQZt4i
         ftH8cifKWRAujUwOJ9piIxMgf/AqiF6O6BICO2gEymvQ8h7WikZSUpAlXFtx27XHf/AN
         NVBg==
X-Gm-Message-State: AAQBX9cS8E7qKGOFrb2mSzXptev5s+UNjMY6hdkeXFiOx/Q5bMqvCUxt
        ANgjEShIDmVmXjWwp/A6gbIqW3zEDkG18g==
X-Google-Smtp-Source: AKy350ZVUgvHsPzFXK0RogZ2Cimji6GU4ae2ZikBl5XD9WeUAjh5V9T7sBZKHgHNo1vC68Rms4yVCQ==
X-Received: by 2002:a25:abf3:0:b0:b8f:3586:dd25 with SMTP id v106-20020a25abf3000000b00b8f3586dd25mr11211809ybi.24.1682408863755;
        Tue, 25 Apr 2023 00:47:43 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id d189-20020a254fc6000000b00b8bfb4c4f1esm3310637ybb.62.2023.04.25.00.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:47:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b95c3b869dcso18603940276.1;
        Tue, 25 Apr 2023 00:47:42 -0700 (PDT)
X-Received: by 2002:a0d:dbcb:0:b0:54f:8636:2152 with SMTP id
 d194-20020a0ddbcb000000b0054f86362152mr10417319ywe.15.1682408861984; Tue, 25
 Apr 2023 00:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com> <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Apr 2023 09:47:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx65YSb7THMKVFjWt8BnvsR5yOXhR1T2PZ=coPPARXpw@mail.gmail.com>
Message-ID: <CAMuHMdVx65YSb7THMKVFjWt8BnvsR5yOXhR1T2PZ=coPPARXpw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 24, 2023 at 6:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v7->v8:
>  * Fixed the typo vsp2->du
>  * Added Rb tag from Rob as the change is trivial.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
