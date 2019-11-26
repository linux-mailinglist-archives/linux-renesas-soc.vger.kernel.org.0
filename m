Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF176109C92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 11:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfKZKwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 05:52:17 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:23733 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfKZKwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 05:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574765535;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tCwy+Q7cYP/fryGdqaWLlJJmu/y1aBMBVN7PyTLfJhQ=;
        b=HUYMxHuXysSmi2U/beFceiq7obTvRhg6LwqH0F7t4dA4WpKafPj1efX1961VoQCJFt
        2zMbWiRlMS8Q5UksqLR0gHDC6vJV0XuOb1hUJ1tVKHFgTn9ZiPlTldrUc+8+iTegvqLz
        y92w/zbYoH0kKeYqFWa1iq8bhVvhGvcCvEk+hZHZN6+gYkbbfFTy/9yNVxLeAMFRt8vk
        2k8iFBYZq4a9HK4BFDgDKZGBwMfis9aKQaAuzEk/1RLQrCB7kIBsdcrpN1rhahJeCuRN
        HMtNPTV6jLOOAMlsLrAKidJVZ4ryeRmRAVAhdPe06Z75PgDrDar4DS7CK7nNPLjYDEY5
        zqDA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 45.0.2 AUTH)
        with ESMTPSA id k05717vAQAkF4Oh
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 Nov 2019 11:46:15 +0100 (CET)
Date:   Tue, 26 Nov 2019 11:46:15 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <173522043.1354245.1574765175403@webmail.strato.com>
In-Reply-To: <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set
 dma_buswidth value to 32 byte
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
> To improve performance, this patch sets dma_buswidth value to 32
> when transfer size is multiples of 32. In other words, a sd card
> transfer's size if not multiples of 32, this driver uses PIO
> and then the performance will be down.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 09137cc..65e71b6 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -58,7 +58,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>  	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_CMD23,
>  	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
> -	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_4_BYTES,
> +	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_32_BYTES,
>  	.dma_rx_offset	= 0x2000,
>  	.scc_offset	= 0x0300,
>  	.taps		= rcar_gen2_scc_taps,
> -- 
> 2.7.4
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
