Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03BE5211BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 12:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiEJKKl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 06:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235785AbiEJKKk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 06:10:40 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F8B185C85
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 03:06:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id j6so31863039ejc.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BGqPoB7N13YysL36iy5GEucgrDjuE+TXbGs3In49Sys=;
        b=YSmHg+XnzOMfv6n5ghbpEO5w3L1xlEeUKBpPmzL0AdXNC9rPvCw1STpr1P7iM3aXd5
         vwysCA784OxRHQGV1aVO5LQLZGeJCyUSYr71PG4xtSKKxAsjyCCm+mhH0eMieYMzgSeJ
         ADEw/wMV5BeF7tVpCeAHOmCaBthtV0YURypcfDWMXPmjVYdQOkDakdAMrNp6oImlGlz8
         YOOoupvkovGJiy9zM9D1Er7Szs1PjjkC5XQR4fpOMbGps9oU247t6qITmtG8OBGmD5qh
         OI1foxczyGDxByLmTBjy0mOeO3GEihINeY7oMq8yzhSlB0hFwJ+rE+cVsF4SmJmSKFqX
         IQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BGqPoB7N13YysL36iy5GEucgrDjuE+TXbGs3In49Sys=;
        b=A79o4F1BmE2Z6G+3Km6vNjZ30OXKs1kLgM7+f7Z/RlVjmLdMwoSs5fzJ9F1I06KlYU
         enWEr9wA8hNpGhXIk61Dvt779VkLIUNtG5HvdGHRLbNcf6vChJykkbhGXrfu5wdQwrwF
         rktEWEkdbcmkv3Q1/bFCbvPh3GLY/eWPRAswlMjb2uLHAzerd/C+KetidmNXhgwBxsEX
         wyHque9MSwhCKeVOI9KZRN+CYgBsJK8w5TZTqVDuwXZiBgLEEY9/6ASk7+OPG8RhZBqG
         I18yHf1t5Cc7k9zDBFSskHFkiSChXr84mVmJhaSx+2tH+RyH9Mt+e6QA1ncP/arqq5+j
         B14w==
X-Gm-Message-State: AOAM531Sngy7YUwWH5s7yWhMCfVTkLPKtZC3R7AnUyeCyWWKWekCRtEw
        eBOzSXUJx//tH52kIcCsgYtc9w==
X-Google-Smtp-Source: ABdhPJzBkxx1gu4RoEDHqEuHWE0028WLGmyL0eWB80UNCobMZFrBIW/mI1GiLtF9kAfBnQ4FzGB0Tg==
X-Received: by 2002:a17:906:9b8a:b0:6f3:fcc9:f863 with SMTP id dd10-20020a1709069b8a00b006f3fcc9f863mr19368373ejc.672.1652177201743;
        Tue, 10 May 2022 03:06:41 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d23-20020aa7d697000000b0042617ba63absm7281381edr.53.2022.05.10.03.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 03:06:41 -0700 (PDT)
Message-ID: <79fbc9ce-f815-a886-db6c-9ccdf7be4e53@linaro.org>
Date:   Tue, 10 May 2022 12:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/5] rtc: rzn1: Add new RTC driver
Content-Language: en-US
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        kernel test robot <lkp@intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, kbuild-all@lists.01.org,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
References: <20220509154559.24851-3-miquel.raynal@bootlin.com>
 <202205100552.VY3kCkh5-lkp@intel.com> <20220510092911.5ab2f15a@xps13>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510092911.5ab2f15a@xps13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/05/2022 09:29, Miquel Raynal wrote:
> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/rtc/rtc-rzn1.c:23:10: fatal error: linux/soc/renesas/r9a06g032-sysctrl.h: No such file or directory  
>>       23 | #include <linux/soc/renesas/r9a06g032-sysctrl.h>
>>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    compilation terminated.
> 
> That include is no longer needed in this driver (and should be merged
> through another tree). Tell me if I need to resend or if you can fix it
> while applying.

This should be resent so we are sure that no other warnings are reported.

Best regards,
Krzysztof
