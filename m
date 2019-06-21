Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5249D4E106
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 09:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfFUHMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 03:12:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfFUHMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 03:12:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BF7B625AEE7;
        Fri, 21 Jun 2019 17:12:41 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C4B279408C4; Fri, 21 Jun 2019 09:12:39 +0200 (CEST)
Date:   Fri, 21 Jun 2019 09:12:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mmc: remove another TMIO MMC variant usdhi6rol0.c
Message-ID: <20190621071239.tjptw3k5oicbk3ni@verge.net.au>
References: <20190621060511.29609-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621060511.29609-1-yamada.masahiro@socionext.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 03:05:11PM +0900, Masahiro Yamada wrote:
> Renesas upstreamed two different drivers for (almost) the same hardware.
> usdhi6rol0.c is (what we call) "TMIO MMC", which I am 100% sure from the
> the register macros in usdhi6rol0.c.
> 
> As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
> MFD glue") said, the MMC controllers called tmio_mmc uses the IP from
> Panasonic. ('TMIO MMC' is a historical misnomer)
> 
> The macros in usdhi6rol0.c exactly match to the original datasheet
> published by Panasonic. (except the 'USDHI6_' prefix, of course).
> I formerly worked for Panasonic, and Socionext was split out from
> Panasonic. I can get access to the IP datasheet.
> 
> [The register comparison]
> 
>  tmio_mmc.h                          usdhi6rol0.c
> 
>  0x00 CTL_SD_CMD                     0x000 USDHI6_SD_CMD
>                                      0x004 USDHI6_SD_PORT_SEL
>  0x04 CTL_ARG_REG                    0x008 USDHI6_SD_ARG
>  0x08 CTL_STOP_INTERNAL_ACTION       0x010 USDHI6_SD_STOP
>  0x0a CTL_XFER_BLK_COUNT             0x014 USDHI6_SD_SECCNT
>  0x0c CTL_RESPONSE                   0x018 USDHI6_SD_RSP10
>                                      0x020 USDHI6_SD_RSP32
>                                      0x028 USDHI6_SD_RSP54
>                                      0x030 USDHI6_SD_RSP76
>  0x1c CTL_STATUS                     0x038 USDHI6_SD_INFO1
>                                      0x03c USDHI6_SD_INFO2
>  0x20 CTL_IRQ_MASK                   0x040 USDHI6_SD_INFO1_MASK
>                                      0x044 USDHI6_SD_INFO2_MASK
>  0x24 CTL_SD_CARD_CLK_CTL            0x048 USDHI6_SD_CLK_CTRL
>  0x26 CTL_SD_XFER_LEN                0x04c USDHI6_SD_SIZE
>  0x28 CTL_SD_MEM_CARD_OPT            0x050 USDHI6_SD_OPTION
>  0x2c CTL_SD_ERROR_DETAIL_STATUS     0x058 USDHI6_SD_ERR_STS1
>                                      0x05c USDHI6_SD_ERR_STS2
>  0x30 CTL_SD_DATA_PORT               0x060 USDHI6_SD_BUF0
>  0x34 CTL_TRANSACTION_CTL            0x068 USDHI6_SDIO_MODE
>  0x36 CTL_SDIO_STATUS                0x06c USDHI6_SDIO_INFO1
>  0x38 CTL_SDIO_IRQ_MASK              0x070 USDHI6_SDIO_INFO1_MASK
>  0xd8 CTL_DMA_ENABLE                 0x1b0 USDHI6_CC_EXT_MODE
>  0xe0 CTL_RESET_SD                   0x1c0 USDHI6_SOFT_RESET
>  0xe2 CTL_VERSION                    0x1c4 USDHI6_VERSION
>                                      0x1c8 USDHI6_HOST_MODE
>  0xe6 CTL_SDIF_MODE                  0x1cc USDHI6_SDIF_MODE
> 
> The offsets for tmio_mmc.h are half of those of usdhi6rol0.c because
> tmio_mmc was originally written for 16-bit bus platforms. The register
> stride is adjusted by ->bus_shift for modern SoCs.
> 
> The register names for usdhi6rol0.c are taken from the IP datasheet
> (with USDHI6_ prefixed). On the other hand, tmio_mmc largely renamed
> the registers.
> 
> You may think some registers are missing on the tmio_mmc side.
> Actually, the registers exists. For example, tmio_mmc merged
> 'SD_INFO1' and 'SD_INFO2' into the single macro 'CTL_STATUS', then
> get access to it by the crappy helper, sd_ctrl_write32_as_16_and_16().
> 
> As a summary, maintaining two drivers for the same hardware leads to
> maintenance nightmare.
> 
> The naming and the code quality for TMIO is unfortunate, but we cannot
> kill it since it is widely used. On the other hand, usdhi6rol0.c just
> supports a single platform. In fact, there is no DT in upstream for
> "renesas,usdhi6rol0":

I am fine with removing this driver on the basis that it is not used
upstream. I agree it would be good to get an Ack from @renesas.com.

> 
> $ git grep renesas,usdhi6rol0
> Documentation/devicetree/bindings/mmc/usdhi6rol0.txt:           "renesas,usdhi6rol0"
> Documentation/devicetree/bindings/mmc/usdhi6rol0.txt:   compatible = "renesas,usdhi6rol0";
> drivers/mmc/host/usdhi6rol0.c:  {.compatible = "renesas,usdhi6rol0"},
> 
> Delete this driver now. Please re-implement it based on tmio_mmc_core.c
> if needed.
> 
> Perhaps, some code snippets in this driver might be useful for cleaning
> tmio_mmc. It will stay in git history forever, and you can dig for it
> whenever you need it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

...
