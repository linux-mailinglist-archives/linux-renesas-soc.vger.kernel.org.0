Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE35349E62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbfFRKk3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:40:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51918 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRKk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:40:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B84C025AED3;
        Tue, 18 Jun 2019 20:40:26 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BEC939408C4; Tue, 18 Jun 2019 12:40:24 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:40:24 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Message-ID: <20190618104024.cdvoyrycmeqor62q@verge.net.au>
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190617093314.kvldqkwp3ftghxf2@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617093314.kvldqkwp3ftghxf2@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:33:14AM +0200, Simon Horman wrote:
> On Fri, Jun 14, 2019 at 02:14:35PM +0100, Fabrizio Castro wrote:
> > This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
> > common device tree.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> > This patch depends on:
> > https://patchwork.kernel.org/patch/10986913/
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

I have applied this for inclusion in v5.3.
