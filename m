Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E618E1F56ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 16:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgFJOlP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 10:41:15 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43783 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgFJOlO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 10:41:14 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 39890100015;
        Wed, 10 Jun 2020 14:41:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] fixup! dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
Date:   Wed, 10 Jun 2020 16:44:21 +0200
Message-Id: <20200610144421.22592-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 34e0431d0bc1..8307c41f2cae 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -176,6 +176,8 @@ properties:
                 description: The remote device compatible string.

               reg:
+                minItems: 2
+                maxItems: 3
                 description: |
                   The I2C addresses to be assigned to the remote devices through
                   address reprogramming. The number of entries depends on the
@@ -294,7 +296,7 @@ examples:

             camera@51 {
               compatible = "imi,rdacm20";
-              reg = <0x51 0x61>;
+              reg = <0x51>, <0x61>;

               port {
                 rdacm20_out0: endpoint {
@@ -312,7 +314,7 @@ examples:

             camera@52 {
               compatible = "imi,rdacm20";
-              reg = <0x52 0x62>;
+              reg = <0x52>, <0x62>;

               port {
                 rdacm20_out1: endpoint {
@@ -329,7 +331,7 @@ examples:

             camera@53 {
               compatible = "imi,rdacm20";
-              reg = <0x53 0x63>;
+              reg = <0x53>, <0x63>;

               port {
                 rdacm20_out2: endpoint {
@@ -346,7 +348,7 @@ examples:

             camera@54 {
               compatible = "imi,rdacm20";
-              reg = <0x54 0x64>;
+              reg = <0x54>, <0x64>;

               port {
                 rdacm20_out3: endpoint {
--
2.27.0

