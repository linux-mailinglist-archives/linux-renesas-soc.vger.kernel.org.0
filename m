Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1685C5099EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386200AbiDUHwD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386197AbiDUHwC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:52:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BF71B78E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:49:13 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id el3so595099edb.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fZwf/2yPqjhAHVbwyiZ/I88oG/G8efeSV4EYSI+qW5M=;
        b=b4Rw8dqvX/DZNJZY/lCo5bYJ4t6peoNV3JUFCnCRVtTw/XN/fG0bJJtx9CsSw4InsR
         +WZtkhMxz3qqRxKZbu8mNRMCGnbw5Y853EDE8sz0ui4BvBsVLAU+Z0wCPhDsXf0CR+UF
         wFgxMHty77dY0ryQiQeLbU9mM72qx/vjY7FcAPIwVT1E2Pk2GBW5fxgFlF1/OpBdBSiA
         KM4SqwoaxyLRzVKmnykl8f9D05eWR+v+EwHcyzl9/DxsY+GLF529fVpgOdq90mfcjDz3
         n+TeuHPpBSEvvBBN/ke7dpG2UsRlI/tT2+xtkEEcqIzsSahz/qptaN23ywlBDt9kFL25
         vQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fZwf/2yPqjhAHVbwyiZ/I88oG/G8efeSV4EYSI+qW5M=;
        b=7Otupy3q1hL2H3iFVkuFtUSdQa16vCj9J9QlUVOhUN/onYlljJq8CJLM3DXY21eJAq
         5Z1nehkyUvpxN3J4zJYSBbBCikBFaXGENLm0xYXoHeF8cD5ee8Y5BER5kYBgg6foXkGo
         odbcD8AAYjSXjvVdtQ0PJXFZfWsjQwuCkZhYKRcYufuAKCdyQEu6Jfy3mDX42h8qVMtf
         oqUYqMsuvPuYdLjA2dzc4FdQcViQ1KLQgyay3wdUAB9gfE0t3Gdwu7aouJXSREAjvvin
         En0TZqsNyMCrWaBYdXc6HJGo+qqUfJB3D6UF/Pt9WscGSqeT4aO+1yRsHPdogn1P6C9Y
         yaXQ==
X-Gm-Message-State: AOAM533nfsjbJg4S1IUTwiQqiPC9iGIX29ekqkC0GzsbU42kcXb5fLN9
        z0ZvDXqcf4rK/cfXfciEZr03fw==
X-Google-Smtp-Source: ABdhPJx1JM9ca7dB2/T+1RieGRvO3xd5RjmUIW3NlFHeQdujxrRZiybGVZ8OrW1dWBAqr1q1ZcS8lg==
X-Received: by 2002:aa7:c895:0:b0:424:882:579b with SMTP id p21-20020aa7c895000000b004240882579bmr11031374eds.266.1650527351658;
        Thu, 21 Apr 2022 00:49:11 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hr35-20020a1709073fa300b006e8b9907b38sm7707349ejc.177.2022.04.21.00.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:49:11 -0700 (PDT)
Message-ID: <3ca55257-a884-59f8-f61f-1311f4a745d0@linaro.org>
Date:   Thu, 21 Apr 2022 09:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/15] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com>
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
> R-Car V4H (R8A779G0) SoC has the R-Car Gen4 compatible HSCIF ports,
> so document the SoC specific bindings.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
