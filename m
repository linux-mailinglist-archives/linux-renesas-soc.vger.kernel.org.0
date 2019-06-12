Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF7D425B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407235AbfFLM1q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:27:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40138 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407161AbfFLM1q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:27:46 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 25AC125AD60;
        Wed, 12 Jun 2019 22:27:44 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 122BBE21FE5; Wed, 12 Jun 2019 14:27:42 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:27:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a774a1: Add CMT device nodes
Message-ID: <20190612122741.ucaig7fj3r73raq3@verge.net.au>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWx6opBuDeLv35E2dK3BDLrqd=3D_9PaK8FbpBEHvRFDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWx6opBuDeLv35E2dK3BDLrqd=3D_9PaK8FbpBEHvRFDQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 09:02:11AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 11, 2019 at 3:07 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > This patch adds the CMT[0123] device tree nodes to the
> > r8a774a1 SoC specific DT.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

applied for inclusion in v5.3.
