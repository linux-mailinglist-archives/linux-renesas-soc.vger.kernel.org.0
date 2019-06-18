Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4229449E5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfFRKjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:39:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51856 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRKjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:39:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 77D6725AED3;
        Tue, 18 Jun 2019 20:39:33 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 745099408C4; Tue, 18 Jun 2019 12:39:31 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:39:31 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Enable USB3.0
Message-ID: <20190618103931.pgp2x27jzvolomc2@verge.net.au>
References: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
 <20190617093339.qrezhd6jnm7jqxbt@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617093339.qrezhd6jnm7jqxbt@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:33:39AM +0200, Simon Horman wrote:
> On Fri, Jun 14, 2019 at 03:51:09PM +0100, Biju Das wrote:
> > This patch enables USB3.0 host/peripheral device node for the HiHope
> > RZ/G2M board.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch depend on [1]
> > [1]. https://patchwork.kernel.org/patch/10995323/
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

I have gone ahead and applied this for v5.3.
