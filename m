Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF311F965E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 14:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgFOMPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 08:15:55 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:54527 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbgFOMPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 08:15:55 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CE61B24000D;
        Mon, 15 Jun 2020 12:15:52 +0000 (UTC)
Date:   Mon, 15 Jun 2020 14:19:17 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] vin-tests: Add more SoCs
Message-ID: <20200615121917.ns6n2m5mpne6itc5@uno.localdomain>
References: <20200615104430.105891-1-jacopo@jmondi.org>
 <20200615105546.nfyucmyiqoapfos7@uno.localdomain>
 <20200615113418.GA2125222@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615113418.GA2125222@oden.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Mon, Jun 15, 2020 at 01:34:18PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for the ping.
>
> On 2020-06-15 12:55:46 +0200, Jacopo Mondi wrote:
> > Niklas,
> >
> > On Mon, Jun 15, 2020 at 12:44:27PM +0200, Jacopo Mondi wrote:
> > > Add support for E3 and M3-W+ SoCs and fix identification of M3-W which is now
> > > named R8A77960.
> >
> > I badly copied and pasted your email address in the cover letter. Just to
> > notify you about this in case you didn't notice the patches from
> > looking at the lists.
>
> Is it possible you also misspelled the ML address? I can't find it on
> the list and lore.kernel.org have [1] no recollection of the backlinks
> to the original message-id.
>
> 1. https://lore.kernel.org/linux-renesas-soc/20200615105546.nfyucmyiqoapfos7@uno.localdomain/
>

Grrr.. let me resend the whole pack

Thanks
  j

> >
> > Thanks
> >   j
> >
> > >
> > > Jacopo Mondi (3):
> > >   scripts/boards.sh: Fix M3-W identifier
> > >   scripts/boards.sh: Add support for M3-W+ SoC
> > >   scripts/boards.sh: Add support for E3 SoC
> > >
> > >  scripts/boards.sh | 18 ++++++++++++++----
> > >  yavta-cvbs        | 10 ++++++++++
> > >  yavta-hdmi        | 10 ++++++++++
> > >  3 files changed, 34 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.27.0
> > >
>
> --
> Regards,
> Niklas Söderlund
