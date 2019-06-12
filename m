Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9DAC42C93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 18:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407598AbfFLQrE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 12:47:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49970 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406491AbfFLQrD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 12:47:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CGkY4I022541;
        Wed, 12 Jun 2019 11:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560357995;
        bh=CaFpyRIxwj6cSdQsuOwsIHmqQ2IfrMQIaYQ3U++Z27Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NEc+RJH0WXZmtXRbOLhjG2JqN41tESDGPuCyRM8XwQk/lPZrhycD910fTQKg+KlBS
         zEU6YfZKpJc1aVutG1Rm0unrAT8aEUSEJ9qGskp7jz48qAzCktcLwcLGkSM7bN979k
         vIdHg52D4VOWIg5ANgDvODV8s308J++ZJSTqEPmA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CGkYv0089896
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Jun 2019 11:46:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 11:46:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 11:46:34 -0500
Received: from [10.250.133.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CGkUaW012618;
        Wed, 12 Jun 2019 11:46:31 -0500
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
To:     <Tudor.Ambarus@microchip.com>, <geert@linux-m68k.org>,
        <marek.vasut+renesas@gmail.com>, <marek.vasut@gmail.com>,
        <jonas@norrbonn.se>
CC:     <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
 <20190610062351.24405-1-tudor.ambarus@microchip.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d2cf93a3-4fab-1d0e-6006-7b58d3bdd272@ti.com>
Date:   Wed, 12 Jun 2019 22:16:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610062351.24405-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 10-Jun-19 11:54 AM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> SPI memory devices from different manufacturers have widely
> different configurations for Status, Control and Configuration
> registers. JEDEC 216C defines a new map for these common register
> bits and their functions, and describes how the individual bits may
> be accessed for a specific device. For the JEDEC 216B compliant
> flashes, we can partially deduce Status and Configuration registers
> functions by inspecting the 16th DWORD of BFPT. Older flashes that
> don't declare the SFDP tables (SPANSION FL512SAIFG1 311QQ063 A ©11
> SPANSION) let the software decide how to interact with these registers.
> 
> The commit dcb4b22eeaf4 ("spi-nor: s25fl512s supports region locking")
> uncovered a probe error for s25fl512s, when the QUAD bit CR[1] was set
> in the bootloader. When this bit is set, only the Write Register
> WRR command format with 16 data bits may be used, WRR with 8 bits
> is not recognized and hence the error when trying to clear the block
> protection bits.
> 

I see above text in s25fl512s datasheet[1] as well. So the patch is
indeed needed:

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Also, I was able to reproduce above scenario with TI's K2G EVM with
s25fl512s flash and can confirm that this patch fixes the issue:

Tested-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

[1] https://www.cypress.com/file/177971/download 9.3.7 Write Registers
> Fix the above by using 16-bits WRR command when Quad bit is set.
> 
> Backward compatibility should be fine. The newly introduced
> spi_nor_spansion_clear_sr_bp() is tightly coupled with the
> spansion_quad_enable() function. Both assume that the Write Register
> with 16 bits, together with the Read Configuration Register (35h)
> instructions are supported.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Geert, Jonas,
> 
> This patch is compile-tested only. I don't have the flash, I need your
> help for testing this.
> 
> Thanks,
> ta
> 
>  drivers/mtd/spi-nor/spi-nor.c | 116 ++++++++++++++++++++++++++++++++++++++----
>  include/linux/mtd/spi-nor.h   |   1 +
>  2 files changed, 106 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c0a8837c0575..af9ac7f09cc2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1636,6 +1636,92 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/**
> + * spi_nor_clear_sr_bp() - clear the Status Register Block Protection bits.
> + * @nor:        pointer to a 'struct spi_nor'
> + *
> + * Read-modify-write function that clears the Block Protection bits from the
> + * Status Register without affecting other bits.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_clear_sr_bp(struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	ret = read_sr(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error while reading status register\n");
> +		return ret;
> +	}
> +
> +	write_enable(nor);
> +
> +	ret = write_sr(nor, ret & ~mask);
> +	if (ret) {
> +		dev_err(nor->dev, "write to status register failed\n");
> +		return ret;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		dev_err(nor->dev, "timeout while writing status register\n");
> +	return ret;
> +}
> +
> +/**
> + * spi_nor_spansion_clear_sr_bp() - clear the Status Register Block Protection
> + * bits on spansion flashes.
> + * @nor:        pointer to a 'struct spi_nor'
> + *
> + * Read-modify-write function that clears the Block Protection bits from the
> + * Status Register without affecting other bits. The function is tightly
> + * coupled with the spansion_quad_enable() function. Both assume that the Write
> + * Register with 16 bits, together with the Read Configuration Register (35h)
> + * instructions are supported
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 sr_cr[2] = {0};
> +
> +	/* Check current Quad Enable bit value. */
> +	ret = read_cr(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while reading configuration register\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * When the configuration register QUAD bit CR[1] is 1, only
> +	 * the WRR command format with 16 data bits may be used.
> +	 */
> +	if (ret & CR_QUAD_EN_SPAN) {
> +		sr_cr[1] = ret;
> +
> +		ret = read_sr(nor);
> +		if (ret < 0) {
> +			dev_err(nor->dev,
> +				"error while reading status register\n");
> +			return ret;
> +		}
> +		sr_cr[0] = ret & ~mask;
> +
> +		ret = write_sr_cr(nor, sr_cr);
> +		if (ret)
> +			dev_err(nor->dev, "16-bit write register failed\n");
> +		return ret;
> +	}
> +
> +	/* If quad bit is not set, use 8-bit WRR command. */
> +	return spi_nor_clear_sr_bp(nor);
> +}
> +
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>  		.id = {							\
> @@ -3663,6 +3749,8 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  		default:
>  			/* Kept only for backward compatibility purpose. */
>  			params->quad_enable = spansion_quad_enable;
> +			if (nor->clear_sr_bp)
> +				nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>  			break;
>  		}
>  
> @@ -3915,17 +4003,13 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
>  
> -	/*
> -	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> -	 * with the software protection bits set
> -	 */
> -	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
> -	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
> -	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
> -	    nor->info->flags & SPI_NOR_HAS_LOCK) {
> -		write_enable(nor);
> -		write_sr(nor, 0);
> -		spi_nor_wait_till_ready(nor);
> +	if (nor->clear_sr_bp) {
> +		err = nor->clear_sr_bp(nor);
> +		if (err) {
> +			dev_err(nor->dev,
> +				"fail to clear block protection bits\n");
> +			return err;
> +		}
>  	}
>  
>  	if (nor->quad_enable) {
> @@ -4050,6 +4134,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (info->flags & SPI_S3AN)
>  		nor->flags |=  SNOR_F_READY_XSR_RDY;
>  
> +	/*
> +	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> +	 * with the software protection bits set.
> +	 */
> +	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
> +	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
> +	    nor->info->flags & SPI_NOR_HAS_LOCK)
> +		nor->clear_sr_bp = spi_nor_clear_sr_bp;
> +
>  	/* Parse the Serial Flash Discoverable Parameters table. */
>  	ret = spi_nor_init_params(nor, &params);
>  	if (ret)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b0ee3d..566bd5010bc8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -410,6 +410,7 @@ struct spi_nor {
>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*quad_enable)(struct spi_nor *nor);
> +	int (*clear_sr_bp)(struct spi_nor *nor);
>  
>  	void *priv;
>  };
> 
