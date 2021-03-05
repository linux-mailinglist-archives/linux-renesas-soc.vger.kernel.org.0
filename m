Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682BD32ED2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCEOdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:33:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:42050 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231215AbhCEOdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=lAMkY941UXNfts
        V+XZoPIS9wbaX8nvalLJrQYUyz1vc=; b=A1GgqelzqeYxtqATFiqVM5Sj2xvhHw
        8FOaSqaeLlLJNrNtpib3imabcAJA3jGLcJB3W918yDPVrvLf+iqUcBoIqwEoP6Au
        F0WS1D7/vb/FaIwOBrTO8Lxhy6b6y0aKj81RmJj4/3Va9kFY+caadhPtq/V+wuF+
        vH26uhLhCgZEY=
Received: (qmail 2251903 invoked from network); 5 Mar 2021 15:33:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:33:07 +0100
X-UD-Smtp-Session: l3s3148p1@frRm9sq8fJlN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] TEST: arm64: dts: renesas: falcon: Enable TMU
Date:   Fri,  5 Mar 2021 15:32:59 +0100
Message-Id: <20210305143259.12622-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

This patch enables TMU{0|1|2|3|4} on the falcon board.

Only for testing, not for upstream!

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index a8f1f51c492b..4c92bb00f168 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -42,3 +42,23 @@ &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
+
+&tmu0 {
+	status = "okay";
+};
+
+&tmu1 {
+	status = "okay";
+};
+
+&tmu2 {
+	status = "okay";
+};
+
+&tmu3 {
+	status = "okay";
+};
+
+&tmu4 {
+	status = "okay";
+};
-- 
2.29.2

