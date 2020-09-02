Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F69C25B1BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 18:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgIBQcV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 12:32:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60512 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIBQcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:32:21 -0400
Received: from madeliefje.horms.nl (unknown [83.161.246.101])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BEE7525B817;
        Thu,  3 Sep 2020 02:32:19 +1000 (AEST)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
        id E28A113DA; Wed,  2 Sep 2020 18:32:17 +0200 (CEST)
Date:   Wed, 2 Sep 2020 18:32:17 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Akashi Takahiro <takahiro.akashi@linaro.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        kexec@lists.infradead.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB
Message-ID: <20200902163217.GH21427@vergenet.net>
References: <20200902154129.6358-1-geert+renesas@glider.be>
 <CAMuHMdX722bUNmZLjGi7qEVQdA4ODY5gZ-61SnMU+oiOqnjZXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX722bUNmZLjGi7qEVQdA4ODY5gZ-61SnMU+oiOqnjZXQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 02, 2020 at 05:48:00PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 2, 2020 at 5:41 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Pass the following properties to the crash dump kernel, to provide a
> > modern DT interface between kexec and the crash dump kernel:
> >
> >   - linux,elfcorehdr: ELF core header segment, similar to the
> >     "elfcorehdr=" kernel parameter.
> >   - linux,usable-memory-range: Usable memory reserved for the crash dump
> >     kernel.
> >     This makes the memory reservation explicit, so Linux no longer needs
> >     to mask the program counter, and rely on the "mem=" kernel parameter
> >     to obtain the start and size of usable memory.
> >
> > For backwards compatibility, the "elfcorehdr=" and "mem=" kernel
> > parameters are still appended to the kernel command line.
> >
> > Loosely based on the ARM64 version by Akashi Takahiro.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The counterpart patch for linux is "[PATCH] ARM: Parse kdump DT
> properties"
> (https://lore.kernel.org/r/20200902154538.6807-1-geert+renesas@glider.be)

Thanks Geert,

I think it would be best to hold-off on the user-space patch
until the kernel patch is accepted.
