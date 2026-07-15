Return-Path: <linux-renesas-soc+bounces-35251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SVLyB5peV2o4KgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:19:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D975CE35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:19:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=ey5qinI5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB77F3094F5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E6C43B4B9;
	Wed, 15 Jul 2026 10:13:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22D43B6D0;
	Wed, 15 Jul 2026 10:13:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110395; cv=fail; b=ZCosNnaHHjyszU2J1hxk/uV402Qw2G8C0eg2kdqAOPf73YzhgwMDdZ56oD9owydsoH4zuyZoyFZvyqabN3wZ0xV4/bgTvkI5ilHifRn7Zwz2bQHWKtBgUJZ2XRA1Hl4Owr8D3HDFjJzMqSzGEkgThrOJ5+KVj4uOQ+Cf/U7uWdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110395; c=relaxed/simple;
	bh=m/QE4bmkP92n1WGA3HCUeZBLtLK+iTkkNTxHBtgO+T4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VupIODi2DkWRrgRKehWolteSe6tLt80ehcaa5PxQ19inAAxt0ae8b64Qa5UaEVfiimYlCNs2IISQaDWDfSdD58Li8nbkkViKwmo/L8c6alaQC9A+bkiuF8YMACXWf2RolZYyGHvSxRE6UgzQGLKf3ceIB/3cvPP3JcYFet4XXE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ey5qinI5; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmWTdg0FJcC8ZeaafY6cK8+mUSOr/Y3ukzTyslx8tQn/9KGniRuR5km8M5kdEes6l7bDeAuHGeHMAnwHOsidqq5DNcHk7fPqnEMTXncJ6uMhRCBmIa9c7CNVTbRCOsVF3QMT5ycgCMlvHOGzeSYd5KN07sWpSVyXVk1opYUixadSmX/SlkRCGcyj0UXSInmiqDqJbSMTmHvGt9HXLOl3K1jPlEmfO+Pys5pbeou9iVUPBhI6WUs+KNnDGkGQ9yKRRpxWJ3Q/GVLMew3YCsxeO9iSxEeMm12PA+289o1zeRlHZevrTKdPycWDmUc++WjumcpikfBb3i82Kni5KiHzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNlTPcu4Oifzy1Pmq7VDIdJIg1Wo3YW+PDTaqivwddE=;
 b=b7zndZi7Pc9VBXC7klnkH4nP+DL/o8TOtpriXp7Pa6uuXi6ywEutC/q+MRJW0Kq3bd6Q/ITEMaAhPzjrPWpSunJ4oT/4wbMlrX85RjZyS6PJ8o2wRTa89fF2vVrCzQMSYjjizQuQcPPMZOhb4mceA2s9b0uqmOphMAylgvsY2C3x+ePLzG9g3pU+MrMyHaK8CVRNlIHkFRLttHUM8oRt06+HXyxL8wPjM8cPktW08Isp89sQM5nSDatGtm6RK4YAJQKR648YrzqwsLKdisODHXIwEcsnrSf5Ml3gW/5ub3FAqIiXVfwaimD0dBG/9nEmOErIX/kOHrzWFEti04PIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNlTPcu4Oifzy1Pmq7VDIdJIg1Wo3YW+PDTaqivwddE=;
 b=ey5qinI5BJVT0+WAzfY+hiGIv9wQWZuy9KeteiQhHU+th9a0/dto7YVlOzgs6hDZjjcyeS3O+wYV9led44Wpg4v7vZIkYFPKfq4xvMJUuW+4+JtoEVJwi+V75/vq26NBdZz09Iu+luiO+dyOC/e0gr/A9bOWKXeOg96ASLphoZw=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY3PR01MB10965.jpnprd01.prod.outlook.com (2603:1096:400:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 10:13:10 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 10:13:10 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@lysator.liu.se,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/1] Add USB2.0 VBUS mux driver for RZ/G3E
Date: Wed, 15 Jul 2026 12:12:45 +0200
Message-ID: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY3PR01MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fb0476-3886-4a5c-1d08-08dee259ac0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|3023799007|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GyzRSRfyNFQheTx6mrS+R1ovLPdbutgIWONswQ2qwOEnlodY/yPpSRYodgeyQdJfiIviIkGagQ6H4zoCThaYDz+4DPJbVlQsuzypQLUF/ChwabqYTzi6G/kd7QZ3t9KrIp2AbWdYzrOsKXfaWjmvewLl0XGm4tEJtiVcDiVRz3OiRD4TDl2xdpJX4OJ5zaUk4iIGjzu23PDAJS6XqPn6OVBNC3CZBuf5m6kNSWqPIZLUIJuhnuh57bfoiHlzrh+BRvUsN3yIEveW+5xO0WpMEcqhEagYTtpVOMUe1EHOeVWAu9+cMLK9tRImZ++j1UQw5UCwRlphBhvo7S+jFI6qy/RT7XdivPbSXbPCcQXuNUZtkhPsa2pEUIdpJHHafkbNYaonbBewDJ6xbfqh3zsh6+7NuQkJ9qjn0L3K7v0kihzAJq0KFJfyxGusnt8zrgmrQI3V1O28nqU1Ip+CKvx+HsfvjmA2wtq1I9kqlqYk+Ipnb9QTJPGIFZlhay48slsTaZhcPniRAkzy+aDQhm28TANdzF0PpJzQQPaI7/KKq8pDYRq9LcSX4lJXvBCx0ER64iJ/CSJnkCjTZ8Kp073aGDmxY+Di6afIyAkEPyVOagxF7icgV2Ucn3FyoSxeWJ3vehjjBRukJL8NGkwYgrm6jaLejHoKWyBrkMnNMk3mhp9SJPmN5zhjYOCSC9IpRUN8OjgtDfEf4j4Iq/lSwLi8tg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zbmJXtFTmVpLv5+cTQ8gI2F5UVxo9HuUYpYC7w+xGeskUbUufihvgvJ64NEs?=
 =?us-ascii?Q?IVgyiHh+w5tj8QJCgm9sYtQrNY8p+CsatD0uRpZISai1iRNXBYSgFdM0QQEF?=
 =?us-ascii?Q?MEOtSHycP5kmgBiT5j45qgvDzRP991Ohj8X7WJSa8lnIIdAUA7BomsMvg3GO?=
 =?us-ascii?Q?/rfO6wXK5aM1llIKWgtG4V1TH2/Tpx1m4yOWI8s4WghaDL3iHRSOgVaeU+kg?=
 =?us-ascii?Q?gbTSw8WsLl177yzpc/MmkWr2oqRM0lJRkZ57RgvTJF+lNHgxrXKyKP2Dlw3a?=
 =?us-ascii?Q?LbU4E1pR5J8nXDDZjizVyFtJiYtKwW8qMjX7NVvYYUyzD/MHsYEvAdBw7FS0?=
 =?us-ascii?Q?vniFrbyolKMXvjKe7ayl75ZsHL3TLDIUQpTOcpcD3qcOcNjio6tao2EUhbI2?=
 =?us-ascii?Q?rnWoBC54KNP3u/0g2MsGt4aVgTNMBmN+zDVwJ3yZj2Ir8BhMFjAaXalncFD0?=
 =?us-ascii?Q?oXoHaBb2/8mPRjSl17LR0z1oZkT0fnTxQcKD3r2lewJlfmjw45AjKtgBaAiI?=
 =?us-ascii?Q?1YOA9bhJnmPIb8awhjuDNlfA2GvkW7w7cVu2Z9NY/E4fZ39ni3CWJTQUnzpe?=
 =?us-ascii?Q?K68835ZXlSGmj/ZKspLU6EX4Ii2OJRfXX5IyYx38LsoEd3ckKJznkHyBGWfp?=
 =?us-ascii?Q?DEvyD7aqmf/upaqEH28WX7GQ8X6QgUBoFjiR3M4EK5I7lIR2+g9D/U1Qljxq?=
 =?us-ascii?Q?/2MUKmJg4ihUwOof5SQHqMcc0rg083VbwLP08fn99Gx53WUOpUdhkp/1tNKL?=
 =?us-ascii?Q?euiOpMHEd8sQGgvoqrW4sgHpVf15jaqyMNd/jcEd8dSZwxSkGu1daaWhCiyR?=
 =?us-ascii?Q?epqSqj3kG8kUzPxr7bWlLJkj8suv2s2z7Szy8abKvAVJKp6zEgghxRFjF20L?=
 =?us-ascii?Q?/MxEvlHGlBNuI50X/z4JjIccun0tEaHNOx32fTh2Y6jCt5TF7Wg47ifvAKyL?=
 =?us-ascii?Q?NrIWl5M6Mx8uJ+smtQss3pPF3s0+Zt6bLNrZmqP2pauCfeUdgqsXKFgLasxw?=
 =?us-ascii?Q?/Vt3JRiL3oAiOqLViUPeRUsxhzGui4GyQs+PdKV7bO9OnWmVcfZhOj3SdOo7?=
 =?us-ascii?Q?lr5ETxTfeUAZ7VdoRFsdzbADmJ6qzwHSHNqv78tfxG/gg9GwmHq7hh97vL0i?=
 =?us-ascii?Q?q559D6PKhs3SBTtpp4ypx02l7GyZ01AgiVCyuL6qfF9ksN66qMKctKQLdAyi?=
 =?us-ascii?Q?rX3PxhVazVScr7YRcl5SKEP8kNfIEtFt0eVTXcbwHE1tbB3+LDUIfnikN7jO?=
 =?us-ascii?Q?NwiIIpngxnYHadK3vhmrfrJTLsDJwvWZByF0/ETu3jLArin6ibIGsSKJac7X?=
 =?us-ascii?Q?iw3Jyiwx5NTzTDaWtrzOt2AxkZ+saX5GHI3d+ESTOZs5Y3opNim2qeuhblNx?=
 =?us-ascii?Q?Sphyvkg2L4TYd8JItWXhpL8S5lL616kUYoWMmkZuxKW3eC3ZJKtUtNCemdsk?=
 =?us-ascii?Q?myYSM6q/l6t9vJzOybtpolmfARg8t+mzzqTKkxZbPt9AlR8aZtkaY3d3Dy9k?=
 =?us-ascii?Q?d/NsaDcH0Cccgr+K3Ug0PtrcQ5qzENO1cI4j20ZA0nRmjV0v9eKkHidB3n70?=
 =?us-ascii?Q?UeGRZFERsLkKerbbrgdHUfVbYTT5R7qgUwBYcHOk+adOjAM8bGCnTeschPgl?=
 =?us-ascii?Q?cJbBV8ZxIy7KA1I2WpAqJSXnACqAUjXHXdTm0i/noX4FAIM3Y+ROecivQydm?=
 =?us-ascii?Q?PwJydz8IMH87WQP7QIhHduRQJ7bfw5yjulpDHJMvyAu7C9roSZrk9jhgFa3h?=
 =?us-ascii?Q?OUaQkSXYWhdtpvgQAPKIPoXPtHpu/F0wM2C4z4zXUZ9+GGuYdKLQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fb0476-3886-4a5c-1d08-08dee259ac0a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:13:10.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIUR0WidwHf4NL8ZZKpgJNwGc5DDWie7rusze/ZQ82iDDVFnGP3Q3gRXp8nu9eyf/+6nb2AsDE7ORgbMvxdNMLJQDB74U5ZNpLJD1MSxyIWCno+b1Md62ADUv2C6j+wh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35251-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lysator.liu.se,bp.renesas.com,axentia.se,pengutronix.de,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:peda@lysator.liu.se,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peda@axentia.se,m:p.zabel@pengutronix.de,m:ulf.hansson@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:ulfh@kernel.org,m:josua@solid-run.com,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F8D975CE35

Dear All,

This patch adds a new mux driver for RZ/V2H USB VBENCTL VBUS_SEL.

All patches in the original series ([0]) have been merged except this one,
so this is just a follow-up patch to add the mux driver.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com/

Thanks & Regards,
Tommaso

v11->v12
 - No changes, just rebased on top of next-20260714

v10->v11:
 - Rebased on top of next-20260424
 - PATCHES 2,3,4,5 of [0] have been merged except this one,
   so this is just a follow-up patch to add the mux driver.

v9->v10:
 - Rebased on top of next-20260331
 - PATCH 4/5: Use struct reg_sequence and regmap_multi_reg_write()
   to handle initialization, assert and deassert sequences and drop
   custom struct rzv2h_usb2phy_regval.

v8->v9
 - Rebased on top of next-20260326
 - PATCH 1/6: Fixed driver comment year (2025 -> 2026)
     - Switch from devm_regmap_init_mmio() to dev_get_regmap().
     - Drop unnecessasry include bitops.h, of.h, property.h and
       drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on
       regmap.
     - Collected PZabel tag.
 - PATCH 4/6: Collected PZabel tag.
 - PATCH 5/6: New patch.
 - PATCH 6/6: Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the
              driver is now based on regmap and does not need the
              reset driver's private header, update driver accordingly.
     - Collected PZabel tag.
 - Update cover letter.

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (1):
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

-- 
2.54.0


