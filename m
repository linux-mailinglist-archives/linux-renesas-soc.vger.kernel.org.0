Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F28109C85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 11:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfKZKtP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 05:49:15 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:24871 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfKZKtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 05:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574765352;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=zaxWrXVwedwpmcCjiQ+TTfmnBu4fuUo344obZYZj67Y=;
        b=XSIGQ3y0r3VmlMLw1fY1a4Ru+FOxXKd29Kfr2aWas9KSvtil1GbwfWEpqjMbIMndRP
        aGKntZc9VGsDc1gSUFCMLxogFP4OlTtR6Q9pWfqr8ySIi4cQvOgzn7KJ5jqRwP8uYk04
        WWVzVTSQA0ulrlhF/Fcz2pKn1NmdVZilEMDYRswGCIM28ueZVd76tqkNgPBzHMTKsaXw
        rgMVAG1DWFluzjx51E6kHrvqSJq53I1IzLXX9WAcnQ1TZ/t26dJ4RwEmBNn5wPXZue5O
        7BPn6NnyhFiq+16WT2o2zZh/gT/XrPY6EqZjnkAhhWzOISoOXyRo2B8vsQq3cBhDMGGR
        Gf8A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 45.0.2 AUTH)
        with ESMTPSA id k05717vAQAk84Oe
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 Nov 2019 11:46:08 +0100 (CET)
Date:   Tue, 26 Nov 2019 11:46:08 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <837048895.1354220.1574765168549@webmail.strato.com>
In-Reply-To: <1574403231-18512-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 3/4] mmc: host: renesas_sdhi_sys_dmac: add DMACR
 setting
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On November 22, 2019 at 7:13 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> 
> 
> This patch adds DMACR setting which needs to use the 32 bytes
> transfer mode of SYS-DMAC.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 234551a..d9a69f6 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -20,6 +20,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/clk.h>
> +#include <linux/dmaengine.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -46,6 +47,12 @@
>  #define SDHI_VER_GEN3_SD	0xcc10
>  #define SDHI_VER_GEN3_SDMMC	0xcd10
>  
> +#define DMACR_SDR104		0x192
> +#define DMACR_SDR104_32BYTE	0x0004
> +#define DMACR_SDR50		0xe4
> +#define DMACR_SDR50_32BYTE	0x000a
> +#define DMACR_2_OR_4BYTE	0x0000
> +

Could you give me a pointer to where these magic numbers are documented? In my (rather old) SDHI docs the register addresses don't match.

>  struct renesas_sdhi_quirks {
>  	bool hs400_disabled;
>  	bool hs400_4taps;
> @@ -604,6 +611,32 @@ static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
>  	return blk_size;
>  }
>  
> +static void renesas_sdhi_set_dmacr(struct tmio_mmc_host *host)
> +{
> +	struct renesas_sdhi *priv = host_to_priv(host);
> +	u16 val = DMACR_2_OR_4BYTE;
> +	u16 reg;
> +	enum dma_slave_buswidth width = priv->dma_priv.dma_buswidth;
> +
> +	switch (sd_ctrl_read16(host, CTL_VERSION)) {
> +	case SDHI_VER_GEN2_SDR50:
> +		if (width == DMA_SLAVE_BUSWIDTH_32_BYTES)
> +			val = DMACR_SDR50_32BYTE;
> +		reg = DMACR_SDR50;
> +		break;
> +	case SDHI_VER_GEN2_SDR104:
> +		if (width == DMA_SLAVE_BUSWIDTH_32_BYTES)
> +			val = DMACR_SDR104_32BYTE;
> +		reg = DMACR_SDR104;
> +		break;
> +	default:
> +		/* nothing to do */
> +		return;
> +	}
> +
> +	sd_ctrl_write16(host, reg, val);
> +}
> +
>  static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>  {
>  	/* Iff regs are 8 byte apart, sdbuf is 64 bit. Otherwise always 32. */
> @@ -611,6 +644,8 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>  
>  	sd_ctrl_write16(host, CTL_DMA_ENABLE, enable ? DMA_ENABLE_DMASDRW : 0);
>  	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
> +
> +	renesas_sdhi_set_dmacr(host);
>  }
>  
>  static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
> -- 
> 2.7.4
>

Assuming that the register addresses are correct,
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
