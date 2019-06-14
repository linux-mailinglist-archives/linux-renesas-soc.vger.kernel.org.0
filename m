Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2DEA45586
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFNHQn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:16:43 -0400
Received: from verein.lst.de ([213.95.11.211]:44697 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfFNHQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:16:43 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 660D968B02; Fri, 14 Jun 2019 09:16:14 +0200 (CEST)
Date:   Fri, 14 Jun 2019 09:16:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 1/5] iommu: add an exported function to get
 minimum page size for a domain
Message-ID: <20190614071614.GA8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190613193759.GB6863@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613193759.GB6863@kunai>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 09:37:59PM +0200, Wolfram Sang wrote:
> What about making this a 'static inline' in the iommu header file? I'd
> think it is simple enough and would save us the EXPORT symbol.

Agreed, this seems simple enought for an inline.
