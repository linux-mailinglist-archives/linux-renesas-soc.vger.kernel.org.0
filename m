Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E024348B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 12:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhJTKOC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 06:14:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58164 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhJTKOC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 06:14:02 -0400
Received: from madeliefje.horms.nl (tulip.horms.nl [83.161.246.101])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F259925AED3;
        Wed, 20 Oct 2021 21:11:46 +1100 (AEDT)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
        id F04464178; Wed, 20 Oct 2021 12:11:44 +0200 (CEST)
Date:   Wed, 20 Oct 2021 12:11:44 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Akashi Takahiro <takahiro.akashi@linaro.org>,
        kexec@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm: kdump: Add DT properties to crash dump kernel's
 DTB
Message-ID: <20211020101144.GB19898@vergenet.net>
References: <20211005124032.1249636-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005124032.1249636-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 05, 2021 at 02:40:32PM +0200, Geert Uytterhoeven wrote:
> Pass the following properties to the crash dump kernel, to provide a
> modern DT interface between kexec and the crash dump kernel:
> 
>   - linux,elfcorehdr: ELF core header segment, similar to the
>     "elfcorehdr=" kernel parameter.
>   - linux,usable-memory-range: Usable memory reserved for the crash dump
>     kernel.
>     This makes the memory reservation explicit, so Linux no longer needs
>     to mask the program counter, and rely on the "mem=" kernel parameter
>     to obtain the start and size of usable memory.
> 
> For backwards compatibility, the "elfcorehdr=" and "mem=" kernel
> parameters are still appended to the kernel command line.
> 
> Loosely based on the ARM64 version by Akashi Takahiro.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert, applied.
