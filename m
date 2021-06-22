Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2ED3AFB90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 06:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhFVEF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 00:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhFVEF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 00:05:59 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F389C06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 21:03:44 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a127so4829435pfa.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fDlc9TgaOD99jTxAWrDaocLPhWL0A0Lj9SHYh7Mvk9o=;
        b=o0yFPlq7pxYmbagKCCg+kimNiPNQn/TmmpLhgBCc4+gKAdI7guTaFh2HLcqRgOS+Y2
         N31G1dYSTwJFSZONsIs6aTmlvFyMWs7sUSs6w5r2lIeIl7U7eAi64P51JFyLNIVopMIe
         clgwoPZrwBAPqe177UXF7XDOkjJEPcpxs/DLMSjcqe+emsSTFic8ZBcNj2+ZCBmsRZSL
         pIaW4QYUGKMmZVLpKimMt2ZiXi24RBko8/fxW56iwZZhUKa4Z5Yz0RJB7pLrd6CGGysv
         4XFfuEt1cuayw5S6wYtqWNXLKq10QMJK/uZ2WyJulx4ckrvePNwDHZkP4e9ANEJGr9uu
         3nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fDlc9TgaOD99jTxAWrDaocLPhWL0A0Lj9SHYh7Mvk9o=;
        b=Nnl4ILMPemE73lgiFWXaemKRa/emPHBmvWCrmzvjt5g3+QxbgWL7O3hXRn8wXtW2Af
         3rKEhCp5FRNcxdrnpnkFUUeTpd9UQkfCVyg33/h8gLp7qUEB5A3xUuidq/gnc8ZPYwc+
         +YLUi5gXuPoyxsbHdxbtVTqOmg8YYatGi6IbPHb35cLlCHJKpi9nRrykpR7IdCv7fawD
         9MH86x4WrI0X+IFt7V7S757S5km7jKmaa5n9+B3MSsweR60XtDxaPR22nGZeR2zRImA1
         1Q/NYy5F15OQmGnw/DdV684ptzYAz3bBacavGU2ZnkqB8i0VPPeg1jKxupAcXHL7zIK6
         aeAQ==
X-Gm-Message-State: AOAM533rwiQqy2D7SMoPsGW+T3CBM3Fe/USslbZCnJM59EEh3FwVSi0+
        CPG5reHCxkzbJC/P2EzNoFuucQ==
X-Google-Smtp-Source: ABdhPJyDcxIlsiXjWflxT5mU0F4cuX1u87XCPF+dYg++suxUBJdfPBs1yWMuqJH0lAgAd7Abm8KHjA==
X-Received: by 2002:a62:b618:0:b029:2f9:f3b1:8afd with SMTP id j24-20020a62b6180000b02902f9f3b18afdmr1572467pff.81.1624334623646;
        Mon, 21 Jun 2021 21:03:43 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:5192:32ad:e5be:23cd? ([240b:10:c9a0:ca00:5192:32ad:e5be:23cd])
        by smtp.gmail.com with ESMTPSA id 20sm16946099pfi.170.2021.06.21.21.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 21:03:43 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
Date:   Tue, 22 Jun 2021 13:03:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Enrico Weigelt
Thank you for reply.

On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
> On 21.06.21 08:27, Tomohito Esaki wrote:
> 
> Hi,
> 
>> Virtual DRM splits the overlay planes of a display controller into multiple
>> virtual devices to allow each plane to be accessed by each process.
>>
>> This makes it possible to overlay images output from multiple processes on a
>> display. For example, one process displays the camera image without compositor
>> while another process overlays the UI.
> 
> Are you attempting to create an simple in-kernel compositor ?

I think the basic idea is the same as DRMlease.
We want to separate the resources from the master in units of planes,
so we proposed virtual DRM.
I think the advantage of vDRM is that you can use general DRM APIs
in userland.

> I don't think that's not the way to go, at least not by touching each
> single display driver, and not hardcoding the planes in DT.

Thank you for comment. I will reconsider about DT.

> What's the actual use case you're doing that for ? Why not using some
> userland compositor ?

I think when latency is important (e.g., AR, VR, for displaying camera
images in IVI systems), there may be use cases where the compositor
cannot be used.
Normally, when the image is passed through the compositor, it is
displayed after 2 VSYNC at most, because the compositor combines the
image with VSYNC synchronization. On the other hand, if we use vDRM, the
image will be displayed at the next VSYNC, so it will be displayed after
1 VSYNC at most.

Also, since the compositor is a single point of failure, we may not want
to make it dependent on it.

Best regards
Tomohito Esaki
