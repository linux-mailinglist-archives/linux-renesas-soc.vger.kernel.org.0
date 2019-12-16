Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08CAD120274
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfLPK3i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:37 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 908A21170;
        Mon, 16 Dec 2019 11:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492174;
        bh=bLgoGWpMfLhIxX+u92B25Ll8zAnWSzgu0IFdujBe/cc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G960wV450pFXkqIAKOc19BFZ+wtETEvoh5zP7vmsWpTEGSiF3nlFv/fiAnMCC5kri
         2aeDE9u68WtZfTyq8HBO6rdtO/grpzCeEw+SQLEmBNeGPAIzSw4AdHNwml0xyPHmWf
         B0IqL7dySbPXLNh3GvWXEPunexgm7jm0scwll2PY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 04/13] arm64: dts: renesas: eagle: enable VIN
Date:   Mon, 16 Dec 2019 10:29:21 +0000
Message-Id: <20191216102930.5867-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Enable VIN0-VIN3 on the Eagle platform.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Kieran: Rebase to linux-media/master]
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 2afb91ec9c8d..2be89ed879a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -206,3 +206,19 @@
 
 	status = "okay";
 };
+
+&vin0 {
+	status = "okay";
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
-- 
2.20.1

