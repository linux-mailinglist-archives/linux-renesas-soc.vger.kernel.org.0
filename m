Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4636C9EA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbjC0Ixk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 04:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjC0IxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:53:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0258883DB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:49:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h25so10323974lfv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1679906941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0OZ9R2vraHOOEFqJ3sf/g9tKIkB3HpI+YtgXcUzlZto=;
        b=AmLxEE3WjRyAsk14UpCcPXQz79LFmXZ3zXDrP4E82oa5lYwtVx2p3YdSYNRD3FhgxP
         Dr3LFMFc2Kna1kJkOtqojxVCr4JAJHZvFhvqd/0hgB9+1tWcnNW0qUeDh2IIeyGA/VOp
         BUSflpb2uEveAYH+g1xH+Klf4PgBlVJ33rpoF5IQPWhCuIVF6x/8C/uq5sB9QIJ8QkAQ
         MiISKy4HP5tJg4x20+PYFX/YV5rxA1XL7hSefr0xXk8iijKPMI9gLna0paJ+POfhsItU
         QltRqne4QZ2/CjTZXSihkHJytvsTdEJDWS9KIjTh6pYHAt6io3sSr2age3e3y04+KVLR
         0Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OZ9R2vraHOOEFqJ3sf/g9tKIkB3HpI+YtgXcUzlZto=;
        b=fOoFNnvui/YjmqQNofccJhFM3GaSU4mcCRxcp59XsAUnKV2myi7INUxUGxby937HuI
         ZmHRFdAtwh0l+rcqNaZSon5wUbCkAfPwUWUMW7hedZVeu/12g0jGJ+QaqOmTHrNep72Y
         zMaWiYqEhcdpEHFkM99ccQftCvfp35I5l/spNxDA6rCifMl/g5SnTD+sBf7A0eh8DGjp
         nvcW/2GdAkMhcNtBGtu05yE7BR9a+UgRdeNmz/BoCpytauM6NSvOnG/UrleQ4y+lptsI
         rB98/WAzRjid/a+X7OYDFtKpSqddKKlN5K7FBjMuC5ZVUnlcQoE5DQI+Bl8uC77DpSTi
         i4Sg==
X-Gm-Message-State: AAQBX9fZS3X+vLlyirhRn5ByHe/E6UNr1wrYIlfW1/17hlAU/ZG+O2fj
        EZv4xN5E5JBa011egG1h3TauHrsSK7GzUZbcZKI=
X-Google-Smtp-Source: AKy350b55GpfF768xBnrj3D4dEEHzIuArdMcrHHWJXHeCGeoPhkANvrm0NiDA/bSHE/FteTVyojdAQ==
X-Received: by 2002:a05:6512:38a9:b0:4b5:7a91:70f5 with SMTP id o9-20020a05651238a900b004b57a9170f5mr3543963lft.63.1679906941368;
        Mon, 27 Mar 2023 01:49:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id u4-20020ac251c4000000b004db1a7e6decsm4581248lfm.205.2023.03.27.01.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:49:01 -0700 (PDT)
Date:   Mon, 27 Mar 2023 10:49:00 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 050/117] media: rcar-csi2: Convert to platform remove
 callback returning void
Message-ID: <ZCFYfD5MUHCPCchu@oden.dyn.berto.se>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-53-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326143224.572654-53-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-03-26 16:31:17 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> index 174aa6176f54..1632c9a53ac4 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> @@ -1574,7 +1574,7 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int rcsi2_remove(struct platform_device *pdev)
> +static void rcsi2_remove(struct platform_device *pdev)
>  {
>  	struct rcar_csi2 *priv = platform_get_drvdata(pdev);
>  
> @@ -1585,12 +1585,10 @@ static int rcsi2_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  
>  	mutex_destroy(&priv->lock);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver rcar_csi2_pdrv = {
> -	.remove	= rcsi2_remove,
> +	.remove_new = rcsi2_remove,
>  	.probe	= rcsi2_probe,
>  	.driver	= {
>  		.name	= "rcar-csi2",
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund
