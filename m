Return-Path: <linux-renesas-soc+bounces-13573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B601A42003
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5B3A7AA736
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E502423BCF5;
	Mon, 24 Feb 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oDISt/IM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120D523BD02;
	Mon, 24 Feb 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402696; cv=fail; b=vAfHxx5B2VKr0+eOJOMeug2RJkYQYr1KMfcUXuZ1BRvjlOJWop9P3QRtPa+hg4YuaYbWzX+E0+Q3x1sdwkgNr8BGHPvBjRo/6+JT/EVeyBdtIYSbH/LY52KiXR/XEgGIrbhOmtP0DBtNroCCgL/D/EGg2O/HatXPc6b6N8QWpTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402696; c=relaxed/simple;
	bh=dIc1g3j0eb56G3ATF13kQfxrJEXAaxtnqOSPs2FKorg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e74hpg65Z3hGamCA/lVwGFkCkalzzVwdRP3lmUG7u1aX6x4ftpwkTf55byxQzu/LjO19ywdCWc3X9xGtH4dILmKy7Ofmubeqhij+rG1/PwdHpaaQBewGim95y2VChQDEcwNa5CXYi6o4hlupPuy4rBo8qDXJKPl1X5NLegd+HKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oDISt/IM; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0vfINvGUGRu5EDET5nKtpZFb0X9voaEUaV4XfgXy1uCQNNc9JPz3LYO2aDa2+pLsciw3hr6GqUA0Y2hsRNBisZ3VGarq971bH6vh730rB3F6i+sulg1tgcJTSh9xCUrtSSaq8yC+dIqprh9yzMbQ6GucVN55BWQpaa2ye2PGoxW5g6g3STDyK2A/WgThROI1fa8AFBnw1CMuCbcmG/8LTSX9UXfy+4+UIky47CSi+CjDRUqXvkLl8jhBR+24rpY1bcFSWsrY5eBedu5E5BwE4uCYH12TDByUe2sm7jhvD8xBtMlk9jEiRM7jwHiyVLzenK+oIbdZkhjMLP54N9hhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIc1g3j0eb56G3ATF13kQfxrJEXAaxtnqOSPs2FKorg=;
 b=jq309DDtpv1YQtsZXDlJEUad6N5xSrKarooiRg7vsuTEu0A+ukYvIYvv637pp9Q9fEiZtc49IBktKDuQM59i+fxT9YFI+3Q4z5xOCTWGNx1GYn4l+SYeTzywKyG8pajpf24N567DX5iYOcdBHvs1yMU2qmhqnRdsxOYMquA0eV1F1E1WhAZD9EHKGg10qVTArhAXLCuFU5R1syz/NmlMagEQJvTxEFIoafUyUq/FLoqK0LevQkOyZYWzMl2DYMipeD0vXkP/EX/kR7z6xJwlkpp5Y9wpcQtAC+c48qDlqIfYqPbMyKeFOT4CNkuH0pqE8rKPzEjx9+tGveAMDOnlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIc1g3j0eb56G3ATF13kQfxrJEXAaxtnqOSPs2FKorg=;
 b=oDISt/IMMuIbOgqkH7mkOf/2eNedQFWrhSNnoG7mAtZCFD2gi44N3NsiR1TeGOxEKZDN4gEAct0vgj9t6AqE8KMB20++CwpVjuIbmh5pwDbEHeyx7/I/cjB10rN0YrWgssUAjCrpEKZIh7j7Ga1Y0rBQP+4cigXbCScSD6p5wyk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10970.jpnprd01.prod.outlook.com (2603:1096:400:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Mon, 24 Feb
 2025 13:11:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:11:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5 00/12] Add Support for RZ/G3E ICU
Thread-Topic: [PATCH v5 00/12] Add Support for RZ/G3E ICU
Thread-Index: AQHbfT8H8+fmJsxiyUCs5uVi/kg0nbNWWHSAgAAJsYCAAB4yYA==
Date: Mon, 24 Feb 2025 13:11:26 +0000
Message-ID:
 <TY3PR01MB11346AD035252C02F944D678286C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346EAE435572E11B276BE1C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <87y0xvfuzs.ffs@tglx>
In-Reply-To: <87y0xvfuzs.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10970:EE_
x-ms-office365-filtering-correlation-id: affb6a2f-6b85-4657-691f-08dd54d4be90
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8FDSSbd3jcweE710OcR+Tam+Azp05u6US36ysR/WDAe+9wbI0Np/p7OXhVm4?=
 =?us-ascii?Q?hbdMNV5EddfNv505mtgUuImsqEsbXcJCav+mpZsD7cyz3T+K3JfWcqgyPHPQ?=
 =?us-ascii?Q?hQFKmaOtXrLU3sez4eDPPk+1GYX4Be0gQTJtLy0bRSRs6dX/8iw4vUSNzYLn?=
 =?us-ascii?Q?xQQUdqeHmy5rD7kCw+jHWUS1wpvmo+1Fa41Dm3rKElgai7+Pt+5acB4qcyer?=
 =?us-ascii?Q?dpm9szYA3T6CRHN8IyEZt23cCls/k+6LvD82hR75fiDvqCXvjZosY/0fR3Js?=
 =?us-ascii?Q?bq46WQWB2Z8XHfGOxxU9bpefXqnHHH35BMOecbe6am/fBXDKIETghlcnA2H2?=
 =?us-ascii?Q?DlrcuznbzDeZaufjlgsS/WIfkUIzq3WP4i8EdjeDt5/ldWMJTCS71pdr/9Io?=
 =?us-ascii?Q?cTXbiF+uC6KIdqFGwFndaI4ak/IxjW6S9XlnjuhTJ8IBT4OrJWZ9rdN3kd6j?=
 =?us-ascii?Q?+mqr4a2fs5mYScmdPV6AvzHIvsXLmU0N6rWefg9xG3x2aPjsVr6tDbVEgDZF?=
 =?us-ascii?Q?FVhpTiap1JMW62xt8Q3IZkXSjjvNnyhkadQijKhqPxCzatmUIRd3gjLCMOWT?=
 =?us-ascii?Q?2L0cX2hVTqfV9tQ8C14leTydrNAoOkjd9twJbYp/XtEuzdvSci14QrRd7ylu?=
 =?us-ascii?Q?/6v/yHRdZc6r02TG4aOlPyt6zR5JwO7xN/+Xi8WJRCi3/VoA2Qi2SxYI26ye?=
 =?us-ascii?Q?WFqN5D9Mph/7uedxNxZY7ZpOEFqxwDRDv/Wplna7IsYnhEyBWZvP2vypyDqx?=
 =?us-ascii?Q?o0ABmGEpVmo4eXwvtjivd8IztlDV7kmeheAXB2HRGHig0KlKAgpnqNl4tQ8i?=
 =?us-ascii?Q?bvRDl8u+cygMM185Uaa7TNJLyr4WF1m9U2Ex4FZvP012fX2eHxb9JnXOwxR0?=
 =?us-ascii?Q?So66HxD9bbBAbJLU1vG2mqBxZkdbICE/Z7sf8gx/Im2RjdicsR8mWhFBlzfI?=
 =?us-ascii?Q?F9+bYO0ajiwivFGd52blC7lWlV/Xj3u/pH3DIpbFx6wJdsFnWXQbFi/kc3eQ?=
 =?us-ascii?Q?uW8S39xYuBcd+9RwTNKsacP4PwH/TlmA3zDk9mzYehwel5bIhlq3p7gZgF5L?=
 =?us-ascii?Q?QARposgjgorolzGx5tPsmQDMWSP9i1sKvfEgFJPrs60RVBN9hkgvQq9e9wse?=
 =?us-ascii?Q?Sag6t8GQYI2g1J7NwXyXk14jXCSGQpQKEDHXWW8qLbXBLVsKEKp3eR4fSLpl?=
 =?us-ascii?Q?L4Pt243uj2NiZs3XV8+fPJv5hkUHj0NE9m+zSNy9QQUQxwWfJTBDC4WKhO2R?=
 =?us-ascii?Q?fjIJI6gesyGfZFfkmZD+3RmiLlXo7rGXKtXWfQ9NJnOaxM6zRGtPkpBp/q+q?=
 =?us-ascii?Q?m/wkoNPtmtJDQHwymdUfmIuHGoCjXPO3Xm9bBzVIdIZoHg5JMF6v8nTE36x5?=
 =?us-ascii?Q?U8CQQdoqLOjQ1YG1EkZMM+h7zXonXJfOX7ROf7eY6g/nmuaIh+f3Sz9LTJM0?=
 =?us-ascii?Q?Tg1jBCGCloJ6q8lIKrBcdkA0N5MX6+Ns?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gij8TxDlAiWAicb/GrDkd9EEwXtpmgM4gIFmhKMFpQU8n85Vc3c5D+V25j+Y?=
 =?us-ascii?Q?RTES2zxC09Argv++1Eokhja9D1WeeOldY3PQtsPWn4Y62Wj3rq3Ab4CQq5ml?=
 =?us-ascii?Q?+6oXJMQvZ81LXfngxDIdlHrqCWovqNCydPqNNbXdvbLswFeFUTwDBSPGJg6K?=
 =?us-ascii?Q?8UBz+aAxVZ+AdVITzF7MbYFNczoc1BjSZ0SWV5ghZ+MTx7YxR++KVFC5iFas?=
 =?us-ascii?Q?DIfIHg33lT31H7RhTgb9uqpp4vy1veMWwEB7FCb68OWsrQ0TklZh6yf7e/qB?=
 =?us-ascii?Q?4no1S13MStTZBK5m00EVAV1tH2megfa5rrwWKWHgTkvktb2H+V0Uo3XcQlw6?=
 =?us-ascii?Q?y/ymMLJSOKrSkuXGFBP9q6eInTRyFzaW9QE6xp9MSzBNFeslLnBKr1qFl+3E?=
 =?us-ascii?Q?vmAuHHblGxGgQSy58x8R/kl95NkDqnFkGBCtE7wZC5xFAzETbyc/mIMNMJjU?=
 =?us-ascii?Q?SPP2/SzqB+Kqe+2Dnm1qy9p7SZf0mSesGG1SrMB4khwk3kXvceHTnEM0dOyk?=
 =?us-ascii?Q?N+S7QaIVfinKtsbgDa/7TUZSxSZym14DhcoaSa0hdd/opBS3cmH6KcEWAWFh?=
 =?us-ascii?Q?DVhJ/zqcb27AYoZTdIzypMb07tO7ZK73A4u6EE60wRYWqKPQ/gtVdi3lHr4m?=
 =?us-ascii?Q?ONmgJHFBfLsaVsn+seoWvdGxCh6sSQpr0mMcXfxnn9A6AoXud8O1baFmB9el?=
 =?us-ascii?Q?nvo+4M/ijUdu+p3CLhy8KSI4ZQclJ9X7k8/ITbGBhnyV3JHnzlrnIuKZIIzv?=
 =?us-ascii?Q?+OCl1MYjIZqTb/FX441AJ5lDS3dn9pI4wUpsg2Lj3TnaGrVa1EDRhn3LBnwQ?=
 =?us-ascii?Q?CZ2nPhKMmoe5kv0ULVbB3/8d6JlY3oV1iNvEUm6Mib5/kLlPoPI/+cMJHRTR?=
 =?us-ascii?Q?JQTWHp3C0vVxMZgfEBFrl1x7vqMLSxzO0oxe7HT04hcCekzQ+iV6V2u8yzn1?=
 =?us-ascii?Q?S+/7qardTQeLdddLZErRYehG8j3gphX62RgZAOn3aUbLeix3xWfL5hpzLdao?=
 =?us-ascii?Q?+z9rEwtof5KpBr7zX3kZt/OxW/RVDYAUiH6C19bc8OYixOmGuFdBivOp95U5?=
 =?us-ascii?Q?JPi44FklmV07vJssR3WiQXiH1PtwISKDxEHlVOB09AqO0qA2nb25KErURAQc?=
 =?us-ascii?Q?J/Z8qwIY6of7bcb7eNJvE3qdsHV6sqzWO9dwmhCKzW8bs/TkZ0PpKiRJH37x?=
 =?us-ascii?Q?2gN4YOJITxNIaLfivcjBO6nBSHsaShSBmaZ56ntSJk+XfaMSzwHaIElZdsjH?=
 =?us-ascii?Q?Ju4W+MSxfo19v5zdqWQzsXZYb6pzbkzcjkqR8Yy3ZCae0ohjXnKkAErqeJPK?=
 =?us-ascii?Q?mE9P7OTX326RazKiOIMGJ8oE4yKHhTbZUev2rNFOYstmXsCnMSJan0z7Whtz?=
 =?us-ascii?Q?0NMpjWsqyG1ywVG++h4xM8MCyAEFGGNl2s8DDz8qwJplJqfLZiSC//sesFg/?=
 =?us-ascii?Q?6OFvX7Gm45tY8gwcYLRKCdiaKscrudb6/pkc2q6ssOzcFbddapRSTXKZ3DrC?=
 =?us-ascii?Q?jftc0aZ4JK6Hw/lOHeL9L6+KiephnPMZwl/cG8QI5FGtmBRO3I3dstPyyS24?=
 =?us-ascii?Q?jAZgIDyZ5WjK8EA4GeL1YSa9OZJeoxJt59poHYL5V9LSMyKWfuqkbZ+RljKf?=
 =?us-ascii?Q?Ug=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: affb6a2f-6b85-4657-691f-08dd54d4be90
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:11:26.2952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X2hjPVDILQmrxDhaL58bWq6A6nA0JKKpgJgOdjU91hOkY2HVzpGBkq1Ll3OmtI7OijVtKEYoHtq24suI8sM0wgSnC3+dViN+K3RNEPQaiag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10970

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 24 February 2025 11:22
> Subject: RE: [PATCH v5 00/12] Add Support for RZ/G3E ICU
>=20
> On Mon, Feb 24 2025 at 10:48, Biju Das wrote:
> > Gentle ping. Should I rebase to [1] and resend.
> > Please let me know.
> >
> > [1]
> > https://lore.kernel.org/all/20250220150110.738619-5-fabrizio.castro.jz
> > @renesas.com/
>=20
> Yes. I've marked this series obsolete due to the discussion about patch 1=
0.
>=20
> Please rebase on top of tip irq/drivers.

OK, will send next version retaining the macros by adding field_width
parameter to it.

Cheers,
Biju

