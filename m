Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E15E214727
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 17:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGDP7V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 11:59:21 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:28318 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726638AbgGDP7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 11:59:21 -0400
X-Halon-ID: 51c24db7-be0f-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 51c24db7-be0f-11ea-8fb8-005056917f90;
        Sat, 04 Jul 2020 17:59:19 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] ARM: dts: renesas: Remove unused remote property from adv7180 nodes
Date:   Sat,  4 Jul 2020 17:58:56 +0200
Message-Id: <20200704155856.3037010-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The remote property is never read by the driver, remove it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 1 -
 arch/arm/boot/dts/r8a7791-koelsch.dts | 1 -
 arch/arm/boot/dts/r8a7791-porter.dts  | 1 -
 arch/arm/boot/dts/r8a7793-gose.dts    | 1 -
 arch/arm/boot/dts/r8a7794-alt.dts     | 1 -
 arch/arm/boot/dts/r8a7794-silk.dts    | 1 -
 6 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index bfe778c4c47bc186..09a152b9155754ac 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -343,7 +343,6 @@ ak4643: codec@12 {
 		composite-in@20 {
 			compatible = "adi,adv7180";
 			reg = <0x20>;
-			remote = <&vin1>;
 
 			port {
 				adv7180: endpoint {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index fc74c6cd6def5718..f603cba5441fcb9e 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -366,7 +366,6 @@ ak4643: codec@12 {
 		composite-in@20 {
 			compatible = "adi,adv7180";
 			reg = <0x20>;
-			remote = <&vin1>;
 
 			port {
 				adv7180: endpoint {
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index 114bf1c4199b6aa4..c6d563fb7ec7c17f 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -162,7 +162,6 @@ ak4642: codec@12 {
 		composite-in@20 {
 			compatible = "adi,adv7180";
 			reg = <0x20>;
-			remote = <&vin0>;
 
 			port {
 				adv7180: endpoint {
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index a378b54867bb4d1f..31fd3e9ae33e5551 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -334,7 +334,6 @@ ak4643: codec@12 {
 		composite-in@20 {
 			compatible = "adi,adv7180cp";
 			reg = <0x20>;
-			remote = <&vin1>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 935935c1dbac057d..3f1cc5bbf32979e8 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -167,7 +167,6 @@ i2chdmi: i2c-11 {
 		composite-in@20 {
 			compatible = "adi,adv7180";
 			reg = <0x20>;
-			remote = <&vin0>;
 
 			port {
 				adv7180: endpoint {
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index b8b0941f677c1cd4..677596f6c9c9a7d9 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -236,7 +236,6 @@ ak4643: codec@12 {
 		composite-in@20 {
 			compatible = "adi,adv7180";
 			reg = <0x20>;
-			remote = <&vin0>;
 
 			port {
 				adv7180: endpoint {
-- 
2.27.0

