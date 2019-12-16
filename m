Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0A7121174
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLPROQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:16 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41597 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPROQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:16 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CDDE540005;
        Mon, 16 Dec 2019 17:14:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 02/11] fixup! arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
Date:   Mon, 16 Dec 2019 18:16:11 +0100
Message-Id: <20191216171620.372683-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fixes DTC warning:
r8a7795-es1-salvator-x.dt.yaml: camera@31: reg: [[49, 65, 81]] is too short
---
 .../boot/dts/renesas/salvator-x-max9286.dtsi     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
index cfa3ecb6b2ae..0cc4c82b512f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
@@ -191,7 +191,7 @@ i2c@0 {
 #ifdef MAXIM_CAMERA0
 				camera@31 {
 					compatible = MAXIM_CAMERA0;
-					reg = <0x31 0x41 0x51>;
+					reg = <0x31>, <0x41>, <0x51>;
 
 					port {
 						rdacm20_out0: endpoint {
@@ -211,7 +211,7 @@ i2c@1 {
 #ifdef MAXIM_CAMERA1
 				camera@32 {
 					compatible = MAXIM_CAMERA1;
-					reg = <0x32 0x42 0x52>;
+					reg = <0x32>, <0x42>, <0x52>;
 					port {
 						rdacm20_out1: endpoint {
 							remote-endpoint = <&max9286_in1>;
@@ -229,7 +229,7 @@ i2c@2 {
 #ifdef MAXIM_CAMERA2
 				camera@33 {
 					compatible = MAXIM_CAMERA2;
-					reg = <0x33 0x43 0x53>;
+					reg = <0x33>, <0x43>, <0x53>;
 					port {
 						rdacm20_out2: endpoint {
 							remote-endpoint = <&max9286_in2>;
@@ -247,7 +247,7 @@ i2c@3 {
 #ifdef MAXIM_CAMERA3
 				camera@34 {
 					compatible = MAXIM_CAMERA3;
-					reg = <0x34 0x44 0x54>;
+					reg = <0x34>, <0x44>, <0x54>;
 					port {
 						rdacm20_out3: endpoint {
 							remote-endpoint = <&max9286_in3>;
@@ -326,7 +326,7 @@ i2c@0 {
 #ifdef MAXIM_CAMERA4
 				camera@35 {
 					compatible = MAXIM_CAMERA4;
-					reg = <0x35 0x45 0x55>;
+					reg = <0x35>, <0x45>, <0x55>;
 					port {
 						rdacm20_out4: endpoint {
 							remote-endpoint = <&max9286_in4>;
@@ -344,7 +344,7 @@ i2c@1 {
 #ifdef MAXIM_CAMERA5
 				camera@36 {
 					compatible = MAXIM_CAMERA5;
-					reg = <0x36 0x46 0x56>;
+					reg = <0x36>, <0x46>, <0x56>;
 					port {
 						rdacm20_out5: endpoint {
 							remote-endpoint = <&max9286_in5>;
@@ -362,7 +362,7 @@ i2c@2 {
 #ifdef MAXIM_CAMERA6
 				camera@37 {
 					compatible = MAXIM_CAMERA6;
-					reg = <0x37 0x47 0x57>;
+					reg = <0x37>, <0x47>, <0x57>;
 					port {
 						rdacm20_out6: endpoint {
 							remote-endpoint = <&max9286_in6>;
@@ -380,7 +380,7 @@ i2c@3 {
 #ifdef MAXIM_CAMERA7
 				camera@38 {
 					compatible = MAXIM_CAMERA7;
-					reg = <0x38 0x48 0x58>;
+					reg = <0x38>, <0x48>, <0x58>;
 					port {
 						rdacm20_out7: endpoint {
 							remote-endpoint = <&max9286_in7>;
-- 
2.24.0

