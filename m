Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DFB444AB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 23:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhKCWNN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 18:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKCWNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 18:13:12 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4C5C06127A
        for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Nov 2021 15:10:35 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id j5so6245805lja.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Nov 2021 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UsCfBYu7z+7gkDbi0s3tsVmOnN1h1kMb4J1QB/JSShM=;
        b=fJQCs9Pez1zp/v9JqVjIysMjU0+l8yQqhwvW1rlP9qc0G0afp9n7yvZ0cvtoO0dEG0
         TcswYgEwjRDgIKIk6m9DGIfZHPRPMcFH+WZ8Z4JhUg6uT/DZOJAS7ryohwNbFo0ybIbw
         dR27+Dp+Q30nlaTOCFY/HAZF2/iXycae1AOfD3+ftwbqrq/SD3VCkm+ErkbBcNgYHKQF
         DIiRrbgUkYJj6hiheCvfdE13TioP6rd5IWHFfYc8nXzswPujenO/6Hc0jY8DnBb+Gby2
         i9iEHm2P34Dd2+h6s1SIYmbclwpYcxtdzeDqZ85c8OWHcmN5mFyzfaX+lTrWMazSBWEJ
         aBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UsCfBYu7z+7gkDbi0s3tsVmOnN1h1kMb4J1QB/JSShM=;
        b=We9VPx3dsRLd05BaDq7m+s+E6ALJ/OBl6Xoxa3sL9OoLUaaUM7qEgwiMTLAQy6HSFL
         EuiXKEJYw0Az7j+g8vVRTvRNYLSQfh/bx+ZI5t2aePabzzq11eRz5zGTR3yoYU9pmT+T
         nfFmrTak/8TV+o3dPzuEM8bGYTetJrduzVfqiwY5JlVmWGg9ClrME509sWGL+/tP+Ehg
         qk9RBMbfsEEJp0mPfJKM91c79e8aLwmZmQLFWVmoqFYMhzEjAQRIj704Q4aAj9TsHAQf
         lcv/YPKkAPU1Ac5vgjlwdHRhNVQaw/lT4nE+xWsqoN0/jPjP9PSYOq3PPraEOeFFZMk3
         Ukow==
X-Gm-Message-State: AOAM533wnMT8A4TYr+SXQ5JrsCzAtxA5LlvfeF4tyGiE+v7bY/2WSHWl
        CccknEOb1ojpnWYFPejfHWR7Hw==
X-Google-Smtp-Source: ABdhPJzjb+DqE/3XXshch5HN8NIR3mOTaFDdCKH5rg9vw+0ryVaQDIkGZtGjynzmLeXxpcmUh+HAtQ==
X-Received: by 2002:a2e:5453:: with SMTP id y19mr48651133ljd.495.1635977433687;
        Wed, 03 Nov 2021 15:10:33 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id y32sm285386lfa.171.2021.11.03.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 15:10:33 -0700 (PDT)
Date:   Wed, 3 Nov 2021 23:10:32 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: max9271: Fail loudly on bus read errors
Message-ID: <YYMI2K2VrHAmSRfk@oden.dyn.berto.se>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
 <20211103204654.223699-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211103204654.223699-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2021-11-03 21:46:53 +0100, Jacopo Mondi wrote:
> Read errors were silently going ignored. Fail louder to make sure such
> errors are visible.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9271.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index ff86c8c4ea61..aa9ab6831574 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -30,7 +30,7 @@ static int max9271_read(struct max9271_device *dev, u8 reg)
>  
>  	ret = i2c_smbus_read_byte_data(dev->client, reg);
>  	if (ret < 0)
> -		dev_dbg(&dev->client->dev,
> +		dev_err(&dev->client->dev,

This feels a bit illogical as all call sites handles the return code and 
acts accordingly. For some it's OK to fail and for others where it's not 
a dev_err() is reported, for example in max9271_verify_id().

Will this not log error messages in situations where there really is no 
error? Maybe dev_info() is a better choice if you want to increase 
verbosity?

>  			"%s: register 0x%02x read failed (%d)\n",
>  			__func__, reg, ret);
>  
> -- 
> 2.33.1
> 

-- 
Regards,
Niklas Söderlund
