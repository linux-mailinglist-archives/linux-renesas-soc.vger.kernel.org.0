Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38817D84C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 11:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbfHAJO1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 05:14:27 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59676 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfHAJO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 05:14:27 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CD9EB25AD84;
        Thu,  1 Aug 2019 19:14:24 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CB94594035F; Thu,  1 Aug 2019 11:14:22 +0200 (CEST)
Date:   Thu, 1 Aug 2019 11:14:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Message-ID: <20190801091421.4gf3xggg3eko6wql@verge.net.au>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
 <20190725090946.GA3311@kroah.com>
 <TYAPR01MB4544F226C06730C5611EB025D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190729081440.ftgchumfoszlht4q@verge.net.au>
 <TYAPR01MB4544A8358DE51BFB1193287CD8DD0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544A8358DE51BFB1193287CD8DD0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 29, 2019 at 08:25:24AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Monday, July 29, 2019 5:15 PM
> <snip>
> > > > > > Unfortunately the previous version has already made it into usb-next
> > > > > > 23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
> > > > > > documentation file
> > > > >
> > > > > Ok, I guess we should go with that version.
> > > >
> > > > So can you resend this series based on 5.3-rc1 so I know what to apply?
> > >
> > > Since your usb-testing branch already has it which is merged from Felipe's usb-next branch,
> > > I don't think Simon has to resend this series.
> > >
> > > https://www.spinics.net/lists/linux-usb/msg182103.html
> > 
> > Thanks and sorry for the confusion.
> > 
> > In v5.2-rc1 we had:
> > 
> >   devicetree/bindings/usb/renesas_usb3.txt
> >   devicetree/bindings/usb/renesas_usbhs.txt
> > 
> > 
> > In v5.3-rc1 we have:
> > 
> >   devicetree/bindings/usb/renesas,usb3.txt
> >   devicetree/bindings/usb/renesas,usbhs.txt
> > 
> > Which reflects v1 of this patchset. And I think this is an improvement.
> > 
> > Shimoda-san, can you let me know if you would like me to rebase v2
> > on v5.3-rc1? That would would give us:
> > 
> >   devicetree/bindings/usb/renesas,usb3-peri.txt
> >   devicetree/bindings/usb/renesas,usbhs.txt		[unchanged]
> 
> Thank you for the detail. I would like you to rebase v2 like that, if possible.

Thanks, I have posted this as:

[PATCH] dt-bindings: usb: renesas_gen3: Rename bindings documentation file to reflect IP block
