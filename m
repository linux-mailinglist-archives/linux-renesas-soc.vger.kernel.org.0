Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B808339573
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 18:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbhCLRsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 12:48:42 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:29795 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232878AbhCLRsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 12:48:20 -0500
X-Halon-ID: 16a0f25b-835b-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 16a0f25b-835b-11eb-b73f-0050569116f7;
        Fri, 12 Mar 2021 18:48:14 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: r8a77980: fix vin4-7 binding
Date:   Fri, 12 Mar 2021 18:47:35 +0100
Message-Id: <20210312174735.2118212-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This fixes the bindings in media framework:
The CSI40 is port number 2
The CSI41 is port number 3

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index ec7ca72399ec4d54..1ffa4a995a7ab8ae 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -992,8 +992,8 @@ port@1 {
 
 					reg = <1>;
 
-					vin4csi41: endpoint@2 {
-						reg = <2>;
+					vin4csi41: endpoint@3 {
+						reg = <3>;
 						remote-endpoint = <&csi41vin4>;
 					};
 				};
@@ -1020,8 +1020,8 @@ port@1 {
 
 					reg = <1>;
 
-					vin5csi41: endpoint@2 {
-						reg = <2>;
+					vin5csi41: endpoint@3 {
+						reg = <3>;
 						remote-endpoint = <&csi41vin5>;
 					};
 				};
@@ -1048,8 +1048,8 @@ port@1 {
 
 					reg = <1>;
 
-					vin6csi41: endpoint@2 {
-						reg = <2>;
+					vin6csi41: endpoint@3 {
+						reg = <3>;
 						remote-endpoint = <&csi41vin6>;
 					};
 				};
@@ -1076,8 +1076,8 @@ port@1 {
 
 					reg = <1>;
 
-					vin7csi41: endpoint@2 {
-						reg = <2>;
+					vin7csi41: endpoint@3 {
+						reg = <3>;
 						remote-endpoint = <&csi41vin7>;
 					};
 				};
-- 
2.30.1

