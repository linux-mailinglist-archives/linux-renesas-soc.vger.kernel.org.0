Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442F780185
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 22:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406916AbfHBUCw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 16:02:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42948 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406914AbfHBUCw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 16:02:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so73946356lje.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Aug 2019 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hpuTzhx1FVHJuZgr5jSuA0pIA55oDK7JUhCEyDcVxSE=;
        b=wBmt0ywLgJWYJj9xynw/KNxS4SjEr9t/KIEOPU24ufBNh19LovY3N7lJPm24nnqQ20
         pIKJTS1vLifN8c/woH0Oci4IWjOAFLYr6r8eUw5pCEq8B2d/myDS1Bb7AA2ubg4f/pz8
         I7z8m93YOo+xslV5nrBNuYZok8tVIdfNZ/RoU8whUspDiy6ovAEvzCTcGOue5S/0FdsR
         adfDiYkW8sCdw/qcymjvfpWxnxVQxJDB09Ht3CFphaHGDujMqpjiLwBL3d900USKyhQb
         gZVLgsa/d1BNdPl5fOJcmSV2+RnKYKaZpF/sozNkgPtVsLYfwF1VMTC6zjigDx83L5Ec
         wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hpuTzhx1FVHJuZgr5jSuA0pIA55oDK7JUhCEyDcVxSE=;
        b=ZYvZIOMBbyfTidqRhbvqpgYyZg3u3k4ZGqniCJ+lprtBbfawqMHZ1ibJ8IGj+kjYwz
         h56IP9Y/Q8M3W2VMkhOZkB51Dz82Fp4EdY9yE4M/i6giNR3eJ0ye4/hM+l3jN0JlE1nb
         HqPz+c3lEqTMsdJeHRm//Ovn5ywO0wtTw++unVJZsJhYLDH/QGfASUEcfaqfvsp+Fx/c
         9tX/k6oB2eA38cStVucXg7sKpkphfh+dyQgTi8f3CUAkxGrVbgBYxR+YEs7pr1z3cwQx
         sqjzsjBcukH3VgY9Eu4cIKOMHz8L3FvRqAPIOKnM/Rxlpt1sy5JowDuBhY/sMI4akXgP
         22sA==
X-Gm-Message-State: APjAAAU1LzHZ8TiY99Uqj3tbLraa5xpcQE/rOrZFn8mqDLVK2Nqfrbuj
        M9jRdv/1TIsNmFxG29OhcDCawg==
X-Google-Smtp-Source: APXvYqymmJrFLTIXAe+TUNpfoqDVseuubO+65puK/r0ZaVIIPwwihmwSZMwKoArtmav+J1QnBRcwHw==
X-Received: by 2002:a2e:7a19:: with SMTP id v25mr1650866ljc.39.1564776170382;
        Fri, 02 Aug 2019 13:02:50 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:29d:bda0:a422:fe4d:8f49:44c4])
        by smtp.gmail.com with ESMTPSA id j23sm13046148lfb.93.2019.08.02.13.02.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 13:02:49 -0700 (PDT)
Subject: Re: [PATCH v16 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        lee.jones@linaro.org, marek.vasut@gmail.com,
        miquel.raynal@bootlin.com
References: <1564539258-16313-1-git-send-email-masonccyang@mxic.com.tw>
 <1564539258-16313-2-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3d01957a-7318-274f-f3d5-6cd00850511b@cogentembedded.com>
Date:   Fri, 2 Aug 2019 23:02:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1564539258-16313-2-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 07/31/2019 05:14 AM, Mason Yang wrote:

> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]
> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c
> new file mode 100644
> index 0000000..648d14e
> --- /dev/null
> +++ b/drivers/spi/spi-renesas-rpc.c
> @@ -0,0 +1,754 @@
[...]
> +static void rpc_spi_hw_init(struct rpc_spi *rpc)
> +{
> +	//
> +	// NOTE: The 0x260 are undocumented bits, but they must be set.
> +	//	 RPC_PHYCNT_STRTIM is strobe timing adjustment bit,
> +	//	 0x0 : the delay is biggest,
> +	//	 0x1 : the delay is 2nd biggest,
> +	//	 On H3 ES1.x, the value should be 0, while on others,
> +	//	 the value should be 6.
> +	//
> +	regmap_write(rpc->regmap, RPC_PHYCNT, RPC_PHYCNT_CAL |
> +				  RPC_PHYCNT_STRTIM(6) | 0x260);
> +
> +	//
> +	// NOTE: The 0x1511144 are undocumented bits, but they must be set
> +	//       for RPC_PHYOFFSET1.
> +	//	 The 0x31 are undocumented bits, but they must be set
> +	//	 for RPC_PHYOFFSET2.
> +	//
> +	regmap_write(rpc->regmap, RPC_PHYOFFSET1, RPC_PHYOFFSET1_DDRTMG(3) |
> +		     0x1511144);
> +	regmap_write(rpc->regmap, RPC_PHYOFFSET2, 0x31 |
> +		     RPC_PHYOFFSET2_OCTTMG(4));
> +	regmap_write(rpc->regmap, RPC_SSLDR, RPC_SSLDR_SPNDL(7) |
> +		     RPC_SSLDR_SLNDL(7) | RPC_SSLDR_SCKDL(7));
> +	regmap_write(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD | RPC_CMNCR_SFDE |
> +		     RPC_CMNCR_MOIIO_HIZ | RPC_CMNCR_IOFV_HIZ |
> +		     RPC_CMNCR_BSZ(0));
> +}
[...]
> +static int rpc_spi_io_xfer(struct rpc_spi *rpc,
> +			   const void *tx_buf, void *rx_buf)
> +{
[...]
> +err_out:
> +	return reset_control_reset(rpc->rstc);

   Don't toy need to call rpc_spi_hw_init(( here? The reset would spoil
the PHY/etc register setup otherwise...

[...]

MBR, Sergei
