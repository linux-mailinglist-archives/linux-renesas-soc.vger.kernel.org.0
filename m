Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4474792383
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfHSMdE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:33:04 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38918 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfHSMdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:33:04 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B6C9225B820;
        Mon, 19 Aug 2019 22:33:01 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 906D69406ED; Mon, 19 Aug 2019 14:32:59 +0200 (CEST)
Date:   Mon, 19 Aug 2019 14:32:59 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190819123259.vnwxc2fxmasfbqq7@verge.net.au>
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
 <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
 <20190810111455.GA30455@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190810111455.GA30455@kroah.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 10, 2019 at 01:14:55PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Aug 10, 2019 at 08:40:15AM +0200, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Fri, Aug 9, 2019 at 11:37 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > For consistency with the naming of (most) other documentation files for DT
> > > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > > documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> > >
> > > This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.
> > 
> > s/renesas-usb3.txt/renesas,usb3.txt/
> 
> I'll fix it up now, no need for a resend...

Thanks, much appreciated.
