Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775CE416F5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 11:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245404AbhIXJp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 05:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245297AbhIXJps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 05:45:48 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14E7C0613D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 02:43:59 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so38034048lfu.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4gC2MA1kaMM1U9IpPCmK8iL7sHRAzGczxEav4KBXmlg=;
        b=wx9RrcuEoObEevTHeX+zAy5eWZlSts/ilq9UQKzeEE0dgRMf2gNPzyh7eTSEkcLQ0z
         QmVjMGzn4btdg4LJd11HDTj1n5kv7t7upBG/NsHatsWBimUFkP+4xW+svXV1egWAk6ic
         Jr4t0ZwOitWcfCMGMajLfPPeGZIslyywMNWw4AVFBZ4LD8NV1sRCw6xYCvjNtqQnB6ml
         PiOSzneKtaajrpYYS+fD8CGqy2u9fRUZIjcTFbfO9fuzLc4RzHaOHGByovC8sUNPlWXw
         osaMYUgCjrOJY09dRrjamHNBtQ8zOZFDBEO+ZTlCNfwyzD6RDUP0kVMAY1JqVlKZZ/7b
         w0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4gC2MA1kaMM1U9IpPCmK8iL7sHRAzGczxEav4KBXmlg=;
        b=oN6y9zNuAtUPg7W8hqdPyiyTOBqNTB3B91Ct8JDSPtzN/ToW6Nxl0jorS7MkkhzE3u
         Hy0+AZ4eFwLGq0y4i5I/sm7M2iTJUJXVfPnyfc2btMVg5prsfBxf8vAiUsbhYtzid12E
         wA4q8SZ9r8sHATYvo/KCjWTncyrRquDC1AHImk52NGK0/cG0VrpUdnyvo74jDcTuEuSk
         22m+IqKgJngoe3DJCW2yFvRXTCRWfcbsmmTcCLoyhIQVBsN0rlEFwVvofiU4GP+n55pO
         AYaSt2dXrZ3smdkiNyrbvei8u4bWIofSHySgEZpJBRDGSSubdxBm591qwmGei//HTqFG
         5IQQ==
X-Gm-Message-State: AOAM532vvWfiqeJ4tScQ/lgZz1JlwlMUOw7sm1xmgagKblkAPoY+tYDd
        hP72ylm4sFyavWSI8lIkLyb2aQ==
X-Google-Smtp-Source: ABdhPJyQhXCTUlC+4LY0eq44s/Z+Q4swG0TDMT2NhkxrM7M5GF20e93zcFHPufHWo2hngq3plLCGMA==
X-Received: by 2002:a05:6512:3f16:: with SMTP id y22mr948743lfa.499.1632476638179;
        Fri, 24 Sep 2021 02:43:58 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id q5sm702069lfo.225.2021.09.24.02.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 02:43:57 -0700 (PDT)
Date:   Fri, 24 Sep 2021 11:43:57 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] media: rcar-csi2: fix R8A77980 support
Message-ID: <YU2d3Qlh/qExaRBD@oden.dyn.berto.se>
References: <20210924090244.3459-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924090244.3459-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Nikita and Vladimir,

Thanks for your work.

On 2021-09-24 12:02:45 +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Add missing initialization of num_channels field.

The num_channels field is intentionally left out here, and therefore 
initialized to 0.

The reason for this is that tho even if the VCDT and VCDT2 register 
exists on V3H the datasheet states that the value written to them should 
always be 0. As the only usage of num_channels is to create the content 
to write to these registers in rcsi2_start_receiver() setting it to 0 
does the correct thing for V3H.

Nacked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Fixes: 3ba37c2bcb0c ("media: rcar-csi2: add R8A77980 support")
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff039688..f4d3c6dead30 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1146,6 +1146,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
>  	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
>  	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
>  	.csi0clkfreqrange = 0x20,
> +	.num_channels = 4,
>  	.clear_ulps = true,
>  };
>  
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
