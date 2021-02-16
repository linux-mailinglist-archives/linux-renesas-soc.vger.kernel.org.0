Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EC831D263
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Feb 2021 22:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhBPV7B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Feb 2021 16:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhBPV7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Feb 2021 16:59:01 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE00C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 13:58:21 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id g6so15097465wrs.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 13:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Y8PhEDRJFabgroO3MiWECQoYfNp5qjkArQZ+cPes7gA=;
        b=NEhDhppgJeiOY/jWsZGE3Sh4usY6risEcLmyTq/43dummouNBcWsVL0zo6h/XkhW0q
         CtsagmFVyCJ8IFAngnmlicH/bN65wsSgxlmYzSMmZgV4sS9j3DpUZwLBsitQT40eg4VK
         ikJ3Sif2edCSzQFYc31P4Wkkphie9c4I102dvkIkSbITsVNlTlsjHvXTBoQsWDHNA+ao
         4Lgr0XQmxC3xEy068a0VeIRQ/gczJWDQx74i45t6PK2bEMTRzj5j1Ec0c/CESGStH9AV
         GE65M+8s3rko0E8kz/Z56slX/x7ehYurY/Sk4/ygscGUk2xnltCi2lJzZ7kH9Uczs+hd
         FZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y8PhEDRJFabgroO3MiWECQoYfNp5qjkArQZ+cPes7gA=;
        b=OEHCi/PWHqT37kHa4JIdG/hr3ybUkPMH9YSQYuPzz2771Rx8c54dtHVBMyK8YjRWT1
         BirLWm5FCnRGxKK+TAWOPN4lO9N8e2Ez0xpRIKq7L17cN3joKcGOV5HR/3xrZT1sZFIj
         6sFh4jP4x74hRRG5ytEbIv/aCazZ8jxc2J/6/P6rNZtvMvUrh1r20CAUyYDB5POiDxHM
         3YD1WBPyWXAAB9h8yPaD5OPa2FN+ig+hSk5eCwkqHIctD5mmCHxzWebQI3pFLWuf8XBR
         r32EYyzgkXcIoMc37excne4lLZvRwBlTqZPSSDWJYa2PimhLzVcJDQgx+NCYIv8X++iw
         PsYQ==
X-Gm-Message-State: AOAM530gS/3Z6grI1X7vzSO62jskIBOIu+VRzAtRVD3SjVEtAwZ/U+f3
        SpgEa4bFvzH7QYo8wL871wIhh+83+kpo2w==
X-Google-Smtp-Source: ABdhPJxESjEinyEBxuD0utrZV4vpuU4bS5vSeUIXzoJGUyYtieZ3PRqAhgQD8FOEl0za/k51LeOlFw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id l10mr25662456wry.368.1613512699724;
        Tue, 16 Feb 2021 13:58:19 -0800 (PST)
Received: from localhost (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.gmail.com with ESMTPSA id g15sm239020wrx.1.2021.02.16.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 13:58:19 -0800 (PST)
Date:   Tue, 16 Feb 2021 22:58:17 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFT only] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <YCw/+bp3sid7eKVN@bismarck.dyn.berto.se>
References: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-02-15 11:17:54 +0100, Wolfram Sang wrote:
> RPM handling has been improved twice since this comment, and also SCC
> handling has been improved a lot. Time to test if we the workaround can
> be removed!
> 
> Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I boot tested this on M3W, M3N, H3-ES2, H3-ES1 and Koelsch without any 
noticeable issues. It feels nice that we can get rid of this.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> I'd be very grateful if you guys could have this patch boot-tested with
> your boardfarms. If the failure is still there, then it used to hang
> when detecting the eMMC. Maybe these days eMMC will just not show up.
> But hopefully all is well now. This always was difficult to trigger, so
> a wide test coverage would be highly appreciated. It works for me(tm),
> but that is not enough here.
> 
>  drivers/mmc/host/tmio_mmc_core.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 49c2d406c48e..2478a91e84b2 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1160,15 +1160,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  				  mmc->caps & MMC_CAP_NEEDS_POLL ||
>  				  !mmc_card_is_removable(mmc));
>  
> -	/*
> -	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
> -	 * hotplug gets disabled. It seems RuntimePM related yet we need further
> -	 * research. Since we are planning a PM overhaul anyway, let's enforce
> -	 * for now the device being active by enabling native hotplug always.
> -	 */
> -	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
> -		_host->native_hotplug = true;
> -
>  	/*
>  	 * While using internal tmio hardware logic for card detection, we need
>  	 * to ensure it stays powered for it to work.
> -- 
> 2.30.0
> 

-- 
Regards,
Niklas Söderlund
