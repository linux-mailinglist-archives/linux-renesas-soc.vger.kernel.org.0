Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F7EF2319
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfKGAKD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:10:03 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39065 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbfKGAKD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:10:03 -0500
Received: by mail-lf1-f65.google.com with SMTP id 195so102140lfj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2019 16:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=te+ktKBdR0/7Bnwe4NQVECjo/K794ub0RnLYyZUu4GI=;
        b=zulUmFxzS8/LeD8wD6otjK4rBmmr91ro4L4T4AJeCUIFoU2Q2XhfLoz9gClslGHuqC
         geSYZdwi/5C/W4OeznUv298Up6IIHVFLIo2yZSNj1OyQgHbwObB0tfTYC/ZG79VP1Jxa
         7TuzwIhHbR/VKjs2NVqPbtOKSlD0hCzxmqO34D7QLZqE2NftzSK4Ns2WJNHZnmSFVq/m
         nMpy10UobnyAoa6tT4oWUugUqBCORYYNiWCiFKp4WrNQNiKA8xGtH3xVWvZnfGMNfcPV
         0fDnQZyZ1Uab2RPP7MnfkqxipNh0KZgywTnQNW3XQwfhUp5xLG4vE2xMHSyMjvk7dza4
         LUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=te+ktKBdR0/7Bnwe4NQVECjo/K794ub0RnLYyZUu4GI=;
        b=PH6JW0lykb+4R5Dpk4zvueTX47swUJMCXf+0u0QVuZiAt9GQIYoM21y8wgrqVDZsAT
         zIPTGuaTQAwZeFmMXoZAKj+DxLjNMOpp+jvKDzPZF+YC+PUUTd966jU6KhCMuCThnEvD
         wyMzYXUd8sdaigmYOPtmSLkxDp3NGOnGOOp0jvQx+9J1v4uIjs4HJVuR8TwMr/lMv3g8
         zd5sXhfgehziMJjmK8QLhcbfy0UDG8vg2Jt9+eiMzgdtibWBAPYIY90GC/lkaf44XAwj
         q6WS2auVDu6/bwMkSE6QGjdtN6W8HBKfa5QhnWrBmbsmzBCi8/hR7QAeg1hRJdYz4N4B
         8qeA==
X-Gm-Message-State: APjAAAUdEdiP+d83xRJGiljwsSqeu7vn8hr0oK9RFFHOEU2xgBIJ3dOo
        UaI1o++vlZc3AeimEY5LEwzvwQ==
X-Google-Smtp-Source: APXvYqx+nMnPVZo0EIzd46VakJEV0IvTW5DkIiTE/fTpRwd4zNPHr3YsxDdkfZJUa+l2xrQF6/5JqQ==
X-Received: by 2002:ac2:4ace:: with SMTP id m14mr127408lfp.130.1573085400783;
        Wed, 06 Nov 2019 16:10:00 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id n10sm142584lfe.86.2019.11.06.16.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:59 -0800 (PST)
Date:   Thu, 7 Nov 2019 01:09:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB"
 registers
Message-ID: <20191107000959.GF18345@bigcity.dyn.berto.se>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1573007750-16611-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573007750-16611-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your work,

On 2019-11-06 11:35:49 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> This patch adds helper functions ipmmu_utlb_reg() and
> ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 8e2ca1c..82da486 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -230,6 +230,23 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>  	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
>  }
>  
> +static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
> +{
> +	return reg;
> +}
> +
> +static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
> +				unsigned int utlb, u32 data)
> +{
> +	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), data);
> +}
> +
> +static void ipmmu_imuctr_write(struct ipmmu_vmsa_device *mmu,
> +			       unsigned int utlb, u32 data)
> +{
> +	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), data);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * TLB and microTLB Management
>   */
> @@ -275,11 +292,10 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
>  	 */
>  
>  	/* TODO: What should we set the ASID to ? */
> -	ipmmu_write(mmu, IMUASID(utlb), 0);
> +	ipmmu_imuasid_write(mmu, utlb, 0);
>  	/* TODO: Do we need to flush the microTLB ? */
> -	ipmmu_write(mmu, IMUCTR(utlb),
> -		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
> -		    IMUCTR_MMUEN);
> +	ipmmu_imuctr_write(mmu, utlb, IMUCTR_TTSEL_MMU(domain->context_id) |
> +				      IMUCTR_FLUSH | IMUCTR_MMUEN);
>  	mmu->utlb_ctx[utlb] = domain->context_id;
>  }
>  
> @@ -291,7 +307,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
>  {
>  	struct ipmmu_vmsa_device *mmu = domain->mmu;
>  
> -	ipmmu_write(mmu, IMUCTR(utlb), 0);
> +	ipmmu_imuctr_write(mmu, utlb, 0);
>  	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
>  }
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
