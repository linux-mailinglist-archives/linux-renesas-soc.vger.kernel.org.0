Return-Path: <linux-renesas-soc+bounces-16048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBDA8B48B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80AC6188237A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 08:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C63233156;
	Wed, 16 Apr 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EIDnzoyY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A56233150;
	Wed, 16 Apr 2025 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793926; cv=fail; b=eIispAF5OFaCI5vDOZ9C//O8lQtq8ExQe/ZNwM4apAefZpOIoqYSL5RCj1t5mOnLHiRRJFMY26LIa1KYju7ljazeEdPmnswX2ccpt7WZDUgkVRb6yiEd9jOaU3Nlt4zUYAEqW5TmmCmgiqlDLGevx+JEAAz3ZnOaghDX/lCApk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793926; c=relaxed/simple;
	bh=8PhqpYlB26Vjri5NK0d9FHhh5v/zcl3RFe1JVpmL2Fg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HaeCIFBQm/F6QkYCVtBSjqVVBe3eoN/8cJONqYBAsOShd8+Tx3n8YUJXfzI0KsvFoDxKaEVDZJaLsNWP01aSEnqDmAsCqTQEDrZYb1yOo45JqJmYq/kP1dHfDA/9Rq2KiNsCQy/O8mKu9chPWpkWdCLEtG0GrQaHLfSPfxSli8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EIDnzoyY; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nP73wazCFhXw0cwKrkTEQjCAjt45P3EblGxcp6duVd3JQPgZKCBlxTcukPS8p93xNNfWs5SMGWRYxA+8WA7DePkaNj+CzPaEcTB9bBLv8AbMXJWUkMmOidp+8Kxr4tR34v85xbF3imI7G9zRZOJxKctZI2g+aMbyK4kQ8gOk2RNUT9ffw8jSRm5G721GeHwpZbltA0H1W8vLsveO9lTMnKkn7eNcvTxO8Ia0/O1SYEZRH5meVYs5HA09+HQco+nSxexGk7aHgbSMZoN7v/L9m989/axhovV7F8d6OVykRGaUsYTZhjgxdPlxdnlGql8iJaaUJauoEsSFnb342YU9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNFbbs9bP/emuAHA3zcrXSG7aZMeg0LLWKn/uG4sUkc=;
 b=LjaSqAN3pPZFrmluc6hdcUOQ2+VP1hwNpVm9XCxjno5GYwO6o7zMXYoIGORulQkSB0HzahFsgCNW7FzlZ2BPJUpVColUeSO3KOgRKDNijfLZlVVfS0KQm0WyqXEAFqeY77wIBO4XtHayj/9fSOn5NFoCfXUUSKdXyIgmD4COcPozb3txRg0tajvATcK0WhNgjxIJajh2NV3Qyc4t6ho16CnUVudFz6q613O+jniRhe/zcOWZt+Jq34jX+LAyhhSKeLHnFHae7AG8er2feTb3cfoJN1EjyiHZ0WkNLpSZUCosBPqSOHbdKo8MT+ZRF/p2/gn5goW0K5+Wbnh3kPr4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNFbbs9bP/emuAHA3zcrXSG7aZMeg0LLWKn/uG4sUkc=;
 b=EIDnzoyYmZBAOy28yqVm0KX2q40gVMJx5gcT7DGah5My1LzwuQ6EbljcYHcBhl3sHizlAIa6b4wyN5k4p7WsY/TdFRk+heZYVWvezyEDZ50J/5m+D6pg5LJcJz+a6MtUwcMVGz8V15UoFkyeFSeAkmnNlLAAHs3tNKu6TArZoJk=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYWPR01MB10379.jpnprd01.prod.outlook.com (2603:1096:400:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 16 Apr
 2025 08:58:36 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 08:58:36 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P)
 USB2PHY Port Reset driver
Thread-Topic: [PATCH v5 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P)
 USB2PHY Port Reset driver
Thread-Index: AQHbrj/Ra8KjoH82YkOzJqqe1fCuSLOl/WpQ
Date: Wed, 16 Apr 2025 08:58:35 +0000
Message-ID:
 <TYCPR01MB12093291405D0830D828FD52AC2BD2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415195131.281060-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415195131.281060-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYWPR01MB10379:EE_
x-ms-office365-filtering-correlation-id: 5e9d36a3-8107-4a02-8f8a-08dd7cc4df6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y6gaBhisZrhbx46IDA1ms61g9CV1fsks6caOw0nHREZrJwpZ0kSD4pH2gF07?=
 =?us-ascii?Q?5dueEGNJlsroqUkr6qDpEaV3ypbRNhWmSxfjsV2ssEMNxi52GG2x9TPWSUqm?=
 =?us-ascii?Q?ganKKgIMa5lXc7AjhA4fCDJr0aGwNh7i1N/rmjw+jpRLm+p7SpVduJuSQLJR?=
 =?us-ascii?Q?QckuLgCyaxOlJx8T8qclh870D+kvVpASxOiQfq2c7DLUTMdfL8ADFHMNPRVP?=
 =?us-ascii?Q?A4VpP99Vimen3KZsa6X8IDKMBZZh1VXyjEt0Bz9h1e0SPoZWPLETNR+2CYI/?=
 =?us-ascii?Q?Dfyimy9QXmGHmuo6qirgSxRsPrwhGezwx+ID8A5h2hd07H8h6nmtZ1gfwvAV?=
 =?us-ascii?Q?2d3DRg1yIxD40QgM4X+s3nTSpca8nnw20X4jhuXjFKWJN+wyj8aJipfaz3rN?=
 =?us-ascii?Q?Eor1APHT8eGqJ/7hQpayWoxL1N/onHqq6IZcPoNNlFxaOOf42u5RAkvFrqpV?=
 =?us-ascii?Q?l7yGyiiTDA2946Hn9qkQX5s2iMA2iK7R3hqpvUtD7t8cc1+QvcF1YYCc1ouJ?=
 =?us-ascii?Q?d6GGEViU9vAtftojnEG68AgpKVIUsSGVvHKa8hwe8+XWjY8tZ87yzzk3juGU?=
 =?us-ascii?Q?Un58zVsJkcpeVSufBK/eIGhHjAlwB+uT4XBFp4VvJ1Et2+RNsn8FPChZCdS0?=
 =?us-ascii?Q?twEgRiAGspfu+lnzyy/CyUFw0F+yqSUS22aTpUEdo6tIa+RETeNXOzUB6V0y?=
 =?us-ascii?Q?fJPYkgv0E8IXlzCEwLzeqCnAHqZuLNW0eb2vxBtoYhYyIqSkIafpdJIa6zQ2?=
 =?us-ascii?Q?mbXy7qg/cyjC8sPCg/zTEFX0KmXWO3U10P+xRfWn23bBonC+vGZPMWDxsjAQ?=
 =?us-ascii?Q?53yo0e/SPMHtKdX06YXTKce3sbSTDQruQ281JTU+WWA0GHUG+C1yrLXvMdzO?=
 =?us-ascii?Q?h012Bjd6PokfjDmSPpt0KDSwhbdh/AZDm53oZP1ZzsSQUSBhpFpkgiHse81f?=
 =?us-ascii?Q?wbMVBDBQVMfAcRCg3HbDcHQKAOy9Hx6/D8Y9CNpRhsGz7oZRySYO/AZM+V2G?=
 =?us-ascii?Q?paqlSp9qnvfqsgtoO6/Q/LurGlE0Wtj/SnxG8b2v6NDcW1Va5UtYf45aJdiJ?=
 =?us-ascii?Q?N1kxhOv+DKLjnsnnKuWunWYUQ/SYMKsLb7CgNcuHmXe4po4NP9Ns3iwRoy0w?=
 =?us-ascii?Q?n/vQwUZcKhPGdxcAR1hndzof0jQ6XLpjJ+2w2IKLjKsZsSdgWBE8eyW2WGdb?=
 =?us-ascii?Q?CzIERyApeQgASJ0PvQNfuU13Zi3o+7FQ+MbbTN1IZTsakC3d8BqmlJMPG30t?=
 =?us-ascii?Q?T5QvsPZdEdm7/6yPftsLy0ZTa0KkPLU9HbCg2DpqBUut5R6D8nQgDwswGgAT?=
 =?us-ascii?Q?1yQ0SZ1xBmKmqkO1FJbGFdMz7JemWX3GSI/HJxJv8w8cudEVpzXjxu0Ya90H?=
 =?us-ascii?Q?RXXVpWJN98LC6MANTPW0/GG3PHQq2bunuWO7l8U2NqlmOFlDmk1eatORV8KT?=
 =?us-ascii?Q?5BFSvJ2XF25ob2LinjpDepTdZbePzNGCzZ0IAFPzvnw4L+eY425qoQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?szdtNX0NCMr7OZDQoqjMUsDmVUrl9UoIT6BFeSDw0aaks09BWrHHAjPuCyOV?=
 =?us-ascii?Q?kB4m48r1CUXkhNF+IMe2BdS+GAUeLZaU0a/XozVdlWlgnLEzc5YWjxVtE8JW?=
 =?us-ascii?Q?K/RWurkDO4DKbCSMDe4DkMZ50WAqZd/phR6gKNY/FYtClnEPwph7ZuSU4Ha5?=
 =?us-ascii?Q?zUWS8Ftcm6UD4BFXWrIQzqon8oElcp+NPZr9UeSxLuI1ShJ7gwaJ7DtIPpnh?=
 =?us-ascii?Q?SCS+H4avpIUrMRBsSoOyuaWvsBrqE/WsyKA3tV+J0ehMXWRQrAigdCb9RpHd?=
 =?us-ascii?Q?NkJ4N7+iWG9S7LKmkBXSpfcg/yOEN3AjFZZ/wwlP9ob+1I8EGSjyrrlVjTBc?=
 =?us-ascii?Q?kYJT8pbueA5+NklvC294Zffn7VN+0ucVZ7xfLe1xxubu44yx+KMIBac+v8iN?=
 =?us-ascii?Q?BtGr2d7Nt1Ras/zGd12MhcypJLLc1dAZ0aexWd12sjt8/D/h8Y/SEk+Qm9ZN?=
 =?us-ascii?Q?89UcQIPueiD4z05c/m8cE1gLBg+5jyJN0W3EoJMVK0smuHyvcbFfiPb8sAvx?=
 =?us-ascii?Q?EUBBjDGqsQnZgcEeypGtYtep2qIQ9OWYtsF50EexS3obPaFPy/ec3CrAMwNZ?=
 =?us-ascii?Q?bwUzg+y+RQJYhKMiRMiFXqtxuhOlRGCgiGqksgVJSysJ8D1cKUyVOM2NUv6B?=
 =?us-ascii?Q?qts0pENePkQYHrKiLR+iAlG7yP00tBCKKQ2+9fKdS2J/KtM0EILuWTmUBBmx?=
 =?us-ascii?Q?GbUvBI5Z5oqbYQkkYiYLDYNPVWAvnNTFlYJ+yS7Pda1DnwytPpubTFZlbt+Z?=
 =?us-ascii?Q?GcmZsD/+rcDDQrfGocg/YO7yoBm91AybLqwQueaeuHdtlqSqSTWGpdjCVbqX?=
 =?us-ascii?Q?th1BHVF80Kx4LizlHh/bnwRBcwrsP37EPWWurJw/s/wutBPEnDgztztOYGVk?=
 =?us-ascii?Q?4Uq8DHlSIImSY3/+fxkhdIW9Zw+xp8WG5SGUVrpjtnlvMjDy8mbpcmLGkvIn?=
 =?us-ascii?Q?zKVgp7xuniIdn5ms6UCWDUX+rEPFWOxVXP03f7+UW94nXL7vvmrrWv+d/PfS?=
 =?us-ascii?Q?1f2ZOtMwkQPO0aH/Zh4z5/tTWG8a6Mj1C3qxTqbEZwnMOV+8kBrppUBgWNiU?=
 =?us-ascii?Q?3s44nKovf7eYA9N8OyqWepnXqHP2n2zZIGJdNxcqyHjU14mXK5DVHWjEMPkP?=
 =?us-ascii?Q?XB538K7aAM0WiLcq6YlRfrwOcBCPOcCf4NfWQ7qMQ66HMwI3MvSezN0o4NtC?=
 =?us-ascii?Q?PnEB4x/8go5O4sKnuLokLTKtiaF8+z4ZRSgWaF3xyXtmvRAPUWmwd533w3Dw?=
 =?us-ascii?Q?sNe6yn+KptiIzOoA2NVzd4hoyudcUYSFG8w1IzWN7HlhAru/C+nYySE4twCy?=
 =?us-ascii?Q?WgEyRvS3lHdhMBEDxhXinVWVOIJtOiE4dcnBQLThY/YQ0p+GNaMVPpLzoCMb?=
 =?us-ascii?Q?slEezfNacoo/6IvJorBeu8hLPRvc/yAg9tp2/t58xJdrn3HQVIUP14uKG7dK?=
 =?us-ascii?Q?2iMi+6rsZGRZQZJ0tjDkPFdQ+ZM1eUpWy6XOKEOX4V3LuKHw9drZbBB+udq2?=
 =?us-ascii?Q?fohL1INBCdNSWP8QP2Y7v7ZBleylK7gLfI5PDgh1k44P/qyIVeOmAJGRvywe?=
 =?us-ascii?Q?NXArgala7JRqwPbssUqplIsXcigkLpK/LqbX62QCQIKGV1sccova1QqEHqas?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9d36a3-8107-4a02-8f8a-08dd7cc4df6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:58:36.0281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPRqdxKagT1r0AfK6mIer8EKaRxe5eTqe6+wetB31XW3bJEQQKcwr6nO7FjHJGkswb2xQPTC5SAnDDCjw0UTL97cD4KArgZZM8S22lnAGjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10379

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 15 April 2025 20:52
> To: Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterhoeven <geert+ren=
esas@glider.be>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>;
> Magnus Damm <magnus.damm@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org;
> Prabhakar <prabhakar.csengg@gmail.com>; Biju Das <biju.das.jz@bp.renesas.=
com>; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahade=
v-lad.rj@bp.renesas.com>
> Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2=
PHY Port Reset driver
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) USB2PHY Port Reset
> driver.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5acf50fc6af..a8d8eabf9ecf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20684,6 +20684,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
>  F:	drivers/usb/gadget/udc/renesas_usbf.c
>=20
> +RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
> +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.y=
aml
> +F:	drivers/reset/reset-rzv2h-usb2phy.c
> +
>  RENESAS RZ/V2M I2C DRIVER
>  M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  L:	linux-i2c@vger.kernel.org
> --
> 2.49.0


