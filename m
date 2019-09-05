Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C58A9D68
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 10:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbfIEIpB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 04:45:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59626 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731248AbfIEIpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 04:45:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D3A0125B753;
        Thu,  5 Sep 2019 18:44:58 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C9EC1940AC6; Thu,  5 Sep 2019 10:44:56 +0200 (CEST)
Date:   Thu, 5 Sep 2019 10:44:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Disable cache snoop transactions
 on R-Car Gen3
Message-ID: <20190905084456.bzbb2wpivignlyhr@verge.net.au>
References: <20190904120802.2163-1-geert+renesas@glider.be>
 <20190904120802.2163-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904120802.2163-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 02:08:02PM +0200, Geert Uytterhoeven wrote:
> From: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> 
> According to the Hardware Manual Errata for Rev. 1.50 of April 10, 2019,
> cache snoop transactions for page table walk requests are not supported
> on R-Car Gen3.
> 
> Hence, this patch removes setting these fields in the IMTTBCR register,
> since it will have no effect, and adds comments to the register bit
> definitions, to make it clear they apply to R-Car Gen2 only.
> 
> Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> [geert: Reword, add comments]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

