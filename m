Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB8E5A5F2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiH3JUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 05:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiH3JUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 05:20:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC451EC51
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 02:19:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q7so14644572lfu.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XrVac6qDsWgpMvtn1ZnbtlFbgOKdsqH/r3JZVyl+4NY=;
        b=RbGE7WV/j3CrIZiHvc/Omisv8ViGrUYmgs+MS1wAch568zYdmRzslhJCm7+EURA8R/
         heWsOU798FnM0oFPrMGUBHbnMl0c+Z8TqPO71WWL9201XcoPYS6YKeqX0Ywis0K3QSkJ
         qOo8WJo5uzpbY4SAHBdKATNM5t6HDHQ7Urj2OfMXk2MWWmTdKzvQWa8BcT/NYRDt4kqp
         Te3PMJ/p29gMsAab59p5sk24kgw5maJH3MiAP9wBU2aXtg4Eb+Knvu+X+8YYQpDpkK2v
         jna5DAZsIz6CxY70IRG1I0JQSToYl+sXRBRol8oyRsh4OSx4MAfZqYAsqVLkPMaoAB4d
         J+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XrVac6qDsWgpMvtn1ZnbtlFbgOKdsqH/r3JZVyl+4NY=;
        b=qQGe9pCyBqnM81U6kJYsuWqEWkj2de7i7nzRmr7VKbBXSHDTWG2rOmGZtrowMz0M8g
         EhTOgdIhZV00K1mwAQy1acvdHL2mW8KRFazeYeTgbJ2ZhJOcCwcxSkba8GnDa1gDcoRf
         2UpS3E0DcTG1LWS2Svh8uN0yP26NiY8VVC6cUm35l3HEjqHRneV1zrsbAP+M2dX76Qs/
         6buyj+b0lK+ryk7DcaS7/IHyRKPHwpgAW+9+mXR1xzmr1IAITF1HuitgW5tRRkEp9tXZ
         WeedMRlYpYCgNAEHjhz6G+DJukIvz3qI1nkS8nAExnVdMVB+tNKTvkR8DoIFNS1lNJVw
         R6FA==
X-Gm-Message-State: ACgBeo0KQrRAqkFvQ2R7xUDI64UemROLIz7qVIioBXxoMjcMRfGu9Pt1
        MfQuPRE4uP0dGRErAnTnZ1znLQ==
X-Google-Smtp-Source: AA6agR50zspYm+xIw1F0Qq3uF7KPz1mPCdDTLxZCYWULT17Lz01av8PLiSE1u/3wde1TG5PAKvCWgA==
X-Received: by 2002:a05:6512:3f9b:b0:492:d6c7:24e8 with SMTP id x27-20020a0565123f9b00b00492d6c724e8mr7050299lfa.346.1661851197729;
        Tue, 30 Aug 2022 02:19:57 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t7-20020a056512208700b0048b13d0b896sm702754lfr.141.2022.08.30.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:19:57 -0700 (PDT)
Message-ID: <963693d9-6016-f279-a543-22e9be802d87@linaro.org>
Date:   Tue, 30 Aug 2022 12:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: dts: renesas: Drop clock-names property from RPC
 node
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220829215128.5983-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829215128.5983-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/08/2022 00:51, Lad Prabhakar wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
> 
> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: spi@ee200000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> 	From schema: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> 
> The main problem is that SoC DTSI's are including clock-names, whereas the
> renesas,rpc-if.yaml has 'unevaluatedProperties: false'. So just drop
> clock-names property from the SoC DTSI's.

This is not the main problem. The main problem is that bindings do not
allow clock-names. Commit msg should reflect that.

Best regards,
Krzysztof
