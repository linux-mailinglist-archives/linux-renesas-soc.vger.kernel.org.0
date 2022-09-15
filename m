Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E45B9D21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 16:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiIOObP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Sep 2022 10:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiIOObO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2022 10:31:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F34C89934
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 07:31:13 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id ay36so4441846wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jzN+RkL3+HYpV5uaSocPVjuz6+/WusIjt5gu3LU+tH4=;
        b=C9xrr9CBZ+W1kBMx3LJmipKqrsAdXyqlDLrSqQ58gEM4pdV9C35qA3iQK2ah9iiJ/R
         6IolHtEk4LRhX+my19Hj2nWS0mJTxD//2s9FdO+I+qCjzXdn/GNlTZKEaiAJFop0V82v
         OC/ZfF7LsCi52BDe6v1yyjYkmtRNVZH7v12y5uTPeXaAfsYX+m5avpNKSkgwpL6ALSbO
         jlD29ZaWkuKT+tuMfxxWO3ytHyVbPx9aTniAQ9ILOMaVL0oVq7VmyBOUhszLnLVteXYm
         5WmYpgZLaJ27S9EeSbpM0Cx0Ah2+1F5JGFfzZ5q10RP8ElhQtAsqZ5D9AZThrKcCNmAd
         4GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jzN+RkL3+HYpV5uaSocPVjuz6+/WusIjt5gu3LU+tH4=;
        b=Lr3xqD95RtHzETV1BK3f3/gFQSCtYggGF9VZgLMTcnEV/nPM00C59jaw4ztj5rm+I+
         YSCKB1rymdp55gVsiXwYwAMZUTpT2KPlYw8COQG/DuCPPmdOWKYbOksXJ2cbJe+Dmy5z
         +5pjccAZ0PBRkbvMyo2YyXV8UHS3D9I1/uZsD3OcSVvh1Bhdcjc/ZwS0BX6WaZEQBW7O
         TnQd8A3607e2YEm6XFPFTdkTJnCCfx+4hktJGJmTcW5WIIG6tPhEZ/ZrJcq9/KBYT9ux
         J+g6QgybpZM75caERV1XRg1c+LTwqXe0AGEYVLs+kg2TWkxEfYpvSzY8Ipiw5jtI8geV
         CDeg==
X-Gm-Message-State: ACgBeo3Tw0qalcQSTY7HWnLPhAerPDiSAATD1ZXSRiCquyU753dXs/VO
        dY89bI3Df3SE18MaO4Mc0jibSQ==
X-Google-Smtp-Source: AA6agR4zYPtswUxwv+bjjArjupfpo//XBQX8ZJCy1hTwWvbz611yPtorduCPyU7dIWhfCy3kzRoqqA==
X-Received: by 2002:a1c:7905:0:b0:3b3:3fa9:4c3a with SMTP id l5-20020a1c7905000000b003b33fa94c3amr7148909wme.55.1663252271795;
        Thu, 15 Sep 2022 07:31:11 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
        by smtp.gmail.com with ESMTPSA id q17-20020adff951000000b00228dff8d975sm2762250wrr.109.2022.09.15.07.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:31:11 -0700 (PDT)
Message-ID: <dd95a178-8d5b-ecc9-9ec9-6988ab1dcf31@linaro.org>
Date:   Thu, 15 Sep 2022 15:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert
 to json-schema
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
 <20220915093537.qqddtqx2lr5ttuck@krzk-bin>
 <CAMuHMdV9dv8j34bXBiussjM3f6+nW2aJ-S2drU-MF4q_aB8trg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdV9dv8j34bXBiussjM3f6+nW2aJ-S2drU-MF4q_aB8trg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/09/2022 12:12, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Sep 15, 2022 at 10:35 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:>
>> On Wed, 14 Sep 2022 16:17:37 +0200, Geert Uytterhoeven wrote:
>>> Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
>>> to json-schema.
>>>
>>> Add missing properties.
>>> Rename the device node from "usb-phy" to "usb-phy-controller", as it
>>> does not represent a USB PHY itself, and thus does not have a
>>> "#phy-cells" property.
>>> Rename the child nodes from "usb-channel" to "usb-phy", as these do
>>> represent USB PHYs.
>>> Drop the second example, as it doesn't add any value.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> v2:
>>>   - Rename nodes to fix "'#phy-cells' is a required property".
>>>
>>> This is the final conversion to json-schema of DT bindings for Renesas
>>> ARM SoCs, hurray!
>>>
>>> Note that there are still a few plain text bindings left for Renesas IP
>>> cores that are present on non-Renesas SoCs (nbpfaxi and usdhi6rol0).
>>> ---
>>>  .../devicetree/bindings/phy/rcar-gen2-phy.txt | 112 ----------------
>>>  .../phy/renesas,rcar-gen2-usb-phy.yaml        | 123 ++++++++++++++++++
>>>  2 files changed, 123 insertions(+), 112 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>>>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the
>> following warnings. Consider if they are expected or the schema is
>> incorrect. These may not be new warnings.
> 
> These should be fixed by the DTS counterpart
> "[PATCH] ARM: dts: renesas: Fix USB PHY device and child node names"
> https://lore.kernel.org/all/6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be/>
> 
> In hindsight, I should have cross-linked the patches in both
> directions, not just in one direction. Sorry for that.

No worries. Thanks for fixing it and error can be ignored.


Best regards,
Krzysztof
