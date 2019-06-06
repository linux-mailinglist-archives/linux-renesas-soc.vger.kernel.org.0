Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FA237580
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 15:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfFFNmi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 09:42:38 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42286 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfFFNmi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 09:42:38 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 082A525B746;
        Thu,  6 Jun 2019 23:42:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 02D7D940356; Thu,  6 Jun 2019 15:42:33 +0200 (CEST)
Date:   Thu, 6 Jun 2019 15:42:33 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
Message-ID: <20190606134232.ahetmpqlrvrmxsi5@verge.net.au>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
 <20190604200914.64896-3-chris.brandt@renesas.com>
 <20190606084827.2cg6eab3gvjvtfmd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606084827.2cg6eab3gvjvtfmd@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 06, 2019 at 10:48:28AM +0200, Simon Horman wrote:
> On Tue, Jun 04, 2019 at 03:09:14PM -0500, Chris Brandt wrote:
> > Add support for input switch SW3 on the Renesas RZ/A2M EVB
> > development board.
> > 
> > Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
> > does not include interrupt support
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Thanks Chris,
> 
> I have applied this for inclusion in v5.3.
> 
> There was a minor conflict when applying the pinctl portion
> of the patch which I have resolved. The result is as follows.

Scratch that, I was working in the wrong branch.
I now have your patch cleanly applied for inclusion in v5.3.
