Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263CA64C1FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbiLNBtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237055AbiLNBsr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:47 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08659275F0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAzWSEJyQmN9cv1J/wkfRJ4jZS1j8ejxfGSr8K1JjUcgDPmyfEBDcz8JRDeFKbmSkjUjJIoINjluJRSq2tHKhFSk7xc1nWqGp2nbdzW/SjlppDNAEniVavE1Px/lYQFiAPyKKVVVLTdXPYO/D3i2NdVPNv8X7DLhATCqv3JmaPyJri0n4uHsrclN7+Td2O6ARcrHofeh/h9TvQSXoQnNbeDGpnm9MA5A03IwGQhT++x1LkWVOOKyQsMC2Eybs39uAlOJ4SqRg1Je/v73Q5uhppi8UlIqT50KP8oFLHkmPcrl6zt+kzW9rdWherBW+zKCGeGyBCzPnA6fE+pXISMmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fijaRE9GG/7PPvXlw2SVWU9PzhGU5xzxKOME07rGgo=;
 b=TAQY8qi3irdd5jtP1nw8t48C7z0sPuOcKvpnmqh0LsMl8RisgK25X555HjVIK6WZAs/32rVjMF8B2Th/BMVDeo+B0cSw1tCLWI0lJvADceqadqw+CSWvjZV2f4Wc9NSmpFhPBAQ/V7CbRoyDUZgRpYpfDB+TdKta5zJ9R8g6cW5eX1EVwast2IkM8mqM6mlKCEa6IFb7kBxsNthK0e9Wvw0NNZBThKEp3gl777nBnKQ4KZIZnKnF3iICuriyjdUZq06EWaNz9ZtVRULAEXVn2OCQjoWKWZKHEldLXkXlMYo6vYeeug4qWEavwqQJPb1NRTyP9DXWvHvxsir7aPpwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fijaRE9GG/7PPvXlw2SVWU9PzhGU5xzxKOME07rGgo=;
 b=cB2Xjn7VUrdmI6YBFQ2zhXOtzgwXBLgL2f/R6eJC01fS5WAGkjiPuoyBQaAtXfMLYdtdMEhh45Mn/WQutJ9+R06wOyb2VTJumnzN3/J4vQG1IW2tHbscxNCrUz8XqWa9hYoXgQ6YtOLFzgQIXEeAF0ZrF3OQYY+qyQ1aEMVYouA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:42 +0000
Message-ID: <874jtypxfp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:42 +0000
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2951b7-b42f-4189-a3af-08dadd75548a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyPdEhw5UqAgXUJRD5g7akJR8sqhDiAbyJRSD1+jPQoqF+iSTrml1+OogOBEGHJNdLzSxRBVnORfeYEjJVgQJYesV1fEoErboM25NAEDWzDjCDVfOKgEmrxyvupizEZLP1bkXhKknFifySoedkQjwV6MeOQqL2iMypuGUl4BB01PJED9zwRrCb0ktTD6YnWe06WhNhc1YxVExDUQ0aTEOLzAAYJk9EJgRzFCAK34m6YIs3/bYZH15rFq6JmByIQ0JdoMbBpHlH20i+9/ILFUxRvRAxWDHwZXtBT6ZJaSdVA1zm+QbwUv0YH6o82BJnDCnnmRD20medpAELMsvjAGANoDo7n87RUNRXn6UF4aBsNloerLmx9Q7RJvloxSlNcNht4Tut06peJJkE2YZdV5uD1Q+1m0zmy2mZKL+CH/vB+pRZaXnBZXdvMh6pWUHRkJPVHEY4dNQ439IYsuYXwuQSPukxsuIBO8VdNJ0qYLqO0wBT9PRijIqCDhxHiEFUnzfSJDJPyZ44OuX1x/f8QGIsGjYb7xSOZrwQx/UBBZZ7QXFdoGzlbRQvHbFjLDv35/S88IsnCrGQsk8M92T7ocICkAwARGjfgfqyOuck9NAhTuxGp48HIgyJtYkSTpxkOlXnhZ3AM5lQvoZ4nrlvfLQZUQjBUCPamnA9HL3Jpbiikks9q1m1n7buHoe5Nw0v08II5CiIVTh/iTfIRksrisZ8cbuIjZNukT0ltZ31Ln8Iw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0MhQbLDbfpC1tm+W8aJIZ2M171l0TdMOxC3PRvU9yHvQt+EyV8Ic3FhIFL63?=
 =?us-ascii?Q?A8HYLjsgCfYtyG9stZT08VTr4cCAe+02QrNCO+UVgBUXySzbv3s3YL5CzBDn?=
 =?us-ascii?Q?7YFjvkUC0JDfFqzlKY2CZewfC7BtHBXZlkiMNhYV223J3F3fZsaS19Mbnz4C?=
 =?us-ascii?Q?Z0aeVMvsTUTw2r0LRjLRIXe7l/G4by2TO5JTv6MI5SKc4WkKeCyhaWCLVTxv?=
 =?us-ascii?Q?5kAW7uoaNquMRIPR/DplAD3AZbvdWH7YYTCqrRw1WofhgeG0WNHNx1HgBrqe?=
 =?us-ascii?Q?adTLdGI2/8zqTmELl4Xda6GH8bf8RAaJIShNzaKX9bgkvvEK2dM+D1OI6RRf?=
 =?us-ascii?Q?UWpj+ywkD0NJfObFInhp+xBae9p+w6A8/OXkE8/vqo+5SME1qa/8WtGPXOc9?=
 =?us-ascii?Q?FPvOaVuM3uK5OXihG7RJdKrDv4/2ntdkL6m/rWXmN0/u5wUej5JI9o4RJ/pv?=
 =?us-ascii?Q?RgYQi346x9RInDiafu/P+5q/5BEYevqRb6n6R/c0OgO4XHajeBT0zmg2iz87?=
 =?us-ascii?Q?0uuoImW3ilsDsKLFrs0lNhaQ0bgQrNwxt+a9KUKkYoeWZ72DRKYFlRbLPRES?=
 =?us-ascii?Q?tmA0yJoTuwA9uq5zCwNVIcHEknxMuFvQgOhnTw7tGVWzw5UCRGA/W3tJgQwr?=
 =?us-ascii?Q?mP0Bmzpovf0kQAYO5vR+jCiWMr/o87r7ia1/p5g+AlK4S/qGawvOqL1QcWvl?=
 =?us-ascii?Q?DTDg9E71ApqihRNFz8Ke4PCNXhnj5w2MiH9s+OZecC/UmsPEBzwBfkVNCrc2?=
 =?us-ascii?Q?RFZPuhPBr322KXe767iMHhnC3/cWqLe14nCYQPs1u5SclcZzjWiBl0U3f+l/?=
 =?us-ascii?Q?UFOWqrvl9FROAFNPu0Z1fhUGSZP8WV3f3DIMZroZHsgVe9vcnU9FBHmr/Dd0?=
 =?us-ascii?Q?hmBLkgdXCOXlPuR7cIcSGGSJfHzGNDTWkeCfj57RJQDoS0gKaJqxXaTv/WSO?=
 =?us-ascii?Q?ESWKP1/tNUnAH14Zkt9gYO40yQf70VSY/sDgCUvBGH5eQHufUOIz95nvQuNr?=
 =?us-ascii?Q?aucgTR4iBTKC5sSh4kEDbHrsl0artvXRH9IunI7DvLK0nFHa1sh5g5GgougW?=
 =?us-ascii?Q?WpBz+/mz33ksZjPsCzsro35CpauxvBGxs5s2gIweuYKaf30PXrNEB+5Dinnm?=
 =?us-ascii?Q?o5QW7nZn/ImJd69eL2PghGd0F5547xTzn21Zepzq5DuS818kiVGmXYZ9pNQp?=
 =?us-ascii?Q?7K7qor4HNvUELvgQfmrJz2P9gzs9Py+Pct2F8UghelAaq1SMdhu6k6VuK2RY?=
 =?us-ascii?Q?M+azpZmAWVeZAXCNGd1zBTiym9KQ61eInkvrH3lfC0C1UiRN+l8uy+p/Hitq?=
 =?us-ascii?Q?v9hXkxi4aR209Csm8WNm4HqR+qMa58TFEidmrWIqyDZOzObK4z3PhZa5UCgo?=
 =?us-ascii?Q?QV/c1q+fe48bmwrJM0iJAbfu8aEuED0xS0mC5HvwryMm3uIeIGToMke/Hjpy?=
 =?us-ascii?Q?io9pcE7CMLTABAGXN/KDtsR5J+vqXtUhJTwxEzXyRKC1w0vtey8CzWmugL4N?=
 =?us-ascii?Q?hXQ3ZkrvDeIWVHdb9CH4Y/IbcZDoR2ryfNv37yA8Tv6RedtFat3tFlRiu7Ow?=
 =?us-ascii?Q?qHczDozU5CdldPfrHeNVei6ouUNS0yKtw9AZ8pqoI01k0lGXDCGTALuIqFc5?=
 =?us-ascii?Q?Hd8uzhjOrKU/Z2k88/j9xss=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2951b7-b42f-4189-a3af-08dadd75548a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:42.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAH8cPu6pazM2Xse2cSCScsbvJbvnu1CoHgFHUwV/2FA5OkGogXpLSH1ypKQ0G0GdBATYlVCXfcKPISVOtHohuc/FPC6zlZTzfNhjQ4yPW/y8ihJGto29Ya09ZlmFHLZ
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

This patch adds "Audio Graph Card + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-audio-graph-card-mix+split.dtsi      |  89 ++++++++++
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 162 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   1 +
 4 files changed, 253 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+s=
plit.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mi=
x+split.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dt=
si b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
new file mode 100644
index 000000000000..55acfe6c1268
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
@@ -0,0 +1,89 @@
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
+ *	(A) CPU0 (2ch) ------ (2ch) ak4613     (MIX-0)
+ *	(B) CPU1 (2ch) --/                     (MIX-1)
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
+		dais =3D <&rsnd_port0 /* (A) ak4613 (MIX-0) */
+			&rsnd_port1 /* (B) ak4613 (MIX-1) */
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
+		 * (A)/(B) ak4613
+		 */
+		prefix =3D "ak4613";
+		convert-rate =3D <48000>;
+
+		ak4613_ep1: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&rsnd_for_ak4613_1>;
+		};
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
index 000000000000..92cc06353746
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
@@ -0,0 +1,162 @@
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
+ *	(A) CPU0 (2ch) ------ (2ch) ak4613     (MIX-0)
+ *	(B) CPU1 (2ch) --/                     (MIX-1)
+ *	(C) CPU3 (2ch) ------ (8ch) PCM3168A-p (TDM-0 : 0,1ch)
+ *	(D) CPU2 (2ch) --/                     (TDM-1 : 2,3ch)
+ *	(E) CPU4 (2ch) --/                     (TDM-2 : 4,5ch)
+ *	(F) CPU5 (2ch) --/                     (TDM-3 : 6,7ch)
+ *	(G) CPU6 (6ch) ------ (6ch) PCM3168A-c
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
+	dais =3D <&rsnd_port0 /* (A) ak4613   (MIX-0) */
+		&rsnd_port1 /* (B) ak4613   (MIX-1) */
+		&rsnd_port2 /* (C) pcm3168a (TDM-0) */
+		&rsnd_port3 /* (D) pcm3168a (TDM-1) */
+		&rsnd_port4 /* (E) pcm3168a (TDM-2) */
+		&rsnd_port5 /* (F) pcm3168a (TDM-3) */
+		&rsnd_port6 /* (G) pcm3168a	    */
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
+		 * (C) CPU2 <-> pcm3168a (TDM-0)
+		 * (D) CPU3 <-> pcm3168a (TDM-1)
+		 * (E) CPU4 <-> pcm3168a (TDM-1)
+		 * (F) CPU5 <-> pcm3168a (TDM-1)
+		 */
+		port@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+			prefix =3D "pcm3168a";
+			convert-channels =3D <8>; /* to 8ch TDM */
+
+			pcm3168a_endpoint_p1: endpoint@0 {
+				reg =3D <0>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play1>;
+				clocks =3D <&clksndsel>;
+			};
+			pcm3168a_endpoint_p2: endpoint@1 {
+				reg =3D <1>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play2>;
+				clocks =3D <&clksndsel>;
+			};
+			pcm3168a_endpoint_p3: endpoint@2 {
+				reg =3D <2>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play3>;
+				clocks =3D <&clksndsel>;
+			};
+			pcm3168a_endpoint_p4: endpoint@3 {
+				reg =3D <3>;
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play4>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+		/*
+		 * (G) CPU6 <-> pcm3168a
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
+		/* rsnd_port0-1 are defined in ulcb.dtsi */
+
+		/*
+		 * (C) CPU2 <-> pcm3168a (TDM-0)
+		 * (D) CPU3 <-> pcm3168a (TDM-1)
+		 * (E) CPU4 <-> pcm3168a (TDM-1)
+		 * (F) CPU5 <-> pcm3168a (TDM-1)
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
+		rsnd_port3: port@3 {
+			reg =3D <3>;
+			rsnd_for_pcm3168a_play2: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p2>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu31 &ssi3>;
+			};
+		};
+		rsnd_port4: port@4 {
+			reg =3D <4>;
+			rsnd_for_pcm3168a_play3: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p3>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssiu32 &ssi3>;
+			};
+		};
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
+		 * (G) CPU6 <-> pcm3168a
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
index 0690c1b1b5e9..131846dde002 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -455,6 +455,7 @@ &xhci0 {
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
+ * #include "ulcb-kf-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index b357267a9083..d8b0b07404ca 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -503,6 +503,7 @@ &usb2_phy1 {
  *
  * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
+ * #include "ulcb-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card2-mix+split.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

