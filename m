Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5153EA20B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbhHLJbQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 05:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbhHLJbP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 05:31:15 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EF6C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 02:30:49 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z2so12370997lft.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=epgC7K+n2/X6KUKBrCcOah3EpzEkojXbDo2MF6JX8Po=;
        b=dCiBJO2WWr87RMNsBVrMDbxnySWA9MkXRmEO7aAGTRlLXQxAyhbo5tf8tPH/Bn86YR
         GDqNPJw4volwsjrEBz2IR2X3Cfa5lqggF63+2yJIMWGYLzHpoczM7Y2uZKyMznPB0INt
         aZBfzUQIDQJ7In7d2GsVdA5f1OdGkqMXxnNWOGitx+FszPXOOqhfgyFvi3vubWcSxh4C
         Sj7oB1OqFQs1OkiVDFGb+4ql0FQdL9jYKD78SoM8N1DlOF290BnUR8/Ln50UFzK3F+7f
         T+nrATKH4+WuXFXlWlgI6XoPHridFk1ti3n2OyoxCT+h1PlGqBUNFubDH/rVuJbeM/t4
         XoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=epgC7K+n2/X6KUKBrCcOah3EpzEkojXbDo2MF6JX8Po=;
        b=YgpQhNE1lz1cW0xSmpldQlQkKwUss6L89M3ig5LMypmUJrUtDbown9WIdhaDixNSOf
         vAm9LdMFWHQcvOdcss0SJ8e/hyeRcog15BVlwx15rINqUVhsjmwpSm0F64/FUFLcqt+e
         dmrMJhtO1Av4KZAxp7reuXZZ342cXCQna/1+qxCdVWrqW3ErqI84Yh2cpja9eHGL57q1
         Nl2m08JhiyfniZsk4ldt+sBcn+z9AYjpNTjKmD6mDBidkd3kxIhFAYEjxq2w1q17H/q6
         71wP+keUVWfIO/dHkYjpsymIcRP6+4xtJLECVSwrWB2w/NUWoKrZ9jsfYaTHeamScdKL
         16oQ==
X-Gm-Message-State: AOAM530CeYNapeqWwFRVYDY/4QwALgWZBzW0gSxnSJp1YRF6piO7TUdf
        K4ZC1IyLAqrJHBFPETF/SOuGRw==
X-Google-Smtp-Source: ABdhPJzrWlT05KtBefa7dk+4un2fPF5onmFZNan9LP4iUYmxGR1OkzFby/iXmQWGer8JKJNQIiijrw==
X-Received: by 2002:a05:6512:23a6:: with SMTP id c38mr1995349lfv.268.1628760647574;
        Thu, 12 Aug 2021 02:30:47 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id k17sm248789ljm.7.2021.08.12.02.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:30:47 -0700 (PDT)
Date:   Thu, 12 Aug 2021 11:30:46 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nadezda Lutovinova <lutovinova@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH v2] media: rcar-csi2: Add checking to
 rcsi2_start_receiver()
Message-ID: <YRTqRhTTlgkEZAcg@oden.dyn.berto.se>
References: <YRPUhqvcTxCVvnBG@oden.dyn.berto.se>
 <20210811171816.12012-1-lutovinova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811171816.12012-1-lutovinova@ispras.ru>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nadezda,

Thanks for your patch.

On 2021-08-11 20:18:16 +0300, Nadezda Lutovinova wrote:
> If rcsi2_code_to_fmt() return NULL, then null pointer dereference occurs 
> in the next cycle. That should not be possible now but adding checking 
> protects from future bugs.
> The patch adds checking if format is NULL.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2: fix subject and commit message, remove dev_err()
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff039688..d28f83f7698b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -553,6 +553,8 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  
>  	/* Code is validated in set_fmt. */
>  	format = rcsi2_code_to_fmt(priv->mf.code);
> +	if (!format)
> +		return -EINVAL;
>  
>  	/*
>  	 * Enable all supported CSI-2 channels with virtual channel and
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
