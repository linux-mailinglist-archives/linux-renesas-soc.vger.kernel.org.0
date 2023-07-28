Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E977664EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 09:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjG1HLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 03:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjG1HL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 03:11:27 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BCF3C22
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 00:11:02 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-986d8332f50so244622166b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690528260; x=1691133060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6/65k5swW0BKp3wzBZg4774CGDmkxniUqOsEfQe6Uw=;
        b=bL0nctVDX3DnxRGMycIWRdVNkXQa5rwaM09e7gtVjJykGhMN19+Dp6H2Ee0AU5fzpi
         dGvQeRNQSNkiSNJv7jPZRu0i5SAM/75wj1BCZh1mZCjdrpnFTVRCtlUeNZNzfnVWpVfm
         htpYrN5HcVcnOcrVDM3yrBTXihWQ4skJD61GDH6xedOS7UEB+0+KmdTmE/UaEVZUejDA
         bLxyy2/BQn807HId7792L6+78qu1B8tigZvxA1TFcZaQi3GlE8p6OOsY9t/bxFNwhz5w
         FMZaUTkBR0fxpSRzTZ7QihjkEa3bI5VrbPv6bNbXLHjzlPTprrKA/paCB4Lquiai6UzE
         aVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528260; x=1691133060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6/65k5swW0BKp3wzBZg4774CGDmkxniUqOsEfQe6Uw=;
        b=CJtouqQYt6W/YHyLfiR/vsOck27Be+cNw9Hec1iM7srYcx0AtfNii6iZVBdaSYAdsO
         01X/xQTtkNBd03+vRUtLHCg3nJBCUuCmJuiCgCePofL4dihp9J1wQOJsPUAOMbAAIEP0
         TH9TBEksIDlBjnU+xP4EdS2FszmorSsQViYUxDyWudRuG5MdbK/nplhW9S2ee3Xyy0b+
         Qwb/fn10xH1oaunqthbGeBOuFsXBGwHh7Qe1WNca/HZxb0jeUk1+KB2tRxexlTFcjeFx
         /RHa5AoheqriSWbVJKF6V/5B0HLwzDJHMtybOo+8L7Rmn3L5J0nKGMx6nlxJ+4uFbk86
         Weeg==
X-Gm-Message-State: ABy/qLaJ4juQBt1owdQi0/MRakz+kHfJ3OHG5aZRt8KYm7myGHjiVgbd
        Vv80MsC94BFrb+lx7al+YodsRg==
X-Google-Smtp-Source: APBJJlFNUDRbBrJQrURZlqPNy8h7vIf5frzfxBJOWvaZxlJEn+aYgzPtDvceQhB6M3RrzIY1XCOaLw==
X-Received: by 2002:a17:906:5a4b:b0:993:d920:87d3 with SMTP id my11-20020a1709065a4b00b00993d92087d3mr1028608ejc.25.1690528260498;
        Fri, 28 Jul 2023 00:11:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b0098de7d28c34sm1678442ejj.193.2023.07.28.00.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:11:00 -0700 (PDT)
Message-ID: <26d662cc-30ce-ddd6-bfe7-d0e230fdd600@linaro.org>
Date:   Fri, 28 Jul 2023 09:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: add renesas,isl28022
Content-Language: en-US
To:     =?UTF-8?Q?Carsten_Spie=c3=9f?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230727200234.2245395-1-mail@carsten-spiess.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727200234.2245395-1-mail@carsten-spiess.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/07/2023 22:02, Carsten Spieß wrote:
> Add dt-bindings for Renesas ISL28022 power monitor.
> 
> Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
> ---

This is v2, so what changed? Where is the changelog? Which changes did
you implement, or maybe nothing changed and there is no point to review?



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

