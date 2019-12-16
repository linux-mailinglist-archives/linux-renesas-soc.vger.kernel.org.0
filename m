Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A743121175
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLPROR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:17 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44747 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfLPROR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:17 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EBFFC4000B;
        Mon, 16 Dec 2019 17:14:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 03/11] fixup! arm64: dts: renesas: eagle: Provide Eagle FAKRA dynamic overlay
Date:   Mon, 16 Dec 2019 18:16:12 +0100
Message-Id: <20191216171620.372683-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fixes DTC warning
r8a77970-eagle.dt.yaml: camera@51: reg: [[81, 97]] is too short
---
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
index 1f3aeb49e4d9..d30d0f25e60f 100644
--- a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
+++ b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
@@ -63,7 +63,7 @@ i2c@0 {
 
 			camera@51 {
 				compatible = EAGLE_CAMERA0;
-				reg = <0x51 0x61>;
+				reg = <0x51>, <0x61>;
 
 				port {
 					fakra_con0: endpoint {
@@ -80,7 +80,7 @@ i2c@1 {
 
 			camera@52 {
 				compatible = EAGLE_CAMERA1;
-				reg = <0x52 0x62>;
+				reg = <0x52>, <0x62>;
 
 				port {
 					fakra_con1: endpoint {
@@ -97,7 +97,7 @@ i2c@2 {
 
 			camera@53 {
 				compatible = EAGLE_CAMERA2;
-				reg = <0x53 0x63>;
+				reg = <0x53>, <0x63>;
 
 				port {
 					fakra_con2: endpoint {
@@ -114,7 +114,7 @@ i2c@3 {
 
 			camera@54 {
 				compatible = EAGLE_CAMERA3;
-				reg = <0x54 0x64>;
+				reg = <0x54>, <0x64>;
 
 				port {
 					fakra_con3: endpoint {
-- 
2.24.0

