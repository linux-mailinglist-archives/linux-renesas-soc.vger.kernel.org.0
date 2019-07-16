Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD646A771
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387526AbfGPL0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 07:26:24 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbfGPL0Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 07:26:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2AAEE25AD78;
        Tue, 16 Jul 2019 21:26:22 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2E37D9403C0; Tue, 16 Jul 2019 13:26:20 +0200 (CEST)
Date:   Tue, 16 Jul 2019 13:26:20 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: Rename file of DT bindings for Renesas
 memory controllers
Message-ID: <20190716112619.ielypcsnclg6sa27@verge.net.au>
References: <20190703084106.484-1-horms+renesas@verge.net.au>
 <CAMuHMdXMbLzL7X5uUp0g5Q-_YiXiyTW+tALzS=kHBOS3JNbRUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMbLzL7X5uUp0g5Q-_YiXiyTW+tALzS=kHBOS3JNbRUQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 03, 2019 at 11:33:36AM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 3, 2019 at 10:41 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > For consistency with the naming of (most) other documentation files for DT
> > bindings for Renesas IP blocks rename the Renesas R-Mobile and SH-Mobile
> > memory controllers documentation file from renesas-memory-controllers.txt
> > to renesas,dbsc.txt.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

are you planing to take this through renesas-devel?
