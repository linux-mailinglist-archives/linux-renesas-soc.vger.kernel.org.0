Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBE45021E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 08:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbfFXGUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 02:20:43 -0400
Received: from verein.lst.de ([213.95.11.211]:52646 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbfFXGUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 02:20:43 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id ECC4C68AFE; Mon, 24 Jun 2019 08:20:09 +0200 (CEST)
Date:   Mon, 24 Jun 2019 08:20:09 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v7 1/5] dma: Introduce dma_get_merge_boundary()
Message-ID: <20190624062009.GA2989@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1561020610-953-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561020610-953-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
