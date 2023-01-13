Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCC066895C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240575AbjAMCEj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240368AbjAMCEh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BC9621B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7gNhEnfypTsqw5QXNaqUmBXwY3yOjiROGP5ppMg/HkElzAkGHMgQRrD8Ak7CK2oZ84ozSYNqIwkEQ08b7uUkdGsZCOdxjgigA2fV5N/sfUahbqR3oAr+SVdeEcxj0nJvhC7W+DuDVThoQ4VJvAERXYTsrK18peb7IM0guKdUKRDcIaksXMPabIs6bcp+l49sqX9oU11e9v06q2rHnbd0EELGHwpU/ErtfAmrrYIDsT4Fn0HH5b68oWFigKieeHMCwgiR0K9vuCQ2AyJfAlPdbQciLD6QsUV2X1j57a3b4SqepeFymVtd4EAk6a75wveO3V90LAUd03BSTQg64DPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3eaw0oGLpFUuLsSgtKkA4rA/v+mpgwZyK1zRB1VUmo=;
 b=JxrmlccE9B4CUKHCPgdoKDurmq7jo88unHk39xng8CPq7PNHNDWc87nkGHGLVZVLy1uJU7AXgZHP7pEP8XgcvbWECVGufGZvrQoTXcVwNHlGECuZWf/x7QxLc6OJfZP8VYrunhQq5VYIqdiCTVIpb3/mTfcZOip/JceG9Fh0uXOaiNHMOaIjpRb6IDITvcNLrmrm7z1iRt01Ztw6lwjonR5l1mTNq1eRY3TXGFi5yCmeNGkD4FAnd6b9z2tG9scyMgMdM/DzM+jJGxkORn4durW3AEaC5wO5qeDbgW1nlsxRQeZ7zJXTETAzVS/ohUj+4pYfUqraqg9Hp80wLZwGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3eaw0oGLpFUuLsSgtKkA4rA/v+mpgwZyK1zRB1VUmo=;
 b=Nmd1YfLtnej2SJ1nvOP9BMeX+bYUh+JyycWNlRXNqKcxNTY/+FgyJ5uYVUg4PHhY51NYPUOIQR+mSDsJ85235zPoaxjZNTrDafZ2CIiNzPI6DmKKoPwxIHbBqzHAIxbOSuW36LQe30fgLg5C8Rzt7yJIDnghN0VBS4vguVJjCKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:34 +0000
Message-ID: <874jsvi40e.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 8/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:33 +0000
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: e9709efd-13dc-46f0-c738-08daf50a83ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BPZa8QrRXsfrLWzdTjv3OQth62r+XnavWTJwV/xFZumiLTiT7/JXBzB1Y/gcs0FGSWIBEkMiqCw2n8DodK7FQeGFzIK40FHbCdniDe80teChbsrOqIkxZaKAlPP1RZdK8irRPp82X1Rf2TL0vlFjqGEpg0mbRe2wEF4AsPvncy8jiaeDthhv0YIubYbjv4RanrJ3zd99SaxsyqlCtK1853aughOJWcg+QLZtbstJ6n3q45wF76Q40lzvy8N0BXiQDqqahwFXZcByDAzy19mwATGUBxaLWw36kyfykswOHcuXeEnw+Hz7QDK7G94cELIICHweDGcls7hlnY+P7jZiMCV6ENjD6qUUeqwz/wRDT5voWZsw6ET1j+DKp/QSUKHfCCCZ5jcEYbyqY+nz8E+pWV+nTzxQ8vajrkrQXva2bobBpZFJwsvjAoqKzlceFByYUzH99CDtMDf6otUWBw0HATLNQbkC3X0xypBiJb/pJcNj2DIMMyAkBA3bZf63xKfGwaUqLIIj4Ov3CPqxuvWV2P/KONCWfuJl65RITOBfCGIwIPBLuiTJxvcGUO1Q1p11DBFQDPzCCvPTWrvUGeZOOcyccDFsz+BmxBzYyU9P2jmtyhmqHJxTSAOC6y796blp2E28pmd9dzsGE+PYHrpASeT1TqBSfwwW5j2tMVKE+jeFvJxP2tnXhWDSDw1f2u3tbAR3llWwslLBkkOb6hAI4yYDroHoqf1a45q3BhYlcXJPTy3RyopYSzbBbZuO4sr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmdkWPbV8FrZhrBgCd6Vs8pyMiBVuO2WdanGL1Odi4rAdL2Exd8YY76Gr8PJ?=
 =?us-ascii?Q?m/4qgkqukVOkXEtlkFfOfSa44S2617nwnOIwOkD3epys8VqrOs3lSmu0P9AH?=
 =?us-ascii?Q?KXNvqB6Rjqi/xE7ZV4OpVsMOQ1R+WfE9C9uNAzu06jA0E3ZWDPvwqjpcJtmR?=
 =?us-ascii?Q?jy0L/TFXUZc+1KQhY/psWLZqBDij3BIfk5Tdpnxa21abhFjYQ9ePdhha18Gl?=
 =?us-ascii?Q?2sdrkgbMTH33NK7WiTURdTkM8Q5EVzT/XgQLS0YCMNiZVd8n6o0vMj1egrpD?=
 =?us-ascii?Q?lcXc0TQe7jZtfhqSwD2yVsp449Go9mrJYkhTPTv996bt33hDP7v618Xbfz3H?=
 =?us-ascii?Q?QIldFByAHOjzFStsIEqe5lQ0Phv/gpcJm6sqCBa2KCvXqxHsuqFivFnA6vty?=
 =?us-ascii?Q?7my98ZsPEKxZvvqVRzzxfUEWS0I46JCMRumAnmuZ5+e8+4k9f3IfD47vv/St?=
 =?us-ascii?Q?k1ZW/HIwUfRHh3aMlb0o43xcXnkyi5+XRATCqxz7aBRCL5Lm0mCaAw3HPNJw?=
 =?us-ascii?Q?oXcKAxnH+CiZj4TSv+PXs2BnqU91qO9zYdTnFxrddDmi9jfhLcaQwg1RSCI5?=
 =?us-ascii?Q?AA/ylIy3NysQ5LgjluGAHq86jL4zVkfoA0WiMm0m03bteE1ur5iO2BK8jG70?=
 =?us-ascii?Q?RgZwbisqMLNm41W55mW2OMYEflV20DzLbPTOek0qFud53eoiI3FMFuq2tJQv?=
 =?us-ascii?Q?RDrkoTzXpRZqXC0fH9ZRZuw5rZi6sS6kXu8E0wX3r7NINxPylmVzNZ5g02nU?=
 =?us-ascii?Q?9nqoBxR5L9qoqWiiu97w1vnqiMB/BtRstHj0Q87y+xKf1OxakmRjvRUsEy7q?=
 =?us-ascii?Q?a5d4f70aTtR7eHRGkdU9N5mLcQ0JVUxQvGs4pzKwldHXXlQm6QnIF37WsBYY?=
 =?us-ascii?Q?BQXHXNpifyrGrPJndBYufZTY0E3wJfrZ8e2/rbe4yFxs2e74fP5gO81BC3/6?=
 =?us-ascii?Q?PTm5AORwCt4R1FHagpCr9FXyGqUiG3REYzQykIUd10wzWNmSCg0TzrMl74qe?=
 =?us-ascii?Q?nsx7Yz/D3LFx6LifJUwKCL5LO+9sFdEBfOCLGmKCiLU+Ak2Uaj7nBfx01oQ0?=
 =?us-ascii?Q?et8NVaNRhVDHNrJSKea6en94ZbXjon3/EGdBCW0CoJ/5SDwzCI1FXgJwEcT4?=
 =?us-ascii?Q?65QOV8aT2v6OMCL7JfN2XiCGemtld37izOiOqLM5ms9wldwmsAKtih0A10A/?=
 =?us-ascii?Q?RE+qpMmmNB6tXliXMxhwjPZ8Gldy3Y6oCedmMlmv6coj0Y1Rm04BdpwgAWSf?=
 =?us-ascii?Q?dxo97LSRm362zFqMsc6nFAFqABwZJGlAkj6BFMZ8NTNWXuaQMBBhu9lZZwJE?=
 =?us-ascii?Q?+cbu8DNocSkb0ksoZePlrs4DqySCJQej757vmyS6gjuIZxxGkwV4YtbK3Q+l?=
 =?us-ascii?Q?7LCw9Y0DwMfLqlgKpcpbsIKIGux/lJo4rjU1AsKIO3HTfSuesYorxK5HKeN9?=
 =?us-ascii?Q?C/oBF/maw2TQzbQx0Z4p3GhgTi0QMEio22FcUxb1oYOGPcXdyqP7BGG+nG6C?=
 =?us-ascii?Q?tzIAyIFDJixsLXc37MYbztrQ2Fvu/W9xVX7LQ3DFDT8LLlL4PLETTdNRNqdx?=
 =?us-ascii?Q?XWyOYbPvDqPSfB85IQ0X0depcIDnXmwmo7KpAd1N+HjOk4lJiC0ZXesz9STZ?=
 =?us-ascii?Q?JlgGjGoAcBVX1g1dQmNMRTQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9709efd-13dc-46f0-c738-08daf50a83ef
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:34.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjDosSHJ+DTh32snWc1VA0QuTuMujlGXDP/uZaRik7ojR7GazBIqP9vhyhEvkLtNT36cZnLgDyPqFVEAZw2JbD+x0wM0tVWlfozCAl2PdKR8MvugttgErYUyJsVgfWmz
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

This patch adds "Simle Audio Card + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Link: https://lore.kernel.org/r/87359ipxfj.wl-kuninori.morimoto.gx@renesas.=
com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 152 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   1 +
 .../ulcb-simple-audio-card-mix+split.dtsi     |  89 ++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   2 +
 4 files changed, 244 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-m=
ix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+=
split.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+spli=
t.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dt=
si
new file mode 100644
index 000000000000..a7a4e18c197a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Simple Audio Card (MIX + TDM Split)
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
+
+&sound_card {
+
+	simple-audio-card,routing =3D "ak4613 Playback",   "DAI0 Playback",
+				    "ak4613 Playback",   "DAI1 Playback",
+				    "DAI0 Capture",      "ak4613 Capture",
+				    "pcm3168a Playback", "DAI2 Playback",
+				    "pcm3168a Playback", "DAI3 Playback",
+				    "pcm3168a Playback", "DAI4 Playback",
+				    "pcm3168a Playback", "DAI5 Playback";
+
+	/* dai-link@0 is defined in ulcb.dtsi */
+
+	simple-audio-card,dai-link@1 {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <1>;
+		convert-channels =3D <8>; /* to 8ch TDM */
+
+		/*
+		 * (C) CPU2
+		 */
+		cpu@0 {
+			reg =3D <0>;
+			bitclock-master;
+			frame-master;
+			sound-dai =3D <&rcar_sound 2>;
+		};
+		/*
+		 * (D) CPU3
+		 */
+		cpu@1 {
+			reg =3D <1>;
+			sound-dai =3D <&rcar_sound 3>;
+		};
+		/*
+		 * (E) CPU4
+		 */
+		cpu@2 {
+			reg =3D <2>;
+			sound-dai =3D <&rcar_sound 4>;
+		};
+		/*
+		 * (F) CPU5
+		 */
+		cpu@3 {
+			reg =3D <3>;
+			sound-dai =3D <&rcar_sound 5>;
+		};
+		/*
+		 * (Y) PCM3168A-p
+		 */
+		codec {
+			prefix =3D "pcm3168a";
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 0>;
+		};
+	};
+	simple-audio-card,dai-link@2 {
+		reg =3D <2>;
+		/*
+		 * (G) CPU6
+		 */
+		cpu {
+			bitclock-master;
+			frame-master;
+			sound-dai =3D <&rcar_sound 6>;
+		};
+		/*
+		 * (Z) PCM3168A-c
+		 */
+		codec {
+			prefix =3D "pcm3168a";
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 1>;
+		};
+	};
+};
+
+&pcm3168a {
+	/*
+	 * (Y) PCM3168A-p
+	 * (Z) PCM3168A-c
+	 */
+	#sound-dai-cells =3D <1>;
+};
+
+&rcar_sound {
+	rcar_sound,dai {
+
+		/* dai0-1 are defined in ulcb.dtsi */
+
+		/*
+		 * (C) CPU2
+		 */
+		dai2 {
+			playback =3D <&ssiu30 &ssi3>;
+		};
+		/*
+		 * (D) CPU3
+		 */
+		dai3 {
+			playback =3D <&ssiu31 &ssi3>;
+		};
+		/*
+		 * (E) CPU4
+		 */
+		dai4 {
+			playback =3D <&ssiu32 &ssi3>;
+		};
+		/*
+		 * (F) CPU5
+		 */
+		dai5 {
+			playback =3D <&ssiu33 &ssi3>;
+		};
+		/*
+		 * (G) CPU6
+		 */
+		dai6 {
+			capture =3D <&ssi4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 08242d3dee3f..5b71c15c72f8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -448,6 +448,7 @@ &xhci0 {
  * see also ulcb.dtsi
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
+ * #include "ulcb-kf-simple-audio-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
  * #include "ulcb-kf-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.d=
tsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
new file mode 100644
index 000000000000..767214eb2024
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Simple Audio Card (MIXer)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 (2ch) <----> (2ch) (X) ak4613	(MIX-0)
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
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		compatible =3D "simple-scu-audio-card";
+		label =3D "rcar-sound";
+
+		simple-audio-card,prefix  =3D "ak4613";
+		simple-audio-card,routing =3D "ak4613 Playback", "DAI0 Playback",
+					    "ak4613 Playback", "DAI1 Playback",
+					    "DAI0 Capture",    "ak4613 Capture";
+
+		simple-audio-card,dai-link@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+			convert-rate =3D <48000>;
+
+			/*
+			 * (A) CPU0
+			 */
+			cpu@0 {
+				reg =3D <0>;
+				bitclock-master;
+				frame-master;
+				sound-dai =3D <&rcar_sound 0>;
+			};
+			/*
+			 * (B) CPU1
+			 */
+			cpu@1 {
+				reg =3D <1>;
+				sound-dai =3D <&rcar_sound 1>;
+			};
+			/*
+			 * (X) ak4613
+			 */
+			codec {
+				prefix =3D "ak4613";
+				sound-dai =3D <&ak4613>;
+			};
+		};
+	};
+};
+
+&ak4613 {
+	/*
+	 * (X) ak4613
+	 */
+	#sound-dai-cells =3D <0>;
+};
+
+&rcar_sound {
+	#sound-dai-cells =3D <1>;
+
+	rcar_sound,dai {
+		/*
+		 * (A) CPU0
+		 */
+		dai0 {
+			playback =3D <&src1 &ctu02 &mix0 &dvc0 &ssi0>;
+			capture  =3D <&ssi1 &src0 &dvc1>;
+		};
+		/*
+		 * (B) CPU1
+		 */
+		dai1 {
+			playback =3D <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index 172d065d70bb..d693e879b330 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -488,12 +488,14 @@ &usb2_phy1 {
 	status =3D "okay";
 };
=20
+
 /*
  * For sound-test.
  *
  * We can switch Audio Card for testing
  *
  * #include "ulcb-simple-audio-card.dtsi"
+ * #include "ulcb-simple-audio-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
  * #include "ulcb-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card2-mix+split.dtsi"
--=20
2.25.1

