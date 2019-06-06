Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA72136EEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 10:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfFFImc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 04:42:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56210 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbfFFImb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:42:31 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9327725B746;
        Thu,  6 Jun 2019 18:42:29 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 67C2FE21A74; Thu,  6 Jun 2019 10:42:27 +0200 (CEST)
Date:   Thu, 6 Jun 2019 10:42:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
Message-ID: <20190606084227.vmoi7gl3klnuqmdc@verge.net.au>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
 <20190604200914.64896-2-chris.brandt@renesas.com>
 <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 05, 2019 at 03:14:17PM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Enable support for the IRQC on RZ/A2M, which is a small front-end to the
> > GIC.  This allows to use up to 8 external interrupts with configurable
> > sense select.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for inclusion in v5.3.
