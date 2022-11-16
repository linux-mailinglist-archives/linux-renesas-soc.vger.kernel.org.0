Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D52962B547
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 09:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238896AbiKPIcQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 03:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbiKPIb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 03:31:58 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C93F24F1A;
        Wed, 16 Nov 2022 00:29:58 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id w10so11469008qvr.3;
        Wed, 16 Nov 2022 00:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WHNfTSw3Bbekpjo6krzPPf7sUnKMyKehjynM8ZBXD4=;
        b=zwvzIZNltZ4wW4Oa2nV2XrWrQ8/DG06x8ArGd7BrwEMdMPvuQaXrzEK9K14yTU6quX
         bRwzGiasVmIbvSmPTZU9jRjIJxoxQf+nCDfcM/H5bZptFUCzGnQqmyNtfL1eh60Q0nfi
         Y6zVfbDs0f8esHq5dALqUGXSyG7OnflE18m92vAdlENLPUi1VwSBco+RPg7Ba3/UIQBC
         wSf8Pny4phtEDEST7LdGRNG8kY2hhZ6W000914t7DJJhrsEC8w+yAZSt+pqMsLRhnub6
         QKRBmMjcINrc7md3hRjr5L6ZMeN4l0Fv+hfKxKTY0ti8CmBxlkcTO32ARHlS+3o8jF8P
         aOvw==
X-Gm-Message-State: ANoB5pkjWzQUv5lTiUUw5x/vpEflDPZBRc9qgn72oEVQ6Tvz+1sfO/8w
        AGQPcXkO5SGF9dKoUIoFR8dbzD97ztlFLQ==
X-Google-Smtp-Source: AA0mqf4kxmCVhDPFBpzj0h6IdSIgMhWIHwk0g9jPWnrlzqTGhNgigUfPrjK56vvBELME1vSHEuLDSw==
X-Received: by 2002:a05:6214:459c:b0:4bb:f952:c799 with SMTP id op28-20020a056214459c00b004bbf952c799mr19894317qvb.3.1668587397356;
        Wed, 16 Nov 2022 00:29:57 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id o5-20020ac87c45000000b003a494b61e67sm8497763qtv.46.2022.11.16.00.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:29:57 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id z192so20173142yba.0;
        Wed, 16 Nov 2022 00:29:56 -0800 (PST)
X-Received: by 2002:a25:258d:0:b0:6ca:3b11:8d76 with SMTP id
 l135-20020a25258d000000b006ca3b118d76mr20524334ybl.202.1668587396569; Wed, 16
 Nov 2022 00:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20221115123827.736141-1-biju.das.jz@bp.renesas.com> <20221115123827.736141-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221115123827.736141-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Nov 2022 09:29:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW28kN4kNLjQqMnLUis5+sSRaRAFLBotGqG+Xtw7fai1g@mail.gmail.com>
Message-ID: <CAMuHMdW28kN4kNLjQqMnLUis5+sSRaRAFLBotGqG+Xtw7fai1g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r9a09g011: Add system
 controller node
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
> Add system controller node to RZ/V2M SoC dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit header and description
>  * Updated label and node-names
>  * system-controller node is enabled by default as it do not need external
>    resources from board.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
