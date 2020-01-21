Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E46D1447DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2020 23:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgAUWoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jan 2020 17:44:30 -0500
Received: from pb-smtp2.pobox.com ([64.147.108.71]:57514 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgAUWoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jan 2020 17:44:30 -0500
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id BBA4937E8D;
        Tue, 21 Jan 2020 17:44:26 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=aq1VBE/UD+9VB63lhu7difHG3eE=; b=qsllSx
        fLvkog/hk6gxiCdI9aW+JJmlhlQFwUI1SyZ4X2HzydJC09JI5jIONXKMDFT7xzkj
        ZemmyctTCMjsbRyG5hRd8yxd+g7wmQfdYq0TIjRHiIpRf9y72U64i3FKISPRbvjA
        tw1AhaNgbvDYceGUETkz9/9KYvxDwnNjUCk5M=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id B193437E8C;
        Tue, 21 Jan 2020 17:44:26 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=CwsINXE8D01tLy+uDDWKhTzi8DKe6xDPEdmSF3GOpIM=; b=Gq+SbxPtNXjerScdaPs66O+1n1kjA/f2EKlpIj33/p8axBYdNQogPv7hEWzKi3oc73V/xQEwVj3WTW2/D0FGB2VPJ+bxhG25LTJfGF6KUDtyUWlD/cZZoM/pGaL25QhkWV/alhiD2M3JxOODTA+DN673GFOkA/uP10N4bwBCCZg=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 29F8137E8B;
        Tue, 21 Jan 2020 17:44:26 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 447D52DA09D5;
        Tue, 21 Jan 2020 17:44:25 -0500 (EST)
Date:   Tue, 21 Jan 2020 17:44:25 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: boot: Obtain start of physical memory from DTB
In-Reply-To: <20200121192741.20597-1-geert+renesas@glider.be>
Message-ID: <nycvar.YSQ.7.76.2001211437240.1655@knanqh.ubzr>
References: <20200121192741.20597-1-geert+renesas@glider.be>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 9397F24C-3C9F-11EA-AADF-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 21 Jan 2020, Geert Uytterhoeven wrote:

> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
> 
> Fix this limitation by obtaining the start address from the passed DTB
> instead, if available.  Note that for now this is limited to DTBs passed
> explicitly by the boot loader.  DTBs appended to a zImage or uImage are
> not inspected.  Fall back to the traditional method when needed.
> 
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against arm/for-next.
> 
> Tested with the following configurations:
>   - zImage + DTB (r8a7791/koelsch): physical memory start address
>     obtained from DT,
>   - uImage + DTB (r8a73a4/ape6evm, r7s72100/rskrza1, r7s9210/rza2mevb):
>     physical memory start address obtained from DT,
>   - zImage with appended DTB (r8a7740/armadillo, sh73a0/kzm9g): physical
>     memory start address obtained by masking, as before.
> 
> An appended DTB is currently processed after the start of physical
> memory is obtained.  Hence obtaining that address from an appended DTB
> requires moving/copying that copy.  Given the complexity w.r.t. the
> "restart" label, and the lack of a need for me to support this, I didn't
> implement that part.

Well, not exactly. You don't have to move anything. But more on that 
later.

One important detail: you didn't set up the stack pointer. That means 
you're relying on whatever value left in sp by the bootloader. If you're 
lucky that might be fine, but it isn't a good idea to leave things to 
luck.

Before calling the C code, you should probably do:

	adr	r0, LC0
	ldr	r1, [r0]
	ldr	sp, [r0, #28]
	sub	r0, r0, r1
	add	sp, sp, r0

But if there is an appended dtb then you'll overwrite it. So you need 
to look for one and account for its size.
Something like this:

	adr	r0, LC0
	ldr	r1, [r0]		@ get absolute LC0
	ldr	sp, [r0, #28]		@ get stack location
	sub	r1, r0, r1		@ compute relocation offset
	add	sp, sp, r1		@ apply relocation

#ifdef CONFIG_ARM_APPENDED_DTB
	/*
	 * Look for an appended DTB. If found, use it and
	 * move stack away from it.
	 */
	ldr	r6, [r0, #12]		@ get &_end
	add	r6, r6, r1		@ relocate it
	ldmia	r6, {r0, r5}		@ get DTB signature and size
#ifndef __ARMEB__
	ldr	r1, =0xedfe0dd0         @ sig is 0xd00dfeed big endian
	/* convert DTB size to little endian */
	eor     r2, r5, r5, ror #16
	bic     r2, r2, #0x00ff0000
	mov     r5, r5, ror #8
	eor     r5, r5, r2, lsr #8
#else
	ldr	r1, =0xd00dfeed
#endif
	cmp	r0, r1			@ do we have a DTB there?
	moveq	r8, r0			@ use it if so
	addeq	sp, sp, r5		@ and move stack above it
#endif

	bl	fdt_get_mem_start
	...

This is a little involved but there is no way around that for a safe 
stack. Benefit is that you get appended DTB support with a single 
additional instruction.

Also one minor nit:

> +		bl	fdt_get_mem_start
> +		mov	r4, r0
> +		cmn	r0, #1

Please just use "cmp r0 #-1" here. The assembler will convert it for 
you.


Nicolas
