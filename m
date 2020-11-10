Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35902AD6F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 13:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730320AbgKJM6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 07:58:42 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49604 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730097AbgKJM6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:58:40 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AACwLYH048316;
        Tue, 10 Nov 2020 06:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605013101;
        bh=uXVTrgsRm6xY9WiAoZBFXURTjX9qcI5PcYnV6mMJCcs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=o0maWUH0jBdrqWzHt8J4HSOq5DApwIzALpFxAaUT2fjXekW29+rcGT433zXQV9XRR
         OQsOr+LqNcipxlFQM+i1b7Ma+dfGHYWWnxKcUPxskmBJJxGCigXkOaqh7aT+D/45Tt
         y0CTAqzwyg3/DxvIM63BVViXQJN9X81VFxj1LR6s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AACwLRt034302
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Nov 2020 06:58:21 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:58:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:58:20 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AACwHnW123876;
        Tue, 10 Nov 2020 06:58:18 -0600
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        <linux-mtd@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <849bf80d-4081-1b90-9490-702e8a0b5a12@ti.com>
Date:   Tue, 10 Nov 2020 18:28:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 10/16/20 5:25 PM, Lad Prabhakar wrote:
> This chip is (nearly) identical to the Winbond w25m512jv which is
> already supported by Linux. Compared to the w25m512jv, the 'jw'
> has a different JEDEC ID.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

I believe this was tested on a real HW? Including Quad mode?

> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 6dcde15fb1aa..b5dfc09fef30 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -88,6 +88,8 @@ static const struct flash_info winbond_parts[] = {
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>  			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +	{ "w25m512jw", INFO(0xef6119, 0, 64 * 1024, 1024,
> +			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  };
>  
>  /**
> 
