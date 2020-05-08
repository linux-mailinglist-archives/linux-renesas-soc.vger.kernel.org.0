Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCE51CB215
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 16:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEHOly (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 10:41:54 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:52801 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgEHOlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 10:41:53 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 80148DF4AB;
        Fri,  8 May 2020 10:41:50 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=268nGxKP+kP8/XSx+FAGYbeJFbM=; b=EfDZKg
        quu3bsCWpJPAtiimjwFQdAyQ3doXrreNcbzWilo7RWd3SQCeFvhsS0rCUUTa5kvK
        4gwnC5q3fAG/n+LTUB7TBNJaaHc4+mHoZYcu/6kpvDBQmVyzuBNA2NAsOoHVcFaG
        lXqOZSyEt8KZYCqLQ7niTrQmMI/j8xeAE/ySw=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 76C27DF4AA;
        Fri,  8 May 2020 10:41:50 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=8mmkg4rH5isXJ8wYaDfAzwV/UGUoKXvhObaLZRR/pjg=; b=iHBypVXsGyesmH50JwnbTKdvFsdL098OUBaME150jW1tisDFVFN6gpceGMEJQOpHUXDpL87A8bqLblvH3cGGI8qdDy7ZazHhBSCK+UuDTWnOMaNGu5k5t6RFkDEj1EDxRxgulIsuLyUwwU2ZhuikCo+lBg5yMVTmz5mQMKWbBfU=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0E163DF4A9;
        Fri,  8 May 2020 10:41:47 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 10AC02DA0AA9;
        Fri,  8 May 2020 10:41:45 -0400 (EDT)
Date:   Fri, 8 May 2020 10:41:44 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Chris Brandt <Chris.Brandt@renesas.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
In-Reply-To: <OSAPR01MB2114FB6F10EC904F19363F9D8AA20@OSAPR01MB2114.jpnprd01.prod.outlook.com>
Message-ID: <nycvar.YSQ.7.77.849.2005081023180.5637@knanqh.ubzr>
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr> <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com> <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
 <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com> <OSAPR01MB2114FB6F10EC904F19363F9D8AA20@OSAPR01MB2114.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 0B3AB5CA-913A-11EA-8877-8D86F504CC47-78420484!pb-smtp21.pobox.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 8 May 2020, Chris Brandt wrote:

> The big argument was always that "XIP cannot be multi-platform by 
> definition because RAM/ROM always resides at different addresses in different 
> devices". And as you know, the physical address for RAM and ROM have to 
> be hard coded in the kernel binary.

Exact.  So what is the problem?

> At an ELC a while back, I talked to Arnd and his suggestion was to put 
> the base addresses for RAM and ROM at a fixed location in the kernel 
> binary. Then for each SoC, you manually modify those values in the each 
> binary to match your board. This means there is 'technically' a single build
> that will support all boards.

The very reason for using XIP in the first place is to maximize resource 
savings on constrained platforms. Any notion of a multi-platform kernel 
is completely contrary to this goal. This is even more true for no-MMU 
platforms where you can't abstract physical address differences behind a 
page table.

Multi-platform kernel supporting all boards make sense for generic 
distros and/or build coverage tests. But a multi-platform XIP kernel is 
a nonsense. Trying to make XIP multi-platform might be a nice 
intellectual challenge but that has zero value for actual deployment and 
usage.

Given that there isn't a lot of such platforms anyway, it should be 
possible to carry a few kconfig entries outside of the multi-platform 
menu for XIP targets and live with possible kconfig duplicates. That 
shouldn't be such a maintenance burden.


Nicolas
