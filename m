Return-Path: <linux-renesas-soc+bounces-22296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C518B9835A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D22E4C2B27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32B23C01;
	Wed, 24 Sep 2025 04:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iGzypC1v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41628F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688327; cv=fail; b=ZJp99wCAF7YAElu1jKRWEBZ2LoV9HpKPAetHRzRR/2sZmb6jz9kRosoy2TDP8MhLVFgvSpH9BpYJgtmJJ1kodse2SmoznfC9iZ56J2YELRfhHwjmH7syqjRnecmRT6LXZByagLSO+owMP55f5J5ee2Ps394jD6MZ2rxCBqx1y9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688327; c=relaxed/simple;
	bh=y1sc4lpwdDXM9jYnk7R7n2GeQ8VMsfp1La6oYoOK9uk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LIdmu5oM1J7EewISYHA6clOYAr3ZdcXkARAGfKrPG+o883s65+ghPvD5/GEwbvfKJJhHmrIxReIcRFt2iIaakVhwi/KxIZ/hL4CxWQihVmCtk62zey/BVxccw/WBqNFDnvESe3+6s3sPIDegorq/3MqyPLAFfW41nURc7rnoy5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iGzypC1v; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6DfBd24L6v5tNVopqgJoRqW5BlsqbyCmip31lXPIRHHemMZ39CFHC3LgWNqNwlnW9fFkr4gilIkNzQ5M7IwPGk0+HsNBNZVOkr2efyrF32S3cCbQuIJiPr6TnX49boZ8dxIsehnJsxzwNeNKDULloq4IbMi6rlgaXUtA++P1FC5M5cnqmPfNGWkc9U6Yi8m4uKx8Roye2AMCtQbRmPtFaKU8V3EeUwkeOHsbEfLHrfAl6nuXTh49/KOg4q1SddxQZtLrEw6tcGRn0pUSxdFjPbFi7JXl7YV7dHGpmAxU/AuT5cQr+MpS7URtNqTjNmIW2UtHYgjqLL3wiiKK4CNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jqtDP7s6ftoIpbYy1Wis/yRg4zivbz8oWHAtP1w1EA=;
 b=bEGdtp2Cqb61PkVrf67oq+BRJpIzKtYIXIhxE+G0oOV0JeLWcjV3k+DVim5sQ9f/NrNbWMaAEOf94EqrwIkMeT14VmzaSNPg3CRuVtzxuKTZYEgbCyMiT/J/rpeDONnsuuUQ6g8iio+a8/DvenQHjeAxASHS/68TOfWI2HILkutHBNLU1FyiXzFx/r3p3iPIT9VhOXmOUoUitT+5b0DcqViT0FESZ6uqp1ukLm8He/UNZLQYpoJA6OiLcAszEgpiCKQumFzbZjgWusm7KhL89TBSw2SJc6x4qeyd0VKwK+TaVzmx4wTiZ+KN7dNjsqF+Bq4IxBvrCmvXM5wcif10bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jqtDP7s6ftoIpbYy1Wis/yRg4zivbz8oWHAtP1w1EA=;
 b=iGzypC1vBT40A4hG1XDoWXxU78g6ut5pZC08NMaJAgHjw2c4ttPuBzFOQM6vnpAfB9nD+9u0d36t4KlZqWXoqe0rLMIPkdt/39Wcxkg4dO6crc7dZorEVWANEsE53Sk0p5zcx6AuEyNnZMDA5HzbbpxWkx1BbWcDsKdTjL9u6TU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:04 +0000
Message-ID: <87ldm48o8s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/26] arm64: dts: renesas: r9a07g054: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:03 +0000
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 1707a5f9-cd12-4246-1289-08ddfb234fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jSQzEajzi1zRt5qk5fvb3iL0bibjgOmSwv8TKaU96SWliGa0AfItNhX1QJkb?=
 =?us-ascii?Q?2skw2fLAUY1cH7bwp78aGxsNFq7wrgXskgbXWKR3bLZVyCMtWUfFgZmRivFC?=
 =?us-ascii?Q?Qo7OnDZQGJ/8S5rnBRVR/6ddthiVcNRIwUWt6aGz/1vO9kcbo7ohRVbsAzMO?=
 =?us-ascii?Q?TBC6Tg200FZFqyzPLe1it57Cbe/24I6uspZ6otHJiOwpfn6RpOPxfDjKzW9c?=
 =?us-ascii?Q?1oy20SV3z8cKOckHcC4U+a6nAGHVy2xNSGSKv4FmEotjUxj96HK3mzA13xuO?=
 =?us-ascii?Q?AX88gJXVIXqxAEGWajICJDwo+gWOEwOxXJMcw8muG0s95MpOR9nfTbchai5L?=
 =?us-ascii?Q?WIOoKHQ53GaemI6CnVL0Yz5oT+L4Yb2+Iw3Vhrt58TXo5SHwefUI9v2xGP5F?=
 =?us-ascii?Q?/CV2qMgNLXYlkPb/LR7p23Lm1/DaAmfNpqC8G9MgdXVaCorwRcDoawOHrPwI?=
 =?us-ascii?Q?PSimQ+/aZLwTQwqDXuklDdRKTZVeDIykWNDDXhC6Kz3uAtA5Pu4VoVdRYxXm?=
 =?us-ascii?Q?piJ7pO5pR+9LUZeF6tYapS6ohh7bNCBHVW+I4792F7qKwJwtAciEZnms6+bq?=
 =?us-ascii?Q?TP238Dhnk/FmNysoJR0s1UUzLcD0/qK+rRty5l7ZZBqFQwr7TOI4c7+CYXg3?=
 =?us-ascii?Q?seYehcjH0hmYhld9WaI+3CM749k1fxXwRw5yVBib1w22zBxoeyavYh8KBDHt?=
 =?us-ascii?Q?eyfg5wDCMxG8OajU53mfCLascvT4AEehc2aYI/hJlmhxIVTo0QUbCnIilkws?=
 =?us-ascii?Q?tY+OrIrKN0j+p7e/sHc1mQdTZs0D1NNrUQBgdAWvzkhgzDO2c0ubEc24fs44?=
 =?us-ascii?Q?i38+t+U1iRXnYiEMhS3lTZTCRm+lDYpi264hOP6iuKTdI2fTuJ2dVfSWgMNL?=
 =?us-ascii?Q?v3reqJlKnttbDyz4E4M3xq//koTieYPXxrcD201cz1fhsCZeAULxYf7cVCkG?=
 =?us-ascii?Q?X9edtVZ/V/30XL7DIwaWVaOeiBCB9y5pellOGKrhQL3BR/knE0pLPWhgpfLk?=
 =?us-ascii?Q?nxXF3KMDGJgUhGG8L53L3h6VYlcvgb0ZSoqgBM1vFJEXto+0OCx7wMbrUixj?=
 =?us-ascii?Q?TnEd0xXIgmj8R38XgGOzA1Xs4zzQmtNPhExjLqfzd6BFuqqniVuiYYYf/jim?=
 =?us-ascii?Q?BjVGdZnRR08nZvJKJl2uKqMgMiynDEHtUjYAT5KwTgrb45c2wKZwtsvWvnFM?=
 =?us-ascii?Q?714GyIUYjSuzNbC9/Qit854aeTV31AWtvX6/tCQVMuBSAO+FvnEJ/1b/clQD?=
 =?us-ascii?Q?ynNFykzjerjrP3RfXYiO6JxO9vfH3d3hfaZLDuYD2wNQ8Enb8/15Th84mUeu?=
 =?us-ascii?Q?XreGGHY51lETgypfH/vll8bNd2xphQJOpgNiHzvahwbm20BhPCquLRLJ7t/Z?=
 =?us-ascii?Q?JHdyERcoVFW7jorfNi6my0BMkI8wJHsklNB+DrnPifh6dMJcamF/nTwSJ8Ny?=
 =?us-ascii?Q?6rQ6O8YTqutnMLkmU5hYtJi+lNktY1Kwqyq2OwuqHHP+vi3jbQYThLDfqUjj?=
 =?us-ascii?Q?yy5aYz3llhT46Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w+/elCYmVOjnt1eG1FSusg9A9DuaNSvaBUk+dqsChnsdaqVdueVTGwOrxdRS?=
 =?us-ascii?Q?OtpKiNwz1iyoQNSlRKKrV/ksQvKegTI8H3Yfy98cSygvXxSdBoTUxV3SqfuI?=
 =?us-ascii?Q?4b8q4KuyI7fFQHvnQ6Q33UNI01JCKEPJJhK6YPJzo0G2Q7rNurJDQoiL8dC1?=
 =?us-ascii?Q?VJ63oNzj/Z6ETgZYtWdV76enLPo81abA7K1Z4cF/zRnaVCKSkAozZUK1I258?=
 =?us-ascii?Q?XGJarjRyPlpXkvoLLcB1axqc+BpdukENqAUiF8u/G6jaTT5C7dbFIVkQGAgS?=
 =?us-ascii?Q?ULVsvyJFf6DjokTncjdeX3x+E2swh4rEMbumdgdusislNTbFFh4yzHIvcMfy?=
 =?us-ascii?Q?qtPz+kQlzrFMyCGINnbxRU4jaHH22G0wIm49WYvlTW96Slrha3jxbRItmXPJ?=
 =?us-ascii?Q?GmNFFrH8UjNLFlzPcrbCM0a3GOcpSg+SlNH47qYCm2i11VM1s/syxGjdj+XP?=
 =?us-ascii?Q?PBgV8x5XPiamAK/b39bcI5c2V8cKPkKYwfv56DVc3CjtRxqVouJPP1tPjCLA?=
 =?us-ascii?Q?ecxEo/gZZk4CGU4zrzlRto0Fk0CN6PnoqltftMEc+i/4NGVeW716VnHQmimB?=
 =?us-ascii?Q?O8QNJmqc8KYzttsjHKbXJvU3b04SfW4iUmgCQYToxIxZOICgbt7vBZAzsVK+?=
 =?us-ascii?Q?C/+oTxsnnSedRLV54pA26eKcIl9UxN3d7gLhziiuplwtpmaDqkSJyCMAD4zC?=
 =?us-ascii?Q?MQcxm0HBD1YB1AZ9tsC+t3655FBltKWV6BuFrlhk5a2avM3IkMZOXjm1eUmv?=
 =?us-ascii?Q?pmeFE6DMMGaA+iC5iIwe/D2s77yz7F3oZSwGOmpm0PBpbzFh4nwNMAb3Awm8?=
 =?us-ascii?Q?uXZ3tBG66z3OS1YPEJ9RmeeLes+dj3+fgEhqnIeqIkX/C9D0vbxl8z2E1U6b?=
 =?us-ascii?Q?62raQ0g4Ms+jeC4nDbHZLUysFVJG6ou776vJu1za8K/UoUsTDfoaoO7In2Rt?=
 =?us-ascii?Q?HdbmKRmD1GYseMqGP/y+xGxZD1dHmXmUgA2owi/LUlJF/K6kYTKAgO+mgKsV?=
 =?us-ascii?Q?WkL+3m3E/iA7oFMhcJrNXkYN0Yu5FoD4mYNbY/BAtDml+pieMlwgYGesnp3L?=
 =?us-ascii?Q?oGKevsm0pFfLfxE3Bl7XSuyPmStcJHbhOU+GCNs/aw02PwFpy0tO9hV0VXmk?=
 =?us-ascii?Q?5hiKXLVAGQAoF/Nd5422prUt27Oz/NTQcDerE8ITWNTAgQIEEPddrZp9fmBd?=
 =?us-ascii?Q?Dls1aV5+rMBxADv34G5JKQkw1s4ob3PPiuWeYPMsPJfXfb0wbRYBt1zAIKi4?=
 =?us-ascii?Q?zWz+JEq5yCiyUGws2p0LmBTMB7VvC+JRv2GRYvrI9rN5iG7Hc8hOzSXfL4FO?=
 =?us-ascii?Q?Y3K2WD/CCck6ZO4MKsc5jIv0ErzYrQGkTX8RiMT4i3wWjWjlyGXNoXxkcsCv?=
 =?us-ascii?Q?SzCltkaOevPK4S1L6GmHnH5Ba1suVK8xSDm1MUwyn9vmjibQmygcBfk8CDgz?=
 =?us-ascii?Q?afet20L8iqULRv2du1NewqcmBGM4Tl9yMLJbdkBgaLoYQYIzAav2cK3NYk4E?=
 =?us-ascii?Q?4WjjMHuGxHeJ6GS+E1UbzMPDqihJLpzItq1uq5+2qoP0cN5gtYaiwD1hZWQR?=
 =?us-ascii?Q?UOwl+9twk0saKLavQirwdx55XdFLU47vl5AfhR+yaFrAHMcgcojXsPrKm9mD?=
 =?us-ascii?Q?sLPSF0aUXVpRRlKtnLr96W4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1707a5f9-cd12-4246-1289-08ddfb234fdd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:04.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SnNVuNIcOnaAEfXbAe92HPoqmWRvl9MGh6jVMekHP7Ra+r8ShuosTGKkv/lzJlieb3NJHxDeCLu+xIU/Z/3T4iqoqTIYBweBZcoo202IxIj7gb3QltLdv3a3vJeh/nD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 669eca74da0a..4e0256d3201d 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a07g054";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	audio_clk1: audio1-clk {
 		compatible = "fixed-clock";
@@ -159,7 +160,7 @@ opp-50000000 {
 
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -169,7 +170,6 @@ psci {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -1458,11 +1458,11 @@ target: trip-point {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
-- 
2.43.0


