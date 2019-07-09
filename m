Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9830063306
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 10:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfGIIqQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 04:46:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55954 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfGIIqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 04:46:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 080BD25B707;
        Tue,  9 Jul 2019 18:46:14 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 060069403E4; Tue,  9 Jul 2019 10:46:11 +0200 (CEST)
Date:   Tue, 9 Jul 2019 10:46:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add SSIU support for
 sound
Message-ID: <20190709084611.bfgsa7frfntntuwk@verge.net.au>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 05, 2019 at 02:39:38PM +0100, Fabrizio Castro wrote:
> Add SSIU support to the SoC DT as the sound driver supports
> it now, and also since the sound driver can now handle
> BUSIF0-7 via SSIU remove the no longer needed "rxu" and "txu"
> properties.
> 
> Based on similar work from Kuninori Morimoto and Simon Horman:
> 8d14bfa074db ("arm64: dts: renesas: r8a7796: add SSIU support for
> sound")
> 10bd03fa896e ("arm64: dts: renesas: r8a7796: remove BUSIF0 settings from
> rcar_sound,ssi")
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

