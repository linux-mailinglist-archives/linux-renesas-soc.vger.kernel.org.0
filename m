Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76766267A23
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Sep 2020 13:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgILLs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Sep 2020 07:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgILLsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Sep 2020 07:48:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E0EC061573
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2020 04:48:51 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b12so8508327lfp.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2020 04:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yXOCCpNWnYNhrtBcboHWjWVZ1iLLc2hQ5SbuPY49SDY=;
        b=YUtWRiFjxCOeyXvxZAtLDqAxRKO8tKdbvmYZrpAIzlC75SZWcewEN01+NyruLR9pnR
         oPmEfhhBOrSOP/qjzufqEY8l0w7BCecWJSCPppnC50YEh+qU29RHLbDf1Ctl9nFO8LNw
         us/mkFl5auzlBzX/gTLVGIxNi37oZSXdTl9drHaBbE5foknV9dMLqyFn3PKcvWmEUzS/
         PKYuxYs3Gil1w1oMsLd/u5EV1T6Ji8BBPlqMDzGVj52Q3Z1iHMO2rytuaOmJh5OsH67N
         e3Z27sBMYSTBiHn1A62Z9I0mnVYIcKuwv9n2kLFlfL39pIkllUDztcPzj78OizOtqp0Z
         wn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yXOCCpNWnYNhrtBcboHWjWVZ1iLLc2hQ5SbuPY49SDY=;
        b=jouE1kEF4TBGKdbHpZgmBRsJ0gOv3tvfOUIqVHDCFH7K8I3tn1YQXc1RZPkcBp8+I8
         Yz2SOpyskr/sz8ETcQIhRfSAJ2ZmG6oMX7ohHpxXIaGwW7Hx3IrWYLRZDLFaAku+UUch
         1zKJuRuVTCJjkSfQ0f2VksysTMDy4HLu4FWb1HnMaufR6mcCnRA0ucPX1XbrpnZvQ1BO
         w3AbO++cNucQtx6j0RLj0d5z5/FGS3cAmORXTC7gv5yRW4Zv//IbZ3EpcueB2FwWQcm9
         VsTDoAqSS4TaiwE0cqM5ODCHBM4s1wgj6x1R9VrYxzX/uKFinpkh716nBOCPR1ukRmLI
         VxAQ==
X-Gm-Message-State: AOAM530xll/gUUifI4OCkQBiQk0thMQUuZOdxWUHP6mLKhecVVs9/O2l
        YE1IAE9bGd+hGmXpwY+kBtXqkQ==
X-Google-Smtp-Source: ABdhPJw8WU1wUirZfE33ORUded0JSH6dX5y1CaoPL2/2fYcp1Cfo1wLIWl05+NMTVwt2d5BoWQ5y4Q==
X-Received: by 2002:a19:4a58:: with SMTP id x85mr2005854lfa.168.1599911329551;
        Sat, 12 Sep 2020 04:48:49 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a8sm1406879ljn.12.2020.09.12.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 04:48:48 -0700 (PDT)
Date:   Sat, 12 Sep 2020 13:48:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] media: rcar-vin: Kconfig: Update help description
 for VIDEO_RCAR_CSI2 config
Message-ID: <20200912114848.GB674140@oden.dyn.berto.se>
References: <20200911101422.20333-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200911101422.20333-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200911101422.20333-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your patch.

On 2020-09-11 11:14:21 +0100, Lad Prabhakar wrote:
> rcar-csi2 driver is also used on Renesas RZ/G2 SoC's, update the
> same to reflect the description for VIDEO_RCAR_CSI2 config.

The commit message in this and 2/2 are a bit inconsistent, how about 
something like this?

The rcar-csi2 driver also supports RZ/G2 SoC's, update the description 
to reflect this.

With the commit message fixed for both patches,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  drivers/media/platform/rcar-vin/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/Kconfig b/drivers/media/platform/rcar-vin/Kconfig
> index ca0d906dce2f..2669c13a0423 100644
> --- a/drivers/media/platform/rcar-vin/Kconfig
> +++ b/drivers/media/platform/rcar-vin/Kconfig
> @@ -9,7 +9,7 @@ config VIDEO_RCAR_CSI2
>  	select V4L2_FWNODE
>  	help
>  	  Support for Renesas R-Car MIPI CSI-2 receiver.
> -	  Supports R-Car Gen3 SoCs.
> +	  Supports R-Car Gen3 and RZ/G2 SoCs.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called rcar-csi2.
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
