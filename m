Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E867554BA11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 21:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244249AbiFNTIw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 15:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238505AbiFNTIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 15:08:20 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6871CFD2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2022 12:08:19 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso12678525pjl.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2022 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rwKowjuTVcnkQ0zNow1etxFYmYYBvxe8n4i2xDBmbJQ=;
        b=QggtuUGrCeivzhE8aaZ963PX5Ve1TW4VB1j6niBk8VsIjEk44dO63FbhCfFl+wIbyY
         +gaBBa8XFIyVRbVcZekOEPCxehabh4Mo9tALpQciQ28eOtBJHmxX2RyQXsAneNFeCroB
         vkbT7XaNKZ+wTRa3gv5815m/cUnhL/ZlYTpqwxrp18KL0tb8EF2lxfyHOhf6psP38e3m
         OigwVD0DMShst04/aF9vSBLy5Pcq1ibhyMbFJWQbRKePY2qVGVO5Q0zEcPXZq6UV40dw
         l8l82CUsgMhSF/feeU3s0Mgi0R7jBL5ZBokbowwaYQTuBy0bDp3fethiApt+nUGMRBdE
         kLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rwKowjuTVcnkQ0zNow1etxFYmYYBvxe8n4i2xDBmbJQ=;
        b=qt/yfxBlZQsXhnOGrE6HHDdSMccLog1KbLnaStq9wkl2TlIv9zEf6y9BXkFHgQsZCN
         Kb5tQma0LCxZVOdpiJzP8ojIsM6IpzDQbqNqdNDZo8mDJ/+E4f3Ku4iZgo1CvhvWwikz
         FReizCaRE4dOxgf1haErKVRWmJGpdyek41gBohXyp4yk6ohiAMo80LgS8L6OEX6HLTke
         WkDD1NdiavfOV+WYV6B2HJjEy0TKyLd3edjCO3cOqZtEUPaynHe/9fFSD29lYd9TUcon
         V0HRSlrtlphzWe8zug3C0jybPW0E9FUWFzQxh/+de6ZOd83lcfAZiMI7IXalzNi4JYAw
         Vt2Q==
X-Gm-Message-State: AJIora9NrEYh/JpkeJIw/lJ8ZkKNAJlBC61uWc+JtdF8h2j5J6T5TrXu
        bobOQZZ2cEpGISromS0QH1xNcg==
X-Google-Smtp-Source: AGRyM1suB0/K0qNd0nkbQNLJx89S7M7fvLeQ1U4xpYZDzrJO1XhQ+wYxohvjaLRbwrkO2FDRkkljOA==
X-Received: by 2002:a17:902:f54e:b0:166:3b30:457c with SMTP id h14-20020a170902f54e00b001663b30457cmr5671398plf.1.1655233698755;
        Tue, 14 Jun 2022 12:08:18 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id b8-20020a17090a010800b001e292e30129sm7726866pjb.22.2022.06.14.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 12:08:16 -0700 (PDT)
Message-ID: <43d2cb67-5086-4d27-390a-c6a22b10bc9d@linaro.org>
Date:   Tue, 14 Jun 2022 21:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: rcar-gen3-thermal: use
 positive logic
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220610201701.7946-1-wsa+renesas@sang-engineering.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220610201701.7946-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/06/2022 22:17, Wolfram Sang wrote:
> When handling the V3U/r8a779a0 exception, avoid using 'not:' because
> then its subschemas are far away in the 'else:' branch. Keep them
> together using positive logic.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v2:
> * new patch
> 
> Tested with:
> make dtbs_check DT_SCHEMA_FILES=thermal/rcar-gen3-thermal.yaml
> 
>   .../bindings/thermal/rcar-gen3-thermal.yaml   | 21 +++++++++----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> index 1368d90da0e8..72dc7eb27f8d 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> @@ -57,31 +57,30 @@ required:
>     - "#thermal-sensor-cells"

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
