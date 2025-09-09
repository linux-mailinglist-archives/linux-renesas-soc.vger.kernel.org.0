Return-Path: <linux-renesas-soc+bounces-21594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2095B49ECF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 03:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 815E64E3CB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 01:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467AB23ABBB;
	Tue,  9 Sep 2025 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M5HFY4H9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A757922FDEC;
	Tue,  9 Sep 2025 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382314; cv=fail; b=kZjSq2JRYSEvBb006p4gYIoaQblpmgw93yVfvnbFX09aDlKGV/9BRrf9ZKhNqRknI+HH7v4YPO0IMAb8P9V4ptlFtdNffl2AcuU7C/4o5fE712MxaNZtZCwPo/R+RRGbjJoDEIXk/3LXTTM7/eLxW404rUzCjCzHnscRLxY8xMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382314; c=relaxed/simple;
	bh=dQ9++bQcSY4FAtgJ9qO4leFzLNFdVCuc04ql3wmjffU=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NPbdrWZcAE/caEuQoNoNFZuwRu8t7P8uYUsJuYb8XXeJwaaCvTXoD2F/3TsjLxQ1Arht1jLllyJUDZyPBIgYDM9nDUxskhyhJfYp6g8OnZQWDcj/cx15tf49nZRH5ellU4Bq14iP+MgpSRkLqDFxnvEUGCSICNUV9mUME/gTpHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M5HFY4H9; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1tiAXfkJ5JsHUiGIph75/vDVzMfAW6qLW4i/mnr0z6TfS1YwtA0pBxzpPpewTM8hq8McNdvZ6uYaSkNBKlhOUvnTKSnIc6k8xerhQRZ3p46987CR484zdGduW+2DzlxshkkKy5iQ0mTmjSF864Gpsj89OamAwHGzzAIRLYbl2cS4ciPXiXxJCXrC2asBwPr9IIioNH7LA58AkaI6RaSDsXjyfiqR8R76uCdpdnZ3Ytt7DP4hkEgRnfulfmf0a2yXx0oZA7Kach8O7e5UwmL6ZX3XIxx1DQxM9fXLrHAtXT9lw1W3CYYsNAXCdI6TfpGhERBWuIwMBukUe1cSmp5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPJmk5FG8v7mC/CBRH2brCmzVDvqU75pKKLeajifGO0=;
 b=piQmQ8SQ0p21JbUAoggb7hmY2hjDEBob6AUfURkaHQ5TzaqUr+sPMF/3ayQBzpQGz2xx51hSEj+cYddotooIlTUnxHeFPuFq6MkT3ytZeeYLATzFObq9Psk6NmFnVYRtQHowoGj0oXRs6pHBROCQb1I0IW9Bb9Mo3+dBy5/Azq6BGDDJYot1iQZRWDYA0Zdq7QMBgkoxXC6YsJsd2uS9RU+1eCA2pqi6setwvJONnzqsRwosxo2r5kmgbE9hz4rcrLQmmPRhdmTJu7ok5XpjWBOuP2JUrtIQY2QcLbyhb+arETZoMz4DMlsMdhZ/soWoDNbEY3aG+dAiPlatU/qbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPJmk5FG8v7mC/CBRH2brCmzVDvqU75pKKLeajifGO0=;
 b=M5HFY4H9db9S87LOURcDedVkHyDbnn16tChwh3DUd8GLGhWvy7Pcr9utfbSEIXwNyizdXyJ7ye5+tF8MycazX+YpKgoL3ujZTKyjBuGADoWB30lUcS/wggyzDSyAHU0NQ5+rXcliO5r6yt9PhL2/co6j9bhGezpeKsXseQ4r9/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11404.jpnprd01.prod.outlook.com
 (2603:1096:604:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:45:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:45:09 +0000
Message-ID: <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 01:45:09 +0000
X-ClientProxiedBy: TYWP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: 008f75c5-212d-419f-8628-08ddef428279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sUNm4iV7rkFrX45o/sKDIdnxe/7OFMTi1A9a48BfwTChmsRj8Mt0Uu1D4g1B?=
 =?us-ascii?Q?6XPP6UqJg1sjAVJ7x1gf4pHK8IKFWYgnHoKp2m3g5qwRPUVg6thL3Yew3Pyx?=
 =?us-ascii?Q?VnQC9w5CRn9RzuY9BXcLQOvAb8grJo4brHlQgl5keaQGLJzrO5j7ZsmBaJTA?=
 =?us-ascii?Q?Jk7hqGGNWwPHEREirbbN5fZ349RBTbVZ2H/dxFu03Ga78DDVl4A8ZNokDwU5?=
 =?us-ascii?Q?M4GwV3YADTDOke8tpgI4+fQd12jD2eaGNpIun/0f4WoeYzOkiQ5Cy5rDUUqz?=
 =?us-ascii?Q?DwN7NNJfC+M7qh1HK+BiDhrlJEW6B9CJRYsMXwuAQHC6ShmoIPRn/JfDJdbK?=
 =?us-ascii?Q?ebWnNNRsiRp3PjBDQ2WoO9N1Yk5cRBAIKh9u5GtYv+jZTOWvuRMxrV128uuf?=
 =?us-ascii?Q?pK4R6GK9QagAK5tX8UuQYeHEev8u3oLG2bxKn81Ln7d0Pug640YJqL9hwYt1?=
 =?us-ascii?Q?Nr2Q8Oh4QUqRcaC4vNWJzceYxU/oExpj2PzTPxY7XHIIsQJp/+qNqSzux15b?=
 =?us-ascii?Q?jn9l3jErg3xWoPEwA+WI0gQnJAO1zcGCls99lNvBDMWMoh+2utjKcNY+OqvC?=
 =?us-ascii?Q?Gay4H2dTdskNu4MkMY6gcNdbezZBt2FYpMy/u9x0K0ZS4ble+jhIVhKAkq6z?=
 =?us-ascii?Q?ZeGqHme5hfV1BSvREDx+HPsU0FEFXa7SKp/m09SQecf8iNK4yALWfkq0uPHz?=
 =?us-ascii?Q?qlvB/1xMIH+7YZfe3/0P+dzDA1buA9ezZ+ZeqeQzBqhxMnwPPWsYMuML81kd?=
 =?us-ascii?Q?HRstJXkVkuTealhb7H7ZaE3R1wE1HvxpBk7vQ39ar7j9tcAWbtfSCfETj46V?=
 =?us-ascii?Q?t4U2YQ6lwZbVG9k16zZ5HNkmhbpEzVw3g+CalHxAnaiHXdXfO7OfFBL4v1pX?=
 =?us-ascii?Q?MqY4p6h1+zjx7j1OCvyz7qkoMir6/HCgvfGlkkLmg0h1Xku2T6kKcKo7U6Fl?=
 =?us-ascii?Q?ZSxhgVXhnBO8kL7DuwhZPP7X+K8h4TyZrdfPqhgOtraxsNum+gkVGbdH0VrW?=
 =?us-ascii?Q?4c00Nie6B/OMh9ADgaZ1kQRB30mCuL5MVYuEUuabTagWdWP7sc+K3yIiub2l?=
 =?us-ascii?Q?K2hZV34SHtAajNyh7dhpaxDM2FIBj6zz0Qw39uTJVxZLMobpwskqttqWDhWV?=
 =?us-ascii?Q?PB3j58zXHESHWvEx4y3qVy42JOt7q3GPU8SQlM6/jyfGbxqQMP+bwhTPPnxp?=
 =?us-ascii?Q?rJ/5lsmQkWMPsPnx2G4/cAY2dB1bJJewb5dadKXCGVN97LS8PvGtP75YzOnc?=
 =?us-ascii?Q?IByYvzYeRl+wdw/4Fw3buRIPWBe5ABSghASZFuScum4xB3eg5YdRRRtuINo8?=
 =?us-ascii?Q?THy13djWMGAm6zlJSAh3LB7YX5pZhdIVhvLm21G7ct1YFWewGJx6LJlusUJP?=
 =?us-ascii?Q?9ZiDkCorOzxbHiKNtxynZ57ELZsrjQYvwZ+JVb9vz0y0UWiwaebCtCKrP8IX?=
 =?us-ascii?Q?+KtFsYHUBSwn/qLJ+8s7mJU9YW2fNN6Pts/AMaOth9DJietMNKK2Cg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s/mwpAEeMe7nVEfder4X4+xwk7RcScT9smz/x1BcHYXCxH0FmrGZdbPMonxj?=
 =?us-ascii?Q?1M6XTAM0JdZqg1HQ1A67kFIwFCne6FtLVoxN/T3ef+91nAbDhIEUZ82ACPLr?=
 =?us-ascii?Q?D3oCIv+q5O1CyVHrEtHgCnvFQNNbdaClnyJsnfTBLnTBdlriAeV11kLlBGVa?=
 =?us-ascii?Q?Rj3gU5RBsgvdyMfoPphBoOlPBbb5g7NSknoR+JcrHW0Gs3B0++9omLtae1Qe?=
 =?us-ascii?Q?qSrqvdH1s0YRlRmdHFsfwFPIN/pGxjYQJGK3twnEQHkgtPnZvbjnRQFsC71J?=
 =?us-ascii?Q?32sPTlx26HVFtZVkT6a+0H6LOyyjoUgGqIn8UI7UwC4q2gCpHFDm6dOWdb8P?=
 =?us-ascii?Q?ZpWNeQ4aDQKkjz70Q2K02xYe6M6KeJpXEbs7suH7I0R/Bs4xsgGQAvS6DV8c?=
 =?us-ascii?Q?0fR2vC/cNL6wud7c3Sot+mQ0BLsLl/1aUSoXpSUbz14fDV1fTacS20Ja7fpk?=
 =?us-ascii?Q?3c46q37cqbDaconrcNK3JvAj4jJlVtqGvzmyM0wJ/JEpZ2cDJiB4/F3S1/Zn?=
 =?us-ascii?Q?bBuNI4Ba83XG0ueq2j5pg39a3h5FkU63p8FXENSePo0ZvTVmJRgt+iQ+Ut/G?=
 =?us-ascii?Q?VlAE0RUX7oliNPpJeN7A/0J5uO8FosD+2nqHqBg9nPI0vnvnB6GQoeFcWFXm?=
 =?us-ascii?Q?euytdXUm2BzB8sdGWvqTeJkqbvhZ9XSJOtVqkTayitCOqMwv59rWHOL91Zv9?=
 =?us-ascii?Q?+Vhwn+0B5Fyd7c5RaKUbzQyPYch8ufLvqbzHc6lAIhVUUTF5m//bc2ccxrO0?=
 =?us-ascii?Q?EUs7PJ0yoXVCz7xZgE2kTlEumtmlUm0sc6NxsN4N1zpToC/vo/zrbFARwVHc?=
 =?us-ascii?Q?KCcE8kiFmUaFAoJKNaKA543TsnK76p5XBaKeXKrSAncMWySAermB/XOXs4SA?=
 =?us-ascii?Q?b9lOhZrtgQ22ujYiRCUwzKqUD6IGj+VU5fkdFnR3YTUEWfL742+DIQC4j9jx?=
 =?us-ascii?Q?scPqI9mssH4y+aoyWGfmbdK9B1Bu8M4nCSSsufFGpk8wfVIrYHbSQIPplU4J?=
 =?us-ascii?Q?Uel7s281e9q45BE2PIuGUOEIQov0lFM1NQFHRP/IOzb4NkFkNw9E867m73Rc?=
 =?us-ascii?Q?R6+NPd7cF1LUbIOUkIMjmZgCnixp9DNxg/V2QB9HGMoWbVnUqB/MT780eEcH?=
 =?us-ascii?Q?vdJar5HfToXQ4YrInZc+aBt+3lBq9fFEKP6srslfv/RE9KKfvYFwFLCDfOJj?=
 =?us-ascii?Q?sebifScnIwiEAqzN2Y+J9+axxVKCJgO2j0DMJ9ldP1xr9aT7N0pF6f0Op0Gq?=
 =?us-ascii?Q?MjvIauhyG6JyT8+tDmBf7mBAtYoJQN48dPdQWIEf75Ymr99BXIEtrnqWzq36?=
 =?us-ascii?Q?2so5hEhrGco4Xju48Eij3SRR/oGmXv1D5jKhsePqc0zthGsIPknFLoZYLf+i?=
 =?us-ascii?Q?Qy04FTLSEwkN7tG6JX11rTNTir8YRjCMZ0Y3o+CjHVfhhLShaLASNKUYLWCv?=
 =?us-ascii?Q?BbqJUIFj2pTVqs0qSTABGwFqCY3QWPP0w8oD23y55BHrZDACvGr9Y3QVbMrg?=
 =?us-ascii?Q?+NwU4V7ohY1jYeWRajZfFeBXDWoZJ2aaN3oQOmHQjt5jabGOk0kpzpe6Jytz?=
 =?us-ascii?Q?Lb01v3dP246p+hPISJ4HA4bHYB1xd+ZSHos3B5jm4mUNSZ32NLj8VZvmDQHl?=
 =?us-ascii?Q?FrWHRRYclyR4Ar1QjEU9tec=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008f75c5-212d-419f-8628-08ddef428279
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:45:09.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNRjQ/Hpmbzo5aIcP9YGspu2hS6a9LzuyMxrBZomYMPN/K9daNSBH8LXciBGGLzzFFcNPLJ4pxSnVIELLXZHx2xga3yKTxbhx3PttH92WG+5vkPJPVLp/nl8FKmoyiUi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11404

From: Hai Pham <hai.pham.ud@renesas.com>

Add initial DT support for R8A78000 (R-Car X5H) SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Minh Le <minh.le.aj@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 936 ++++++++++++++++++++++
 1 file changed, 936 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 000000000000..c81b3ce75222
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,936 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car X5H (R8A78000) SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r8a78000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a720_0>;
+				};
+				core1 {
+					cpu = <&a720_1>;
+				};
+				core2 {
+					cpu = <&a720_2>;
+				};
+				core3 {
+					cpu = <&a720_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a720_4>;
+				};
+				core1 {
+					cpu = <&a720_5>;
+				};
+				core2 {
+					cpu = <&a720_6>;
+				};
+				core3 {
+					cpu = <&a720_7>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&a720_8>;
+				};
+				core1 {
+					cpu = <&a720_9>;
+				};
+				core2 {
+					cpu = <&a720_10>;
+				};
+				core3 {
+					cpu = <&a720_11>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&a720_12>;
+				};
+				core1 {
+					cpu = <&a720_13>;
+				};
+				core2 {
+					cpu = <&a720_14>;
+				};
+				core3 {
+					cpu = <&a720_15>;
+				};
+			};
+
+			cluster4 {
+				core0 {
+					cpu = <&a720_16>;
+				};
+				core1 {
+					cpu = <&a720_17>;
+				};
+				core2 {
+					cpu = <&a720_18>;
+				};
+				core3 {
+					cpu = <&a720_19>;
+				};
+			};
+
+			cluster5 {
+				core0 {
+					cpu = <&a720_20>;
+				};
+				core1 {
+					cpu = <&a720_21>;
+				};
+				core2 {
+					cpu = <&a720_22>;
+				};
+				core3 {
+					cpu = <&a720_23>;
+				};
+			};
+
+			cluster6 {
+				core0 {
+					cpu = <&a720_24>;
+				};
+				core1 {
+					cpu = <&a720_25>;
+				};
+				core2 {
+					cpu = <&a720_26>;
+				};
+				core3 {
+					cpu = <&a720_27>;
+				};
+			};
+
+			cluster7 {
+				core0 {
+					cpu = <&a720_28>;
+				};
+				core1 {
+					cpu = <&a720_29>;
+				};
+				core2 {
+					cpu = <&a720_30>;
+				};
+				core3 {
+					cpu = <&a720_31>;
+				};
+			};
+		};
+
+		a720_0: cpu@0 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_0>;
+			enable-method = "psci";
+
+			L1_CA720_0: l1-cache-controller-0 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_0>;
+			};
+
+			L2_CA720_0: l2-cache-controller-0 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_1: cpu@100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_1>;
+			enable-method = "psci";
+
+			L1_CA720_1: l1-cache-controller-1 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_1>;
+			};
+
+			L2_CA720_1: l2-cache-controller-1 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_2: cpu@200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_2>;
+			enable-method = "psci";
+
+			L1_CA720_2: l1-cache-controller-2 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_2>;
+			};
+
+			L2_CA720_2: l2-cache-controller-2 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_3: cpu@300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_3>;
+			enable-method = "psci";
+
+			L1_CA720_3: l1-cache-controller-3 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_3>;
+			};
+
+			L2_CA720_3: l2-cache-controller-3 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_4: cpu@10000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_4>;
+			enable-method = "psci";
+
+			L1_CA720_4: l1-cache-controller-4 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_4>;
+			};
+
+			L2_CA720_4: l2-cache-controller-4 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_5: cpu@10100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_5>;
+			enable-method = "psci";
+
+			L1_CA720_5: l1-cache-controller-5 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_5>;
+			};
+
+			L2_CA720_5: l2-cache-controller-5 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_6: cpu@10200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_6>;
+			enable-method = "psci";
+
+			L1_CA720_6: l1-cache-controller-6 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_6>;
+			};
+
+			L2_CA720_6: l2-cache-controller-6 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_7: cpu@10300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_7>;
+			enable-method = "psci";
+
+			L1_CA720_7: l1-cache-controller-7 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_7>;
+			};
+
+			L2_CA720_7: l2-cache-controller-7 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_8: cpu@20000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_8>;
+			enable-method = "psci";
+
+			L1_CA720_8: l1-cache-controller-8 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_8>;
+			};
+
+			L2_CA720_8: l2-cache-controller-8 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_9: cpu@20100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_9>;
+			enable-method = "psci";
+
+			L1_CA720_9: l1-cache-controller-9 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_9>;
+			};
+
+			L2_CA720_9: l2-cache-controller-9 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_10: cpu@20200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_10>;
+			enable-method = "psci";
+
+			L1_CA720_10: l1-cache-controller-10 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_10>;
+			};
+
+			L2_CA720_10: l2-cache-controller-10 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_11: cpu@20300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_11>;
+			enable-method = "psci";
+
+			L1_CA720_11: l1-cache-controller-11 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_11>;
+			};
+
+			L2_CA720_11: l2-cache-controller-11 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_12: cpu@30000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_12>;
+			enable-method = "psci";
+
+			L1_CA720_12: l1-cache-controller-12 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_12>;
+			};
+
+			L2_CA720_12: l2-cache-controller-12 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_13: cpu@30100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_13>;
+			enable-method = "psci";
+
+			L1_CA720_13: l1-cache-controller-13 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_13>;
+			};
+
+			L2_CA720_13: l2-cache-controller-13 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_14: cpu@30200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_14>;
+			enable-method = "psci";
+
+			L1_CA720_14: l1-cache-controller-14 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_14>;
+			};
+
+			L2_CA720_14: l2-cache-controller-14 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_15: cpu@30300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_15>;
+			enable-method = "psci";
+
+			L1_CA720_15: l1-cache-controller-15 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_15>;
+			};
+
+			L2_CA720_15: l2-cache-controller-15 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_16: cpu@40000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_16>;
+			enable-method = "psci";
+
+			L1_CA720_16: l1-cache-controller-16 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_16>;
+			};
+
+			L2_CA720_16: l2-cache-controller-16 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_17: cpu@40100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_17>;
+			enable-method = "psci";
+
+			L1_CA720_17: l1-cache-controller-17 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_17>;
+			};
+
+			L2_CA720_17: l2-cache-controller-17 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_18: cpu@40200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_18>;
+			enable-method = "psci";
+
+			L1_CA720_18: l1-cache-controller-18 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_18>;
+			};
+
+			L2_CA720_18: l2-cache-controller-18 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_19: cpu@40300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_19>;
+			enable-method = "psci";
+
+			L1_CA720_19: l1-cache-controller-19 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_19>;
+			};
+
+			L2_CA720_19: l2-cache-controller-19 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_20: cpu@50000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_20>;
+			enable-method = "psci";
+
+			L1_CA720_20: l1-cache-controller-20 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_20>;
+			};
+
+			L2_CA720_20: l2-cache-controller-20 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_21: cpu@50100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_21>;
+			enable-method = "psci";
+
+			L1_CA720_21: l1-cache-controller-21 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_21>;
+			};
+
+			L2_CA720_21: l2-cache-controller-21 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_22: cpu@50200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_22>;
+			enable-method = "psci";
+
+			L1_CA720_22: l1-cache-controller-22 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_22>;
+			};
+
+			L2_CA720_22: l2-cache-controller-22 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_23: cpu@50300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_23>;
+			enable-method = "psci";
+
+			L1_CA720_23: l1-cache-controller-23 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_23>;
+			};
+
+			L2_CA720_23: l2-cache-controller-23 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_24: cpu@60000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_24>;
+			enable-method = "psci";
+
+			L1_CA720_24: l1-cache-controller-24 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_24>;
+			};
+
+			L2_CA720_24: l2-cache-controller-24 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_25: cpu@60100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_25>;
+			enable-method = "psci";
+
+			L1_CA720_25: l1-cache-controller-25 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_25>;
+			};
+
+			L2_CA720_25: l2-cache-controller-25 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_26: cpu@60200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_26>;
+			enable-method = "psci";
+
+			L1_CA720_26: l1-cache-controller-26 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_26>;
+			};
+
+			L2_CA720_26: l2-cache-controller-26 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_27: cpu@60300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_27>;
+			enable-method = "psci";
+
+			L1_CA720_27: l1-cache-controller-27 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_27>;
+			};
+
+			L2_CA720_27: l2-cache-controller-27 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_28: cpu@70000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_28>;
+			enable-method = "psci";
+
+			L1_CA720_28: l1-cache-controller-28 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_28>;
+			};
+
+			L2_CA720_28: l2-cache-controller-28 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_29: cpu@70100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_29>;
+			enable-method = "psci";
+
+			L1_CA720_29: l1-cache-controller-29 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_29>;
+			};
+
+			L2_CA720_29: l2-cache-controller-29 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_30: cpu@70200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_30>;
+			enable-method = "psci";
+
+			L1_CA720_30: l1-cache-controller-30 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_30>;
+			};
+
+			L2_CA720_30: l2-cache-controller-30 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_31: cpu@70300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_31>;
+			enable-method = "psci";
+
+			L1_CA720_31: l1-cache-controller-31 {
+				compatible = "cache";
+				next-level-cache = <&L2_CA720_31>;
+			};
+
+			L2_CA720_31: l2-cache-controller-31 {
+				compatible = "cache";
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		L3_CA720_0: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_1: cache-controller-1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_2: cache-controller-2 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_3: cache-controller-3 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_4: cache-controller-4 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_5: cache-controller-5 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_6: cache-controller-6 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_7: cache-controller-7 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	extalr_clk: extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	/* In the early phase, there is no clock control support,
+	 * so assume that the clocks are enabled by default.
+	 * Therefore, dummy clocks are used.
+	 */
+	dummy_clk_sgasyncd4: dummy_clk_sgasyncd4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266660000>;
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		prr: chipid@189e0044 {
+			compatible = "renesas,prr";
+			reg = <0 0x189e0044 0 4>;
+		};
+
+		/* The Arm GIC-700AE - View 1 */
+		gic: interrupt-controller@39000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x40000>;
+			#redistributor-regions = <32>;
+			reg = <0x0 0x39000000 0x0 0x20000>, // GICD
+			      <0x0 0x39080000 0x0 0x40000>, // GICR Core0
+			      <0x0 0x390C0000 0x0 0x40000>, // GICR Core1
+			      <0x0 0x39100000 0x0 0x40000>, // GICR Core2
+			      <0x0 0x39140000 0x0 0x40000>, // GICR Core3
+			      <0x0 0x39180000 0x0 0x40000>, // GICR Core4
+			      <0x0 0x391C0000 0x0 0x40000>, // GICR Core5
+			      <0x0 0x39200000 0x0 0x40000>, // GICR Core6
+			      <0x0 0x39240000 0x0 0x40000>, // GICR Core7
+			      <0x0 0x39280000 0x0 0x40000>, // GICR Core8
+			      <0x0 0x392C0000 0x0 0x40000>, // GICR Core9
+			      <0x0 0x39300000 0x0 0x40000>, // GICR Core10
+			      <0x0 0x39340000 0x0 0x40000>, // GICR Core11
+			      <0x0 0x39380000 0x0 0x40000>, // GICR Core12
+			      <0x0 0x393C0000 0x0 0x40000>, // GICR Core13
+			      <0x0 0x39400000 0x0 0x40000>, // GICR Core14
+			      <0x0 0x39440000 0x0 0x40000>, // GICR Core15
+			      <0x0 0x39480000 0x0 0x40000>, // GICR Core16
+			      <0x0 0x394C0000 0x0 0x40000>, // GICR Core17
+			      <0x0 0x39500000 0x0 0x40000>, // GICR Core18
+			      <0x0 0x39540000 0x0 0x40000>, // GICR Core19
+			      <0x0 0x39580000 0x0 0x40000>, // GICR Core20
+			      <0x0 0x395C0000 0x0 0x40000>, // GICR Core21
+			      <0x0 0x39600000 0x0 0x40000>, // GICR Core22
+			      <0x0 0x39640000 0x0 0x40000>, // GICR Core23
+			      <0x0 0x39680000 0x0 0x40000>, // GICR Core24
+			      <0x0 0x396C0000 0x0 0x40000>, // GICR Core25
+			      <0x0 0x39700000 0x0 0x40000>, // GICR Core26
+			      <0x0 0x39740000 0x0 0x40000>, // GICR Core27
+			      <0x0 0x39780000 0x0 0x40000>, // GICR Core28
+			      <0x0 0x397C0000 0x0 0x40000>, // GICR Core29
+			      <0x0 0x39800000 0x0 0x40000>, // GICR Core30
+			      <0x0 0x39840000 0x0 0x40000>; // GICR Core31
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scif0: serial@c0700000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0700000 0 0x40>;
+			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif1: serial@c0704000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0704000 0 0x40>;
+			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif3: serial@c0708000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0708000 0 0x40>;
+			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif4: serial@c070c000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc070c000 0 0x40>;
+			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif0: serial@c0710000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0710000 0 0x60>;
+			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif1: serial@c0714000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0714000 0 0x60>;
+			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif2: serial@c0718000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0718000 0 0x60>;
+			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif3: serial@c071c000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc071c000 0 0x60>;
+			interrupts = <GIC_SPI 4081 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
+				  "hyp-virt";
+	};
+};
-- 
2.43.0


