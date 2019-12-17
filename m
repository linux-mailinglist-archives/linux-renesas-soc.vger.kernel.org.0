Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD9A1225DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 08:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbfLQHvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 02:51:17 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:22742 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725730AbfLQHvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 02:51:17 -0500
Date:   17 Dec 2019 16:51:16 +0900
X-IronPort-AV: E=Sophos;i="5.69,324,1571670000"; 
   d="scan'208";a="34415904"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2019 16:51:16 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 630EA41C7047;
        Tue, 17 Dec 2019 16:51:16 +0900 (JST)
Message-ID: <875zifgzkb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] SH: Convert ins[bwl]/outs[bwl] macros to inline functions
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Macro ins[bwl]/outs[bwl] are just calling BUG(), but that results in
unused variable warnings all over the place.
This patch convert macro to inline to avoid warning

We will get this kind of warning without this patch

	${LINUX}/drivers/iio/adc/ad7606_par.c:21:23: \
	  warning: unused variable 'st' [-Wunused-variable]
	struct ad7606_state *st = iio_priv(indio_dev);
	^~

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2

	- add warning on git-log

 arch/sh/include/asm/io_noioport.h | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/io_noioport.h b/arch/sh/include/asm/io_noioport.h
index 90d6109..d39a1a8 100644
--- a/arch/sh/include/asm/io_noioport.h
+++ b/arch/sh/include/asm/io_noioport.h
@@ -53,12 +53,34 @@ static inline void ioport_unmap(void __iomem *addr)
 #define outw_p(x, addr)	outw((x), (addr))
 #define outl_p(x, addr)	outl((x), (addr))
 
-#define insb(a, b, c)	BUG()
-#define insw(a, b, c)	BUG()
-#define insl(a, b, c)	BUG()
+static inline void insb (unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
+
+static inline void insw (unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
+
+static inline void insl (unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
 
-#define outsb(a, b, c)	BUG()
-#define outsw(a, b, c)	BUG()
-#define outsl(a, b, c)	BUG()
+static inline void outsb (unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
+
+static inline void outsw (unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
+
+static inline void outsl (unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
 
 #endif /* __ASM_SH_IO_NOIOPORT_H */
-- 
2.7.4

