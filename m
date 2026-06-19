Return-Path: <linux-renesas-soc+bounces-34227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id imCYCxXtNGoOkQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:17:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A056A4498
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=E7DVPDKf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EDB730134BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 07:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A5B30DECC;
	Fri, 19 Jun 2026 07:17:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039540D579;
	Fri, 19 Jun 2026 07:17:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853458; cv=fail; b=jLktcopAEfnBQoRlcb+6QMgQSwFwzlzriZoGTXi2gXGwQ8cY9F5/MUauWoGNIKt5XwTO7WZj6yw0nwGI+fnRqzUQvUyvawkBcI73VCm6DO4N/Tw/G02RP6I6NBn+ad2/p59M6Y3ZXkz4shqGnGavK9Pb6FkVf81dtAyOSALyRck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853458; c=relaxed/simple;
	bh=hNHOPKl+DqnxPLrX+GG/LxlKlKDIq0nlt7KqYjwiowE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f5yVfhpARXB8q+knX9dLJOpUPZ3pphyZUYRubPFSdDf/Uc7xLlS/szEh3weAen+uPxtuZZL1SvT/kqDyCpgizjHPkxaam5iyqAqHpqjjPAmjpX0vqvn/UfrrdjUfQyD/ir7dGe6WDqS08YIjshY0aVei7q7wkcOvetyyIqMxUys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=E7DVPDKf; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ijf7rVLyjWUDEKl58KcV4rmMHNvwiNjRXEUARNmy6P7Zyo3Yt+jMOl4zFqT4EMxAF8mtG9FhKfF3u8ZGeTnoWN6JCZw0aioT1rL1YfPZjeJ2jP8QBD3Hin8EoYwDhb2uTvJyvmzfgG7jEXKoeSt2B6Dn6bCSbI/xgwiGSSBk3UKfJkPdWpB6QZBACLbnMNfthGmh1OVBCEHMmSuZtuJJosOjIW0wmbRXE5TXC18od4fJUzb4yImSTMwk6LYKX+swpy3SsGs7+Cb8SrbRhYFp99LXKg5ArCSh40RaeJT8TQtEFRmhGIxEAh5BUMfLVNr0hCOl8VQYRWDe7cDktreCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbunVF6ScPoJ9DhwbSTuRRXoP+bYW5bTwoEgJmtvp18=;
 b=hsvI3I2m8y4rX5a/6yvwpk/fhWn+kmq2cpgco0Cf0BkQ6G6mUg988wMJtdh9cz1hOprpFC48D7KfAY69/bxCJVOn7EuziiozWEgbxXcTKHHd4tA4knZ6771CN0ioptG7CtBUC1HYinMzKtLpL9r9/Yo7Wu6hp4hPqFH+c61FQY5mWbVHr641dmNTmlLIlRUnsyfP6J+luPYUX7z1XjqfH7kQlDe7+/k7xeYQ0IeImMGq5QA/xgnUB1oloJuxXjbxc1h9MHcs1s3XCg9sJMF3fJf1BWWcQb0ORMR7mqe9zd81jon42i5HGYxOJ+gPdcP3E/+qz9ePukebi9LXEIromg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbunVF6ScPoJ9DhwbSTuRRXoP+bYW5bTwoEgJmtvp18=;
 b=E7DVPDKfVqVIjzlv6ahuWLAcrEysbcY7wXho3RjjBUmypGeJtdcfOYJM8gH2UEdWry9WcMCK+V/nKq4UrD1oMvVnwkCaMZ31ROg+w4E0T0PRIlBSjB9EK/iwhwSpP0XXtDXj8RCL6u9tnUJZPGaDRnVv61ORz3o3Zhaoqxwarao=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7829.jpnprd01.prod.outlook.com (2603:1096:400:117::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 07:17:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:17:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 01/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Topic: [PATCH v2 01/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Index: AQHc/X00Rp5UASHd5E2lstyf79ZmrrZBUxOAgAQpBSA=
Date: Fri, 19 Jun 2026 07:17:24 +0000
Message-ID:
 <TY3PR01MB11346191F666BE1BE2B19D61A86E22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
 <20260616104459.410743-2-biju.das.jz@bp.renesas.com>
 <20260616-velcro-collar-3e764c6851da@spud>
In-Reply-To: <20260616-velcro-collar-3e764c6851da@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7829:EE_
x-ms-office365-filtering-correlation-id: 5e31787f-57e7-4d61-ecf2-08decdd2cfb7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 eQKn+5YVmXC5GSJA1xByzT6YYcjCeFKkV72ICopy45sS8ELYIgGA6wMAZJoi6B6oYheGqJmcRUwHKPezvD7EMy9/SuAGKQ81eJeKVH3VCyLHmWsdznFVdP0E0kncqm6ZXl2wtQgHueawoeZM00enx99uypUjzpESQuIO4YC5hBMfdrPVNL4YcjnN6pvuNMDprhreMuTQsLwUg2i70GPfq5Ww7WJ3UFme0aZOlA6BCgWW7qX8lC47AKxb1XLFvuJ4FuXptpynmn23vN7Lq77XhLhWJ1NQZWSvxOVUFEsF65+6WuKDkxLHhnQfkTK6dWk/4SRBtVEJqV0qbktxesAJHlQ/g8gWui9TrbKo6vhyuJycPLBEFKucGxkCfOImw9KA2I8l280JBEilfEmSYpvDNsJwtw/ZqOIuxqrFNUIolTT9UXkne6yiwjTfNMYApAkBm8mTDm/WL8uaLx+8v/BYoNthFtE+WxblP85SoqBIBXDuvhqMgYZJwf/jcWSHBgWhT4SMSnKbfjhkeIxXHuBEguMc4mLMzRj2SeiN0iKIOF10ZliJkSl3b10Mugn5hrs+k28+Y7atq5rfnvH1etdWo7Y6krsXw4OCtFQUSdBwsOS01b0CRSlsa1qievTT/8DPCS2RpNPfaVfIFdQ26D29VNCI6GTmF/ONa3iaYy04mOOYHd5PjSnCrG3S/IzdIx8MhzoDAvPd/Su6NDJjptgHdkwdZj0xDFYfXR4c03ZC0P4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Sa5qZo5CYLCbvHR3Ga3XAS3GUgsdBiL3a6M2TiIlXRq7P6k/+PT38OWo2eo/?=
 =?us-ascii?Q?zUxUhkwor/Dd/wUYE0Sw4awdKijYko8QjI1vE4KCj1zG5dXG5y76WMfZ9lBP?=
 =?us-ascii?Q?Fz9FeTpIchvkLMEgchwD1A2Si0ifOohIJxGcmL7KEGg4vJyo6SUvllVWBi9u?=
 =?us-ascii?Q?HsGZ1/Uv8FmRlAZaH9vQG934AYkvxlBnXbo+0tBU6yFlugIK2dU4RK89/dDT?=
 =?us-ascii?Q?qtIii8+mUOfuALmeoggTJwXcPjv5aWxA4AJGrSFj0142gbGBBzebKy5Q5ziY?=
 =?us-ascii?Q?Ydlh2TYVf/1Jgkq4R1ei3/QS4694lbkp3Os014B8eH7eLggzGHVZhAGGU+Yq?=
 =?us-ascii?Q?I2MD4fu8KokRXe/cXA5zAAdMNQzkW4lzukD+EvA2Rv25ZDZeqFSt45SUBQqB?=
 =?us-ascii?Q?OrHqaEefpVqY5Z9zR5IzUtifT4RZW+5JCc1OoOcnkGpRYkwCadLOCN1+rxJN?=
 =?us-ascii?Q?9ZVCzAax22RLzh/W+i4G7T80skhAu4pOH08em3waDiv0efpdsFOv3kIhXQk+?=
 =?us-ascii?Q?ASD/KbTa/0NWQdfkPMfM6NDPHZ2VFheSACeM+6t2syBmxMHgncsk8Zj3IjJe?=
 =?us-ascii?Q?RTjA8KI2Kb+hESMiKb4CIy4ht1FPchOGq4W5kBfMr8ZogmNxhW/vzqLRVpM5?=
 =?us-ascii?Q?KblUpvgVcu4WM9CM8GGW8zLAjCpqE6tf8TonObAW+BLk68opXqPPaOJwqdHj?=
 =?us-ascii?Q?u/WO/EinLB/QFzdnKPvqXn7Vo8tluGnZkUG3BsU6R1fdwqAaz4C415EMOLkJ?=
 =?us-ascii?Q?jOQbobdVXDWoFOlsJl9vfc9KdyCzWQBy+9tIJBOZp39OyJaZpOZSfWZSjUel?=
 =?us-ascii?Q?MS+Gycbbnf3sBHmpQPzFiRMgxLfN6oOCdkCbXfveGib90xrHFYPNqrglxaEa?=
 =?us-ascii?Q?btrkHbdP4+cBOohCtyGQ8mDgdYXIXz+fQp6NtydqCt4bUWWJo5S/IwOEt3Cc?=
 =?us-ascii?Q?/0RnRehuAfa/t+qIXW6ISaDT1vcz8WeTpuKiMSQDfMW44JeHVZ7JW9+wepVv?=
 =?us-ascii?Q?6niFsvQLazhIPCV8f5/w0nO+UUA13FX7eyn542WP1AQrqpfdbRZ3UcrVT3Mt?=
 =?us-ascii?Q?n5AlKSPvEtXCy3Y7X7mkyht5rait5sWRohxKaf/PQRPPwdcT5MYRrykLC7Yl?=
 =?us-ascii?Q?4N0jEaorEy3TL9+kygYcGav4TGXGoYqdt6/Byu3EvRci+2iSwlcBeFUfWdCR?=
 =?us-ascii?Q?C2rjsdhOfgCMHeOBLllcFI/FkzrGT3g6w4cuPD7AWbzt97kCrbNb4pF6UvH3?=
 =?us-ascii?Q?dJ3mKEGePnO4/0rG3B3mTUsNWeQuBj0mDQ37QGylWtRUqkZDzaHqHeFXBIAO?=
 =?us-ascii?Q?PAiGjCpZOCV3O7whL3iHp23oALzwSoHX7EbOZiAJ8QNWQwJ9ItAtIuZJx0NM?=
 =?us-ascii?Q?2vEAvKT0Cq00/7Z/NYU7PdxLbj3iu4gOU9SR6tesve77IQP4YufofEJqkG7t?=
 =?us-ascii?Q?F84+zOmVuZ3jOAO39o+h+mK0+IoWzrFaudhHSwvz4JMbgL2dlSCq9bXRL2Vf?=
 =?us-ascii?Q?vWv5XVviJRnwnlgVZp6ydqod05VNMFulo6rD9BQmBEzUqd+eGFch2Y6x/nEM?=
 =?us-ascii?Q?++WuttiEaoaYttIeZhZjRXtMI8hjO8c5ZdESBCR97MKDmYt67FoKxaDSG96X?=
 =?us-ascii?Q?9XZEku8AQMBg4bNMWcWLjlTbbbkhDeMTpntnsqZAcjXOTFUrzcdjbc0/VADF?=
 =?us-ascii?Q?krkqlgNaXCUb0xtuL0an80B36rejXOqMYDQwY/Yc8cEg67GTLWWJDoC7PclD?=
 =?us-ascii?Q?Tw3rNny+nQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e31787f-57e7-4d61-ecf2-08decdd2cfb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 07:17:24.4867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYY36IiEAfMAIBxIoTBN8eeW/FgmKPoiCLXKqQKwJFGmLLre88ix/HudsjjCJ0H5GzN8piHTnGRJSSHe7xAeYHYyY79HzgcuWzkzgH+qFFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34227-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58A056A4498

Hi Conor,

Thanks for feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 16 June 2026 16:45
> Subject: Re: [PATCH v2 01/10] dt-bindings: reset: renesas,rzg2l-usbphy-ct=
rl: Document RZ/G3L support
>=20
> On Tue, Jun 16, 2026 at 11:44:43AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
> > The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
> > port has its own OTG controller, whereas RZ/G3S only has one on port 1.
> > To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
> > and vbus1 entries instead of the single regulator-vbus property used
> > by other compatible SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Updated commit description.
> >  * Added enum instead of const in the compatible section.
> >  * Dropped regulator1-vbus and added a regulators group node.
> >  * Updated schema check.
> > ---
> >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 49 +++++++++++++++++--
> >  1 file changed, 46 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.ya
> > ml
> > b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.ya
> > ml index c83469a1b379..12da48d069e5 100644
> > ---
> > a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.ya
> > ml
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctr
> > +++ l.yaml
> > @@ -16,13 +16,17 @@ description:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
> > +              - renesas,r9a08g046-usbphy-ctrl # RZ/G3L
>=20
> Looks fine, other than the fact that the "- items: - enum:" construct is =
the same as just having "-
> enum".
> pw-bot: changes-requested
>=20
> Fix that problem, and

OK, will fix this in next version.

Cheers,
Biju

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
> Cheers,
> Conor.

