Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CEB277CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 10:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbfEWIQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 04:16:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:3177 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbfEWIQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 04:16:46 -0400
X-IronPort-AV: E=Sophos;i="5.60,502,1549897200"; 
   d="scan'208";a="16752253"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 May 2019 17:16:44 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C3EB74009BE3;
        Thu, 23 May 2019 17:16:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     catalin.marinas@arm.com, will.deacon@arm.com
Cc:     kuninori.morimoto.gx@renesas.com,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] arm64: fix build warning from __AARCH64_INSN_FUNCS(ldadd, ...)
Date:   Thu, 23 May 2019 17:12:00 +0900
Message-Id: <1558599120-29394-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following build warning happens on gcc 8.1.0.

 linux/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_is_ldadd':
 linux/arch/arm64/include/asm/insn.h:280:257: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
 __AARCH64_INSN_FUNCS(ldadd, 0x3F20FC00, 0xB8200000)

Since the second argument is mask value and compare with the third
argument value, the bit 31 is always masked and then this macro is
always false. So, this patch fixes the issue.

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Fixes: 34b8ab091f9ef57a ("bpf, arm64: use more scalable stadd over ldxr / stxr loop in xadd")
Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 I'm not sure the second argument "0xBF20FC00" is OK or not (we can set
 to 0xFF20FC00 instead). So, I marked RFC on this patch.

 arch/arm64/include/asm/insn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index ec894de..c9e3cdc 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -277,7 +277,7 @@ __AARCH64_INSN_FUNCS(adrp,	0x9F000000, 0x90000000)
 __AARCH64_INSN_FUNCS(prfm,	0x3FC00000, 0x39800000)
 __AARCH64_INSN_FUNCS(prfm_lit,	0xFF000000, 0xD8000000)
 __AARCH64_INSN_FUNCS(str_reg,	0x3FE0EC00, 0x38206800)
-__AARCH64_INSN_FUNCS(ldadd,	0x3F20FC00, 0xB8200000)
+__AARCH64_INSN_FUNCS(ldadd,	0xBF20FC00, 0xB8200000)
 __AARCH64_INSN_FUNCS(ldr_reg,	0x3FE0EC00, 0x38606800)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
-- 
2.7.4

