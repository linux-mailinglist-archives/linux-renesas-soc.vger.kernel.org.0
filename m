Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0C82635D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 14:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbfEVMDX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 08:03:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42630 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbfEVMDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 08:03:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D656B25AD6C;
        Wed, 22 May 2019 22:03:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DE72194053F; Wed, 22 May 2019 14:03:18 +0200 (CEST)
Date:   Wed, 22 May 2019 14:03:18 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Clean up CPU
 compatibles
Message-ID: <20190522120318.mwcp7a6wr3lq6kcm@verge.net.au>
References: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 21, 2019 at 05:44:26PM +0100, Robin Murphy wrote:
> Apparently this DTS crossed over with commit 31af04cd60d3 ("arm64: dts:
> Remove inconsistent use of 'arm,armv8' compatible string") and missed
> out on the cleanup, so put it right.
> 
> CC: Simon Horman <horms@verge.net.au>
> CC: Magnus Damm <magnus.damm@gmail.com>
> CC: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks Robin,

applied for inclusion in v5.3.
