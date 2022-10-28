Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7FA610732
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 03:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbiJ1BXU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Oct 2022 21:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbiJ1BXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2022 21:23:18 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FBBA98CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2022 18:23:16 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id r19so2673881qtx.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2022 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLwwpYWkEwi2rHDPkaUbVmeOwiPAW2JTot7A9QwOgFQ=;
        b=bULDzAv18kVE4apmIm4uZAi8agzYX05Ri630ZKNgOkkET4E89V8wkDIdr4ukPX/4M4
         PUwrxo/hxqbWzbYLETaTJCEDPHjZlM6ln0WEguajUEGb7pTga6lpxVE3Go6Rp31Sz32t
         +8SItgQN5kx6HgPTYQOTNATR9L9WMgedEZvYihSPuZ2fy7xbjTLAwp/kPS9fmwf+jIuw
         e16GN7p7yFcI29Wy+jAfnOkKAYEW1r6mmTDl8yiIheqj/YuBNX2Gto1ElKGUipPzdyJd
         dXDI/xon6D2nzFuti530vrOSKFeMKBo9ymWkl0G2YSovv9IyqK/qLvDAM9O+BzbZ1cae
         Cdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLwwpYWkEwi2rHDPkaUbVmeOwiPAW2JTot7A9QwOgFQ=;
        b=M3aVhzBVgH2uGkX1DBZzSvzNtxJWlOzzK7WpYUyQrW225tPF8hMAuNv+mQwGEbA5CF
         0j4wMwczbCES4nKmsTUsmAzatI7MXLQOQmMwOZ7l9lIBpcVpGcaf05HihLaSIyB3uZib
         0aPHnlUzq0UiWAI9yuBR1uSw9ahODid76Ug6Mv/Hm9yUwAbqssa/RzG259M84rfhRPaL
         8J8JpiX2yvmyhdCXPWeXg9R6xkL2EB9/TSBDYlHA2rV+4MKrShwkSS9jO03Ug2Ic2S7o
         YFmSprIKdG3OI80Cd5i0ZVCVHCzX5EBPnuO3BIBUP9VC5iPeCWWRLpxgUgZ0pzqvwUOA
         RDLA==
X-Gm-Message-State: ACrzQf0GFvLQDsBZzXSHE6PrSQBTaxQc0O505NpeeRTWEySNOYeqT/LN
        5FpQtfyp+iJCpRpj4Bv3wRy55w==
X-Google-Smtp-Source: AMsMyM78IpAs5htR3w3rRCmimnb7dVaaAMSgl2I9LDfVS26G1v7HrCoFNVHNjbSExX5U7wD9QP6gRQ==
X-Received: by 2002:ac8:5b92:0:b0:3a5:428:9210 with SMTP id a18-20020ac85b92000000b003a504289210mr1906464qta.3.1666920195577;
        Thu, 27 Oct 2022 18:23:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a444a00b006f9e103260dsm2069590qkp.91.2022.10.27.18.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 18:23:14 -0700 (PDT)
Message-ID: <090059fd-c240-6e62-028f-e51dd98adc9a@linaro.org>
Date:   Thu, 27 Oct 2022 21:23:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: renesas: Document Renesas
 Ethernet SERDES
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20221027132907.2342830-1-yoshihiro.shimoda.uh@renesas.com>
 <20221027132907.2342830-2-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027132907.2342830-2-yoshihiro.shimoda.uh@renesas.com>
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

On 27/10/2022 09:29, Yoshihiro Shimoda wrote:
> Document Renesas Etherent SERDES for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../phy/renesas,r8a779f0-ether-serdes.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

