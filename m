Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CF436464C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 16:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237650AbhDSOjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 10:39:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:35544 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231814AbhDSOjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 10:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=M1T8B2Fy5oCtmgyqmiC2y7Q+yAq
        kuMFjGUT/zx7E0Os=; b=Eop1df2tRi1tq89RlRiXkH9+JbA7utJis8TVn54ASxR
        BN8MkHW0SgPni7bl7Ku6KXpHWN0oV2JcJ4pE9aoziWYfV8sdBtQCKlEtsTbFUV2f
        8VwsQLLchqY4L9DDBTYTjLrUyUOFYwZXxfYet2N+wGAnU1RImc1iwcJy7ymFD1O0
        =
Received: (qmail 3162062 invoked from network); 19 Apr 2021 16:39:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Apr 2021 16:39:05 +0200
X-UD-Smtp-Session: l3s3148p1@MVSfSlTAcoggARa4RVPFASR7nDeuDQ6f
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: condor: switch eMMC bus to 1V8
Date:   Mon, 19 Apr 2021 16:38:58 +0200
Message-Id: <20210419143858.39401-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
array and the VCCQ supplies the bus. On Condor, the VCC is connected to
3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust the pinmux
to match the bus, which is always operating in 1.8V mode.

While at it, deduplicate the pinmux entries, which are now the same for
both default and UHS modes. We still need the two pinctrl entries to
match the bindings though.

Thanks to Marek Vasut for this commit description from 5f65328df3f5.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

eMMC works fine with the limited tests I could do via remotelab.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 04d47c0c9bb9..7bde0a549c09 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -210,7 +210,7 @@ lvds0_out: endpoint {
 
 &mmc0 {
 	pinctrl-0 = <&mmc_pins>;
-	pinctrl-1 = <&mmc_pins_uhs>;
+	pinctrl-1 = <&mmc_pins>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&d3_3v>;
@@ -253,12 +253,6 @@ i2c0_pins: i2c0 {
 	};
 
 	mmc_pins: mmc {
-		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
-		function = "mmc";
-		power-source = <3300>;
-	};
-
-	mmc_pins_uhs: mmc_uhs {
 		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
 		function = "mmc";
 		power-source = <1800>;
-- 
2.30.0

