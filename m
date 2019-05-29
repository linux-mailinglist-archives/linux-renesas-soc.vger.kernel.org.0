Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6165B2DAF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 12:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfE2Knb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 06:43:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50112 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2Knb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 06:43:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7D62D25AEEC;
        Wed, 29 May 2019 20:43:29 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 78F2C940361; Wed, 29 May 2019 12:43:27 +0200 (CEST)
Date:   Wed, 29 May 2019 12:43:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Revise usb2_phy nodes and phys
 properties
Message-ID: <20190529104326.cpe42awjjdxfl2tj@verge.net.au>
References: <1558609616-10438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558609616-10438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 23, 2019 at 08:06:56PM +0900, Yoshihiro Shimoda wrote:
> Since the commit 233da2c9ec22 ("dt-bindings: phy: rcar-gen3-phy-usb2:
> Revise #phy-cells property") revised the #phy-cells, this patch follows
> the updated document for R-Car Gen3 and RZ/A2 SoCs.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Shimoda-san,

applied for v5.3.
