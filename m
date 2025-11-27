Return-Path: <linux-renesas-soc+bounces-25250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA009C8E212
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 086FF34D8F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EF632E74A;
	Thu, 27 Nov 2025 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PiiLhxmb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8A32E751;
	Thu, 27 Nov 2025 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244259; cv=fail; b=m3pQVyfnnfaA/rqxE/4sVyoTmR07711VbWLk+l3e7gxsoPcADjjO81+1LG2ukO6DPxaDnjZDvOA2oWRFSIY2L1bD5P97xRnlMlu77FXetDh2ORkg96f9HYUmGU9IKx220KVhr1tVJ+NFC6E5MepQoua+tt4Vod/PcMZJ1fY6Uk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244259; c=relaxed/simple;
	bh=lBwNmp8rO8JBLGh7ZAuMyNuSpKbFD721WBFsxC0dvH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EoUns5AsP9LGtDXdM5u3Ka9lLK1M+vvXnk1moA0aw/4adDVdcaLXkjK32sRXwCXEekqy+Siq/t5xiLxdHgZo8J5GBcPvlQhAwW3nH9bXKZpHa4AivNLgSOslCfVLg4qqr4oTKG6uwTG9QvN8ea4cx5AtbW5kS5Q5bc1u/QbMVRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PiiLhxmb; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbVYPpolr0PFnS1IAZvGnluT1pJj2dZBCvGoMI7X2e4OCNseOmQy5WhTjLBfoawQiKY61iDfJw65izoVSVOq1cZGNyQlZlDvj4G1hqRcdGdgZqSocYUG1WtYsvkh6hTuPHUmIGObLuAYgTYjFP9LIHIO9LGGINO5OHWv2xyeHQiskAFQbhB+c5hyxJuXnFwKEMGmeug+ldOaTsR8UBL1KcVMicQEOe9zkDoLPB2kSfKg63bY6TsES05zUePPnAc4Qu/Fr1RdrpJnAtQSoNO7QI5+bqL4romXgKiwlmUgmo165vTyymdzcFUFuMANsoVlq3F49oZcbl4tg9JJdD9lPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEpydommRK+LTo1iNURwFYsOzd7HUEXWiQAuUr9ERl0=;
 b=hp8A0vKHNomv/ark406h5NJ2QOfaMUbFPL0m3nk3uOZ9SZMe3e2f7N3pYHm39ZQdba+oj1ox3iLjVf9Acf2CNYRV10mqjagzNkuyMNzF3uMBVvu/JZpM4PlGcl74dRmfCxvDeCOoBWLz+oCEPLLt5dA7qFNrP2fWq5czI5qN+1ZdWJJsSLRxIAIDg7RpjQ7uP8hTZHgV7pklZrn/eLRc2tjvltDYxzE/h7nPkvNvFMUQW++fzwJNbS9WBBmgqeqRKMd8Tl6qX0Id/2SSE6eaBVbPDlflIxWzHv2PmGEVe+MgdY3ozsz41pdKq8NyGBvu+qANMrHswW4Onppj0bl7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEpydommRK+LTo1iNURwFYsOzd7HUEXWiQAuUr9ERl0=;
 b=PiiLhxmbwLbc6wueHM+YhS/+4NVXOhcQtA4MQN1gzv4buIQPcHHagXQGRDkbZ1ECQIw63i0rgxp+cafNR3NR0Bu6erKdSvohWTd6FczywMOIDENtTxYSXJNq1Ptwhb7l6X1wEp9z3Rzl87TtVPhiEyb8EQSVzjQAj8yesTq6Gug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:54 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:54 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 10/22] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Thu, 27 Nov 2025 12:48:37 +0100
Message-ID: <4618b939734fcfe1f153e725ac178844b44d9a3f.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 840ed551-580e-42d2-477c-08de2dab3885
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAlBWNPwWCpaGDVIGXIki3ZiYLACVQmTo/kP2rFn8/kWn4rqmyoQysg9CkOz?=
 =?us-ascii?Q?FlpkEdBvEqqhFfW8h27djQkPAKlfIAAyvJuhVM8smSWgqq+JWtkLt27RNo7/?=
 =?us-ascii?Q?rFit15KOQLhPnnzMS07x811asmqnj8syKS/70Cf9NT8oXEw4pc7BBVUH6E7q?=
 =?us-ascii?Q?IZ7FVbSaVC66ipRkDsObj7ZEv+Ail8SVI5YALML1ZHWjbXcm2tvlhF75nGB7?=
 =?us-ascii?Q?ias/7Bx1Rjx9OAJ3X6buGCdoZ27Y8zwJCHXbvmrkIb7fxooWeieyAVbY2tWq?=
 =?us-ascii?Q?lL6VdH2AFT7dFeHgV2FhKeMmVWS4uyomkr5J1+Ob6V91JJYDRU0+CvFDEnjV?=
 =?us-ascii?Q?2d0oRU8oATlOPOBH98QKk+xDmTSIsk3RsvJDJFP2rD8tBPN+7m/Voc9lZaPL?=
 =?us-ascii?Q?8p/IX5RuhlFCDfHMP/rpdOznZIyjqqiqgFyTVfCbUIy2k9wrtuwgOl9qrsUl?=
 =?us-ascii?Q?fujIOocXdPU80FKU+m6BEVBA2Wq/RRqa/bzl8qOsayvH3wgHXOccRHR9EBgY?=
 =?us-ascii?Q?NjzZW5qMdItPu5hZF8k+aJiu1ZkIeARV6Gs5kvLEA8QfXJ++Lmq5626lNpof?=
 =?us-ascii?Q?zj0iN6vIXM8a48FM4vALOKvhv6P2Y+MrKYbgJhYg8a9vgy98ICZUlOPTpuc7?=
 =?us-ascii?Q?X4Ft40vwOskXhKMG7hh1NtHyxjVoKzRHPhS0AplssdBruRY3f9aAm5tAJcCa?=
 =?us-ascii?Q?lhouP/ByE+RiZoMfsyki/Tzw+KPzkhMoi7NJ8m1p8RlaSq4wzByXWG9Ug/eW?=
 =?us-ascii?Q?6LVM//ZdhGL9GctRcdSz7ckzpyOWZdsuA+caGarO3skQM7pGM221r3OoaKXT?=
 =?us-ascii?Q?Yh2m/+r/UFpRTNE5f6vPunW5peFNjtw4wcW6ykebizLaIEYtzPHeNroAjTDn?=
 =?us-ascii?Q?W1Q31BJUTXRf/j0F6Apxgm4pUfLR8nznDXKQ+7nLOEWuNv53kTn9I7ZY1jMn?=
 =?us-ascii?Q?lGnnQOgkn8KjfjYqZZBThxveCCKtMHskcenh80QZdaAtl/9ZBjdlc2GSe/2b?=
 =?us-ascii?Q?WsaMmfNngiLzKViw3N4eSKtYuKovNf0DYYpPsixR29QG50YnQSdVYNeB7/wM?=
 =?us-ascii?Q?0Yhjx2AApk0eB3hv7jfGD0GgAsRf8AiQhC7cKGkU8UqudL8O/fMsoBn0bO/q?=
 =?us-ascii?Q?g+g/IlGo/Ft2smgocNz/L4+pbGMEv6ZLIVS20Lklo8x6X57tReE8iKKD/MTT?=
 =?us-ascii?Q?J6QubcUdOyz1Y7MKULYbP9bamW5eNzGAV2ZAQWEM2tR+PeG9Wep0TMvYYEI1?=
 =?us-ascii?Q?sLxAejCEJ5sGkH5WV3HcNGnhybhz8VB9ed2GJX3pNGtMDxSfKizEXJem9BoX?=
 =?us-ascii?Q?CPoDgta+PGfAZTPXmqa2UvQOs/6FzCYVSWIKDFHBT2OC634KpAR+vqjPbk31?=
 =?us-ascii?Q?89YAxzbqtXiQyTVJ2VkuXUFWtE0Ip+6JiFppII9cmaQmWVAEXC1r8IumNlF9?=
 =?us-ascii?Q?xFqU0GCnXnCoV5aDYxAURnUnGohaGW9cl3U+nPgcsyvmtIMUzXzSZ3Vak7O1?=
 =?us-ascii?Q?rKuO42BtNMGMUwQcfmVCCsUG7MJ1YckBUXUy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rzaQVc68AsfhfmIxLEPjbt63kMBQVq1cYoaMHG5AkojcTqmsE4kYG3LO/wYk?=
 =?us-ascii?Q?lS19wx8gepaxmY77XXY7z+O3DPIAwGlvFA53Up2cgtWcdQwVf1PB262gsCYP?=
 =?us-ascii?Q?Yu61yksUPyxvLGv+BuJr7Qzdr90bHZURgx+qFG1BSvRu/zxeJUiHkpZm29HL?=
 =?us-ascii?Q?35CWrxNGFTojfk84mawFfjRRMyXX6R/M8aOIWIt2KxUhNQH7Vlq/4tQZR36X?=
 =?us-ascii?Q?uSLwou3nosKdeiKcLTER3IY5Oq3lLfbMD8FBhFsnREP3/+vQiWL6rVIUIFxR?=
 =?us-ascii?Q?dHhihkZ+xMfrxdA4i+1qY8iUn12gLAmxLJ6v/yJ96NZLtcPgW6nExUHxZNde?=
 =?us-ascii?Q?lLcNfVfu+9IvCjjbnvnOD4MTRRO7ys/pR1jfNgShP0hfKHf2ggePnupqtlcJ?=
 =?us-ascii?Q?nkkf1dYBoTJdc+sU5/ev1IokizavsfcvmfYQaayA7cns2lJgVIIXvocrAduq?=
 =?us-ascii?Q?BW6G+3TNyKMfM2763t+UuLB10Awgs8hUFQSM8CEjwGy2O55W2r+RaqJceQhF?=
 =?us-ascii?Q?PseAbbozHUGKWLoRlarVe60kFBeuexNh3KbteNMVDF1qxdBeLpHEoE9+Qyxa?=
 =?us-ascii?Q?rZrStm6VQjrTT1ooU3cLvYy/6PwgJIQ4xSPXg3UWcxQYNSA1OmgCVyN8sWxI?=
 =?us-ascii?Q?E4EfXAAiG7SOoiQ+Tm56w2ECYASvjkzjmaDNPcLM4zMYRWtBXVQt+ZRHyzD5?=
 =?us-ascii?Q?douTiV2HvRidPcwGSgDM0XFUC1yIOeuVsWDJ3s4N3m6oaMIjXaz6RB3QpIKq?=
 =?us-ascii?Q?zeFRyX4Ux6h+pLlsmJDgFJ6noEnG/htCqti7WVyhHZ1dppeljjxQsFYS7l7N?=
 =?us-ascii?Q?bRrIXlvafLyceg4g53d8TvA3zE729HyqqMH12gXF8QJS3LOkxid0jmM4/T+v?=
 =?us-ascii?Q?MbKIP1cnvvs9JF8vFj7IL5qUYvTIeH1fjKmem4xUXn6Ppnr8bNfwMDREuFUU?=
 =?us-ascii?Q?VzFWH/SW8Y7yq+jI55NOS7Z55TonmoszAjjKy+verbC1VidxKmNeG3WIBGwL?=
 =?us-ascii?Q?oOegGey+dss706jiutTztIpiUx0FKoI4ddELKJszaFRZ6mg3gX8MX9a6RTYS?=
 =?us-ascii?Q?IKZN/NTnHSMXNEuETKdv7qUM/AbhJ0G7RHTJzNKtbQrOSqunWQVzO0huPe9w?=
 =?us-ascii?Q?3coVInEqj1NhdGftT7AAUyfXw2AdppXFa5e30aXL+9YHPptUg6lvdp/1yi4P?=
 =?us-ascii?Q?qkKcXjI0CDE5Y0p26Wz4N4eCrQBXtGPanBjQyEx5LtjB1kP6kqO6vhMwkGdy?=
 =?us-ascii?Q?HZb/YAXfe/s2Rlux+bNP+EQMI6VuV/5Fnldv1KUk8rosC/qsrCIK+ETx+14m?=
 =?us-ascii?Q?z/H6TqDxcUU9BUD15z7kzHPn/v3O4SP/cJE1HpttQsjd97puZDAx5MJ3OBlh?=
 =?us-ascii?Q?iRa7KOmzs+ufVQ9Iw9A6kb41FNbkYZwTUJfSw7lghtyEA1Cu6bhSrsVDYuIO?=
 =?us-ascii?Q?jBj94rzxJF4D+uFSaWFltO5wGO+A1UrwMV28Lk7XkZElarFDvERVEkHVL3ab?=
 =?us-ascii?Q?9fVnP+BMMAG6IJrA1HBAd93n7lWnWOJA36nZpjrE6v2Ww/a2kt0/dJZzeNsL?=
 =?us-ascii?Q?sbNx/A8ufVO3JCTHSbcrn6XaSA06kVgxD1gqdfdzBSyAdmFHUX5Wl/ZJRKZM?=
 =?us-ascii?Q?skUhlRQLTTJSNSmpWomK7Gg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840ed551-580e-42d2-477c-08de2dab3885
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:54.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMF1hF7YrQRAp52w4+sOnXgsCtLiov1xDttnrlMqgUy1sbbK4cYQe/Msggu0/Ag340G903qyPaOnwK5xOP2U75c+DzzbWpupWLHs29U2LyJNfJtbf6wGWwiEggJ+LNfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 142 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 94a4521d7187..d2c03a846b58 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -141,6 +142,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -225,6 +227,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -593,7 +600,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -634,7 +641,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -809,6 +816,128 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return 0;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
+{
+	struct regulator *vbus = data;
+
+	regulator_disable(vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
+								  bool enable)
+{
+	struct device *dev = channel->dev;
+	int ret;
+
+	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
+	if (IS_ERR(channel->vbus))
+		return PTR_ERR(channel->vbus);
+
+	if (!enable)
+		return 0;
+
+	ret = regulator_enable(channel->vbus);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+					channel->vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+	bool enable = false;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+		enable = true;
+	}
+
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +1019,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
-		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0


