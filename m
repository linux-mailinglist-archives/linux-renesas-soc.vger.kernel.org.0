Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FDD509AB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 10:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386717AbiDUIgi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 04:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386695AbiDUIgf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 04:36:35 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBAF1C128
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 01:33:45 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id d6so445322ede.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=V2WbmSX86iwyUYHY5eBhcp7thUpxSpsjBxn93ZeJoc0=;
        b=lRZ0CK3QdibA6OoJo+ZqQgi3Xpv/XBgVN8Q6v16kUczU+1zCpyuj3JNEGWYOwX+Jen
         pbIyFLKg2jON+u5YbVP0u24ujJBVdDscZY0dInwRBOkUIaHM5j8dF74+H24W24JfomrM
         i3GBb0Hnt2YeBN2GlfHQ+lX0MvzeLsjKlyUNNzWiVbX/NxehO7jpCjFkqshU/9lLbr1u
         130PE8IUbHsORwnGyBcU5lZ+gde3GOf9LcmGqFYFcNR1oNZJ4B609ft+jyduYfSm63J/
         Biz4yzHxTUozBs3y7TXjvUWyfuv4J8OSCdodwW8+t/AENQcNkwODBbAyGO+u5NnUizR4
         cwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V2WbmSX86iwyUYHY5eBhcp7thUpxSpsjBxn93ZeJoc0=;
        b=tCw+RYqAxeYkyLPjb/scOFk72GtWLtlBd5HfRNGgI2tR9UBo/kUQivPsvqHLSIxj9T
         m6A4aVHgE268seqimkmD2LnlxFT5FF8a8bIlULxNaYuwneMCOcfblKQxKf+WaCPhJlW5
         wewxm2VkEi2NWaktUHTdwmmEaPTvq58DVmuTxgiAoEZVXZDU+Vz9PRvId07rXDrUmNUE
         nK530owb2ov823befGgw16VR6D7H9z/B+drl8H1dg7fG6FHIatHMhDWeO6BZUV09Gr7M
         QI6jIkWbmUs2Rm7cCIEss8ej674gqIB2EWDCFgYM4ChRh37rzJkJ/tZFjD0s3seECGXS
         fbBg==
X-Gm-Message-State: AOAM530UyimYEEDxP99vgcPNqvWW2/t8mZGeOFFup3k5clSOghXPNEke
        v/gjYauLuta+tTWUFG97CBL4Dg==
X-Google-Smtp-Source: ABdhPJx1gvMULhaSOwJfCd1OivifkOjmPHxz26ZNmxoshV7VGZDH28oZ1HZmQKW6myKCcQKEQsFW5w==
X-Received: by 2002:a50:d613:0:b0:41d:71bb:4af3 with SMTP id x19-20020a50d613000000b0041d71bb4af3mr27861049edi.99.1650530024382;
        Thu, 21 Apr 2022 01:33:44 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s14-20020aa7cb0e000000b00410bf015567sm11050930edt.92.2022.04.21.01.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 01:33:43 -0700 (PDT)
Message-ID: <0a9ec9f0-bfb6-7c33-ec5c-fc4b77c7c5a6@linaro.org>
Date:   Thu, 21 Apr 2022 10:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/15] dt-bindings: power: Add r8a779g0 SYSC power domain
 definitions
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
 <ff0711f5-0e41-9aae-0b2f-381f272481bb@linaro.org>
 <CAMuHMdVKpVqxZkisyPU4G6w3pBD_4tEJk3zf3axvfTpvZOjnwA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVKpVqxZkisyPU4G6w3pBD_4tEJk3zf3axvfTpvZOjnwA@mail.gmail.com>
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

On 21/04/2022 10:07, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Apr 21, 2022 at 9:44 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 20/04/2022 10:42, Yoshihiro Shimoda wrote:
>>> Add power domain indices for R-Car V4H (r8a779g0).
>>
>> Are these values used by renesas,rcar-sysc (r8a779g0) - patch 4? If yes,
>> maybe just squash it?
> 
> They are used by driver and DT sources, so we typically keep this as
> a separate patch, to be queued on a branch shared by driver and DT.

True, sounds good.

Best regards,
Krzysztof
