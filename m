Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A82266895B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjAMCEc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjAMCEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:31 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CABA621B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyDltEmzOGAdFse6Bq3YU1TvVyTy3kIyR1ASTFpyPscY7Et/Vt8eXJOF2eFzH1lKC394pgSjVL/smXtk5NjdnJWC2dtCzfHz7DVJjQpHukOAWCKTXZ6texbbU+gVF8lf5g5FMUJ6VENMDj/06sSJulCwNV5Y7GSjVejNOQkv1t9s9TeyrRWzthmaKOrepeGGl3gwRExiDz5CBdywawH6CDlUGysHOQRkU7cJqk0TVMgT+RT96pNUCAjzWaL7vKoeJe59Hm7C4TdiQ6Qiq8d49rwozyv/7uQoS7+ofSWXbvZjyDc7E2WFO5sIGT71yezenAohf+Iykra5jIAAkdWW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqU1SQZ7FdPr2nQf0m9K002XvjOQztbsfvPFjITIFVU=;
 b=IKNqQa9mOLrF86i+iYII1S6FXsGPuAY9bMHS1sFWb5CR4IDAJiKOTiEHchX2rccBaPFBK+ShDZRXWAeUUr+hM160JZyuperqVyY5+5DG30nzP+VctLDJ5SFUjOI6kMdXQyXMeevqzRgN+00xwPmUtyN7ukKO7frdVP0/FrKBl5v3yFMwuxGyiqEKQ73fPGNW1XrJha8AkBDbWq/rAA8bEGcpS9rsKLxNmMsQnu0MIj+U4yRw3p9T/8xu3P9C6DkJ0E6lbWgaFmDKZPpIykPg0cNDitn/Z/uTSus0ahmKNLAfhHgTMYvI/B5J6GXyIC9xcWj2LonAS4Y4RaT8tutsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqU1SQZ7FdPr2nQf0m9K002XvjOQztbsfvPFjITIFVU=;
 b=WCSp3ZrpR4ALN102BYas3NzlvGg88zG1bsxJNDIOhsLBbiDQaneGmQ0kjCTJ+P1INo2ws1dKgv6JphwSjCj3Ge6A8fgM1d81dzDbzfJDy5hdeioh7eaMFyvXieMfh+05Ag2EoKkZJFUe2aGo6S/eTYMEmeoPmALwoKuH2voBbtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:28 +0000
Message-ID: <875ydbi40l.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:27 +0000
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc6729c-843c-4bf2-7313-08daf50a7ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVwZsschN6Z5Q45kmiuJ0GXLQWPP7Z+5AONCPVWUIwN4qyOga2J/ha9zatNuoMu9fCk05KW/B638Q2iX/+mKVAVvPyTC0CPhrxvvnFxxo8AENTI+kH4aqoJvBGEnZMuiKT4b/SzEnQgXtd2Hgpo5on5NXUmNENYwKIB2OHp+9nE/PWv75VJ53rUCdzgk0mHluFfNP929Kh7utIfuUn9K5CLMvUvznhh3xgMO7R6rG4wOpGvh0Q/5nCLKbv1JxObxt10mkwH3F2qqI8YvgcrZd0n4jYaLVCPo0x3nP+J88nK842ZNXRDzo9l9KnhJt6v4o08VHDsx9bPUr4TBd+i86pK3ok3My0KIJg8tATbHffNS+mVNeYQtfqy1DAhjDpqbyZA2sSMECd3+M4Qsd808XVI/FBsob89MAdhFrUzBtZ07EwXfSnucrhAvPn47nQ18OOPYFS5Dini56NS2NzWQk31ZKyfPd3k6mvwFjM8B1ukzNGeopKNkz97bKTkd5SlDnoveFUWdJ4/4xzFftmiAo3R8/2f/3BtQwtLvr+ZlFxEZk0eYQWtOvJgvnV6BseM6LoFt4IDHAu+xeaF1FLI/JCOPbI27N/DgWnXFh6oa5fxU+C0HSVn/JS0f64jWUHXhDEYjzGqEc0MV/OU/TAhAhPicXSf8yEjrf7RPp26PclhRcknpvAm4QJxfXbog5o8Esljld/5mV0Yu87RdJbO9KUwM6n7zRi+qlj3+TwmVXBFl5v8jduQqr5T4bRPPcw/B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ThQOZvCeC6IaoqhIbn+5UA333lswD+M6I6+p/kzDgyZ7Pa1M0fZOhMJ4dowx?=
 =?us-ascii?Q?kbY0GiKa8/Jk17kqyFrL585hXMVHrHXSEWHe8hc4VZcDcrQ6sq9Mu/d77Aff?=
 =?us-ascii?Q?pLQmGbDpMwpjEyFgNp5RT0Gj2+g2afgCH/+Pw2Lb99D3JE1hnSqGcIRVA/nW?=
 =?us-ascii?Q?77nIyeeLVTQo++C55MP1ng9LZFYD4tQkF798LjvwvrPrS8NeeczAFT/9Bnq1?=
 =?us-ascii?Q?z1vrsWKRCLXltl+PSnCNnB9w3fSeIARqVeGHegQOGhLnAsa1tnfzfkYgjEDT?=
 =?us-ascii?Q?BsmQELEFxzuUqF7jZJBjeZRCoRcuBAaGHpS8Dp75fexArNQ91g8u7GuXbRML?=
 =?us-ascii?Q?7uFRMp+QmivCKyYzd++EhRuukpGRs7etM7lXJlpWGpgUJBfSMnw0r7Brb3ri?=
 =?us-ascii?Q?0nvEchLvg8JfuqXw/I6JpY+9AkwnVRJkLE5i5NFnw8zo8v/YbKc6Rwj796bz?=
 =?us-ascii?Q?SovRIUnVhxE6xYwVU2do8NiBCINvdSo76tL04J5d9GCDyxpf1jrktFmt/RHt?=
 =?us-ascii?Q?DBxBdBKfcjmVqmHYUkTNZ4kSOMF6/Wg+Ka/GZH/K3dSvDP0wy00qV742MNys?=
 =?us-ascii?Q?rc9bpfQgpxPDu9hTjhZ3QXX1eNadTAUEFV2GUgAH6gAspqzy4y6H/+UNl09t?=
 =?us-ascii?Q?tNzhCwB5PBrFQSqcdbPkJl7SHKSPSBxqsCYF+QqV9Hch7VMsyHO5ANYLEJrC?=
 =?us-ascii?Q?9OAaVuTHdaCC5skOLFjVlC2+rH2YM7Wd92kmXePvQYZbQQU/dfYlXGVR4KFj?=
 =?us-ascii?Q?dnnKUamCuIUg1ectBXi2tj3684vyg1FP8+jcfSUPjI9qE0vBnR9raMmneP2m?=
 =?us-ascii?Q?fE+4XY2q5Eh0TIXARDb59HhCvT5vthB6pgf7wQWsy2/XxEC1KqhektuYAR8i?=
 =?us-ascii?Q?7U34L2iGbWm3tW4A1JwhQ97CmVBwC0aWdECkydpnjXCi4rfxL06wXHQ/hD3J?=
 =?us-ascii?Q?cKMnn5bRq6oQprTiu4+mWSjL6o+BZgOXsDUi9PcrAT5aCeIeZhRDOJ0cxYfz?=
 =?us-ascii?Q?EiGcPhnQCN1yN/DbxQNuAWTJtlIh80/b1x3oxs/+iQt27MqJ149v4UCcI2L7?=
 =?us-ascii?Q?1EJu7TBzVmGxK9FZ1JpA78LIiVRl16vjZjes5eWc5O+aOtxhE1Bi+MO5oJsw?=
 =?us-ascii?Q?mL0SiW2uwo8UJ/pFye9SoQm30ECxN0NN36z/O6me6vvNWOxn54fZQta0xzRp?=
 =?us-ascii?Q?U6rny9LOP96lgGJVQ5U9wIzSVwPcbMVPeLYmcu5U/djgEg2c4Ofvt3ronuOT?=
 =?us-ascii?Q?anxb5YhRgJVVcl0/a6AF0xZTs/tKd/yePBsHS12wwrRHMCm/71+0LsNnqBLn?=
 =?us-ascii?Q?Bw9oewuka5HbPK+BR33AlPlGX5t1R3DeDhIWurtqLqvl+PbhMXRRqxaRtg2A?=
 =?us-ascii?Q?UxCM/WzB7uMFwB5II2bRXb4/ODIYgxDbi48kIhNpAGmFgjRsTPMXbkjdkjwl?=
 =?us-ascii?Q?JliLwY9yzgddwX1BLg4+rL5ycf3piDwkE0QlYpo5nkTmpQjDsgxk6G761PPw?=
 =?us-ascii?Q?bEHWr0uCEYbAKA2feY6J2+KkVvS2OuDVkEXAaA0PYXIDvqZLcvLEl4Z9bxtM?=
 =?us-ascii?Q?VLX8TJ22bCFkhFGvavhID4OUovgZx8KPaxsPZLYpTRi05A/nFJEoEYiex/QN?=
 =?us-ascii?Q?AJmvfPXNWhbs6ZMtJn4XAsc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc6729c-843c-4bf2-7313-08daf50a7ff3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:28.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIygt5hi430W9QiA9u5ZyrZE7UJ5qaiQ2IkL+rVbm404hQ3LUOlLwd/TnkhQRy4RetNM88qx53t892bk27FEur0PEldq+H0hiEPgkx+ANZM2PolT7L6b4IeWWDivt5jl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11239
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

This patch adds "Audio Graph Card + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Link: https://lore.kernel.org/r/874jtypxfp.wl-kuninori.morimoto.gx@renesas.=
com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-audio-graph-card-mix+split.dtsi      |  91 ++++++++++
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 170 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   1 +
 4 files changed, 263 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+s=
plit.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mi=
x+split.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dt=
si b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
new file mode 100644
index 000000000000..88daded1975b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Audio Graph Card (MIX)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Note:
+ * Because there is subdevice maximum, it will ignore HDMI output
+ *
+ *	(A) CPU0 (2ch) <-----> (2ch) (X) ak4613	(MIX-0)
+ *	(B) CPU1 (2ch)  --/			(MIX-1)
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+
+/ {
+	sound_card: sound {
+		compatible =3D "audio-graph-scu-card";
+		label =3D "rcar-sound";
+
+		routing =3D "ak4613 Playback", "DAI0 Playback",
+			  "ak4613 Playback", "DAI1 Playback",
+			  "DAI0 Capture",    "ak4613 Capture";
+
+		dais =3D <&rsnd_port0 /* (A) CPU0 */
+			&rsnd_port1 /* (B) CPU1 */
+		>;
+	};
+};
+
+&ak4613 {
+	port {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		/*
+		 * (X) ak4613
+		 */
+		prefix =3D "ak4613";
+		convert-rate =3D <48000>;
+
+		/* (A) CPU0 <-> (X) ak4613 */
+		ak4613_ep1: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&rsnd_for_ak4613_1>;
+		};
+		/* (B) CPU1 <-> (X) ak4613 */
+		ak4613_ep2: endpoint@1 {
+			reg =3D <1>;
+			remote-endpoint =3D <&rsnd_for_ak4613_2>;
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
+		 * (A) CPU0
+		 */
+		rsnd_port0: port@0 {
+			reg =3D <0>;
+			rsnd_for_ak4613_1: endpoint {
+				remote-endpoint =3D <&ak4613_ep1>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&src1 &ctu02 &mix0 &dvc0 &ssi0>;
+				capture  =3D <&ssi1 &src0 &dvc1>;
+			};
+		};
+		/*
+		 * (B) CPU1
+		 */
+		rsnd_port1: port@1 {
+			reg =3D <1>;
+			rsnd_for_ak4613_2: endpoint {
+				remote-endpoint =3D <&ak4613_ep2>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split=
.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
new file mode 100644
index 000000000000..4fb3ba08a585
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Audio Graph Card (MIX + TDM Split)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Because it reach to subdevice maximum, it ignore HDMI
+ *
+ *	(A) CPU0 (2ch) <----> (2ch) (X) ak4613	   (MIX-0)
+ *	(B) CPU1 (2ch)  --/			   (MIX-1)
+ *	(C) CPU2 (2ch)  ----> (8ch) (Y) PCM3168A-p (TDM-0 : 0,1ch)
+ *	(D) CPU3 (2ch)  --/			   (TDM-1 : 2,3ch)
+ *	(E) CPU4 (2ch)  --/			   (TDM-2 : 4,5ch)
+ *	(F) CPU5 (2ch)  --/			   (TDM-3 : 6,7ch)
+ *	(G) CPU6 (6ch) <----  (6ch) (Z) PCM3168A-c
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
+
+&sound_card {
+	routing =3D "ak4613 Playback",   "DAI0 Playback",
+		  "ak4613 Playback",   "DAI1 Playback",
+		  "DAI0 Capture",      "ak4613 Capture",
+		  "pcm3168a Playback", "DAI2 Playback",
+		  "pcm3168a Playback", "DAI3 Playback",
+		  "pcm3168a Playback", "DAI4 Playback",
+		  "pcm3168a Playback", "DAI5 Playback";
+
+	dais =3D <&rsnd_port0 /* (A) CPU0 */
+		&rsnd_port1 /* (B) CPU1 */
+		&rsnd_port2 /* (C) CPU2 */
+		&rsnd_port3 /* (D) CPU3 */
+		&rsnd_port4 /* (E) CPU4 */
+		&rsnd_port5 /* (F) CPU5 */
+		&rsnd_port6 /* (G) GPU6 */
+	>;
+};
+
+&pcm3168a {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		mclk-fs =3D <512>;
+
+		/*
+		 * (Y) PCM3168A-p
+		 */
+		port@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+			prefix =3D "pcm3168a";
+			convert-channels =3D <8>; /* to 8ch TDM */
+
+			/* (C) CPU2 -> (Y) PCM3168A-p */
+			pcm3168a_endpoint_p1: endpoint@0 {
+				reg =3D <0>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play1>;
+				clocks =3D <&clksndsel>;
+			};
+			/* (D) CPU3 -> (Y) PCM3168A-p */
+			pcm3168a_endpoint_p2: endpoint@1 {
+				reg =3D <1>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play2>;
+				clocks =3D <&clksndsel>;
+			};
+			/* (E) CPU4 -> (Y) PCM3168A-p */
+			pcm3168a_endpoint_p3: endpoint@2 {
+				reg =3D <2>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play3>;
+				clocks =3D <&clksndsel>;
+			};
+			/* (F) CPU5 -> (Y) PCM3168A-p */
+			pcm3168a_endpoint_p4: endpoint@3 {
+				reg =3D <3>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play4>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+		/*
+		 * (Z) PCM3168A-c
+		 */
+		port@1 {
+			reg =3D <1>;
+			/* (G) CPU6 <-> PCM3168A-c */
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
+		/* rsnd_port0-1 are defined in ulcb.dtsi */
+
+		/*
+		 * (C) CPU2
+		 */
+		rsnd_port2: port@2 {
+			reg =3D <2>;
+			rsnd_for_pcm3168a_play1: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p1>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu30 &ssi3>;
+			};
+		};
+		/*
+		 * (D) CPU3
+		 */
+		rsnd_port3: port@3 {
+			reg =3D <3>;
+			rsnd_for_pcm3168a_play2: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p2>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu31 &ssi3>;
+			};
+		};
+		/*
+		 * (E) CPU4
+		 */
+		rsnd_port4: port@4 {
+			reg =3D <4>;
+			rsnd_for_pcm3168a_play3: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p3>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu32 &ssi3>;
+			};
+		};
+		/*
+		 * (F) CPU5
+		 */
+		rsnd_port5: port@5 {
+			reg =3D <5>;
+			rsnd_for_pcm3168a_play4: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p4>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu33 &ssi3>;
+			};
+		};
+		/*
+		 * (G) CPU6
+		 */
+		rsnd_port6: port@6 {
+			reg =3D <6>;
+			rsnd_for_pcm3168a_capture: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_c>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num =3D <6>;
+				capture  =3D <&ssi4>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 25098efd6b89..08242d3dee3f 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -449,6 +449,7 @@ &xhci0 {
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
+ * #include "ulcb-kf-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index bb93ba4ff946..172d065d70bb 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -495,6 +495,7 @@ &usb2_phy1 {
  *
  * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
+ * #include "ulcb-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

