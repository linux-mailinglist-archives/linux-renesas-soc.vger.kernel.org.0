Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66535162D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 10:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238062AbiEAIlH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 04:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiEAIlG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 04:41:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37204199A
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 01:37:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y21so13553534edo.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 May 2022 01:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m157W2zApEuizi33CKK6utPLhy+v4JIY3Lxqnn+AIsA=;
        b=XKaNela1/7HSU79MHBThQ3hRkxKfHzyV1N5ENmcinScB8ju3QC1PgN2yWLKblfZkYi
         vV2hYrpyXRlb2PfWhqvg9dHu1DJFbgGtjqN4E2IvKKiDe9ZB48ix4c1LrW6Ln83g9HWq
         MIVPMrOl6VZsTE3bFPo8oZSVpbhx3+agpHZuZMS7XmxiNMUHSzCNatL8wVLTvmo/uxYJ
         bNIC1TqycnpBA1nO1fIyvyw8TNvxnhRFZg2Higxq3aeSYQ9gLqlm6/vVsEsIeMSMx4/5
         46KSy+P/MoD0HIZ/zmmuBvAzhxB44/6EWfC8VBDvcVR+Vl+L/qxReUzn9S8xYiItEc0k
         /yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m157W2zApEuizi33CKK6utPLhy+v4JIY3Lxqnn+AIsA=;
        b=UoFuu2XP8FCVBKw2dYLujQq/nEXnMnoHpBuWtzTvVH+9RUxWQGKGEqs88FgM8hUm10
         W+uyGhM01eRo7bTBCO79MAkv6y2LqUIqprxEc8QHhieYl0JXdSmw1ofvWj5C2Ovc6FZ2
         NBB/ibVLcT17ncGD+4nOD9MY1aSAQ7KCHptwM/8pbdVih3RmMtpWdMY3o3cQ8vuoo5PB
         N5IolOL89+bhJJToqU+44mHuc2j294OhZ+OH9v7b6c6Tu3ho0yFzv+4zDgWdVHOWeYRX
         aVkWmRcyT4HQ483wCDaGbzp7S1/4Z1S3oSZN02XMvNFfg6kENNX7ZKSZG7qgCabWToEc
         Opfw==
X-Gm-Message-State: AOAM532FA6YQDUUPznFi27LgdRp277HLRXedJ+2NASJ8/ovRv6V8INVl
        cj3SHV1djGo79cp/DVLlRugWXw==
X-Google-Smtp-Source: ABdhPJxp16wUP0I+gcjyZCBYv6Z8hFgaZkJhPmyzWzJ61JVZOEFPU9vtIUaJoGTFoFikS11YRmIk5A==
X-Received: by 2002:a50:eb87:0:b0:425:c3e2:17a9 with SMTP id y7-20020a50eb87000000b00425c3e217a9mr7867864edr.109.1651394260574;
        Sun, 01 May 2022 01:37:40 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm5058937edv.91.2022.05.01.01.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 01:37:40 -0700 (PDT)
Message-ID: <d4f647c4-922a-c0dd-e146-da047583c69a@linaro.org>
Date:   Sun, 1 May 2022 10:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: thermal: rzg2l-thermal: Document RZ/G2UL
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220501081930.23743-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501081930.23743-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/05/2022 10:19, Biju Das wrote:
> Document RZ/G2UL TSU bindings. The TSU block on RZ/G2UL is identical to one
> found on RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-tsu" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
