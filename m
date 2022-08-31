Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D645A7DCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 14:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiHaMrZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Aug 2022 08:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiHaMrY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 08:47:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613428C447
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 05:47:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id by6so14489257ljb.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=L6I8ndlnuixafhz7H277xHo8gwEAzdGsvhdVjWQGwXw=;
        b=WwJlalbqTiUtKcbX5odu1XhHB1a7Wk9hFBlJ5XimVIeH2FFBHKtWuFT2GrwrEaBJa4
         UxldkwnUEb9ovqJtHoSKxiYne4sDdypXeIj5eNtRdBMgzeWj5j9Jsc0zvwsl019JVv1P
         X4YAd2ZRgogwurJdMrZbq9HOijzBn/Dcj7LjCOdsKj3VG6O0mMeZQjUpQ7CAiZdjaEww
         m+FzHM3CEBCPt4+OgQ0CBqniVlAMFUnjaTzI5rC4lMJFmmaPBc+v3EdTsSwjhEDVPh6v
         jWimAe0C1CpcANHN8ehhy94EiLE/njxOMyfdfyxqbvD4j+JXAHBf4HDlR1pmPBa6X/hj
         quwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=L6I8ndlnuixafhz7H277xHo8gwEAzdGsvhdVjWQGwXw=;
        b=1qU423pO6PGtP+oKGZ+XO4WgmyNXq/KcPRS+qXclB/djWyHQ1GNkWKXfkZ9bHdqPYM
         vym5kTd7+nI+Ep+pBjNcHeAhF17p35dJNxNrMVEyJWX6Lo0kHs/hGJ2bMAShAeBdcpbh
         ju72WuhTOXdXvUDS/ZT5qG5O6QtgybfVgRK6uEavLYLoZicE0H9OT3urg1JCxJfPtMol
         ECalZpNQFBFJiRrQ25m8Pqh0dfdcEXAXHYwF0y1nw9nez1MGSYU/lMBbMTpl1hrM0t8G
         hghn5A2n5RmAwgJR9wcuFJTGkY5WHu+bNBRQpL1/JjNryKoJyg297r4Dz2YVrnD0CnIJ
         HHuA==
X-Gm-Message-State: ACgBeo3vITNT+Nw+/BHkCUi3XN9DFNkKV6OPjIUmPWsl1Cja8kXy2zdh
        IOMRoJGHkBfxS65y4no2bkz3WQ==
X-Google-Smtp-Source: AA6agR7HhMplXv+sgl7vaiXra12D78kc1aVHHONytHdf3QzQMXn/pAbiN/4Jwrx7P45zrzkSRHZsDg==
X-Received: by 2002:a05:651c:1508:b0:268:a367:ebd8 with SMTP id e8-20020a05651c150800b00268a367ebd8mr227364ljf.516.1661950041793;
        Wed, 31 Aug 2022 05:47:21 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f12-20020a2eb5ac000000b002689bb23a93sm131196ljn.94.2022.08.31.05.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 05:47:21 -0700 (PDT)
Message-ID: <9f5b5d88-c941-0fe7-d79c-3e1043bc97c2@linaro.org>
Date:   Wed, 31 Aug 2022 15:47:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Update
 maxItems for the clock property
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220831100913.1731285-1-biju.das.jz@bp.renesas.com>
 <20220831100913.1731285-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831100913.1731285-2-biju.das.jz@bp.renesas.com>
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

On 31/08/2022 13:09, Biju Das wrote:
> RZ/G2L has 3 shared clocks between du, vspd and fcpvd. Update the
> bindings to reflect this.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 43f2fed8cd33..419b110e34fe 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -29,7 +29,8 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

The clocks should be strictly defined/described.

Best regards,
Krzysztof
