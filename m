Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAA757FCCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jul 2022 12:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiGYKAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jul 2022 06:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbiGYKAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jul 2022 06:00:35 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE77717048
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jul 2022 03:00:33 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so6046048wmo.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jul 2022 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8kKtLby8MgrUZLt3qipFc/90ZgJiiZA99iRAGb8boms=;
        b=xCF6GRKmnVCxMYRV/lmEMNlvm2J1s1DWYDqDFYGRm9e9cz9sNAY1IJh07ch4Q4zqbz
         8d9GAzgrdlVt9UFU6nhVDvCmpx64V8MEFHp3Hb1vqt2BTpGimQXFYVRdfIl/39GRLaJZ
         Jt/bQllBSlji9wDxYXln4f8yD1ojVRDj6ud6Np7TNQKymRFsSKs7Icv3cZ9ZnJm/k5KU
         o5ytyhWKg1pGEPzci2qaOq36TdFRWDnN2PyKuEWF1jLZYs+hAFTfWjIXTumvKCIl3+1a
         7TItGCaULZRrmoLrrw3BgQLily+WEJ+WT6Wd3+M/B8EFuoDp6BVdjC2hqgFSncNqRotz
         LlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8kKtLby8MgrUZLt3qipFc/90ZgJiiZA99iRAGb8boms=;
        b=6Fj4iGWEhRhznLp2RSHfBy4PcWXfo+PPD1lCID4e/uMNaYfNFtGOCwdHI6WoVGZSb2
         kdhjCHhUc3cNNxHyPp2mjEsMShpEGs+Ss/GdHObqMyix39VRzT0qk2Q7K3Qlmr+PLHHN
         p84YAThBVVOJ3QBMnu34XVjmHios0Tu4A/ML1MWoXhurDnbFpYiLqv3L0WD+qHOCVVlj
         LxwmASB6GxHtzoeeF4hfoXrQMgq0B50D+qna0IHW+ayaeL6G2eq9mVL86S25bsT5j7XL
         eIhglDcgATct5eoIrZC77J1rn49wUWUNA9wCp6W1gEMotnA2OQtysqclw15RnpyfnHcF
         TzeQ==
X-Gm-Message-State: AJIora/Bx5L2auJXf55SwSGjdcFfuYxvmtqpFhym0CGID0nwM2nN6npM
        udhSnQJx9kmirmUC6XYf192qYA==
X-Google-Smtp-Source: AGRyM1t8wbpFtIyQ2/G97onqzgPLGerZ2kGEDsq8OEUx1Zg8c62ccPOUeBcLb0PhnCWY0x+Y98bnqg==
X-Received: by 2002:a05:600c:224c:b0:3a3:17b7:a229 with SMTP id a12-20020a05600c224c00b003a317b7a229mr20968303wmm.1.1658743232355;
        Mon, 25 Jul 2022 03:00:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:feb7:6a58:3e0f:a58f? ([2a05:6e02:1041:c10:feb7:6a58:3e0f:a58f])
        by smtp.googlemail.com with ESMTPSA id n6-20020adfe346000000b0021d7ad6b9fdsm11490008wrj.57.2022.07.25.03.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 03:00:31 -0700 (PDT)
Message-ID: <28e915c2-4871-b648-f5ac-78d6ecb32768@linaro.org>
Date:   Mon, 25 Jul 2022 12:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 17/33] thermal/drivers/rcar: Switch to new of API
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Daniel Lezcano <daniel.lezcano@linexp.org>
Cc:     rafael@kernel.org, rui.zhang@intel.com, khilman@baylibre.com,
        abailon@baylibre.com, amitk@kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        "open list:RENESAS R-CAR THERMAL DRIVERS" 
        <linux-renesas-soc@vger.kernel.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
 <20220710212423.681301-18-daniel.lezcano@linexp.org>
 <YtZ1IExNlsYaJkC9@oden.dyn.berto.se>
 <18ade2d0-ebda-0526-71f3-65a0b2685068@linexp.org>
 <Yt2W5UCXaB3Memzg@oden.dyn.berto.se>
 <e2a56ac3-057c-2b17-7bde-7e860a86807d@linexp.org>
 <Yt3KDSO248WebZ/w@oden.dyn.berto.se> <Yt3Vmt/AAzqzDzBF@oden.dyn.berto.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yt3Vmt/AAzqzDzBF@oden.dyn.berto.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Niklas,

On 25/07/2022 01:28, Niklas Söderlund wrote:
> Hi (again) Daniel,
> 
> I figured it out, the thermal zone is disabled after this change. For
> both rcar sensors with the new API thermal_zone_device_enable() is never
> called.
> 
> In the old API the zone is enabled in the call chain of
> devm_thermal_zone_of_sensor_register(). While after this change the zone
> is not enabled by the core when calling thermal_zone_device_enable().
> 
> If I add a call to thermal_zone_device_enable() together with the new
> API everything works as before. But I'm not sure if the correct solution
> is to add a call to thermal_zone_device_enable() in the sensor drivers
> or in the call chain of the new API?
> 
> On 2022-07-25 00:39:10 +0200, Niklas Söderlund wrote:
>> Hi Daniel,
>>
>> I tested your branch, unfortunately with the same result for
>> rcar_gen3_thermal. Manipulation of emul_temp file do not trigger
>> actions.

Thanks for investigating, I updated the branch. Does it fix the issue ?




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
