Return-Path: <linux-renesas-soc+bounces-30448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HgLCgLIxmm8OQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:10:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5C348D30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C137302EFFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3DE371CF8;
	Fri, 27 Mar 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M0yOiKlv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467F3624C2;
	Fri, 27 Mar 2026 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635004; cv=fail; b=Bhc6zPExaZBkpOhb0PRJgVKGiW80eAetirbAhrCdfPRcqsJxyvQFfemP+gwtDlWP5K/qzi0diHfA5aBKO4hb/bxzg7XMMzH65BVkdY10mGhyd5Ok1o8OKF70e5dEPS7iUy2nve4hqddFKSkAVxSrCrtTTGP/fOKtLL780iKi2Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635004; c=relaxed/simple;
	bh=/SYqrr9MpEfcv/IYdQVYcuP+rSCEBHb6S9xPRpH8m1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hIHqwVbcFSkMn+RZssNjvs3aH1hJsOmefC/DIowDjqv6mL+s4f3IbG2bTMCDXRHB5unpRdsYpc+ow1TQ72cvZzDGqI+7sU91VDY1OL6rgaQ5o+TlgFqQHU7oNA6WbM9cyZCGNJ/nMG4fAGItrgHb5o2nwNEWweCwyIDvJeTvDc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M0yOiKlv; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBpNa8oR3Ckt7Zjg4fAhTduijFZXTDwiRZ5QzLO1JqG8xbKgcdFASyWj0g7AVpCEdAmOWa/BNYUn6nGZY0VzAQZG3QkMZsL8zFd6n2j4MoSndU08V6clbr4SiW0flWDO74drK6ETt2BPBJ3drYjqTQrCiatx4crrrsm16yKq736ureJBsEsfOJqTTV84iE9h2prTDKG5e1ydpmm7Fvm2srBbF7hcbJCHrsL5L78QctWmskM69YqY7vLakxcXZTCpiSfUlw1kkPXENOL23/4mSKZzxAJoxmTFAFmr6DawOlCxlXdPWxQuaR4cNB+dn2vwgrC5iO3G2VUlplS1owZjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1YUzFmcXGWSu9tTU7vtLMx+4YSqglonpaNA/TwhrfQ=;
 b=Cy4CUaDoF5j3bddWaDRejPXqmzT2j3dh+nDaPZvBLar3Q+ZKmi4kjAcHfViOozKglZ9+g/1gF/gkmfXKO96kGh3BAjSV6adCgbvzcfMODb8FMJm8DgVUnb16HrE9YMiS0+Dft/wQ0VBZfAQSssQWnmDwAhdt38lf9ojRn9UxIU0rwJOMEMaJzkXK0Ia51adLmPUsmyGds5DSCMAFkOHHHFVM/X/NYb/5Kywma2+qPoU5PbmG9piWugg7TzGTJGAVuA32/kAZ6bwbXqQNyCasb6NhjblSlfGm/7QzbOFHY7HaVvpKdQRFlSFZbbH9OvHwKYABLMVJFGqRAWzl05kpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1YUzFmcXGWSu9tTU7vtLMx+4YSqglonpaNA/TwhrfQ=;
 b=M0yOiKlvP5DdMBvQtYPby+bI/I+Zgsis+gC4EdhS5PjvI7U73sKngmagBepDtclfy2XZQIkfB1mhs9063Q7bz9u6/Az6RtfRvzRiHZx3OMF6m1iWPMMw5RIuPqPyFgkA8YR4xOR80YLQOOl6aAkacYsi/o/pButnMAUVh1ww6FE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:09:58 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:09:58 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 3/6] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
Date: Fri, 27 Mar 2026 19:08:50 +0100
Message-ID: <346ab1e3261f7c8157c8d5bc3997ffd646edab6e.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To TYWPR01MB11940.jpnprd01.prod.outlook.com
 (2603:1096:400:3fd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd564d9-1d2f-47ad-4f3c-08de8c2c0ec5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eCkzzE3wsB+etH5IwwE1lcVCxvu/xNQ9vXMlJ8Etuf1ns2uhT7MKoCNHoANzMLxXJX/FlAjh7GTQYhadQgoCnBauHOiVkdtxKz1EtjaAK5DBsK0LDOxsHDVwfFxBSfApC24f0yqwNpyM442IbDz7X1SpCRjSbYcSXdXzj51nC4IY5MMfv1R475a+pvVtd/AfLK3Be80lHa6sz0lRx/R2qreje40f5Id187ncCDiwBF6nZEsBXofoWW4GkK5K7pHx1LKPjSbvDL8wu6lL+9M4oMyOnmq1bS0Vb5tWEnh6oTp7tqsMSlOQ8HwRUGZlDIOafCurctvVjp+L33LfKhtb31HBRnZyN0nf9psvNGg03TGqroNthhNIp7cRkhpiwbiNgQz8kin9G3ayz1l0o1iKghz1EINEfCMbR2jmYAYmP7iYhFXXfYhxihLu/uvyQTDIznOlYKy5SE9xi7M0A/FUMcYLbhFHTFMJYcXDGKmb1TMZ0m+N2+ShO8dXJzPuDvnpusvvzePyL6yzlYwwzJ0O5CWhKMFnlzeafUjlmP7glxI/cysykG8ZxMdFRotve2yWd+XZpA+6WR2zHolzEFLR7h9JLgwjcaNAcF80FmWJcZee93YPVO0PDn3IFZutzCXReMYBPAlWMIrsR/GvKtdb/u/gU6IiV0ERe7J27iwQ/27kyYXATXNQSbqNlL18izyOL5c0o4YngeGNTylmovGpuDlqqQTNfuQEUvT1pOAgJN+zmb6Gu0XKJZJrpxNaC53oMqUE131da6qLnvVXzYTLgEUFBPYBw2/XjHZNoQgMXrI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+qTEycUVmY3qRgdYFbjFNE2wjEjpFmnCHsQw4p1fbMaauUjWpt+dyxo6Kd1?=
 =?us-ascii?Q?i1Zf/353en1mxS0Eg6OlTnH3NRu9bhqVvDHwI1m88E+4uREVe8a7u69EAuJM?=
 =?us-ascii?Q?3mpTKJaevZx3mrj8E364R3T9uSUejeDMqwIqYZHszq19wU877CetSGm7eZe9?=
 =?us-ascii?Q?FmCBhZj5hvWwo/5d/TzWADlWqhTXtQH9+9Wa2cXZyNHavQkNd/rPgI/zeHiv?=
 =?us-ascii?Q?talc0svaCcpKa8y5RBFE037K97lF7Wh3rXZP66LlX91kRe5+DFVD7UTCdSxf?=
 =?us-ascii?Q?R2vLI5dNXy0fHaY5FVWOD0QuZytIFpEyvx+Z1K4o84E3F/rOSyq5POVVncfw?=
 =?us-ascii?Q?HFHQpyLd9sp8u4VobhGwCqkxNOF1xsR+c8aVqg5rkRUj7upT7057K0rj2NWk?=
 =?us-ascii?Q?AqxoQ8Awg/PkF39RAM++MWjR2678S2ks3B8Mx85Mx+22rUqaeyiGvZ6PoOQX?=
 =?us-ascii?Q?J313Pjejocm35seAVf7WuW3Tns7MRQ0h4R4KWuQuvNqRU5IVLeRBZTFf1KNI?=
 =?us-ascii?Q?Opw8ybbf/NFOszjDfwDliP165x4N93cuRXfLKNcAz+Rnm+VcV8hds7iOWOoR?=
 =?us-ascii?Q?NQy/XLxlrKNtyEmdUxIpo3s3Kbr0ES/PFyf7n4qYiSxCYPmnxhSpRkrYVqdq?=
 =?us-ascii?Q?XV7AzuYToZ4+FABqtjSNLcGdBIH3e1MuH7mZtcFQb9L/oQL95+dzl6gDcKo6?=
 =?us-ascii?Q?ykSy/CX0/UF64uJa0w5uwNjrC++uv0KCOhjnxbSduiGV3fhfcjE7WRmCPqtL?=
 =?us-ascii?Q?6jKYpRmvAmLmyLvzkbsUHZvSj+uFn0/Xv4BWeysvMci5r1AHHCCtguMalJ3w?=
 =?us-ascii?Q?21INzp6tHBt2X04E1vTmSYBNwxff/ftTfWmrbN17XgJI5KGKhhcN0NAMoL3q?=
 =?us-ascii?Q?jXv6Ep4aRHjCi1c0P44zkWSgwlpRYx5wSnEjBUmPWP1dQpHQ4gyha6YZwb/c?=
 =?us-ascii?Q?5yLySxEW5c3wew+DSIhWISEwOG0NWWUQZ8nYx0FueYhhUlkNC/qVIotrcq6N?=
 =?us-ascii?Q?GD1JnGvwfXT9sg7FAGaJQBXvWt8B4a5L+P4resUEN1U5gens6oqsH5HKw21i?=
 =?us-ascii?Q?xNRnHKjDDLkQPKq6CNjxSzvF18hE/9Px9YXBjbdD3EgHzsVBEvtyoL0OdUvR?=
 =?us-ascii?Q?rINOxa7XgHz0X2s/MJcRSOfEc66dkLskZkXnRR0DE1ramCDG61n8eD2hM43r?=
 =?us-ascii?Q?joIZfH8rQCh8hwLUIqgCaS+11rBfEsNohaQ2WbFQqb+wVOMLDuta2SCWpuXJ?=
 =?us-ascii?Q?ZLra81E6kICV0L+SBMhCmoG1vpx64Um8xDN4HvcqBVmEd2nrENAbovRultDy?=
 =?us-ascii?Q?/TiR07Qa8bsio+GkAfuPwANnpzREj44J3YSjRCLXVLA+UJtMIl3NgoZYBwKf?=
 =?us-ascii?Q?stE6jePCYyQ1Cq2fq9Q/hatIGSJqaBAUJLQSXsggW9BemFsZqAyNKUBNEQJA?=
 =?us-ascii?Q?pFCOByJ42yfZxeUT4n7uSBO/NxRydSiXmn2vias+Wb0njh254e+PqH3aszKo?=
 =?us-ascii?Q?BfU2W/yX2o5992NMi+S7KvroaYs1tSVL4FxyFCd/EHu0BEqydNEhndpV90ct?=
 =?us-ascii?Q?Rv1gexF/T/EVp923KAnM4CzDGhahUeV2pT6k5hLqzViI1nEROt5E8oTqrdc8?=
 =?us-ascii?Q?zPl82BPAILAwTnDHVYmnlhKCmj2ZGWMDOrpAlD8xOQNFZKPZQhh2OBw8bPOD?=
 =?us-ascii?Q?n19mBwH9Bvc6NojMJLii/JMsdx4MfEGmNhnxxhkxPqD3TLzJNMMQuhAmPe/j?=
 =?us-ascii?Q?zDyqGXRmlb2CStJSUh8oWK3wMHTQgNnaUVUchhDcdkYgJGDzX0rM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd564d9-1d2f-47ad-4f3c-08de8c2c0ec5
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:09:58.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdlta3i/5zDVbX9D4fD96B8l3CFUitBp9JAatgqxt0u9eWDRrVtPVI4O00g7LWw4bm7G45P7IpJQZGu11C6G20CoXoW8FbOWsuKZ7xdr119dml0WbU1Y7PlgA/e8oxib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30448-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 45C5C348D30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - No changes

v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - Fixed commit msg

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


