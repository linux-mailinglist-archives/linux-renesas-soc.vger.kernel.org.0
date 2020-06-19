Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD57200A6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 15:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgFSNlf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbgFSNld (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 09:41:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CFAC0613EE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 06:41:33 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so11529889ljv.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0kfiprTxlQMET0aohY6CHO3ZmdD0jejABT0PH5mAi/Q=;
        b=EAza6L48w9+SNbvVEP0eEozOKI5N1A+Co/IBc8tRmMIgoSCTFMGDSP7/oIB+O2MHYW
         assCCPO4hfdYV0Ze5OlMUdb273rPm8Fq+kxz5IgRdGLu1up4Mfr6YhpoBN5ap5vZPWkx
         8aDMNIAF+S1xF7WXfr7/jMkdLf5+A6nMLsvX0SNi4zOkHPZFMFAm/yUR4msTWopzjJCB
         qUh7UktR2gAKsGfEJcUie55XnKd2sIRMMlQ+qvEI7v3IxyatnepPSIkCLkInyHk4m/4Z
         31RLh9OA1m9dmgBz9/O6yWwOfD40qovV3gjIm9KbQ97KM6HXJBN3e/QyhbygGxeKE27K
         U4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0kfiprTxlQMET0aohY6CHO3ZmdD0jejABT0PH5mAi/Q=;
        b=qHPYO1QCGzhZKOZT0yqlOOkAomb/Mu+qTV8aJUaK5q//0UAFfTsTSPuzKEzzuqpwV1
         BrhqPp8CI5Gr7TsFr7aAldOv7Zqtx2LTy8ZaM4t6zDs0RorZ+iI08BBtZ0iCnwVAL0vj
         lDEnfWPlm9kc++A9XTQS8Eh8UFlUpO/1/ELiefL1+TbLpqqocFIKB07i42du1GDPwihT
         28CTWsPkdXdqpc4Q4HlLZ0iiRzRtiHX3EjNRdO6NP8/8Dey7lzeXP5vE8NQfpYgl8kcu
         lgjJst7gQl/WzjBLV+ASFCc1hd40OwvjUZ4+Cy223Cuzr8LG0+9ggrKnrOop7rFJXQ6E
         4p0g==
X-Gm-Message-State: AOAM532DcSq7ZBYA++DqcgOd3rh66LiZ6Oshq1pqvayZ0qxjLq/WZkx9
        lJQ8UCRT23+WhfVBrCAoo8C9t3MBNyNiig==
X-Google-Smtp-Source: ABdhPJxnmszfRP4BClRPvSzMiOpj7oIM647dZLiP0cGAkcAAwikq/uA+QtkCQal5+K2WmjHVy9EE8w==
X-Received: by 2002:a2e:9246:: with SMTP id v6mr1952220ljg.47.1592574091342;
        Fri, 19 Jun 2020 06:41:31 -0700 (PDT)
Received: from [192.168.1.100] ([213.87.147.213])
        by smtp.gmail.com with ESMTPSA id u6sm1179747ljk.109.2020.06.19.06.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 06:41:30 -0700 (PDT)
Subject: Re: [PATCH/RFC v2 2/2] mmc: core: Call mmc_power_off_nofity() if
 pm_suspend_via_firmware()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592566143-4546-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3d91f688-d79a-7d50-a9ac-e08ea2d0cd31@cogentembedded.com>
Date:   Fri, 19 Jun 2020 16:41:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592566143-4546-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 19.06.2020 14:29, Yoshihiro Shimoda wrote:

> If pm_suspend_via_firmware() returns true, the system will be able
> to cut both vcc and vccq in the suspend. So, call
> mmc_power_off_nofity() if pm_suspend_via_firmware() returns true.

    mmc_poweroff_notify()? :-)

> Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE caps
> because the mmc_select_voltage() checks the caps when attaches
> a mmc/sd.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/mmc/core/mmc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 4203303..81941fd 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
[...]
> @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>   		goto out;
>   
>   	if (mmc_can_poweroff_notify(host->card) &&
> -		((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
> +	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> +	     pm_suspend_via_firmware()))
>   		err = mmc_poweroff_notify(host->card, notify_type);
>   	else if (mmc_can_sleep(host->card))
>   		err = mmc_sleep(host);
> 

MBR, Sergei
