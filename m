Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307865BA043
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 19:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiIORMO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Sep 2022 13:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiIORMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2022 13:12:13 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE4C58DD8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 10:12:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id n10so1276282wrw.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2l+yAhDGJcVHWRPAUd5IGqWQpdGPXrRqo+Mo7rCnu9g=;
        b=qYLUuKwg7TmcQaCUmiqbSOSwWPHJ7BOSf7OUqyRyJ3RDJwhbXvpzzUvwOJ2LS2xjI5
         /H82/CJ4BtXEjNcjgJVECsKq+Ld49iUvTQspx5JGfaQiA/oi3e/BocD+gFhSI8btsLbU
         Ss7yyFQKAwTvDkeV8GbLErQaCpNuTrMsJU0jKKQS0DF2qqzAxS9A5al/VX+0ACp89cdB
         2BNcfghBBQfbqvq7o5SHdTQhYFUjjxNUFFuRmL5Cc6zCH7kybyjMPUot0CyYkFWxPPfa
         KgaCspXXxXrNPZXRTaAKfo80+mBYKf6AE9XM+95iIAqhT5J2QaQ6e1WioRNqewpeCdsC
         L6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2l+yAhDGJcVHWRPAUd5IGqWQpdGPXrRqo+Mo7rCnu9g=;
        b=J+D+McJsFO5FOTjrqqA/OFyrJAvSss1fkiZI6Pj2eIel4Z2BlbdY1/kX8R8s+4lyt0
         2hJ/nD3tjQL6uMloQsebIPXhI8ixn2TKZVW6/tSl9JM1qE2pWY/+Mi2fFxHlkmDk1L18
         xqSNhkst95Qr3w9EBOaxbg8GCuyt4JeaFc33eMI+4CgdS1Vrj2FpeI9gZu0WOI/hgupd
         l0ycepZJtnYfdJG44Vao3d0XNBlC90PKjEe9U1eYnGQhG0DXOcCf71AgwgBPp+TYnpV+
         j+78UEmP2sGtdylYQvw1gCtHXPbRCP6jH120D97DKCW13H5dmUIPCFOoLD1RNKAVg/le
         OtGQ==
X-Gm-Message-State: ACrzQf29G9WX4wFAIEgWnO2HtTVGkw8g4cfotRtLPWHq/ljoktdX5BX/
        ACqCd1J/0g/g+vLkwbRkJORdeA==
X-Google-Smtp-Source: AMsMyM70kaWkZlnA6Fn5V8cPrO3Vg61CS3ixMnGXXYV5uT8dD90iLhhDw+2OMvK97nrOmKmG8UpJsg==
X-Received: by 2002:a5d:58f1:0:b0:22a:dab5:9aa0 with SMTP id f17-20020a5d58f1000000b0022adab59aa0mr459058wrd.28.1663261928744;
        Thu, 15 Sep 2022 10:12:08 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q1-20020a056000136100b00228c2462a78sm3171395wrz.24.2022.09.15.10.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 10:12:08 -0700 (PDT)
Message-ID: <da17f8f0-8800-e459-e145-58a296296031@linaro.org>
Date:   Thu, 15 Sep 2022 19:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] thermal/core: Add a check before calling set_trip_temp()
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220908174610.7837-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220908174610.7837-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08/09/2022 19:46, Lad Prabhakar wrote:
> The thermal driver [0] for Renesas RZ/G2L SoC does not implement
> set_trip_temp() callback but has trips commit 9326167058e8
> ("thermal/core: Move set_trip_temp ops to the sysfs code") changed
> the behaviour which causes the below panic when trying to set the
> trip temperature:
> 

[ ... ]

> Fixes: 9326167058e8 ("thermal/core: Move set_trip_temp ops to the sysfs code")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied, thanks for sending this fix


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
