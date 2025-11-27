Return-Path: <linux-renesas-soc+bounces-25259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B2C8E28A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 35945342BB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2BA3321BE;
	Thu, 27 Nov 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KPMx9SkQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217A331A4C;
	Thu, 27 Nov 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244336; cv=fail; b=fW8r85ncfWoLPh8/LRnho8/dKtHVOq+YaFqSjNWntz5AokYnnMNdobIrxImDNLmBiz4ya3cvT+dfvxWIY7ah+OyqK3yR7yDpB9xCBMKIS/SUPfE9DNXHJ25/KrYtcnlZ55e4wcAMBXBWxzyuKaxljX6IwJ6yjSQzazJtNJXKK80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244336; c=relaxed/simple;
	bh=wYw9iWE6pLp0K9Ke/yNpNl5PejEfjutDgaNzHJs9+d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ECH/5K79kXldQud+iPBUCpnNExaUAtsEsafUmYQyA0OkT31B22g8yZ7prPXZZ8kxSinynIUFiqBBMsIpe5P7cCeH7oqeCKLItjaiy9x6VuTsgBiBK0NDQZAi/SL0xthe3nvtEsMQi9A5IMzihdEN/MvFcMr7YbVcz86VVPfp0dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KPMx9SkQ; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UORh8f/oqfJG7pCQ/+FR2jrJUIjOML+hh32X4yNXBwQd4YmCpiBj0UIM8E1j+feMvLKpqF6nVi3dq1xu6XO1aJ7CNZd/VgortK5o9DClG6BdlKP8ccZLoai/hnMIVqUO1TKsRVQHQXvUfuKZJ8MrLs8arJNGj0d9WPxiSNIcGOOtXahXdtyL6LC6IWwmRuptBExb5ZqRny6dR8uSh3hz2WE8R2ioqup11ScpnlReRXRqOKRNiKU7oTEFdh+amXsB7NtwadhTzjFDmByzihu771UZwRWLj/vDJ9SXsitHSMSBK5r55kxkT9B/ismMiYhNUjIhNJelnSIrZGXJEIq28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvK6PFPDZdYbjwM/VkgsgzKqu2gtL/H/ETlLOFlyyjU=;
 b=x0Qwb3czz2pvHntSeZBRzsXkGffmuMXbnEwPc5LXnPUXML5RBSuOxdW6FwnqxycJxOzf6SbPdP/hHwHsKqZ1vGxaxmotYVGDfdboHzW2nj+Hz/op6YxihoBEcD6qFqNtysB/4GyYB8e8Xwi3mOyPgohOZB7lfPUIfzgebd25Aq0b52qpK0MFaVL6llQALUbbrug4S92cSFShwSteq7hJQrOxyg83greaWeLvVAsZ2G16dlwo2PawU/7HXq+L5eoZZKS9D00FravbASBGLQIB7DsDw8k0XVTwS6rSZyLbA5FZIiZ5EimqKKwa64wEN6hyWJvBfYl6F3mPvyo1YSyR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvK6PFPDZdYbjwM/VkgsgzKqu2gtL/H/ETlLOFlyyjU=;
 b=KPMx9SkQAQP0YGrTmatbbCcTbaxIT3ykL1EZgABdZLBwAZuOSp32Ftyh5wKpfa34nptEqB4SEwOV0zZ4A5FKK7gSXB0zIvVQGO1sdLkhqJn6adWWXdErDk27OZN0lDjzhNMGRFa/Qi0tlyQ6K+ScAiqXXlhg49/soTxrlQnWuko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:52:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:52:12 +0000
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
Subject: [PATCH v5 19/22] arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator node
Date: Thu, 27 Nov 2025 12:48:46 +0100
Message-ID: <c67fcdbc2c6d1694b785d7240d368490037a82fa.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 40336827-4aef-4315-a1ad-08de2dab66de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s4bJw9Sl6chtvY3Q2VgznMju66l2fjybJZ5Muj4dCyIH6HJEN6U7lniHOexz?=
 =?us-ascii?Q?jvXuKLfxb8G1dexbc/dhs4m22dvqSNbVyRJQa/ZYoo2Q0ZhVcWb8vZd70n+r?=
 =?us-ascii?Q?b7Sh91tiLnMmhc19m7Jtdti6MfT0zbHGGBLpZJCmpT+lVtH13muslaOUTwwO?=
 =?us-ascii?Q?7IpbOuxA846WfswVVMOYoFoR2pccBjihZ4vEyGZpxx4tiFUFghAD2WTBkVRq?=
 =?us-ascii?Q?kv7ctSvQZoFzMFmFe52FBcD0xmpyjvVEbpc5B6qiLCI0r8UakG7QRQPeImHr?=
 =?us-ascii?Q?icwa3NsEhfbPHG6OI7CSUFtK9uuDaymfDty6A0IulqfKnvaEZUCsf+rXIb2u?=
 =?us-ascii?Q?A7N202zoEHPksYLOQ/d8J9eMf79FJYWSG3PpM6YswDvSKLsQnK3TpMxO/3f/?=
 =?us-ascii?Q?oDdR9dB0Tgs5ObOF6UO9lym+iW47//F4cNoNa5WNkecQk2BsdBVs/GA4aRjx?=
 =?us-ascii?Q?Cxxx93oaBwbqKtQDauQQCfnTkvkDvg6DySsYqJPh8IEqcqPzsgaGOfI9XBuP?=
 =?us-ascii?Q?zCXC8YRSIya+QqxYBiHBi+IJeoCS5dEmnj3JtOHaDS44Pu++KXBDJamX+uxz?=
 =?us-ascii?Q?sBi/oqmEVv919v/APP75TH2KdofDkr6L80Zu7Ej/taC+2T9jVrFXDMRriqZG?=
 =?us-ascii?Q?5QAgH145sSceq6BRGUxVaGQWDSoChXYdjkp8J4/3IKKHnboJCPNKFbFzv9q/?=
 =?us-ascii?Q?y80wJnCAZJFoXCVNMBPJAdNmIPVfm6TOSgR6AUm4O/Gejui+iODGVyuPVjP1?=
 =?us-ascii?Q?O1wEo1o3m0rA3F4e0q7c8Z20burDlQ83/+q7RUQTd7VdQiBIlBU+ckEUFPTK?=
 =?us-ascii?Q?edGhuGRNkUBeSmAPTziMF8p4ttGG2FwkAzG+YwW6F7pgwuAo5DthLNpB4sTM?=
 =?us-ascii?Q?kPkjDzMDdZpcCyD6O+fHykuHiXEs3nlD1LJWoP1UcKAF9yrbu+F6XfySdnIl?=
 =?us-ascii?Q?jI1Q9mkCXJpVNVNVcTRxVGfVJi/mOjanRnPA3GYqdURsGj5QXgSJyied1xob?=
 =?us-ascii?Q?o0/WUWmLHXNaVuT8fYkdo5ZGSTByK7WqyuF5cuvi/TASBCwa+SEp7uI7SQSt?=
 =?us-ascii?Q?V2VGz8dbPB35AJEuaEGzT1qeXdi+F8g1z+Qik2/eShot6Js/umbVxBhqTwh/?=
 =?us-ascii?Q?XSxFs44LzTly/EW7ByjiPes2ZoVlULPRwlr+ejapBWHLUFam6yCfCrp3RNgY?=
 =?us-ascii?Q?iGRwokzFdTZD40tJ1fODjHzqs2ibpCVk0K+V6IqakJACxHTVO80paoVXasWZ?=
 =?us-ascii?Q?Af2v48I0sL4mFRY5ZzT0OND0+LDr4Zj0UbYsknaGPOoVnjxDZqn/44iMwwwg?=
 =?us-ascii?Q?q8WLXL9WjhRm8q5CP9KA6FVPT/SlNNn70U4OWIjry7rAsWVEvLR2JfddcesD?=
 =?us-ascii?Q?O2NWJz85Pb6vTum35hngM2ysm+mQoX0KrIXQiubM7fB/9Et01N7AHtptehSy?=
 =?us-ascii?Q?UNTqiv44DgAtpyRFk7ToU9ahEH/x8YvNCQNz+0aWH5wflMX2Oi77xxxcJK5r?=
 =?us-ascii?Q?9execVRV36mIUDJMOqd2yjd92s3FADOuL1f7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3L3WZvb6RYOnGCia166vbahptfti1/RQSgLmD4V0sjb5DSSnaS82AklHfj91?=
 =?us-ascii?Q?tvkX01HAhEQOwLILhdi5Q5Htc6pS4dgxJkFGPmuSkNsSyQIRuBPBz+sv8vUN?=
 =?us-ascii?Q?I+Ym4Gh47LG/PRsbjm7rNOoJXPaa+QBgRh+liMcZs424hQkOjON3ImUoOWCH?=
 =?us-ascii?Q?U18kxAur/+1Tx1FSJBz3L+xmsT9gpc5bbyIrrWf798YwYWAcDqo0O8LSk8fR?=
 =?us-ascii?Q?5uKm8bp9nLH28ICV0curGCf9urM/3Q68VBpDFhTpfBYZlkFV0S5ZdLrGuKW5?=
 =?us-ascii?Q?Id3hWqj6FC6LrtAPCb3UZqiU0n0HH/58dYtjMzI9Zhke6QiJH6SAiRWLmyYb?=
 =?us-ascii?Q?Z15WhK1Xk+whf/ZnRr/a2w/B9LDbixd9xKFXo6RBquit/atSPggu4/+mGSd9?=
 =?us-ascii?Q?B/IxmbO4VVBm1JNOjymONUE6rgutQts95+POEA9RSOc7VwewL0ZbeNbFDd+5?=
 =?us-ascii?Q?kcfzqIkNdRsxy8B4aBiwf9iNRX04ivciPGvOYpaC1uY/tKzH+Ao3VCp42wfr?=
 =?us-ascii?Q?wCgwnYmx9DZtURaR+iagHUfgbtrgDAZgvx4dNMJ4qYs7+pUK6fu+RltEZKYG?=
 =?us-ascii?Q?OnPoI3cLUrIJY+sHAonzNoifyjDLLvP8Li/6caQKXYuzUxWgmGFZM+fDkNn/?=
 =?us-ascii?Q?r7cZJJn+xjMC/RGxXQQ5Pf2FxfrSIeabM0n7jEuZ8Qzq6HfnXRbLq2d4P1zk?=
 =?us-ascii?Q?UErlemqxtwPJ+ZqICZ2K+KSDYuhlM9UC2ZHa0XIh/jCodyQ5A8fUJUG381pd?=
 =?us-ascii?Q?MtR6WTlkgC+8jtijFsnF0TclV1Mw2w+rCvVUo56dc39OaJEle5tRbpvCb+mS?=
 =?us-ascii?Q?FZhXcXhJNJm4C+KKyX6QL3vx54/keYBb47syZLzWrzOlbiu8v4LGTsaY478k?=
 =?us-ascii?Q?eKiKwmm/+oYqWiRRUmd3gxDTpirzcpWoLLy8yEcZZC1K5r7gnTdk5wfDelWS?=
 =?us-ascii?Q?tr014qeb5VoAXe5E6tR0BR5ByBdF7trxisPg0RRKUdNI8/zAceU3mZ/WNdk7?=
 =?us-ascii?Q?aKRuk7PimnZF0dDyUXeWQlDze71g8qXSIpX7wwq4vG2qRnmLyxeNQVY4iYdm?=
 =?us-ascii?Q?zbs4NEMnK02w6fqR42vWqq9Q4XrVu+2zNtlyrvI+hiaOmowkq2v69nkdjPoh?=
 =?us-ascii?Q?Jwsu2ppyoLeNFH5NszCnKbqLHzf20TM2TrbKmoHIdEumzXQOPvDsqmM0CIRf?=
 =?us-ascii?Q?50yZoJyTan2+XDDnSz96rXRT45xizgebVuLMP+86hX/BRPYXYtVG4yVO89dX?=
 =?us-ascii?Q?ryQpAB+QDuBkq9akNzBEyVUXixg2MLHg1bEqALWEO2m7Gv7TxzaS/48PD3mF?=
 =?us-ascii?Q?8bx39J1WP2L4r3B9l6PbEbL7vhVonj6GmKXI3UBFUzK4R2UaZrAqKb5JBIWQ?=
 =?us-ascii?Q?VXtDZ8Wykq06e4rtZzDBCXri/jSSX1mAU+ddELySjRE4LoiHLInYJo6ase2A?=
 =?us-ascii?Q?KnKzLBeKSSKBKkua8/Lv6YdJNCeKVVK7aCIecZh/PpvHWVzf/SvesSuHBGkl?=
 =?us-ascii?Q?VuYK+5vQJGo9IOQs61HQ5oKS89zKsDD4kVc3AgB7wJRnKnITdnlr3Z44HB3d?=
 =?us-ascii?Q?0Shqq/w14VpSfWE4mbvzILkUboAVnsqnlEiYAwtHv5HaX5H8AZtLdiZ8d2Oz?=
 =?us-ascii?Q?Pj6KZfqbM756txg8+BOajpE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40336827-4aef-4315-a1ad-08de2dab66de
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:52:12.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOXWAm1O9biyG7GGF9h/VIwB2kJRTTRI/VvtB2HRgULDU2f4EpnFui0EzENeRaureYL11VZChzHtegccnIqD5gZZclhsLsGWelfSYs3xmrZYIrai6ygruC24yVXKM5wn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

USB2.0 PHY of the RZ/V2H(P) SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
nodes to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

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

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index b4bbcde33099..9dc0fcaad86f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1036,6 +1036,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		usb2_phy1: usb-phy@15810200 {
-- 
2.43.0


