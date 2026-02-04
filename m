Return-Path: <linux-renesas-soc+bounces-27867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOePHKjsgmnqewMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 07:52:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3446E26ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 07:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFD153014A0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 06:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44672387570;
	Wed,  4 Feb 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JM4ReJpJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52C36D51E;
	Wed,  4 Feb 2026 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187939; cv=fail; b=GlzZn+C7s9XcfXNBaVMC8EumPtloL2oATq4inptsCDZyUOlEPhWejnA7f6MsZCjrl2RB68kqaraDd1CG1pHRvcDjypVioQBHZGt+ZBSCwlW0w9BAfttk2xhNxvQ2mRef0hWJZFyehUq2G63k+/GCAa7pDJhlI688BfyiAFwP/xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187939; c=relaxed/simple;
	bh=9nOpLAy+Ytx9S0wuaGhQMXfZXBx/xXMmeVJlWv8YLDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XNvXQzw8Ccw16X9HyIlreqcAEmq8Dk7N83aP55Oqgi12A8WGUbrKlJT+D2yxf3XWsb5mwUOue024Bsy1qLLL2l3oQg8VyQQWMmVVrmbbLY4hNbIXW35ghwgymUrJ+P8ZoH1wkKp9XSKakudBtEAXh8BHx2cgs4jKjcUI253+zxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JM4ReJpJ; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkksykOSJADE8hx53vK8RK9a1Ofnc3cQTKFuJx9dBYv6IcEDssWkIz5ijrZPBDiF0ZdTbxGaLynlgWrvr13GSirwoAie9tB7k4nDhT+QHa0iA1JcKbhb7BhluWJVhtAmmcy65+ABgyGIm5tSYmRrdcCUV22alpRIgGY7arisNRtuQ92sokzovlUr6u2RKClYS/6wC7v2QhuOhEWvhbT/Cq6l4M6dQ9GnDHPUWLlq/ENi7q9n25pvLbM/J6nLF8dNOkuW0y/tp6ohLJhEJBKRUMFk/o0rzYYcw4wLOKImOs4slln1aL3YjBp5krpZZ6Tkk+FpCK9rEPP+yZTmMxmGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zzFTCGmZPWMzcumj2ab1Hm3xu6zqH5xARdXhGNKu3c=;
 b=KWEwKY/YLOQPcCkNWDPdqTvUfVol7EywzG14lcdJ5yQCXN0cdaTBUsJRKlOg+vKlvZP8KkThY1Aflfgaq5Tm74kA4XVZ6H2J2SWTOBhiu6HbXv6SKpwxjU0AOvOp84eGCK4b7KPJxUwVeMjmGJFf7HZcqJejBOFF+3/FoKPCW3h6of9+GuorpwSQCkwBeZVnX1rlYBpRK84VbPAg1BBAu10GYOMcuoOyoj0YgeVX/JmkZcry1lDCqm2WOSGSAOgxLfSeIfWbqTLP6/23WU3MfK5uQprtHiMDjxxHcgOl8f+++THJzMGAHt7bMBHOWIcfF5KW3IvflTa8kiu0R7tPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zzFTCGmZPWMzcumj2ab1Hm3xu6zqH5xARdXhGNKu3c=;
 b=JM4ReJpJQtqdYw5nndY2OnsApwrh3sRlzBz5jdbYqkFmptsb3Bm0wxN5qmpskBYj3rzkUpc0NVN7iRScNENi+gVudn60b8LPm/jsNJrc+6BsSiB5CqjJtn2ETzciRqLj3e/RZ8bmdPTt0CdXtRYEL+hf2b8PS/5uYBsiRZkzulM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15476.jpnprd01.prod.outlook.com (2603:1096:604:3bf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:52:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:52:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Topic: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Index: AQHclWNsQepXURhRS0aTtfgvJAtpW7VyFyQw
Date: Wed, 4 Feb 2026 06:52:11 +0000
Message-ID:
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15476:EE_
x-ms-office365-filtering-correlation-id: cdcf646e-bc52-4153-bd6b-08de63b9ec18
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SQ9YnZSQ+KonZAD/2nNo8GR5UDxM5Qwpo2NMvWqtoqcxMzUFNnYeIF/+yp02?=
 =?us-ascii?Q?pKXHLJVNwbFepom3c1eAQqZBRdlWMz8Rzb86KOe6zdLH4VZ5Lw9DDTh+zBtx?=
 =?us-ascii?Q?hSDEKvRowiVOm2gXWXDgqaBRL0I+RoHKfgtfByPZs+4nRN/rbWcK9FstdcuF?=
 =?us-ascii?Q?aSER3NOOXfcx38f43+UUSlM+TC3tK3UKqlD/qekwshmwwUWvxG9sH/NJ6aKa?=
 =?us-ascii?Q?jO9/pXQlIGJ+Gl+JlwdVyZeg9Awi5fTQFE46Dt++nTyiIHcAel+dm2FmxA92?=
 =?us-ascii?Q?9GR61KrOfLCrxoFPQaLUeqP+ofZfvtQkI3VUS+n8Jb9HQOB516QrwPoRfPYI?=
 =?us-ascii?Q?UsknHcLx9uPm959cquunIIUcT7XqZTIEhTOJ31iXO1faelu57lebmJhejToD?=
 =?us-ascii?Q?YgdaDaVhZMrN0Ta1y+3rrzWS0lJH8eblh6U3wgPb7N7Xd13BmZzflT8ZtLzS?=
 =?us-ascii?Q?06Zt1l4R5o3vCGyP/tfhBLVC/aNx7JaN+YhJ1qYZflI95PhS2UxR0tF1P762?=
 =?us-ascii?Q?CUMIB2GY1E4vmC+kFxPAykAhPCJVY3nJNYiQpnlL30HWLsp2vMSmoBZxgn0S?=
 =?us-ascii?Q?bK23e/DBOM1Lcr46i1oGn1yibKnLaO6vcz5LHJcFtmX9O7JrNcyoAl8Xsbob?=
 =?us-ascii?Q?nfxaS+covnGx5osSM/F6xyuMh+q7vrLBSqth8ELUW84Rbf0AA6WPAiWi7Ycg?=
 =?us-ascii?Q?zqkWdSG935STjbH8WNT6oFF+wu3jPoGC2RlyV+R/bg+F7OigBTmsUzpiBvsd?=
 =?us-ascii?Q?cliBBWGIkFtlIVIyr1AcwB9QNP7qqtHnRscPbU4BTa86eynTnigzEPnhFTmo?=
 =?us-ascii?Q?SQjRshmicKT4ww9mpXJBYdO2VWPpfXygOB/cjP1iTx/eLiPJu5LAGqEuJdth?=
 =?us-ascii?Q?XOxZ+0RNG33A7OM+03C+uymddCXR5EUTG6m3v7Yf58xBGVoo6/MhJh9PQ4YU?=
 =?us-ascii?Q?2cwsUs33g2ZtUBdWui0ABUN4p3j247CovvI9xFPWlVykljJizpK9mImQuQ3m?=
 =?us-ascii?Q?kYQKoTpJ7pwISSDP9jAeudP0VhiOSnKA5DiHcPOyQvE0XlO0Wu0uYN9KcUbG?=
 =?us-ascii?Q?r+7hWoDyoNJa5fomltZVMAIRRUCPda4/bHSQW5mmp5SI3J8dSjlEYNWDyiEB?=
 =?us-ascii?Q?JMUuhj9AaQQhSOXRISXhjmwuonmZcmrMejebRXZCGpUNf9AE+2nt5RDOyfOv?=
 =?us-ascii?Q?VcHlZVfOOQIFNu3N33gW5wG1fQk6vINRV+ukL+CEdOErk/+bSVkRS4Erj5Vz?=
 =?us-ascii?Q?Ng15EQ21OMvavK3xyco8O7EtVQ4nYcw259kZRErEY3y2LhqYFvSo4hnQXibA?=
 =?us-ascii?Q?C18CqVOuxKnL8eiB1Drr84GMrwBvvnP5Z0fGmRrz82CL7IEyK4YRfPTHMCwK?=
 =?us-ascii?Q?/cZiXwvCFGdfGf2/iekqfpIpYv7VW+ZnkCHkKdmVKBvyreTTq0iHyJvm8ri3?=
 =?us-ascii?Q?fhVFq+YFY+kFXi0Qd+rYmU0mQCfz0UCyPK2JgbeR9bruL0P49SsKCdu2MS8d?=
 =?us-ascii?Q?99hkEgrdgvDitGuAOA5jfBFORtiYNDhq/tR5TpnLO0Df2bNzY73H8ftEXPKW?=
 =?us-ascii?Q?PVMyqRFyxZINS8ks+vDw32XVdVf4jgepYLk911u1cGs21vtFMIiOtn9ZL3HD?=
 =?us-ascii?Q?E9xuyOiZ2LADe0Do6MXufWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K184BL5HyWG36YAsyiCnWDKrWDUKpSWeE7L2cP5ba4rSNZpjzETvW2kk3qzg?=
 =?us-ascii?Q?4my0wJ1PyrDrTckpStYA2bwc99S0KFUTa9EdJIx0ubh/vgClLoDcZfTIiFnp?=
 =?us-ascii?Q?Ej+gxE8zTkNeFm9Yr9BCUB1pb1ypGX6cJ8A6LE4KV7M9rx20s2u0tVZrkOOR?=
 =?us-ascii?Q?lm2OEHnPLCqCAA1D3Ob4mtEcL4saYsfLENK+hfuXCFd+vXLhU4lfILtfEEw1?=
 =?us-ascii?Q?Eet1MbizWCsD4aMOTP8LbNzwX93eoWUfng08kgFXfECwWD1vUI7IRQiCWFqg?=
 =?us-ascii?Q?bkegHLXO7IoT8UrFHRR7mhAUz2+A2KeNHqSDWzy4Wb7Fks3sh1hqz2nvMHZ/?=
 =?us-ascii?Q?d30fgVQ7z5aIC1+rQI9s8RR6QqqwLzkRlqFSEF8Qns9kmH9f9dOboIEwsESU?=
 =?us-ascii?Q?UXui2JeFyUTqWsxV9Wwnt4sr8CNTMCeFODZYfSwQmxN74dAJp/a+ig2kd+iD?=
 =?us-ascii?Q?MXgVg9LrO+yLNdRQh+p6ZMJMkUur7J5X6M9FUe25wdS+uK+1FoX0EcMVGnLa?=
 =?us-ascii?Q?CfbltT7LtOLv1AGygDUKe1AxeyPlh1bH0PfLWZ+pH9HeOFtj/R6hH3eBpMB/?=
 =?us-ascii?Q?Jan4VIq89ioWgXL8g8kHJo+atZXnYKESKNsK84YOzTv8YZr3wPGXYOuGN/3S?=
 =?us-ascii?Q?t4QN/T8jRcv/JtbQfiQIiv9rKi3XK/Bukz2Fz6cg+0Bixr3uROvrX/EdMKSU?=
 =?us-ascii?Q?lMFNuHsJsmvuvHZwb2rDmDHvBJDPc342cNvem7UsyFl3dnDElhheYzC4QhcS?=
 =?us-ascii?Q?fyvRqn+OAr/FtsIhIuZpsAMt10twG3q2NWZcKiElJa/75NE4kTwJ1TolmueT?=
 =?us-ascii?Q?Ah7tDTPKTJT3QOhh7mbTdn9ViRQSYAc+6WDm1I0fgZ560jA8BWcgtv6qcx25?=
 =?us-ascii?Q?XWdUsKgydg5mx5J2ShRfS/KM8OeC9gTcSQFIYAfkePjBn3jWhIxWCURZkI6B?=
 =?us-ascii?Q?GAmIQ3TO4addgDDuhaDCJH3scQVofeDOJ1HUBol8uRVZYxs5kyrZJFSIWAAb?=
 =?us-ascii?Q?Ex3Rg1GyTToGAUyQC9JqXSx88uy33QZid8BgXHwIIRxVp2C6LlgGwVETCmBV?=
 =?us-ascii?Q?JYUP/Eyoso3ek698fnznNOesy5qu/u/KY7tcVpLBE20nMUbqCyRBO7nKb3rw?=
 =?us-ascii?Q?0HFuchcYP48mJZMJhnUC1iTxlU2RrZCCGNeZ1kx+0OwHXiwPNDHNP506MFWJ?=
 =?us-ascii?Q?G9msWAnagmDnGL3d1vzJvQVn5cVxLq7eVbykZUTPCcJLY1qEkgsD+nk6C1vT?=
 =?us-ascii?Q?BcOCGCQByaCeiCLoq5ny+dC3eFEMG7boE8pT1h9mxuymOmlZ9PgLA+GR+XKy?=
 =?us-ascii?Q?B2aAsD7bvQY1xrJA7yTawRwRHuYgS2Z9jPywW20OsfgOEJJ3bcF/NlWNlC+N?=
 =?us-ascii?Q?OmsGloiZo2Cg01YRMPO2HGw92Ya5FqawzCEgVePD+ENHC/ik6GyE8v0UoKS1?=
 =?us-ascii?Q?enr4zfNRQpymZxmoCxhXWRNMiOAeUS3/E3A/+cdlcSmvep6cNMDDzjhkJzkJ?=
 =?us-ascii?Q?6hEP1Z7v2uLydqDAoWNgOyyLkx88D+D452EMv8AT/DHCmqxMXIj333HBcznQ?=
 =?us-ascii?Q?vFuxp8Up/Dv9qhLCYFALV1iv7T4XlitvKtFjiNaD7xl2wMPUcpA0CqH/1oXw?=
 =?us-ascii?Q?jX1erdl+hKs8rUmyGdSYLzntWPl3u4dHpj31dIdTtBHa8MJvNm0Lr4RVQja8?=
 =?us-ascii?Q?QpuVtMouQcrjWFGJ8/olt+yrNVwJDoch2g5SgKCkaP172ybRm/U9diqrrAjO?=
 =?us-ascii?Q?XyMBv1ROXA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcf646e-bc52-4153-bd6b-08de63b9ec18
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 06:52:11.4290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/clvFRvIK4BKtUi0c14svY8v8ePV6qzBEroTie5AOmV8St5ZjQ+2t8U2+KLfCFFvcWFosaMiLb3eWAvOKZFlV+Gck7MRHBJC7m7r0I4ek4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15476
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27867-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C3446E26ED
X-Rspamd-Action: no action

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 03 February 2026 23:18
> Subject: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling ran=
ge-aware
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Refine IRQ type handling to explicitly bound IRQ and TINT ranges and disp=
atch based on the hardware
> IRQ number.
>=20
> This restructures the logic to clearly separate NMI, IRQ, and TINT handli=
ng and ensures out-of-range
> interrupts are ignored safely. The change prepares the driver for adding =
CA55 interrupts into the IRQ
> hierarchy domain by making the interrupt classification explicit and exte=
nsible.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - New patch.
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 59 +++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 4aa772ba1a1f..6c7bbb04c6e4 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -25,9 +25,11 @@
>  /* DT "interrupts" indexes */
>  #define ICU_IRQ_START				1
>  #define ICU_IRQ_COUNT				16
> -#define ICU_TINT_START				(ICU_IRQ_START + ICU_IRQ_COUNT)
> +#define ICU_IRQ_LAST				(ICU_IRQ_START + ICU_IRQ_COUNT - 1)
> +#define ICU_TINT_START				(ICU_IRQ_LAST + 1)
>  #define ICU_TINT_COUNT				32
> -#define ICU_NUM_IRQ				(ICU_TINT_START + ICU_TINT_COUNT)
> +#define ICU_TINT_LAST				(ICU_TINT_START + ICU_TINT_COUNT - 1)
> +#define ICU_NUM_IRQ				(ICU_TINT_LAST + 1)
>=20
>  /* Registers */
>  #define ICU_NSCNT				0x00
> @@ -175,18 +177,27 @@ static void rzv2h_icu_eoi(struct irq_data *d)
>  	u32 bit;
>=20
>  	scoped_guard(raw_spinlock, &priv->lock) {
> -		if (hw_irq >=3D ICU_TINT_START) {
> -			tintirq_nr =3D hw_irq - ICU_TINT_START;
> -			bit =3D BIT(tintirq_nr);
> -			if (!irqd_is_level_type(d))
> -				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
> -		} else if (hw_irq >=3D ICU_IRQ_START) {
> +		switch (hw_irq) {
> +		case 0:
> +			/* Clear NMI */
> +			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> +			break;
> +		case ICU_IRQ_START ... ICU_IRQ_LAST:
> +			/* Clear IRQ */
>  			tintirq_nr =3D hw_irq - ICU_IRQ_START;
>  			bit =3D BIT(tintirq_nr);
>  			if (!irqd_is_level_type(d))
>  				writel_relaxed(bit, priv->base + ICU_ISCLR);
> -		} else {
> -			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> +			break;
> +		case ICU_TINT_START ... ICU_TINT_LAST:
> +			/* Clear TINT */
> +			tintirq_nr =3D hw_irq - ICU_TINT_START;
> +			bit =3D BIT(tintirq_nr);
> +			if (!irqd_is_level_type(d))
> +				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
> +			break;
> +		default:
> +			break;
>  		}
>  	}
>=20
> @@ -200,7 +211,7 @@ static void rzv2h_tint_irq_endisable(struct irq_data =
*d, bool enable)
>  	u32 tint_nr, tssel_n, k, tssr;
>  	u8 nr_tint;
>=20
> -	if (hw_irq < ICU_TINT_START)
> +	if (hw_irq < ICU_TINT_START || hw_irq > ICU_TINT_LAST)
>  		return;
>=20
>  	tint_nr =3D hw_irq - ICU_TINT_START;
> @@ -421,12 +432,22 @@ static int rzv2h_icu_set_type(struct irq_data *d, u=
nsigned int type)
>  	unsigned int hw_irq =3D irqd_to_hwirq(d);
>  	int ret;
>=20
> -	if (hw_irq >=3D ICU_TINT_START)
> -		ret =3D rzv2h_tint_set_type(d, type);
> -	else if (hw_irq >=3D ICU_IRQ_START)
> -		ret =3D rzv2h_irq_set_type(d, type);
> -	else
> +	switch (hw_irq) {
> +	case 0:
> +		/* NMI */
>  		ret =3D rzv2h_nmi_set_type(d, type);
> +		break;
> +	case ICU_IRQ_START ... ICU_IRQ_LAST:
> +		/* IRQ */
> +		ret =3D rzv2h_irq_set_type(d, type);
> +		break;
> +	case ICU_TINT_START ... ICU_TINT_LAST:
> +		/* TINT */
> +		ret =3D rzv2h_tint_set_type(d, type);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +	}
>=20
>  	if (ret)
>  		return ret;
> @@ -507,11 +528,11 @@ static int rzv2h_icu_alloc(struct irq_domain *domai=
n, unsigned int virq, unsigne
>  	 * fwspec->param[0].
>  	 * hwirq is embedded in bits 0-15.
>  	 * TINT is embedded in bits 16-31.
> +	 * Check if bits 16-31 are set to identify TINT interrupts.
>  	 */
> -	if (hwirq >=3D ICU_TINT_START) {
> -		tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> +	tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> +	if (tint) {

Is tint =3D=3D 0 does not happen??  I mean GPIOint =3D=3D 0 is invalid??

Cheers,
Biju

>  		hwirq =3D ICU_TINT_EXTRACT_HWIRQ(hwirq);
> -
>  		if (hwirq < ICU_TINT_START)
>  			return -EINVAL;
>  	}
> --
> 2.52.0


