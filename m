Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D933163304
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 10:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfGIIqH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 04:46:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55918 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfGIIqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 04:46:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0CCC625B786;
        Tue,  9 Jul 2019 18:46:05 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E8DA79403E4; Tue,  9 Jul 2019 10:46:02 +0200 (CEST)
Date:   Tue, 9 Jul 2019 10:46:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Use extended audio
 dmac register
Message-ID: <20190709084602.7mgfh6z7tjpuvcba@verge.net.au>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 05, 2019 at 02:39:37PM +0100, Fabrizio Castro wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7 extended audio dmac registers
> need to be used.
> 
> Based on similar work from Jiada Wang:
> 7a516e49d975 ("arm64: dts: renesas: use extended audio dmac register")
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

