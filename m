Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E28502B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 09:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfFXHEx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 03:04:53 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:58407 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfFXHEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 03:04:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x5O73v9q030616;
        Mon, 24 Jun 2019 16:03:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x5O73v9q030616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561359838;
        bh=5OUaZkjNas9lHS+ZQnY9UtPOBcnTTcVLurctTO3m70A=;
        h=From:To:Cc:Subject:Date:From;
        b=YG5GjITfAvzH2ZVvZjUsSjp2gg9EqW6C69xZBgP9nFJBGAEaCLEu0mDuVCmoiPv95
         XDP/XKSVXF1Y8haU2KSZBjRmZUdKzX+Xyd3k/jte2Di7Nz28I8v3UPGPg35Gb08mDU
         cyBAgI0thchw/xzTkbFlG2m581OwB0a+4r4EXb8WuLBNPaVPavybPjahJ4QACOGyZu
         BgxWXXEmw4ThKwFxH3piyBsyV7/9YF5bNv0fQmSIv4NIjty6iSr5PNKVVWVoYYvmk4
         S1eo4x+tOhbY2KwKxVOYxVmqnUOVxof/zEka9MqdHj1YJiPzu3pLl3PCAE/PMaO3jG
         yozMaTddvqpJA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Simon Horman <simon.horman@netronome.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2] dt-binding: mmc: rename tmio_mmc.txt to renesas,sdhi.txt
Date:   Mon, 24 Jun 2019 16:03:45 +0900
Message-Id: <20190624070345.20373-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
MFD glue") said, these MMC controllers use the IP from Panasonic.

TMIO (Toshiba Mobile IO) MMC was the first upstreamed user of this IP.
The common driver code was split and expanded as 'tmio-mmc-core', then
it became historical misnomer since 'tmio' is not the name of this IP.

In the discussion [1], we decide to keep this name as-is at least in
Linux driver level because renaming everything is a big churn.

However, DT should not be oriented to a particular project even though
it is mainly developed in Linux communities.

This is the misfortune only in Linux. Let's stop exporting it to other
projects, where there is no good reason to call this hardware "TMIO".
Rename the file to renesas,sdhi.txt. In fact, all the information in
this file is specific to the Renesas platform.

This commit also removes the first paragraph entirely. The DT-binding
should describe the hardware. It is strange to talk about Linux driver
internals such as how the drivers are probed, how platform data are
handed off, etc.

[1] https://www.spinics.net/lists/linux-mmc/msg46952.html

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Rename to renesas,sdhi.txt instead of renesas_sdhi.txt

 .../bindings/mmc/{tmio_mmc.txt => renesas,sdhi.txt}   | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/mmc/{tmio_mmc.txt => renesas,sdhi.txt} (87%)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
similarity index 87%
rename from Documentation/devicetree/bindings/mmc/tmio_mmc.txt
rename to Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
index 2b4f17ca9087..dd08d038a65c 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
@@ -1,13 +1,4 @@
-* Toshiba Mobile IO SD/MMC controller
-
-The tmio-mmc driver doesn't probe its devices actively, instead its binding to
-devices is managed by either MFD drivers or by the sh_mobile_sdhi platform
-driver. Those drivers supply the tmio-mmc driver with platform data, that either
-describe hardware capabilities, known to them, or are obtained by them from
-their own platform data or from their DT information. In the latter case all
-compulsory and any optional properties, common to all SD/MMC drivers, as
-described in mmc.txt, can be used. Additionally the following tmio_mmc-specific
-optional bindings can be used.
+* Renesas SDHI SD/MMC controller
 
 Required properties:
 - compatible: should contain one or more of the following:
-- 
2.17.1

