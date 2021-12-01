Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9EE4646D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 06:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346764AbhLAFum (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 00:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhLAFul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 00:50:41 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B3EC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 21:47:21 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id h24so17132551pjq.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 21:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0vl8jGuk8ygZNQM1djzOjudjxdPLuZhCms74Az9Cu+M=;
        b=v3RFHVtvn0perQkUO+UmWVKZVlPAVyXKpInbMnCQC/w9SUaYDjGcaGNpkIm9Pn9MjM
         NSs7EHvIYgLeG+Vo8+Dx6Wl/pBvZwjFMpjw/n6kVimtbNqOamsf1ElNzfhxqPBKfM1ci
         Ov1onRhZGw/c/8mRdFTTDAZgY17ETwHeI2ucuhsttT97ejRlnflpAR9GyM/yuARKRyvd
         M62HqxYd0FrBMwqdeVZnRoKhiumOdhnCdKojp/z+7th/mo+ujrS5q7XNrPghcCNZiJla
         ucmwl96A3dGShIBRvxYgmhlVW7Mo/M5k9RROh2eKROuBcFeDjTueDPIlrN98Z0biK4SU
         EwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0vl8jGuk8ygZNQM1djzOjudjxdPLuZhCms74Az9Cu+M=;
        b=u7ivPM6yhFfnsJtyPBywVfFOrqnuOnwwxjnKYpbBTWlgyZDYCaS3o8iaIi0rmB0fgC
         vT4yI0drQ1Zn6iWbZreatAfIJOjWxHYIFU9pDFyoaWsvzkMlwH9MS5mCKs9WjzJPSDwB
         zZFeAsi/BSK/3KrxLXXulM1UG+OAGeA6K5XBVQ0sUPRtcDKu59deRrxfcWPa6UcYCsYS
         g+x3RKXznOLT9aQitO2M2D2yPhUyItOdm/wZNUsEM+CCyAH9apQTZ8D1ir58gOnCXg7c
         sHq3uJpHZlnnsI6rbRVISRLgDOK4IULFFnLUh5rk2kPXZ5ZE/ai2v7EL79x7XknsRJvM
         C5Jw==
X-Gm-Message-State: AOAM530Z+AhXCqqGv8tk+6Jep7xjg04r37/SJCttNpU0wbcxolDd9JJo
        NVE0ZxlPT08MizzP525S5vcjKC9HAWl0DLUx
X-Google-Smtp-Source: ABdhPJyjeePcUg3elGUeyHIY+xjbtAWuWlVjxEnXlkw/9J+Yz47E+OKGxm0xtGNZ7y02hgWbLjESXg==
X-Received: by 2002:a17:903:2305:b0:142:1bca:72eb with SMTP id d5-20020a170903230500b001421bca72ebmr4592242plh.67.1638337641073;
        Tue, 30 Nov 2021 21:47:21 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id h18sm24732193pfh.172.2021.11.30.21.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 21:47:20 -0800 (PST)
Message-ID: <1bbd5d73-ea67-e9f2-65d0-f0d5ff854838@igel.co.jp>
Date:   Wed, 1 Dec 2021 14:47:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Content-Language: en-US
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
 <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
 <YZZdjlzFPDCbAfQU@pendragon.ideasonboard.com>
 <6b27be2c-9b13-38ef-ca6a-77c986757386@igel.co.jp>
 <CAPj87rPjCtXLtsfh2V=rPo_tcAQC64cWJXu89qCNb+iQCi1Wag@mail.gmail.com>
From:   Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAPj87rPjCtXLtsfh2V=rPo_tcAQC64cWJXu89qCNb+iQCi1Wag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel-san,

On 2021/11/30 22:20, Daniel Stone wrote:
> On Tue, 30 Nov 2021 at 08:44, Esaki Tomohito <etom@igel.co.jp> wrote:
>> On 2021/11/18 23:05, Laurent Pinchart wrote:
>>> On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
>>>> Laurent's concern is that the DRM core should handle this rather than
>>>> open-coding in every driver, which I agree with. Some drivers (e.g.
>>>> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
>>>> magic inference of the actual layout of the underlying buffer.
>>>> However, these drivers are legacy and we do not accept any new
>>>> addition of inferring layout without modifiers.
>>>>
>>>> I think the best way forward here is:
>>>>     - add a new mode_config.cannot_support_modifiers flag, and enable
>>>> this in radeon (plus any other drivers in the same boat)
>>>
>>> Is there an easy way to identify the drivers that need this ?
>>
>> Should I find a driver that has not use drm_plane_funcs?
> 
> I don't think there's a good way to systematically audit it. The only
> two I know are radeon (i.e. pre-amdgpu) and nouveau (pre-nv50), both
> of which pass no modifiers to drm_universal_plane_init(), but do have
> magic back channels to communicate tiling information. If anyone knows
> of any others, well, I guess we'll find out. :)
Thanks for the information.
I checked the driver code with the tiling keyword, and it seems that 
these are the only two drivers that require cannot_support_modifiers.
I will start creating patches for these two drivers first.

-- 
Best Regards
Tomohito Esaki
