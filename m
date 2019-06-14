Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423D945623
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfFNHZ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:25:29 -0400
Received: from verein.lst.de ([213.95.11.211]:44770 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbfFNHZ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:25:29 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 0A64268B02; Fri, 14 Jun 2019 09:25:00 +0200 (CEST)
Date:   Fri, 14 Jun 2019 09:24:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU
 can merge the segments
Message-ID: <20190614072459.GD8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 07:20:15PM +0900, Yoshihiro Shimoda wrote:
> +static unsigned int mmc_get_max_segments(struct mmc_host *host)
> +{
> +	return host->can_merge ? BLK_MAX_SEGMENTS : host->max_segs;
> +}

Note that BLK_MAX_SEGMENTS is really a little misnamed, it just
is a BLK_DEFAULT_SEGMENTS.  I think you are better of picking your
own value here (even if 128 ends up ok) than reusing this somewhat
confusing constant.

> +	/*
> +	 * Since blk_mq_alloc_tag_set() calls .init_request() of mmc_mq_ops,
> +	 * the host->can_merge should be set before to get max_segs from
> +	 * mmc_get_max_segments().
> +	 */
> +	if (host->max_segs < BLK_MAX_SEGMENTS &&
> +	    device_iommu_mapped(mmc_dev(host)))
> +		host->can_merge = 1;
> +	else
> +		host->can_merge = 0;
> +

can_merge seems a little too generic a name to me.  Maybe can_iommu_merge?
