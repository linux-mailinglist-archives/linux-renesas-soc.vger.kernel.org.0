Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EE73E92EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 15:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhHKNqJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 09:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbhHKNqI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 09:46:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E359FC0613D5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 06:45:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w1so5650491lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GFsLrpkcVnHQAcI9LO6wyCFOtOWqn6o7HFSxtLHjjvU=;
        b=KCrGeOVEN0pWbe2RdBYdpRxYelobeG+W/B1dX6vvROlFe1zePluh6zndsGEXbiVQG+
         Yo/g/nuafosL4mPPipY0ghaubJLiZYIF6jPtgfuWZWJyALsWpG9BWsETK28WxOs/f0KK
         KcwGYYZFYAJC9ZvECQYupjVjq+ajk85A2Jtd862R3xxIbP+p7mPhpx8FPogLYdcNr+6+
         PZcHSDIlrMKgNH+/RsriCcomjD5z5oKnTG5rT65qjTfRLNh5dWboTr9Tim0opPLsf7Ud
         Ju68rI5iij5XNDJGKZdh5jXxoscX090Un1xDy5V2HSnKdzqD+vqi65BpHPtpAVRYPQUg
         u46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GFsLrpkcVnHQAcI9LO6wyCFOtOWqn6o7HFSxtLHjjvU=;
        b=SpVHZ86nIwnAGh3ZOehSlfIuWl4naVEqQz6OPu2KKDK9kYeubXCjIxV895W/o38KEA
         BUyoz7K9yCZGARPbawhp0KASecBpkq0csQR0j728W+wv59wfucd+AL09sZv3gZZwbmpJ
         hp+DomX3um8RJDGGDqKvEpx/DcvRkZsoFeBwi99fselHCtnif5MfFuh5cGI/rv7l2vpD
         frfqMjMNwPpg/60cffZQU7bj5CPqEN7paGlO9u0eqcC+GgUKX8PMYFaqIDMbNjbZ1eI+
         azsomaM1XLgPHzxjgtWewiwS/nQ8jmtXO7vpTgQKoMM2jiqYM8/1QsMRy6ZBt0DnT6eZ
         /XhA==
X-Gm-Message-State: AOAM531olL3OTsqKBQQE9ZaX5+CA0oF0+CB23nDJHPCVfkLi4VxALMow
        6OQZHRiSruwhn05gKo8PzJ193A==
X-Google-Smtp-Source: ABdhPJw5YOeH2Zsrla2DQrb6ly2OcPz1N9CsB+EvBcNJKqxGxwQDSwV55yBKSsroVniZJSs629mEWQ==
X-Received: by 2002:a05:6512:3b3:: with SMTP id v19mr1731028lfp.10.1628689543315;
        Wed, 11 Aug 2021 06:45:43 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id b42sm2353668lfv.135.2021.08.11.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 06:45:42 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:45:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nadezda Lutovinova <lutovinova@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: rcar-csi2: Add checking to rcsi2_start_receiver().
Message-ID: <YRPUhqvcTxCVvnBG@oden.dyn.berto.se>
References: <20210811133142.13363-1-lutovinova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811133142.13363-1-lutovinova@ispras.ru>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nadezda,

Thanks for your work.

On 2021-08-11 16:31:42 +0300, Nadezda Lutovinova wrote:
> If rcsi2_code_to_fmt() return NULL,
> then null pointer dereference occurs in the next cycle.
> The patch adds checking if format is NULL.
> 
> Found by Linux Driver Verification project (linuxtesting.org).

Please drop the '.' at the end of the patch subject. Also the commit 
message could be better line wrapped.

> 
> Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff039688..55bb584d2a13 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -553,6 +553,12 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  
>  	/* Code is validated in set_fmt. */
>  	format = rcsi2_code_to_fmt(priv->mf.code);
> +	if (!format) {

This can never happen ;-)

The only place priv->mf.code is set (after probe) is in  
rcsi2_set_pad_format() and there it explicitly checks if 
rcsi2_code_to_fmt() returns NULl and if so sets it to something that 
guarantees it will not.

Think of it as the verification is done at format configuration time so 
we don't have to have check it at start time. The reason for this is 
that we can't do much about a failure here other then fail the start 
while at configure time we can try to correct it and inform the user of 
the change.

That being said, I'm not oppose to fail the start here if we ever do 
introduce a bug here where rcsi2_code_to_fmt() would return NULL here.  
But I would like to drop the dev_err() here and just return -EINVAL.

I would mention in the commit message that this protects from future 
bugs.

> +		dev_err(priv->dev,
> +			"Incorrect mbus frame format code %u\n",
> +			priv->mf.code);
> +		return -EINVAL;
> +	}
>  
>  	/*
>  	 * Enable all supported CSI-2 channels with virtual channel and
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
