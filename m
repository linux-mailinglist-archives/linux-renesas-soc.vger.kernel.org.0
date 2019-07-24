Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948CB72CA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 12:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfGXKwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 06:52:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44662 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGXKwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 06:52:23 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3220D25BE43;
        Wed, 24 Jul 2019 20:52:21 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 3E442E22041; Wed, 24 Jul 2019 12:52:19 +0200 (CEST)
Date:   Wed, 24 Jul 2019 12:52:19 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
Message-ID: <20190724105218.xgs66elsmyohdelv@verge.net.au>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
 <e9a5dbab-16cf-5927-6959-fbe2f3a952f2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a5dbab-16cf-5927-6959-fbe2f3a952f2@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 17, 2019 at 02:24:51PM +0100, Kieran Bingham wrote:
> Hi Simon,
> 
> On 17/07/2019 13:57, Simon Horman wrote:
> > * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> >   August 24, 2018, the TX clock internal delay mode isn't supported
> >   on R-Car E3 (r8a77990) and D3 (r8a77995).
> > 
> > * TX clock internal delay mode is required for reliable 1Gbps communication
> >   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
> > 
> > Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
> > the speed should be limited to 100Mbps.
> 
> I believe you might mean 'can not' reliable use 1Gbps here :-)

Yes, indeed.
Thanks for noticing.
