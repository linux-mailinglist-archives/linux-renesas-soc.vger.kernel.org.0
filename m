Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A7C2B04A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 13:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgKLMCT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Nov 2020 07:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgKLMCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 07:02:04 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED13DC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 04:02:03 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id a9so7001989lfh.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=14Jg7fRrUNjbh+scNrkVvkCbyMn1CNVg4Z+2y6X2BtY=;
        b=t5Ae5vgEMQ6JnmH2rCQUblx68b3fBE7apqv1Mnw8O7XZ4FPZZT7rqrPnLNykqzkJG9
         EndUEdWLmyee+ezylrBTb9T52dp2kSeyRvbAjD7qq6VhMNdXu4eAMbpkVYArAaoAbSmJ
         di5S1oWaBR0SaywJlREGohzhZAEzbe2gluBsxGURVmwW1R6dad9+dIZjwmokn22lBj+H
         mdkbs5ZafQXrUi4pv5iXm6TXhQOTqQddM7tMbzIDmgEEJojARMABnafF4tAiizdKeh8q
         iwJo/ttrCktjf7JjQFeeB00B8SEXntjfkGRspjuVGDsYlGSTmlqtx5ZCcs/mMRKprDs3
         +HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=14Jg7fRrUNjbh+scNrkVvkCbyMn1CNVg4Z+2y6X2BtY=;
        b=JddD+UPMiyegdR48hn2q9TWcJmOxg0aiY4LuLrLVcdjGCEPGtc2lAYhV9lAYEM32Nb
         MGhUu9PICJluuJHSFghX3+KGuTEoPyyCMPLDz9GS7967QN8c/Kz0CV18Ns1oabbA+1l3
         ty7UBD/+vN6BPlWvs4kYDtplcndusbUCPP3jjP70PHWWVWKw8xX0QpxMeuFos0rr9hq9
         USWMzTyaPYgz/o7wYNK3MOtkIc9kPcLAKSNqFnYP11rXL20MvRS2FSvASDuJssorAqus
         yUWF+BqCy2cewk/ofBHTzPhMI5I817N4nYaf90DUKu+SQcMtRBLdtEA5yAsAGmqH2Dn1
         mC8g==
X-Gm-Message-State: AOAM531iZg7QyJGEUetRufokTE2VGJtGBEdEMIHzu99GRB19rNGFBCRk
        hLpSfoj2CboIwgHVyjdbeORX4A==
X-Google-Smtp-Source: ABdhPJz1mpmGtDKnFxBpeMtCpHVKA1s6nzVg/BcEYmJvQoGAzlRaLjD7u//vdhJNVRxj+W8qze7/Ig==
X-Received: by 2002:a19:85c6:: with SMTP id h189mr7077308lfd.451.1605182522412;
        Thu, 12 Nov 2020 04:02:02 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g6sm533483lfb.291.2020.11.12.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 04:02:01 -0800 (PST)
Date:   Thu, 12 Nov 2020 13:02:00 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: refactor SCC reset
Message-ID: <20201112120200.GA1491229@oden.dyn.berto.se>
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-10 17:21:48 +0100, Wolfram Sang wrote:
> So, after some preparations, we can take the next step and improve
> resetting the SCC. Patch #1 is a fix requested by the BSP team to be
> more robust in case the firmware did something unexpected before.
> Patches #2 and #3 are cleanups made possible after patch #1.
> 
> Patches have been tested on a Renesas Salvator-XS (R-Car M3-N) and a
> Renesas Lager (R-Car H2) board.
> 
> A note to Shimoda-san: I did not forget that the BSP team also suggested
> to use the SRCR3 register for a reset in probe(). However, it appears
> there is more to discuss there. This is why I decided to send out this
> series first because we want to have it anyhow. I'll send the SRCR3
> RFC-patch later this week.
> 
> This series depends on the just sent out series "[RFC PATCH 0/4] mmc:
> renesas_sdhi: reset SCC only when available". A branch (with some more
> extras) can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tap_en_v2

For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> All the best,
> 
>    Wolfram
> 
> 
> Wolfram Sang (3):
>   mmc: renesas_sdhi: clear TAPEN when resetting, too
>   mmc: renesas_sdhi: merge the SCC reset functions
>   mmc: renesas_sdhi: remove superfluous SCLKEN
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
