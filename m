Return-Path: <linux-renesas-soc+bounces-22288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D7B98341
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE01A2E5C80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55A73C01;
	Wed, 24 Sep 2025 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JrDxey1t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32FC28F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688269; cv=fail; b=DUmizaXT6I9bhLbwDFWi0e5NZEMth9O0ZkcUysEWoifKZJfkREF4CFx7qEadFeT7no4FQvByfhyWqXUonbMSO2Ccq5PvwrI9at24LRTAeYayR48wOwND/qqckd4pzLaZjtUolultL8DiHeRNOzxpbw7SDBHqPeZC0Gg8teSIo8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688269; c=relaxed/simple;
	bh=y4sG/LAJpgERbZYjLFGm42kLHmGBFOcR/hHSp4vH6ro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QxfEzyspTrrDFH6gnjtzUahq7k8qb9VDIrgoYX8ybpN5SgI2vm6aMl86ToTW83ZTyGIDyCME9fYZ7etBC5LP8dKm72FpMuF/nDoXG6hYnh5rYhFl47hlIg79QZQOJa5yauk8azkdnGFP4HitFiZa+i+AYMzTJ9uSCgg2ECcblOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JrDxey1t; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M42HaXqlVkGsIRn+4wnOep1Zrx06aXu5c3qCRJ/0RojLnVByUWD+/P/+VWtk+7ICbrCpKfS2sWVsfKKZoxi0NVs8AdyaVKgYaLsGtm2mMyhNUzPiB0is9Uu9d+F87QO52ttmP9AMrVBLslKlxD+pICFjSWH55V6IIjRr89QONx1OL/MyObI0StSNcn3QIJExjcvxbWVh6owIijpPAICEwMWxGQXMrHaiKskp+8A79k5FOurPOXoNrshtnm4J0VgVtK7c3CYWoanv1tMhfBRpzM7Rub9Gk2oH0SG63QiAQHHqtWE/gHebZH8uu+zUkWxrI13RYzjiEFJK7zjA1+ErTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wLuhdcHuCQE6jYrMPjDPQOMthceerumKlHRQdTKhL8=;
 b=sOiM6NT+dq3f73+PIeSUUql8R6oUhPR0POLr5NzCjYb+9KY558FgtZQ7xFtFZsRK12p49qBqIgtSr18daqW4nEtJPNvBdrTwzjFq+26m63+iPBrS88C+YQ9NQ2IbmDrGOKA08un6X/asCEVu9m74KrikIDE5EhW7eNWyor3D8EuWau5Oewsts43+1cgonP4WGQVDBpe5jCmQSbK9FSoDhzP1F7yS8kBQCqQBAVY8eU7CgaXLLfdrHJKQyMsvOBzwYUvPdUD4UC/8VRaubxKsJ8tQx7/GPRfiZ9xE0KMUBGeZ4wFbfI2XYHDDY5J8c7TX4mdZZk8lPxt8hJ353hJL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wLuhdcHuCQE6jYrMPjDPQOMthceerumKlHRQdTKhL8=;
 b=JrDxey1tmnpmNj60+ZXBNpe3raw3LOPevVz6iX6RAvcFv+dkreIY477m4YGyI6gvfpfcVzAC8TStvVph4zcyfdW0pc7EWBQPblD5Nhf5dCCkiIk5ux86H9J0QClgdrKAzBLzSe0NEfgxk1sJM7TWgO8yxqpqyh1W926vrY+sK70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:06 +0000
Message-ID: <87wm5o8oae.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/26] arm64: dts: renesas: r8a77990: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:05 +0000
X-ClientProxiedBy: TYWPR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: f30f13d4-626a-4307-41ed-08ddfb232d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5OdhyR+h61jGNqstqDzHfF2hlpUj83ZQFWjwYLzwXLkpMskUDx/bG0K+7eVm?=
 =?us-ascii?Q?B8vLMokbG6MvQXvt6ns4pgaQksl/YStKzAkQaQUBViE970o4o0vVPZx4wtgr?=
 =?us-ascii?Q?F+iDFNhzEFTg9OJ/SgWtZEzDhK3x3a0VqslOYIHaK90aLpic9sGPsd0E0w2w?=
 =?us-ascii?Q?l7o47JNPeEuRAnPjCsPgWOKEayuvvNJ9I9WstNJBt63HwC1tU9r08zX5y4Yf?=
 =?us-ascii?Q?5A5yFuBJYr29S/21/CmVJniKUkmLF9XOge75UrmJhEY1EtayJApsXsVfjU+O?=
 =?us-ascii?Q?neaHXJg+699jSiMX47gTRTM1ZAnYceBce92nLK/NxItvV2chJdVgjvd7d7Ha?=
 =?us-ascii?Q?PH/JplnIA5oRcdQXWWC8jyXaghnEeNHUs7n0dL84azjVlZRUxF6aj4wfJnP0?=
 =?us-ascii?Q?C80EZ94BlrgvzOLRDDQ9i2GpjNM2m/fjieRKXLG7n5r/OO+6nhKAqrs1I9HS?=
 =?us-ascii?Q?RhljBgc9UmzSPaWsswOeGJYbQabXyA2G+fOwgID43VeZHvwmDgoxaLsewONI?=
 =?us-ascii?Q?Ak9x6/j/rbXj218WyrMZ7VKR/MqYQOit/FExUqG/RrYI9cwGAWjwFssIFvO+?=
 =?us-ascii?Q?jAXJL2FlrJNuuu+pnWMeuXbyIziyyZ4wNrJmB6uuMuqxVPydTgVuD6f6Nq2Y?=
 =?us-ascii?Q?2slQj7+ByIevzxk+iTAOjwbsf5Vq/tQVALfC67JO5T2GVw/uObY6cu4rykpD?=
 =?us-ascii?Q?w14Fa+PIR/hUTq4nqUztaji9YaTEuwCT4kCbZixyCNReKLSXwpUnw3AIvRTk?=
 =?us-ascii?Q?ZRkuHDwl1XHkzQKvJhL88Haw3GQd98tUvqh8O9Y5ISuxOXJyeYXgXgNUv2RG?=
 =?us-ascii?Q?z2DsErS1u5Yyw3QlCqDdpmKUqVje4MC+p5LxnCE6FJQWw/teyuQZrJUGZWL3?=
 =?us-ascii?Q?zY7MJw8Lohm+ibQ5L7aGNyZLvTY96+C7fxzeEiqBqH2XpRCsEAhj1MFqZNto?=
 =?us-ascii?Q?3xJK/nhPork3tieu9Xv3gQKqjPY5D5enQ7ckdUIkaRFJpPfwJhLPl/0oddy2?=
 =?us-ascii?Q?vt3Oqc++oe/GxvwBunnVfirXvvHCptubBGW/Ee4/B+LzIVxeBLkkDvagc+F5?=
 =?us-ascii?Q?jQkmaeUNLggbML/G332LBv/+i7o1uih+a/mJJ+O9HoVySDDUZ5ljPC9NHmR6?=
 =?us-ascii?Q?b2C56cOn6543Ikee/K2EB1/UWAJaVWKEh337WhD7K7h2WJTYEZx0TwFb2NaT?=
 =?us-ascii?Q?6nC89ykCXkjPjRIZnQIFUrsgrj2fwvrqW1OaqLmmes4XJxmk0liixBkbtTNf?=
 =?us-ascii?Q?l26PA7F0Jd295LOmWY2QcJKNdQu84OoPirplgR/NseRM8QCfkmXtH0QoRl2U?=
 =?us-ascii?Q?sXKOTHW8jZ0Bp04Rhq/BUYMaxJKeyChqWur5fwicqUSEe/eOfsQT2ZVokyV1?=
 =?us-ascii?Q?Zrf79/6e1/4LMolWtPE4U0J02kKkUfxR4t5Y7xuwClehzThowDB0GVa1WVJm?=
 =?us-ascii?Q?pR+DsM0Z8Md2pqJbzteIkXOeMYwgMAcruNW4YvnZiSN/WSyguPc4WkySo0pT?=
 =?us-ascii?Q?1tL+0+v1fKrIXpQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KeId/4eFBVCVTsNysoqb06vzLkaO7/+mA6iUVY3KrRtaY8qLYHuzgAKTBRID?=
 =?us-ascii?Q?5ybIYd2zQCoJYR4LGh8/KD/MfKaEdgqrNuhOryJGXfW1IeYpWq8fzF+OyXLG?=
 =?us-ascii?Q?fSvAYGbO3lRzPZ/K7eTKDp2Lka1BeE5Z6HIcAiY+zTyK0XgRqmaY2uocKJoS?=
 =?us-ascii?Q?ve/CJgGqZ6axgOUS/xgZlGXdlkWXUsNhSY/bZWA7tFmRzMXqg+BoN6uTjnBf?=
 =?us-ascii?Q?O4iN3tzWnjbUv+LwglvGF2Tt3JyqDX2gJbJhtpoJvxe8KbFTn4kLA4Jo06IB?=
 =?us-ascii?Q?8cYMNT0LrhOK1HjwoetGqRfkDdyJ25yjoJYi3UoszQ76LcWLYGlmKtmeQEhR?=
 =?us-ascii?Q?uqIMWeD58kCxxjt7zHxanirxcVEunQPFoSYw0gATMaICqRkFCjM2WlqwhPB1?=
 =?us-ascii?Q?5MDKM9+BwPm/YTczcpS9+3fFbRb2zLNSaR2JqUaHFZSaNuPzNjv3ZkTciz3s?=
 =?us-ascii?Q?VniWM95aZEySbrc87KNFvLVKHtstbylWUQkSaI0DZxgIPdHp6IzlugQIplHe?=
 =?us-ascii?Q?Pc4pJV0D/feymlpunOCEp6z4SEn9WskO8iJgNcymI3O81ja79b8chk/3aEt5?=
 =?us-ascii?Q?O5Dw3UD08fE5OVnALYTrVoRHPF/nESvEvdfSfz8gC3q55i2PQohuh8oXiGVH?=
 =?us-ascii?Q?PMn6O5autJQ23x926+8K3IkHWdhAiEu9OC9A796XINn/cfkwX0m7b6+Cigxv?=
 =?us-ascii?Q?dYZ6cE7xfuRj4EJjdDXiLAiNoRiQ9H3Iy2DWzvqGb1r5oyZdpCU2ACOgCR09?=
 =?us-ascii?Q?nArc1ojsjKvD4XcZFkeeoFHvO44pdGZDNk/Zq9E6Ywv/+KIu7Ix9HRDZzsvI?=
 =?us-ascii?Q?HtwQiPCZpWavPSzP6g6gSHmqSU+nqjPC//61emekaal0aiLVfJxPU3/KPfZu?=
 =?us-ascii?Q?oE9IyjXZNwwdrcBcTLpmYzJKu/GipAdKxGNTBKKfWwCNKxfdXTkTWSNQQk3Y?=
 =?us-ascii?Q?dc3R9iffsbBVGhuSZpbhJmTvo+AfXLEABVj1Kekg/SHH1glpR76hpizqUUks?=
 =?us-ascii?Q?iiI0uXvrsx4joplBQB+sZrAq2XG3ybfXnktwL4E1VFmNi3/8yPtkqMn7I6JT?=
 =?us-ascii?Q?TGnaZbIOnKu7kE/29I/pPD7l75NJKOuxIbet+9sWiRRju0Aq/KrC1wM5BXox?=
 =?us-ascii?Q?9tv46j/5z8lwdML7n5e8JjMafsLddKmTaPPAScARr5X2n0dE/6eFgoxx3HZ4?=
 =?us-ascii?Q?/dEUr4Q02Z8r81b/PrL+sNU+IhwVrM48mysCb57aDUDUtNYR8ylpmRDgT+k5?=
 =?us-ascii?Q?eAyBbp3P1YnDNBaEA9vWptJ6exTfULmgnYHsbWtM1l7q0ZDDce1sqXH4kAMr?=
 =?us-ascii?Q?g3gu5i8l0Q9R8Pnuy0pw3VCqH2+/Wc/YLIdvvZSfz3RVIfFrNqqMeaYn4Z5w?=
 =?us-ascii?Q?lJweAtsyES5VphIHRW4aw+VAalK8yHNwVC0oq7KJdi4CEXqa/4OEtMlHDbBR?=
 =?us-ascii?Q?bdhlzH7JhMnrszeUtKc/OCl+tH2SwrdDCYy2RKt16+DNrg81SlgCgdJNxFaI?=
 =?us-ascii?Q?qDHmcb+ZYzXB8hDcLFzaggVAq4SEg2Ft/wxZfE8MTE4P15NC2TQZduM3AIaG?=
 =?us-ascii?Q?BNSekZfOXK3mQEWd9noIcU6KZWfIZE9OGuz1awYc5wR2j8xv6JSU9FP9n1oN?=
 =?us-ascii?Q?0c8bBhITLGuy3BLKjjllLw0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30f13d4-626a-4307-41ed-08ddfb232d56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:06.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n72Bsw7qKA6QR0u5Gy2EL3/2ueos8g54SDCnSEzIEz/KNKE5gtOmPASKnIqUGHyO/o9ddvCu2k0+O9PtHEaa7kDQarE3ChpkSAnWNZd+Nka6oSsWc4s+UjWUfv9TgO8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index e16ede6eb379..f6dd2e3d09fe 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a77990";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -134,8 +135,8 @@ pcie_bus_clk: pcie_bus {
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a53_0>, <&a53_1>;
 	};
 
@@ -153,7 +154,6 @@ scif_clk: scif {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2164,10 +2164,10 @@ target: trip-point1 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 };
-- 
2.43.0


