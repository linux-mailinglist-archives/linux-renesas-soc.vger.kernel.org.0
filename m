Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03017339017
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 15:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCLOc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 09:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhCLOcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 09:32:42 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7454DC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 06:32:42 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 16so6998988ljc.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 06:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q0omkYP7yG67zQSjEjr3Y2MzLXFPA2MNB5ctC+j2FqA=;
        b=I1DHS3eKfnG+6OrZdchguoW6M8Gpu68um0ifYzT3Fj+wExjfKYhtBIFYB3RZVPiqpD
         XYZjX3vLQib4DAXDhJwpRSv/FC70No+m+IBgDkTycFftTKe/IcwQ1IaLEbuQOdW1JK36
         Qy0lOHYcfmEttajCMaaJMn7HOlXJBbnuOOOzWsLDs8/kLq/Gsy2CAtfkdYo75YP9EWjg
         Bvt2gO8yUa7WkYoxGDSemQNmD2pjN1Ha9AisWzPs853d249oaqWoTXlcHhzK4ifcpQUA
         L0rLI9CFRuLXTBzMQW78VPV4bpT51RELmCdCBabGP4NgCHtQeuKXenjRS3AS8s/F//OB
         OtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q0omkYP7yG67zQSjEjr3Y2MzLXFPA2MNB5ctC+j2FqA=;
        b=kWYDvyZQ4X6fPSWdKtOpAPiuSg9pW5Q2WE+JHlAyOXYA/9HqhaOTYxEvPfUYAdWehZ
         3C82dAlxDJSoPH+r769MQMO+2hHvE/E2xwovymA+mvdwdl6GHWwqCm/NLjBP1WABRaXC
         w4DdSflcGaGov68Bbh4aUWYRb45sC6oTso+vxI5CquZEXCOf/wzIzdeEjfrsXTin9OLd
         g5V79T/SmcZ/eU0QV3Uxo6ELFyshrawj0y4rMGGnsfG0kdL1hKphbu093ub9nLGJD6rV
         3BgXC6M1jb2Lws4V/7GEnYq8zuZQamLUmVkyLdrt1zIRfDqc40Frl0Tqi0tgfmkA2oqZ
         FYlA==
X-Gm-Message-State: AOAM530xbR8P1XzYz+voutHaYOtnlz54kcmspFNoAr1agjaogfjZhe55
        LfMjSwPZJTqPt5Evz5Qw2k0REg==
X-Google-Smtp-Source: ABdhPJxm3w+Bpxh7KgCqhTD2PGG05cWFmxEWYuHMei/PEyLn7duIp9Q+WjbjPFBZzie9z85LMJAB+g==
X-Received: by 2002:a05:651c:118b:: with SMTP id w11mr2523275ljo.223.1615559560499;
        Fri, 12 Mar 2021 06:32:40 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e20sm1740436lfc.20.2021.03.12.06.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:32:39 -0800 (PST)
Date:   Fri, 12 Mar 2021 15:32:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-fwnode: Simplify
 v4l2_async_notifier_parse_fwnode_endpoints()
Message-ID: <YEt7h+HYtPD7J5ds@oden.dyn.berto.se>
References: <20210310153743.3556385-1-niklas.soderlund+renesas@ragnatech.se>
 <20210311115127.GR3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311115127.GR3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sakari,

Thanks for your feedback.

On 2021-03-11 13:51:27 +0200, Sakari Ailus wrote:
> Hi Niklas,
> 
> On Wed, Mar 10, 2021 at 04:37:43PM +0100, Niklas S�derlund wrote:
> > There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
> > since [1], v4l2_async_notifier_parse_fwnode_endpoints(). Merge the two
> > and remove some dead code.
> > 
> > 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> This and the rcar-vin patch no longer apply after my patches related to
> V4L2 async. Could you rebase these on them? I've pushed them to the master
> branch in my V4L2 git tree.

I will rebase and resend those two.

A heads up, your branch fails to compile for me so I had to locally drop 
'v4l: async, fwnode: Improve module organisation' while testing. I will 
reply to your series with more detailed feedback.

> 
> Thanks.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Regards,
Niklas S�derlund
