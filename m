Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADA22EA54A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 07:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbhAEGK3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 01:10:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbhAEGK3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 01:10:29 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 152218AD;
        Tue,  5 Jan 2021 07:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609826928;
        bh=GRxXgHSySbrKCLUspryvg1jzd/pT3GBRl0qA0nILnI4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HdSjMfNezi2bOPmEd5mYJiK0OqUrqMhipq3MNqXK4HMBFduB9r9jOOmJ3A2bNXA/Y
         Z5cPj+q233cQYhTpylgIKzTOjLn2kq8K8Gta3Hyc/fIdzXdbxswaAf/szMv60XSzvs
         zXgzGdUMZB+PnBXmrKiFLG0efjXUmF5jhbqqeNck=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: [PATCH v3 6/6] dt-bindings: display: bridge: Remove deprecated dw_hdmi.txt
Date:   Tue,  5 Jan 2021 08:08:18 +0200
Message-Id: <20210105060818.24158-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dw_hdmi.txt has been replaced with synopsys,dw-hdmi.yaml, and all
references to the old file have been converted. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/dw_hdmi.txt       | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
deleted file mode 100644
index 33bf981fbe33..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Synopsys DesignWare HDMI TX Encoder
-===================================
-
-This document defines device tree properties for the Synopsys DesignWare HDMI
-TX Encoder (DWC HDMI TX). It doesn't constitue a device tree binding
-specification by itself but is meant to be referenced by platform-specific
-device tree bindings.
-
-When referenced from platform device tree bindings the properties defined in
-this document are defined as follows. The platform device tree bindings are
-responsible for defining whether each property is required or optional.
-
-- reg: Memory mapped base address and length of the DWC HDMI TX registers.
-
-- reg-io-width: Width of the registers specified by the reg property. The
-  value is expressed in bytes and must be equal to 1 or 4 if specified. The
-  register width defaults to 1 if the property is not present.
-
-- interrupts: Reference to the DWC HDMI TX interrupt.
-
-- clocks: References to all the clocks specified in the clock-names property
-  as specified in Documentation/devicetree/bindings/clock/clock-bindings.txt.
-
-- clock-names: The DWC HDMI TX uses the following clocks.
-
-  - "iahb" is the bus clock for either AHB and APB (mandatory).
-  - "isfr" is the internal register configuration clock (mandatory).
-  - "cec" is the HDMI CEC controller main clock (optional).
-
-- ports: The connectivity of the DWC HDMI TX with the rest of the system is
-  expressed in using ports as specified in the device graph bindings defined
-  in Documentation/devicetree/bindings/graph.txt. The numbering of the ports
-  is platform-specific.
-- 
Regards,

Laurent Pinchart

