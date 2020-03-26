Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21EC9194471
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 17:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgCZQiP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 12:38:15 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37036 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbgCZQiN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 12:38:13 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id K4eA2200W5USYZQ064eAGw; Thu, 26 Mar 2020 17:38:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jHVWE-0002rH-TB; Thu, 26 Mar 2020 17:38:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jHVWE-00064m-S1; Thu, 26 Mar 2020 17:38:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] dt-bindings: usb: generic-ohci: Document power-domains property
Date:   Thu, 26 Mar 2020 17:38:06 +0100
Message-Id: <20200326163807.23216-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326163807.23216-1-geert+renesas@glider.be>
References: <20200326163807.23216-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is quite common for a generic OHCI block to be embedded in an SoC in
its own power domain.  Hence allow the DTS writer to describe the
controller's position in the power hierarchy, by documenting the
optional presence of a "power-domains" property.

This gets rid of "make dtbs_check" warnings like:

    arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee080000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index bcffec1f1341e502..d7efddf27b22e264 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -36,6 +36,9 @@ properties:
         - if a USB DRD channel: first clock should be host and second
           one should be peripheral
 
+  power-domains:
+    maxItems: 1
+
   big-endian:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.17.1

