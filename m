Return-Path: <linux-renesas-soc+bounces-32193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN/XNrBc/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:34:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF74E6078
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBDF73063C66
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDCB3C3BF1;
	Thu,  7 May 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fz2C4Gl/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9D3C141F;
	Thu,  7 May 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145754; cv=fail; b=jim2ugm3+96wEk+rB6voZgRZSrsNLPrc+S18nQF+iJRiMJ9WawTif3eCDNn7y2BW27znO/sssMIOmSSELzUYy18SSM6yRXKoLuSdt3H4YuHkuw7Pmkq5p0JTQH4ZaW7vM89e6MJREoyWanZd1af0KptGExHSYYm8DrKkYHilZXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145754; c=relaxed/simple;
	bh=so8v6GySuf7WtL0Ew+v0P34zaNCGWcPgVBfiqGAUDkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TFnQrO4rf4rIiZBhD2dhUkBuqNy+kHXLsxns3P9Aa0pqa9/PJptlGEvfbtefxP0fx07a81lrzrijWZqTHkmMgD3kVg9s7cd254qvgj8SDzegqHNTL48VNI3ravQUQ+jfndqOaJvXx2t6z4tzcgyLIyBZhosSnp+jsvL8WoLGNl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fz2C4Gl/; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMzgKTvbML4SDWGoy4DUFPglJLMpmUmwI4twJofKUalMk5KzZsU044LXm4jCcvr+LGPhQdFEDUDBTDevi8Uufv1xoIpvlxr5FZcUwjvUPbUZ7Oei4IjbrpYL/7Q4AGzOVQhrzXiVSR6ULbqdzvDdrus2jrPCup/z1YTqTkL1TuIabajnqLIa/OkvY4E37w+sRuenVqvSq8y/3ug+wxLTOYMzKhrvAfrXL5+P5sdItk/vby1HQk+RxEnONPJrGWxWxNZgAzVlunw1yXI90hrsAUDyL+664udisU2eJrwGbCkzcW8GCRq2djFWoA54CdmFLPQEUT46Z7jx99NuD5/zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evbmH/ShrL5+PU2xSYfIqyNhhww0w7CH1HTEa0Oj5g0=;
 b=wGX8IzvIGH5XhhTnA77dSMs7fmbDGamm17WrPJRKl9sXKjQNmwl1A+jCAKmQyk6W/y3Eg+ExTEJCBjqPIGZKUzX4GqbXDI329WgBGw7aZT61cQwESQC4li65BNnI27QYAOFdfoLObdkblejazv0QpgS26lhCQIoAVrIYwy7Hp+6UOwgW4+tNH04KQ3NaRqNwUbhqBrIvQCCe35io+xObNFs2g1jn5frZ+4enrJokaAqxZJOYtBv9j3gWIWthZvUgqqYS6pYUXa9aGAt0yxKaRxZLbSMeEBeyaKMcBO6qsKu2hRHBka+imfZ/9K6eKbsD7d9OpC8oK9D3jB6yxIYgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evbmH/ShrL5+PU2xSYfIqyNhhww0w7CH1HTEa0Oj5g0=;
 b=fz2C4Gl/xjDqRCM89c2rE2F7B/s3jmQtYrZbudcekSXxXck2Awkqt2IUlch7BnodORknCOgBa18aFfOj9+A7fBhZIqf3qDyRMn71bA0vdTjfsN1Mg3a1MXulnmEZumeK5llNQzM7QJ4OtJw1UpXkzD/jMcpwsAu7Q0ufulb05Zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:22:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:22:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
Date: Thu,  7 May 2026 11:21:30 +0200
Message-ID: <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13787:EE_
X-MS-Office365-Filtering-Correlation-Id: 983b5325-0746-4916-5c3d-08deac1a2a15
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 5xeTTBVOYeXAJBI1UtIWp5GW+ELNXGMNz0LiYLsX7J0paBVIN+CgrV8R94PkdOr4gd3q9BWWZzFXUlokbccpIFvxQKWpQOHnhXJzLV+VD96ZzHe08Jklq1QgK2OyJtpQ4utxQ41dQ1l5kR1kvcOI9y9UbSFjMcBNRXHW/nEQddS/c10J9tdaXLIyDPB3CWGMRrHPo4vd1DQcXTSCxztswXUd8TW58IpC5Ik0j27AhkPhXpAmNp4gTE48pm2oWwUhyw0HZlZ/A9d3L+TSGH0fhyGU9uzLRUMyJXnvpW67VeA2A3swVuw6jNIwuyFiX491r+rCfDvh0eSs/aMMfDzdZZyG9IbOUQmCc0DINUsgqBnBSNtqw6jQyVS3TgPi8QXy4nT/D+2a2pbW00btNtoa8Ce8AhMqPHYrJxxAND+lgd9nDgfrEcoJPCnCSdFUaZWdMAfPf3UaJWQX3nnR+ETWI2yog4xODAgLSyWE3EaJvnfKyHzOf5/vDKoB55XSViJ/7X10x3cXZYufknhfJnMvBsTqkOTYvBmWJkTp8qoOIlr4fjGD+4RvVVa6W4jTGLA64J2ulJnrPcIzPk5JexKvux8G5jWu4wLUIeNjYdZs0lLVZIO4hh3GI5IJt9woohVoDf4FenbNE3dBx+RQ5j3/Kb0Pqy9/jQedpi131ejmedk1qERMIKzB25/uxpZ0IU0C9BpQ7PFIaOAfERHZQ+e+1di0fmOD6+Wol/6MbCfVJzqoU90WERzGpNE92z3rWMai
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6rtPJ87azg9msoMylUuLiyAWIvlnS7ZOTbn8jc434pV0ti5+vOt+M7iyoJrY?=
 =?us-ascii?Q?krXFdbmALqGOMeXLhYiB8jX8EJHD4Cndp89ToSihE1xnrbabaGjuQWqqGcSi?=
 =?us-ascii?Q?1/caD/1Qt8aSzVnv7PhdRBalKz9i23nDMIucUdWWn2NrmknMQJjgnfFzlYel?=
 =?us-ascii?Q?oAw7HohDmKKpkDoR8ncMudWZpDmGQV/XXOH9FoTDx1aF14HiQEsFqTGZX76H?=
 =?us-ascii?Q?hmObixxkUSfypuAHEQhqerInL8nZQBFHFxGSj572/rVQEflRf0HhrOrOm9BW?=
 =?us-ascii?Q?wmojxajcNz/FqDu0wV/gl+llbUN1VeAyLEIq35FCbUrvcFUOZoBCsAWcieQ7?=
 =?us-ascii?Q?TRp9/6PFF0XCbdJMueriB5QJQCIfeeQwQiyqQnWLC9IZsbZ6OtMBg5OfMqf9?=
 =?us-ascii?Q?Lugp32Kn3KYA5d1/1y82JFtOa9Mh7w+yuHnrBszagBHNAHLsZg5GlLQbkrcM?=
 =?us-ascii?Q?QyZesthAbRyJLzzssLnOg/jdRf0y022kabcQmqa29blrKauAhcTt9mS9Lvag?=
 =?us-ascii?Q?VCeGCfAak/F06/dAzTzGS+GWT7H7KdIGuYdaON3aRxy4P9nmiBdstp60YyEK?=
 =?us-ascii?Q?DaLiUVOYiTaav0yFWS/RBAtMj62sEanx5sveiFTygngp8Lq3IlOJmEJ+Ki/V?=
 =?us-ascii?Q?An5Xp4G7mdxTJTsJv5anOVOwMbDzsJ57aWKmhswXBqqgZj3uqhfUWxinpNjA?=
 =?us-ascii?Q?GlGO5+kfygADIXBLn6eqnpLR4SL1oOAHHKlwZDf4hFf6oIl5BqJ7atr3a7wm?=
 =?us-ascii?Q?cDkusUx9NDoD5IwNTG3T6KBd3FZBrB3Q5YxMnO3YQxdkcmfPKpRvKdzyfJs6?=
 =?us-ascii?Q?ZiZQVTQXy6koesCOjNIsGSx0Mcn6iv4YgM48o9xrTSWgnhLFmWwvS+r2jQFC?=
 =?us-ascii?Q?xh1bT42rLBGsIXJ24ovdcs5rQXCssSmsHg+A6DFKzFwc77kC9hrPHBJAgweh?=
 =?us-ascii?Q?ofHXm8NV5MMnV/wSTpOyYwdRWV/VzbjQbVnlh6160nEyJv4o1/fHtE/gmj82?=
 =?us-ascii?Q?vtkCIVZ5Z1HE/FkOb9L4p9E/J9tIF/zwta+/WHBbP82s7xclyIrA2S5cOo3N?=
 =?us-ascii?Q?0sO6daq0aRBSncOQGu8smfrMuw7qJKi9wkJrgG3KVrIv3zXCwTTl8wfbbUnQ?=
 =?us-ascii?Q?PwpyqwD7W8ni7uCLRln99rxesyuKoHyxAO7cLT0Bm2TzFtPbVRJADKrG+qqQ?=
 =?us-ascii?Q?b+P2Akwpas4fM7Zqu5PPXEr8Z07fTnuGYNcCffeJ3oa/Wg6+eRlha91TsxhC?=
 =?us-ascii?Q?DXWfr2xTo1NbbTohKr9mdcD47i5NuZ6DkR7R2JwZhncl1gcoqtZsH85VHxfU?=
 =?us-ascii?Q?SarN5Q4SaOJbfCqkr510EWRATi2/kchM1TSUidBwNhan5PiNZ0hgyVv/EWTB?=
 =?us-ascii?Q?9XHWVmHHN4624GcdAwwNb01zqyulSdYdojAk0gYY/aMe5yG5lvWG+X1Z6VMi?=
 =?us-ascii?Q?QyRtR7sc0+V4kgCT+G05LILlMKigpSHRcnnzmPAIWsc6LMaG1/gJkySDy4zI?=
 =?us-ascii?Q?TxOxFuBId2u6i/eBASMv9EdksT0shaJv6D0heHuzU8tH6zahXagLltyRqIIY?=
 =?us-ascii?Q?oLubmH68dqNE/Rn5yGDOow5qjlvyGdB+rZiRsLmErQsl5CnHvsk3tkKS1EQk?=
 =?us-ascii?Q?OgIN/tGKGeIWzLwVmD0UnsQ4Ffdq05LzXlFXdfQVgMoB1gvm6YhGvMMUMW8i?=
 =?us-ascii?Q?+N9GrxLW2mRBiX1Dql8RZHj88NF+TgZoVD8RiTWRN7pUEGtWrbTMtwjrXRkM?=
 =?us-ascii?Q?etlwKpegc2383GmANgKesO/NhjHXEhPbMIhdo+LXg1egJREakLDN?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983b5325-0746-4916-5c3d-08deac1a2a15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:22:30.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMNKF1a11wfb4NQWKuzWasc6oSljugnM/RAEhXeRgEhwsct//kjtNYZqg3B60WpZisHIyFNc/vBxuTa/Eb6Z9zot5EKSds2M9hMeQjqkmn654GRdr2GbYcrcs3Y9shw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13787
X-Rspamd-Queue-Id: 51EF74E6078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32193-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[21];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.992];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.1:email,0.0.0.2:email,renesas.com:email,0.0.0.3:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: add header
X-Spam: Yes

The RZ/G3E SoC integrates two LCD controllers (LCDC0 and LCDC1), each
containing a FCPVD, VSPD, and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add compatible string 'renesas,r9a09g047-du' and extend the binding to
support two DU instances: add reg-names ('du0'/'du1'), extend reg,
interrupts, and resets to maxItems: 2, and extend clocks/clock-names to
six entries (aclk/pclk/vclk per instance, minItems: 3).

Drop the "Each port shall have a single endpoint." constraint since
RZ/G3E ports expose multiple endpoints.

Add a RZ/G3E-specific allOf rule mapping two DU instances to two ports:

 - port@0 (DU0): endpoint@0 DSI, endpoint@2 LVDS ch0, endpoint@3 LVDS ch1
 - port@1 (DU1): endpoint@0 DSI, endpoint@1 RGB (DPAD), endpoint@3 LVDS ch1

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Rebased on top of [1]
   [1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
 - Use single DRM device aggregating both DU instances (1 DU dt node),
   modelling single port for each DU0, DU1 and multiple endpoints for
   outputs.

v5->v6:
 - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
   explicitly disable port@2 and port@3 for existing SoCs that do not expose
   them.
 - Reworked ports numbering + improved/fixed ports descriptions in the
   bindings documentation.
 - Improved commit body.

v4->v5:
 - Dropped renesas,id property and updated bindings
   accordingly.

v2->v3:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Updated commit message accordingly.

 .../bindings/display/renesas,rzg2l-du.yaml    | 134 +++++++++++++++++-
 1 file changed, 130 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 0d7df210407b..8ad1361a0f3a 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du # RZ/G3E
           - renesas,r9a09g057-du # RZ/V2H(P)
           - renesas,r9a09g077-du # RZ/T2H
       - items:
@@ -34,25 +35,47 @@ properties:
           - const: renesas,r9a09g077-du # RZ/T2H fallback
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: du0
+      - const: du1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
+    minItems: 3
     items:
       - description: Main clock
       - description: Register access clock
       - description: Video clock
+      - description: Main clock for DU1
+      - description: Register access clock for DU1
+      - description: Video clock for DU1
 
   clock-names:
+    minItems: 3
     items:
       - const: aclk
       - const: pclk
       - const: vclk
+      - const: aclk1
+      - const: pclk1
+      - const: vclk1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: resetn
+      - const: resetn1
 
   power-domains:
     maxItems: 1
@@ -66,7 +89,7 @@ properties:
     description: |
       The connections to the DU output video ports are modeled using the OF
       graph bindings. The number of ports and their assignment are
-      model-dependent. Each port shall have a single endpoint.
+      model-dependent.
 
     patternProperties:
       "^port@[0-1]$":
@@ -104,6 +127,18 @@ allOf:
             const: renesas,r9a07g043u-du
     then:
       properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        interrupts:
+          maxItems: 1
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          maxItems: 1
+        reset-names: false
         ports:
           properties:
             port@0:
@@ -119,6 +154,18 @@ allOf:
             const: renesas,r9a07g044-du
     then:
       properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        interrupts:
+          maxItems: 1
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          maxItems: 1
+        reset-names: false
         ports:
           properties:
             port@0:
@@ -136,6 +183,18 @@ allOf:
             const: renesas,r9a09g057-du
     then:
       properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        interrupts:
+          maxItems: 1
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          maxItems: 1
+        reset-names: false
         ports:
           properties:
             port@0:
@@ -151,7 +210,17 @@ allOf:
             const: renesas,r9a09g077-du
     then:
       properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        interrupts:
+          maxItems: 1
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
         resets: false
+        reset-names: false
       required:
         - port
     else:
@@ -159,6 +228,63 @@ allOf:
         - resets
         - ports
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du
+    then:
+      properties:
+        reg:
+          minItems: 2
+        interrupts:
+          minItems: 2
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        reg-names:
+          minItems: 2
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+        ports:
+          properties:
+            port@0:
+              description: DU0 outputs
+              properties:
+                endpoint@0:
+                  description: DSI
+                endpoint@2:
+                  description: LVDS, Channel 0
+                endpoint@3:
+                  description: LVDS, Channel 1
+              required:
+                - endpoint@0
+                - endpoint@2
+                - endpoint@3
+            port@1:
+              description: DU1 outputs
+              properties:
+                endpoint@0:
+                  description: DSI
+                endpoint@1:
+                  description: RGB (DPAD)
+                endpoint@3:
+                  description: LVDS, Channel 1
+              required:
+                - endpoint@0
+                - endpoint@1
+                - endpoint@3
+
+          required:
+            - port@0
+            - port@1
+      required:
+        - reg-names
+        - reset-names
+
 examples:
   # RZ/G2L DU
   - |
-- 
2.54.0


