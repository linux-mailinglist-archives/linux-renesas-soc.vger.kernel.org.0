Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E362C36100
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 18:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfFEQRr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 12:17:47 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38819 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbfFEQRq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 12:17:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so19553712lfa.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jun 2019 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=INpfTRXsx/ERh1DGBQzxYmwH3X7MJEUMkIUVZyxdfjI=;
        b=AUPZGFVJuGGoWX4JkXEWzQ4Ca5JpLMAYEQlnWcEOrLpLWVi8BCDdjz4H+V9svJ3zM8
         d7p8N9WzKRzG6tgEl8OFj2OEKsneuHpCcgk3lBv9eL1IE+fhLYBo5f98rv/bJ1mB9noh
         mZ3zywdBQgeARjzYDviYLHZ0EURs4p6H5gsnEGx2gPEtlg6HxYz9HmRjxPI8a8+5zcej
         9sYJrfG+ay8XIcUJ73tInI5Nkz9CIP10gaOhIwXP1gTQvozIjS62KJuBGlg6poc4w7rh
         qvy1j84u3uMQb9QrEehh7EovRZVGqXJF0ZgYk1CXrNZuTPd+euKUlze/zkKiIuUFyUJl
         oNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=INpfTRXsx/ERh1DGBQzxYmwH3X7MJEUMkIUVZyxdfjI=;
        b=bFWP9SjouNsHLGjmtES4XZR8eZ+4Vez8/YELjF8x7UlC4TCQUPDJhHg8YoS/9M7IEi
         pFvMDub1eB6+F4UtoxCgtGhkeMMaIf0Amv6PpV8IVhAP4WHcX/748D4qWg7nYO0hJ+Jo
         viFvSNgumUD77Ejw1Ay6RR7lrvIV9t6mbim58TFzU+IKTcX2GavaGL/K6e52U1yW56BD
         EnQIwlMNMbH6mjr2xjM6TykPYIze+MTscuJem/fj+8P+3VWe3597d1RMLqRs8cafF78U
         7Z8rT0mByXZRcFJ17wSnOWZfsP2pJ8jAAGq9T1MwsERQk9ynHgavjiDeLVKHBrXw3Ajz
         g39g==
X-Gm-Message-State: APjAAAWvCGSOfC2C+GR+ysn3DNNn2jAC7LhBjWws2URWKnaU7wSa9Ujc
        Nows1prN0OKzTeOWJnzvitv8CUkwMoo=
X-Google-Smtp-Source: APXvYqw5hdVCwy5gFQZPJeHntxyHuMeSYJHFFKduDzX2eKKxfZUS7DZaah4XpCwx9LGzEtiN4fKfQw==
X-Received: by 2002:ac2:4202:: with SMTP id y2mr3595252lfh.178.1559751464942;
        Wed, 05 Jun 2019 09:17:44 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.84.82])
        by smtp.gmail.com with ESMTPSA id k17sm352187ljk.5.2019.06.05.09.17.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:17:44 -0700 (PDT)
Subject: Re: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <35f63f36-ea4d-850f-8a59-805e67c06b68@cogentembedded.com>
Date:   Wed, 5 Jun 2019 19:17:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/05/2019 02:11 PM, Yoshihiro Shimoda wrote:

> This patch adds a new capable IOMMU_CAP_MERGING to check whether
> the IOVA would be contiguous strictly if a device requires and
> the IOMMU driver has the capable.

   s/has/is/? Or capable what?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/dma-iommu.c | 26 ++++++++++++++++++++++++--
>  include/linux/iommu.h     |  1 +
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 034caae..ecf1a04 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
[...]
> @@ -867,6 +872,13 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  		sg_dma_len(s) = s_length;
>  		s->offset -= s_iova_off;
>  		s_length = iova_align(iovad, s_length + s_iova_off);
> +		/*
> +		 * Check whether the IOVA would be contiguous strictly if
> +		 * a device requires and the IOMMU driver has the capable.

   Same question here...

> +		 */
> +		if (iova_contiguous && i > 0 &&
> +		    (s_iova_off || s->length != s_length))
> +			return 0;
>  		s->length = s_length;
>  
>  		/*
> @@ -902,8 +914,18 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
>  		goto out_free_iova;
>  
> -	return __finalise_sg(dev, sg, nents, iova);
> +	ret = __finalise_sg(dev, sg, nents, iova);
> +	/*
> +	 * Check whether the sg entry is single if a device requires and
> +	 * the IOMMU driver has the capable.

   You  meant capability perhaps?

[...]

MBR, Sergei
