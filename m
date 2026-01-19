Return-Path: <linux-renesas-soc+bounces-27060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B09D3B54D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63A963006711
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F132D7FB;
	Mon, 19 Jan 2026 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mq28j4HU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494153346BC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846452; cv=none; b=Z+JKTO6PaF3T5pGIlSvlUY19EPDu5EKb9RanHAkDV8eutRzbPh9FER4bIprv7L55Ls8L53bLd6mALse1GkZXt4uA2f01IZgX/o9Yb32U7mHwexyZHaUwAyvTFngnPVZNpWTOno88zNbbMzrDYGTiIB0sp0pR/2B5HAN9wBVA0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846452; c=relaxed/simple;
	bh=4Fyy5F1MbMK5D2+wXHupBsG43QgqkaYW96mBVoNyYG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6s2HmozNr8o9Irtghpu7liv3BxZDjh483mtRzkGAwvSihN+RJKkntXUXFL0nNvTom0F19yEZ26pyqqgfNKydoeAlp/3dge67KqO3pW59846ZMgvuY/VI2pyLSxjTsJPUwazUn12k5Gz6beEHBTDiqWldgX0j7CpAfkcPbEL6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mq28j4HU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8710c9cddbso562756166b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768846445; x=1769451245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAqjEspXY6zk1wpaBVOJfPfZZ59MneWSNApqQkZLBm8=;
        b=Mq28j4HUfqmtaUsKJ+z12lidoKBriXs4AnZDuGlTGqwjxt3VeNKT8Sp3AgP1DN6mJA
         gMjoQDCwTlhzj6Voq4nNd/4vPUfFnkMY8aUkENVP8w2jKNyGTS8KNVOK8JxOOrLMUtJV
         B7vYoHhAZ4kxinZXyAAl5JNLvbbYeUQG9kmTv499RoN18kF7zfjWSEPwXwo2Nu1d4qLA
         5OtDcqU44zw/jQbjvC2HkHJ2n/6U6iUcsp+tzaJXrWji/F6eSf+D22xPR8kyvcohbjt1
         aAS2EPX49Acg95mCC2Eml7/tXj/IsONtw/4Hzx3xkriDR6j1/e2r5udz4Us3GxftJagT
         VVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846445; x=1769451245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAqjEspXY6zk1wpaBVOJfPfZZ59MneWSNApqQkZLBm8=;
        b=PM2xGcJgMfIWShu0ySUVhX9rzts4y5P+n2gqJMOxZR94BM2Ir7rXcw/n9yuMBcrVuK
         8NWRuawvAE49Tf6P6Yn5H80Z5bFgD84FIEPfHSsY+m1Y157xaqlGrdNaPAwbB5qD9AB5
         RquzS77424vOfEqVjVbfG1S40mtLXGfmSR4BXq4lEPMwvGPTksakvJ0Bpu1C5wyIFL76
         34x+t5tywtbX3veCqRwkYwA0DFy4E8PLbmqhEqjPnIUpdrLH+5f2caZhWE90UMxhKIXv
         uq3j9D+Pm3P99jjNPB5PErdrNi0NYJYTPmESbXO0Trzfq0H5zKmzngPPPB4Dgih5okKk
         I9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz1kZgeYg0pYpdXdAXYDRztbF4eUZ8v2PVgnDGDqLHJng81QOzZvB9m0tO+exQ1Wa8JTy5gskBhWUMqQZepcM75g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZ/87sqlDd2kUABeJnNlFFhbrThT2VxRo2IuCPd0gVcsgCjRK
	MZYc2e5G06W+zG9nuQEKzfL3G0rTj3ULcfqxEuwJuEQfCCEmEONaA3I8UKu42hU7t2M=
X-Gm-Gg: AY/fxX734CT6GXn24qKHGxYUqMa3LSLW/7dPT3kf6UT4XM9SUeuk7OIxYFJgQoyCJGY
	jGk7RL3r/fMUEB2pDGbUYr6UoJ/DjAh1pLkNX0C9sNiNFS/9uojLrH2dNNgTuqS+RWRMoniNtIw
	l6f9Hx4jKwFRyVBOm7Dm+yxBkDtZyObUhmLwwrTE6hWs1BMXd+qxqXBBlKsszaxn1AsqpI5swMU
	sDktWPDKN47GFEfJs6rNqWcC2yQ4R2eH9YYU2lfL0OO6+fE92R7xWcASLEF7/7QXBOOdx/yPqXQ
	fNiNnKm+8uPhwc6HFt0yRjW1yD2bE3nF29fCAvvYrRGhy8a8oclv6cm63KdkG+d2EgvlVR5/zrx
	U8xHXX+MF18tnrpjylhOuL/y4RgZ3On1FTXCyuyrglBxULoGCJ4HJvTpFhOWMTVGUFtlmscoXBJ
	Q9eM9amCn7n/sw7Gzq4iAXsWFEW10l
X-Received: by 2002:a17:907:a05:b0:b87:2e8a:e256 with SMTP id a640c23a62f3a-b8796afd52fmr1113254066b.31.1768846445120;
        Mon, 19 Jan 2026 10:14:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1a3sm1155867766b.62.2026.01.19.10.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:14:04 -0800 (PST)
Message-ID: <34bd51e6-c93d-40fd-bf5a-8f476c4e1776@tuxon.dev>
Date: Mon, 19 Jan 2026 20:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-7-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-7-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 93 +++++++++++++++++-------
>   1 file changed, 67 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 205b60421be1..44728771afa3 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -159,10 +159,6 @@
>   
>   #define RZG3S_PCI_CFG_PCIEC			0x60
>   
> -/* System controller registers */
> -#define RZG3S_SYS_PCIE_RST_RSM_B		0xd74
> -#define RZG3S_SYS_PCIE_RST_RSM_B_MASK		BIT(0)
> -
>   /* Maximum number of windows */
>   #define RZG3S_MAX_WINDOWS			8
>   
> @@ -174,6 +170,34 @@
>   /* Timeouts experimentally determined */
>   #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
>   
> +/**
> + * struct rzg3s_sysc_function - System Controller register function descriptor
> + * @offset: Register offset from the System Controller base address
> + * @mask: Bit mask for the function within the register
> + */
> +struct rzg3s_sysc_function {
> +	u32 offset;
> +	u32 mask;
> +};
> +
> +/**
> + * struct rzg3s_sysc_info - RZ/G3S System Controller function info
> + * @rst_rsm_b: Reset RSM_B function descriptor
> + */
> +struct rzg3s_sysc_info {
> +	struct rzg3s_sysc_function rst_rsm_b;
> +};
> +
> +/**
> + * struct rzg3s_sysc - RZ/G3S System Controller descriptor
> + * @regmap: System controller regmap
> + * @info: System controller info
> + */
> +struct rzg3s_sysc {
> +	struct regmap *regmap;
> +	const struct rzg3s_sysc_info *info;
> +};
> +
>   /**
>    * struct rzg3s_pcie_msi - RZ/G3S PCIe MSI data structure
>    * @domain: IRQ domain
> @@ -203,6 +227,7 @@ struct rzg3s_pcie_host;
>    *                power-on
>    * @cfg_resets: array with the resets that need to be de-asserted after
>    *              configuration
> + * @sysc_info: SYSC functionalities
>    * @num_power_resets: number of power resets
>    * @num_cfg_resets: number of configuration resets
>    */
> @@ -210,6 +235,7 @@ struct rzg3s_pcie_soc_data {
>   	int (*init_phy)(struct rzg3s_pcie_host *host);
>   	const char * const *power_resets;
>   	const char * const *cfg_resets;
> +	struct rzg3s_sysc_info sysc_info;
>   	u8 num_power_resets;
>   	u8 num_cfg_resets;
>   };
> @@ -233,7 +259,7 @@ struct rzg3s_pcie_port {
>    * @dev: struct device
>    * @power_resets: reset control signals that should be set after power up
>    * @cfg_resets: reset control signals that should be set after configuration
> - * @sysc: SYSC regmap
> + * @sysc: SYSC descriptor
>    * @intx_domain: INTx IRQ domain
>    * @data: SoC specific data
>    * @msi: MSI data structure
> @@ -248,7 +274,7 @@ struct rzg3s_pcie_host {
>   	struct device *dev;
>   	struct reset_control_bulk_data *power_resets;
>   	struct reset_control_bulk_data *cfg_resets;
> -	struct regmap *sysc;
> +	struct rzg3s_sysc *sysc;
>   	struct irq_domain *intx_domain;
>   	const struct rzg3s_pcie_soc_data *data;
>   	struct rzg3s_pcie_msi msi;
> @@ -1516,6 +1542,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	struct device_node *sysc_np __free(device_node) =
>   		of_parse_phandle(np, "renesas,sysc", 0);
>   	struct rzg3s_pcie_host *host;
> +	struct rzg3s_sysc *sysc;
>   	int ret;
>   
>   	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
> @@ -1527,6 +1554,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	host->data = device_get_match_data(dev);
>   	platform_set_drvdata(pdev, host);
>   
> +	host->sysc = devm_kzalloc(dev, sizeof(*host->sysc), GFP_KERNEL);
> +	if (!host->sysc)
> +		return -ENOMEM;
> +
> +	sysc = host->sysc;
> +	sysc->info = &host->data->sysc_info;
> +
>   	host->axi = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(host->axi))
>   		return PTR_ERR(host->axi);
> @@ -1540,15 +1574,16 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	host->sysc = syscon_node_to_regmap(sysc_np);
> -	if (IS_ERR(host->sysc)) {
> -		ret = PTR_ERR(host->sysc);
> +	sysc->regmap = syscon_node_to_regmap(sysc_np);
> +	if (IS_ERR(sysc->regmap)) {
> +		ret = PTR_ERR(sysc->regmap);
>   		goto port_refclk_put;
>   	}
>   
> -	ret = regmap_update_bits(host->sysc, RZG3S_SYS_PCIE_RST_RSM_B,
> -				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
> -				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
> +	ret = regmap_update_bits(sysc->regmap,
> +				 sysc->info->rst_rsm_b.offset,

This can stay on the previous line to spare one extra line of code.

The rest LGTM.

Thank you,
Claudiu

