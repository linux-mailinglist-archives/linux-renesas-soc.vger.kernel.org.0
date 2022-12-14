Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5880E64C1F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236983AbiLNBs2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236962AbiLNBsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:21 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB691DDC5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7pf3HH2x2A9xafy4TJBc2HiKDRe5SS2o3htCq5Ddz1imoASaQo0keHVMJvq042rw3m+/lNlOPW+xqHzoM9CkDySbGqmsD/vG3jBoofL9Ja7Ako9wZosIt3BDF33YkgGK1LzgIaiIYD2L4D1taqE799t4Wj8gSDTlMgbPmG/FLnWLg62dbKe9CnFaAoIB07sXpDOXu3fSwgU/5cyCEq4rr/uO7vkukOSxjw5aCtppy8HTp5WK+uUrO0tDwHzHAi+ilU+Vb5wo1yS8jzesb/nstmbWH91f1XxFf9GsjsO+vvANU7T9NU9axSi6Vym/sAW34G7NmkmD+VX9BDi1bPnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRXVWwuuod293FfGfxDv+njm1KJigk0UEZ1Q/C7Wj7s=;
 b=YwqXqFCeKuL0wOY3BdqQWjvu1ncyX2FFCOHIHR9C4t/KYuj6mpVO4nE2YhBeYUl6X+NCE8QH1AUDKQXd6K9BtPQiqjG2KqitwKE7iYkeiI4Femf5yRtxaxa4WWdM8o8DB2OPkfu9//p297ItLLqPswy4uHVCwzoOx239YCmbahzJQKRqPyHJMVXO4dky5QnXv7ASAcI6eTmxtGr5tLm/9X4wLMaV8IcqzY2ZWZWLkJI9bmAzepqREuT2SDuIzV+5fQPmeTcPJfsWy3TGASYDTN/hZAJOvvtqwoUHAF2ySIXYzVP/f8qIgU6b5ZHatGa1Um5KO2RnLskXmX/A6lzvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRXVWwuuod293FfGfxDv+njm1KJigk0UEZ1Q/C7Wj7s=;
 b=lKj/D9iPxiNISA1TP4j5U9/1hfEHBfiljb5z7cH954sX7xPmlFMiIhQ50E5mvfFrN9EeF3FYG9G/AF3fOY3eLFCh+MYyFRz4Ha/KT9aqzyvY0RXR6QPujhh9sNiMSZ00+lrMZJbTHogGmGVpYnrSSJwv2/0us5rgzhkS4kG1ozk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:18 +0000
Message-ID: <87a63qpxge.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:17 +0000
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a0904d-331b-4017-0e71-08dadd7545e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxY87IU7nBVPL+aU2D/suswmWVwKNy96TZhu8xoTHYij8dwdSaz7CKheeYz3hfgkOxrJT73SVtIi8z43i01IDYQCYnRkQDSJS4zeRfHRZ/XQBeS3FhPVjNBWrmy7j0CtpVAtFn/Zt3THB9JARzCm4etPQ2lmLW7FLcrbkXMKqdOHLsU0Xw5bIwM2hbCoj7buaufF5HkUCQMcL/WsGXBEX1tUU+RAWWJpT6GLTtWkasp9jEG3cwuXO8gRSmpmcOvBpQzmTtYrmSDEm+xSKIRmg8fuUGez4JQ/OTEzh3LtHLaODRqfbpG6IxYEpqPq+89BGbwYmWnP8iZmjXEKryq4Hf5s/BK6vTTFwaBg7Dw35BoT1A1qKI7eIb0Ik2QnHEMVqWYnRKx56H53QIsH+GjJJEpl14EfQtmk7jWFUSH4pwRwrlxGzwShfz7qKcczNjT2z8qGbjhsdJfLuoGcd2OUCf8sGqkF/e9faLdjjMMoAPJYFNRxhLLFzuNuYd5GUhYV4dvMwGCYynfwm+4eQt3hjwISYwM0vLtLzO4ekXy46kgX/ppGhoJxtDI9+X8ufEi0cDge+DzINmYUWF1Q4lKl2s7ACCRUp9eXWy5P//lnpqD6KZ8KwPHFP/o/alya9haK3HhAp3hD12uylh3bf/4bGEf4TyipEb+Zw+9Mt5iXwuzuqIGhbMcVVL56oMc0WtoHkn+d7m2XGrwZrdUmhF0EtgsmVnDJGl7Xa6lc2U/g/OI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dAWNLJwDii1RGaS6kCFjbhDOV5NfcFrw1Ociw5U89ncdfWao0Lh9OlaefkX1?=
 =?us-ascii?Q?AOUh7GHPNmcRoBNfe7LUxMTNOLVVycX3LZjQtF1YCpFpMIZqFFsrkDKWIyoS?=
 =?us-ascii?Q?cKQWK+dyBUixYnjnC4SQpl3+1HtRzChrMjxeWGUP7dle6Yd7B2wduC0BQpKR?=
 =?us-ascii?Q?v/5D/IH7/NLAWSitgzePnVYIfdNgenDRBkzDujqpGOkOJZECH6SXTBDfHLcD?=
 =?us-ascii?Q?ekqL9te4lRCJkdM8kp4Z6tnALYgip4wCITkhQZbhM6IzeQc4Aqb/PT56Hw7W?=
 =?us-ascii?Q?L1bnKMGvp2sK4gJLp4LOETqm5aTc6cB+zwSMo65ZCLrWy6VIUCLFtl7ig1zS?=
 =?us-ascii?Q?5q9NKCLeHAC73TYfAiYv+l8EG9EIB+haDq2lMSS43WlsvhnmdSEwRYcnoEME?=
 =?us-ascii?Q?Ipf1jbI4GM6j1tY5pP2EcgfnyQeaXJnJtNZ2ALIxHGuf4Aty16Uq3wHcq4IT?=
 =?us-ascii?Q?BT7FlLgMapIUBWezDa/L1K2QXpXLZiZwE8tquIcAATXDee3TcmOemmMBbjMW?=
 =?us-ascii?Q?hLyxdpAAdr9onn7gq1/X5ghR4njCIhXqp7ZK+aZMBQtdlFm+LvXJzThbjAqj?=
 =?us-ascii?Q?oiXHIIsVvRmsYn5rOtlzTRTLTgY/yNN/3UlTQY2mhB8cQJb+t1SWdCgjYizA?=
 =?us-ascii?Q?m1dg4UH7vaqwuLzlv5fSA2rIbisfd1ciUfApZIPsOOZlW0D9HFDUru4Wafiz?=
 =?us-ascii?Q?RnPQx1zwQvOVAJqaVVo4jJAocDFAJNTI3Ot47kx54HtWsVoW+rI6wgS7UuuN?=
 =?us-ascii?Q?/DFDPytHek19n21nRfBoAQcUdnfds29ceEIZlSzSz/a78QtiQCQDkiNrrVtG?=
 =?us-ascii?Q?08WX00kt48wKsv2HA51aIlJDtwazu6b4xz1K8A4eCadMQyuvdEkxTXicF0jT?=
 =?us-ascii?Q?4tEOZEM0TUqXupyhPgXgum2eWrOHCInFPEMEVUSN19V393nkkvE1Wd8cdwbR?=
 =?us-ascii?Q?pV//IYF5u70ZMDPZUeAyFDI46elEvvwH2UEDUeV8mTbT848Mg/7mEPlbfVM2?=
 =?us-ascii?Q?N+3NMgL0QLkA82xM+LFGPen6/+P3FPVzUQaw+XZ3SgOpPW6Zk9GIRPVDwIpK?=
 =?us-ascii?Q?UhxEtYwzMfCjeeebfNMNgfGjufGfBjWAEocYCDSSIpK5nVkb5fM9uFnUHxGC?=
 =?us-ascii?Q?sbScwm5dA2KRwsn2Dpf0aqTNQbhRvoDbp8kxZWD0+SKcQOMZQvKalYm2uYHf?=
 =?us-ascii?Q?8fJXTRZQ1ZxsPS63i7t1c3r8Nm0wAlJjufX5pxtDLfU/b/NcZHgMf3HNYYgj?=
 =?us-ascii?Q?eNsg7PRMNwQLBNoxt8T1meLcop5J543sa7Aos+OVW9H4FpauglijGpwhuejp?=
 =?us-ascii?Q?X3pygynfP9O6B7xgwwEcsyIq8Fpejji0tKjoBo/2R4lZVwDmNz3clOBZtdoc?=
 =?us-ascii?Q?kYgVp20Gl0qD3MQSe8rDwBPgy1w1n0FtmRA4OLrxOV0zsYbgemqTEETs+P0r?=
 =?us-ascii?Q?jhxg2Cr1A6CkQs8P7skzwpsOQm0CWaBG8Vyss0WXIf0djsk5N2tzM+oPCjrS?=
 =?us-ascii?Q?v/PWMjWGbKm2C/2WcRpTEwXIXlShp/7SfLwkTXNYn7ZFoMenPTbPHVBJ/2GF?=
 =?us-ascii?Q?exhOKchoPIXGgg8ZaPFAEH2gaLYK6WBvOKXKbFnlKliZ6bWanNKLGqfmx1xi?=
 =?us-ascii?Q?c2jSnRYerVzbcnB+N+KL4Tg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a0904d-331b-4017-0e71-08dadd7545e8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:18.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyck1VrEY9MuSn8pJAGuw44sx2p+M5GjY24HFg6LEirKaAhV8DUkOkJM9MGBRXOvQjnx96Lro4KGG4J4sIeOkrJxC1xVOlgOSNIkzEoN63JiaJtWcrlcPvZ2hH/h+DZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7819
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ALSA SoC has many type of Generic Audio Card driver (Simple Audio Card,
Audio Graph Card, Audio Graph Card2), and Renesas/Kuninori Morimoto want
to test these.

Generic Audio Card driver had been requested on ALSA SoC.
It has many type of device connection method, and historically,
requested connection support range of generic driver have been
upgraded.

Upgrading connection support range itself was possible on generic
driver, but could not implemented, because we need to keep compatibility
on Device-Tree. This is one of the reason why we have many type of
Generic Audio Card driver.

ULCB/KF is good board to test these.
Kuninori has been testing these Generic Audio Card driver by using his
local patch to switching drivers. But it is good idea to upstream these
from information sharing point of view, because DT setting is complex.
It can be good sample for user. This patch is one of them.

From normal user point of view who don't need to test the driver,
it should keep as-is, nothing changed.

This patch adds "Audio Graph Card" DT setting file for ULCB/KF.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/ulcb-audio-graph-card.dtsi    | 85 ++++++++++++++++++
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi | 88 +++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dt=
si

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi b/arch/=
arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
new file mode 100644
index 000000000000..8a1ca100cef8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Audio Graph Card
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 ------ ak4613
+ *	(B) CPU1 ------ HDMI
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+
+/ {
+	sound_card: sound {
+		compatible =3D "audio-graph-card";
+		label =3D "rcar-sound";
+
+		dais =3D <&rsnd_port0	/* (A) ak4613 */
+			&rsnd_port1	/* (B) HDMI0  */
+		>;
+	};
+};
+
+&ak4613 {
+	#sound-dai-cells =3D <0>;
+
+	port {
+		/*
+		 * (A) CPU0 <-> ak4613
+		 */
+		ak4613_endpoint: endpoint {
+			remote-endpoint =3D <&rsnd_for_ak4613>;
+		};
+	};
+};
+
+&hdmi0 {
+	ports {
+		port@2 {
+			/*
+			 * (B) CPU1 <-> HDMI
+			 */
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint =3D <&rsnd_for_hdmi>;
+			};
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		rsnd_port0: port@0 {
+			/*
+			 * (A) CPU0 <-> ak4613
+			 */
+			reg =3D <0>;
+			rsnd_for_ak4613: endpoint {
+				remote-endpoint =3D <&ak4613_endpoint>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssi0>, <&src0>, <&dvc0>;
+				capture  =3D <&ssi1>, <&src1>, <&dvc1>;
+			};
+		};
+		rsnd_port1: port@1 {
+			/*
+			 * (B) CPU1 <-> HDMI
+			 */
+			reg =3D <1>;
+			rsnd_for_hdmi: endpoint {
+				remote-endpoint =3D <&dw_hdmi0_snd_in>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssi2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi b/ar=
ch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
new file mode 100644
index 000000000000..fcdd2e949b5f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Audio Graph Card
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 ------ ak4613
+ *	(B) CPU1 ------ HDMI
+ *	(C) CPU2 ------ PCM3168A-p (8ch)
+ *	(D) CPU3 ------ PCM3168A-c (6ch)
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *	(C) aplay   -D plughw:0,2 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ *	(D) arecord -D plughw:0,3 xxx.wav
+ */
+
+&sound_card {
+	dais =3D <&rsnd_port0	/* (A) ak4613 */
+		&rsnd_port1	/* (B) HDMI0  */
+		&rsnd_port2	/* (C) pcm3168a playback */
+		&rsnd_port3	/* (D) pcm3168a capture  */
+		>;
+};
+
+&pcm3168a {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		mclk-fs =3D <512>;
+		/*
+		 * (C) CPU2 <-> PCM3168A-p
+		 */
+		port@0 {
+			reg =3D <0>;
+			pcm3168a_endpoint_p: endpoint {
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+		/*
+		 * (D) CPU3 <-> PCM3168A-c
+		 */
+		port@1 {
+			reg =3D <1>;
+			pcm3168a_endpoint_c: endpoint {
+				remote-endpoint =3D <&rsnd_for_pcm3168a_capture>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		/* rsnd_port0/1 are defined in ulcb.dtsi */
+		/*
+		 * (C) CPU2 <-> PCM3168A-p
+		 */
+		rsnd_port2: port@2 {
+			reg =3D <2>;
+			rsnd_for_pcm3168a_play: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num =3D <8>;
+				playback =3D <&ssi3>;
+			};
+		};
+		/*
+		 * (D) CPU3 <-> PCM3168A-c
+		 */
+		rsnd_port3: port@3 {
+			reg =3D <3>;
+			rsnd_for_pcm3168a_capture: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_c>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num =3D <6>;
+				capture =3D <&ssi4>;
+			};
+		};
+	};
+};
--=20
2.25.1

