Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1DDD1A6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 23:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbfJIVD2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 17:03:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36813 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIVD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 17:03:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so3952243ljj.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2019 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=h+JtTq4mvtCEE5k+YHCZXtpasm7hEklC4uGdnSVTHGk=;
        b=pGEmno8dmtihs+7wmXMqz4WCLVyUuv646qTbiHEu2tvyoCCbHds/OVskPeTXb2bdRU
         aMXIxUt9FdmOvrvBAqFWarohzoNqySFgHiWBHO7MnGsrsnz4WC0FB7z8lAOqFA7BaTfK
         ZpkSPyg5q647LxZBY6uKMmzONgKRzmRYZWavW+2aIZKmJT9AyGWKSioN8WcvIAaAn//I
         dNoCMFfLuPIzrY6T1n3YrWN8hisdVx6ts6etnIzdWzl6NdQHGUfLZ6WPNcLd6wWjhYP1
         HgPVrqak+yZP1rjgCeFEe/JHfWgvB8seP5raK9TrD/G2mSP8/aEGo2wouB3uWZnrY43V
         66AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=h+JtTq4mvtCEE5k+YHCZXtpasm7hEklC4uGdnSVTHGk=;
        b=nXgRdx+dDS1AoHGOKNS8XT6ilQxBq2GzNcpCwXkq+ZGYil0oXHbx4QfQ4wc7D515mc
         3QZ7jakyb2/FPiI/LqcZPiEm9QwQGxn8C/y6EiwwmRnqkUDkq5oMa2e2TqMmDLeWLm4D
         3M8p6698NKhnNDq82wmiSLZVXDpCH9Ar1z1y8RBqXhLQk/jQ+HM5SZmhFAUSOkWkv5Lw
         XIygnP368EaZkaW5AojT4LovqukTdqRtcYc4dtsVth/bkp8aTF6sFsk/h6HicKM7rYbc
         gOy+TkxwrbQAi9U5UBjABJgag/nuf2T8WRCE2clOTyCSJ286CHL4zzfXsikX1KTbtNbR
         3Rmg==
X-Gm-Message-State: APjAAAWE5bo57vTDw5G3nPYphIZtDc11W10q1XKVTEXcpqicqnmHjGMK
        pe0BV+AlBWMNGFsvQPZfPhUTkA==
X-Google-Smtp-Source: APXvYqwLJ2rhXvva2jrhIe1pQp5i5yMl0cuwrQ9Jtl/Y9+Gw7fgUZIFTLel2xHbEsJoXbquIwq0+ug==
X-Received: by 2002:a05:651c:1ad:: with SMTP id c13mr3673147ljn.131.1570655006786;
        Wed, 09 Oct 2019 14:03:26 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id f21sm880077lfm.90.2019.10.09.14.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 14:03:25 -0700 (PDT)
Date:   Wed, 9 Oct 2019 23:03:25 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register
 declarations
Message-ID: <20191009210325.GB21066@bigcity.dyn.berto.se>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch.

On 2019-10-09 17:26:47 +0900, Yoshihiro Shimoda wrote:
> To support different registers memory mapping hardware easily
> in the future, this patch removes some unused register
> declarations.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 9da8309..dd554c2 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -104,8 +104,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  #define IMCTR				0x0000
>  #define IMCTR_TRE			(1 << 17)
>  #define IMCTR_AFE			(1 << 16)
> -#define IMCTR_RTSEL_MASK		(3 << 4)
> -#define IMCTR_RTSEL_SHIFT		4
>  #define IMCTR_TREN			(1 << 3)
>  #define IMCTR_INTEN			(1 << 2)
>  #define IMCTR_FLUSH			(1 << 1)
> @@ -115,7 +113,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  
>  #define IMTTBCR				0x0008
>  #define IMTTBCR_EAE			(1 << 31)
> -#define IMTTBCR_PMB			(1 << 30)
>  #define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)	/* R-Car Gen2 only */
>  #define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)	/* R-Car Gen2 only */
>  #define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)	/* R-Car Gen2 only */
> @@ -193,12 +190,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  #define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
>  #define IMEUAR				0x0034	/* R-Car Gen3 only */
>  
> -#define IMPCTR				0x0200
> -#define IMPSTR				0x0208
> -#define IMPEAR				0x020c
> -#define IMPMBA(n)			(0x0280 + ((n) * 4))
> -#define IMPMBD(n)			(0x02c0 + ((n) * 4))
> -
>  #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
>  #define IMUCTR0(n)			(0x0300 + ((n) * 16))
>  #define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
> @@ -206,8 +197,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  #define IMUCTR_FIXADD_MASK		(0xff << 16)
>  #define IMUCTR_FIXADD_SHIFT		16
>  #define IMUCTR_TTSEL_MMU(n)		((n) << 4)
> -#define IMUCTR_TTSEL_PMB		(8 << 4)
> -#define IMUCTR_TTSEL_MASK		(15 << 4)
>  #define IMUCTR_FLUSH			(1 << 1)
>  #define IMUCTR_MMUEN			(1 << 0)
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
