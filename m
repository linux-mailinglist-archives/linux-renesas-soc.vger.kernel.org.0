Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB06047E85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfFQJdo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:33:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37704 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfFQJdn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:33:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 65A0625B740;
        Mon, 17 Jun 2019 19:33:41 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6CD1B94024A; Mon, 17 Jun 2019 11:33:39 +0200 (CEST)
Date:   Mon, 17 Jun 2019 11:33:39 +0200
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
Message-ID: <20190617093339.qrezhd6jnm7jqxbt@verge.net.au>
References: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 03:51:09PM +0100, Biju Das wrote:
> This patch enables USB3.0 host/peripheral device node for the HiHope
> RZ/G2M board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch depend on [1]
> [1]. https://patchwork.kernel.org/patch/10995323/

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
