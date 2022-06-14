Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBE754B99D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 21:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357972AbiFNSvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 14:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357979AbiFNSuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 14:50:15 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF864F1FD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2022 11:45:34 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h1so8446368plf.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2022 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FdXipVV9v2r28VxWnG4xpdK6PjD5q6klgIM3ClTQdeE=;
        b=oiIa/hwfwVM0ixZMh4zawxb1AmtZ8G7eppA2ZYcaeZ8PEaLnTENrCjiMXLmJTtUSn0
         sIbwhgw6iMRjYzxTNhkGhvIRXDtzPVGq9sOSGDQKqFPOa9z0N/eogQCFaM7Uxh14mz8u
         Aq59dVgSQ3NE3RWUSAiRdtp+h8aUEDP3sUdz56HwTnjcluE3Ca93o3SJQ17HfNV9njnl
         tKR8NmFE1l8y5vD/Irsne5r+nT4188sXsn61OeyyCWdmzVl7/CJNdCpVzzP9ErJwf2/o
         mSkvlA3c6Z2FlKLbm5pu6vSKtpNxh27Da+srokrWYWo4jnFgEs3rYGfBCVwmQ+3aWmH4
         lGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FdXipVV9v2r28VxWnG4xpdK6PjD5q6klgIM3ClTQdeE=;
        b=R+3TQCksaQNrXy5N3XZ6cM+R/DrXcBgj9Pl9vTrWqo4JvrWK2DsHJ7QfIGfcUStV5a
         nubW1ySx7j2VRmkMHluryqjzneCW+LGI1s9BGPTQumA1cfJ+suXIX3AqaayzQd+p+KsP
         9NdQzMReXrmFnroucE2miGbz2ign4KubSoVEWSWISzNyKgnOnj59+JXhyJFRJYHGvsCY
         DROX/CfFqJ4d9AXAWOu9mU9D/tn4WskL9GsZv3JBrmaii5BfINzbVDFt2PpijHt9Wapb
         9jnI7Y5ilZWvg4SUHQhLWIhsVRGiRE5SxrSM1xOZD91+249bMUJXm7NT7DXEF9ZMl3on
         sR9g==
X-Gm-Message-State: AJIora9ndYY1+EEmJrJI1Biiu2n+016ukiI0XfRMYH8/QR2BdJfgACN5
        wnYScVXsY4pWCIPVisLNfXJHb40qFT6biDsj
X-Google-Smtp-Source: AGRyM1vpyw0TtFQ8m03zt5DV9wdxY4wHBCAt+jIM9VzOg8rB96mdsqzcXyvWz9tJWZLIXG/hKE0ViQ==
X-Received: by 2002:a17:90b:4a12:b0:1e8:4a16:ae28 with SMTP id kk18-20020a17090b4a1200b001e84a16ae28mr5973597pjb.1.1655232334027;
        Tue, 14 Jun 2022 11:45:34 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g12-20020a056a00078c00b005190eea6c37sm7893233pfu.157.2022.06.14.11.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 11:45:31 -0700 (PDT)
Message-ID: <833951e0-1194-1528-11ba-07c6e6dca1d5@linaro.org>
Date:   Tue, 14 Jun 2022 20:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] thermal: rcar_gen3_thermal: improve logging during
 probe
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220610200500.6727-1-wsa+renesas@sang-engineering.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220610200500.6727-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/06/2022 22:04, Wolfram Sang wrote:
> When setting up a new board, a plain "Can't register thermal zone"
> didn't help me much because the thermal zones in DT were all fine. I
> just had a sensor entry too much in the parent TSC node. Reword the
> failure/success messages to contain the sensor number to make it easier
> to understand which sensor is affected. Example output now:
> 
> rcar_gen3_thermal e6198000.thermal: Sensor 0: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 1: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 2: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 3: Can't register thermal zone
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
