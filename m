Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C044C65FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 10:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbiB1Js0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 04:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbiB1JsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 04:48:24 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF30AE4E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 01:47:45 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 25CD53FCA8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646041664;
        bh=0JbmlSAA0fNwnIooIgqlcG+0ARF2DXlxIL3bhnCTrKE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=PrrGRHzBMfHObCvYQqig8k+EJydyl3OkKyYtFAxhlxp9U0Ywv4gmoKSdGAZQwJswA
         wUoPeIkulNudVxJUL6emfzWAAXHXW/W2EHmFI0onycKcqEsnDr1GSKSF23DysKAOIk
         TpgGQDE/1FjTkf4pJpICekHkCezxYXnk86omqTpvhokiRMREGDdzBT9VK26IsYfMOe
         bS7Oz3CDtRGNcAtaYUpxsNGJ5ishWXmIHTUVjdp9CzkfOLy49k7nC/CfsB2cmWIlwx
         dikjMDTtgTPLpMEacOi62Rr5BXItt6eYBbzJJd6Z3aMAZAbbhpRnoU5nnm0Rd6qmNT
         T5IQNnv/Ga7Yw==
Received: by mail-wm1-f71.google.com with SMTP id m21-20020a7bcf35000000b00380e364b5d2so5833889wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 01:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0JbmlSAA0fNwnIooIgqlcG+0ARF2DXlxIL3bhnCTrKE=;
        b=CZSbw11ZGLT73nIe3PNwlbISMTGc1vjnEJt9qFcpkUXpEPxmHIGmwpfZd89vBUUmub
         TsKEsGeGKtr8Rgha3Ku4AXudc5IicrWzpJ3eN/Xbg/L4NAHwV1ugBb8Cmsag3EpT4A45
         opUn8F+AtmK8j10wIEhXocalRL8nfLAO0/iQPaixS2x+mf/EO7b3B/zUm0dM7s90V0Bm
         1Y5xCEF4NEV8UA/uI6O2BF1RxCjxgJF2WrvAVZwEzr1x9ReJSs3r6pZNO0n3Tsa8sEGU
         l9ifDO1x0lTA3cD3IIcEs8E8DQRDZrmT26f+HmdxI8zfPARQWxbQh1P1OXi1aoHmnsme
         e5Jw==
X-Gm-Message-State: AOAM531kH364Eo3VWcOj6JT66KDszc8J5k/ZBFFBWX11GAOhGvbyFFCv
        MLAKQROGFdKajQ87jYoN9RgLzRgYVIOBVFUyeCPN+LZJtxLP0mEnYjjDf8oXlMrHgIh6Fqun7NL
        0cDteDqxx/OeiSJLgvdTNieJ+ysAJc7+btFlHp/RJniU2BjAB
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id m21-20020a05600c461500b003810c68e8f8mr12570756wmo.117.1646041663883;
        Mon, 28 Feb 2022 01:47:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYFWnSTQN2LNmgpLVDrQRcbyyaUOEPgYrj2AvMI2hTg1YmU0CB7RgwzVxUe1zibUvQepHT0w==
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id m21-20020a05600c461500b003810c68e8f8mr12570736wmo.117.1646041663731;
        Mon, 28 Feb 2022 01:47:43 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i6-20020adfaac6000000b001e7f9a9498asm10267833wrc.50.2022.02.28.01.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:47:43 -0800 (PST)
Message-ID: <b584b58f-a17a-e866-3054-64366dc7fec4@canonical.com>
Date:   Mon, 28 Feb 2022 10:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: timer: renesas: ostm: Document Renesas
 RZ/V2L OSTM
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/02/2022 23:48, Lad Prabhakar wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/V2L SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0]
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> 20220227203744.18355-8-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
