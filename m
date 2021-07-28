Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784E03D94EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 20:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhG1SEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 14:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhG1SEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 14:04:21 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D485DC0613C1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jul 2021 11:04:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n6so4099630ljp.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jul 2021 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NyjXnatgkTBgq60DQMkaTQd5V7UY5VVtd8DzIt1IY0c=;
        b=toYYXJZ4WsWDJbYFefZMpEQwtwuiZ9kAw9wdx2uAwfs2He0X7+H84YAwmBxzmWE5D3
         jtee+sePsusTzn+XVPlUJf7WIsv4+6OfRNup6mkXRi7p4uqz6Ago8hzxgO0LFD0a4Z1c
         wd1VDyu0S+HpXQRJ7l6HzESh0cjA7YYqgTQYcpXVkMxacv2UQlorU/j0EY5c2TsNyeFA
         VxIx7ESszhNS8bIoHeTditmCf2v9kxwMvB9NwuACYuiC7KQ9PfTV5CFeJyQfY3X2moMy
         qSZn/qMNPcZRi4EaSGAkIB/L1spqmPYK6KCVCoLstLaPYlRGfKg/AdhFhE9KciHymwn+
         Mfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NyjXnatgkTBgq60DQMkaTQd5V7UY5VVtd8DzIt1IY0c=;
        b=kX3VvtMmNBI+Bsgq8twQYCmRocFE9SsfO2oktJTtLMknF/vhcSV0doFSJm7snAE7g2
         qZDkVAxbYvZ+A9mTNrvh+NsAEodtOo4iMf2nBqyrdrKakjWF4mEAFt6s+jAPO9Bu95XV
         PDufqA8h44bgyfu5wUxPRtFzk7uz3KtWq5aFu5w/1gnBAh6fxwJjBuXYJBdo25UNR1ms
         wQdf1p7OsXT95THpaSnGlKbHOKgYUqdNiK02UHaf2e8EQ6MgvRT8mJDxCgoPEdMlz/WE
         +/1dKAnf7LCTJ05QyNDB/XC2eB4ucmNro/bnaL9gIIfe+mCcL2AWyLRZ7+/P/kj0hnhI
         ohXg==
X-Gm-Message-State: AOAM531B2Btf6kEpBkS1jRvnLmh76RMfUBO0g4WOmqccdFdOE7KbH2+Q
        g/smgYnOOgfSAjAV5mR1r0uvpA==
X-Google-Smtp-Source: ABdhPJz+1xGIVR3HtXEFxGoeP9429PUj1kdmbToG8lhEUGGoK4Qkq4rucPxnkjUkOXkoID5foazRgg==
X-Received: by 2002:a2e:8157:: with SMTP id t23mr586162ljg.311.1627495458090;
        Wed, 28 Jul 2021 11:04:18 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id d3sm63642lfv.68.2021.07.28.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:04:17 -0700 (PDT)
Date:   Wed, 28 Jul 2021 20:04:16 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YQGcICMpoG6ET2kE@oden.dyn.berto.se>
References: <20210722075727.806572-1-niklas.soderlund+renesas@ragnatech.se>
 <20210727131627.GI3@valkosipuli.retiisi.eu>
 <YQALXnYpM+4jdH5r@oden.dyn.berto.se>
 <20210727171821.GN3@valkosipuli.retiisi.eu>
 <YQBIpRdwwd5hnMU+@oden.dyn.berto.se>
 <20210728170337.GD3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210728170337.GD3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hej Sakari,

On 2021-07-28 20:03:37 +0300, Sakari Ailus wrote:
> Hej Niklas,
> 
> On Tue, Jul 27, 2021 at 07:55:49PM +0200, Niklas Söderlund wrote:
> ...
> > > > > > +static const struct v4l2_subdev_pad_ops risp_pad_ops = {
> > > > > > +	.set_fmt = risp_set_pad_format,
> > > > > > +	.get_fmt = risp_get_pad_format,
> > > > > 
> > > > > Maybe set link_validate to v4l2_subdev_link_validate_default?
> > > > 
> > > > I thought about that but with the multiplexed stream issue I thought it 
> > > > best to not to add that yet. Do you think this make sens?
> > > 
> > > What would be the alternative? Without that, there's no guarantee
> > > whatsoever what the input is. It may also enable writing user space that
> > > breaks after fixing this in the driver.
> > 
> > We still still don't have any guarantees whatsoever as we can only 
> > describe and validate one stream.
> > 
> > > 
> > > Where in the pipeline would you have multiple streams over a single data
> > > path?
> > 
> > On Gen3 platforms without an ISP we have it on the rcar-csi2 sink pad 
> > and on Gen3 platforms with an ISP we have it on the rcar-isp sink pad.  
> > In both cases it's the IP block that separates the CSI-2 buss to the 
> > different capture engines.
> 
> Ok. In this case the driver may be better merged to the staging tree or
> labelled experimental as its UAPI isn't stable. I wonder what Hans thinks.

Marking it experimental maybe a good idea or only allowing one stream on 
the CSI-2 bus. Then we could use v4l2_subdev_link_validate_default and 
validate the link pad format, I will do so in the next version.

> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Regards,
Niklas Söderlund
