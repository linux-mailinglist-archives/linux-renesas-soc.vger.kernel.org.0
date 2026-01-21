Return-Path: <linux-renesas-soc+bounces-27197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBIAOXzGcGkNZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:28:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39A56C46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 050324C72F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 12:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA61447A0D6;
	Wed, 21 Jan 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eL49sNSl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAE33F364;
	Wed, 21 Jan 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998367; cv=fail; b=MaSXDawLs0auR8p0gIxp3NRyQuIKqZoY0C72Zbt4c7D/tm2i+srV/6f9LmwkCafPzyE0GCuSTEWoij8DAH0782OXOi9Cn9F2nlIGhzW4tKUuzY5DbKnXSQsiEioNzur3Ujy+Vp3UoqV5t2t0KV9jBV90AQvG0boetQdbiYTGKhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998367; c=relaxed/simple;
	bh=tB6xrBO9YQ90+2rzoOOJaqnODcZaW0QODhZaEqj+IbM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cPHBmmCZ4nI6w3iqT+DPoqOoRFPnBahcV4C6CoohdQzmWftvPIYAsUyaP+V/vr0tGGt4EMJbZW/ZVxe15K9d8Wzj04asj7bzqZftVzBDMpEdUoyu6eZuEIyHniUsiQBSMwJrGTq1W67aIycx1NLxJuhUp8Lr3kc2C8uzq8l6igQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eL49sNSl; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7spXl5gs7kY3KBiErVILxcpM+8Na9uDEkKgG0lqC+z3+FHe2iayJQqjUMD+EyiHAvFbfLPHNq2PEpt5C/xJOp3KGDnjePjePX9fL5FX0hluLut6fvE7nXR+l3Bsec+jKpp3923qxsOHEtfRQpTilycfU9RKhGDR2hzCrlcKc3PpIh6FqgW73AGNhQNKm9FAAS6JIBStgz7N90hRj+i4dirZCqfpcyfsop6cV95lysmg4BqxI6rKQu3jaxzurlZ5rPVWr61Fv5bzhNQnpnamez4iVI8KdTVaTxWEu4EiR2ApwkPwQbdqaiMVx/u279ZGFcGPsrx+7lWyI2U7wv6I+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc8W865EL9u0h+dO3mmAy8pugZ+wsN8B0J2aw0c6zeA=;
 b=sxrOFPsFJTBSB+CkX3qyrHdn2YO4b4lMFyLGr0XNUwwR8UK2MaKtHZODPPgoGFu7WnMGR+s12Jtbmgs+TW0M/8pI3pGFm4AsBkRPNnplN3kX6dXepeitZnOI+24H9kXvzHZkDCj+FScg8w3J8iPKT+YTBR89q5BxHocZedlmB1vPSzKo3csMulvAB/Wu8dIZs8mK1moHCI281rD5YlR4hQipPRkLhUpAfgPVkZOvjZax15ZC/M8fsNJH/SaBBX3/U0ki9A6WETqTe7vXu8dxybjUqF8dDAwOYsBqZaKNLFwh7Z2rqAA2oUSWCUnAgMCt1BhuI1P3IDiFvPzosjWlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc8W865EL9u0h+dO3mmAy8pugZ+wsN8B0J2aw0c6zeA=;
 b=eL49sNSl5P5q5gaIE2YBplMoK7Ire3yZ6f6FsfB22Y/5/vV9PB2HTpnLOQ1QgCVyW7AHud0u+0742AYbBz6+/jcabSoNTwUWHyvcbRGOjBWJIt844v4vLD/czb7azCZhzQlMQBTHP/GgmYykPNPnpdQMJejWC/pFrLdKj+78sV0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6633.jpnprd01.prod.outlook.com (2603:1096:400:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 12:25:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 12:25:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 10/12] arm64: dts: renesas: Add initial support for RZ/G3L
 SMARC SoM
Thread-Topic: [PATCH 10/12] arm64: dts: renesas: Add initial support for
 RZ/G3L SMARC SoM
Thread-Index: AQHcigusq8Wh9SHEkUaw3KE8mfQ+6bVcjdyg
Date: Wed, 21 Jan 2026 12:25:59 +0000
Message-ID:
 <TY3PR01MB11346A3CF9B713432E7345D468696A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-11-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6633:EE_
x-ms-office365-filtering-correlation-id: 16ab35d7-ae61-41ea-32bc-08de58e83c14
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LCId0TnIHJdZNMD+ToO/28+ldoI01wO4TuiVu5HcOJ8xLazrIJ6qZRYwp13b?=
 =?us-ascii?Q?3WLKwhgxIP46HNmZ1Bfq338w4BEBe7IV5EM7IZY8OtvzdqwpzmO3gpnExZPO?=
 =?us-ascii?Q?RqTsbXwH0rTEtfNRUp4QVAMTXu20atTlIil0ITQiUAaxV4H/NZeuJXuyPRcz?=
 =?us-ascii?Q?11dPn/q7vKkEM1ZH1zeV1gMovGYiSDBeCO5/NiV8A7d1VK2G5qS2aAQtjgjd?=
 =?us-ascii?Q?uLXAOBqUkAwKtofUbM2ZE7Yj5ZeI1ppmMFrtsABT8Xn7pEI3eYvVkAk6oM+i?=
 =?us-ascii?Q?OjENqJzmd2czICETzEek0ITDX5aah9KYBXk+yIPo1yWmWU2al4R1C/P4hwxB?=
 =?us-ascii?Q?OrDF5t3z9jv1Z9HzLe8AcCpReuvFXR87cEl/j1Oy7qGSHRi4LUNxpvB+Jo7t?=
 =?us-ascii?Q?zewqDj826m9erJDB+KN5JSfv6Ee805d+m9Y4n8voNuz04syIihdL9YmGqqqW?=
 =?us-ascii?Q?JktD1kzEePP6p43cL3x/4W2svovJ+4YHGG5ueOE+WZL7/M6fRnLh7EzwiWyu?=
 =?us-ascii?Q?pR/3HZV7WjB+nPmh1rhZgKBKizk3amWOUoe7Vv1cYvbNnWg2eSq78CVFnrK4?=
 =?us-ascii?Q?30e/d9NG93D3Tx/+S1iiLgMqjOzQfkS/Rk6W0SEvEq+83Tg2mSo0NWPXpHxR?=
 =?us-ascii?Q?Iy+EsS2XjvCS/pBfNvXh9Gb+N7JIjEv9FGY29zzwIPv0JBAyYWRs88a0hhEZ?=
 =?us-ascii?Q?t013ILbuylYnBEwNsLw5LmjDhdzfMq96XnlLm4ZCz+5lUHvcF8G73H4a69gr?=
 =?us-ascii?Q?bORGv4hTesUzGdPKpmI+wBGOUUCFlQ788EyW1wzEdAAXggwIBW+8Jp6fYELg?=
 =?us-ascii?Q?AQWTLT1DJ75xlqOM7cEJZys/g8pL+VgbqJdcmVHkS5Kd6YSTClJBAoPB4G+u?=
 =?us-ascii?Q?aQ9yUzbe660wPfN5OE/xXQPfT3ffXzY2uQhRIYn88w4XYl9/XxiL5SaNwEPw?=
 =?us-ascii?Q?95yvknFxAZd3y0PMm3fbOFf1caurZFtm+aTY/zWApIiZQGsweF4CPEccjqNc?=
 =?us-ascii?Q?tGVKyCWhqE/EmxsZvaV34Lm53rcc/xO3sh76De6IphjJbe/hiUl/aH2sm04C?=
 =?us-ascii?Q?USt9EHaVZzETBoc2oLEog6z8423Vsomvm0IuvH06bY8yuvkbtW5uvNMi+7jp?=
 =?us-ascii?Q?iVXokD5rM10jZyoVbq5OUe6x8+tXLcOoJfd9dD7nhp0mfnyjN/vxqXzPHHXC?=
 =?us-ascii?Q?Ni/Z4aCNZhVueB3GGHSG4jIgykOqBTurBcD1GAPWh54pcEZwTJ2D61Jnsnfh?=
 =?us-ascii?Q?Idty5OjM0ypfpO9A+GeLhQet+v51T4GGhEjEBCQMKgtqkAze5T/TqFupibEO?=
 =?us-ascii?Q?4Ayr6/3GvOUscA9IsWN4mJBzilC0RfvT8vuTSjaei60HTkSCsaFzyhYztZAx?=
 =?us-ascii?Q?rmwWErsp8dZJz0jXCW4GVZ3sIyxoJD57TWbAriUrJ0rq3q1nP1LUKk1hyTae?=
 =?us-ascii?Q?8N3kf7uQTHpgnpgPhEjl03DaK8yBnWj5Y7lkM6Ap3e3d/1sy1arAXcfcJUBy?=
 =?us-ascii?Q?fYh3vMkIpmL/6SnAMFrrZ/vRMv5qyXHKelWudqjL6UVQ9f2ueSgDggupk4SM?=
 =?us-ascii?Q?D5e1dlyYLYf3V//hjbimj94KLCTT1N81oyORfQrlMdPP03HkiwfRYW+ZAGmd?=
 =?us-ascii?Q?OD9AbURWtn7a3fupBe8tmbU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3XnVJVA6dHG5OjNxjBTTr8ZS9QsW8NC2LGJNqKPoFe97hX/TzRKdVurTUlZm?=
 =?us-ascii?Q?CyDxvUyqqR7bjDpsluQ8tR7274rfbSefS8bxn5CIOy5YmUJsf6G0NNzr45TA?=
 =?us-ascii?Q?GftmhSOKDNkuaYyDHSgCzLGSnmR7T/o2dCbcGeB/bK9ef9e2jQH1JNVmNZb0?=
 =?us-ascii?Q?tL4TJZ21Vrt6jQdfdJiLL/Kk0coiuUmBO113AKwPjfQGwhDP9TiJdts1Qqwr?=
 =?us-ascii?Q?44Vk0rs7ZHhPdwFsn/SUBEVMyI0XMV9uOu7eM+wYPj0QA314zlL0/DZsEXf0?=
 =?us-ascii?Q?VPfe7cA+eb7/QnSh0igKtw76ahyjPDgUVZSS/Eu4ejmdEhdmkVKULjJro8Ic?=
 =?us-ascii?Q?YlA062QRWBTw1YyZOHXc+mEgIzaY5gfKWyZWfq55iWBY65IlBG17g/f/paUq?=
 =?us-ascii?Q?VTbGuF2I/l7l9z+tQKimGgjoDwngwgsucHdAoDVrr1btja/XedIXr7DsF2as?=
 =?us-ascii?Q?Do7BJ5XUXRHiOrVveJHGTaftyxJmLYS+ZUSL47pzZuu2ug5yoTfYesKMWN7f?=
 =?us-ascii?Q?sWcOj1kAxjHs4gzjJ7ny9bqHGoZ0e7PQlwbUhfXuWcPwVLx4CR0xoGcyLi1u?=
 =?us-ascii?Q?Wn3kHGxu+9enwn6hYFHJGfM6VmFtnzTuHjyhC1QD6px2MbS7utpqsRmO2E7H?=
 =?us-ascii?Q?VndQZcJKOfuPd0LyRoECz7dYcx08fiLMcq15oIPfavnbsJBhUQSoK+vhnil/?=
 =?us-ascii?Q?KVbUyrDuEnoG6kWZCDuhEwf6CIa4qmgHGtyQuqTQ1ANx4Ifx6NDRJb1ywaFC?=
 =?us-ascii?Q?u2pe1cyJ+3l2yr+Er9a6c6esgu4C9Bxh/a9/ukqki6WIbdpqYvLz6x/PblCI?=
 =?us-ascii?Q?FJ13wAm0I1W9ZiUKzZQ4GjpwEaoF+jidrmkFeycF4L7EIb7o8YH3BDoE78qe?=
 =?us-ascii?Q?E0166fOFPLHAC+/ApyS9NZzjFeo7RRigY/ma2T9HzDLWapHE0xv/aHR9qrAK?=
 =?us-ascii?Q?J/mKZ588eWLEqPUj44TLCrCb1kn1WB2N5u+b8b4X4R9DMqsLOxCezaMHl/Pl?=
 =?us-ascii?Q?lFmMeNpfeBbHCwFw7gmEK4WF0JrW/UISE+G7J9ilDAw2riDCFI9z7O8R4ahU?=
 =?us-ascii?Q?g2CNG8Cqsup7k0EHYYY0kBkte+Q5Ph7q11OZw07+kZzA8Ty4D/JRNj0+9wZj?=
 =?us-ascii?Q?yBwqOaigkL6IAFoCimZKSknO+HNvLj42mA+2MsLC9GbusQpGc7RoPGd9kw6B?=
 =?us-ascii?Q?t6tfwQFhYpYSkRsYpXH/dIsqrH8STqchURhjZo3XJ/ZetnnjMb1cSaXOtwRi?=
 =?us-ascii?Q?ETicZxY140FrJZJZVwAaFY4l8NobZrtq/uTbx8JYLhtva3gvDy8xxbgbiQ3j?=
 =?us-ascii?Q?FzAENeq6bQSm7kNqvTBYh//C65Te5TDwxQjFV+IBxcViKYbA0t2lYb132ks7?=
 =?us-ascii?Q?UghCYx55UZ50F98kKWLWnNDTB0PGmKB/TItIweWkn7ib8MesYFDdAT+thufx?=
 =?us-ascii?Q?K1XiD4wXCN+UuqUfqkHcQXDmaJVV7z2Ygu17HEaPFdVDJWIKmt+1BqXlpGQN?=
 =?us-ascii?Q?lhGhX/AnWGJsVS4CcHuFsN2aKroI5oGtz7yrUnHhTTFRF5iAGD0vXSIGZEjc?=
 =?us-ascii?Q?kQ25FcwIf+VUBzC5OoaT8GFj1te7AILxwVtzH8ei15QsNnbpPL/BoFqM+Gfe?=
 =?us-ascii?Q?LWmgdX9Isw9wmgrE+q730tExV8lqikegSqcw1Dd7DntaE5iANWB9RyF0XcYJ?=
 =?us-ascii?Q?de0pG6G6ZQ0u3d421BgiZjajWPaJy3OJ9opGcHZqjbZ9oKVVwYAOKUila1Mx?=
 =?us-ascii?Q?+oYMANHo2w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ab35d7-ae61-41ea-32bc-08de58e83c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 12:25:59.6287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dr2Ph/MlMPxmfjpD8ev28sQ7E8wtM4/CACl3cmUG/XXF8uuHct7XdYmllFZE3fPYGLyNhjGVfRPuwtwwXN+u0CtzBXnlaqKXHWyRXBdRRCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6633
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27197-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8D39A56C46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 January 2026 12:52
> Subject: [PATCH 10/12] arm64: dts: renesas: Add initial support for RZ/G3=
L SMARC SoM
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add initial support for the RZ/G3L SMARC SoM with 2GB memory and extal cl=
k.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3l-
> smarc-som.dtsi
> new file mode 100644
> index 000000000000..7a3a2d4ab037
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for R9A08G046L48 SMARC SoM board.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>

Will drop this header file in v2.

Cheers,
Biju

> +
> +/ {
> +	compatible =3D "renesas,rzg3l-smarcm", "renesas,r9a08g046l48",
> +"renesas,r9a08g046";
> +
> +	memory@48000000 {
> +		device_type =3D "memory";
> +		/* First 128MB is reserved for secure area. */
> +		reg =3D <0x0 0x48000000 0x0 0x78000000>;
> +	};
> +};
> +
> +&extal_clk {
> +	clock-frequency =3D <24000000>;
> +};
> --
> 2.43.0


