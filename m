Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC714B7E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbfFSMQC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:16:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58580 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731808AbfFSMQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:16:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 898E825AF1B;
        Wed, 19 Jun 2019 22:15:59 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8BF799409FF; Wed, 19 Jun 2019 14:15:57 +0200 (CEST)
Date:   Wed, 19 Jun 2019 14:15:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: tmio: Use dma_max_mapping_size() instead of a
 workaround
Message-ID: <20190619121556.nrofsfnkxq5szxgq@verge.net.au>
References: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560920130-15475-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 01:55:30PM +0900, Yoshihiro Shimoda wrote:
> Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> provides a helper function to get the max mapping size, we can use
> the function instead of the workaround code for swiotlb.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
