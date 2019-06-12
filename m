Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9EC425C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438910AbfFLM3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:29:49 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438909AbfFLM3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:29:49 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4D6C525AD60;
        Wed, 12 Jun 2019 22:29:47 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 44AC1E21FE5; Wed, 12 Jun 2019 14:29:45 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:29:45 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a774a1: Add TMU device nodes
Message-ID: <20190612122945.ajcuhki6xz7l7aus@verge.net.au>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVHNv4-x_xdiX_ZbQk=oK3S3ZiNb9_Ukb9L-GGc743O0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVHNv4-x_xdiX_ZbQk=oK3S3ZiNb9_Ukb9L-GGc743O0Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 08:56:37AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 11, 2019 at 3:07 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > This patch adds TMU[01234] device tree nodes to the r8a774a1
> > SoC specific DT.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

applied for inclusion in v5.3.
