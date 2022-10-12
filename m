Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49AE5FC5F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 15:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJLNK2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 09:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiJLNK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 09:10:27 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2B068880
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 06:10:24 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id c23so6096161qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cv+WkwwC9Q0rUd3KdbkW+Es/Dy75mEne3jS3rjr0plE=;
        b=vv6UwqkTm3ssp2T9OjzWs8ykNT7Pb7xgl0CPvoASxiRNNv2IkwlYCjFFmJ/WHYqrs2
         TH37PozUmEqvR7q5aIJORtdLwb+/t7YosA6zcVup4pkQIe/hLhVXwr/fwkZquYS/6WlO
         lXGWMOllhS38DFp8S41pDnuRG//w8j0GHCul/rQ954MmDuAj4a29gwYWyLELPti4fbGA
         YnsNMafU3yxUSwQw4toSe/LPasM1JpbzZOONln/Pu0ifXS7WKmqqshkRt0pGJvhRfGjo
         8UJU1WFpBPjhu/8zv1xibiyg31HpzUum8lvvB+Wa528xDXYfiZ1uKf7ls642JlnBnUyr
         G7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cv+WkwwC9Q0rUd3KdbkW+Es/Dy75mEne3jS3rjr0plE=;
        b=Oxpqo/m4nniWEqekTZNgpg0WBJW5ba3JAhk4yPp4Zj8C8yYXCGDowwYXZ+dsOafEc9
         bssFruyUZONtClneVcNMVuR4EY1qFDatJC+mNyiiWC0KyHnihbcGY+Qn14/a1vw+Go1v
         OhJ/IvQkkeVAssJwXKO5PC6959ZnBKBPDBTXqNUYVYEDzZKN2cMPbYGRISzVrPGeqKJK
         UmhHOLi1jluuCPE8f3TRXDDKc4UOBOgTu4XYqwcjbXjVHIHv7VYjWKOqI5QpUpNLZL/5
         muUcvju2kQs+ZOXX1KAbsqed0XxKsoKexVCPQDUUBCO48NMzoNK1gY7VHLhEukkr6U3y
         EyCg==
X-Gm-Message-State: ACrzQf3g4I9tR0yulZSWpW8uSIewwwE+5hdzMrQNA5fOlrbbUvBxTUdl
        CbWPxdLnVvM4SmiFcyi+Y2mmg1tSIJhcPg==
X-Google-Smtp-Source: AMsMyM70tl1NXSP4OYyHdhsG/89SAURilo8PxrhbTi4sUtwOI/patRYN/idHVw98qSnxx0dPcxrkEA==
X-Received: by 2002:ac8:7e8f:0:b0:39a:e70:421 with SMTP id w15-20020ac87e8f000000b0039a0e700421mr12845661qtj.592.1665580223519;
        Wed, 12 Oct 2022 06:10:23 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id j1-20020a05620a410100b006cfaee39ccesm16026643qko.114.2022.10.12.06.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:10:22 -0700 (PDT)
Message-ID: <4e349b3f-c0f6-91ab-15d5-3e9e873820b0@linaro.org>
Date:   Wed, 12 Oct 2022 09:08:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4H
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/10/2022 03:05, Geert Uytterhoeven wrote:
> Document support for the SD Card/MMC Interface on the Renesas R-Car V4H
> (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

