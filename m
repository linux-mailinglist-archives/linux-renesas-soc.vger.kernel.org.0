Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B98617565
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfEHJrB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 05:47:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46544 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEHJrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 05:47:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 502B625AF6B;
        Wed,  8 May 2019 19:46:59 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 37FD59403E0; Wed,  8 May 2019 11:46:57 +0200 (CEST)
Date:   Wed, 8 May 2019 11:46:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r7s9210-rza2mevb: add ethernet aliases
Message-ID: <20190508094656.gc32w5l2a22aatav@verge.net.au>
References: <20190506201236.110281-1-chris.brandt@renesas.com>
 <CAMuHMdXZVLj1NmFJLowDBiLFqeNogqSJamZAysmQ4gMeboRpSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZVLj1NmFJLowDBiLFqeNogqSJamZAysmQ4gMeboRpSg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 07, 2019 at 08:50:51AM +0200, Geert Uytterhoeven wrote:
> On Mon, May 6, 2019 at 10:13 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add ethernet aliases so u-boot can find the device nodes.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.3.
