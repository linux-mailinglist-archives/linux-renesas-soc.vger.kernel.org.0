Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9879D64C1F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbiLNBss (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237033AbiLNBsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:40 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB00F23EB3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cesLzRm23a4sKAEQqXyfLQiquOAwYEvV2pIDpDlo4fC3LCaPx4rC02oJpehFl0EvWir8eOiAg49juA39Cy7ONiW4Ay55cXAbT0seZvcMYtGVgLngjHDf7dBf0RSELCH+hqNO6fAzrwXw0SGlx8JhAHQ6tJa/bA2tMo46JDK2+tjgG+yNv8zDSZYgoC60DgtsZoAyuEFpEtIh9jCgxn9WF57a+UM5zlvksbC2Y/6DlhFB64QCkl/ZDsBJyRdkZqjA+wkKH2aXuoxzVzxMhEewypE4wKGyEp1nPGt6C+9ZcqYfFCbdi/qSkpw26V8rPXmZh2wffVS3PeFTo592DNfiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExFXat3RYR2oBc0NQ6tVBCmdrAdfzF8v0Rf8xaRDwIg=;
 b=DYs/YqzfymJpPXgMSfgSkGrkYsFgw4T6SDX4t1i8m/z3zA7loyEwMYwru1jQt5fTE8rmyc3nSHVfwEwrbky4FxVEN+EhahfOwY37Y6dxERP90004bAgQRShansY9sYdFda1hUJM8tYoK1Nq3W+zekbOkde2HNG3NFbZzqpNREyDaEHQbxg2wkDSfY3HzgDY4dsKBfCHPpm/HK3S8H/6u9sHCw1nVquOcB9Qn726URAS47htyjMYLi4sSKGn9VU5unH9CNsRgUWNfCLde9LdXY5agyv0NKq8sC2XAeiibpEt6l1qkLpu21f1Y45WPGUh1YyYRcTZYpimtBoLasBge1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExFXat3RYR2oBc0NQ6tVBCmdrAdfzF8v0Rf8xaRDwIg=;
 b=VzvAMOLlm8ANYRhBrBUhyqVZ/qB/VF4W4hSOFB7sYrxh8WZf2dONP9cIjU7TQpdcuYrqUE4dF+0mFxuZhfxzWlvGNXat2YdYWvYTuvifv2LGqFHGdnwTfGqRhMEde6JhHOFEZLjeNqMtphqxc0Y2ecpUpMEmPqyylotgE+mhlLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:36 +0000
Message-ID: <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:36 +0000
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 74802998-70c2-4bed-2816-08dadd7550bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5qdivCElmi0iM6g2ghfJiz89cD4T0Uw2bMn/gdPCvO3vKYtAn5A44bKR/YovwI90wrPeLN7dAhuBXEeUzy4/DIToxiix7B0WnwTiZ7N4t6oWVqcqT7reGQKMKn/CibMgsc72O69OatA/bMfTPSJ6MCBzTK3Spw8i4nXI+5+spxevrwIlgKc/KwN/WmVXSVWi9xroDmDquUeCdzALZ4qH9/9OSYNVEFUjXGYUocCOefKA2g5+1tt/NaP388dy52HYYOhr85act28BlF2nhvjXPLDUS9caPmqlukc1UG1QdoWeAoAb3PG0PMUtqStUiJagXnLHVevNzrGeSup5r3hP1cOFH/vnVKUQfpUlA1zEw24HtoR0GbnMEeo7NpBVo80jR4kC5KHYi1nZyF2OD5kH6W6QY/Cs5NqUgIIQqGgGALK7DKnqbJuTe7BTlT9If3GexoHQndJ9E9VwBY06KOKxG4UwsdGZQ76Oyb09skL+CTCvkW+hurPEt4mEbePokRZWQMWkjo65gCnq1pr20uRWNQ8GInCdpjod5hVrHf4qOv/jJkfXKQ4VZnGgDr434f+eW6D7Byf+4GYR1TNxsqKC0wYhX16OEqTel6Xl4ucz4oSfSMNzHwXQxBsCQr/0DBWRfFz5S4faYzveX+PMmfSpcKHD5NiU5czlz3TXav5/vKcUE4+VwY8AfZ260fns0CMF/jfhovMPsieU7yI+X/iHt6QIMyZXQHqUZiekzh1EOjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lZlqk8IFMg79EvlD9Gn27vHz9H5CH7Fd50Umm8bxdiWw+Zm8UbnE6nlfahIE?=
 =?us-ascii?Q?hOMSVemd+rKdD853tUbSgb0+bRmUU1hv153YTNNu66FDDzFJZCYZZoEgp8kd?=
 =?us-ascii?Q?pWefD1vloRAT+7jM9LvotSXQIl6mB6DPiBhASCIYftBezqO7TxFNzc+yscYk?=
 =?us-ascii?Q?m4jDOhGiJUNDY29403psIlkx5MugCEcwoAB/zYhiA5sPW1cZ5EuKpcw1L1ho?=
 =?us-ascii?Q?Zh/+i/wRevbtfFghUv39oxaGqZfhV6yjo43N5/XtKaXNL89E4rmWjzeCulW3?=
 =?us-ascii?Q?Ww7Ok5YcU7+xc6nOUoi6sy2EuvJyBO6Zg0EWGeF2QqKQptfnyyb3pNJkMpCp?=
 =?us-ascii?Q?QHekdkAv5QwXTBvgsgnX9zeNvKbKhgVWcN3hsEJ38NRJeQ318iPOddB3eS3/?=
 =?us-ascii?Q?HEmkuXaXJEFM+Je4zJfWG7W+xx/t/LFrXAIsoUmmgItyrQC6DmsLvuxA5E66?=
 =?us-ascii?Q?90c6spZ6srDKTz+Wq0EckKxve0a49K7gKFJzRHPrR85SG9dS41hEmFrWUES1?=
 =?us-ascii?Q?hLc3GhSA15XWiLDPk1+Myu47QbOO+tAweYKdKR5HR670k9C2P9IMeciBRFZu?=
 =?us-ascii?Q?WrFyGQHnNlcUFFJFpecsapmlDTpo5GODmVfCO7r4ufD7VgZZ9UzwWzqks0HI?=
 =?us-ascii?Q?QIUzGUrYcXjZiOD7xqzkSvHExwv1XO6vd09qiLWgJoFexlyXn+xgKcuIzNi2?=
 =?us-ascii?Q?c6193rfldVDvuitAbOc+aFoMjFToPRsghtsRbEBC3E8UEY2eb67zIrB3GcYH?=
 =?us-ascii?Q?KaoI5J59q3u+FOWB4LTlX3CQVEjsHQ9H8n9Pr/aMfhYUVbGFKOt4NooEFGxR?=
 =?us-ascii?Q?PMf+9gbna/VqM2vPhu/s6mv4Ed4mXruKIXhiJxQeYglTV0SVg3s7lpv0xrEi?=
 =?us-ascii?Q?4C8t2UtXyELQsQrRLbNJq1lDAPQGstyHM2bWEwOiYMXB7UjDE6m1tbx4GCvN?=
 =?us-ascii?Q?n5tag0sLMEwBPmDM3ApEJfwkqF6qOowDepbROM4vOFfJyYnXflb+jtfx8peD?=
 =?us-ascii?Q?Jrq08nZthdqmgjU43qeUcsw2g23gEf1DPwAfX8A3Ptkz/Fc9L6UW8xWmG4ow?=
 =?us-ascii?Q?y7b6OI+exnA3VPzgqUXIKylwncPeymn2g/+YBYNUazdmMbWJnkkpgUgJvmzi?=
 =?us-ascii?Q?wdvLu4tYJX4AtKO/I80V0aAkd7Kmxsa23QGu6jPps0/U4yGFbBas+CpVVzGN?=
 =?us-ascii?Q?yjDf/BQvCUBq80Z0SPXtrBerqJQ9nl1JOCRdf9JI988FD4CORt9qkhZ5VRXE?=
 =?us-ascii?Q?/86wxCpqP+hHCmsU2XTruuOf81JakYB6+s1ZeHRqhUpfP0CMFqPnHQFiIhr5?=
 =?us-ascii?Q?//ca/5gVw51OPSGIbQyeIxxp4aLXD67HDjRA4Uyx650RspJHvMOvWHmvbcF4?=
 =?us-ascii?Q?B2G+SewX4gcx42+A6M2WYJ2pJja8RQTFm8Pg0LM8OQn+5P7YrB2eyocObNUr?=
 =?us-ascii?Q?fP62P3yY8jBlIr//HzP5R7qsrsCOPJj5M4hcwcJTlG2UDs4beInluK2nfnYd?=
 =?us-ascii?Q?KBbsuQSrUPLaJ1i9C7bJu4l2NcsKW1+R9s3iI51SrqnC47cMJPv+6eM489fv?=
 =?us-ascii?Q?MCIsbVMd43djHfU4rlL9b4IL4tAQivnKoQkzA2A/5gz8spLfKydHOc3vWZ6n?=
 =?us-ascii?Q?gzWdlja+qZfjSQxHzeS38b0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74802998-70c2-4bed-2816-08dadd7550bf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:36.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBHzGMaS37qTujYivCi/peUMVmlekY8IEZpica/CdpGgOlBXt3iyUh7FFoSjp3LsKsYI+FNoueAf0kaOWCMwjs5TyOPp7YpKZZ73hs9R0QlI+WSC/zpt91UbuaJoYqsw
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

This patch adds "Audio Graph Card2 + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-audio-graph-card2-mix+split.dtsi     | 111 +++++++++++
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 177 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   1 +
 4 files changed, 290 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+=
split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-m=
ix+split.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.d=
tsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
new file mode 100644
index 000000000000..af84b03c2a94
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Audio Graph Card2 (MIX + TDM Split)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Note:
+ * Because there is subdevice maximum, it will ignore HDMI output
+ *
+ *	(A) CPU0 (2ch) ------ (2ch) (X) ak4613  (MIX-0)
+ *	(B) CPU1 (2ch) --/                      (MIX-1)
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+/ {
+	sound_card: sound {
+		compatible =3D "audio-graph-card2";
+		label =3D "rcar-sound";
+
+		routing =3D "ak4613 Playback", "DAI0 Playback",
+		"ak4613 Playback", "DAI1 Playback",
+		"DAI0 Capture",    "ak4613 Capture";
+
+		/delete-property/ dais;
+		links =3D <&fe_a		/* (A) CPU0   */
+			 &fe_b		/* (B) CPU1   */
+			 &be_x		/* (X) ak4613 */
+		>;
+
+		dpcm {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			ports@0 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <0>;
+				/*
+				 * FE
+				 * (A) CPU0 (MIX-0)
+				 * (B) CPU1 (MIX-1)
+				 */
+			fe_a:	port@0 { reg =3D <0>; fe_a_ep: endpoint { remote-endpoint =3D <&r=
snd_a_ep>; }; };
+			fe_b:	port@1 { reg =3D <1>; fe_b_ep: endpoint { remote-endpoint =3D <&r=
snd_b_ep>; }; };
+			};
+
+			ports@1 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <1>;
+				/*
+				 * BE
+				 * (X) ak4613
+				 */
+			be_x:	port@0 { reg =3D <0>; be_x_ep: endpoint { remote-endpoint =3D <&a=
k4613_x_ep>; }; };
+			};
+		};
+	};
+};
+
+&ak4613 {
+	port {
+		/*
+		 * (X) ak4613
+		 */
+		prefix =3D "ak4613";
+		convert-rate =3D <48000>;
+
+		ak4613_x_ep: endpoint {
+			remote-endpoint =3D <&be_x_ep>;
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		/*
+		 * (A) CPU0 (MIX-0)
+		 */
+		port@0 {
+			reg =3D <0>;
+			rsnd_a_ep: endpoint {
+				remote-endpoint =3D <&fe_a_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&src1 &ctu02 &mix0 &dvc0 &ssi0>;
+				capture  =3D <&ssi1 &src0 &dvc1>;
+			};
+		};
+		/*
+		 * (B) CPU1 (MIX-1)
+		 */
+		port@1 {
+			reg =3D <1>;
+			rsnd_b_ep: endpoint {
+				remote-endpoint =3D <&fe_b_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+spli=
t.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dt=
si
new file mode 100644
index 000000000000..505ed1e3d2bb
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Audio Graph Card2 (MIX + TDM Split)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Because it reach to subdevice maximum, it ignore HDMI
+ *
+ *	(A) CPU0 (2ch) ------ (2ch) (X)	ak4613	   (MIX-0)
+ *	(B) CPU1 (2ch) --/			   (MIX-1)
+ *	(C) CPU3 (2ch) ------ (8ch) (Y)	PCM3168A-p (TDM-0 : 0,1ch)
+ *	(D) CPU2 (2ch) --/			   (TDM-1 : 2,3ch)
+ *	(E) CPU4 (2ch) --/			   (TDM-2 : 4,5ch)
+ *	(F) CPU5 (2ch) --/			   (TDM-3 : 6,7ch)
+ *	(G) CPU6 (6ch) ------ (6ch) (Z)	PCM3168A-c
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
+ *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
+ *	(C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
+ *	(D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
+ *	(E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
+ *	(F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ *	(G) arecord -D plughw:0,6 xxx.wav
+ */
+&sound_card {
+	routing =3D "ak4613 Playback",   "DAI0 Playback",
+		  "ak4613 Playback",   "DAI1 Playback",
+		  "DAI0 Capture",      "ak4613 Capture",
+		  "pcm3168a Playback", "DAI2 Playback",
+		  "pcm3168a Playback", "DAI3 Playback",
+		  "pcm3168a Playback", "DAI4 Playback",
+		  "pcm3168a Playback", "DAI5 Playback",
+		  "DAI6 Capture",      "pcm3168a Capture";
+
+	/delete-property/ dais;
+	links =3D <&fe_a		/* (A) CPU0		 */
+		 &fe_b		/* (B) CPU1		 */
+		 &fe_c		/* (C) CPU2		 */
+		 &fe_d		/* (D) CPU3		 */
+		 &fe_e		/* (E) CPU4		 */
+		 &fe_f		/* (F) CPU5		 */
+		 &rsnd_g	/* (G) CPU6 - PCM3168A-c */
+		 &be_x		/* (X) ak4613		 */
+		 &be_y		/* (Y) PCM3168A-p	 */
+	>;
+
+	dpcm {
+		ports@0 {
+		/*
+		 * FE
+		 *
+		 * (A)/(B) are defined on ulcb
+		 * (C) CPU2
+		 * (D) CPU3
+		 * (E) CPU4
+		 * (F) CPU5
+		 */
+		fe_c:	port@2 { reg =3D <2>; fe_c_ep: endpoint { remote-endpoint =3D <&rs=
nd_c_ep>; }; };
+		fe_d:	port@3 { reg =3D <3>; fe_d_ep: endpoint { remote-endpoint =3D <&rs=
nd_d_ep>; }; };
+		fe_e:	port@4 { reg =3D <4>; fe_e_ep: endpoint { remote-endpoint =3D <&rs=
nd_e_ep>; }; };
+		fe_f:	port@5 { reg =3D <5>; fe_f_ep: endpoint { remote-endpoint =3D <&rs=
nd_f_ep>; }; };
+		};
+
+		ports@1 {
+		/*
+		 * BE
+		 *
+		 * (X) is defined on ulcb
+		 * (Y) PCM3168A-p
+		 */
+		be_y:	port@1 { reg =3D <1>; be_y_ep: endpoint { remote-endpoint =3D <&pc=
m3168a_y_ep>; }; };
+		};
+	};
+};
+
+&pcm3168a {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		mclk-fs =3D <512>;
+		prefix =3D "pcm3168a";
+
+		/*
+		 * (Y) pcm3168a-p
+		 */
+		port@0 {
+			reg =3D <0>;
+			convert-channels =3D <8>; /* to 8ch TDM */
+			pcm3168a_y_ep: endpoint {
+				remote-endpoint =3D <&be_y_ep>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+		/*
+		 * (Z) pcm3168a-c
+		 */
+		port@1 {
+			reg =3D <1>;
+			pcm3168a_z_ep: endpoint {
+				remote-endpoint =3D <&rsnd_g_ep>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		/* (A)/(B) are defined in ulcb.dtsi */
+
+		/*
+		 * (C) CPU2
+		 */
+		port@2 {
+			reg =3D <2>;
+			rsnd_c_ep: endpoint {
+				remote-endpoint =3D <&fe_c_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu30 &ssi3>;
+			};
+		};
+		/*
+		 * (D) CPU3
+		 */
+		port@3 {
+			reg =3D <3>;
+			rsnd_d_ep: endpoint {
+				remote-endpoint =3D <&fe_d_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu31 &ssi3>;
+			};
+		};
+		/*
+		 * (E) CPU4
+		 */
+		port@4 {
+			reg =3D <4>;
+			rsnd_e_ep: endpoint {
+				remote-endpoint =3D <&fe_e_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu32 &ssi3>;
+			};
+		};
+		/*
+		 * (F) CPU5
+		 */
+		port@5 {
+			reg =3D <5>;
+			rsnd_f_ep: endpoint {
+				remote-endpoint =3D <&fe_f_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu33 &ssi3>;
+			};
+		};
+		/*
+		 * (G) CPU6
+		 */
+		rsnd_g: port@6 {
+			reg =3D <6>;
+			rsnd_g_ep: endpoint {
+				remote-endpoint =3D <&pcm3168a_z_ep>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssi4>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 6913d778a40b..0690c1b1b5e9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -455,5 +455,6 @@ &xhci0 {
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
+ * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index 497d07df6944..b357267a9083 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -503,5 +503,6 @@ &usb2_phy1 {
  *
  * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
+ * #include "ulcb-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

