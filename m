Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A220F574041
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jul 2022 01:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiGMX4Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jul 2022 19:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiGMX4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jul 2022 19:56:23 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57B953D2A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 16:56:22 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id q14so92660iod.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 16:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rarUSimJ/mF7K9bs7wxGLHGhk7WrwOrmEcUJgpe0So4=;
        b=Xjafh2rCMqjqvg4Flqn/y5Es1fMG2tQTw6i/+6MTtWaHLJtknbNcB6olg2AjMN2ogy
         mhMd67IzAnbVqX4ZjklB8FvehIWINsuuLSgU1xXnnglK3Ah6YYTKPZoFIb2UqzUZnRw5
         LCXv41FJtN3tjoCeTTCi6ttIM5jaT7OuqmIe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rarUSimJ/mF7K9bs7wxGLHGhk7WrwOrmEcUJgpe0So4=;
        b=zJlfK6DQwRGLu87Y1sqxVt/+k2XdvIbzFCdGrhc8Slh8B7RbG2g1IAk9xjvTeMJths
         naAp1Xe4k6vmk0tFdgvow3+nsDDqoUAlKmzK7QzG2y4Q3XCYjtRCVCwsxwNL4dwloCfl
         8ZjMsFL3+Yt6kQ/6TDAysnZuNt7l+ktlXUuTDxBCst3IoX/PHX2OgLaMq8rc9LF4ySrR
         dVNYJpn8+iOySyp0uV17DNbgx6c1UK2y3+Kks9lpTxmdxq3WoPnsP24+pt4JhkClu39H
         FgeLDKA2KMEGGZj2lhev0ip4xpCTdt2p6ZguDikXSbZkU1fDtvXDybga1U+H/rJIDfBo
         dm+A==
X-Gm-Message-State: AJIora9WZztkfn5ma9v4epLpScYn8ZEV+nKvC2eEfsd7jpZwDCSjSu58
        D9jK0506lkJ7afdqwhPwZJKGSQ==
X-Google-Smtp-Source: AGRyM1vG6hbHN5JsMKBeeBd/CGfxpiHFcReOPVuojm+Qcl6rCFmIIiHk7QZc55gzMegVelUiiW4yxw==
X-Received: by 2002:a05:6638:d0f:b0:33c:cab4:e9c2 with SMTP id q15-20020a0566380d0f00b0033ccab4e9c2mr3452706jaj.226.1657756582162;
        Wed, 13 Jul 2022 16:56:22 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x6-20020a056638034600b0033ea1d9858bsm79328jap.36.2022.07.13.16.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 16:56:21 -0700 (PDT)
Subject: Re: [PATCH 0/9] selftests: timers: fixes and improvements
To:     John Stultz <jstultz@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220713204623.5443-1-wsa+renesas@sang-engineering.com>
 <CANDhNCp3KhGjXSrS4xmqrdPJfxStZOOn+FQxJEEoiXZ39CxDpg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dbe428f6-37fd-cba7-2947-e042585d3a42@linuxfoundation.org>
Date:   Wed, 13 Jul 2022 17:56:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANDhNCp3KhGjXSrS4xmqrdPJfxStZOOn+FQxJEEoiXZ39CxDpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/13/22 3:02 PM, John Stultz wrote:
> On Wed, Jul 13, 2022 at 1:46 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> The timer selftests are quite useful for me when enabling timers on new
>> SoCs, e.g. like now with the CMT timer on a Renesas R-Car S4-8. During
>> development, I needed these fixes and additions to make full use of
>> the tests. I think they make all sense upstream, so here they are.
>>
>> Patches are based on v5.19-rc1. Looking forward to comments.
>>
> 
> Hey!
>    Thanks so much I really appreciate the effort to make and send out
> these cleanups. From the initial skim it all looks great (though, some
> are slightly embarrassing :), and I think some of the extra config
> args will be quite nice for others to use as well.
> 
> Acked-by: John Stultz <jstultz@google.com>
> 
> Thanks so much for submitting these.
> -john
> 

Thank you both. I can queue these for 5.20-rc1

Wolfram, are you going to send v2 to address John's comment on
8/9?

thanks,
-- Shuah
