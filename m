Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8AA646A75
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 09:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiLHI0s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 03:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLHI0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 03:26:46 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86775D6BD
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 00:26:44 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id s10so789031ljg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Dec 2022 00:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6ClY8Qn5PhU88a7o7iHI8P//YfoghPFJcCo7zTwnx8=;
        b=xI/MBzy1SAK+zJrVSmYY0x+h/gh0oAVfK1JHbYnRpeJh1Z7iY1kY1TW6Ixp3W2Kabj
         p41PCFYiUJT6aaQGicyGHO/I0aqlLmHYk1XJ+/N4uWQfESbMN4uxPgj9X3BxlCtX69jg
         jEUaXE1820E6AMvDr69hJG/x2hqILM5PWE3VdJUJb1T6wk6kh6RVkLkS8uGaTpC9k+Fj
         5kcDAKeiaq6GqovSIz07BBory0mJSNMGGGDlkWuFeX4YkGUF2SlPgqrdvLDgBdm/ZZyJ
         KIDmXdeY1/hDwNj2jfFc9n5fZA9puhsqbABk9w7KpihVi2si54vMF+4znQrOQI++QMKp
         a2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6ClY8Qn5PhU88a7o7iHI8P//YfoghPFJcCo7zTwnx8=;
        b=6+42Yn6ZrqFpsBXg1lAYgKjsrOHehUtVmSQUJjQTyOsMfOSvKQU1qxLOlCklw96TKx
         cXapmS9lmnjEFacpG9SVmft0CCR6pQYzrYdp4ud62Q6TXvwllC0aerDy+VcWtmmlHJK/
         kDMRPm/ZXnUmehpa0FKYMDSwf5iVoXeC07tnNw3qwGgLJ7/1Bm2jLXNfiCyTmZucK1qg
         cvQAOnWW3YLLa6p+MI+zpchJfMkpdq0MQLRpHgoAYzXbD6tqXMKGx4+dgOPg6xXsECuU
         L5Tc0PLd86ifyb9kLxHgAZgkjsBqEgGhdwEK0ROjhVzv4vIJnjEKFohEl0M8zEc+Tr+K
         xV+A==
X-Gm-Message-State: ANoB5pmkhWPzK+k1wCFiFDsVBR0ng65Jnfg+XTL/iJ6ehBClWYtdo9lL
        Dwxd5Sm61FZRq1EpI535QlX5Yg==
X-Google-Smtp-Source: AA0mqf6epq8Tk3LPsvkLyf6+nNpqKEYyRgrRwB6VG90m/K7IlmsjsseL+xDK/7lLb1TyxhdT7bvecA==
X-Received: by 2002:a05:651c:1108:b0:277:e8c:a5a4 with SMTP id e8-20020a05651c110800b002770e8ca5a4mr25863815ljo.311.1670488003075;
        Thu, 08 Dec 2022 00:26:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t15-20020a05651c204f00b0026bf43a4d72sm2114512ljo.115.2022.12.08.00.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:26:42 -0800 (PST)
Message-ID: <36895e49-aea5-3676-e7df-78b30277e6a0@linaro.org>
Date:   Thu, 8 Dec 2022 09:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/9] dt-bindings: PCI: renesas,pci-rcar-gen2:
 'depends-on' is no more optional
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
 <20221207162435.1001782-4-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207162435.1001782-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/12/2022 17:24, Herve Codina wrote:
> The 'depends-on' property is set in involved DTS.
> 
> Move it to a required property.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml | 1 +

This should be squashed with previous patch. There is no point to add
property and immediately in the next patch make it required. Remember
that bindings are separate from DTS.

Best regards,
Krzysztof

