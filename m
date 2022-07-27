Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE17F582270
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiG0Ivg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 04:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiG0Ivf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 04:51:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B6445F77
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:51:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h12so1521372ljg.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PVFH91R9182JZgovmYgx9fh+rbCW9xXMf9XMQHHcGtI=;
        b=DQKxEDaNs9dN2Rnmzv9DYf2NTRBetk5E65HXSVlh+hjab6ivhkb1o21ugBztrRqgUB
         GDwEh9iHU+TeJoILMZX+JtoSdP0Jdm6+4zyE6aCzYUraVZgR75iA/GkTu79vn8jyhR/N
         en19/Yz1DDYjFHHRnoKIOpXhCoi3/VGYfvYH3ZgxYR6pqMxLfttdWsPBNNBzdRLq6qrQ
         XXdmWt0WBz+dfdrfNmW0l8VjyCTOQ9OMYH0PZ1UaftLTaH+auhhwLM4pphpPZIdusY75
         Sn1Rqdv2UkY9xVx+wosI/GA04IxDN3sKSe9jwrIqsMbidhgRSz9agEhyz6TFmFYM5pvW
         6+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PVFH91R9182JZgovmYgx9fh+rbCW9xXMf9XMQHHcGtI=;
        b=LyHkQTqzv21R9pCIogQwcrIEXPyCIy8gUAH23DKFnB3od9vnm6IF7ep8IDPqnUV/st
         xNDQdm5GGALiuzF7UTRBUL2JblqtKvLhVc502GPjC++99kPgHb37fbpbjXfbLdm8LoyG
         R3cirERsaQV5IDtp79+cLCVWpvaxDC2nC8Y4LGGM8N8liHe7fszjbvQ9RIyE61gt6HEo
         i5jViugLIKl1pA6Xdf+MDX0yKzBNZkYtYk//tDI1W860/jZodwFT4lOx7VHrXLInuHRk
         /jyyR6cDHoMnUKzDppVn6z5boXKdFrO0y6DPWpSJCl9W1nfwLifLa99eCBrRilvHaRsd
         P0wg==
X-Gm-Message-State: AJIora/+UE0KF6iZBo5RCWOZiWIXvwJPfdpxwgXTAFM+JwIFdh4X0KRT
        3CM8SjodXoaKmTr6CXJPrVX6hQ==
X-Google-Smtp-Source: AGRyM1viBZddp3vcu2pn8e8WUuPaFcvD+j8cQRKmZ3C0PR+Ll08SG6+N7TT8crxPgCzm9NEoi++G/g==
X-Received: by 2002:a2e:8247:0:b0:25d:b515:92e with SMTP id j7-20020a2e8247000000b0025db515092emr7302969ljh.527.1658911891770;
        Wed, 27 Jul 2022 01:51:31 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id 25-20020a2e1459000000b0025de9a05176sm3513356lju.111.2022.07.27.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:51:31 -0700 (PDT)
Message-ID: <90efbb20-f030-5b87-699d-741d0a769d01@linaro.org>
Date:   Wed, 27 Jul 2022 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/6] dt-bindings: riscv: Sort the CPU core list
 alphabetically
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc:     Anup Patel <anup@brainfault.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Sort the CPU cores list alphabetically for maintenance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
