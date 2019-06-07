Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75BC38D41
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 16:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729710AbfFGOgZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 10:36:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33701 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729705AbfFGOgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 10:36:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id x15so1334648pfq.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2019 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pq/Lvk15ljiYEFoaWRgGbFP+gJyMTleHZAPs6hovw5w=;
        b=NS8vdw/GJHgKRux+FPYpvZ1035mvg0losXyssRsNKPFmBf+Dd3mytPf5oXv0xIQXge
         gF+vGSKmDA+atGT+6R2kBslqqvA8ESY9FX4LJajCmN6iRcK7zP6WJMfAYslyPF53ywAz
         J+lJ1WfQ2ST/ox+HerdcEbakT9gTh15DA1jNdB8lb4tVdoncR1zZJae6NvbKrNcfhfkG
         SQKT/IIGTRqlYzHw/Glymm3z51uPDa0LrCpuTiPbwQ+Wfo97dNT4leH8Zc0lCxrbfaQp
         /9p1er7aFMaVcHXr0ow+Uekg1SNPQpe4OsoX7e+1jU6TqB0zKRmregy4NkX4vMuHGb7l
         RNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pq/Lvk15ljiYEFoaWRgGbFP+gJyMTleHZAPs6hovw5w=;
        b=ntXRSSfC8CnECoRVZEVUcYknWCqsbUfEM6HeV83GDMGFR0TXq8D4uwLk7FWJ3ehYx1
         u+WxP24WiiYjIfryOxTdfCIbxiZA1a5NXh2VB8kZMIz/m/O+aOw8AhyYQzIc+49gqW9A
         Qt6gLJhFSk3kVLPCJihji0IcdvMLjtKZV6rCRLOh8OeXggdlbhlv09oFg4K8qyD11L6s
         YMk/zRrLbYwCGvvWVesV98tP9mkVXye460xnC8kpV8XUQRR0/sNG1G79XUuVHTldAJ7S
         CPbZespuTQrbG7NiIsHvfg+3eqBY/8XPrXTlcPv08Q358R4hM/2FJ62Tqj27J/Vvy+zs
         w8Sw==
X-Gm-Message-State: APjAAAVQJPrF2Faisp4zZv2fYP6XrHXFQR/zMv8O0J63bJh1VukEhfCZ
        z1WY8in+bxXyFujHZrr2a/WNXYpj
X-Google-Smtp-Source: APXvYqw30sY2aTITKC03YyoEWuPCWfta3TNSMMIjzjseZKoOCxnFHXEuHvemF8xztPRhaoegGZ26eQ==
X-Received: by 2002:a65:624f:: with SMTP id q15mr2961898pgv.436.1559918183543;
        Fri, 07 Jun 2019 07:36:23 -0700 (PDT)
Received: from localhost.localdomain (p2445105-ipngn21501marunouchi.tokyo.ocn.ne.jp. [60.37.178.105])
        by smtp.gmail.com with ESMTPSA id w1sm3703457pfg.51.2019.06.07.07.36.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 07 Jun 2019 07:36:22 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add cpg reset for LVDS Interface
Date:   Fri,  7 Jun 2019 23:36:13 +0900
Message-Id: <1559918173-30577-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

It is necessary to reset the LVDS Interface according to display on/off.
Therefore, this patch adds CPG reset properties in DU device node
for the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 83cf590..547e970 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1766,6 +1766,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>, <&cpg 724>;
+			reset-names = "du.0", "du.1";
 			vsps = <&vspd0 0 &vspd1 0>;
 			status = "disabled";
 
-- 
1.9.1

