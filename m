Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B76C1C971A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 19:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgEGRG6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 13:06:58 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:65384 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgEGRG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 13:06:58 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 33CB5CFAE7;
        Thu,  7 May 2020 13:06:56 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=wsB7vfwmQfdBokqb0x4yo5jSkDk=; b=NGFtjf
        PF8iI8LkJM1oGKJNXHmpUaxSscVhfGP4CyphTSRz25tl6tVfm0qNsuyHwCSRgP39
        eyyQ4Qaygn3vN/G8l6/2a4W7DD/qo/vHI0SM0RvYJheztPy/TYTdPyScs+udQ9Um
        jyRDZnhtUG5G8uGbgHyB2BMQhE2185YWfSSmc=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 2B4D2CFAE6;
        Thu,  7 May 2020 13:06:56 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=zKz7M+6uQ/pPg0SWSMwNYVJfJIK1Jf19NKAW3730+7A=; b=MaPw6LnUNT/1OPZ8V7dDe4Mv0sHLDdugvCG3zlBCHU/KBBVsqNeEd8SwcICbdadJGjNgtHdbnDlY85ID+CFfcnVe4RqbQJ2MZsCsIuX0k7AfH0lg25I/H1eX9T1GlboGuM/tk72lwu2wwUiWCASgEOCR9vjpOxCVLDz37yAN+tc=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id F067BCFAE5;
        Thu,  7 May 2020 13:06:52 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 0E4B32DA0CE1;
        Thu,  7 May 2020 13:06:51 -0400 (EDT)
Date:   Thu, 7 May 2020 13:06:50 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
In-Reply-To: <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr> <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 25F3FEEA-9085-11EA-B169-B0405B776F7B-78420484!pb-smtp20.pobox.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 7 May 2020, Geert Uytterhoeven wrote:

> Hi Nicolas,
> 
> On Thu, May 7, 2020 at 4:58 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > On Thu, 7 May 2020, Geert Uytterhoeven wrote:
> >
> > > As upstream Linux does not support XIP,
> >
> > What?
> 
> Not for an ARM v7 platform:
> 
>     config XIP_KERNEL
>             bool "Kernel Execute-In-Place from ROM"
>             depends on !ARM_LPAE && !ARCH_MULTIPLATFORM

Of course this is an artificial limitation.

You can have XIP on ARMv7 if you want. It requires some kconfig 
tweaks though.


Nicolas
