Return-Path: <linux-renesas-soc+bounces-11091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E69E90B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 11:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F4B280BDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21406216E2D;
	Mon,  9 Dec 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H4On4xZ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657012D758;
	Mon,  9 Dec 2024 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741057; cv=fail; b=C8bSkyjTzS+xMlLOShUjQawecoujWfyvwPZJEDZ+C3HQVLPaT5LdrBRgIxCS2z6Ufv/2EXQQMvQ7BCzuUkAW1enkdgDZrT/GlQsvaMRI9Zoha8kU9fzNycwiXnZ+MECf5Q7d6e4Pu50P3LVhV738SenDeDfqjMGHLrS6ptCdIM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741057; c=relaxed/simple;
	bh=xpzMBzPfDkWPmHgRN5cGZZg3WRvGdcmrf9IGajR3Ho4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YOrPz0yf9VK5HoYEqMOdmL+oragzOZAVVVAnaKUfLTSxqDzp8OpiaXsD9ML9KYbU8+sNA0iDX7l/HiTY1E2Zw16v++ISurvvfrQ9697pF58CWJyslJ9ZerctR004ncqLtXWWxwdhtkVAIqHr19ul97ylI3oU8gJOCW9TUV24LZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H4On4xZ7; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+HGXDujP1SKm3SnihUXEbDuO2066uyz3ZB35mNQorh8Dw3UU+yDNeq0EUWsBlDbVXKIb6Bhs2Scub5QWwCk+wBh3PlpjurNlDG/xsRwA+4ydCSPUDYdjeMYMkFDkuSqA2DHBlbwFgxWnEtaj/NBnU9Wfqlx9ttvv78jxD+X/Om6k9yWItOu3TCS8jvM/5q1Ule8f4BZ0H+zLSAiyiohNnTSYENbeyEOWFx8X+O6TxpWLOQRVaS/hvl/1NYB/8a8V8QMYqx3GpNFfpbp9YGWxZeviFJPAtCwtUKTMjoJZmfvoGezfbyiZrMpalSiF2IKK93iLwkHCzv4SqVzJ9+oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXNIM+4hMvxU4oCpDPfJEIn5La3ZL7U55z37EeJjVns=;
 b=wcKN2XPCTL8oO9hBBaMwBSuAHmn9OoVDEIpwrxF4mfqYnRwNFG9hsYeZ81Cf1Lmu+uEVDdAD7Fx4je6utfGMhvR5ZPtJlw+yWXxwqICUOGI+/JRbp5v5fx6n3ByxcL24XiSZYzdgzIkaIO46cTgx5KBVd/JWCF3MvdyhAM7RcTF3RPL6lPy53eSifr4lwfL7bVjCPABwWv6c4IYvlFDHIicpPbcpsoB4e75ykqVmxgq0o9k/ClL2vx9pvnIegIGXKl9r86+tHL7v8PksD7J7IpTkilwAq8WVrqtM+FtURtjo1EFZ8PUQ4KqqShak2V6k07pzN5Dvu2A+JMHdCRuWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXNIM+4hMvxU4oCpDPfJEIn5La3ZL7U55z37EeJjVns=;
 b=H4On4xZ7dooVCBzYno5y8jFhEb6pw58F7MCyOfJrBczmGR122XFPoxrhpyce+TSK0W1pIb9kRiqlJwOnkOmiP3tla6aCoX2J5CejuXOxf3YQhw74P8PdqCi9wSvlqugH30pSJRse6Pd7rsB8q3EjpreQgf24BTPq0KjtvbHHBD8=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYAPR01MB6073.jpnprd01.prod.outlook.com (2603:1096:402:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 10:44:10 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 10:44:10 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Topic: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Index: AQHbSCWICEbBAzxrrkCsh7zbKWm91rLalYeAgAMoiWA=
Date: Mon, 9 Dec 2024 10:44:10 +0000
Message-ID:
 <OSBPR01MB277505379019EA8ED9A9868FFF3C2@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134653372B558619C7C5CBC986322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134653372B558619C7C5CBC986322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYAPR01MB6073:EE_
x-ms-office365-filtering-correlation-id: cc321d7a-16e9-417a-905e-08dd183e6a58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lr4MkekCMMwtGY8KQ82WeuZD2xL/WmxYYewUyTTZCD/au8QPftrjJjSvuHl7?=
 =?us-ascii?Q?d6oW4TVB6WF9TedPiVD5xDdmVzbcafarsQF7eYDIqNhzo2i5f7K3M30N+mJi?=
 =?us-ascii?Q?2TtixlEEvbEZbGp8P+id57/rmmwgUIaiPyWXwYHev0ObudKfJO1OwVmOJHWJ?=
 =?us-ascii?Q?wJlvv08912/Dcf87oFll4itL1xFx5ug9ijWBs0+k90l9HcaP8IPWMOVguVn/?=
 =?us-ascii?Q?z/rqpMZL6jrtFJwZdVTc4qBqClDDCtIDmj73yfNxIumj2QJqY6TorUuKK8An?=
 =?us-ascii?Q?6wXEKKK9kwdwPX6o98lhkDlBna33jKZfruX6SF18JJc+jTes5YynKaatZYBi?=
 =?us-ascii?Q?JTA8qZdFIFNI2pgsGZx+omxrfSzyuEMHJDJ6eoI3mg8fKWOLXtFvolOTr5zS?=
 =?us-ascii?Q?9ZfYVGlWGwZA9GML6/wuQN7+OxktEVzQlCVC+T6leWnZybZ7V6ZdIatZUpX3?=
 =?us-ascii?Q?qD7oD+JnRDHQ0nk82S3nopwuxmK/+xAOO3xBNu89MvTcyJ19mFL5lbwx62HT?=
 =?us-ascii?Q?vXEwxuNhTX4p1r/wfdR8qyNAX4P8ixVpILTstfHLKG4D/w8wkYzMSE3xKaFl?=
 =?us-ascii?Q?pG6HYVWsnRRI8JIeTSoRC5cN6s4z7vBy52EVKeEIQGg3z7nI58xnZralsfHD?=
 =?us-ascii?Q?CKVVSiiELu81DEd90n9h4fE7CzfGAKGzNbAISCebUd90rsA3b8aQKQyaw3rm?=
 =?us-ascii?Q?JTIf87t9mhVRytlQhOhXjQUaOqlXA9LWYginhDf2KRbPtRotwXUeH9qX2VFq?=
 =?us-ascii?Q?hfrUelYB+exg1+O5GmqjM3tif30xlcu/a32b1OZYlTC4/UJFXSR36UvqDSne?=
 =?us-ascii?Q?85MeZRVUNl4kqrifgiegjG2L+FGFzJyN4CmsCDxDkvh4iJDe2jCQenXii6E6?=
 =?us-ascii?Q?w7a6VA1oXj4KAZyJRfbCxruzkPcz/2e+QfxlvpvXns7lBwSIM1Sj2d/+aKHi?=
 =?us-ascii?Q?faVx5P3CjHlnYBc+Pt0cDKhxxk23bmCTBPHkn0UsNTaeW4GFLvWdChiJDDJN?=
 =?us-ascii?Q?At1XlvljJ4JY9QuiDlPlhTl5gbuvoSEFIkiDWxQGgug2YFgJ49+Th5NvsCyM?=
 =?us-ascii?Q?n8SaZe3Zbp02dFt1/Mjp6hMSle0phmK+EHqEj6xwhVKN0s1t4Xisda+Y0BH0?=
 =?us-ascii?Q?xXUooDGHCa/K236tf+fsoY0k0nxQwNpMbG+MgY306tkg6jKnrUsZOM+iYhwi?=
 =?us-ascii?Q?BEJmdkhves5pXj+ZxYaLu7LGVPgYCAaP+7J5myNx26MJBswKiawT6gZUsAFz?=
 =?us-ascii?Q?yff/XPbTdc9eE9AG1PGW4sciRZ3VBS6K/QgwJObkCeOdVqIUcTl+xDmT0C/4?=
 =?us-ascii?Q?n6zNB1CiO/2VXicLwk6l9hxSamUv2fCMV9dUSa7Yt7yjh4xO0bbRMXxdeV0m?=
 =?us-ascii?Q?Tg+u4/BuXuG2s6SiAqwIOf/A83HCUOxEP/0F6JpMFUG3+YiYSQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BTUDt7Nqui0Af8useTQIRAvBFcyDfyAepid/XG+SfxjNzI2MbxzGrC6ojveu?=
 =?us-ascii?Q?WToMv+9W3x0wj5GW5s9sG+qH1TUkGpUdl82GZdKtOcOVCB3bRUsfgFDrMzaA?=
 =?us-ascii?Q?4O8/kdHq6YsqA5Zc1wGOTp557DmIroEBkaHrfnorlUhNfC2eNp7ZfLEw0Coh?=
 =?us-ascii?Q?T3Rc65oHJZJrBnQUOaJVgZvUaliBRG41rrhZVhFWDmwv7jLo+5ghLOyAaH9W?=
 =?us-ascii?Q?EOtQsh2pTTM/wq/qERuA3MW7hF2PlEDDCngtg6lQk3dlIbP0gWkiHZBO6sPP?=
 =?us-ascii?Q?V7lHi3eQ7OV3n6SXqGq9ZUcwFu/sNi36NYVJu0hR9Qojl+MIi5gkvi2h//sX?=
 =?us-ascii?Q?9LaagigIbeE8XW9r1kCMfeTCNfoE6ap9fbUv3AcIU9/EjhQ6t2YK0c2MkHzP?=
 =?us-ascii?Q?aPnGbdU4tSXamGlIFUGkyK0FG3Fl7L2egryOu/FS2qH63EbFkCxb21YCxkHI?=
 =?us-ascii?Q?KZQgHKbgp1oluHGmvlwICIYWoeeIE24u+sWulrSTvqu+TIMGV5waDzRbtCBX?=
 =?us-ascii?Q?PONRBFHq2dMMkDVd3RkBzyttG31VBoTHvo64X2agI0Kblrwlpvb2KZkV7I5s?=
 =?us-ascii?Q?5q4t/uwR5iuUV+HXqzj4C3HAjjECfMAi28cuJAS18vv4dGrgMEgH0pJ1O8p2?=
 =?us-ascii?Q?IEgRYy8CnyasR7OMWU3JIeJRDY7M45zew6b1TT+9lPwHRweOAMHm+Vvs/s45?=
 =?us-ascii?Q?bQcpO3G8/CgGDmz3oxMUdaUi4dLKrGv/s7xjVSbr+GYcfb18pjv1WTqHaDG1?=
 =?us-ascii?Q?i1BxY/2xY2uV5TgQybiG3my4qnGDVmD5COx0BaIp65v2crG6ouUreT5Tj3Pn?=
 =?us-ascii?Q?DvtJUJjTFeX+92pCKI9BhiK0rYwX+Ib+L3hQj4h57cqZ5hHEBUR1BN/WkJsO?=
 =?us-ascii?Q?2XzQ2t7em/BiHFP/RQieNltxheql1OZhfT7mq77fwYq53bW2y5FkWUJ61Pk3?=
 =?us-ascii?Q?CAI9nfyyPe047bgtyXMzXa/yu5D/63kcYwWaPTASrSJdryVqj8XXrwT/RRpP?=
 =?us-ascii?Q?M3lqJrRGUY/AVxx7Qe6SWOtF8qjJKXodblwTlbJtsb3+ItJb6R3cz7OOePFd?=
 =?us-ascii?Q?5dUlOp7eVrB9UN20z9QE5wSgQCmdMzWBb32S7EVuS0+J5xihr77eooPkjDaJ?=
 =?us-ascii?Q?eGyIGwo0UCd+xdYNTJ1pdkv3ITskeOAEnqCf5pLH/wwf6gXBd3kgiq1bMXSc?=
 =?us-ascii?Q?8UBN9u+4n9irYs/t6TDJWcm3JAsHHJAxLzC2nCAv/FiF7EkVStu4KVh+u7Nz?=
 =?us-ascii?Q?MYhA3rmhPnlYe1aNU/y9vfBJUSiagBbAWiztSr82CuU/o0/2/qX3MMyMFQcM?=
 =?us-ascii?Q?nBQUhET0KAExcrbF+RZui/QMyogZDmUsSCqgwsf7c1PrgM2BVB1ToHFLJu/q?=
 =?us-ascii?Q?f1FSCrqE3N5AIwOcRlnTXJrDeQ1JCR4Y+nnmtLgqYEmhRV5vDcw1ZlsrRoWY?=
 =?us-ascii?Q?Z/z3q5Zei6v0HLJjCeLmltCoErI0K3cYQUWNN9qNzj6OVKOly5dgk6ywEgFY?=
 =?us-ascii?Q?IFw0vra0qwqL+arxTsDYHctw93QT8DCghU+heogSFkCB5XokPOqvcTLafUmL?=
 =?us-ascii?Q?/Z69ElvcJKzZqwf5JJukZu49v1naLCXBS2OFaKIyLi6J4lJG+rF85hhXfbqC?=
 =?us-ascii?Q?zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc321d7a-16e9-417a-905e-08dd183e6a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 10:44:10.7494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XG44rm/AQ4kWTePoFt/olFxCR+vaeuhIQH0Z6xtiWEbtCreRB1AC+MC4C7iAGVXwPU08la5BgWhVW1o/Ulqn+cnudSVpeOMj2dZhVzkLZz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6073



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Saturday, December 7, 2024 11:30 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>
> Cc: john.madieu@gmail.com; linux-renesas-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; John Madieu
> <john.madieu.xa@bp.renesas.com>
> Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E
> family
>=20
> Hi John,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 06 December 2024 21:26
> > Subject: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E
> > family
> >
> > Add SoC detection support for RZ/G3E SoC. Also add support for
> > detecting the number of cores and
> > ETHOS-U55 NPU and also detect PLL mismatch for SW settings other than
> 1.7GHz.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> >  	data =3D match->data;
> > -	if (!data->max_register_offset)
> > -		return -EINVAL;
> > +	if (data->signals_init_data) {
> > +		if (!data->max_register_offset)
> > +			return -EINVAL;
> >
> > -	ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data-
> >num_signals);
> > -	if (ret)
> > -		return ret;
> > +		ret =3D rz_sysc_signals_init(sysc, data->signals_init_data,
> data->num_signals);
> > +		if (ret)
> > +			return ret;
> > +
> > +		rz_sysc_regmap.max_register =3D data->max_register_offset;
> > +		dev_set_drvdata(dev, sysc);
> >
> > -	dev_set_drvdata(dev, sysc);
> > -	rz_sysc_regmap.max_register =3D data->max_register_offset;
> > -	regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> > -	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > +		regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> > +		if (IS_ERR(regmap))
> > +			return PTR_ERR(regmap);
> >
> > -	return of_syscon_register_regmap(dev->of_node, regmap);
> > +		return of_syscon_register_regmap(dev->of_node, regmap);
>=20
> Basically if I understand correctly, you are going to use normal Syscon
> call for register access in PCIe and TSU drivers. Is it correct?
>=20
> For example,
>=20
> priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "syscon");
Yes, that's the idea.
>=20
>=20
> regmap_read(priv->syscon,xxx)
>=20
>=20
> Cheers,
> Biju
Cheers.
>=20
>=20
> > +	}
> > +
> > +	return 0;
> >  }
> >
> >  static struct platform_driver rz_sysc_driver =3D { diff --git
> > a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h index
> > babca9c743c7..2b5ad41cef9e 100644
> > --- a/drivers/soc/renesas/rz-sysc.h
> > +++ b/drivers/soc/renesas/rz-sysc.h
> > @@ -8,7 +8,9 @@
> >  #ifndef __SOC_RENESAS_RZ_SYSC_H__
> >  #define __SOC_RENESAS_RZ_SYSC_H__
> >
> > +#include <linux/device.h>
> >  #include <linux/refcount.h>
> > +#include <linux/sys_soc.h>
> >  #include <linux/types.h>
> >
> >  /**
> > @@ -42,6 +44,7 @@ struct rz_sysc_signal {
> >   * @offset: SYSC SoC ID register offset
> >   * @revision_mask: SYSC SoC ID revision mask
> >   * @specific_id_mask: SYSC SoC ID specific ID mask
> > + * @extended_device_identification: SoC-specific extended device
> > + identification
> >   */
> >  struct rz_sysc_soc_id_init_data {
> >  	const char * const family;
> > @@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
> >  	u32 offset;
> >  	u32 revision_mask;
> >  	u32 specific_id_mask;
> > +	void (*extended_device_identification)(struct device *dev,
> > +		void __iomem *sysc_base,
> > +		struct soc_device_attribute *soc_dev_attr);
> >  };
> >
> >  /**
> > @@ -65,6 +71,7 @@ struct rz_sysc_init_data {
> >  	u32 max_register_offset;
> >  };
> >
> > +extern const struct rz_sysc_init_data rzg3e_sysc_init_data;
> >  extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
> >
> >  #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
> > --
> > 2.25.1


