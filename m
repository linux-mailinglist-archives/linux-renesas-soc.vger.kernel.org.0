Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9F219C975
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 21:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733052AbgDBTLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 15:11:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59631 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731689AbgDBTLZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 15:11:25 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MD9nd-1jT7nu2MBl-009C5V for <linux-renesas-soc@vger.kernel.org>; Thu, 02
 Apr 2020 21:11:23 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 26F67650ABB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 19:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JH0pEXOcYfj2 for <linux-renesas-soc@vger.kernel.org>;
        Thu,  2 Apr 2020 21:11:22 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id AEAD464E5AD
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 21:11:22 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 21:11:21 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 34C0C80505; Thu,  2 Apr 2020 20:35:06 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:35:06 +0200
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
Subject: [PATCH v5 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <337b689519806178458ab77385c8ac6f510cb0da.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:0d0psf6QeVlnZT6chhMY7b2lvihdMbNLjGNYRn18aBNhga1Pc6p
 jwD1dG9BCviM8XUGIsqKpnj+bmtxpX5+iqd0X/3jz2FQPYnq5KSAb0hPREr+R6KAkix6fXW
 dVy2/5klA/ZZGA42+FKAb0VlZWOb17iU+l45qvTfrxzv9KVdthrXZAvw7sbmSEjIrEe8rJy
 fPYnJqFJijCC73S2FpX1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TuqlgnlB1Uk=:KUCZqU6ca22DUsaMQoP2Az
 z32pooYCgT2HOkhyQqpMbujyN3yIRaI/BMDFhU4FZYMirB1eIi9dSzUgnzTafrbEnEhb5BrJ7
 a3MUCbWNUdEJWcZQJRPRusoSqR8Ycd/JSocuQsbFXJM0xlMidZpdGN7WWgZXsjH1Ws5grkXMp
 piGg10LYdIrZxsjZYRtwhK2mJU4ja6OhLtz2BfwowL01P5DNFKBck2zYLazYdfY7HJ7qpG8iE
 i8c36w2P+jvZrOHMQuDEFkxuCC0gUCisHfe0xPeIeqAaNXFSoW7WlGxpGGSe+fug+DsWb5Fvy
 8G6UY4SXvXZBRXaBa7qx5ymTGXdenPGu8YCHlv7fhGUcROG7cmt/Ez3KkINkCam6IldhTJz7u
 tmfZzMiFduEOqZxZcG78cpQ+ntjIs+Xcp647YeV4M0SMz5RcpaAl+WgBhzqmXporgFSZZJSiv
 m7l+HmL+SDyYwXESioKl9zh1M+SPAsUu1ndf7r5bun/AdewHx1KBWQWKOq2TB9ZH00JgNPDr5
 csCVHLVumugNKE52qTiD0lEo8BNmHrGJIy7JVZAOJEVbuQ0Z9NdF+cbrup5rPN9N50A5V2QTo
 rkYIRTAhZuqCM/PMijXULYMdwBrlZLdqQEyaPN5lztYyU+L9NdMEIyFMiWlhOmN7mXsfwo+CI
 syI5pywadpA/iWWWG+5Y5QNtritpyPU0AVKKQTmh6BeaTn56TgEk2872mkczFDWglH0U79PZw
 hdS7f+ssaj9WLHadyh02aTrbuA0/oCelfNnO2Mablv9l8DN8T9RPXDDDd78pXqoaqx4miB71d
 2HI8S6c8ciP4BLelKahzkNYLl2Cnj0uqVu2Zxp8zZyyW4hT9XQFW4Li7M/EVNkvhOKW3lsl
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


