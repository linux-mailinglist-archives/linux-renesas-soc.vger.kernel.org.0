Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0625E7D882
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 11:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbfHAJYa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 05:24:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59950 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbfHAJYa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 05:24:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B2D3925AD84;
        Thu,  1 Aug 2019 19:24:27 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4C16D94035F; Thu,  1 Aug 2019 11:24:25 +0200 (CEST)
Date:   Thu, 1 Aug 2019 11:24:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190801092424.nfbjzk2n3rfc4faf@verge.net.au>
References: <20190801091337.27786-1-horms+renesas@verge.net.au>
 <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 01, 2019 at 11:18:36AM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 1, 2019 at 11:13 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > For consistency with the naming of (most) other documentation files for DT
> > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > documentation file from renesas,gen3.txt to renesas,usb3-peri.txt
> 
> from renesas,usb3.txt
> 
> > This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.
> 
> Actually it was renamed from renesas_usb3.txt to renesas,usb3.txt.
> 
> > The motivation is to to more accurately reflect the IP block documented in
> 
> double to
> 
> > this file.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I'll fix this up.
