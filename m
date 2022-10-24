Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECD760AD54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 16:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiJXOV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 10:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbiJXOT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:19:56 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBF295E65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:58:03 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id i65so7648678ioa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emaqwGHCEY2zwF4KnwzCtRAqz71eQPJxRpEDO+het6w=;
        b=IG1llNd0f7AU1034v3H//AdQl0XfJo34Q+GYvRBrpG4XRqgflrRstQwf6m7C/XqKU5
         n9Kptvirl0PSgr7C18aMyy82dbrbc5ObHfxKnj93pewt9X2uvI3v42KlQA5BaMWmGVwL
         r3M8N6X/EBQ2GT7qbIPpgd9yLXhKkCdB514AYPFcJ+Rim6bbmSmcNbLJRI1FJaXXEHeW
         4AHX3HCV3Lz0iMVX66QQSNT/Amz8xEc5iYUc9UogFIzirVaWCZ8I2Zd2wCRUweItZevR
         5qkfNUujP7eH3W0npDG7Nvfp2iowwRY0+APHHb4oyzPt9n0e6eU71jypseIvKmGpjfhe
         SkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emaqwGHCEY2zwF4KnwzCtRAqz71eQPJxRpEDO+het6w=;
        b=wV/YWPmofwJreEoIPJHzpunn2+knN006DD5yWpHSkmxjTOfNARbXwyFJmUAxeA+oll
         29PkRNJlsVgyATKiVoxjprO3NjNPxnBdBwDlpkqd0cOynPHwkPtJqLKgB0ZYDl4aWSFh
         MduMWxB5LkRywrfvQY6wykifI1+ZKAyP9enVOcJxEkWZB/V1kP63v5ddgujCsjJnZbgN
         fDxREpDog8jRsC6j5mWL4q+u7EYKNSCSIi/7y73w+naQJ9VqDts1m8uFIOePJNsF922x
         q5aHjteLecrE3Pvwmq7dU/97mHQKJrChNtjC/bU5OfVCVEyeKWn6Fu/HIy7bz64ACbN+
         USfQ==
X-Gm-Message-State: ACrzQf1mgly+FRv/9SvOWnHlUW77qheUA1dacxTeMOmYw0+CZLTORG5a
        r9k6pNH6MMSBALzHwOahqh2Q8NjqI/w+ew==
X-Google-Smtp-Source: AMsMyM5TbMqzqudP5IGMvqD9ZYk5w4agXTxmvAizNLeLgCbGVq2EXbdX7eD7Wyz8jPSF6ok25sAfPg==
X-Received: by 2002:a05:620a:1452:b0:6ec:3f82:522b with SMTP id i18-20020a05620a145200b006ec3f82522bmr22216789qkl.402.1666614225516;
        Mon, 24 Oct 2022 05:23:45 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id y13-20020a37f60d000000b006e2d087fd63sm14670526qkj.63.2022.10.24.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:23:44 -0700 (PDT)
Message-ID: <3c0895a3-2da6-3bd1-c786-01cf5eaa2452@linaro.org>
Date:   Mon, 24 Oct 2022 08:23:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: iio: adc: renesas,rcar-gyroadc:
 Miscellaneous improvements
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <7b7a13680fa24282c3407e12b5943a66a2ed9068.1666611184.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b7a13680fa24282c3407e12b5943a66a2ed9068.1666611184.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/10/2022 07:34, Geert Uytterhoeven wrote:
> Set limits on the number of power-domains and resets, and make them
> required.
> 
> Simplify the example, and update it to match reality:
>   - Convert from obsolete MSTP to CPG/MSSR bindings,
>   - Examples should use #{address,size}-cells = <1>,
>   - Add missing resets property,
>   - Drop soc container and pinctrl properties, which are not needed in
>     examples.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

