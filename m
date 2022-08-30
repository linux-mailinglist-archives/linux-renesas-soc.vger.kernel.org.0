Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1E75A6B29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 19:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiH3RsF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 13:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiH3Rrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 13:47:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178F9AB1AE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 10:44:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b16so7576800wru.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=rmlcaT4uod7PpBdmIDlVofuYmhAw0mWF1ocMR7J7jHQ=;
        b=cVmXkrXVB/VhRGL6WXUplEkAQijZtZRPc62bxRDQjALkNmsWvRBHB8+SZLdTSrr7Q2
         jJNPQDHL443hUjM3gm9pRsjjswMMUUxwAqnjJ44an8iwVtGJlPxWlPBGfVEN0PSk3fd+
         X+K160op9w//KYces00QD69pfUOTiQTGjOuQTQVU5NvlTqXtaYCcyzab4kSChbBP2AvF
         cw4SrUCA15vFvM6aZQFS1XZeIaQvGIENMA7nLQ/WODSBrmSLF8GYf6oHwHXfBmhEnv7O
         bq2DewdxbnUmsAbQejrrnx3RQO+QBInCtHIXVri/Q9fTZ16CIKB6QI3CpcUI/nSZE5Ul
         8AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=rmlcaT4uod7PpBdmIDlVofuYmhAw0mWF1ocMR7J7jHQ=;
        b=lBDfMg+eKjDegacvTP8lCiA8yMHztJPkG5TLYmNTfZuaqp3d9/6mOhkAIxq0kHQIt9
         da8I9qpYrggkYt+mApbn9Pzg6po9GOgAUVsRCm4kAaBgSf/5wPBeAr3sfFHRb7a1ZoIQ
         iuwksgo5wIEqwdjMpntejbJqA/pkmZmIMDvMItTP5IE41yDhqVvzGnaFBTEbr3TmIyOw
         JgyupV7DKcJb7hpHI8Zic31hTDtXrJyiJGVlxmMdhrybCmnjDd/ONXl0qCzrJBp073bH
         WI/73mw9R6mSSknZYs3b3tga2vQbC23AkwD/HgopK4gLuhFj3DU/96SeCcDV7BxeDkDF
         Tymw==
X-Gm-Message-State: ACgBeo2XJIyUbszmoCw3tOYYpxLztEzDh4bk0cPccjiHS1Q9CkW8X13z
        ExoVBsBXQrMaxHbGd9j+hcxe6P3WC9Rgu5gQ
X-Google-Smtp-Source: AA6agR4PY6CaaARXSRtsxN/bcXrQHnxvJheo2EM1aAUGuEOPcsmtvuMW25Oc0Y2r7Drxt2Wkb0cBYQ==
X-Received: by 2002:a05:6512:3b20:b0:492:c04a:1520 with SMTP id f32-20020a0565123b2000b00492c04a1520mr8189476lfv.86.1661880699713;
        Tue, 30 Aug 2022 10:31:39 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id 13-20020a2e050d000000b0026392faf543sm1235119ljf.77.2022.08.30.10.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:31:39 -0700 (PDT)
Message-ID: <23539312-caaa-78f0-cd6c-899a826f9947@linaro.org>
Date:   Tue, 30 Aug 2022 20:31:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: can: nxp,sja1000: Document RZ/N1
 power-domains support
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-can@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
 <20220830164518.1381632-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830164518.1381632-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/08/2022 19:45, Biju Das wrote:
> Document RZ/N1 power-domains support. Also update the example with
> power-domains property.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * Documented power-domains support.

You made them required, so it would be nice to see reason in such
change. The commit msg says only what you did, but not why you did it.

Best regards,
Krzysztof
