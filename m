Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431404E180
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 09:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFUH70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 03:59:26 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35822 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfFUH70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 03:59:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190621075924euoutp01640b3044f7ebccd5f73d8df5ddd51436~qJ8jjatkO1969019690euoutp01h
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2019 07:59:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190621075924euoutp01640b3044f7ebccd5f73d8df5ddd51436~qJ8jjatkO1969019690euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561103964;
        bh=OfcYrq4Mw2C7QWJTKY9iTkWlTTeEKFz3rb4XsrYlvSc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=phxZn7Y8JsJWjW3gXWehIfh3D2gHgWfrmmn+ULt/4KRmscLCzVW1p3k2Owzefe8uX
         gGg2KQfAS38Dk7IAsKt6SQwZRApV9h4vWvB57M95SG75YIaZyCqHa+xDnMdsBttH1n
         wA6mA0vlzYl/lRozgEe1GKMGYAT+JBp9BarsnvG4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190621075923eucas1p2536fc35606737bb63156849d3b31a260~qJ8i5G_Fm2093320933eucas1p2D;
        Fri, 21 Jun 2019 07:59:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 65.35.04377.B5E8C0D5; Fri, 21
        Jun 2019 08:59:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190621075922eucas1p1f24348c3e298df3920d6be6ccc25cf9a~qJ8h8sPIR2245922459eucas1p1N;
        Fri, 21 Jun 2019 07:59:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190621075922eusmtrp257b4c84900cccac29fd04b8da5952db3~qJ8huVMrT1501015010eusmtrp2I;
        Fri, 21 Jun 2019 07:59:22 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-55-5d0c8e5b694b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8A.CE.04140.A5E8C0D5; Fri, 21
        Jun 2019 08:59:22 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190621075922eusmtip2838999876e871ae7349f3cd880c88bb3~qJ8hQtFVt1543515435eusmtip2s;
        Fri, 21 Jun 2019 07:59:22 +0000 (GMT)
Subject: Re: [RFC PATCH v7 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, hch@lst.de, robin.murphy@arm.com,
        joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8bce95ea-93ac-e783-af7c-ec5bfb8e82f6@samsung.com>
Date:   Fri, 21 Jun 2019 09:59:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561020610-953-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3bvtru5yXVaO2kYTCoq0oygS4YUBN1PFX2RnFIzb1Pcpuw2
        LYMYClYrpr2QtqKslFm+RaQt7W1LXeVavmNhsGq0NFbhtCit5XZn+e33P+d/nv858BCYrI8f
        T+TrDjF6nUqjEIjx9p6f7nVKsyR7vfNLEtX4tlJA3Wzs5lG1j9Ook5duC6mHb9ZSXcFKRLWN
        f+FR9m9ePuVszqDM7h3U9MOAYGsU7bVf4dFNV5oQPfjSQI+NPBDQ50atiO58bRTQ311ncPrj
        tVacDtxJ3C3KFG/JZTT5xYw+JX2/OK+79Qle5JUcrm4ZwIyoTmxCIgLIjfDH5MFNSEzIyAYE
        v/sDETGF4OunmYgIIKgOTvPnRyrqZjGuYUVQ6xrjc8KPoNxsF4ZcsWQmjBy38UIcR9YguO3b
        GjJhZD2CH5Onwk8JyFQw+U2CEEvJdPDZrCjEOLkCbnQOhnkxmQU1Nh/OeWLg+UVvmEXkLmio
        exEOwMjlcM9/GeNYDm+8V3mhMCDfC+GcyxjZezvY35chjmNhwnlXyPEyCN6fHyhH8M7dLOTE
        aQSDZTWRiTR46uyfe4mYi1gNrR0pXHkbOF0TeKgMZDSM+mO4JaLhbHs1xpWlcKJCxrlXgsXZ
        8i/W3jeAVSGFZcFplgXnWBacY/mfW4vwW0jOGFitmmE36JiSZFalZQ06dfKBQu0dNPfPev84
        p2yoYzbHgUgCKSTSJ5aobBlfVcwe0ToQEJgiTirRSLJl0lzVkVJGX7hPb9AwrAMlELhCLj26
        yKOUkWrVIaaAYYoY/XyXR4jijWhJwcY917IeHU1SejZVHZzaMf7LPepWWg7b41+dlxS3t+09
        3q4VDe1Pj96zryu5oqrsY8bjtPKGxkR3femFkWcnJuS9rMvTkbg0JzjjdxwzXwx8sGZv2DbU
        0w+Tndc3r6nEo3wwa5weFs6sUvnQsUU7TyYY1Jl9CZPDOsvQ2OcSBc7mqVLXYHpW9ReEpLrc
        YwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7pRfTyxBq2tqhar7/azWaxcfZTJ
        YsF+a4vO2RvYLfbe0rY48r+f0WLry3dMFgc/PGG1OL423KLvnLvF172f2Ry4PZ4cnMfksWbe
        GkaPy2dLPe5c28PmMfnGckaP3Tcb2Dy+nZnI4vFs4XoWj8+b5AI4o/RsivJLS1IVMvKLS2yV
        og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyjq4/wFLwhKdi+rpLzA2MS7i6
        GDk5JARMJNqW/GHuYuTiEBJYyijxbu19doiEjMTJaQ2sELawxJ9rXWwgtpDAa0aJWRPKQGxh
        gSiJa+07mECaRQRmMEosWtrADuIwg0za9uovK8TY54wS+372gLWzCRhKdL2FGMUrYCfxfMdy
        RhCbRUBVYvHuy2C2qECMxP6Dt1kgagQlTs58AmZzCvhLrFhyignEZhYwk5i3+SEzhC0vsf3t
        HChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQI
        jN9tx35u2cHY9S74EKMAB6MSD++BWdyxQqyJZcWVuYcYJTiYlUR4eXJ4YoV4UxIrq1KL8uOL
        SnNSiw8xmgI9N5FZSjQ5H5ha8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB
        9DFxcEo1MC78xfGnY0IyZ61r980Cufu8AUni+2U2Ts5eLZFYXhSwse5W7ar1TbvjpvTEa9em
        i/d/4e89bxwf8uLMnQKjtm1LfHgZ1d7HSs2YGq/eFvjpsb357RMl1Q9eSb04F7iafcrUl7fu
        Tev7W3H3Vt8ijrVZS/WM/U8wTeQLbJjy4c6lZ97Fdu5cWUosxRmJhlrMRcWJAEiMPOH1AgAA
X-CMS-MailID: 20190621075922eucas1p1f24348c3e298df3920d6be6ccc25cf9a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190620085043epcas2p1f17aa71e547cf3d2b74dfc0c0dcc5ccb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190620085043epcas2p1f17aa71e547cf3d2b74dfc0c0dcc5ccb
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
        <CGME20190620085043epcas2p1f17aa71e547cf3d2b74dfc0c0dcc5ccb@epcas2p1.samsung.com>
        <1561020610-953-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 2019-06-20 10:50, Yoshihiro Shimoda wrote:
> This patch adds a new dma_map_ops of get_merge_boundary() to
> expose the DMA merge boundary if the domain type is IOMMU_DOMAIN_DMA.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/iommu/dma-iommu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 205d694..9950cb5 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1091,6 +1091,16 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
>   	return ret;
>   }
>   
> +static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
> +{
> +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> +
> +	if (domain->type != IOMMU_DOMAIN_DMA)
> +		return 0;	/* can't merge */
> +
> +	return (1 << __ffs(domain->pgsize_bitmap)) - 1;
> +}

I really wonder if there is any IOMMU, which doesn't support 4KiB pages. 
Cannot you simply assume that the merge boundary is 4KiB and avoid 
adding this new API?

> +
>   static const struct dma_map_ops iommu_dma_ops = {
>   	.alloc			= iommu_dma_alloc,
>   	.free			= iommu_dma_free,
> @@ -1106,6 +1116,7 @@ static const struct dma_map_ops iommu_dma_ops = {
>   	.sync_sg_for_device	= iommu_dma_sync_sg_for_device,
>   	.map_resource		= iommu_dma_map_resource,
>   	.unmap_resource		= iommu_dma_unmap_resource,
> +	.get_merge_boundary	= iommu_dma_get_merge_boundary,
>   };
>   
>   /*

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

