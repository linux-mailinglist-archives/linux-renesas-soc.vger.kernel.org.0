Return-Path: <linux-renesas-soc+bounces-7757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A11949680
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Aug 2024 19:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1561F220C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Aug 2024 17:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2332433D0;
	Tue,  6 Aug 2024 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HR6xnu+I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044B2A1D3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Aug 2024 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722964639; cv=none; b=DyB0y9pGhR/gEy4GL9p+aPZkk1mFPvVPoWlfFMh5R76PJjlxeiWP93nsqS2yq/j5Da7qgKIhnGboJmy4M9XUsZnP4OCgbD7DxbmRJw6xXeQEvCaEK5S1gM3ut1wvF0R1uRSw/bzwuZxtLbn639OYxcWSDORZb0k7krK1Fn1k/rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722964639; c=relaxed/simple;
	bh=S7TX49RLZNGMtUm6UtO2cmQ91mSPPQaOhdfFODr3McU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OKYIFJ0nWXe5QRi/HSS/9VCEaGR/pj2D0yn0QhXEej8K8BJYGK/D3L81TinsJGFWH/ji5NmOT11n831dR9q6AhZlYbd7LiSEiMMI2+fo6IY3ThX78LO7QyrJFtiPyckwkScDVoLk7dZhogcjNhjKBkLqpjgJxSxXXAD9Mk4zIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HR6xnu+I; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476HGikm086270;
	Tue, 6 Aug 2024 12:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722964604;
	bh=vef8U/NvAQhnHHBic1VYdlSRlaLPaFr0gvNkGR8+8sc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HR6xnu+IjF19lbyGqcqPovQSx1xLvAJtKdPvCYxE8HOhUoVaks8u5zMZrhsYExdSt
	 ubStEkDqDPeU5Kr5Y3pDzAUcG1cbZWTgI6csBORT3iGbRbNYDw9WynmyePWAmWN6+N
	 dUpBepF1PkCzRylIBAtWzwzBLACMsPv6GoFVY71k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476HGieX078762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 12:16:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 12:16:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 12:16:44 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476HGfLB061428;
	Tue, 6 Aug 2024 12:16:41 -0500
Message-ID: <653f0d75-c35b-4182-8378-a4f0727301f0@ti.com>
Date: Tue, 6 Aug 2024 22:46:40 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
To: Biju Das <biju.das.jz@bp.renesas.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Sergei Shtylyov
	<sergei.shtylyov@cogentembedded.com>,
        <linux-mtd@lists.infradead.org>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>, <linux-renesas-soc@vger.kernel.org>
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 31/07/24 13:38, Biju Das wrote:
> The rpc-if-hyperflash driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
> 
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>


> Note:
>  Only compile tested. Changes are similar to [1]
>  [1] https://lore.kernel.org/all/20240731072955.224125-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/mtd/hyperbus/rpc-if.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
> index b22aa57119f2..e7a28f3316c3 100644
> --- a/drivers/mtd/hyperbus/rpc-if.c
> +++ b/drivers/mtd/hyperbus/rpc-if.c
> @@ -163,9 +163,16 @@ static void rpcif_hb_remove(struct platform_device *pdev)
>  	pm_runtime_disable(hyperbus->rpc.dev);
>  }
>  
> +static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
> +	{ .name = "rpc-if-hyperflash" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
> +
>  static struct platform_driver rpcif_platform_driver = {
>  	.probe	= rpcif_hb_probe,
>  	.remove_new = rpcif_hb_remove,
> +	.id_table = rpc_if_hyperflash_id_table,
>  	.driver	= {
>  		.name	= "rpc-if-hyperflash",
>  	},

-- 
Regards
Vignesh

