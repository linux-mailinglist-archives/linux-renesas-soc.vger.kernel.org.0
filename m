Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464BE4DF78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 06:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfFUECs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 00:02:48 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:27969 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfFUECr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 00:02:47 -0400
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-03.nifty.com with ESMTP id x5L3pPlw032215;
        Fri, 21 Jun 2019 12:51:25 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x5L3oRjU014254;
        Fri, 21 Jun 2019 12:50:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x5L3oRjU014254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561089028;
        bh=Bg7yz3kGp5oc02/SzDEjzmVnjSSRFRG856VaDIqk91k=;
        h=From:To:Cc:Subject:Date:From;
        b=p0fbb/jsPohS5rptPzipnLIlvOWQM8tXMhDLb7YHN2+8Yor8zp2pNffgMTKrNuzg0
         QysWHlt/6pjrwXVhsBAhyOVdhZvMg3OH4nrvyboQN1ZiHKr9gb2pCbqfnUGFzT92eE
         FFz992l2m4GUK7HCud4x0sErnUpPaaTrP9b/dLpKz090TLQ/+lMlx1qz9fhelpRMIE
         5DoOKUT90RO97+qkUUd3LBeen4gekxXCdOLu6GJNwkOwosDqCmhLaSA3LvGI/QnkGr
         rdl90Lr0E8Dwt7NTzrz64W4QLWR07xIW1zT1dSAAjF/XFfHkldkyZCDClgUUn6Vlz8
         Vjuh584X4d2Hw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] dt-binding: mmc: rename tmio_mmc.txt to renesas_sdhi.txt
Date:   Fri, 21 Jun 2019 12:50:10 +0900
Message-Id: <20190621035010.13884-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
MFD glue") said, these MMC controllers use the IP from Panasonic.

TMIO (Toshiba Mobile IO) MMC was the first upstreamed user of this IP.
The common driver code was split and expanded as 'tmio-mmc-core', then
it become historical misnomer since 'tmio' is not the name of this IP
in the first place.

In the discussion [1], we decide to keep calling these MMC variants
'TMIO MMC' at least in Linux driver level because renaming all of them
is a big churn.

However, DT should not be oriented to a particular project even though
it is developed in Linux communities.

Let's stop exporting this unfortunate things to other projects, where
there is no good reason to call this "TMIO". Rename the file to
renesas_sdhi.txt. In fact, all the information in this file is specific
to the Renesas platform.

This commit also removes the first paragraph entirely. The DT-binding
should describe the hardware. It is really strange to talk about Linux
driver internals such as how the drivers are probed, how platform data
are handed off, etc.

[1] https://www.spinics.net/lists/linux-mmc/msg46952.html

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I sent this before, but it was dismissed somehow.
I am resending this.


 .../bindings/mmc/{tmio_mmc.txt => renesas_sdhi.txt}   | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/mmc/{tmio_mmc.txt => renesas_sdhi.txt} (87%)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
similarity index 87%
rename from Documentation/devicetree/bindings/mmc/tmio_mmc.txt
rename to Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
index 2b4f17ca9087..dd08d038a65c 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
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

