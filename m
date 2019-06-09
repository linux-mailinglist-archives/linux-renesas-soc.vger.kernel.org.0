Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAA23A50D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2019 13:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfFILLQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Jun 2019 07:11:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46968 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbfFILLQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Jun 2019 07:11:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id v9so1787114pgr.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2019 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Cal99Amho56820U+yaSv28Wp6x6GMFa0vOsQA8BETVM=;
        b=DGnbZJhkml/GTOCwVXJvaUey11Nl1HrUBpWW+UGtTOrKk9FDas7yBbzrPUGGRblMRZ
         kco/zHq8fPBDcPxE6kv8vjkqL3IXBu4TCCCwLtPPgajaXHALH07W1A9Fx8IIzXvMkBvK
         L8HdkAtcEF1e6E6BUDbMCPj0jGBMay3qz4xCeMp9ZtVFR220SBXIyn1B0t91nCzXXpYt
         Z1mBRzg2/VM4byb24w4s8gEgSvWxmqLk0Grms4Scam42vt5lFYzkniWRIkK4g2uK+04c
         hnWVDdJrlRbzaiisyviSADBpS8eZHoZfiEV6l6/E39nnkQ1Wha4jOPkTgWSPPjyaSM/0
         3mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Cal99Amho56820U+yaSv28Wp6x6GMFa0vOsQA8BETVM=;
        b=JolN0L5NRuML7/0fJxOqzP3qCPQRQ20tf4eTHpGYKiPG9yXTrz4wmO0n/iC/FHMM5d
         hZ9VQvHvpc+iPR1856S3BpDWhMxXxKPIrGGyeaput+DYwL0zVqRAcWq4RZc2zEE0rywe
         eFS6igDZ/pgVFGs4Hprpa82a80AGCzxguhcv7PElEPy+ICeW2PPmD3GpyIQmH/Rgs39+
         Q/1YSFY8QcCad9ZQsh27gQ0ADapcT2OyC+63oAfmnho8jrN8Kh6QrxIyPZfZA9VA6b/k
         ldQFr+ODY2bmLXJLLDx9N7IfTbZ78TVMdpCLQMZk+oReFG+os4mtPQQkSm0hlaQcFyQK
         STWQ==
X-Gm-Message-State: APjAAAXLKBW13HNSfIjAFgnaQLFGPX05YWm8IzyWKh/xtTFpTUHGAemN
        y2j2xtB9lYzUbeKlIUZsWqbvRzYY
X-Google-Smtp-Source: APXvYqxCfcIxwP7AKWkVHFhsyr84pjDhY+aFzuau/WjL2GZNFqXjILpU+R+ceWGUljVF7kk8/AFhrA==
X-Received: by 2002:a62:a509:: with SMTP id v9mr67392094pfm.82.1560078675959;
        Sun, 09 Jun 2019 04:11:15 -0700 (PDT)
Received: from localhost.localdomain (p2445105-ipngn21501marunouchi.tokyo.ocn.ne.jp. [60.37.178.105])
        by smtp.gmail.com with ESMTPSA id q7sm5590985pfb.32.2019.06.09.04.11.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 09 Jun 2019 04:11:15 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77995: Add cpg reset for LVDS Interface
Date:   Sun,  9 Jun 2019 20:10:59 +0900
Message-Id: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is necessary to reset the LVDS Interface according to display on/off.
Therefore, this patch adds CPG reset properties in DU device node
for the R8A77995 SoC.

This patch was inspired by a patch in the BSP by Takeshi Kihara <takeshi.kihara.df@renesas.com>.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index e0a0149..7816fac 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1001,6 +1001,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>, <&cpg 724>;
+			reset-names = "du.0", "du.1";
 			vsps = <&vspd0 0 &vspd1 0>;
 			status = "disabled";
 
-- 
1.9.1

