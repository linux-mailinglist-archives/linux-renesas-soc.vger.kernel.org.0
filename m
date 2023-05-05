Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEF26F8879
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbjEESKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 14:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbjEESKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 14:10:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7F01E9B4
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 May 2023 11:10:44 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bcc565280so3196878a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 May 2023 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683310243; x=1685902243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQBt9O9556cUDwM/8n6L+XNwPkEzkVWxHyZle1gkXm0=;
        b=dhCOOHqjNDYtwBV3y73eG5mx+qh8+rmCCbutjJWAHpGAuo3a1SADNxeP7V6Ej4h9O9
         GRqFToP2+KM9688fe0iJg6slfqOGXJxkL4cNLxNnxbG6oeG/2hKLy/Jb7UeqfSVDR5MB
         fW0WGcWirra+BdzZDuYZcYUuB3rEDiVxH8XCLgOjQZ8ghU/AEOXxMg+HxeRQjfRJzduS
         ymW5eF5bXMX/goxPRjvg0Px9eeHwH6PDNPz12dGdqsIWgkgjhaIdRH+nC8Q11QRNljcV
         tqRtsROP7PV9wJzfuUtszTYN3vooF3cWh332P4iLzkRZHVaWmkeni38bXNidH6MnDFiO
         0o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683310243; x=1685902243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQBt9O9556cUDwM/8n6L+XNwPkEzkVWxHyZle1gkXm0=;
        b=Yl3Yu6xnq7UOY990uGggV3Z45jrIoArxfB3ZEYl7HkGGpzEzJUx41blWWhHKcIvihr
         cZyUJ8q1MNdM7SXQHeI6S4kSnDDjeuVZEKpTGrzdCle6Y8Q45CCsb0FSkosy+XddUAKw
         7JZ+8jDxNp3okcvses0FlBWE5sY0ayzw5J0YV1tzGm3jTEjk+Mhd6xh3pVrP4HhZDOav
         sQ9a3d9l974/hTLIx78/QFzIa+BDjwM564nrEIjIYnJyZ+PLlqhqyvgTcPcOgv5zrv/4
         mTbi5LLaD37SG7/djxX/V1jamckb2nrowjAnG//kcpJoq+gH2y6bQ1i5oLO8uP6MlxCR
         KpTw==
X-Gm-Message-State: AC+VfDxwCMOA3E4EkiMKuKsHxQ1TM4MVfdYkXhOE9waIYCDhPLEI40UQ
        RSeZS2FVR96l8GLT0H5JpxDMIg==
X-Google-Smtp-Source: ACHHUZ4CkUu61HPatWQxUGhsYIa4QfVRdHuzWrcLP3IPxF7Im7eghSPNTBdRv5T7vdAgjVLiF3c/nw==
X-Received: by 2002:a17:907:3207:b0:957:48c8:b081 with SMTP id xg7-20020a170907320700b0095748c8b081mr1435683ejb.24.1683310242848;
        Fri, 05 May 2023 11:10:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id t26-20020a17090616da00b0094ee700d8e4sm1233010ejd.44.2023.05.05.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:10:42 -0700 (PDT)
Message-ID: <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
Date:   Fri, 5 May 2023 20:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/05/2023 11:17, Biju Das wrote:
> Convert the isl1208 RTC device tree binding documentation to json-schema.
> 
> Update the example to match reality.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thank you for your patch. There is something to discuss/improve.

> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> +
> +maintainers:
> +  - Trent Piepho <tpiepho@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
> +  ISL1208 and ISL1218 do not.
> +
> +properties:
> +  compatible:
> +    oneOf:

It's not oneOf, but only enum.

> +      - enum:
> +          - isil,isl1208
> +          - isil,isl1209
> +          - isil,isl1218
> +          - isil,isl1219
> +

With above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

