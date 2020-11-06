Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643602A95E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 13:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgKFMCn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 07:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFMCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 07:02:43 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBDFC0613D2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2020 04:02:42 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 184so1569585lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2020 04:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b1F1LfKOfetg9uh623ybdvZExTlhcif78+Me0dvbVmY=;
        b=gcgXQGFgImykiGXTnDxK4yCNDWng9vdCZwbSPaLnilRudUvszC2MYCBGD35/iYwe9g
         c/+eka2kmiZrjSwP2HRaHqNB6u8RNWVsKP1aQYwGaCZdEIPCM9ioazF66PbTh0bVAm1R
         jTLoyUus0274jLH7+cv/busaLoWMcg/zUheTVoPMGA6gFWkSnEihzhYW1tQC9ubVf+/T
         hqiPudO6v8E+DNotZhpEgBNv8xI7+p6kFS0Fd2OcKa8gfbHG51TIK90WDkANpU57Lwmv
         OqZLnUg0mDkTPZlxHfBdFcYcAbCey9VCk4XRQBGjwGoYdgaKPOECR+JtEa4FfI8dHS2y
         zYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b1F1LfKOfetg9uh623ybdvZExTlhcif78+Me0dvbVmY=;
        b=lwgFmHsPzmyKBLdWqdy0nZfSf+pdSW80OSIwMXDhlGZX3jzspvHoJTxFc19j7pXkUy
         EWBM7oE6bBuINaj9YV/2p3rvPjrVHgBF8N2CncNn8ztyCt1VaiKYsIDJC4Bvj8Wjy0Ei
         MWTm7hwnqpALOzTN//VI5FRCWWLK+sT/yaZQrg50QlNLPaQqDYlbLakEm8L47c95XU8w
         qBMJQyXbrcSB7WewglBKDpHHC/1sSmwShdCSuBMTuejc2v/l1P+FLmRy9UqvILXVN4G1
         OWzreNnwOb0//IwXuFv8RRVPNSAjjct1YZzaf8AxxH5o8OkqDODZxRfhG6qJSxrbKWwb
         3CCA==
X-Gm-Message-State: AOAM5332b/Q3I2yhc+VG3c+ZMsxTfMPuFaQvh2t+h1HEj5Js33BShlNJ
        kQS0d+4R00demhOEClEvr6JVqa9LBAD56WGx
X-Google-Smtp-Source: ABdhPJyUOQ0GxTaLN0PaARCfu4d8zkY3zTd32wF26unwcrjW/Zbgmo8yDdCWdnrVPodg+a28cC7Y0w==
X-Received: by 2002:a05:6512:3af:: with SMTP id v15mr720205lfp.144.1604664160926;
        Fri, 06 Nov 2020 04:02:40 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u4sm120203lju.128.2020.11.06.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 04:02:40 -0800 (PST)
Date:   Fri, 6 Nov 2020 13:02:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Message-ID: <20201106120239.GB3195686@oden.dyn.berto.se>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-06 08:25:46 +0100, Wolfram Sang wrote:
> After some refactoring, I had to insert a workaround because a
> regression was discovered when re-inserting SD cards. Now, this series
> implements the proper fixes and finally reverts the workaround.

Nice.

> 
> This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
> were already discussed with Shimoda-san and the BSP team internally.
> However, I'd appreciate Shimoda-san's tags be given here to make sure
> the patches are exactly that what we discussed.
> 
> Thanks and happy hacking!

Tested on M3-N and for the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> 
> Wolfram Sang (3):
>   mmc: tmio: when resetting, reset DMA controller, too
>   mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
>   Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD
>     cards"
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
>  drivers/mmc/host/tmio_mmc_core.c     |  7 +++++--
>  2 files changed, 5 insertions(+), 15 deletions(-)
> 
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
