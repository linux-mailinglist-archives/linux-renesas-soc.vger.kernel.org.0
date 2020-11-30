Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747182C83E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 13:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgK3MKq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 07:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgK3MKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 07:10:46 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DE5C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 04:10:00 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v14so12644444wml.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rAurpgkxedRVfbL+/ivoT0Gm+FoSm04+8ICekSUxqjA=;
        b=bvvZ9YjF2IdZu67A8q5z5w/WaizlBDxwmMcy8V7DkKcp2ahUdK/q9fye+Z5Tl3wuWg
         a2/pyDMMP41ue255fmxpqM7mrT/mizWhTVOxzIXaNncQ6FsaTXF1X2FAUhhxpGx7DdXL
         bBBLH73jXbFEyPzMuylGCSnvl7Pd7C5fCptfCDbvW1rRvBcyf4cRi6+DZQJkBgpEQGn0
         tS/MpDPakjfstvwPoHX2vdKwV4kpfZKFYCZSxnJT4HP0rmMfJWOIETwQLYYGL7VCgeO2
         yzpFl+tFPFwiVDHIAOuuLyl+mP6Eo1R9qQB2i1WQSWNVvuKZxW5I5y4HwsB6jkpt6ggr
         3quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rAurpgkxedRVfbL+/ivoT0Gm+FoSm04+8ICekSUxqjA=;
        b=WnEPwc3KN5qbfvuYTGII/A1Ao35ScYjtMjgfJNyP2mZNm94szuozm+KUUwWDxQKEYp
         vR9SoSWQN9z4KVwCvXLJ9wgkUxhPRmm+qUGbdz7+pS85hBKn2H2W+sWbgknwA1OXnM7h
         OFfM0Qprpcj4AMSP3FyNgQ6RxbxhaRGopmbGnF+ivOIr7Z7AW3Y7J9tsXpYqaTpdZpx8
         zJcW4+hJmEheMWFR5BG1yeq62HNPsrb0pjWMYsMY4gBTWTLADd9vieNnxSYldp5sVB83
         ZF4IgKt6siwqp+rgG9FcCW40s1c5N3oigWYotkgzgiHKUSW5EYy4T4DlRh1aQkpWxYi3
         yIfg==
X-Gm-Message-State: AOAM530pmQAZsMqANEBWUE7B7IATjjt4iK6AbUG3IIRhXBOY0bT7JTOR
        AybphjIraoqbuxIXusgI+OL+rfZfeLPkag==
X-Google-Smtp-Source: ABdhPJxVIJwf4PaVb+OjoaoO13c3rxJbyPCkvFJ5alH8fTYRmZqLMLYWqsjVJK6OqX47ot0pXvxvaw==
X-Received: by 2002:a1c:1fc4:: with SMTP id f187mr12083881wmf.107.1606737830193;
        Mon, 30 Nov 2020 04:03:50 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:a9e1:bc04:469:f21b? ([2a01:e34:ed2f:f020:a9e1:bc04:469:f21b])
        by smtp.googlemail.com with ESMTPSA id y6sm6956342wmg.39.2020.11.30.04.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 04:03:49 -0800 (PST)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Do not use interrupts for
 normal operation
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20201126220923.3107213-1-niklas.soderlund+renesas@ragnatech.se>
 <601e00a8-12ba-da54-224f-89c448d755dc@linaro.org>
 <20201130114917.GE3323880@oden.dyn.berto.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <96a5db0a-a01d-f103-6b95-d645506cc711@linaro.org>
Date:   Mon, 30 Nov 2020 13:03:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130114917.GE3323880@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/11/2020 12:49, Niklas Söderlund wrote:
> Hi Daniel,
> 
> Thanks for your comments.
> 
> On 2020-11-30 09:15:00 +0100, Daniel Lezcano wrote:
>> On 26/11/2020 23:09, Niklas Söderlund wrote:
>>> Remove the usage of interrupts for the normal temperature operation and
>>> depend on the polling performed by the thermal core. This is done to
>>> prepare to use the interrupts as they are intended to trigger once
>>> specific trip points are passed and not to react to temperature changes
>>> in the normal operational range.
>>
>> I'm not sure to understand the change. Is it not more interesting to
>> have the polling mode disabled for PM reasons and let the interrupt to
>> fire at the first trip point so the mitigation happens then with the
>> polling passive ?
> 
> I agree and this is one of two goals I have with this change, in the 
> long run. The other is to be able support SoC models where the 
> interrupts may not be accessible.
> 
> The change in this patch is to stop using the interrupts to fire as soon 
> as the temp moves +/- 1 degree C, see rcar_gen3_thermal_update_range().  
> When I wrote that code I had misunderstood how things should be done and 
> thought I should use the interrupts as a substitute to the polling done 
> by the core and generate a THERMAL_EVENT_UNSPECIFIED as soon as the temp 
> changed, see rcar_gen3_thermal_irq().
> 
> The way I understand it today is that I should instead setup the 
> interrupts to fire if the temp moves over a trip point, in my case 
> described in DT to allow the system to be informed of this as you 
> describe above.
> 
> In this firs change I'm simply removing my incorrect usage of interrupts 
> that I in future changes will add back in an correct usage pattern while 
> at the same time making interrupts optional to support SoCs where the 
> may not be available.
> 
> Does this make sens or have I got the idea wrong?

Ah, ok. I understand better now, thanks for the clarification.

The interrupt mode implementation is wrong, so you remove it and switch
to the polling mode until the interrupt is re-implemented in the correct
way.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
