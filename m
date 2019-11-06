Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63E4F22EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 00:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbfKFX6t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 18:58:49 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38788 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfKFX6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 18:58:49 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so88771lfa.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2019 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=D/iwXlhFDVs74I7pbjZdJ9OqgCy7tcoxyzMcRknhddQ=;
        b=1J4qFusAVYFC+vItP7CFyKPrQGTC3FlsTM+OitfDz8fF0g+tClf/HPiq01Om4XFqRd
         NAZDYQQw7oB24ZiSEo1cKuGWFH88J3/zaK6aMgdy+NYKaedKNxHQeGKeiB90MuVioLZ5
         /Mv+UFKVwSYbJJn14z+QXzcn1QaseMslbjTM/KCrfkjeqpwYtLRWWgPEO1dSEwNFDP3x
         0K9nzcAoD4xknlhqKtTh2yS8l0ZkSefKGFpICyODUCrL1nKzfR69irvp9f7zFmZHdMWU
         xCzznp2w6fXaqxbVyKLBVQuUcwn66sohFH/zUbZT5IrazKTaghM4igAyj6rtK1lN+X9J
         +gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=D/iwXlhFDVs74I7pbjZdJ9OqgCy7tcoxyzMcRknhddQ=;
        b=LE+Y94bMR7cDzEFG5aWfhsTV5mZSDGZA1eQ+L1pr0rH12V1NwZzajRcfHB9NlvirLU
         fsqN57QEpbXXik6owJd0Xe2zcB7JnaJPR6eXEAt1p/V93QjdyZmXJxMQNOV9eoKtXr51
         QOqj6yEuONCLTniazXGtxHjjr/MyCbIlmZ/gmvwhjCr3t11ARnZwtDQRlKoPXJXGuPKl
         xEqWWSmwi1dQRUod6FLgQXY3hhbej1q62ItYCeUUXgxttKrOyTsjlQ9Ogsl8wRtfkq9C
         jSoM8mUYpjljVIIXmbs8PZ4a/tVGLVAtlCCyf10L3hYCStC3AIYouJRfcUauS4loGQei
         xXyw==
X-Gm-Message-State: APjAAAWWWv7lWozguqsdyQMthOezETk1PoZmmabTmsNFocJKW4CAIgHz
        s1hkYIMolLSkgoVTXpkoP8Z5Uw==
X-Google-Smtp-Source: APXvYqxKe+k+8WY10yjRi5lvytyIaJt/JCNj41QoQlGkR+tR4Ih+qJIAaIMmQw9vdMS2sLQkYx3XPA==
X-Received: by 2002:ac2:563c:: with SMTP id b28mr69177lff.149.1573084724820;
        Wed, 06 Nov 2019 15:58:44 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id e2sm143928ljp.48.2019.11.06.15.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 15:58:44 -0800 (PST)
Date:   Thu, 7 Nov 2019 00:58:43 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/6] iommu/ipmmu-vmsa: tidyup register definitions
Message-ID: <20191106235843.GC18345@bigcity.dyn.berto.se>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1573007750-16611-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573007750-16611-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch,

On 2019-11-06 11:35:46 +0900, Yoshihiro Shimoda wrote:
> To support different registers memory mapping hardware easily
> in the future, this patch tidies up the register definitions
> as below:
>  - Add comments to state to which SoCs or SoC families they apply
>  - Add categories about MMU "context" and uTLB registers
> 
> No change behavior.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 58 ++++++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index c4ec166..79975e1 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -101,47 +101,49 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  
>  #define IM_CTX_SIZE			0x40
>  
> -#define IMCTR				0x0000
> -#define IMCTR_INTEN			(1 << 2)
> -#define IMCTR_FLUSH			(1 << 1)
> -#define IMCTR_MMUEN			(1 << 0)
> -
> -#define IMTTBCR				0x0008
> -#define IMTTBCR_EAE			(1 << 31)
> +/* MMU "context" registers */
> +#define IMCTR				0x0000		/* R-Car Gen2/3 */
> +#define IMCTR_INTEN			(1 << 2)	/* R-Car Gen2/3 */
> +#define IMCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
> +#define IMCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
> +
> +#define IMTTBCR				0x0008		/* R-Car Gen2/3 */
> +#define IMTTBCR_EAE			(1 << 31)	/* R-Car Gen2/3 */
>  #define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)	/* R-Car Gen2 only */
>  #define IMTTBCR_ORGN0_WB_WA		(1 << 10)	/* R-Car Gen2 only */
>  #define IMTTBCR_IRGN0_WB_WA		(1 << 8)	/* R-Car Gen2 only */
>  #define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
> -#define IMTTBCR_SL0_LVL_1		(1 << 4)
> +#define IMTTBCR_SL0_LVL_1		(1 << 4)	/* R-Car Gen2 only */
>  
> -#define IMBUSCR				0x000c
> -#define IMBUSCR_DVM			(1 << 2)
> -#define IMBUSCR_BUSSEL_MASK		(3 << 0)
> +#define IMBUSCR				0x000c		/* R-Car Gen2 only */
> +#define IMBUSCR_DVM			(1 << 2)	/* R-Car Gen2 only */
> +#define IMBUSCR_BUSSEL_MASK		(3 << 0)	/* R-Car Gen2 only */
>  
> -#define IMTTLBR0			0x0010
> -#define IMTTUBR0			0x0014
> +#define IMTTLBR0			0x0010		/* R-Car Gen2/3 */
> +#define IMTTUBR0			0x0014		/* R-Car Gen2/3 */
>  
> -#define IMSTR				0x0020
> -#define IMSTR_MHIT			(1 << 4)
> -#define IMSTR_ABORT			(1 << 2)
> -#define IMSTR_PF			(1 << 1)
> -#define IMSTR_TF			(1 << 0)
> +#define IMSTR				0x0020		/* R-Car Gen2/3 */
> +#define IMSTR_MHIT			(1 << 4)	/* R-Car Gen2/3 */
> +#define IMSTR_ABORT			(1 << 2)	/* R-Car Gen2/3 */
> +#define IMSTR_PF			(1 << 1)	/* R-Car Gen2/3 */
> +#define IMSTR_TF			(1 << 0)	/* R-Car Gen2/3 */
>  
> -#define IMMAIR0				0x0028
> +#define IMMAIR0				0x0028		/* R-Car Gen2/3 */
>  
> -#define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
> -#define IMEUAR				0x0034	/* R-Car Gen3 only */
> +#define IMELAR				0x0030		/* R-Car Gen2/3, IMEAR on R-Car Gen2 */
> +#define IMEUAR				0x0034		/* R-Car Gen3 only */
>  
> +/* uTLB registers */
>  #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
> -#define IMUCTR0(n)			(0x0300 + ((n) * 16))
> -#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
> -#define IMUCTR_TTSEL_MMU(n)		((n) << 4)
> -#define IMUCTR_FLUSH			(1 << 1)
> -#define IMUCTR_MMUEN			(1 << 0)
> +#define IMUCTR0(n)			(0x0300 + ((n) * 16))		/* R-Car Gen2/3 */
> +#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))	/* R-Car Gen3 only */
> +#define IMUCTR_TTSEL_MMU(n)		((n) << 4)	/* R-Car Gen2/3 */
> +#define IMUCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
> +#define IMUCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
>  
>  #define IMUASID(n)			((n) < 32 ? IMUASID0(n) : IMUASID32(n))
> -#define IMUASID0(n)			(0x0308 + ((n) * 16))
> -#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))
> +#define IMUASID0(n)			(0x0308 + ((n) * 16))		/* R-Car Gen2/3 */
> +#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))	/* R-Car Gen3 only */
>  
>  /* -----------------------------------------------------------------------------
>   * Root device handling
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
