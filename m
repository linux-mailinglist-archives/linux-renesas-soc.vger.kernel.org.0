Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31067336EE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhCKJ3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:29:52 -0500
Received: from www.zeus03.de ([194.117.254.33]:49110 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232040AbhCKJ3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=andNZca5CqZuZY
        UHBpKAdfYwqw4sxtejWUNyePvWgsY=; b=hd96mx+9kRMCEkllUpcQlxLlV6VT/X
        oqJNmrinImm8kea7u1hNLtb5plv6PjACZmzMCrcAo+8G8HOaJV5mhYWq3Whk0Gid
        wfDeYTX9CFZpotET41zCkFyfRbLfH6lnWlY84IFLCaEEPRHEe2N4o7OJPie91RWv
        Hy4CyJWa6zO/A=
Received: (qmail 4141809 invoked from network); 11 Mar 2021 10:29:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 10:29:44 +0100
X-UD-Smtp-Session: l3s3148p1@JjN+bD+9PswgARa4Rf6LAY0TkMkJSYgM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] TEST: arm64: dts: renesas: falcon: Enable CMT
Date:   Thu, 11 Mar 2021 10:29:39 +0100
Message-Id: <20210311092939.3129-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
References: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

This patch enables CMT{0|1|2|3} on the falcon board.

Only for testing, not for upstream!

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 6059627f02ec..4c92bb00f168 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -22,6 +22,22 @@ chosen {
 	};
 };
 
+&cmt0 {
+	status = "okay";
+};
+
+&cmt1 {
+	status = "okay";
+};
+
+&cmt2 {
+	status = "okay";
+};
+
+&cmt3 {
+	status = "okay";
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.30.0

