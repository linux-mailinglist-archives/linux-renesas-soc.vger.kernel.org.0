Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BBA303F56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 14:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405067AbhAZNxX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 08:53:23 -0500
Received: from sauhun.de ([88.99.104.3]:53436 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404923AbhAZNxW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 08:53:22 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id 2C35A2C0514;
        Tue, 26 Jan 2021 14:52:31 +0100 (CET)
Date:   Tue, 26 Jan 2021 14:52:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: smp: remove unused variable
Message-ID: <20210126135227.yiiqg7ci3gxhqzpf@the-dreams.de>
References: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
 <20210126104155.GF1551@shell.armlinux.org.uk>
 <20210126130240.GA2413@kunai>
 <20210126134057.GH1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126134057.GH1551@shell.armlinux.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> What I'm saying is... don't expect me to always review patches that
> are for fixing code that other people have contributed - I wish those
> who introduce regressions would stick around and attend to breakage
> that they cause, instead of hoping that someone else will do that
> for them. It's a reasonable ask.

Yes, I am much with you here.

> Thanks - I'll get around to it in due course. Since I'm no longer
> supported as 32-bit ARM maintainer, I only apply patches once or maybe
> twice per kernel release. Quite how long this will be sustainable for,
> I've no idea (it depends whether I get any actual paying work, and
> how much.)

I didn't know that, thanks for the heads up. I understand that problem
and hope there will be income for the work you do.

