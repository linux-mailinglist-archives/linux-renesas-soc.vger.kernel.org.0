Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79A8193D8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 12:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCZLEA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 07:04:00 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49033 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCZLEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 07:04:00 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mo6WJ-1jbxLR1Ysd-00pbwn for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 12:03:58 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 2D7916503FC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZLNwS4Y575_U for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 12:03:57 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C8AA964E126
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 12:03:57 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 12:03:57 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A12B180505; Thu, 26 Mar 2020 11:35:43 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <37482bdfc6d6c6e231c58550b6bc4582aa29dde0.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:Ilf2WKJfS58DfFPuFkfNlQjmqYvqADdumerggvftTzlD5GlA1nF
 FWJN+NCuT4+s1S52T3JzjLDCMfCY0htmAU5K+y+cAouFz03DbiSv0/CGncG6RgO297241Mu
 K/Id82wDQS6VDY6LU16yrSIVsspq5QGNcCHbYit9BSMaatnOrkW0TLR1SMaLiGK4iui6sHi
 4Ztz7DHrKoC2NbtohViMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wpLQi3cjRdk=:qQDXKQqrZzd3GSG6MaXwfq
 6TojbJCKiLF82QceAojCWuE2oZw84GDobWbaBzYfYoJ2faNHubo91583ABjDI/ZgaMyOWfOCK
 tyK4SXD6h9pAFP8Y2NyElwhuIR+jicn3cm1kS/SIAj842Iprbe3juta5deQ7YglJAtkhBqNYF
 ZAlKx+COS+UqsBRmupEK//78gBaxkqwfrPte3d69SVVzntqs1JJ1eOcWdCiNrpOobAt96WmTi
 e8Z9QtMK1yFXKvV56LTbPbN4WYmk7ehlLWHMkh9VD3Ggs/k+NEC/NA1ytmOPyjAuFFkPJpHiX
 bBBCfZgvAmTCVKzDTWD0u958PkK7LHrVAvS2RoAZvn990j/RVYtq6RvxUKLurRGgzrLAzAn0O
 ZOUfcR37WcJHSGssExlKQqDj4wzl6xZ/axiD1mndkk7buxYbcOwZIh2Be7d4XB5bwHxE9S0GT
 SVf4fkyRRiphUeotqTp3v7PZdwTW2FdPHdx9XNJfqfWJybPYkyi+QPk4Zm+XShRKE1O2uOtur
 udruwMEnzDCqy4Kyhy+atXvOoiD8DyafPPA0E854VUteqwPDMVvLTkgPskpwxSmkC5cANL68v
 3GnFOChUDn5WlNun+wzKkJdxd6Rff+dQ/ysCzIYPTU+hdiBONOZUCyyUgJhMb2rRQ4CPxQGHR
 5AOMEK7M5zidjl20moTwdLkmB73XqF3Gy31KIvN+ni7R5nGIfcxEPNYXzNYNai4deFaBQg2LF
 O3ymqWyGY+9e8Aejxd0yhYeUYDZqQMsPEl+XA8G+U/+x+IFw++47x6mGgh7rLnoA5WGBA2P1y
 TwQYXbbklmhG56huM0pVD9N9aw5KhiDBscqTQZdRSrGZpJHVFozCcmX+rGqC/9LtzXrwh17
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the driver has some support for the audio interface of the device,
the bindings file should mention it.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--

v3: remove optionality off MCLK clock cell to ensure the description
    matches the hardware no matter if the line is connected.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../devicetree/bindings/media/i2c/adv748x.txt    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 4f91686e54a6..50a753189b81 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -2,7 +2,9 @@
 
 The ADV7481 and ADV7482 are multi format video decoders with an integrated
 HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
-from three input sources HDMI, analog and TTL.
+from three input sources HDMI, analog and TTL. There is also support for an
+I2S-compatible interface connected to the audio processor of the HDMI decoder.
+The interface has TDM capability (8 slots, 32 bits, left or right justified).
 
 Required Properties:
 
@@ -16,6 +18,8 @@ Required Properties:
     slave device on the I2C bus. The main address is mandatory, others are
     optional and remain at default values if not specified.
 
+  - #clock-cells: must be <0>
+
 Optional Properties:
 
   - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
@@ -47,6 +51,7 @@ are numbered as follows.
 	  TTL		sink		9
 	  TXA		source		10
 	  TXB		source		11
+	  I2S		source		12
 
 The digital output port nodes, when present, shall contain at least one
 endpoint. Each of those endpoints shall contain the data-lanes property as
@@ -72,6 +77,7 @@ Example:
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#clock-cells = <0>;
 
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
@@ -113,4 +119,12 @@ Example:
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				remote-endpoint = <&i2s_in>;
+			};
+		};
 	};
-- 
2.25.1.25.g9ecbe7eb18


