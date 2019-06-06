Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B7A36F82
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfFFJJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 05:09:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfFFJJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 05:09:05 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9CD7925B746;
        Thu,  6 Jun 2019 19:09:03 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 95811E21ADF; Thu,  6 Jun 2019 11:09:01 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:09:01 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add HiHope RZ/G2M sub board
 support
Message-ID: <20190606090901.s6ef3snd3dmk5hzh@verge.net.au>
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
 <1559228266-16724-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559228266-16724-4-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 30, 2019 at 03:57:46PM +0100, Biju Das wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M main board.
> This patch also adds ethernet support along with a dtsi common to
> both HiHope RZ/G2M and RZ/G2N sub boards.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks,
                                                                                applied for inclusion in v5.3.
r
