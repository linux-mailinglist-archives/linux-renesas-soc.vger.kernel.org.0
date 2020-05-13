Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144E31D10BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 13:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgEMLLn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 07:11:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbgEMLLm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 07:11:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E84FC20740;
        Wed, 13 May 2020 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589368302;
        bh=kB4BWkMLJvEVQMf12Y4rt6Z8k9k+beZBrh8w5LEeOC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ggdEz4sDEWOID0Yd2ORMuaDmi+wBlTPXxdrWv1CfvfWn9EoFyHlUFA6XCYWaOw4al
         sfZ9l/kfuNgnJhAzEre6uD3f074n2DLVKJ7RtEPL9itu5zQI9GxV8QVIj+BVumI2Nz
         +Wi8CVrAl1eVAqy7dePYH8qzLn9xO6Fq39ZjbEXc=
Date:   Wed, 13 May 2020 13:11:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
        Christoph Hellwig <hch@lst.de>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ata: sata_rcar: Fix DMA boundary mask
Message-ID: <20200513111140.GA874221@kroah.com>
References: <20200513110426.22472-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513110426.22472-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 13, 2020 at 01:04:26PM +0200, Geert Uytterhoeven wrote:
> Before commit 9495b7e92f716ab2 ("driver core: platform: Initialize
> dma_parms for platform devices"), the R-Car SATA device didn't have DMA
> parameters.  Hence the DMA boundary mask supplied by its driver was
> silently ignored, as __scsi_init_queue() doesn't check the return value
> of dma_set_seg_boundary(), and the default value of 0xffffffff was used.
> 
> Now the device has gained DMA parameters, the driver-supplied value is
> used, and the following warning is printed on Salvator-XS:
> 
>     DMA-API: sata_rcar ee300000.sata: mapping sg segment across boundary [start=0x00000000ffffe000] [end=0x00000000ffffefff] [boundary=0x000000001ffffffe]
>     WARNING: CPU: 5 PID: 38 at kernel/dma/debug.c:1233 debug_dma_map_sg+0x298/0x300
> 
> (the range of start/end values depend on whether IOMMU support is
>  enabled or not)
> 
> The issue here is that SATA_RCAR_DMA_BOUNDARY doesn't have bit 0 set, so
> any typical end value, which is odd, will trigger the check.
> 
> Fix this by increasing the DMA boundary value by 1.
> 
> Fixes: 8bfbeed58665dbbf ("sata_rcar: correct 'sata_rcar_sht'")
> Fixes: 9495b7e92f716ab2 ("driver core: platform: Initialize dma_parms for platform devices")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cc: stable <stable@vger.kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
