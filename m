Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373D852E7AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 May 2022 10:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347066AbiETIe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 May 2022 04:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347170AbiETIcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 May 2022 04:32:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E5B15A768
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2022 01:31:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q130so8870875ljb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2022 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h3WJYFfGayadW9G5lFwAxq1g0Bjs/Evwf1QVMN3FYqs=;
        b=OUxy/ZYaZONP+Q+vdt5vpARqAjqGs2HdOgXpm+qsSQ7l6Tl7vI+yC2OYFETOw2A5rp
         IuFVSo+PmbCE1plCVq8QmhJDtZc+enypE/U+B6G4+QptS//s4R/q3sYIWtDWUO3n5Si3
         PS/kHG79FMPfUJynDg+56VnlciTQKzQlEaTwi9QtQmJReX10pupNqvmB9HGW5Es1kK1f
         tXaYLhVHMcHYcRtS+3qf3HnZyUfOjt1+qPw9YaSRvPluan5AOcJQySDBbACUEK59fDNf
         PNDU+CxLprUY3US3HeuMXluL9aKqGX//ZDMjgk38F+EFt2jjPyOG3xAr3UMcUP/dW7Jc
         u6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h3WJYFfGayadW9G5lFwAxq1g0Bjs/Evwf1QVMN3FYqs=;
        b=O1XQgKZn2+FpXGH5NlC9JqQ+sxRwlOtZKJPJg4qUcxCbILquXwPiZnUsTtARf6yje2
         4K4nHnn5mXYdoY/oQutqPXpXVia9DCLYPuEFmSMWrbAqJzl9EHRh42BD503XMoKk9b1E
         M1xQpCPfj9B4jBrjroUyXxZ1qbBT6SP8/ekLrIpcBiTrbbUy+cOjNeWQmee7l8yMAoFu
         4mnF/fJbZKtu97XuO4g900N31wqtWDeDG9YU3enjXXWMPTNe28V2WYLCEB7sbvtnaQyE
         +Q7yQuO3abJJTQGaJ2Zmd5i/ijmu2uCSaD5a6yOyQzey2f7a0sb/JlR/cDVMkEjky3SH
         BVog==
X-Gm-Message-State: AOAM531FVsqkD6wu8uHgGnSqlkUrcXp72C1N4Bi0tDR3NaDAdF4qZlTl
        NR9hZz25OiWk0mxIL0Q326ycI2c3UoWKKJQQ
X-Google-Smtp-Source: ABdhPJxwX2pN5Rk7XCYypLFb7esRRrkZ0ZlxbJJ18ePBDVmnZOZ1ME9l/zqrP6uQg9uDNcJ0gl32bg==
X-Received: by 2002:a05:651c:160b:b0:247:f955:1b18 with SMTP id f11-20020a05651c160b00b00247f9551b18mr5076472ljq.427.1653035511499;
        Fri, 20 May 2022 01:31:51 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e8891000000b00253d84812edsm229678lji.2.2022.05.20.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 01:31:51 -0700 (PDT)
Message-ID: <8ef52427-b63c-1386-12e9-7a36367dc888@linaro.org>
Date:   Fri, 20 May 2022 10:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/6] dt-bindings: PCI: renesas,pci-rcar-gen2: Add
 device tree support for r9a06g032
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20220429134143.628428-1-herve.codina@bootlin.com>
 <20220429134143.628428-4-herve.codina@bootlin.com>
 <29ba3db6-e5c7-06d3-29d9-918ee5b34555@linaro.org>
 <20220520102329.6b0a58d0@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520102329.6b0a58d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/05/2022 10:23, Herve Codina wrote:
> The yaml has the following structure and so has 2 AllOf:
>   ...
>   allOf:
>   - $ref: /schemas/pci/pci-bus.yaml#
>   
>   properties:
>     compatible:
>   ...
>   allOf:
>   - if:

(...)

> 
> Is having a 'allOf' for schemas inclusion and a 'allOf' for conditionnal
> parts allowed ?

Only one allOf for all of such (ref + if), located before
additionalProperties:
https://elixir.bootlin.com/linux/v5.18-rc7/source/Documentation/devicetree/bindings/example-schema.yaml#L211


Best regards,
Krzysztof
