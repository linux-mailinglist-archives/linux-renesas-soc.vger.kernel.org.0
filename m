Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDDD424B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfFLLsw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:48:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFLLsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:48:52 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 03A1725AD60;
        Wed, 12 Jun 2019 21:48:50 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id EE8DBE21FE5; Wed, 12 Jun 2019 13:48:47 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:48:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add PCIe device nodes
Message-ID: <20190612114847.5owtl7hfqearwrkd@verge.net.au>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
 <1559891639-62529-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUReQtusF5tJCYn4QMn+kOonT6i_FRzSx4Xf32uBsFiWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUReQtusF5tJCYn4QMn+kOonT6i_FRzSx4Xf32uBsFiWw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 09:56:00AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 7, 2019 at 9:18 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > This patch adds PCIe{0,1} device nodes for R8A774A1 SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for inclusion in v5.3.
