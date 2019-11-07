Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9445AF22FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfKGABr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:01:47 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39454 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfKGABr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:01:47 -0500
Received: by mail-lj1-f193.google.com with SMTP id p18so176166ljc.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2019 16:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N3xggxZDcjAE7aQm0fUpcBPU4Y0Dslk0T0PK4QiJ3oc=;
        b=pB2pRi2+1/abDK6sddDzck85WGgKVT4eY8WliDcBlStTbgeu4coeFIgdmt7797Cm51
         nzUpUgyDszPQyOsGcFAra8z5Gd2/bJt8xunSz4GcBkJaFLI7DB/Q7VUf6FRftWAgrhqA
         dUv8ZuSOeyCG7MourWXp3K+SQkC0yZaV5+GnEixH8/2VI00k9y19kZFk329oM4iQmg+X
         juVEbFREBoN8HJU7z2EvYHD+d4oaxNJKHVd8W0tLpH4LDjKtH/iugz40c97MJEXapnai
         f/vYC5LkTDdchvMwrBddn5Ja7T5bYFEdMtomNq/fi8FyuIhgxDtiNET+4kRf0/DWMtao
         iAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N3xggxZDcjAE7aQm0fUpcBPU4Y0Dslk0T0PK4QiJ3oc=;
        b=tdm2vLUzPJ+Yr4Lq/2NWavJc1cFu3ilFO6jI8SpubRzaqj+KxASmQXMx/N+2vB4/bZ
         xTHlo5pqLO+6tLM75aqRsfT7co0+s91kmhIVe1Dsjp8Tkv3ia2xg5g5xgPP9ogP/zaL+
         9ix1GPvuqRQdqnKx8ZX6cSuLq9kJ2GGJuJAaP+4WjeMU4dsNVD1HEZlrAISbOwSB7nsB
         ktTblNpYHvCHZ14s+P3gRxYQJ9irUi07wcq1e+pGdEMGBX95knlvw/z15QGpnTwqyRk0
         ga2lqUjm/wtIYJ/LpcI+En2EWBXc1fc5HvWMkSwvPenSdP5Oiz6llduLgXkpjN08PVtL
         3g2Q==
X-Gm-Message-State: APjAAAUe7MLJvuvBMk87RZqIt8O0mAQWgOsQjkMrmdlxDhpWBu6NFde6
        13UycxumkLxmhr33d8xMzX5arw==
X-Google-Smtp-Source: APXvYqy5fmT1UorHhJvw44NfF9a13y4/JsIWzK1n5j+pH5N4vojlk2F+CWt1VJ7I8lTAkprX+IaZcw==
X-Received: by 2002:a2e:970a:: with SMTP id r10mr98856lji.142.1573084903973;
        Wed, 06 Nov 2019 16:01:43 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id s28sm127882lfp.92.2019.11.06.16.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:01:43 -0800 (PST)
Date:   Thu, 7 Nov 2019 01:01:43 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/6] iommu/ipmmu-vmsa: Add helper functions for MMU
 "context" registers
Message-ID: <20191107000143.GD18345@bigcity.dyn.berto.se>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1573007750-16611-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573007750-16611-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your work,

On 2019-11-06 11:35:47 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> This patch adds helper functions ipmmu_ctx_{reg,read,write}()
> for MMU "context" registers. No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 79975e1..c4fcfda 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -190,29 +190,43 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
>  	iowrite32(data, mmu->base + offset);
>  }
>  
> +static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
> +				  unsigned int context_id, unsigned int reg)
> +{
> +	return context_id * IM_CTX_SIZE + reg;
> +}
> +
> +static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
> +			  unsigned int context_id, unsigned int reg)
> +{
> +	return ipmmu_read(mmu, ipmmu_ctx_reg(mmu, context_id, reg));
> +}
> +
> +static void ipmmu_ctx_write(struct ipmmu_vmsa_device *mmu,
> +			    unsigned int context_id, unsigned int reg, u32 data)
> +{
> +	ipmmu_write(mmu, ipmmu_ctx_reg(mmu, context_id, reg), data);
> +}
> +
>  static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
>  			       unsigned int reg)
>  {
> -	return ipmmu_read(domain->mmu->root,
> -			  domain->context_id * IM_CTX_SIZE + reg);
> +	return ipmmu_ctx_read(domain->mmu->root, domain->context_id, reg);
>  }
>  
>  static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
>  				 unsigned int reg, u32 data)
>  {
> -	ipmmu_write(domain->mmu->root,
> -		    domain->context_id * IM_CTX_SIZE + reg, data);
> +	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
>  }
>  
>  static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>  				unsigned int reg, u32 data)
>  {
>  	if (domain->mmu != domain->mmu->root)
> -		ipmmu_write(domain->mmu,
> -			    domain->context_id * IM_CTX_SIZE + reg, data);
> +		ipmmu_ctx_write(domain->mmu, domain->context_id, reg, data);
>  
> -	ipmmu_write(domain->mmu->root,
> -		    domain->context_id * IM_CTX_SIZE + reg, data);
> +	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -913,7 +927,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
>  
>  	/* Disable all contexts. */
>  	for (i = 0; i < mmu->num_ctx; ++i)
> -		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
> +		ipmmu_ctx_write(mmu, i, IMCTR, 0);
>  }
>  
>  static const struct ipmmu_features ipmmu_features_default = {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
