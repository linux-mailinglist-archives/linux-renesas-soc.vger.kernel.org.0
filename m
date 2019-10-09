Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADA9D1AA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 23:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731593AbfJIVNp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 17:13:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36665 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfJIVNo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 17:13:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so3975939ljj.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2019 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=O1szppMdVqNwuc6KuWMWhQME2fGH410c8EpWWgDMBF4=;
        b=PLcIfGu1u1IvCWMz1vxBuFV0cu89qCdiTOjKDli2FoE8twmwiLbiKPOXHeTCC3RUCU
         ldKrvjDP8gQWymjJGBXTEs94sEhw5wG78ttfeaD6QiCLHhW5STKX9DDZfBTfEcQ0PDoq
         Z1EM/7ctGyhoVPhtj49iP+Gmv9PuSwDNt++VGgwgzS6Ym1nleMYhJIuYBAZKq3XHwykJ
         pHDYsUN77cr0PlOmU4bCt/2QjDEkWEPoIqpBJY5cT+yemqPdqakbP3sfuTdCrnbrP93g
         65tmDu4eanInpA7bA6eACIOIG/1olQELCY9txCJ61+Mytdu+ZQ5m4B6W5G96vVLleRT7
         kETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=O1szppMdVqNwuc6KuWMWhQME2fGH410c8EpWWgDMBF4=;
        b=F+QA/48kUijtS5eDxmDQKXoaiQxYa4II/OkOe3vr6Dpn2X3NowPxcmZm+fW3Y5cHVX
         cGAMI2YSV//3KqBDYHOVXRsITzoJQ0LxrD+EpO7vJBt6Q5ojJLeBIJtLKdZdETp4ecVx
         PjtIJKawI1rHw5yVvW0Q51gliqvM9GhaiH43Vv8V57zaIp4F7GFvk4z0MocNceh+f/q4
         QvDxZYx/Y1aBSrJf4GVPUSo4UCKz1/0ku2vr64DHyAIEla/jchDkraEt/kUTKzUTU2fJ
         9SydUXcfDkS7XnnnuAzLKPU1KRh4dA3N+mf/NBT/yZh29XcAEZOm5AuFVU7lRYrCtwD8
         UhZg==
X-Gm-Message-State: APjAAAWBZwIySSLUuIg3jieabMnZm1D1jK3i4L4cha9W8OK0/aSsQ+iZ
        hYn4nPqTaAhsnfS4THK4bcpuJGlrI2w=
X-Google-Smtp-Source: APXvYqwmUqnXBsqREPMUGkbmw/+UBNGTNWOYeVWtRCD6oDkAT12c6t2TrIalLcatg3lkNslAjq9Ylg==
X-Received: by 2002:a2e:2b91:: with SMTP id r17mr3698727ljr.1.1570655622441;
        Wed, 09 Oct 2019 14:13:42 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id c69sm741520ljf.32.2019.10.09.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 14:13:41 -0700 (PDT)
Date:   Wed, 9 Oct 2019 23:13:41 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
Message-ID: <20191009211341.GC21066@bigcity.dyn.berto.se>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch.

On 2019-10-09 17:26:48 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch uses ipmmu_features values instead of a macro to
> calculate context registers offset. No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index dd554c2..76fb250 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -50,6 +50,8 @@ struct ipmmu_features {
>  	bool twobit_imttbcr_sl0;
>  	bool reserved_context;
>  	bool cache_snoop;
> +	u32 ctx_offset_base;
> +	u32 ctx_offset_stride;
>  };
>  
>  struct ipmmu_vmsa_device {
> @@ -99,8 +101,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  
>  #define IM_NS_ALIAS_OFFSET		0x800
>  
> -#define IM_CTX_SIZE			0x40
> -
>  #define IMCTR				0x0000
>  #define IMCTR_TRE			(1 << 17)
>  #define IMCTR_AFE			(1 << 16)
> @@ -253,18 +253,25 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
>  	iowrite32(data, mmu->base + offset);
>  }
>  
> +static u32 ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu, unsigned int context_id,
> +			 unsigned int reg)
> +{
> +	return mmu->features->ctx_offset_base +
> +	       context_id * mmu->features->ctx_offset_stride + reg;
> +}
> +
>  static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
>  			       unsigned int reg)
>  {
>  	return ipmmu_read(domain->mmu->root,
> -			  domain->context_id * IM_CTX_SIZE + reg);
> +			  ipmmu_ctx_reg(domain->mmu, domain->context_id, reg));
>  }
>  
>  static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
>  				 unsigned int reg, u32 data)
>  {
>  	ipmmu_write(domain->mmu->root,
> -		    domain->context_id * IM_CTX_SIZE + reg, data);
> +		    ipmmu_ctx_reg(domain->mmu, domain->context_id, reg), data);
>  }
>  
>  static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
> @@ -272,10 +279,10 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>  {
>  	if (domain->mmu != domain->mmu->root)
>  		ipmmu_write(domain->mmu,
> -			    domain->context_id * IM_CTX_SIZE + reg, data);
> +			    ipmmu_ctx_reg(domain->mmu, domain->context_id, reg),
> +			    data);
>  
> -	ipmmu_write(domain->mmu->root,
> -		    domain->context_id * IM_CTX_SIZE + reg, data);
> +	ipmmu_ctx_write_root(domain, reg, data);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -974,7 +981,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
>  
>  	/* Disable all contexts. */
>  	for (i = 0; i < mmu->num_ctx; ++i)
> -		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
> +		ipmmu_write(mmu, ipmmu_ctx_reg(mmu, i, IMCTR), 0);
>  }
>  
>  static const struct ipmmu_features ipmmu_features_default = {
> @@ -986,6 +993,8 @@ static const struct ipmmu_features ipmmu_features_default = {
>  	.twobit_imttbcr_sl0 = false,
>  	.reserved_context = false,
>  	.cache_snoop = true,
> +	.ctx_offset_base = 0,
> +	.ctx_offset_stride = 0x40,
>  };
>  
>  static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> @@ -997,6 +1006,8 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
>  	.twobit_imttbcr_sl0 = true,
>  	.reserved_context = true,
>  	.cache_snoop = false,
> +	.ctx_offset_base = 0,
> +	.ctx_offset_stride = 0x40,
>  };
>  
>  static const struct of_device_id ipmmu_of_ids[] = {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
