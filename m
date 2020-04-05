Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB43719EE7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgDEXXd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:23:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34580 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgDEXXd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:23:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1330312;
        Mon,  6 Apr 2020 01:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129012;
        bh=fOQ0CrwOW8gSIsgIM/xXirGK5Rkm9MWBW/Hy7Sd0ItA=;
        h=From:To:Cc:Subject:Date:From;
        b=pi2V6OSccRepo72NN5gFQA9Ha7ZpsPI1Do3SfZcOUQfRbJo3mhbXInavgVnaJqnf+
         RK9NFfiNdyVUEKezqY835WFxvT/7voQB6ESDnG4M1Za61dRVzrLZfiKgOIC0bUVdaN
         IMBwySKgLCrmTtIBgqiB6LXLUwQIssZx/lUG4twg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/4] dt-bindings: display: bridge: Convert bindings used by R-Car DU to YAML
Date:   Mon,  6 Apr 2020 02:23:14 +0300
Message-Id: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patch series converts DT bindings for several bridges used by
the R-Car DU to YAML. The R-Car DWC HDMI TX is left out and will be
addressed in a separate series.

Patch 1/4 starts with a cleanup to disallow additional properties in
"ports" nodes of the existing YAML bridge bindings. Patch 2/4 to 4/4
then convert simple bridges (adi,adv7123, dumb-vga-dac and ti,ths813x),
thine,thc63lvd1024 and renesas,lvds.

I've volunteered Maxime and Jacopo as maintainers for the simple-bridge
and thine,thc63lvd1024 bindings, as the original authors. Please let me
know if you would like your name removed, or ack the patch otherwise.

Laurent Pinchart (4):
  dt-bindings: display: bridge: Reject additional properties in ports
    node
  dt-bindings: display: bridge: Convert simple-bridge bindings to YAML
  dt-bindings: display: bridge: thc63lvd1024: Convert binding to YAML
  dt-bindings: display: bridge: renesas,lvds: Convert binding to YAML

 .../bindings/display/bridge/adi,adv7123.txt   |  50 ----
 .../bindings/display/bridge/anx6345.yaml      |   8 +
 .../bindings/display/bridge/dumb-vga-dac.txt  |  50 ----
 .../bindings/display/bridge/lvds-codec.yaml   |   8 +
 .../bindings/display/bridge/ps8640.yaml       |   8 +
 .../bindings/display/bridge/renesas,lvds.txt  |  85 ------
 .../bindings/display/bridge/renesas,lvds.yaml | 248 ++++++++++++++++++
 .../display/bridge/simple-bridge.yaml         |  99 +++++++
 .../display/bridge/thine,thc63lvd1024.txt     |  66 -----
 .../display/bridge/thine,thc63lvd1024.yaml    | 121 +++++++++
 .../bindings/display/bridge/ti,ths813x.txt    |  51 ----
 11 files changed, 492 insertions(+), 302 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt

-- 
Regards,

Laurent Pinchart

