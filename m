Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9399396423
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 17:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbfHTPVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 11:21:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37282 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfHTPVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:21:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 56FA125AD7E;
        Wed, 21 Aug 2019 01:21:05 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4954D9403FF; Tue, 20 Aug 2019 17:21:03 +0200 (CEST)
Date:   Tue, 20 Aug 2019 17:21:03 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: host: renesas_sdhi_sys_dmac: Remove all R-Car Gen3
 SoCs
Message-ID: <20190820152102.bve2uosohoq53g2m@verge.net.au>
References: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 05:43:10PM +0900, Yoshihiro Shimoda wrote:
> All R-Car Gen3 SoCs with any ES version cannot use this DMAC actually.
> So, this patch removes the compatibles of R-Car Gen3 SoCs from
> renesas_sdhi_sys_dmac_of_match. Since the previous code has
> an empty whitelist to prevent probing of R-Car Gen3 SoCs,
> no behavior changes.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
