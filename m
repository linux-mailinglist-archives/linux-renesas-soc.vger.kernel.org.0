Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96729D1BBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 00:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731542AbfJIW24 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 18:28:56 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36758 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbfJIW24 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 18:28:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so4134352ljj.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2019 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=R/HtMaWym45Jgs9DzJ9pn5UaNkfLO50BqU9y3ggWmRs=;
        b=NsUpvKLiPn8OYIAleT5jio4lqmOTA75y81AmU5GfR+c3SKfZeI6wUFH6dvMGjYcaJG
         PEM2/QOoSmGwlKPisbliCY22oJbEMhJCDagmdWGrPmnT2lD4tP+KT2RUFNqbq34QSw8R
         0gxaZuazih0Ss8CDxN/Tgp/MuVlRAn6Qij07VwQ0qSy8iySnsjk9Jg/gpAHb9vRmToLZ
         5ShwxiuYucpGf44U0LFXMmknCxelRM3xDbvCo2Zah+gGbRL3PR/DIdL/Y2PJUTZKPbdF
         0bFJSdMGc1b/RTAB+5gbqA+NOFvnx6IhhdsBhA/TkOo0dVWQODmLpK7Fr07apDawM5q5
         TB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=R/HtMaWym45Jgs9DzJ9pn5UaNkfLO50BqU9y3ggWmRs=;
        b=YaMa4EKdXhXxoXWpeMHewG3Yg+RcPgXPWanseLkv/+7+gtf9DwfOUjPMPXOdYf33ls
         Ht5u/wFW8O0uygMtEEct7ohtPc0jEPkZEVqmTqhm4tlWPcvnup9AIRAuiTrtjOuJO60h
         COcSJ/AqfkP4L2VE7OsvguG28m7dhWRVVKldpDhY5ssqkpxaZ6bQrLmXkKTppkyDrple
         KqvwO/6B5CeqpBfta7kXQwD+EmjXfw7C7mx2pimFGCVgy8RspOrWcyywvHncHkFkFpCd
         6poqaxpAUFqxbJeZw1LbN6qyMmeLn/OE4K3ZsnSfrtQGfzD/PbBko5TpyM11gWl+IlGW
         nwiQ==
X-Gm-Message-State: APjAAAV8Iu9hKKr1BiOJbMzw8tC8NY3X+FNZIFeAudEtAFKRP5Ne+RLx
        mGRYxZvNRHhLSNWP0Q1OfM8TlQ==
X-Google-Smtp-Source: APXvYqzONDXkmPjiIUmwEb3PEEeWJnbuEAEK0K2ke1CH0KMhOtf0YIrgYEoNlOGgpagsgyBNyua2IA==
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr3800047ljm.38.1570660134713;
        Wed, 09 Oct 2019 15:28:54 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id k15sm735891ljg.65.2019.10.09.15.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 15:28:53 -0700 (PDT)
Date:   Thu, 10 Oct 2019 00:28:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] iommu/ipmmu-vmsa: Add utlb_offset_base
Message-ID: <20191009222853.GA32293@bigcity.dyn.berto.se>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch.

On 2019-10-09 17:26:49 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch adds a utlb_offset_base into struct ipmmu_features
> for IMUCTR and IMUASID registers.
> No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 76fb250..bc00e58 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -52,6 +52,7 @@ struct ipmmu_features {
>  	bool cache_snoop;
>  	u32 ctx_offset_base;
>  	u32 ctx_offset_stride;
> +	u32 utlb_offset_base;
>  };
>  
>  struct ipmmu_vmsa_device {
> @@ -285,6 +286,11 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>  	ipmmu_ctx_write_root(domain, reg, data);
>  }
>  
> +static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
> +{
> +	return mmu->features->utlb_offset_base + reg;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * TLB and microTLB Management
>   */
> @@ -330,9 +336,9 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
>  	 */
>  
>  	/* TODO: What should we set the ASID to ? */
> -	ipmmu_write(mmu, IMUASID(utlb), 0);
> +	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), 0);
>  	/* TODO: Do we need to flush the microTLB ? */
> -	ipmmu_write(mmu, IMUCTR(utlb),
> +	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)),
>  		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
>  		    IMUCTR_MMUEN);
>  	mmu->utlb_ctx[utlb] = domain->context_id;
> @@ -346,7 +352,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
>  {
>  	struct ipmmu_vmsa_device *mmu = domain->mmu;
>  
> -	ipmmu_write(mmu, IMUCTR(utlb), 0);
> +	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), 0);
>  	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
>  }
>  
> @@ -995,6 +1001,7 @@ static const struct ipmmu_features ipmmu_features_default = {
>  	.cache_snoop = true,
>  	.ctx_offset_base = 0,
>  	.ctx_offset_stride = 0x40,
> +	.utlb_offset_base = 0,
>  };
>  
>  static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> @@ -1008,6 +1015,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
>  	.cache_snoop = false,
>  	.ctx_offset_base = 0,
>  	.ctx_offset_stride = 0x40,
> +	.utlb_offset_base = 0,
>  };
>  
>  static const struct of_device_id ipmmu_of_ids[] = {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
