Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B5F5006DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 09:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiDNHau (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 03:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbiDNHau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 03:30:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488531D30C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 00:28:26 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id c64so5200292edf.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R74GtmZ8/eMYWWCWuYgOVriNQWIHf2AARvZd2OkuZF0=;
        b=eBxM/YwxID4Ni/TPXYUXJJ73zHPnp4UTyYhQ3sCYniBpv6uNurbjPclVftWHUzSbf9
         UZ3u0jmE6WZMizp4tddKCCDhc0e0frrhiaULiyDULyM1QDXtPdsFcYCDX0lFc8729v33
         pVMoUGWX+uzs9MId0hz5dhuhORSQVEWxsj2uY1FrXW4HwTYgCMzvfC1JL3x4LoUb4B4s
         GWpfLnULMNeIrGIbDe2xqBW7vUgHVMGH/qsOmxIPoGK2gORcH78c4P1lSLXX1yqintcS
         2asDRRIa8CLlBishtBlGoXb2KMgD2ZM+CM3zKlxlt55tX62+db8+PIJ4yVCLBoDRsUpz
         3DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R74GtmZ8/eMYWWCWuYgOVriNQWIHf2AARvZd2OkuZF0=;
        b=pDQEWkyjnqJfNAH5LZi6w+oLzbwPVSf5OJsJtKj9bYjDH4CQJiKrs3NkeAW769Aehf
         +HVNVjlcpXokaZBS2GJAzSJBfgBj7UuCJCZcvInhOZgr0jhr94R1KB5NCq+TcJ5HW3QC
         3W/LIlqcVQHM429E4I7Qm7TsY18dYuX2TsJOvD5E7zlIvbtdolYzpwn78aQTVokBOeiP
         DW6YwwxVismAnjkgXRRM4PTr7fJd5c/brhM4KWglI9/AKvYkWIrO6GtepzVgPdKGywxY
         6VMwswxN43JH3npHzhySzNEwBm5YBn/IZETPICKn0M/FxZ07Pmky77hpP7wKAfwakX3k
         TTJg==
X-Gm-Message-State: AOAM533GZwO9LgaqD5TIZakzGSZ6EGbVWloeJZKMwXvS/o0ttNRDE7V7
        MvUdglKfRtylf3to2Mdzmn/+wA==
X-Google-Smtp-Source: ABdhPJyj2kyU0EJnWAQ1cHHp1KDTEzl7iVeNPJETiPaZWyg/RnuYYBxLn6zDHCUMhls1PW0pZNwA+Q==
X-Received: by 2002:a50:c014:0:b0:41d:5ee9:f354 with SMTP id r20-20020a50c014000000b0041d5ee9f354mr1514653edb.257.1649921304926;
        Thu, 14 Apr 2022 00:28:24 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b0042062f9f0e1sm636450edw.15.2022.04.14.00.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:28:24 -0700 (PDT)
Message-ID: <50714f3e-7561-37fd-7a05-222fd6185c47@linaro.org>
Date:   Thu, 14 Apr 2022 09:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Simplify single/double data
 register access
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
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

On 13/04/2022 15:49, Geert Uytterhoeven wrote:
> For manual write and read, factor out the common access to the first
> data register by keeping track of the current data pointer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This does not apply on a next branch. Maybe because I put "memory:
renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode" for fixes?
Does this patch depend on that fix?


Best regards,
Krzysztof
