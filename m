Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99C8736F7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 11:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFFJIj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 05:08:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57538 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfFFJIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 05:08:39 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7050025B746;
        Thu,  6 Jun 2019 19:08:37 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 5BE37E21ADF; Thu,  6 Jun 2019 11:08:35 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:08:35 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: Add HiHope RZ/G2M main board
 support
Message-ID: <20190606090830.hxmqk5s3zil3yjsy@verge.net.au>
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
 <1559228266-16724-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559228266-16724-2-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 30, 2019 at 03:57:44PM +0100, Biju Das wrote:
> Basic support for the HiHope RZ/G2M main board:
>   - Memory,
>   - Main crystal,
>   - Serial console
> 
> This patch also includes a dtsi common to both HiHope RZ/G2M
> and RZ/G2N main boards.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks,

applied for inclusion in v5.3.
