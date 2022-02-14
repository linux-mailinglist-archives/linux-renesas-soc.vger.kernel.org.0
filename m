Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118A34B512E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Feb 2022 14:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353908AbiBNNJS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Feb 2022 08:09:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiBNNJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 08:09:17 -0500
X-Greylist: delayed 544 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Feb 2022 05:09:10 PST
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108904B85D;
        Mon, 14 Feb 2022 05:09:10 -0800 (PST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 9DDC82FB; Mon, 14 Feb 2022 14:00:02 +0100 (CET)
Date:   Mon, 14 Feb 2022 14:00:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, robh+dt@kernel.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Message-ID: <YgpSUWjWMYZa9GoD@8bytes.org>
References: <20220208002030.1319984-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208002030.1319984-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 08, 2022 at 09:20:28AM +0900, Yoshihiro Shimoda wrote:
> This patch series is based on renesas-drivers-2022-01-11-v5.16 [1].
> Note that we have to prepare the following registers' setting
> in a bootloader (U-Boot) because the registers are protected.
> Otherwise, data mismatch happened if dmatest with the ipmmu is running.
> 
>  => mw eed01500 0xc0000000; mw eed41500 0xc0000000
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2022-01-11-v5.16
> 
> Changes from v2:
>  - Add Reviewed-by tag in patch 1 and 2 (Geert-san, thanks!)
>  - Revise commit description in patch 1.
>  https://lore.kernel.org/all/20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com/
> 
> Changes from v1:
>  - Add Reviewed-by tag in patch 1. (Geert-san, thanks!)
>  - Revise a comment in patch 2.
>  https://lore.kernel.org/all/20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com/
> 
> Y
> 
> Yoshihiro Shimoda (2):
>   dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
>   iommu/ipmmu-vmsa: Add support for R-Car Gen4

Applied, thanks.
