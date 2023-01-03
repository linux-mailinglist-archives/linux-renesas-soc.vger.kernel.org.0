Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1565C0BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 14:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237498AbjACNZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 08:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237324AbjACNZb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 08:25:31 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D472610B4E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jan 2023 05:25:29 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id f20so31794137lja.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Jan 2023 05:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQtAS7dRffwstL0NIoU7HOUw97BRuM+uBfBVehzzmcY=;
        b=L8/yqW4KRK5t/QShxNfFug+/I9Ee8+aEk1YCcHUfjNK50qsHMaljqs7lDv7D3v8MM+
         jvG7IIktaX/GuPJMXe8APHdU1SeTNRfkAUtrDmge9ZpSXbZykouKBJmoWAbGk8iiErZA
         se91VMUi+fd//cAy8i/gubXZYnmzm/pG8pCmSVq3kHOOW3vxXuObu5P3HOSG2bZkRP4U
         YW70cpb5lZdVeWDbA4vep5+5Yu8H2kFi0H2MVw1G6makH5VRjLw5w2dj/FkhORfBLNsS
         n4Jo0iLAh7Kq4IRjmy41dxowg4xUDisdEAKIvN9fyAgf5HI2ZAP7zojyHosxXk4shXLx
         Lbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQtAS7dRffwstL0NIoU7HOUw97BRuM+uBfBVehzzmcY=;
        b=7C2tIu17GkNwa3uG1UBGAf2ZSRlrgz/cIPzNLswag7DUta/jo5KfRdLL9N5lN9WEAy
         ccKfd5SzSESdSLTSJcr4Yc+T+8S1aqhBC4L4ZZJ9lAPA/zjOUgo8ATDKBqqNSdQ5d8pk
         79xibl59SsGml5Ov+prdxYxfUUOYp0zbriWzXVPZ+FVqY/C7Q8HDseY7f36rP3hatxRA
         0TRtrGjfJvYPOk4j7x8yjCaObS+0ktOMIjRAMaW1iQOKKAN7HzbMSYsIsDKJSB4yMK0G
         jbS45yYemGc/1xYRYWGq4LV5yljS0CZ8pdIfshunx5J4BfZw8ahwkFE4/+xVQT+SYfBj
         5rtg==
X-Gm-Message-State: AFqh2koadb61Qswf6UpJAkZAgdxYxqZQrV80EQZOYuV8Y37qH9H36cLX
        /JZC/04fUCE9IKpo2DYEQ/sV0Q==
X-Google-Smtp-Source: AMrXdXvXD+0fRDvbDETqqmRKV02pVToVMGeAb1YfTMy7x4T1bhDgESG879wR7yCj5oU6rbY1UKrQjw==
X-Received: by 2002:a2e:80d9:0:b0:27f:e337:1ead with SMTP id r25-20020a2e80d9000000b0027fe3371eadmr3489840ljg.43.1672752323237;
        Tue, 03 Jan 2023 05:25:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s4-20020a05651c048400b0027fbc576464sm2628850ljc.137.2023.01.03.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 05:25:22 -0800 (PST)
Message-ID: <0d106f4d-4683-4117-0812-e83f8e5974c2@linaro.org>
Date:   Tue, 3 Jan 2023 14:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] dt-bindings: clk: rs9: Add bindings for 9FGV0441
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
 <20230103123154.3424817-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103123154.3424817-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/01/2023 13:31, Alexander Stein wrote:
> This is a 4-channel variant of 9FGV series.

Subject: drop second, redundant "bindings for".


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

