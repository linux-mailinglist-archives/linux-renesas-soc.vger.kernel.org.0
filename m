Return-Path: <linux-renesas-soc+bounces-25242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F6C8E1BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7543AF8DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9E632E12F;
	Thu, 27 Nov 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o6tWL9nO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32332A3C5;
	Thu, 27 Nov 2025 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244191; cv=fail; b=oS/JM33ObuJhgTYKcrWUN6IJWjZKvNGDLcPYc7g/fMryv5DVpcxS+2AGk1KJX061uClokKaMxyCjoRFpsrLCwnmcE5uMN6uhsoyPjEO2N8FWGBEMBb+BsUFsl9Oo0R3Co/Bz8q16pbzjsHj7HXd7VDZ9Pp6QoGsZHr4nL4rvK2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244191; c=relaxed/simple;
	bh=zzKkEtl9atDpGINM2jVwjqzIUSMguA7o+egZEdcz3X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hpx1xXSFmHmRWq2pNziNyQOitqZ3joYJ2lIajuz7Y/9eC7oAZeJmzpk0Vea3xikPjXk0k6rQsv+g9KA9ou6s69iqIAeWQxvGBSjpkqbGvexHeby1v/6VISOe7yEEVoCd3w9Axr1khg3rJmTAT6F9k+fTi1MPthghcCT5Jf7x2LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=o6tWL9nO; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNipVaQhyUpdZrQJoEjj7EBROhY7EHlqvIPcY23jN/OUks66YJSqVpKt8ToFttfdmncySLwNBphPaKoZKA5Um4Df9SB5gK3N8kVA1DLbiZaGufNFbYL6muQ3+WYe8p5haXNXyG5A/yrE0itkOaiHmG93GZVVIt0bprecB4LlGfJd0RieXLMVUiQOSOFG5KNQbz2QAoW7404Kil3uT4PWlxt1fVBDLmw8+MPiOEttZ36c8V9gAB+/EGJ+Mc1eilmRXwLWKKXr1WpkDKef574SV5+wKeONqg3MH4S0aFxSUlGdFRPB3DfVK/BEIPjez0xYIEjWgxSBfNnpnM/MFDsHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwPutFfgZar3sQXuP4MwB+rbXVTPWwMt3ZhlbXCWgFM=;
 b=f1anaq3HWcPMr+jQLOK4Eh/5xy9RAfQFTryVeIfpTlDf8bMfdhwnyI9G/cInnBzmtV/0bH9kuX7VLJ+BN14YuHpZ/PBvumvx7TjjeyPIsP0XvUOLjS7LqXaPxGGmViKrI5vcoJyTFCfkGcZ8Ze1IQKJftuGDcKuY5rgV6h21G0yRls8VzFZhNSB8ErxcPZY/Aswd1AcLcMEzTB//N7OvyYrllTta8aQYAmXwWmaqgVA9ikN072FjH9q53Q1mlN7CTMMO0l+hPZbfcpLThcFxi+4L/j/CP8V64/BFzTENq+O+7Yz+nhIT+X7zetYSpGXCuAl/+okxNm8hdT7vdEPDkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPutFfgZar3sQXuP4MwB+rbXVTPWwMt3ZhlbXCWgFM=;
 b=o6tWL9nOP4fzSB8ph0MIPXtwxBhk6ONOyW9KN/CZJEGXpvhNsSUfCYoE6qZkNiiovrUrsfKuDl5EwRHxtPflpfk5V9UmjVm92WjX9j/pVEnJe/2fd+b/w4LKoZTuU9VnjXmh9Vzc3y1DJMwI1B85lxbWueG0Rd8+vuq4YfbSYpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:49:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:49:45 +0000
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
Subject: [PATCH v5 02/22] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
Date: Thu, 27 Nov 2025 12:48:29 +0100
Message-ID: <23553dca084eb4c9f25008579a9613418e9ef77c.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a3ad54bb-13c7-4ddb-0132-08de2dab0f6c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e4CruGFuUTAKTs4XczwZYyoUExYabLeg8ZbnaglpeaycOvw4AY2pYc5hoWFE?=
 =?us-ascii?Q?ArD3ioipIB+0Z0hidURPu0+8pnxiheNhby16ikfYoLCtU9ZM8KTrzru0vEW3?=
 =?us-ascii?Q?qgHFvHqEqFXbO/whTYO9GfoVmFKvxOg9ZFrsu7ov7BjgvvxitRbS8/AUbp+U?=
 =?us-ascii?Q?kIgcoEaCW9MfYdH4utc+L/cI3Ug4ICGUU8W3Hqqwstwq0x4YIFkzZour2aUF?=
 =?us-ascii?Q?e5hkLnZtv5EQOTX5RgjmtMrTB2xmve9oqErNsD07sCf3w8r/vq923xQHkxfE?=
 =?us-ascii?Q?VWSjLVMoDA020WqLyyJxco8xhKNiBMiM0mV7GKbFiHzLqatsim0JXWl00kcC?=
 =?us-ascii?Q?wQa+daseW/0k6Nj/YaiIgiv03E8dM4huuCczYidGGvAusVAPI+K/lZelsxN+?=
 =?us-ascii?Q?Ckz15N6LuyqHs9f4aqigbx1S7Peq0l694VsP0wm4IqR20OxW9EyBon5CmxFr?=
 =?us-ascii?Q?4WuiajlJNRdHXK10RgbbvfQHW+WSl+72eJsZzeAEUAtbzN1bUa/UXC/YbBn4?=
 =?us-ascii?Q?k7M7c5hbFX9TcdDlHW3nclF4HC41hT9bhcJHL66wwJSuBysaUy4X2d9vb1iJ?=
 =?us-ascii?Q?k4Tnf3I7TPXFWqgzAeZr1/vxrw8zj6FvLmTMCqQo6R67OVPAo/5GQUnLJQcm?=
 =?us-ascii?Q?CjGDtJ+ZEFXzkM2MJqymgYrG/C7+3Mthxb6yQcDmLpZ+JMmfCi3IJT6Ba0oj?=
 =?us-ascii?Q?+Bapjt/u0WiPXrIb/wxgh4Y7vE/K8NKfxaZKAE7mqjbepF2c+btjkVYNO7jB?=
 =?us-ascii?Q?zFLlqF1nYVT0s9xlaVrtTPG0uCMmVuRIFENCmJifm1wd0yv/hMvZh3cjUVKn?=
 =?us-ascii?Q?tV02Z8crvMhbMZOe7trjvYfygEKUcJGOSY07sSEY3pt6+aCu0ruYXdySCwja?=
 =?us-ascii?Q?8JyScxzS3YLLiqF7YhsE4/f0EZC2GBdNPn3XBGfHcRJDuZe6klI4TqUztIU3?=
 =?us-ascii?Q?zYdX50dzEvNsIUPnNKTYpHVsKWuEgoQXg2QlONAunOW45XKNmxpHapoV+36p?=
 =?us-ascii?Q?tKQt3xHd/kE8bEdKdOEpUvl36ou9tnMkzBoote4DQNkPwo4UXBd+J+fFM4Ox?=
 =?us-ascii?Q?PrANxTtit3Z6EdvXf8Ar1wLCz7Ug4+ERByOAmmXQ/cv3+X0IVHXb5x6ukrrJ?=
 =?us-ascii?Q?H+bnsAn3f2Cc2vROc1r14L3RXJouwIRw3F1+jxrj5PKkpBb3xEDS+hwJsUMA?=
 =?us-ascii?Q?obgS3bNRvssvAT4VPWEwBNcKKOx2u+U5l89PaAY7y2VV+88QnCe1dpjkGQFb?=
 =?us-ascii?Q?b5NfDFcRA+c7iPJV9DO7FQwErVHyaQnin9SoLxi/L05F+AxCcZ6vJ+UBDiaK?=
 =?us-ascii?Q?X8qnTMGmj4ItQ250rcbmC+vAf1AjG1lGB/6xLeV7tj0IRhPWtL4yOc95uWrg?=
 =?us-ascii?Q?+FZl5+737LhlWyt+IcxUCF58iFAxp54DXFnPqX50WNiNcPFGGnvFq3nUcS5V?=
 =?us-ascii?Q?PtAtvHTOCimNYKfqyJN12DJ4avEksXe06DMhd6hOLmDcxBS+ut2UHUVt7LYd?=
 =?us-ascii?Q?izVArx6fWM4DIr3vu/ImZ/bIVPjdblElvAri?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bnYSvlCF9O7CcUphalrdnL0cAHEHfkgn/cG3vP8sdTc6RSzDWcpBsz/x3VuC?=
 =?us-ascii?Q?pasHiJpAghtu3PLaicxIsnf8BFR3qBF+slqHlFuWQuEN3rGApf/3ZS3FtZ6x?=
 =?us-ascii?Q?aH/jM3IRwW8EdfJLg78Pe8BYsDCCgPMGBGUcRMib+wBOn232n5Cj0Q0z8i1O?=
 =?us-ascii?Q?Ckl0O4W037YTwQoy0NpeUxfBz6NEC4GOOhhbAPH/R0C01I2y4hQ2eI4M7aGz?=
 =?us-ascii?Q?TigticinypW1mNoAHNIRRIbajuY5IauF9iLFgPWRYgY8+bIMZ88oGftnAoIv?=
 =?us-ascii?Q?P0zgGMTrBBjIAhX+D+VqHshT5E1yfZOg74sVxNtPMFqXupfLpCr8b9mczjvI?=
 =?us-ascii?Q?NxiOXsxuOhQ2UbakI1kG50NBntMSqs6DoDWXCQZaWGJ/fbMc2Yrpw4RZnYj3?=
 =?us-ascii?Q?5KkZ0VjR/QCQEBIX5DTOJQpBHg8SLGGRvoJpb9GsUt9TQ6qi6pEuAY5qVONj?=
 =?us-ascii?Q?bhxh4FFAwoT4tQidrEBRRfbCkNnY6XPoeucWYw5t9E58LTIDjtJLb72qWq57?=
 =?us-ascii?Q?0OadM1HPh+YK+fGu3L2pxj9FFuavGjG+gVtaG3WJDP++iyEfDYTlqO9pdmCH?=
 =?us-ascii?Q?auYCRot6poNIhMUB8JG2wgoDompx+DGCWKnBCyg8MIYtNLXyN2Nd8pCgzYcF?=
 =?us-ascii?Q?MShnH7qzHL2nXCTE7Xz/RQmdWDlLpXkQj/wC82ZGZFURvPJk+mDciKr94FX9?=
 =?us-ascii?Q?lJV/4BWnxlpeKfSpfesQaRQBsMVdjXygEtVWrMmLvb0vJHIdNzyDQPy+zPIr?=
 =?us-ascii?Q?uYhOmsjlcaitUJkXf3PffeSgiAqMfXHNuwvzK+oqySi/DDQHNi0vjACYXEAW?=
 =?us-ascii?Q?hPvKZ+bSQmrpf/CPRt4hpg2qjW44Tjsfw+flXs2+fKNslNnprVcubRhhNh9h?=
 =?us-ascii?Q?+RdWJfXKXFlYSSB7/53tClDjaYjMClP8+4KrbLJ5c8jkrMXH5gr+7DjCISdo?=
 =?us-ascii?Q?Yhox2Pp8cb0j9GV45TO5iVNnDC+QD/Z2Z0OryUkRJAmuksk35eJYbFFGQtwl?=
 =?us-ascii?Q?oTgG9qnVZ7aRa7BHdI0ZnzV16k/J4YxsWAlnX4y2AVplNJzMFf+8H2rfms6m?=
 =?us-ascii?Q?RYIJGEjUBGlcI8TD7iynBxbejv27IT/67lPIfrPxpchh1sT+wliUUA+ymDDd?=
 =?us-ascii?Q?UCqIriByLBUjTfiEpMNKTcP0UQ8m/3aC+uvxM2Ja+tr9CHiwAmwuJ3SrDUV1?=
 =?us-ascii?Q?eWI/73QQHWOuv7pX5fXzf4YjlS8Kq2wdgpd4+P/phvYcV/hMzNXgpRYR1EEq?=
 =?us-ascii?Q?a8IWTKhcxyNGnePKF4Tp7ui8FsNH/1aX+6VjAflrcuLCMF6ytyNAjuF5CNiU?=
 =?us-ascii?Q?KdSAQIKePPSqjSugwQU8QQkTY+sb1yo2rDmoKQO8pw9HquY70FVpCokYGF1H?=
 =?us-ascii?Q?ObT9g/KwViVMMwvJioNOjoiziiHEsybed3ILE901AbzgaHJ11NeW+aMBgGpB?=
 =?us-ascii?Q?39hbfEps2Ad8n5qKKxm4PCWmtEUidFUQ7mFp2WXPtovRMQ/epqPy5tn+eJ3X?=
 =?us-ascii?Q?TBhT+oBjRd/Vf0rWTxLycOgUN1h04CJrilMZVLZH7f84kmMTF1e3Zu2IAriK?=
 =?us-ascii?Q?W0xk+wZFPGXcmQB7PCwi+wcSVTB5cOWCZ0ydXxLDYAai1lipdFkqpktsYcyB?=
 =?us-ascii?Q?uEJw/auenkqI9n7JxVm/RHw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ad54bb-13c7-4ddb-0132-08de2dab0f6c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:49:45.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PW6hlPCiHpSG1cJcQ/1NkcgDAJJ5nH00MJT9YtcyPl7Z725fepdMbwj/0r7ccQLHswL2Z8x1yyHfb5YVh5sqXLpPVV7BbZEWvxJHjNRQmFjw5yRVgTLq87Qieg/wVp2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Replace pm_runtime_enable() with devm_pm_runtime_enable() to ensure proper
cleanup if the probe fails. This change enhances driver reliability by
avoiding resource leaks, as the devm-managed version automatically handles
disabling at probe failure or device removal.

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

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 53 ++++++++++--------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 582de10d5beb..41e0c818ae34 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -852,30 +852,29 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
 	 */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pm_runtime\n");
 
 	channel->phy_data = of_device_get_match_data(dev);
-	if (!channel->phy_data) {
-		ret = -EINVAL;
-		goto error;
-	}
+	if (!channel->phy_data)
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
 	ret = rcar_gen3_phy_usb2_init_bus(channel);
 	if (ret)
-		goto error;
+		return ret;
 
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							channel->phy_data->phy_usb2_ops);
-		if (IS_ERR(channel->rphys[i].phy)) {
-			dev_err(dev, "Failed to create USB2 PHY\n");
-			ret = PTR_ERR(channel->rphys[i].phy);
-			goto error;
-		}
+		if (IS_ERR(channel->rphys[i].phy))
+			return dev_err_probe(dev, PTR_ERR(channel->rphys[i].phy),
+					     "Failed to create USB2 PHY\n");
+
 		channel->rphys[i].ch = channel;
 		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
@@ -886,44 +885,36 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	else
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
 	if (IS_ERR(channel->vbus)) {
-		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
-			ret = PTR_ERR(channel->vbus);
-			goto error;
-		}
+		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
+			return PTR_ERR(channel->vbus);
+
 		channel->vbus = NULL;
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0 && irq != -ENXIO) {
-		ret = irq;
-		goto error;
+		return irq;
 	} else if (irq > 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
-		if (ret < 0) {
-			dev_err(dev, "Failed to request irq (%d)\n", irq);
-			goto error;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to request irq (%d)\n",
+					     irq);
 	}
 
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
 	if (IS_ERR(provider)) {
-		dev_err(dev, "Failed to register PHY provider\n");
-		ret = PTR_ERR(provider);
-		goto error;
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "Failed to register PHY provider\n");
 	} else if (channel->is_otg_channel) {
 		ret = device_create_file(dev, &dev_attr_role);
 		if (ret < 0)
-			goto error;
+			return ret;
 	}
 
 	return 0;
-
-error:
-	pm_runtime_disable(dev);
-
-	return ret;
 }
 
 static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
@@ -932,8 +923,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rcar_gen3_phy_usb2_suspend(struct device *dev)
-- 
2.43.0


