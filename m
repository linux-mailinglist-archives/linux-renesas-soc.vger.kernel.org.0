Return-Path: <linux-renesas-soc+bounces-2739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5C8541B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 04:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AD4F28D824
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 03:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A778BFA;
	Wed, 14 Feb 2024 03:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BxE9dRf2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2049.outbound.protection.outlook.com [40.107.114.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0C2F2E;
	Wed, 14 Feb 2024 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707880341; cv=fail; b=JWAFEDuBEo0w7Uw9aNIr23STdQpi/Pqz5T5sf56HBOzckWWPeVOjGIuUp1fukZ3Z1bYoWOeW+pO9F+DyL1RH14AJI425zp12+FWccW4no4GjYX5SIXnMjMVQ1/ICi2AMVZbnSrqkDDpqs9zW/kyK8YGDpYNPt0PgpEAN4KJjXAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707880341; c=relaxed/simple;
	bh=z0qwMXbV/4seEnzgjORBG5XFh0z1s6Y56NakHwpKUqw=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=LdGm/foEtaiQ6ZMyL3BNO4ShxxWOzoNNhXmkj8zyyogi0g5PTBHk8nG7vwsvp7omgCJw5ooMF8aO63ccPjBVmA0CzQfs0ZXRfSYlY/1JPaDlFuEH5MbCoLaR/Q7UcrWDj4/Z5XAvl8jHqqzHBzAc+MgEUiACZBT3XSap14auk+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BxE9dRf2; arc=fail smtp.client-ip=40.107.114.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2L23T4oZ7FFL6zU7vbDtBIhPTBCMugTZITmOpBZpTxGQKNK9ubAW+ekNpGMbqD9NwK9MuXZ4S9dlFxVLXqMO+rcbDIQL9QiwEXTJYhTybHBln/wfGwbukckJXcY5fH90ljP0Mq97Xdvx/kQr8PCcWpd+Xe9AQrrv3AQeK4YdKLyp+q+PlCHLJjoBpG8RLuZmVbXloWJwHHYIwEtjk/G+gQl89sW+KwIxtfPrL/WRE8XrAN+kFmYOYBd5MsgHdWOqW80ecBi1L+yP1rykFDg1lVd0nJUJFCZcQsysDXnM0C5E8E+nDC9ocouvjWcnNCDTCznz2QWqd9TkmlBUYTcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWz1g6VYNOLt1WZbbqQmjJ9ou6TmJxOG4ifpV+ZXWkw=;
 b=W2mIZKqqyOD8XTQ8lCAsaL3s43HxJabnUXo45ZLX+Rj/gE15OUdpJDEwt/nLTQUM9ysHwghL9clJ5wNStubn7OzogteqvKcVPD2FSqUlqxNmdWK4X2QWvmFPVPjqiL8gEfS3K14kzI8O/ngojHPVpXNx0Pj70mE/dSEdHno8KJtbUezr363lNKBOr6dCaMTrptSsR3W+fShELC9DCzzKNrsX1x2179oXcPf64NBpGPGXbXyV7U5NoYKwQuY01/13lbxn61bX9gaVVcrNkwUe1dinCxm4LyHA8zz7yZeKcVa+syS1cW0Lw3kUJH07394zQg4SR99byHehHnmd7cGqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWz1g6VYNOLt1WZbbqQmjJ9ou6TmJxOG4ifpV+ZXWkw=;
 b=BxE9dRf25wZ2CKwTEYEaVpS4ImTQr5bZ8d1vDJU8rJw6fun2tiK8X6+JahATOxYlM9FECAbpQ2E/ELby+CFkuOa1I02cXCNVitZ3PbaUZxMma2deinZJrPfsI36lu97duq1h2gTRHljWtBCggQUjg8WMjrrhlhlgOq58REcnh8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10835.jpnprd01.prod.outlook.com
 (2603:1096:400:327::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 03:12:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 03:12:15 +0000
Message-ID: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Feb 2024 03:12:14 +0000
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10835:EE_
X-MS-Office365-Filtering-Correlation-Id: ae368b12-1354-40fb-40f7-08dc2d0abe89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDc+fIWP2tjUD4xHRPbMpHPRTyOg/qHW/dfOoJ9hXwCTe0NtZUlpsQ4bc7XQVdfqENr2FB0EgT6Gu9bDdg1xxVZWSpjlMGIqSo2opfh2KoFQmt8/DYXB2VDG6IC4dzPPcGWRY7KNFoR5WMXfBMIObzcs7VKExRdSsvgyFqjEoXNwZx11ggFbJdUFr22kT3Z5E8EdU7QD0fSTHwpYIP7hk8aCv6EJC/9O74CxLdnM3DY9fXc+1q6j/lxrRc6WpHkFm+1bf3O0jt85Um43lz1pE47k2VRufYQkLqfa4T70Qdn4hUtnPtpZOYEqmpj7m03iEn/8JC4hiRtFPXIDu0H9wj9xzl5ju2wJx46CIjgg/1EXejUrNch/hCs7pEHIvTMPO+R9Lqy4qYpARWQ+duobghUzF0MFwV9jLh5sFCvnypYqi7yNpc0HAtO3/AEBku91bq2ylQXqb+Tk8abX4DLmVG+Asq6h6ZaeFkLqxqhZRASQN08GBj0ezDTiR2XCN23PXUru9UJhF1yikTFtcIS6Ff+vaOPsI352JqXVtEseyayV/+lMTaZwGBGbpbMpFcxVGm7P897cLH8MwRvQNVC+46zU3mmrHyaJU5IweF7vpFTpAA50sPlGVoNxM+ZSgAU8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(5660300002)(4744005)(66946007)(66476007)(66556008)(8676002)(8936002)(2906002)(83380400001)(26005)(36756003)(38100700002)(86362001)(38350700005)(110136005)(316002)(2616005)(478600001)(6506007)(6486002)(6512007)(52116002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RtpmH5Luo7w5tZlHbPipOHBx3HHx07RBpeTn6ILs//m+q3ngnsxU2n/wopl2?=
 =?us-ascii?Q?oNuknJVslJWxlnaim3fMeKnr3yuwOKWfVWsHVbzhkYKaCwOjBRs95s4STuRH?=
 =?us-ascii?Q?mqSoSIv5RlPoXRaQ/j/quLAl5fPan4QZICXMjrCFqfR5r7e7YiM63w95PE/f?=
 =?us-ascii?Q?pL6KQxZEd2a8CLaGHaCy8JOp9hQ7GcdWFHPtrGZL5fSFvlpHv3jDOUJ1eU34?=
 =?us-ascii?Q?8d1hZNj/BpwQ8/ZSdrJWCZFsimpCOQkQxMWUozfAmR2jN8LF1EQIuXyY2Xlj?=
 =?us-ascii?Q?fzu4qbE+qQiOOT2KU6YnAHCGPm0x/JmYt+m64z7FPyZVa+U3fAa65yoRAyAr?=
 =?us-ascii?Q?TJEwDkfvAy3+ckKe+4mzbQxOM12I5C/r+R3+egb+idFJxOp5ra3NoYt/XCuN?=
 =?us-ascii?Q?+pdpv/D52gIo658BTFIGx702dUuwqamrPhOgF82pr0g1w5vcJ0fX21X5S5kZ?=
 =?us-ascii?Q?k83PEXBX5wW26n2DP6A0AOoCdD1pYbdLSSnHaGsZCkOwGJ79ODHITZ5sQrpS?=
 =?us-ascii?Q?HCaizALSz0GG8nPIpnWA/bMjt3kUJX9wqVS7w1q0BHe8RXB9znh8nt2mXWOi?=
 =?us-ascii?Q?HRrsIR+r4vCt9JuPz2XLo9A1y3RAA4OwuXZc0eID69a5zC/ojjQQ7JzePfLS?=
 =?us-ascii?Q?aigkMGzxvQ8bbBUqWhqDZRT+ILKmPyhhUlVsMMSQsYgG2gajWSCQ/9fgpemo?=
 =?us-ascii?Q?hjrY0RvHFq+xg3s1QoiwldFastRLayhMcbU0XfWaDeoV/Kma93d2+l4lwKZd?=
 =?us-ascii?Q?sKFsGY87KPDPjqh8yPJ5Pa6UAowlfc3n/K7XMA4pVF9NjrJrXZHYf7m4MFs2?=
 =?us-ascii?Q?ZxZMUdzBFHsy0A7F+7PJxJdjkIhles1MLFu9DSL1vslQR6Qnp47wPkh/0Z95?=
 =?us-ascii?Q?dLtH83Agk36Ho2YOV6GfYm7dnd6Pk5pkyKf7mVymNd8tKltQHPnOv9wFajRs?=
 =?us-ascii?Q?QW9kH9jHt+iEeMGfa2PM0O4glsdWj+5qoIKqOXipVVTimJ0UAyGKmkO+0n7b?=
 =?us-ascii?Q?RpFHlYo8p/mAAPjrQ/nNrCXW7lA0j5O7rgPbvqJJZHfV0eAKRF+kaWxoFEY+?=
 =?us-ascii?Q?ARIm/rJnG27AWV0TfKrRyjKWdbsbfELwjK4OH2Q+BEHIoyRjkmjKdGxs0Etu?=
 =?us-ascii?Q?KIrrn9/H6b++qGKxVQvmwKGi6qnruyM8JkhlhWu2FO4INw4dtAk3CG8qqsrk?=
 =?us-ascii?Q?reKzJKkgEReBADGSjFnjXXFrrNvLjqvT672T2Ft/mfL2NSCyXE14VKLSaTne?=
 =?us-ascii?Q?To0yiv7gVNae70uC+lqQjdQb3d9g5Oowk7HaMWDw7kODyo2MnlvuE4DiZSLM?=
 =?us-ascii?Q?NOe3Y5RJqBLGERVxRzu5OdQKwmqOgcMehyz7WPjn+HdLboXLznXPlTmCQdgf?=
 =?us-ascii?Q?aJ4q2m+EFC484cVOLJMpggf2Ct251rexQdySFkSZnjkjAkxjooJxMGKv3I31?=
 =?us-ascii?Q?shlC6a9XD+eY4Oo0x7XVdZypKORV/hgrWhkG3ro4J8pEV+iLOomYvRLxZrdR?=
 =?us-ascii?Q?lJEz4JCN/YUep+UtE5t8PLoeH5u+ylcnVPxFQV1wbrl1YN5sUpEcweRBMojM?=
 =?us-ascii?Q?KNPqanrb5kVhpkTu8ZHwEjuC4TCPozZJESOtxDuEccJvp4duSE8M7MbN5xRj?=
 =?us-ascii?Q?LrwbO/IfdsRGgdLDaMPOHqw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae368b12-1354-40fb-40f7-08dc2d0abe89
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 03:12:15.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIHgpugh22qCTMR59fZ8m60dbo5vQjjifTT0DAP06s97+SIWPEC04qbIA3hUFQtOdi8tuGipp7SRarTFnblo6NSGn74k9SpEs41EEAx8F2A4sL6ZnyBFj+8qCws8ONO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10835

Sound Driver requires "reg-name" to get register info. Current driver
try to get register info via "reg" instead of "reg-name" as backup plan,
but this support will be removed soon.
Use "reg-names" for r8a7778 sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/boot/dts/renesas/r8a7778.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index 8d4530ed2fc6..027a1c9ecc4e 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -250,6 +250,8 @@ rcar_sound: sound@ffd90000 {
 		reg =	<0xffd90000 0x1000>,	/* SRU */
 			<0xffd91000 0x240>,	/* SSI */
 			<0xfffe0000 0x24>;	/* ADG */
+		reg-names = "sru", "ssi", "adg";
+
 		clocks = <&mstp3_clks R8A7778_CLK_SSI8>,
 			<&mstp3_clks R8A7778_CLK_SSI7>,
 			<&mstp3_clks R8A7778_CLK_SSI6>,
-- 
2.25.1


