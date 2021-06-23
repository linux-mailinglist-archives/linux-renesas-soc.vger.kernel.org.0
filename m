Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18F53B15BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 10:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhFWIXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhFWIXq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 04:23:46 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3C1C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 01:21:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b3so781906plg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
        b=qyjoMEneFPyQG6FmpAm+blLv6qUuFnSfiHq9cwsD6vkL+N14a/IYUIUTUqOY2t15qU
         orTFA+SzPPKYQEg/vg6aUJWkEx4TNqvO2RtgVWJyvQui+pZ/TnKX2y/OlFv2vaDUb+hu
         VkuvJASiJfLUZ1yJJ2NAquzoKz2lDAduMIwIg8GEvgocPlEJinWAs1aMnQ9o5SDiwVWA
         Tb+Cfp7SYSHZRtDLkBPMD1NQlBDQEHQ3ig7VsNPKaUOn3isd1x2Ziyr37iLaozV2eDeS
         lGHyBldZdyHiqvHwnT6yiHmAVW525lIsaTkLsMit19GQWxbdY/vVswfJvppCEZBlKmwE
         JnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
        b=NYMZSSZ5/fAFVafxUTZ9kQl1s96Cgbqj0wf46+kuwHAsE8XQPN4jMDAB7MU8XPyYHI
         /xqDy2FxFjq5h6zx40MCFLxZkdtTRpPNtoJfn0RZa2VxAJ+3N54YQ7DLeyaeSb0K0sPQ
         HDtrmvxNgoM9ix2QfDgBxPwURfW8p18fbT5R+QuSOd9GPu8mLcnEcfCg1UeG/+xEVQ/R
         N9IiZiselmU1RGGMpCN64Iu7jYwwttxvh58v+Kr5qaGCZg1Cp0pL0OwlnOvY/uG7fE1S
         jzNQDfL1qbBmCxgjbMRT86+oJOkot3Pm/aKAx3AcmgDs5/iP0uGTdbF981dSjmm4BAJu
         MAOQ==
X-Gm-Message-State: AOAM530EzOUunRvgytUUSXOAG68wasGH1eXZbhWNvFV8lCHYp8MDmwwZ
        8zfVQ7pchoI8bZ6lDi5xtR+53w==
X-Google-Smtp-Source: ABdhPJyYaZ9+qPtqUGE0ix2e6z0tzu895F8iK8HYriQ9ex3rYbT2jDNvHbujgnZHhKfsy+6HIyxy5A==
X-Received: by 2002:a17:90a:4ec8:: with SMTP id v8mr8506910pjl.178.1624436487667;
        Wed, 23 Jun 2021 01:21:27 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:1102:c007:eee:4478? ([240b:10:c9a0:ca00:1102:c007:eee:4478])
        by smtp.gmail.com with ESMTPSA id d13sm1552726pfn.136.2021.06.23.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 01:21:26 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
 <20210622105757.2b9dec32@eldfell>
 <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <0fd18324-f396-ba76-1c8b-d048e5b72dca@igel.co.jp>
Date:   Wed, 23 Jun 2021 17:21:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 2021/06/23 17:04, Michel Dänzer wrote:
> On 2021-06-22 9:57 a.m., Pekka Paalanen wrote:
>> On Tue, 22 Jun 2021 13:02:59 +0900
>> Esaki Tomohito <etom@igel.co.jp> wrote:
>>
>>> Hi, Thomas
>>> Thank you for reply.
>>>
>>> On 2021/06/21 16:10, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:  
>>>>> Virtual DRM splits the overlay planes of a display controller into
>>>>> multiple
>>>>> virtual devices to allow each plane to be accessed by each process.
>>>>>
>>>>> This makes it possible to overlay images output from multiple
>>>>> processes on a
>>>>> display. For example, one process displays the camera image without
>>>>> compositor
>>>>> while another process overlays the UI.  
>>>>
>>>> I briefly looked over your patches. I didn't understand how this is
>>>> different to the functionality of a compositor? Shouldn't this be solved
>>>> in userspace?  
>>>
>>> I think when latency is important (e.g., AR, VR, for displaying camera
>>> images in IVI systems), there may be use cases where the compositor
>>> cannot be used.
>>
>> Hi,
>>
>>> Normally, when the image is passed through the compositor, it is
>>> displayed after 2 VSYNC at most, because the compositor combines the
>>> image with VSYNC synchronization.
>>
>> This is not a universal fact. You can write a Wayland compositor that
>> consistently reaches app-to-screen latency of less than one monitor
>> refresh cycle, while also using KMS planes.
>>
>> I believe Weston succeeds in this already if you write the Wayland
>> application accordingly.
> 
> For a specific example, https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620 allows app-to-screen latency as low as ~6 ms (including a fixed 2 ms buffer to avoid skipped frames). mutter doesn't use KMS planes yet, but if anything I'd expect that to help rather than hurt for latency (if the compositor doesn't need to draw anything).

Thank you for providing specific examples.

Best regards
Esaki
