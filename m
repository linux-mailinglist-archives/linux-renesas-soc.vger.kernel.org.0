Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F047808B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 11:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359223AbjHRJgX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 05:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358546AbjHRJfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 05:35:53 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B1D26A5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:35:51 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-523d2ef19e4so865085a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692351350; x=1692956150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hfNi7JSKPZId/vX/i5U5Vygp+2lX7VCsOltrQFE5gZ0=;
        b=yHkzXIub7BNebiOEltNrfpmP9qkFHgVPPbK/hyeP3OR8/bXppY3+1W9MISAePwiZgd
         xu6/2dUbf2N6aPr7eTI3NybNOE59RDNSRNjDSrmBr0viI9mvFV4+vnI4/F8suNYLGUdQ
         ZePFWghl9W2o6uW3YXJgAs/o57zIYIW0ZO5zzAvYW1WYpYpKhVP6/GH3EIumSCvbKFP1
         l3khRxp0NYdi28yjb+JLgbWPukHIt0VoZUg+VgHR74APUofjDcT8wfieNDDwpj62Fa6T
         Hfo9S3jpZGY2mIFZrZuEibRjQRmOGrcFR/4gRWvhvHFlQM+45vY7RtzNjv4EErc7T5cT
         49zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351350; x=1692956150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfNi7JSKPZId/vX/i5U5Vygp+2lX7VCsOltrQFE5gZ0=;
        b=SnlMhBBB4G4t0ydI9H6P7Vm8XoFTKAP44aWciaACCpGzLAhEqBhJtmTACT6D1A02lD
         qsi6jdaWDcU2UtPbmneV5/CUQImQAmQQUguMpvhQWD0DtjJmgXA3qmGSOykH5oQdt83+
         F/nx6IWPx4OxVRkGNa3nVDoo1L2fIKOIsf9yW6cTIBLd4tY8Cg7ES43oCTBJCgA5d4fX
         hMRiCVeBv97siRIqCH8JUC7qYPV9LbythwJ86gFqO95c28/TijbvP6/wcdvG2/NKpRUr
         udnnDsrst+kwlRKg7mYpABriVrQ4XqDWkjEXc+Q/EXrBSkhcMTOXsd3mo1NPSKhCe5YQ
         0p3w==
X-Gm-Message-State: AOJu0YyW+W5USQaU1OYvugg0zqK9TLbqBSejx9UYEs1ED2JwXXGR327z
        IPpIqK5NK4OV6hF7MOXBSpekTQ==
X-Google-Smtp-Source: AGHT+IEPujuSa8cOVqm2zhubowgpe/JPUlxLAAhtqQfJagG/gJ2jSmeyd2nx58vbQzxtgVkR9p8p1A==
X-Received: by 2002:a05:6402:1204:b0:528:88f5:eafc with SMTP id c4-20020a056402120400b0052888f5eafcmr1849520edw.23.1692351349845;
        Fri, 18 Aug 2023 02:35:49 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id g3-20020aa7c583000000b005224d960e66sm860433edq.96.2023.08.18.02.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:35:49 -0700 (PDT)
Message-ID: <be72501f-f7dd-38b6-cf2d-326185ae7e91@linaro.org>
Date:   Fri, 18 Aug 2023 11:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/2] dt-bindings: hwmon: add renesas,isl28022
Content-Language: en-US
To:     =?UTF-8?Q?Carsten_Spie=c3=9f?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1692033412.git.mail@carsten-spiess.de>
 <3f98be38377cc556619c6876f6dcec2d54102271.1692033412.git.mail@carsten-spiess.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3f98be38377cc556619c6876f6dcec2d54102271.1692033412.git.mail@carsten-spiess.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17/08/2023 16:29, Carsten Spieß wrote:
> Add dt-bindings for Renesas ISL28022 power monitor.
> 
> Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

