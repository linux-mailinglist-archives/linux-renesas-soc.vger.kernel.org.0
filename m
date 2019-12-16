Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C8312117D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfLPRO0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:26 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:32885 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfLPRO0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:26 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6303640005;
        Mon, 16 Dec 2019 17:14:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 11/11] arm64: boot: dts: Eagle: Enable RDACM21
Date:   Mon, 16 Dec 2019 18:16:20 +0100
Message-Id: <20191216171620.372683-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
index d30d0f25e60f..e2b39a4a13d5 100644
--- a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
+++ b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
@@ -19,8 +19,8 @@
 
 #define EAGLE_CAMERA0 "imi,rdacm20"
 #define EAGLE_CAMERA1 "imi,rdacm20"
-//#define EAGLE_CAMERA2 "imi,rdacm21"
-//#define EAGLE_CAMERA3 "imi,rdacm21"
+#define EAGLE_CAMERA2 "imi,rdacm21"
+#define EAGLE_CAMERA3 "imi,rdacm21"
 
 /* Define the endpoint links */
 #ifdef EAGLE_CAMERA0
-- 
2.24.0

