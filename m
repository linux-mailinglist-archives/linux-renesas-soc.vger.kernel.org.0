Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBA9668959
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjAMCE1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjAMCEZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:25 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B093621B1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ8791P6f4SiY9BDGX2AwcWl7YJ4kowwGJNQoxuKH77lK+akQ5I/LDJE+aiFeOw/4OyGwLK89nkC9i5ysLzo8P6dwxzfqBd9Ra5XPKTCs84Ytw1h3yakeOoq/MslkvJ1LGUqGBZ77gztZSqbRvy0yHVON5q5H7qjEaQun6v+BRYCI336LqLJr9abFcLkNC1x55ijo7M3URVhyf/CyEo5/SlS6d2HT835V0LtYExi71wn0xdQChG/D0zl8pgrX0UdxSkbMUUtzEjL2hyOPgnNerBd3SY6XXh7jqTqC9pXwBw/agHx7F0V++wDZgdGOlJ3uok7q79l+d8OoZ1yX88CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RmOWQNwoAa8CxRMpMT+CrEDrVp0dfSYOiQdJ8enwfM=;
 b=i15kd6p3W4xv88av6D+Ya4ELZJdtnepIo7en5xyYvi8MW0nowfAbeyBxlhRZIOu58fq8m5dFWljOJHKakVpBWsz6AwA7KtICPYIU7r2T4EjB2DvoYtfEU9A4TOZEg7VCq81IE8d8YfrvPgYXgfPny8rHfbuJP/53J1tqWhn7VcWizvLhY5UUL4V74cTRQqiYkElcDWg7r0/mbp7DB05f1UyhmYE58nPWKRSGdM/ENIarBzYcjbVhRxsrB6NTn0aKjg3/cwfj4roJcfY6KFX6vwjoUyLIbTJLRUwZGDXokZFp52oTreEj0stqlyKDa3GYhfU51Fb5V3ER3gjEIhdpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RmOWQNwoAa8CxRMpMT+CrEDrVp0dfSYOiQdJ8enwfM=;
 b=D22/soqS2ea/VeDS6kkcv3+pfpRQXJa6oENI69fW5tAR/5CE4Ri2IVK9bWx7gx+qEehZrm6icoQcQTUwfCvEhIUDs5eRwcWhBtSnsgX6YFIVgUbfW3wnSSGQKyxn2MpDDeecWRH6WCmlYtZCicFRe1FIY2NGQGhwfrBGtV+dvUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:22 +0000
Message-ID: <877cxri40q.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:22 +0000
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: 277b7c18-8966-4867-f1b4-08daf50a7d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GcpmUqw6fP3Tu4xE+Q38Sb1EACoXXSTOD+v/D8tjQdloLBvZQZYLK+RUo7GUlQ7gbnuSWjPApml8EjjKOKKvA3W/2PdwSRvtFCyWyySXG/zIOIrjhNBUwczzx8gyFb9siSrr2aMs7t94XWaNAibcpcsYQjFeuf9z7UXq+qVqqdEkuD9ewKK8jdiggmoTauFN/1hREIy4GCwa7UvEcpRiOIZpcLqtND0EThhKtLO6ZT9KWpI3XgZwBCq4Ldz7fK/UuXDTl1t2iXp2V9nlvQwvQVw5ARYK2lT/pZK1+p0LGaxJIPLsaTWcgFsDy+UkE7CLAQ4OQ1xagz3HwUPorAxV9lb47Cl0HaDbWzG4flUeTK7F+xXcH6Nf7o99XLQFoKsquyfYsYCKn4DzZMfgrgClnVJQ6i5i4yLr2LJIBAs617UrLDNnmiv3u24LcOLlihQt4u1cNiQI2jtK6njbMRsa8Ix7NoqwD5CpxJNjlyvZFMtjvLlJLbTMDxr7EUyZwf0axPXnbKH7X4yt8KT0IXrXRGlfeqbSSuTAMhQ5auYE/ryGpLzorYLovrPsVIdmBCL1nf+Bmn0yjL4UfNEFHTb1GswvcXj6w0fBXBL6EbP9j83fh6mxBdf0Tuv7ukGZ19/38MNoyoT98c/3+kdNEpDmDLckrhyqFka02sjQv1qVcR6RvW1CXDpgo5lJqnf/bhbJ895XWfO/gySildvx+nudw/l4yRBm8Gl/f81fPc/Wa+9wRSKYQJ77SsqRzi/SwUj7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5B/yrJ2+jl3lVMnyRBLJdm0ibBTPVoEb1E6NMLuPf/9wQoJtjMXs2tLHV7n4?=
 =?us-ascii?Q?sMlGnm/YkEgAG5R3+pCV6PPy1rfKZoIFjQ9yrtSStoqfeGoFH2c00v3gD5Xr?=
 =?us-ascii?Q?VhQXq8fidJ3lmKenflS/pAA++SuFiFi3ArcN+9Mq99yZvgp5vwv5w/1AwEcU?=
 =?us-ascii?Q?uy5MZUvkKmu8GhSbrl5Odfgh+RqhLEihHD73ReT31/i+vrRLGy/tMxo/B+wx?=
 =?us-ascii?Q?eo9ESKOxCBqD35RBbD0w2s7oMjs5HzkeDYfutEEwF/WifKLe5Bg3TNqUaZ2C?=
 =?us-ascii?Q?wbgLoo2bqAngja7Zp60hMdxSRBnaq7+uE9XfKAGpaOElZ/caMlsjg/9Uy7Y9?=
 =?us-ascii?Q?K48chiiurwpeEvNhsUiXdFFCm7EBVxgp7ggNwKu4l34rjHnHKmZl0MKcq55b?=
 =?us-ascii?Q?1UqB7dfcdap/jp5lxBpTWDImRh4lYOfreSffR7/d+Pn+Vqw3smrJu3CxGTLy?=
 =?us-ascii?Q?AsDdsCVR1s3+A7AkEZItg/mnvIyaJyaAigDaj+KTAE21LsUKFGf9YMacKng+?=
 =?us-ascii?Q?6SMFBHH1g0uZV00YBMBgpA6/RDCwJ8LEVDtBg4+NqemDiMt9J4duyl6k1Hrr?=
 =?us-ascii?Q?Qcc+3VTk6vu07lzYv6ZHWbBtssajjx7FREgBM+c4nqUoHBgakEt94ybRKPpk?=
 =?us-ascii?Q?Y730ZQGUa5FInh2/Mm+W2fL2OjBFs+zfoK0BOrjmodkj/Qj2dtqT3BxI0/89?=
 =?us-ascii?Q?P3x4AbvrE7NW29ZwqLUC4mheLDlfiEOrM0sVt7qLcr887QGqEbS340pMrzDl?=
 =?us-ascii?Q?H3+CFqMuHwpILUa5i1OOds9GW/R5EkcOMWkCBc75uQ/Xme9D/r6hI2pjeRJ5?=
 =?us-ascii?Q?4oFXlqOmv0nGcTcP/8zy4EIM0B/4yue2ZeOu11A1NUQhU7HmP7yOso8NtUuB?=
 =?us-ascii?Q?4xuC9xl+YWGrpNFyQjb81kEVPxKhoWf3b2eHBTU02bFXSjbYy/vlxwEY0ZDb?=
 =?us-ascii?Q?jcGFDv/d6W05szweqH/X4WrUzyImLOTifxNjoJjOipyCfhu2R3JguAeJ+T0y?=
 =?us-ascii?Q?Lj1r1IMlgUai1P2amIstl6A3IiLw+gTkrg9eAMQAGsenuHrIvv11nWhjc5Rd?=
 =?us-ascii?Q?d7/tP6DG4TUWTQbymseh61GSK4gK38LRWBz9+YKLJ3KGmsMNiWAeMTkQ2L7W?=
 =?us-ascii?Q?+FfMnqT9TWErzy94JQg9uk86Va0JjXT3/SvMXV8X6hdX2lYjMTuQO4AfAvxl?=
 =?us-ascii?Q?gjZXVIiEFdBi5+7VtISU5p/uusv/rQL46/S55slTopH9+yiZSMfcgQxBV/Bf?=
 =?us-ascii?Q?tFfatWdGiKwRwzGSJ36hCldUslmaLKaWKZkqiLgRu4BxtBej1lgM9g7ir++w?=
 =?us-ascii?Q?CvkDqqk9lJVdiYfdj/nhGybpb3gnwCVI9mVf74xgcTAdXvL8L2D2ltBMk/CS?=
 =?us-ascii?Q?FdANMM57/7gZQEeindoxhWQDznqc5UJJBey1rkVuA+wKuKgu9rzkdpmM7cwK?=
 =?us-ascii?Q?6KyFts3uOBDyspFmdgf6R0kZb4NQnM6H+u5MYrvbcEehxnsccBTDpuYtBf/t?=
 =?us-ascii?Q?8JtifZCAA6UVv3vmohjyVn5nY8oyTzCuC2n1t4Q0rwzeOGn7+dxtkTTncg+1?=
 =?us-ascii?Q?D/oybBL2WOlb4ZJdbBJQZqMJqimsO340I7lDHm7cRouDqImfGBWvFbi4uw7F?=
 =?us-ascii?Q?xeXTqf5Fz52Y5+qEa3JIWMQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277b7c18-8966-4867-f1b4-08daf50a7d0d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:22.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXjeXFNjd6Luk/Zupz4SvFyUkrsNiFgn/K8neEnqzQnQcz6JzJyv0e+PvSDyB5Q4JuaWpYG3NZ+dD6N2IYhVH5u2qF73o68NrDt74W5PXNsSER0eiUkK/a5s9kPWaEKJ
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

This patch adds "Audio Graph Card2 + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Link: https://lore.kernel.org/r/875yeepxfw.wl-kuninori.morimoto.gx@renesas.=
com
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
index 000000000000..197e045afbca
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
+ *	(A) CPU0 (2ch) <----> (2ch) (X) ak4613	(MIX-0)
+ *	(B) CPU1 (2ch)  --/			(MIX-1)
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
+			  "ak4613 Playback", "DAI1 Playback",
+			  "DAI0 Capture",    "ak4613 Capture";
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
+				fe_a: port@0 { reg =3D <0>; fe_a_ep: endpoint { remote-endpoint =3D <&=
rsnd_a_ep>; }; };
+				fe_b: port@1 { reg =3D <1>; fe_b_ep: endpoint { remote-endpoint =3D <&=
rsnd_b_ep>; }; };
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
+				be_x: port@0 { reg =3D <0>; be_x_ep: endpoint { remote-endpoint =3D <&=
ak4613_x_ep>; }; };
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
+		 * (A) CPU0
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
+		 * (B) CPU1
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
index 000000000000..bc9b89dc6eb6
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
+ *	(A) CPU0 (2ch) <----> (2ch) (X)	ak4613	   (MIX-0)
+ *	(B) CPU1 (2ch)  --/			   (MIX-1)
+ *	(C) CPU3 (2ch)  ----> (8ch) (Y)	PCM3168A-p (TDM-0 : 0,1ch)
+ *	(D) CPU2 (2ch)  --/			   (TDM-1 : 2,3ch)
+ *	(E) CPU4 (2ch)  --/			   (TDM-2 : 4,5ch)
+ *	(F) CPU5 (2ch)  --/			   (TDM-3 : 6,7ch)
+ *	(G) CPU6 (6ch) <----  (6ch) (Z)	PCM3168A-c
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
+	links =3D <&fe_a		/* (A) CPU0	  */
+		 &fe_b		/* (B) CPU1	  */
+		 &fe_c		/* (C) CPU2	  */
+		 &fe_d		/* (D) CPU3	  */
+		 &fe_e		/* (E) CPU4	  */
+		 &fe_f		/* (F) CPU5	  */
+		 &rsnd_g	/* (G) CPU6	  */
+		 &be_x		/* (X) ak4613	  */
+		 &be_y		/* (Y) PCM3168A-p */
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
+		 * (Y) PCM3168A-p
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
+		 * (Z) PCM3168A-c
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
index afc63d28bf5c..25098efd6b89 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -449,5 +449,6 @@ &xhci0 {
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
+ * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index 95d9086b92fe..bb93ba4ff946 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -495,5 +495,6 @@ &usb2_phy1 {
  *
  * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
+ * #include "ulcb-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

