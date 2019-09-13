Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F44B1BBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 12:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbfIMKtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 06:49:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49062 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387424AbfIMKtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 06:49:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 923EB25AEB1;
        Fri, 13 Sep 2019 20:49:19 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9075D940513; Fri, 13 Sep 2019 12:49:17 +0200 (CEST)
Date:   Fri, 13 Sep 2019 12:49:17 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Add dynamic power
 coefficient
Message-ID: <20190913104917.n55tnt2jm5xvg6ks@verge.net.au>
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
 <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 09:50:08AM +0100, Biju Das wrote:
> Describe the dynamic power coefficient of A53 CPUs.
> 
> Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

