Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A6137675
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbfFFOXI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:23:08 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58559 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfFFOVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:21:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3DBE820013;
        Thu,  6 Jun 2019 14:21:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/20] dt-bindings: display, renesas,du: Document cmms property
Date:   Thu,  6 Jun 2019 16:22:02 +0200
Message-Id: <20190606142220.1392-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the newly added 'cmms' property which accepts a list of phandle
and channel index pairs that point to the CMM units available for each
Display Unit output video channel.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index aedb22b4d161..100114ef11d5 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -44,6 +44,10 @@ Required Properties:
     instance that serves the DU channel, and the channel index identifies the
     LIF instance in that VSP.
 
+  - cmms: A list of phandles to the CMM instances present in the SoC, one
+    for each available DU channel. The property shall not be specified for
+    SoCs that does not provide any CMM (such as V3M and V3H).
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
@@ -89,6 +93,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 			 <&cpg CPG_MOD 721>;
 		clock-names = "du.0", "du.1", "du.2", "du.3";
 		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+		cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.21.0

