Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C307123CCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 03:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLRCBo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 21:01:44 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:56777 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725975AbfLRCBo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 21:01:44 -0500
Date:   18 Dec 2019 11:01:40 +0900
X-IronPort-AV: E=Sophos;i="5.69,327,1571670000"; 
   d="scan'208";a="34483796"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Dec 2019 11:01:40 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8A4FA4156FB4;
        Wed, 18 Dec 2019 11:01:40 +0900 (JST)
Message-ID: <87tv5yjssb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Karl Nasrallah <knnspeed@aol.com>
Cc:     dalias@libc.org, geert@linux-m68k.org, ysato@users.sourceforge.jp,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: can someone solve string_32.h issue for SH ?
In-Reply-To: <339916914.636876.1576627652112@mail.yahoo.com>
References: <339916914.636876.1576627652112.ref@mail.yahoo.com>
        <339916914.636876.1576627652112@mail.yahoo.com>
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi

> You're using r0 explicitly in the asm but I don't see where you're
> reserving it for your use. You need it either on the clobbers or bound
> to a dummy output with earlyclobber.
(snip)
> 	__asm__ __volatile__ (
> 					"strncpy_start:\n\t"
> 							"mov.b @%[src]+,%[r0_reg]\n\t"
> 							"cmp/eq #0,%[r0_reg]\n\t"
> 							"bt.s strncpy_pad\n\t"
> 							"cmp/eq %[dest],%[dest_end]\n\t"
> 							"bt.s strncpy_end\n\t"
> 							"mov.b %[r0_reg],@%[dest]\n\t"
> 							"bra strncpy_start\n\t"
> 							"add #1,%[dest]\n\t"
> 					"strncpy_pad:\n\t"
> 							"bt.s strncpy_end\n\t"
> 							"mov.b %[r0_reg],@%[dest]\n\t"
> 							"add #1,%[dest]\n\t"
> 							"bra strncpy_pad\n\t"
> 							"cmp/eq %[dest],%[dest_end]\n\t"
> 					"strncpy_end:\n\t"
> 		: [src] "+r" (__src), [dest] "+r" (__dest), [r0_reg] "+&z" (r0_register)
> 		: [dest_end] "r" (__dest_end)
> 		: "t","memory"
> 	);

Or, can we use general strncpy() instead of SH assemble one ?

Thank you for your help !!
Best regards
---
Kuninori Morimoto
