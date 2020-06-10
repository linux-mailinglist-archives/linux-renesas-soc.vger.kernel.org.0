Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8FE1F5814
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 17:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgFJPrj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 11:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728096AbgFJPri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 11:47:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D6DC03E96B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 08:47:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q19so3106372lji.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x5kqbLnke0T8OdTg7ovqN11fixyiEJS+wsZrUT0NKuw=;
        b=yRAuDn2RmfLWA3AS/2Z6VtyO5Q8yFeRgJC9Vp3uQ5LLmq/x97HP3LdENn80GmWib7v
         fuH8iTwQnB1RxV+7riEwlW3BthtuC+nC5nsse/RmEaxJRrKVWtWSimrfg5ekZni1CmIv
         75HNdwkh/Yl3vjqd9E+x4FO7qKoBRXw3REn2OqnVzTGj99JaWNbvAgS7JNYYaYOO0aZ/
         srIRUXVXTbjO9Q47itzVEgHpwQEzDdus0bmfzkp5Cb8KVyXbD2k8UTwrUW0p/G3wp97P
         o1z2IYJhxl1CVbIFUPQaPmfuQ/6shlw7SLlQGMDWslUNjhPDT8SvV0kh7vI0kObNLamp
         QMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x5kqbLnke0T8OdTg7ovqN11fixyiEJS+wsZrUT0NKuw=;
        b=Hm2nihmQatkZfD3tMygefQZ+l/XpwgDQ2j6SGV1WOflypt6ijO7W2G2di5nX+7oGnk
         gEBEiSfO53mcpF6P1qIUjb1LXiugXNnCZ8PqI6JKhwritp9UBFi2tjcVtIsl8WPEXWZT
         rXgu9RxAuTpgM/1A4PPp0KM+633/PXsx71wSH+zIA6FJPO1Zmhh1RjcuPpGwVKL3hnIy
         Gh60okByml0tNARJF7FFaMsad2OhIIWjyt547Ru3ebKt/F5tyffA1UzLHAfES58cKmIT
         iZEPsXPHEZThmwE0GJHUMOGMp+hB5yb5evCinOQcMbei/U/rWQI4i6nO0ZFUs431KAl4
         uuwA==
X-Gm-Message-State: AOAM5317ryTpL6wQOwjsmRSsZhacJbMFiJ4ooGy8xS02nHpokR+gW3b9
        8lX+gMI57ldDc5GZAiVetgYCD4Zdecg=
X-Google-Smtp-Source: ABdhPJwNzdL+MBwDiF8S0hvfcxWUMu97c493CaFV/3Hzbi3SQFw6lwXcaEcxmrA1dqsQsqBdEq1x9Q==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr1989519lja.373.1591804056925;
        Wed, 10 Jun 2020 08:47:36 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id h26sm30745lji.42.2020.06.10.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 08:47:35 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:47:35 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gmsl-yavta: Use UYVY8_1X16 format
Message-ID: <20200610154735.GK192296@oden.dyn.berto.se>
References: <20200610151228.23845-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610151228.23845-1-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2020-06-10 17:12:28 +0200, Jacopo Mondi wrote:
> Update the gmsl capture script to use the format required by the latest
> max9286 driver version.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

And applied.

> ---
>  gmsl-yavta.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
> index 0ec0560..6e15555 100755
> --- a/gmsl-yavta.sh
> +++ b/gmsl-yavta.sh
> @@ -16,7 +16,7 @@ function conf() {
>      IDX="$2"
>      VIN="$3"
> 
> -    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_2X8/1280x800 field:none]"
> +    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_1X16/1280x800 field:none]"
>      mc_set_link "$CSI" $IDX "$VIN" 1
>  }
> 
> --
> 2.27.0
> 

-- 
Regards,
Niklas Söderlund
