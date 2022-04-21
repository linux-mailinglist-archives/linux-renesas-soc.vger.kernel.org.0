Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338675099DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386091AbiDUHsz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386489AbiDUHsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:48:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4867521E0A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:44:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id lc2so8199691ejb.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DXn4MsPaRhw2bwzR73NrZYRMxPElN5HIYbZglUtYs6E=;
        b=Bm+1tMebLuBzhWJmnuFMtsOqqACQymVPUM5Rbm2UHxna6DRZUg0PhqLAopoWI909QF
         XX23z4lrVGNm8L5wITOPAP5ORyi2p7oGKDrzgX/G+QVc2+R+ZeicvuwqKGd1tzqwB/kB
         LoLpZcxqdn1HC1vGI0CJNb3Z2oU63bziT2cZipxI4LePMHunzpFWz6RS4rFcO8WE+x6O
         YBrweXOQo0CMtIaaXkB2Y3YCQ2CDXrvWhBwyQzrh+ucDB8iOwPCkWFzCHkGybeNL7YVX
         YjotBoi0DONBYhlmMYskF70XfNwkIyVmm7klu0a8GZxnj5T8rsRenSw5eB/3auTlNEj/
         kG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DXn4MsPaRhw2bwzR73NrZYRMxPElN5HIYbZglUtYs6E=;
        b=7qQD+XmTWkfmkpvpkOng9TsWRnPv0hQ+RVY4fNLDdm8ubIATD1CW2MDk0GhEnHlqMl
         vpKMeOrlCLWxkC4uOxkStzNh/90DdOjuTqtopdpnmeHmXDF3N5Sr3BYHuPspdgXDuXTa
         PCAPTCkz0rA0HlD/dRkKQKKgCvYrBtI1M9dhP48x5Npjmm8FZC+l2m+X+NTGlJpQFq30
         gEMvxo63gd5xLRFHrDFK3q0NikVJJQos2YGbs2+dKsls1dWwT1cVudsF1nN1SSFE7p/D
         jHWu8hrXqo/RabITVUZCKmnKN1r3yiEcEYYdEAWnM9cvlspr+uxLJWraUtpPjLYGe3zt
         lUug==
X-Gm-Message-State: AOAM533BwYkXm2RtFN8wPREt1HhZhme8482cddUJjAeQXMmBYTMmxSpK
        uZDPYfdHZhv2IMm+r7nQBVksabRVsV6oew==
X-Google-Smtp-Source: ABdhPJycy+YO7LL72xZ8sGXH60Hp2+EIKmnOv1ExhmBdR9IonI/sRM7EOAy9M0kR4VOW5VvmjvFTzw==
X-Received: by 2002:a17:907:7810:b0:6e7:ef73:8326 with SMTP id la16-20020a170907781000b006e7ef738326mr21458246ejc.429.1650527071759;
        Thu, 21 Apr 2022 00:44:31 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t4-20020a1709067c0400b006ef810aab6fsm5393279ejo.213.2022.04.21.00.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:44:31 -0700 (PDT)
Message-ID: <6b6f6369-5f43-4956-8c70-7074829b6d35@linaro.org>
Date:   Thu, 21 Apr 2022 09:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/15] dt-bindings: clock: renesas,cpg-mssr: Document
 r8a779g0
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-7-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-7-yoshihiro.shimoda.uh@renesas.com>
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
> Add binding documentation for the R-Car V4H (R8A779G0) Clock Pulse
> Generator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
