Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBDE5F231B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfKGALH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:11:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37755 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfKGALH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:11:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id l20so203785lje.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2019 16:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=t29L8pHs1xG8RkPaoBvRVOiIoBVujBGtSMYiRlmYjVE=;
        b=OAdQ+KsKiqDB9xQ7oq5ZPDOzzwG97KbHoOqeMqEibD7QPpjsuJhAI7Cft08HkNpGg+
         ei74ztX3onpYg824xTaD3+yUvyz/l+y2oUKrxdbMY80sISVWlNdKKkC7/uee8Y6N1CcY
         x0NcLz1wgaOK25ytY0YAi0QoSmi7cyiEiQDRnDXtps5Xvjrc7entKTKs0RWxBdyGkp6r
         6q7lMMCI9umbJkFFbd7IlFQVQnT70OeiBstlm8HuaO53te7QeBFXaLqzzludIF3JHYf1
         7OqP9dnTfPFjQoZLizgmy+6cOWi2fObDnYp8Sn/RGcOjO15QoPPuIkEHY1/VJLezNySh
         +XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=t29L8pHs1xG8RkPaoBvRVOiIoBVujBGtSMYiRlmYjVE=;
        b=FiLc7bRPmVblLCw45TEBRKxd08Bj+UwKhrnuskdg3sBS86h8I/fTuuXl8cTYaDv6qk
         1DJoe6WJhe8ycqIA5nkn5hoxFxrsyAYFXDCpfEPHRO/NxlFj+MBatvP0ebNELf7ItbK5
         o3fZLJaAekYc+K75vk4ZZKgMCy6T4OOc8ivb2nBQMQSj3PoHZFYsfsDDm33nHZ29EQIv
         nhX2hx4zkERyqUex+EdpjVCnvTHqHmRBPhty5qyQ9poCcg3gXqIF8vUu539LSRdUbit7
         ZHQc89LJ4Ki41ltq5Bd21YvETyUF1W/lk4zBiiVCfl74Lrp5tg1yakOkifwApiVF9V9d
         1pLw==
X-Gm-Message-State: APjAAAWNR/4MSFm0CAbT0ovKRMMU0sXJ8PWdSEpGsmVh/mLE3/Hfex00
        HSragagUgwLW0Mm05I2mwmKI6Q==
X-Google-Smtp-Source: APXvYqwcCzcfy4vXW68zINBR9vMAZfZrg1ZzfCfum+hibvhaKKo7kAAzkGbwPeRkSRmqfQBuiRatJA==
X-Received: by 2002:a2e:9e97:: with SMTP id f23mr101367ljk.89.1573085465185;
        Wed, 06 Nov 2019 16:11:05 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id q26sm138561lfo.65.2019.11.06.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:11:04 -0800 (PST)
Date:   Thu, 7 Nov 2019 01:11:03 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] iommu/ipmmu-vmsa: Add utlb_offset_base
Message-ID: <20191107001103.GG18345@bigcity.dyn.berto.se>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1573007750-16611-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573007750-16611-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch,

On 2019-11-06 11:35:50 +0900, Yoshihiro Shimoda wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch adds a utlb_offset_base into struct ipmmu_features
> for IMUCTR and IMUASID registers. No behavior change.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 82da486..c813436 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -52,6 +52,7 @@ struct ipmmu_features {
>  	bool cache_snoop;
>  	unsigned int ctx_offset_base;
>  	unsigned int ctx_offset_stride;
> +	unsigned int utlb_offset_base;
>  };
>  
>  struct ipmmu_vmsa_device {
> @@ -232,7 +233,7 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>  
>  static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
>  {
> -	return reg;
> +	return mmu->features->utlb_offset_base + reg;
>  }
>  
>  static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
> @@ -958,6 +959,7 @@ static const struct ipmmu_features ipmmu_features_default = {
>  	.cache_snoop = true,
>  	.ctx_offset_base = 0,
>  	.ctx_offset_stride = 0x40,
> +	.utlb_offset_base = 0,
>  };
>  
>  static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> @@ -971,6 +973,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
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
