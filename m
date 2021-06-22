Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AE83AFC0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 06:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFVEjL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 00:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhFVEjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 00:39:10 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B797BC061760
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 21:36:53 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id t32so4085428pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 21:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x0OTjMJvAfeLoTPBJP6etPppl+ZEtis/BAKC/ypcfLY=;
        b=hqIMgklIYCbPoWvruF1SrCXtAPkvGYkEupgh8pS1NnV5PeDpCRTcfzkzY9xGS0Vygu
         K+tgvDXKNAHeFAfW1sBafjWfoMfDv6TsKe9K0H7A8HvPnRWmqCVs0onai8+9LB/6swDW
         hbwl8fsX3/WkPm3C88BHOqOIJ6eKJS+cMadMtuy5JfKpPnuKSBpR2qQTtU8tRvrYoPPp
         K5uZZwfYEqCat/yfVM1RZHSLOaMpokZVmq2BI1oBpzcFsbYFpFvwjUQytpUnW71QlCb/
         n2Q4p8JfeUh5E6bG79LuVhinFhvpizZjkRbNJnzeJcj4Of9i/Lu7cN4kJMgBY8PzTi4x
         ueJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x0OTjMJvAfeLoTPBJP6etPppl+ZEtis/BAKC/ypcfLY=;
        b=WLVz1jYGMw//t07icndlONxG9SEiIN+yJgv3mqbP53aoPv2fFmc3LOgaygBtGLDShq
         TXzINIFKWouf9mMWQDJ6NCPauYBNXUcDMbo7tk2NkoMinjHfCs/Tk9qEmvvMUpWuzdYB
         TYjEb2t7QoxrNPk6KuuMBQMQK7CTZRHRl3uNe34k0tpJ7RKo8XWCe9X9Pb+Kj4cI5bM+
         AaRTDi72Y+IVwRPf65LTN0ZjygszNnmC9pW27FBFHaZYh2Bj5PvGjGaLMgxAyVuALNo6
         e802c+/cpTYryg0ZX7ySEB9Fesv7f0qP+y/UyKm35VCgXtIDebhiq/KqDci98CfhkDBQ
         HRpA==
X-Gm-Message-State: AOAM530pM4Iw/jLkXkmcCcZSIC3zdx5mMYkcsiZuGY9QxLq12iFSCwoP
        b3Pxz37eCgzWufBp+bZa+/rwwA==
X-Google-Smtp-Source: ABdhPJyVFgbiyVEtWiW2ogdgXBcuFbb6yQHmciWpvs/ERr+twW2fzx2afjd/q+TZIjHpTR95aay5eA==
X-Received: by 2002:a62:7b0b:0:b029:301:40a6:9e64 with SMTP id w11-20020a627b0b0000b029030140a69e64mr1707873pfc.33.1624336613115;
        Mon, 21 Jun 2021 21:36:53 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:5192:32ad:e5be:23cd? ([240b:10:c9a0:ca00:5192:32ad:e5be:23cd])
        by smtp.gmail.com with ESMTPSA id t13sm17084284pfh.97.2021.06.21.21.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 21:36:52 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>,
        Takanari Hayama <taki@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <20210621092454.jvdmelk2h427jn5v@gilmour>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <cc08f858-7440-05f9-0d10-243f5115d209@igel.co.jp>
Date:   Tue, 22 Jun 2021 13:36:48 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621092454.jvdmelk2h427jn5v@gilmour>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Maxime
Thank you for reply.

On 2021/06/21 18:24, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 21, 2021 at 09:10:19AM +0200, Thomas Zimmermann wrote:
>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:
>>> Virtual DRM splits the overlay planes of a display controller into multiple
>>> virtual devices to allow each plane to be accessed by each process.
>>>
>>> This makes it possible to overlay images output from multiple processes on a
>>> display. For example, one process displays the camera image without compositor
>>> while another process overlays the UI.
>>
>> I briefly looked over your patches. I didn't understand how this is
>> different to the functionality of a compositor? Shouldn't this be solved in
>> userspace?
> 
> I think there could be a bunch of use-cases for something that could
> "steal" a plane without the compositor knowing.
> 
> Something I'd really like to work at some point for example is that the
> downstream RaspberryPi display driver has a visual clue when it's
> running too hot or is in over-current.
> 
> I don't think this is the right solution though. The DT binding makes it
> far too static, and if there's a compositor I'd assume it would want to
> know about it somehow (at least if it's from the userspace) ?
> 

I will reconsider the DT bindings.

We want to separate the resources from the master in units of planes,
so we proposed virtual DRM.
By separating the plane from the master and making it appear as
a virtual DRM devicein userland, the plane can be accessed from
userland using the general DRM API.
What do you think about this idea?

Best Regards
Tomohito Esaki
