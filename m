Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B636934367
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 11:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfFDJib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 05:38:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52476 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfFDJib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 05:38:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 990B525B73F;
        Tue,  4 Jun 2019 19:38:29 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A045B940986; Tue,  4 Jun 2019 11:38:27 +0200 (CEST)
Date:   Tue, 4 Jun 2019 11:38:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190604093826.tawdq7hz22pxjn36@verge.net.au>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
 <20190411151756.GC30887@bigcity.dyn.berto.se>
 <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
 <OSBPR01MB1733615712FC0F8271580D8BD83D0@OSBPR01MB1733.jpnprd01.prod.outlook.com>
 <20190426115343.GY28103@vkoul-mobl>
 <20190509125528.d7eryp5iv45yn2mp@verge.net.au>
 <OSBPR01MB31747DA6369AD1C240972FBBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <20190513122012.kv7q2krvq3dlzij4@verge.net.au>
 <OSAPR01MB3089A2D7AB64489BB58CF5FED8150@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB3089A2D7AB64489BB58CF5FED8150@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 04, 2019 at 04:20:52AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san again,
> (clean up on CC)
> 
> This is just a record.
> 
> > From: Simon Horman, Sent: Monday, May 13, 2019 9:20 PM
> <snip>
> > > > Shimoda-san, can we go further and also:
> > > >
> > > > 1. Remove the r8a66597-udc driver, which also seems unused
> 
> I overlooked that some SuperH platforms used this driver like below.
> So, I will not submit removing this driver patch at this time.
> 
> $ git grep -l r8a66597_udc
> arch/sh/boards/mach-ecovec24/setup.c
> arch/sh/boards/mach-kfr2r09/setup.c
> arch/sh/boards/mach-se/7724/setup.c

Thanks for looking into this.
I agree we should keep the r8a66597-udc driver for now.

> > > > 2. Remove (minimal) sudmac integration from usbhs ?
> 
> I have submitted a patch like below:
> https://patchwork.kernel.org/patch/10974161/

Thanks!
