Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68D373B215
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 11:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbfFJJ2d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 05:28:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40475 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388216AbfFJJ2d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 05:28:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id a21so7243019ljh.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2019 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=siqDWvGSxvpmTq2GM5l552jdMTJFA9bvabxI7lDs8sw=;
        b=M9UkW3UPLP9GJr/RX3CrUt/jlkZJFeuT8xn9FDO/o0bCTKm3BUpm+VS2jfEfaFXAda
         rsALVxrCr4vcm45HVjeopfXPfGr+nAbf6y494V78N1MaBSQuE2UrGfCPgXYo5KMAQ9XF
         fkbrMEzn5GbgduyyIfXA1hAIvGEf3sJwS7S16AAk1OPP+4LYQ8Pb8pgnOjUWKwG5Vgbk
         FMD7096bhBhdzS/KFWiL9Wl+ioJJ0vhyUCRbpYHR3/GHXxTV2XoKJcxSB9qbNDRpdiwc
         kMNHrcApaUuakOyY8iQ7XD6YcfKT2HC3LpdWheqw9JfBOziEnPiGu1oDbTE0X09FqE+d
         +1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=siqDWvGSxvpmTq2GM5l552jdMTJFA9bvabxI7lDs8sw=;
        b=C2yd7kH/p3KyRPFHmzlpC89Q1KSvnG4ru9b1E8j8ZLGWTPu2NUFVKVoOkIvAfpAgbS
         0LqTE+mjpvzCkQLkXstmCektFGY/jam4rF3ubp3tt8XXAm7m+WMeps8UIwzaQsk82MJ8
         7PQJyj+nFULbndHnMaA2IcVo920eiiwiYVbT4Q+Jf0MK6J5xb1DacfOqr9Efc52blJAd
         lHhF/N3u656L7GBgj4tbweEgexwqn4XWG3SsZKGTjrOkoR1XIkEwf3Bntx6/sT+0UJC+
         6iVAEAbK2VGje8yHLlp/oIJxE2+nMCyNa3f6Z4xoi8pfYcaptbEF0XWvxyXQvFtdCE2A
         6voA==
X-Gm-Message-State: APjAAAWWcrvg1rZvdNBakcoSThSkX0Ii3V5DIon6Z75RVinqVpyX2RcL
        P98k6xNmCmKfL8JVFMuD//dHv6TPlIo=
X-Google-Smtp-Source: APXvYqwTwqoLaAq9vX4Zoq2YgFBIJYHMlu+uKRsYN5By8Xhb99xxFDC8Uata1k4OsVPpJ3zmmHWJDA==
X-Received: by 2002:a2e:9c4d:: with SMTP id t13mr36547053ljj.106.1560158908417;
        Mon, 10 Jun 2019 02:28:28 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
        by smtp.gmail.com with ESMTPSA id q7sm2218753ljc.45.2019.06.10.02.28.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 02:28:27 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
To:     Tudor.Ambarus@microchip.com, geert@linux-m68k.org,
        marek.vasut+renesas@gmail.com, marek.vasut@gmail.com,
        vigneshr@ti.com
Cc:     dwmw2@infradead.org, computersforpeace@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
 <20190610062351.24405-1-tudor.ambarus@microchip.com>
From:   Jonas Bonn <jonas@norrbonn.se>
Message-ID: <f4b968d3-b982-68e7-e8e4-d153875f0e1f@norrbonn.se>
Date:   Mon, 10 Jun 2019 11:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610062351.24405-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On 10/06/2019 08:24, Tudor.Ambarus@microchip.com wrote:
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

Tested this on my hardware.  It works fine in the non-quad case.

Tested-by: Jonas Bonn <jonas@norrbonn.se>

/Jonas

> 
> Thanks,
> ta
> 
>   drivers/mtd/spi-nor/spi-nor.c | 116 ++++++++++++++++++++++++++++++++++++++----
>   include/linux/mtd/spi-nor.h   |   1 +
>   2 files changed, 106 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c0a8837c0575..af9ac7f09cc2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1636,6 +1636,92 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>   	return 0;
>   }
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
>   /* Used when the "_ext_id" is two bytes at most */
>   #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>   		.id = {							\
> @@ -3663,6 +3749,8 @@ static int spi_nor_init_params(struct spi_nor *nor,
>   		default:
>   			/* Kept only for backward compatibility purpose. */
>   			params->quad_enable = spansion_quad_enable;
> +			if (nor->clear_sr_bp)
> +				nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>   			break;
>   		}
>   
> @@ -3915,17 +4003,13 @@ static int spi_nor_init(struct spi_nor *nor)
>   {
>   	int err;
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




>   	}
>   
>   	if (nor->quad_enable) {
> @@ -4050,6 +4134,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>   	if (info->flags & SPI_S3AN)
>   		nor->flags |=  SNOR_F_READY_XSR_RDY;
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
>   	/* Parse the Serial Flash Discoverable Parameters table. */
>   	ret = spi_nor_init_params(nor, &params);
>   	if (ret)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b0ee3d..566bd5010bc8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -410,6 +410,7 @@ struct spi_nor {
>   	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>   	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>   	int (*quad_enable)(struct spi_nor *nor);
> +	int (*clear_sr_bp)(struct spi_nor *nor);
>   
>   	void *priv;
>   };
> 
