Return-Path: <linux-renesas-soc+bounces-24725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A5C69F21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D82D62B238
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC3935A954;
	Tue, 18 Nov 2025 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p92iC19n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14408355020;
	Tue, 18 Nov 2025 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476046; cv=fail; b=DsRlF4MKRk7g0CCV8SEvcWku8Yhzffyf0rYQoNU+BouTHr5GnYazmNkzwuNnBsZBTLjwvxoJIcSIytFm/T3AmmzaYn7bsoaJIgKtmJNWxWgISwjwUXOdfNRbHXXZXr+4MHyBux+CLLIgit38z02/237n43Ccq7P4pcdLdEULyIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476046; c=relaxed/simple;
	bh=UejF2tiRw7Aal8doKxur2vukfvnnBgmzGjJ144SRL7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=STTOuW4HMOL4i9Z9zsvEnmjDdW8+gxGQ1qTqcyEGTKbKPlIXXx92HFJ3tiAf+n1hTMZGzDyHwiOmGSB1OoCg9xidja/hhOBKf5ekF03pCdEbKC6nGl6ZdmpEwg9ANenGqsulbxDXb99EPBpMlEFz/PNUVHwIxSEGlZe5hl208wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p92iC19n; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFFUlpQtjEBc79jhDUozNaYNzfARm2r0t7I7lBL90cvk0/jV51rO9Il7m8NDzZXx8j3lqq4xZNdMzNjFFmq+CtkKMzuScCFt4LQJj2MJrXDvszGbKVEnAGg5j+UG23YZYKunKG/MuI/BpFzwK6OBUObPwjA2K7LwyrS7+QOlRbjDafzghmZj/835mL/hY0wScuS+q9sv2h1f311A00n+zC1hl4wi9W7WRMb4DjDLf+kz3ceEBViGqOklfqWfD0wft4S0ucdjFpGJEngRcLudZpSbYDzXvdKx/SAfpVtDLfxF8FNc0sZkVtTTYJeyQaA/xacjwoO2mFjCON29rzhuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUL1+bANTtigra+xKk3HXUO35NCCfFUh0mYuAFKkL0k=;
 b=pdmuN0P4Ri/9BMSnf+EzHCB91T0coAfnqCJHaw/N2Kx1qc/I8KOdY+UQTanD8H74ItZLzeSvZWdYLSmH/y6kFEgb+T6ybyu8eTGJG9WSmL01TiNIicCuYpL3AUsMwKCzCYexJ3KBfr5KG2p4T4v6o+XrQhRMpyVoOzbOjKm4Kvb1UFVtlBLdV4/YGvoeABVT30m7JbWipwLzHtLFMdrBu1gvGJ+A6KHfdqhECZZw1/4AQfL+y00AQpcj9/JNJnVyKW3CD3ZtD01+XEIBeaL9yQaujiEj1NaOWrUA7NwUjRuTA4CPN14y22erJj52GU6vsHwOk2/FIP0HA8pAV0j8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUL1+bANTtigra+xKk3HXUO35NCCfFUh0mYuAFKkL0k=;
 b=p92iC19nIlR0vjCZ8dexOPOlJiGV7oAx3oZESldTonf1uo4pDlI2SDUl4qaFf2QWxULe630d127dCEa82yLBAEARlUu8EScdP4vxeCOV0jbLgkV2vACPzNGZsmTPJhPE7SOWnbg2NP2b00sFM4iUPHa+5CuurApGEw/uMmD4vbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13363.jpnprd01.prod.outlook.com (2603:1096:604:331::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:27:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 14:27:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I3C support
Date: Tue, 18 Nov 2025 15:26:38 +0100
Message-ID: <96c503737c4e913dd3a934fdbbb4545e44455a68.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13363:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f08f7d-8a08-404c-808e-08de26ae95f3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cf+A5Wv5T1HAB1BDuYm5hLA9dIJgCIdFlxHJaWhwpl8+gnS2IVj/ktbh3DNa?=
 =?us-ascii?Q?Dzt9AEMoGPwbNNTlz3/P4HK5VLI1bpdL2oJE3J9Su+giohNY3sZ2UfAV+p6c?=
 =?us-ascii?Q?pSU44ZxWIIzGlOaCHkV2uscO4EWZci+7F/5znnaeHb/xPgh1RkY2o9wKUOhw?=
 =?us-ascii?Q?NGM+EId9s8I+LKc7hHkEbEuttbmKUJPsl+Ex+ozbeRm90sXBf4xmtPz2v8Sc?=
 =?us-ascii?Q?KaEiISLqXiSi4V5tl5EVD1Z0F0s/p2gGpjUgJ6rPFPTJpKH2nTaLNfobNOJq?=
 =?us-ascii?Q?Pe99KLkbqF5EJj+cI4nh2TcP8koNusE1fXXhTjRyRPlWDxMH65zqHJk4gLGL?=
 =?us-ascii?Q?mG0kjHeCZnv7B/y43ppllhVbMQmXwBn7wxuGK+m0m66TkXAACEaZ8yqD6hzv?=
 =?us-ascii?Q?HyAZywmam/NX9fLmgqaRHg6+R+4v/jxuNMBzded8rTOvrX5nTpk1aTYY+B9k?=
 =?us-ascii?Q?c8Ntm5yxoIZOS9X/+imep9pb61C2RI1gsXARxSrnpGarAKYPs42idw3qwIOu?=
 =?us-ascii?Q?RkG/y6OU6kVo4BvriaNUmNKFyNc/t5UfLvmL2AKTaYPsGE0IXQtwI0zgBmd0?=
 =?us-ascii?Q?mpSgAlLLOJYoFSGI4nju3OjnBr+0fndtch92DHRO1EidZuOm74cdLq7wmWcX?=
 =?us-ascii?Q?HYTmsvhxxranoYvAg06kAHI7aogGxiX84qe6ajSddWoojyZSu0Y5NpfYI9oF?=
 =?us-ascii?Q?NxlFpgQI1vVc9xiT5o1mOfhb6O/RbR+9lqOHGYINhIXeTsnaFrA/UHVyqUFO?=
 =?us-ascii?Q?YbDMMd+XYQt4JWHgZwDVE73f2lQze9r+GC6AFAglHrbuc88+qZr1Be8isXKb?=
 =?us-ascii?Q?fxl5IieXqihmm8C/yznMZjIVfqxmKmK4Zlu+/oC++ptk8pk3YUuj76jbN9S7?=
 =?us-ascii?Q?ni1t3NH7K96Lt6p/2Ii+zwEYpfebabxgQXz+E9FeMSf/NtKSVZUk3+PKhB+f?=
 =?us-ascii?Q?01sLwKp8VhIkVCalcsuhLnKxxiUD+NZS3YIDjwcnRhBzPmLULVecDUNwClR1?=
 =?us-ascii?Q?Uhg8nl3/wVTPSdLwXm9UHCGNTZM+cf2rzrbsT6XD1YxKv25zUcWn+7d+pkBs?=
 =?us-ascii?Q?+ff2uJE0y7QxxwPcQX2docJUsrsg2Chaj3eNOkkjq56Y91X3H5W2VsRZCdUP?=
 =?us-ascii?Q?i4s1Am+ZuASbEKpHfcnTH0WQ/2/L28ahx0sPV2X966gQ1s5As12jZvfBgfmi?=
 =?us-ascii?Q?pBxyq2OHqxU55Gb3Shjasp+klJegavgnTI7kTYo1bBqOgtXwTunygTK/gt0o?=
 =?us-ascii?Q?g+s3R2mbFh5fhL4KqFRycd0aVdOrmCGHwcMziAwKEhF3FeXK5NM0cuCqruos?=
 =?us-ascii?Q?i+IeuPogU2IjVv3IFseusFNWsCp55xByniapUfFpv951qwsL5cey/x/Owgfo?=
 =?us-ascii?Q?5msAyu/2+C2WQcBTbjGaB95lCzaxubkE1ZLM9VJjKPsd0s6i1OOg9e1gxgxo?=
 =?us-ascii?Q?66CZesH2ZJkhje+ZfL/WGaO/tJ4j+EvP/1FCH+Bxfr9aCNDG+GU1IGRMpFE/?=
 =?us-ascii?Q?eTER5FJCfGrbWWFanA+EhYkJ54RbukzlrD3f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n1VRuxYIt9HkLjPKzUirC813qfY8PRqzt4wV3zW3+tKBlZHLcEg/5589vEUV?=
 =?us-ascii?Q?1913TAHqcFLaYpwhapiJNAqPgtwjzjgubx01I7WvjEKm2nrfMhCiQlVEC3Vw?=
 =?us-ascii?Q?Dy9ZOBAhgRneaMrOyCB420kxTQNXInIgXycpP6avxU/DmovjBt6IlyOZx1HS?=
 =?us-ascii?Q?dYPSzMSG0OUn5NBddESl7AtWudTI2ts8HJZJHPnhnOh6DFI03B8rk1z34Myi?=
 =?us-ascii?Q?Lspk8JPivddGsrO0kB7DClpC9UzmJhmUdKp71nq1GaFlY4YWTtFx4WVoPWwO?=
 =?us-ascii?Q?2p6UzxrGv5v7wOtHxsPioIQ9GggOeG8eVMoe9ydm+pFHdPqUn8/xPx9RS2Nv?=
 =?us-ascii?Q?pLUBVFFcu6am0mGue8Kc39+iVOIm0va/mibYmg0wO+cPM2O8karl8DmOHPXw?=
 =?us-ascii?Q?JOgiwc1FHal7WQeuAnd3TFFVseAI4laxJL5ucRcrc5mASmsh4RhxsfceRanP?=
 =?us-ascii?Q?M60nsyAx2XTaR3cteYuDaVhe/aVcg7WrVVWIfk0fZtvHlywxVh3nrDBi5LLz?=
 =?us-ascii?Q?BmgoI8Ba+spjXczHUqnMFpKuWSA0fsvGdQNsEI7QmYcx/zyAcucprv7Kbb8q?=
 =?us-ascii?Q?N8Y0u1gkpG8S2hYiZzTUVjyXqALi5g3fJTbS+Ol9HR8UrVlvV1Ib546kpruS?=
 =?us-ascii?Q?Xy1j66w8/rZ0VvzXfLmibq9HNiLVkutC0EzY6MfYi8o0OfDFC/MfFGpLrKeM?=
 =?us-ascii?Q?VKiX6U9bG7tzSaTKpn+BUxjkj2EpqOSXKavORWHTjpjjemQUulbIPeAAa2N0?=
 =?us-ascii?Q?y64gSDWJE0/236VouHgyqjndtXYcW2g3ldh0OiUJ21HzcLxv1ffZ63VhWO6k?=
 =?us-ascii?Q?1jeuVhTV7BAPyhEjqB1oIApyTgkBI+TkbM4oc7JjLr9rO8yUcBy5HPfqKU1g?=
 =?us-ascii?Q?2ah6LkNs7ZnU1noPrNbX0NdVdWEVvBqdYGgm7GECQFAioQGfx2hsk43j8KAW?=
 =?us-ascii?Q?no0MStMxTx/PG3Ves/bFf0sE9TBTAvJNs6lbWA1mra0yfH/bScGAYgycAzaY?=
 =?us-ascii?Q?e6bUSc6UJqw8Ml0drBa0U2kOsZuMpqIX7rCK/3RRzTokViKx5Ya+uAIVSPPD?=
 =?us-ascii?Q?zEIClXD/jiBS5Tx7QuPhtOLpE3N6/gHutTveeGQzJmgq8QsgpSj7Yks/dOUL?=
 =?us-ascii?Q?gWVlcoAWM2H6BdCSt2hjU2eHMG3ZKHQsqLQ8YW5q5WZvG1iPsaGDFnePqYXt?=
 =?us-ascii?Q?OXrBdiMMhQF8a2+EWkhStglwDNJprsNwyAC+XENOxnlzlB8apI3kjDuNW9cY?=
 =?us-ascii?Q?X4NrRmqUCetZna6q9ThaxkP/cLxeN55ynrBNtycVYshhzWkWTKkrUMsKQ9Pp?=
 =?us-ascii?Q?fCIo5XsOSOhABCUfRzBBSEZ1w60gMPVnVzWQJxaxjnbqhE3xh3OrVgLRQd/H?=
 =?us-ascii?Q?OtjeyywfkTsOyzt93oJebNl4u+3kuzyinjdVlK62B0I5No4oLm29LRY79Tf6?=
 =?us-ascii?Q?w/gmWkEsnZVB6SUTQVqvRjbHEg6IDHc82ZYLcN+n3SISG9iRlPhfY2o9eoiG?=
 =?us-ascii?Q?D/adaPMebInGBcAgddygd8OZJ3mW781Aqbh3TJ5SrdLnfaBDQT0omsLUf7Pe?=
 =?us-ascii?Q?L3eDlEkV+qBbPvlgIACIOvJYBl86TAmwI/ZL2srMSRYUFowZo9GnenKP22P/?=
 =?us-ascii?Q?YWz/g0vnlw2LbnjtCBj9CO4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f08f7d-8a08-404c-808e-08de26ae95f3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:27:21.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LY4D7LpaO1dl0rRPxlRKHRhgYd9xM4dPudAYQJATnDiKXT1QiAv6Wv/qLeW/Xk56H/sgDd3tpcQs0Cebf4PPhqSHhH1XWd1PzTJOkKsK/ySST72qtPCBsaGzSsdjvfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13363

Add I3C support and an I3C bus alias to the rzg3e-smarc-som.dtsi.
This enables support for I3C devices on the R9A09G047E57 SMARC SoM
and prepares for future expansion.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..dce5cf3bd841 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -29,6 +29,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c9 = &i3c;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -122,6 +123,12 @@ raa215300: pmic@12 {
 	};
 };
 
+&i3c {
+	pinctrl-0 = <&i3c_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
@@ -219,6 +226,12 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i3c_pins: i3c {
+		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
+			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
+		drive-push-pull;
+	};
+
 	rtc_irq_pin: rtc-irq {
 		pins = "PS1";
 		bias-pull-up;
-- 
2.43.0


