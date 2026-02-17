Return-Path: <linux-renesas-soc+bounces-28275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDGQGLlZlGkXDAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 13:06:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B752714BC79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 13:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5C23013D60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 12:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F5E337118;
	Tue, 17 Feb 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hU3JaDXd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D932AAD8;
	Tue, 17 Feb 2026 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329835; cv=fail; b=NyWYKiCHiYqN7y//JXXwnY5Pky3CGh0CVMDFUpP4Ft63c+aub8Ahr/DXuH5rRY67+SVzMaS0PDUjTUFg4/Vv1XPgaCcn5+DUMpOIY5lwtefTcNxtWSqc+RhJFnHzUPHcph3Hv8DZEJ1WXW3xhFq5uPswyLAt4vbK9mfciKmoXwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329835; c=relaxed/simple;
	bh=upk1Zoe9cUZ2BB506uNBV6GZUAm8ddcJttd6EgvvMvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c5XMHZo50j0GHN2n3HJ4YHSWvtz9JCEapFj4fgyPyWLtKL+UXW33ZUg/65T79yUL9m01r21iDaotzlAGxtkeMRi49Y3Kbd1e0tX0/t2RGFF9YuGptHwTdt1RlYJNm87PkdDPvfPf6gVxPkhxF3houo3cVg3uimzWWEXA0WKNpp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hU3JaDXd; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKu0OXD1vECEO1OBd9AWkrQ1E4voQZ2uNmVywS85IznFUK2koZVOyY3Wb4M01ET0I+DUTOxxYhd++XRF7mjudBO7Ql1sf28RHakh9+J6NsvOL3IB2bEl5bBvvV4tiBxvQxwmu0GCW6goYQFfwSSiIF2NbGUN9R0niOI578LQncOIg81F683klToa/N04nSYUyd/RWlXCxLMmx2oOD/G5H2FNk/tclEcvROA3GOrk2OhdCacN5SVOtn0DSc2YOK7eHXxc+5KWqcCEsCc0pAd1/orTfhoMUIcGomwE/UNhvoXcZAkps7qTiXYj4oVxiN+aR7HPrcT4nDGz3W3gnqaU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhYZLmhYYm73hGlkvLCcFPVBg91L/16uXRx5y68GVDQ=;
 b=cHrQXy2x6XDpAN3yrr09WIvRpemu6ov/q4Gq+0t/1lh6Jk/GiYOoVVMr5+9iOEytFMaEkbM7BKSjIiAyDDLfoFQJqA7oFw4AZRk2SqRzN35NA8dfZnyIn48w3Zc9XGsU7xVrf8zpl7EvUp66GTByry3EBitzgysWS1S9BPXiwKX/DjYU07UDioqgRjXsvVd5aXWkzm7mi0fOz4rigniBOrbpfuWVvp9do8s13VXxroyBeSE6PacwXPo4NfpP1/nTB+2ZUueR31d7adJQP0q/ivvTMdxqFpYDNcZkVZvwHLypU7IvLAuY2h51IE5PThU+Ipq5SGfuebMOMG158ic17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYZLmhYYm73hGlkvLCcFPVBg91L/16uXRx5y68GVDQ=;
 b=hU3JaDXdDv8B0OXpcSMe1AKvrhqmXzX6PtS5lbH3yml2oBdbPdnz5i0ZsdXhvjGvFBaeRx/swZzuz0Vd0Ni/M0MpxTNX2Svua7v8Z9A8EFU76z1W43z57E8lRfjUbrtwXpy60UooYRmpF7qCCrpmFGqxvHDhJ5CJNILjWi8Nsds=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12240.jpnprd01.prod.outlook.com (2603:1096:405:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 12:03:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 12:03:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHclPgnnEkoF8XdO06GH+Sodqqfy7WG4CWg
Date: Tue, 17 Feb 2026 12:03:44 +0000
Message-ID:
 <TY3PR01MB113465E58318BBE5BAA282001866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12240:EE_
x-ms-office365-filtering-correlation-id: 3d8b18ff-671a-4c02-4c56-08de6e1c99a8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QK/Zj9gahmecIEorce9kmh6mvQVuTEzi2+k9zXhFzXEdHdY8OyslRr9X0Gli?=
 =?us-ascii?Q?Ml3pRv0brb/6XsUDiyE2gxwlH3b4EcDU49LXT8PFa0DbtofXd2IK7dNSBsTr?=
 =?us-ascii?Q?+DBoJD5s56sdiBv8Sh3WBxZFY9axk4WxO3ZyfxMXvbdNL+6P6CjztqRVg3nP?=
 =?us-ascii?Q?1OF0Qm3WFbXo6UvW8wsqJGE777S/LzKjNdlQDX0isI3xa/gQGSCTnV2m6SQq?=
 =?us-ascii?Q?7MGvJe8wUwg2coQbABWCXrKAXU457NWjXVnI+GnXOc01ZIa6vnvJPINGLg/Q?=
 =?us-ascii?Q?jSbZRtdSH0MrIGRdsR+LpYU+L07K4wOb2aYejjaaB7ZiVc6c49dJwToL3/TO?=
 =?us-ascii?Q?tA+KN9cr6kcITYtJN9cMf9MOggMU4LnLfXmkdvEUt9H9TjJA4EcAIMPt2Vot?=
 =?us-ascii?Q?xL9kxmz11INVWzbARRNQG9+n2M4EMmLoFdlP4Xv6Fy1FjCdPchuC8gJUN5rC?=
 =?us-ascii?Q?5ZB9ys2iBSYjKoD5m3LCxGwa2Q9SZowj8cg5dS3g96OUQYsjj/qbwW7Fi5AO?=
 =?us-ascii?Q?oau4Pnhu3lL0O3qK+XF9TGzCgeQh9d+XOWkp955C1XWPhKF6ykDhMKjOAs/5?=
 =?us-ascii?Q?judDrupQOTFVGqN2RlvkMRXJUoYumm4LrreR7WT6GvFIvJJ7MN1eGoaNvmwy?=
 =?us-ascii?Q?RfhGVILSWk68+I2x/TgswOx82JiIqAa7p+yHNmXJ7ZLbG4LxmK16ltlWpR7I?=
 =?us-ascii?Q?uU5rM8bENeSaNXa9UZZMjIC97pNoYGV8b/ndJxNEOUVcokatmoIytFflsit1?=
 =?us-ascii?Q?BBEyuiXjbV4WoouOjAmFXvQP/4H8pqyMj9AOjjrLo4FwbBNM9CuavTGrgAK8?=
 =?us-ascii?Q?rrq4bC3Uqut9qrlPfoLoOk1DtUN/gZmulnPMZV8AtEzMiAQ9g1Ia6owxA2Y3?=
 =?us-ascii?Q?Implll91Cpa6ZU2Lmi84njAtkO1oUZHIXOGcxX0b7lt84RW2z4tLAnEkFGI/?=
 =?us-ascii?Q?Om964RH/trqVWQ2aJmS7kUkefuguoQaq4lT3UrsHFN/hjuTD1TT4S/8saCDC?=
 =?us-ascii?Q?3LtClyMJxMl8zhNR+YTGlvLpEjSz+DkHJkBrmhdtKaJ1r03ToNCOiSr1WbRY?=
 =?us-ascii?Q?On8AijjwnI+vJLhY/bNttAULDvlioxSvfY9Frw6nlGJfG5j9wmAAem5wIEpX?=
 =?us-ascii?Q?5T0DlRIAbTSDi3kUGVc70QrXwXsjXeDhzI9tTLnJJPX8SQPvruD8a/TefZ+j?=
 =?us-ascii?Q?+QwYKxnzMug2/N4ast/xMFQTDYFu17ghWzSRVatbp2glbXdIdez/27br5UX2?=
 =?us-ascii?Q?ykN1Kq/sxyLbqwqxTv7JKnbCxbqF9YAWwxnZbr9kUSN6pHDyuPHpUTTWFrgs?=
 =?us-ascii?Q?ldFWvHcsrbYnkPlpH8mb3iEj/M6KmGHbYJmRdyBHxh0u+ykdz2PGtVFMPi7v?=
 =?us-ascii?Q?Pu3oTmphfOeGRcqEZeBVekuOCE1cP79YAp3W45KqD4L6u8xQOlh5rmwD2sof?=
 =?us-ascii?Q?L7Bikbqe127wtR/2JN1DVH07k7ZHCm79c8MII+FY3CehMg/TY1T3b5wx6OWu?=
 =?us-ascii?Q?0JtV9sw8HUhTHpu/UdUp73515jp7gUgrnI3hBe5AtxlFtLQqvHaVTSS5VCpo?=
 =?us-ascii?Q?Om98nc+vbBv+ZbNlKuQyXtFACJj7zJLEPoPzZfr/H5xXoqfwG9BSQhztysCV?=
 =?us-ascii?Q?dZFGhmmBnwXaJbjAADf16Gg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h7LS3c8i9yAjzRyAOgjSzu4UsXWQhMDv8iwFfO2rxA1qfjozDrZRSRaCwGu6?=
 =?us-ascii?Q?PIFDjXWdRVukfhfYvwG5Uql+GBvCmELvV41wO9uyvqFyDe8FNBxEhl1QNAcX?=
 =?us-ascii?Q?7pD6E3HBz3cVKm2+y/8LPMg4ezC6g+S0YgEAapzlMYdBL0Qy3qqpNfRIdlK1?=
 =?us-ascii?Q?66BqYNq/kNxxxM04X5W2ye0miGxlITVXa6Hdd1Uy1OeUPjibO+erPmepwrgw?=
 =?us-ascii?Q?05XRZsPsKb5xOLyl6o/iEILHKMuURyBg2MhF8i3ZqMUPmpuA+x2zh0d1B6X0?=
 =?us-ascii?Q?vJSFtLBdHrA77l1/O0xEeMO+fb4LxkQU6EfFowQP35mv0sCm9l7Pk9AenVUX?=
 =?us-ascii?Q?IzYUjRbVxmtLPEskhGB53Xn35Iggr7vqIr3+WgtnrFJN6ScvcR18iMiRAx8z?=
 =?us-ascii?Q?xDV0ZdjrfE8dtl5OZyq90bmIykFYIEAKNLl89Jkd/j5pY1nSmOUAjN0oFYFH?=
 =?us-ascii?Q?Y1zL9zTAotU2R15FB5Nsv21zo8Kb8LyZJ93mXm/3y3xjQCbcu49FmuOtYCTy?=
 =?us-ascii?Q?4ZdUwtYr0B50W1R/wuuGkWBEeKtZ/RW9roDzwlwejHmVUyIlu6pIZTWxBR5z?=
 =?us-ascii?Q?DpIEZhNn49JHl43YL90wsOAl+uIr58+pFSyW1anIgsVkZNnlhkryeN9Lz3wK?=
 =?us-ascii?Q?bJRjMeEU8xTnjsHzpfeTTY4kazjQ6Hk5aCJrxkX0g2f8Vbb3qAkUkc3C4TZC?=
 =?us-ascii?Q?OnKpLWW0V1godeaEH9mb5pgvi+D5DuzNiUVY/9EkA7Ax1YuQ7VrRv3iPzfnC?=
 =?us-ascii?Q?lnKDfv9kjikUBTA9y1ZTMIOkGyR7Y8ioA5YjlrYaVs91IliBhb5tZ5PNc/lk?=
 =?us-ascii?Q?UkXslNNI+mEFGXzmLlsVEtEJSjscPupSd0nHI13MMV+l0tTCPbWt7+KUBhu+?=
 =?us-ascii?Q?hnxzN3+DoY3E3gaal12fGz47hhYYAc1AczVSAE4ygCOn0lJmdarYGjHe72GV?=
 =?us-ascii?Q?9xHxtTtinCSCB2SVRTL+qvv5woc8hQQD1GtTL2TMZHBfKu61vs0+EsORZqjJ?=
 =?us-ascii?Q?/bjHZ2NRglUJP10jEWQrqexUFVcf5c3uMkJyQRADeIvCFTAkLr2bxph/Zx8C?=
 =?us-ascii?Q?ZtR3Z9ilH17cXsl3Z6221d1B//LGjsK5uXRukPLkaZO6xtZPgGyjZTOLQGmK?=
 =?us-ascii?Q?BLOTF1VSaVZhfQPtNCgmkBMohNnjkZ/d+4vTMwtYRkVr18CXZmaxe2J3/c4i?=
 =?us-ascii?Q?I0uz0wdNEUrzKyykI1T65I2mi7kkHVHfF5TpTS8oT5nmOvzYUbrdpPdsAG6P?=
 =?us-ascii?Q?nTiWx1FYsz5C/v5dwUJNK+hiDr0OU4CT0+sh8kybULsQO9g5HPZVBSRqbCjm?=
 =?us-ascii?Q?61wcCjoz9jnVTgfLlZlTJT9TguvtqlYkXHddC4xdTEMxYSqNdRIaL0tKxdiZ?=
 =?us-ascii?Q?kazX4CQjs+isi4dXQbZ+1r64szLphGGsUJrcPPWnMrWCGHqxkWXJ1GWkRd2f?=
 =?us-ascii?Q?LAIEDLHqmU2VDIgfuAZUsd5Qr0EVXNfr4AHsFLUqyrdAXkBG/Nrtw0r4p57v?=
 =?us-ascii?Q?zxrtOuq/TL+xwf7qRsRKigK+e3/A5WQ8fUe47020wbGN0ua/F2sw1nsNlK7J?=
 =?us-ascii?Q?dEcvGxLZeWE8C1998vOYqPsuhYrcIrpzZGoOyTTxwugIvcdgcibzgoHWbJpH?=
 =?us-ascii?Q?TVuzzMZwmZLf7eyDTLFS8Cn/D4wmx4HlaOuXf+SYgbAPyuFOafY/oHODrGut?=
 =?us-ascii?Q?roVXbUhsjA1Clo7ldtjMb1DPd4cFLQJIZlMytb7OwKzq7tFSTXuKi2xeBEyD?=
 =?us-ascii?Q?0+UGXcnQxw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8b18ff-671a-4c02-4c56-08de6e1c99a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 12:03:44.8960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtQOiVn0Chnve5hMMHBS/HJCj04N4wcPCO3RplnB/twDiVKOlVgrUJCvXlsuCvZENX2abwA8bRGymEJ+slCR3sCDDYdeXhqD/XTKWb5qEsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12240
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28275-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,microchip.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: B752714BC79
X-Rspamd-Action: no action

Hi all,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 February 2026 10:30
> Subject: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse =
Generator (CPG). RZ/G3L CPG
> is similar to RZ/G2L CPG but has 5 clocks compared to 1 clock on other So=
Cs.
>=20
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock, module c=
lock outputs, as listed in
> section 4.4.2 ("Clock List r1.00") and add Reset definitions referring to=
 registers CPG_RST_* in
> Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added macros R9A08G046_ETH{0,1}_CLK_{TX,RX}_I_RMII.
>  * Keep the tag from Conor as it is trivial change for just adding macros=
.
> v1->v2:
>  * Documented external ethernet clocks as it is a clock source for MUX
>    inside CPG
>  * Updated commit description.
>  * Keep the tag from Conor as it is trivial change for adding more
>    clks.
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 +-
>  include/dt-bindings/clock/r9a08g046-cpg.h     | 343 ++++++++++++++++++
>  2 files changed, 378 insertions(+), 5 deletions(-)  create mode 100644 i=
nclude/dt-
> bindings/clock/r9a08g046-cpg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.ya=
ml
> b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> index 8c18616e5c4d..c0ce687d83ee 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -28,19 +28,30 @@ properties:
>        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
>        - renesas,r9a07g054-cpg # RZ/V2L
>        - renesas,r9a08g045-cpg # RZ/G3S
> +      - renesas,r9a08g046-cpg # RZ/G3L
>        - renesas,r9a09g011-cpg # RZ/V2M
>=20
>    reg:
>      maxItems: 1
>=20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Clock source to CPG can be either from external clo=
ck
> +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> +      - description: ETH0 TXC clock input
> +      - description: ETH0 RXC clock input
> +      - description: ETH1 TXC clock input
> +      - description: ETH1 RXC clock input
>=20
>    clock-names:
> -    description:
> -      Clock source to CPG can be either from external clock input (EXCLK=
) or
> -      crystal oscillator (XIN/XOUT).
> -    const: extal
> +    minItems: 1
> +    items:
> +      - const: extal
> +      - const: eth0_txc_tx_clk
> +      - const: eth0_rxc_rx_clk
> +      - const: eth1_txc_tx_clk
> +      - const: eth1_rxc_rx_clk
>=20
>    '#clock-cells':
>      description: |
> @@ -74,6 +85,25 @@ required:
>    - '#power-domain-cells'
>    - '#reset-cells'
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-cpg
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +
>  additionalProperties: false
>=20
>  examples:
> diff --git a/include/dt-bindings/clock/r9a08g046-cpg.h b/include/dt-bindi=
ngs/clock/r9a08g046-cpg.h
> new file mode 100644
> index 000000000000..ca484e065bbe
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> @@ -0,0 +1,343 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A08G046 CPG Core Clocks */
> +#define R9A08G046_CLK_I			0
> +#define R9A08G046_CLK_IC0		1
> +#define R9A08G046_CLK_IC1		2
> +#define R9A08G046_CLK_IC2		3
> +#define R9A08G046_CLK_IC3		4
> +#define R9A08G046_CLK_P0		5
> +#define R9A08G046_CLK_P1		6
> +#define R9A08G046_CLK_P2		7
> +#define R9A08G046_CLK_P3		8
> +#define R9A08G046_CLK_P4		9
> +#define R9A08G046_CLK_P5		10
> +#define R9A08G046_CLK_P6		11
> +#define R9A08G046_CLK_P7		12
> +#define R9A08G046_CLK_P8		13
> +#define R9A08G046_CLK_P9		14
> +#define R9A08G046_CLK_P10		15
> +#define R9A08G046_CLK_P13		16
> +#define R9A08G046_CLK_P14		17
> +#define R9A08G046_CLK_P15		18
> +#define R9A08G046_CLK_P16		19
> +#define R9A08G046_CLK_P17		20
> +#define R9A08G046_CLK_P18		21
> +#define R9A08G046_CLK_P19		22
> +#define R9A08G046_CLK_P20		23
> +#define R9A08G046_CLK_M0		24
> +#define R9A08G046_CLK_M1		25
> +#define R9A08G046_CLK_M2		26
> +#define R9A08G046_CLK_M3		27
> +#define R9A08G046_CLK_M4		28
> +#define R9A08G046_CLK_M5		29
> +#define R9A08G046_CLK_M6		30
> +#define R9A08G046_CLK_AT		31
> +#define R9A08G046_CLK_B			32
> +#define R9A08G046_CLK_ETHTX01		33
> +#define R9A08G046_CLK_ETHTX02		34
> +#define R9A08G046_CLK_ETHRX01		35
> +#define R9A08G046_CLK_ETHRX02		36
> +#define R9A08G046_CLK_ETHRM0		37
> +#define R9A08G046_CLK_ETHTX11		38
> +#define R9A08G046_CLK_ETHTX12		39
> +#define R9A08G046_CLK_ETHRX11		40
> +#define R9A08G046_CLK_ETHRX12		41
> +#define R9A08G046_CLK_ETHRM1		42
> +#define R9A08G046_CLK_G			43
> +#define R9A08G046_CLK_HP		44
> +#define R9A08G046_CLK_SD0		45
> +#define R9A08G046_CLK_SD1		46
> +#define R9A08G046_CLK_SD2		47
> +#define R9A08G046_CLK_SPI0		48
> +#define R9A08G046_CLK_SPI1		49
> +#define R9A08G046_CLK_S0		50
> +#define R9A08G046_CLK_SWD		51
> +#define R9A08G046_OSCCLK		52
> +#define R9A08G046_OSCCLK2		53
> +#define R9A08G046_CLK_P4_DIV2		54
> +
> +/* R9A08G046 Module Clocks */
> +#define R9A08G046_CA55_SCLK		0
> +#define R9A08G046_CA55_PCLK		1
> +#define R9A08G046_CA55_ATCLK		2
> +#define R9A08G046_CA55_GICCLK		3
> +#define R9A08G046_CA55_PERICLK		4
> +#define R9A08G046_CA55_ACLK		5
> +#define R9A08G046_CA55_TSCLK		6
> +#define R9A08G046_CA55_CORECLK0		7
> +#define R9A08G046_CA55_CORECLK1		8
> +#define R9A08G046_CA55_CORECLK2		9
> +#define R9A08G046_CA55_CORECLK3		10
> +#define R9A08G046_SRAM_ACPU_ACLK0	11
> +#define R9A08G046_SRAM_ACPU_ACLK1	12
> +#define R9A08G046_SRAM_ACPU_ACLK2	13
> +#define R9A08G046_GIC600_GICCLK		14
> +#define R9A08G046_IA55_CLK		15
> +#define R9A08G046_IA55_PCLK		16
> +#define R9A08G046_MHU_PCLK		17
> +#define R9A08G046_SYC_CNT_CLK		18
> +#define R9A08G046_DMAC_ACLK		19
> +#define R9A08G046_DMAC_PCLK		20
> +#define R9A08G046_OSTM0_PCLK		21
> +#define R9A08G046_OSTM1_PCLK		22
> +#define R9A08G046_OSTM2_PCLK		23
> +#define R9A08G046_MTU_X_MCK_MTU3	24
> +#define R9A08G046_POE3_CLKM_POE		25
> +#define R9A08G046_GPT_PCLK		26
> +#define R9A08G046_POEG_A_CLKP		27
> +#define R9A08G046_POEG_B_CLKP		28
> +#define R9A08G046_POEG_C_CLKP		29
> +#define R9A08G046_POEG_D_CLKP		30
> +#define R9A08G046_WDT0_PCLK		31
> +#define R9A08G046_WDT0_CLK		32
> +#define R9A08G046_WDT1_PCLK		33
> +#define R9A08G046_WDT1_CLK		34
> +#define R9A08G046_WDT2_PCLK		35
> +#define R9A08G046_WDT2_CLK		36
> +#define R9A08G046_XSPI_HCLK		37
> +#define R9A08G046_XSPI_ACLK		38
> +#define R9A08G046_XSPI_CLK		39
> +#define R9A08G046_XSPI_CLKX2		40
> +#define R9A08G046_SDHI0_IMCLK		41
> +#define R9A08G046_SDHI0_IMCLK2		42
> +#define R9A08G046_SDHI0_CLK_HS		43
> +#define R9A08G046_SDHI0_IACLKS		44
> +#define R9A08G046_SDHI0_IACLKM		45
> +#define R9A08G046_SDHI1_IMCLK		46
> +#define R9A08G046_SDHI1_IMCLK2		47
> +#define R9A08G046_SDHI1_CLK_HS		48
> +#define R9A08G046_SDHI1_IACLKS		49
> +#define R9A08G046_SDHI1_IACLKM		50
> +#define R9A08G046_SDHI2_IMCLK		51
> +#define R9A08G046_SDHI2_IMCLK2		52
> +#define R9A08G046_SDHI2_CLK_HS		53
> +#define R9A08G046_SDHI2_IACLKS		54
> +#define R9A08G046_SDHI2_IACLKM		55
> +#define R9A08G046_GE3D_CLK		56
> +#define R9A08G046_GE3D_AXI_CLK		57
> +#define R9A08G046_GE3D_ACE_CLK		58
> +#define R9A08G046_ISU_ACLK		59
> +#define R9A08G046_ISU_PCLK		60
> +#define R9A08G046_H264_CLK_A		61
> +#define R9A08G046_H264_CLK_P		62
> +#define R9A08G046_CRU_SYSCLK		63
> +#define R9A08G046_CRU_VCLK		64
> +#define R9A08G046_CRU_PCLK		65
> +#define R9A08G046_CRU_ACLK		66
> +#define R9A08G046_MIPI_DSI_PLLCLK	67

As per hardware manual this clock cannot be gated,
Looks this to be moved to core clk??
(4.4.6.4 Procedure for Activating the Modules Related to PLL7)

Cheers,
Biju

