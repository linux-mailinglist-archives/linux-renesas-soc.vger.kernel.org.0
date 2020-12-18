Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD7A2DE852
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 18:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731478AbgLRRiW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 12:38:22 -0500
Received: from www.zeus03.de ([194.117.254.33]:35692 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731691AbgLRRiV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ytiV+onisZYlsd
        gtssstNOUjXS3ELZzEJTA29oGv7o4=; b=HVTPqDCncGAA9XTQoBboSfjKtKsCcR
        ynphNp7otY8pv2drt6Vr7o8HqnWQ9yxSiSTzAz9/g+Zgkpmz8DWBWtDNeVB9K79W
        IaFDRd3lGuneDVb3t+aymrLOJnvuXcmV/z1P2jYpyMvbo+zJ8q7PosgGd+5pDJ0i
        so7IPrAl3fSPw=
Received: (qmail 3906806 invoked from network); 18 Dec 2020 18:37:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2020 18:37:38 +0100
X-UD-Smtp-Session: l3s3148p1@vnOEkMC2bJggAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: falcon: Enable watchdog timer
Date:   Fri, 18 Dec 2020 18:37:29 +0100
Message-Id: <20201218173731.12839-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoang Vo <hoang.vo.eb@renesas.com>

Enable the watchdog on the Falcon board.

Signed-off-by: Hoang Vo <hoang.vo.eb@renesas.com>
[wsa: rebased to mainline]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 8eda70e5a82b..fb9978ea18f4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -20,3 +20,8 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.29.2

