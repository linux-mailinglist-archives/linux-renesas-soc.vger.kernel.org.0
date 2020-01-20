Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FBC142165
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 02:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgATBVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Jan 2020 20:21:48 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:36030 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728909AbgATBVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Jan 2020 20:21:48 -0500
Date:   20 Jan 2020 10:21:46 +0900
X-IronPort-AV: E=Sophos;i="5.70,340,1574089200"; 
   d="scan'208";a="37085400"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2020 10:21:46 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 423C040083C4;
        Mon, 20 Jan 2020 10:21:46 +0900 (JST)
Message-ID: <87o8uyylat.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Subject: [PATCH resend 0/3] SH: compile fixup patches
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Andrew
Cc: Yoshinori, Rich

I'm posting these patches to SH ML from few month ago,
but SH maintainer is not working in these days...

Is it possible to consider about these ?
SH compile will be fail without these patchese.

I have +1 patch, but will has conflict to Geert's this patch,
thus, I'm skipping it now.

iomap: Constify ioreadX() iomem argument (as in generic implementation)
https://lore.kernel.org/lkml/20200108200528.4614-2-krzk@kernel.org/


Kuninori Morimoto (3):
  sh: Add missing DECLARE_EXPORT() for __ashiftrt_r4_xx
  sh: Convert iounmap() macros to inline functions
  sh: Convert ins[bwl]/outs[bwl] macros to inline functions

 arch/sh/include/asm/io.h          |  2 +-
 arch/sh/include/asm/io_noioport.h | 34 ++++++++++++++++++++++++++++------
 arch/sh/kernel/sh_ksyms_32.c      | 17 +++++++++++++++++
 3 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.7.4

