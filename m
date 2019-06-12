Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF5F424C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730319AbfFLLvS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:51:18 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38434 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFLLvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:51:18 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BB01625AD60;
        Wed, 12 Jun 2019 21:51:15 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B7FB6E21FE5; Wed, 12 Jun 2019 13:51:13 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:51:13 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add RWDT support
Message-ID: <20190612115113.5q2oofih5pao5nag@verge.net.au>
References: <1560241338-63511-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVwoEsoTpQspHda6LnuT8Wc_Fg-koNiQ96NMMqBjoM0rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVwoEsoTpQspHda6LnuT8Wc_Fg-koNiQ96NMMqBjoM0rA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 08:57:49AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 11, 2019 at 10:27 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Enable RWDT and use 60 seconds as default timeout.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for inclusion in v5.3.
