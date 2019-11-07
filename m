Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF981F22FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfKGADa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:03:30 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42886 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfKGADa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:03:30 -0500
Received: by mail-lf1-f67.google.com with SMTP id z12so81408lfj.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2019 16:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3bCNZ4bucKIoWN7TF6mWSYKlcv1HzD7HrSwv37jbXQw=;
        b=lcycutDkccaGGcgzrWYWgtG4ks+615mNfLJ/BljiDQDV2T1DkdHb8sH8Xn4/cSA/gk
         8FcfikrRfc4CuFeDJVGZu0kIaC7VekJEyobuOywdkKF8RBUmNqdNnDjBwh+ykXXOvnX/
         TR1fqdjqTpzqGQPzmLd/cUspsSGSiWf/rKnfvHWdCD0hfQDraGnyXb1xjY72Hgzg3a1v
         8bpFifpWMPRXZ7uS/NVZjvB4V8YfzyMf6I5ZftJTgsFxrw8JKni8SjXR5kQt06TlQ3m0
         fvLBPYoMRGDKci09irK7QVb4AU/fnrKaaBlJkjTQDAprws9VkQzalW8Oz+0sGF9LVd6Y
         k+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3bCNZ4bucKIoWN7TF6mWSYKlcv1HzD7HrSwv37jbXQw=;
        b=VzBc7e7q59T/kuKDiojTGeLp8+w8wFEmJLB1jNnIvDXeeufc42YZUGwThgre21Rl4+
         DUs7MqgeMMgYVpO2CMM2YucAns7k7MiXYdF1YMyNuGhpW3WMUEYxgHhQuismgB9z8VcK
         cHEjcXgDD7SOhD4POHncq2WDJwgrEcVOv5g5/hgBrG7ugjEDQMFIF7EZeTB2+7gykix6
         fxeV0hQ6mERFHjCQNTsqfYt8nFQsdMYOSA4z21KezlpoqMFbIB5EMmi7BORiJ2MMPPlG
         ToRiqybqrBq8rGXTWFPi28OIWwLEYXh3eSB4Y2nc+cdSSAd9z+Gv6bS/WxW9mO/mBGjZ
         hBog==
X-Gm-Message-State: APjAAAXpO2SNipxfCHEVF2Xh8w5ThfalbsWGJZCRDFIdW+GBBF9mVVSN
        ZnE2vwCtxeVQV1Ej92+xRrNNX2jbWOs=
X-Google-Smtp-Source: APXvYqwGbXN/opVQnMIvlpPa/UV5/4fu28QrnvOsj00+Iq20XKjbUBlcXNhbN5JBoGrrMTkpMJ6bWA==
X-Received: by 2002:a05:6512:203:: with SMTP id a3mr97679lfo.7.1573085008049;
        Wed, 06 Nov 2019 16:03:28 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id 30sm169170ljw.29.2019.11.06.16.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:03:27 -0800 (PST)
Date:   Thu, 7 Nov 2019 01:03:27 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/6] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
Message-ID: <20191107000327.GE18345@bigcity.dyn.berto.se>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1573007750-16611-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573007750-16611-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch,

On 2019-11-06 11:35:48 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch uses ipmmu_features values instead of a macro to
> calculate context registers offset. No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index c4fcfda..8e2ca1c 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -50,6 +50,8 @@ struct ipmmu_features {
>  	bool twobit_imttbcr_sl0;
>  	bool reserved_context;
>  	bool cache_snoop;
> +	unsigned int ctx_offset_base;
> +	unsigned int ctx_offset_stride;
>  };
>  
>  struct ipmmu_vmsa_device {
> @@ -99,8 +101,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  
>  #define IM_NS_ALIAS_OFFSET		0x800
>  
> -#define IM_CTX_SIZE			0x40
> -
>  /* MMU "context" registers */
>  #define IMCTR				0x0000		/* R-Car Gen2/3 */
>  #define IMCTR_INTEN			(1 << 2)	/* R-Car Gen2/3 */
> @@ -193,7 +193,8 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
>  static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
>  				  unsigned int context_id, unsigned int reg)
>  {
> -	return context_id * IM_CTX_SIZE + reg;
> +	return mmu->features->ctx_offset_base +
> +	       context_id * mmu->features->ctx_offset_stride + reg;
>  }
>  
>  static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
> @@ -939,6 +940,8 @@ static const struct ipmmu_features ipmmu_features_default = {
>  	.twobit_imttbcr_sl0 = false,
>  	.reserved_context = false,
>  	.cache_snoop = true,
> +	.ctx_offset_base = 0,
> +	.ctx_offset_stride = 0x40,
>  };
>  
>  static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> @@ -950,6 +953,8 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
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
