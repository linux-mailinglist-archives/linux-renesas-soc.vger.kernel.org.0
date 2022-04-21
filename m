Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FD45099B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386185AbiDUHvb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352769AbiDUHv3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:51:29 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6029658D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:48:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id s18so8373306ejr.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GPBUa5swIw6CZcs+Ui9I4QOAfuB4n7UzPWV5GhZeFFk=;
        b=QnWxD0bY+y/mjv2MJWP2qs3pRdSZw8gK822S+RKNlvhiMzxbliBzoGxjncMgiQt47Z
         oKSba9ZFFGHGJffpJSGCb27vkWX0c2U+KLVd+FWE5SosMF/MY+cGajpIe42CsFZUThvz
         3RYRagCAYWGfF9jq7ceP9tSLTput9EFXv2AEXbs9bSnmuymDr8iIhq8+crcbqsviXaZB
         1zxV9yWSMiuB4axPI6C4ZPCFuy2Wloyt/NauCRfUXLowyRMNTRXk5/ES+Jy5K5Co1nd8
         +BTGjqBXPn8WB9FRt9LU6U5lZrlQBV+QKeEu5UZAsMIS3jdO3hLoOkTB3xUVC8Q6G7Oc
         jdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GPBUa5swIw6CZcs+Ui9I4QOAfuB4n7UzPWV5GhZeFFk=;
        b=VheFqoFFSaf4bIf63EoLZxb3j+Zppha241+5jDm86PFwqKnvucSdarwdD5JG6yN5ZH
         pGjMzKGxqRYSerkDF2ba612coRVHzQKo7G1pR+mgGwpcE8QRlUXHn4Hql3NBdnumMe/i
         bOkEiwu+s+wjGEB/m3Ivnxl33gYiT0OwjKjhnhmHmPElnUAf76fQZ0bSy8VyDnLGejCs
         TxAdE5dZKxnbPbaTUzDeJEv9pBeoUg59FckBS4c97hPBQZYpZAeTsRg0vG6h7l8B+Ta8
         NsP70mvt5GxlPhzKL1AsSMyEvnfQ+QXRM3Yot+7zYudVnoP9nF3CVDrqmr2L66uvWve8
         Ikzw==
X-Gm-Message-State: AOAM533T0lkaiBA+3HzPxtOKSRlOeKnzJCTq0yyBjlwqbIUKFEMKfQuV
        jNS0HXiir+EsdlEIuWoD+kUxfA==
X-Google-Smtp-Source: ABdhPJxxTIo0EJoqdQpU8qs9oxCB3A4HgYEhrYg2UFz+M03ekQxi8wWpCgLWaZnq0SwOPDBm8wdDNw==
X-Received: by 2002:a17:906:2c42:b0:6e8:7b4b:3abb with SMTP id f2-20020a1709062c4200b006e87b4b3abbmr21979503ejh.565.1650527319278;
        Thu, 21 Apr 2022 00:48:39 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i22-20020a1709063c5600b006e8a8a48baesm7622125ejg.99.2022.04.21.00.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:48:38 -0700 (PDT)
Message-ID: <c86f78ac-ccf5-30ad-5de4-33211ca8b351@linaro.org>
Date:   Thu, 21 Apr 2022 09:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/04/2022 10:42, Yoshihiro Shimoda wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  include/dt-bindings/clock/r8a779g0-cpg-mssr.h | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
> 
> diff --git a/include/dt-bindings/clock/r8a779g0-cpg-mssr.h b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
> new file mode 100644
> index 000000000000..07a94cf45581
> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */

Any reason why not licensing it the same as bindings document
(GPL-2.0-only OR BSD-2-Clause)? The same applies to patch 5.

MIT and BSD-2-clause are almost the same, AFAIR, so let's stick to one
(BSD-2-clause) for consistency?


Best regards,
Krzysztof
