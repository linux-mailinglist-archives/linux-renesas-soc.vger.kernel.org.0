Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AD218D4AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCTQla (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:41:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44805 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCTQla (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:41:30 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N0Zfg-1jRDK81Mxw-00wVmf for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:41:28 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 29A3864F867
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4ZO5fF0vFCHZ for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:41:27 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C095964E339
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:41:27 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:41:27 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 33D6A80505; Fri, 20 Mar 2020 17:12:04 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:04 +0100
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
Subject: [PATCH v3 08/11] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <5e7da04cd003778cf525eac96d8bacdf4a245a13.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:MhgXKrH9JqxctKx3CNOg29zpOlDVYeM2cSgz4E+BMczgS+Ibgdi
 txWnfCPtv4O/AxHPf56py+ADhlWQWmCMpPOdL9sCeUHneyx+uis6zH+/u7lwPJ6qLo6rCR9
 e6Bjd3vhvU84dN0YCfDTKwlsw9AMt7x/E8eWGlNdFvDALqeObTSAEqLpnuY21BDhubGEDdl
 vGospODuTsNM9WDHBQ2UA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dKeM5iOZ1V4=:7pAoEqe3+8pE39I9f1F4zh
 9q23qf5DpvIt5aJ1D51P3DrdBeS+dqiUYdIswmdouFOUiHuygQQIOlnfYowJykb/5f3UQ/TGS
 86o8B8+qlvW0T/67wZLqqKQAgDg4TIDyVrEJ3gK1eCHYIK6DzNLuDS2uc58k+eM9+tFwI6mAD
 9qVDkEPibP/VQdfINxHBnjYbzox+VgrYIR8WCoV8/fYj+FmRr3icVBQQEIZmK4I46aolfZ/xj
 Bmk/eRtMzoxNQHhkRPlw3W8a4goH2ozSd5ZeswaKcLmeOZZHHHdfpEuq+MfnwNv85rfS8yX8n
 0WO0UaBYeNzMYstb0bNiVtwRfVjTM7mEqd4jjKL4BffNmLNTH+sy7U1zaO6K37AsWxvDh5a39
 oiJgonAw7SQECmZpEu5xQen7KUpOsiu3NfVMjoclZ8p9PdffZPjTgeSV4yvimiYn0n7sHM4+V
 +F3Abc9WP0oMZv8vWsFyiFN5aBfSIbhB8oy84uzX1lQsxtj/b4CbX+0d2CUtQ0FhAVLK7Zv6j
 QEr3i+1AQ/oJJyw18WKNxDCTw7oFdXY0Xff04SHCyQwMC44JRRJeYM/dPibw8tp8c3fqA8X32
 WPCddd4d9ceXNjF8HbaG+RmxN5v+NIqnNDmz435YNTxVXD5TGBeE/aIfZbS94P4Bm0Am8R0Ka
 i5IDuYb3ZqjCZCPCEAe3BejvfgLjzeMO9yg+sq8rffxYI7bkk2ALUyJK/VXM1Yur2FbKbOOc8
 oVlwqsW8MwkXQ18Ix/3cFoCCBnjYenKB0DR+UScVCIeo++tfWIIWdr5WTfCfDIk1xhYdNeOBT
 6HsnZ7R44SPnAp7YgI6yyWx5AC8Z3VeSngQqZy4sCi8Ojcb1p7vVJYykqNeoCb3XWhYIFtD
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


