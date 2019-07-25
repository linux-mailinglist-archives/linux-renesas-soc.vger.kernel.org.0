Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB236746A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 07:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfGYF53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 01:57:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53526 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfGYF53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 01:57:29 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 97D1525AD7E;
        Thu, 25 Jul 2019 15:57:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 87778E21A74; Thu, 25 Jul 2019 07:57:25 +0200 (CEST)
Date:   Thu, 25 Jul 2019 07:57:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
Message-ID: <20190725055721.37mcdtpeer3knrxa@verge.net.au>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
 <20190717132607.GA1458@kunai>
 <20190724105203.thykr2staw22gdj3@verge.net.au>
 <20190724210441.GA1559@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724210441.GA1559@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 24, 2019 at 11:04:41PM +0200, Wolfram Sang wrote:
> 
> > > What about adding a short comment explaining the situation?
> > 
> > Do you mean in the DT itself?
> 
> Yes, so we don't forget why it is there. Or do you think this is not
> needed? I'd think it is useful but won't insist.

Sure, how about something like this:

                /* TX clock internal delay mode is required for reliable
                 * 1Gbps communication using the KSZ9031RNX phy present on
                 * the Ebisu board, however, TX clock internal delay mode
                 * isn't supported on r8a77990.  Thus, limit speed to
                 * 100Mbps for reliable communication.
                 */
		max-speed = <100>;
