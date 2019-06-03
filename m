Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF1432E22
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 13:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFCLB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 07:01:27 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54652 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfFCLB1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 07:01:27 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A9C9125B812;
        Mon,  3 Jun 2019 21:01:24 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A4A199403CA; Mon,  3 Jun 2019 13:01:22 +0200 (CEST)
Date:   Mon, 3 Jun 2019 13:01:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190603110122.neludav2f3lnwuap@verge.net.au>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
 <20190531093702.4pdbamghomqdhhuq@verge.net.au>
 <20190531134955.GA28755@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531134955.GA28755@vmlxhi-102.adit-jv.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 03:49:55PM +0200, Eugeniu Rosca wrote:
> Hi Simon,
> 
> On Fri, May 31, 2019 at 11:37:02AM +0200, Simon Horman wrote:
> > Hi Spyridon,
> > 
> > please respond to Geert's review below and
> > if appropriate provide an incremental patch.
> > 
> > Thanks in advance,
> > Simon
> > 
> 
> Spyridon is on vacation, so I will handle the open points.

Thanks Eugeniu,

much appreciated.
