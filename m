Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273CD23310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfETLxh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:53:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36306 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730771AbfETLxh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:53:37 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 608D825AEBF;
        Mon, 20 May 2019 21:53:35 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 91D3E9404D4; Mon, 20 May 2019 13:53:32 +0200 (CEST)
Date:   Mon, 20 May 2019 13:53:32 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0-cat874: Add BT support
Message-ID: <20190520115332.hutqqffjsntx6ael@verge.net.au>
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
 <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 16, 2019 at 09:59:26AM +0100, Biju Das wrote:
> This patch enables BT support for the CAT874 board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>


Thanks Biju,

applied for v5.3 with the subject updated to:

arm64: dts: renesas: cat874: Add BT support
