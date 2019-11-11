Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D507F75F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2019 15:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfKKOHE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Nov 2019 09:07:04 -0500
Received: from 8bytes.org ([81.169.241.247]:51282 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbfKKOHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Nov 2019 09:07:04 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 720F2120; Mon, 11 Nov 2019 15:07:02 +0100 (CET)
Date:   Mon, 11 Nov 2019 15:07:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/6] iommu/ipmmu-vmsa: minor updates
Message-ID: <20191111140700.GB18333@8bytes.org>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 06, 2019 at 11:35:44AM +0900, Yoshihiro Shimoda wrote:
> Yoshihiro Shimoda (6):
>   iommu/ipmmu-vmsa: Remove all unused register definitions
>   iommu/ipmmu-vmsa: tidyup register definitions
>   iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>   iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>     macro
>   iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>   iommu/ipmmu-vmsa: Add utlb_offset_base
> 
>  drivers/iommu/ipmmu-vmsa.c | 214 +++++++++++++++++++--------------------------
>  1 file changed, 89 insertions(+), 125 deletions(-)

Applied, thanks.
