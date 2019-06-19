Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5454B7B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbfFSMLN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:11:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58318 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSMLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:11:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3E1C025AF1B;
        Wed, 19 Jun 2019 22:11:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 450949409FF; Wed, 19 Jun 2019 14:11:09 +0200 (CEST)
Date:   Wed, 19 Jun 2019 14:11:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
Message-ID: <20190619121108.4emby5o3n24nelnm@verge.net.au>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
 <156076301133.5827.18087893489480810339.sendpatchset@octo>
 <CAMuHMdXrDMuhOSuFNYmAxX+vZWWL3GqKKsz6OiBkpeGrgg_ZTg@mail.gmail.com>
 <CANqRtoSGJsE-DqZK5_Tgb-awcUSDnRzyK-6CwS4DgtrRQ0AdVg@mail.gmail.com>
 <CAMuHMdVrU7m9PWc-MgfsRxUBwKZOsvNjnXM3N08nTLu57U2GdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrU7m9PWc-MgfsRxUBwKZOsvNjnXM3N08nTLu57U2GdQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 05:12:35PM +0200, Geert Uytterhoeven wrote:
> Hi Magnus,
> 
> On Tue, Jun 18, 2019 at 5:06 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > On Tue, Jun 18, 2019 at 11:08 PM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Jun 17, 2019 at 11:16 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > > From: Magnus Damm <damm+renesas@opensource.se>
> > > >
> > > > Update the r8a7740 to use the CMT1 DT compat string documented in:
> > > > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> > > >
> > > > The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
> > > > driver has been updated to make use of the new DT compat strings.
> > >
> > > Hence wouldn't it be better to update the driver first, and the DTS in
> > > the next release, so you can remove the "renesas,cmt-48" portion with
> > > the single DTS update?
> >
> > Changing the DTS once sounds nice indeed. I guess my current series
> > are optimized for easy merge of DT Binding docs and DTS. The driver
> > changes are considered slow path.
> >
> > Regarding the driver itself, I was under the impression that
> > introducing new DT compat strings is often disconnected from removing
> > old DT compat strings. Do you agree?
> 
> Yes, you have to add a safety period before removing them.
> 
> > This is how I understand your proposed order:
> >
> > Step 1:
> > - Update DT binding document to include new compat strings, remove
> > deprecated compat strings
> > - Add new DT compat string matching code to the driver
> > - Mark old DT compat strings in driver as deprecated
> >
> > Step 2: (Any time after step 1 is complete)
> > - Convert DTS to use DT new compat strings
> >
> > Step 3: (After N releases or years)
> > - Remove deprecated DT compat string matching code in driver
> 
> Exactly.
> Thanks!

Likewise, thanks.

I am marking patches 1/3 and 2/3 as deferred pending the completion
of step 1.
