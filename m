Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F153650D250
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 16:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239367AbiDXOiJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 10:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239372AbiDXOiI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 10:38:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9CCFD0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:35:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y20so25026214eju.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p1y92a0ys+8BlMzltV+6PRIoIaIyS44PSnqPymzsofQ=;
        b=AxiFwcakAZ85Cx/Vk+IkgBSKmvjbjzXleCHVk+Xgs+rds5tu0BvlrNLokAKjHndSpj
         4BA43JSPLn4/ZMIRDgXoOPvtoH87VTZGDI4QpP06U+yQHfdT20zc5A6oYSd9nuc13s2B
         chq7cZLR5t7jUQ9XCuld83N9MfAi6OIsaKPq/+5PW5zQJoNxsYXHrtLgG4U0r6JLRVf2
         krwg6PB88AzCd8UxIQEvEcrF/XIODEHHJHamnicXzzPglOyXbKD2Gi5RifUoIZHqovVv
         vXke64PJqQHGwsW/JGnwVHi2sCmivqZYTqi9+Y4IbmcdkLxDPMKsUr7xFS9vsrdzGf32
         iA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p1y92a0ys+8BlMzltV+6PRIoIaIyS44PSnqPymzsofQ=;
        b=gRB8bV3yUYkSTsu8Aqn54eW5TeW+PuFDJbgKauJhq5vPSoTHAs5mVrs6SOpRMmo6Tb
         vfUb0qPhe7C7hHc1Njik9Gyi4C9XINIHyrehq7WToWjummw69tnei1reQObXoFgyWCVK
         sFy4CwnGMfX8cR7HT+Le+N+/1RAxcwEnIpshYdcpW6Q8ZQiGxgeDxej8k5qUe/8HLzZ7
         jSE1LtL2/mnxJ1vP86sUyN/sWkrk3KofQaHDo8kwJ7+9GAf4YnDoZP2M8+IFbAJkQz88
         8g8LXeKoR1g5XR8w8sPUzV7PwjiSYZCi16Qoljhm4gmFo7kwg18c6QIRiEdlOk8VN51/
         3+pQ==
X-Gm-Message-State: AOAM532Yo7xDOKv9cTTLY0kfgGnW/giNQFRFRiDahZ9cCsh+SyXP8Rb/
        hF1fKWCMxG5kPPkCko4Px5vX0Q==
X-Google-Smtp-Source: ABdhPJwUNA/D4wNods/8Z3rAYGlxdB6I9sADPoEXHCjRgzVW2s7MzjjbBg48uChf5qMNZ/g7HSouhQ==
X-Received: by 2002:a17:906:6a11:b0:6e8:d248:f8ea with SMTP id qw17-20020a1709066a1100b006e8d248f8eamr12181727ejc.500.1650810905208;
        Sun, 24 Apr 2022 07:35:05 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b00418b0c7fbbfsm3328532edb.32.2022.04.24.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 07:35:04 -0700 (PDT)
Message-ID: <a1a03326-0c7f-5478-2493-326cae0fa7d9@linaro.org>
Date:   Sun, 24 Apr 2022 16:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G2UL SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/04/2022 09:13, Biju Das wrote:
> Document RZ/G2UL WDT bindings. RZ/G2UL WDT is similar to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-wdt" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
