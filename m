Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA7E50EA9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 22:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245508AbiDYUeM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 16:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245440AbiDYUeK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 16:34:10 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EECB28E2E;
        Mon, 25 Apr 2022 13:31:01 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id r14-20020a9d750e000000b00605446d683eso11600777otk.10;
        Mon, 25 Apr 2022 13:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UElAjPl3ZBi7MmMofrkEG57iZKnOHfN6jBd4SrYOjFU=;
        b=EsKXx/n2OAIvwtgLksknpBCgVt7KkbeY8U8KO6jP2L4BGAwzcPyr6vh4JaY60QA73U
         7UReuXk0MW6kjd4GwT0nFndrn1ZfePQQNIoNRio/jWWnqveSOYGsvEXgfwCbEMH9/VyJ
         nJanbwIhSZuVqxRiwxhUZh8M95QnvF/W2athUf/4NH/gDM2HIU1LXdgY/hStq/v/mIPs
         jR23NGifMN+opmM66Z1hA66XUncy+4zXR0xlZD2/kuSHJ1TsUU/x32XbvC/Wx9BsnlYc
         iA6By6pA6SapFjjpPuMFtwH0be/ByYn3+wbMDVBjE4l8QHYbxIvWVF9+YGm6lw3XRCAX
         HvXw==
X-Gm-Message-State: AOAM532ObpiKJp1EAOuUf56/tFeyRbonDZBnWzzP+2yHoabUYMja6vE/
        vrYud7YmWDfcxJEctAlfcFliOmSJ7w==
X-Google-Smtp-Source: ABdhPJxrn8XpXmqHx65aTT2qLKNc7o5kKD8kVm9Z0t/pjjxtvXb6aaA2fbtCwtiuAAPGquB6dCUWEg==
X-Received: by 2002:a9d:482:0:b0:5cd:57a1:8082 with SMTP id 2-20020a9d0482000000b005cd57a18082mr7248433otm.360.1650918660912;
        Mon, 25 Apr 2022 13:31:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y22-20020a056870389600b000e93d386d97sm82239oan.31.2022.04.25.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 13:31:00 -0700 (PDT)
Received: (nullmailer pid 220583 invoked by uid 1000);
        Mon, 25 Apr 2022 20:30:59 -0000
Date:   Mon, 25 Apr 2022 15:30:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas: ostm: Document Renesas
 RZ/G2UL OSTM
Message-ID: <YmcFAzRmmMiKIA2c@robh.at.kernel.org>
References: <20220425141828.197321-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425141828.197321-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 25 Apr 2022 15:18:28 +0100, Biju Das wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Make the resets property required on RZ/G2UL SoC
>  * Added Ack from Krzysztof Kozlowski
>  * Added Rb tag from Geert
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
