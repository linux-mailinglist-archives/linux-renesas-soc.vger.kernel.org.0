Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF151BB62
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 11:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbiEEJJx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 05:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234566AbiEEJJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 05:09:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAF64B413
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 02:06:13 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x18so5240866wrc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 May 2022 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QPvYitEkakUSEkkRAd+b7E2XB0UqCnryoZKojHH0dhc=;
        b=awvizp79SJb6Kv1NeHmUcFHgDxY9B2TEi5BCYTUszXn0y/O0Zdn3qK1wqjpMQWlGKJ
         qntAqfvXmRwal2i948gt5vGK5kcRl/rvvWVoPQbCZ17pYzMi1KTxx4BUx9VakX4zZjZa
         AJcM5mZLHyrux1MyCU9enVWIWxiZO/P/ezutLWc8Kgo1dlG1gVwfgqUaOWbUWzSydcEc
         G9VlrjYRUwgVnu8is2l/t5kElwf5fti1PCHgxeC4aN6bg3HVpkhSbzc3n0SOHVrKV/F+
         xqfFrXuv47Lq/bfIfFjKIGVVYUvPrBZj4rfXRsa0b3kNaH0SwgxIUwUMgaOiGQy0Cy3B
         LfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QPvYitEkakUSEkkRAd+b7E2XB0UqCnryoZKojHH0dhc=;
        b=63JALJ8jiO/2sQp4E+a7M/ias+M0JKKk8YuDgLeeKEZBpMNXvoDoZyXpPYmZwMsEdi
         OQl4L8eAWuWiJfVEnK8IPtf/oK18K4GMuA4FrLfV2FjduRIN62OdQBPm08oaeOIa7Ooa
         tcTfSwgyEH4XgkJPSJFE2SizSullmhAgqz9j5oIsljHxUYqKHegpWQ0P+PdG3526ty50
         lONRsIk3Fu1/RuH4FFKV1iYIeeIP330rU6ENsHe1cmaQ347FUtIieEezdX2OGd8bCVBq
         27u9W96cb1hvPi/7ufs9ZkDnhRpg2NKv073RWc5hk0QakD7Efbjxht6g6zf4qLjilJr3
         zepA==
X-Gm-Message-State: AOAM531EP8ZbAbjSjV1XJsn2OCT/pWkd5QD3/2I8Xcb8Z1YCJv8kSlyx
        iqEWoMVxG1cA8t2s/NA/EcyWBQ==
X-Google-Smtp-Source: ABdhPJx0C0YUR3RaSCP6SGaVzNzESuZ2Lqdb5fK6LdClRJadIpz1p0+6laZ2ZJJroxehqTM0GQos5w==
X-Received: by 2002:a5d:64ad:0:b0:20c:565d:ca19 with SMTP id m13-20020a5d64ad000000b0020c565dca19mr18197775wrp.634.1651741572271;
        Thu, 05 May 2022 02:06:12 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k21-20020adfb355000000b0020c5253d905sm894649wrd.81.2022.05.05.02.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:06:11 -0700 (PDT)
Message-ID: <48a6fd28-b0cc-d17d-4e0c-170240d05455@linaro.org>
Date:   Thu, 5 May 2022 11:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV07CHm3NE9YUTMqp-ZNkWoJyR6CFU9PA0heK+9G6NDxw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdV07CHm3NE9YUTMqp-ZNkWoJyR6CFU9PA0heK+9G6NDxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/05/2022 17:03, Geert Uytterhoeven wrote:
> On Sun, May 1, 2022 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>> Document RZ/G2UL RPC-IF bindings. RZ/G2UL RPC-IF is identical to one found
>> on the RZ/G2L SoC. No driver changes are required as generic compatible
>> string "renesas,rzg2l-rpc-if" will be used as a fallback.
>>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I already sent a mem-ctrl pull request and I was not planning for a next
one, so maybe this could go via renesas tree?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
