Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DCC46E8D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 14:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhLINOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 08:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhLINOe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 08:14:34 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE569C061746
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Dec 2021 05:11:00 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso6499358wmr.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Dec 2021 05:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9VZyqdQ56/CPfyzyaRYaaaE5b2PgRvu7YyaE56kFMvE=;
        b=rg1/4pK0o0ArdNXIBbD7hIE8s9xOHCm3s2zR+jfRt9pWHPNxmphuZU/5Y0BMYIxVou
         d/HICWcCeofRMoz19UeqPo+AEZtRF9fdIOv1GjnTIZ79ZMnQSUvqO3eldjVAHMPFna++
         nmmACFQQ1rdFf8E9wBTDz8xo9/Kyd7l1cTLUGHJSvB6GaOXiObswt98A6Y55wZ/L0S5R
         gcrKSmmMCHDgpl3Rvapr4NOEAeAiuuG4/8+Ggifk/4YXyWsWfHje34GdlVOW9dWH1w3W
         QVgQNK+h5ltg7CU4rnCddtWcvUr59SQ/CBwsEGOKz0irrc8+vksJfqmWsNkM8ePMybze
         PaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9VZyqdQ56/CPfyzyaRYaaaE5b2PgRvu7YyaE56kFMvE=;
        b=KZ/ZzX2R/ky+9D7oDVa97qDEIWTvZT5TFDjTGbeRbZQnhl3cgSSc7bK5xBjzGRhzxT
         a1z1sXenO0xR0+8mijmq3cHkJ7axYpdkicwbCf0Ub+lrWwIM4aiyxSNNricgcfrdw8GA
         3QUMUFwhOomd14WxBMq61a0iVXUokaelBpotdy6QY8RCO8vdEebLlVUNBsvB73n2KHVJ
         8WcuCF8oNmYlYmmurQM4I2+EGCnrRaWFbYXiA/Ms/ZCi9ZsIfdOgfzSsjGswOXaOfnUp
         heZJRxj+LIArdhXUMphLoKtl6WD5widcFSuE6Tg0MtXmxRfAfNi9R4i/HfXtxIngHjm7
         nV1A==
X-Gm-Message-State: AOAM533zn6ZC4ajQQ9T0SlFY7XIYi57up52MeZ3eyd7M4Vj4sPmn5z1R
        kazKeN4EHvMv37JCJKeVe0cRpw==
X-Google-Smtp-Source: ABdhPJzwo70kMd9vz2H0c+H98mxr9fadytd81xABG2xU1OkWF52g2yDKAJ2hmsi6CK+az7/GSYxhRQ==
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr7370687wms.44.1639055459303;
        Thu, 09 Dec 2021 05:10:59 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d? ([2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d])
        by smtp.googlemail.com with ESMTPSA id d188sm9075073wmd.3.2021.12.09.05.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 05:10:57 -0800 (PST)
Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
 <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <23411585-b011-c12c-a3ff-2edb9889c37d@linaro.org>
Date:   Thu, 9 Dec 2021 14:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/12/2021 14:32, Biju Das wrote:
> Hi All,
> 
> Gentle ping.
> 
> Are we happy with this patch? Please let me know.
> 
> As mentioned in [1], it has dependency on reset patch
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211112184413.4391-2-biju.das.jz@bp.renesas.com/

I've merged the immutable branch and the three remaining patches.

They will appear in linux-next tomorrow.

Thanks

  -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
