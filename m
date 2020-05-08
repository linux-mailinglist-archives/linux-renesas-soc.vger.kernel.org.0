Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CDE1CB471
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 18:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgEHQPO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 12:15:14 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:50028 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgEHQPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 12:15:12 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id EFE575B4EB;
        Fri,  8 May 2020 12:15:09 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=kmhGduBIpake8Zs5HsNV1PT6HCM=; b=C9RLBB
        sBPVI/CtYd2pWQb5mSlzAXd/p74pm36uF74KC7TDmwmdDn/5dKy0OwG01pNXyHxW
        2YCzS2H5BBDSTs00Q17qzaaQiMptDnL+mVRLeIHplEpYFR3VtaSFX8J/ki90p7M/
        NFy6n7H8aAb6ZSIy28EOQPTSXMAlMRRAVPjhw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id DCFD15B4EA;
        Fri,  8 May 2020 12:15:09 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=0a/ecB1PmZ/fZPc6KQLGTVXFxRUYp0SmngpAhZYhMDI=; b=ZQFvkzSz7djlz1+SaXnqn/0ZFbHA/jfZ9v6sI7nC/ZrvqOuk4WcIjnVDwzFe1GzJeCyJ4SbAG39G1WOcs2TQF5fSm4ImfGCH+/npq7Oyztz3GNoo+a4D2n6G7jhb98mBl6gJlKBpLnbQ2ujG/Lqk4WeoZBmF2eKSaBM3b+XafAQ=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id E918D5B4E8;
        Fri,  8 May 2020 12:15:08 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id D7A702DA0AA9;
        Fri,  8 May 2020 12:15:07 -0400 (EDT)
Date:   Fri, 8 May 2020 12:15:07 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Chris Brandt <Chris.Brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
In-Reply-To: <CAMuHMdX11aLVE8tNNzuawKZqg21mOEnmTv=RkdOPZmMjMzWRMw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.77.849.2005081210220.5637@knanqh.ubzr>
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr> <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com> <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
 <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com> <OSAPR01MB2114FB6F10EC904F19363F9D8AA20@OSAPR01MB2114.jpnprd01.prod.outlook.com> <nycvar.YSQ.7.77.849.2005081023180.5637@knanqh.ubzr>
 <CAMuHMdX11aLVE8tNNzuawKZqg21mOEnmTv=RkdOPZmMjMzWRMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 163EB46E-9147-11EA-AFE8-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 8 May 2020, Geert Uytterhoeven wrote:

> Hi Nicolas,
> 
> On Fri, May 8, 2020 at 4:41 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > On Fri, 8 May 2020, Chris Brandt wrote:
> > > The big argument was always that "XIP cannot be multi-platform by
> > > definition because RAM/ROM always resides at different addresses in different
> > > devices". And as you know, the physical address for RAM and ROM have to
> > > be hard coded in the kernel binary.
> >
> > Exact.  So what is the problem?
> 
> Ah, you've fallen for the "multi-platform" fallacy!

Me?!  You must be mistaken on the person.

> I have no desire to enable support for multiple platforms in a single 
> kernel that supports XIP on all platforms.

Absolutely!  As I just said in my previous email, multi-platform XIP 
kernels are non-sense.


Nicolas
