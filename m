Return-Path: <linux-renesas-soc+bounces-33497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S9ZWLkLgH2p4rgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:05:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B56357E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:05:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=hBXA4XMu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A316630C04FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 07:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DB13FE356;
	Wed,  3 Jun 2026 07:27:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9719D8AC;
	Wed,  3 Jun 2026 07:27:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471655; cv=fail; b=YG5ZhdGJ/Kg0IGILytTdBRggn2+DoAY78suEe9xIt5Cugak4tKAjY3u4p7Sp1vZVfidyWRjDPaub/3I+RnpAnb2ILuuL8h2BSVOqKAd0YAWXYlX7dAW9R6HNakg3AjLBYTdyf6ZKgHV8SZ3cKaOqL3S8km6P1Y8QXqijXAwceQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471655; c=relaxed/simple;
	bh=n0/959W8pdJI0f3EdOWmdEv+zw1Zyp1KEImkrLaQVI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZLdMcFwdhL/ykpai6S7MCoOdwZtSKlBh7hDTu711sFe17816djlqUgPfTpSCcSqhkcUPv4wShBAvZyc+x9ZtTJ09do5I44bhf2PD0OhqYI3ST9lc3Ja79LusiJaMUAsxg+e0yRtAu4bpYnHtHo2lKBVHb7/wtTSj/794ppvwx74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hBXA4XMu; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMNien3v3PbG4dwXkyG1UooteqPReWrtttou82Uz6cmeOgwiUGa8CeDMOHDbH+o0qEdm0ILCGOIBqfoblYwkAEpgQqZn8YjM8wfuJ0/8krhUPpNzMU8tMsj2IAh/KMA9cKOfymH5VapxkrMC51SPmyElhlpS3oQsJGCnp4qB5vxlOvyg5ktXDj7M7zIHRJ1v9BsdzA8PETnrzotjPh44qTZF7fTvpu5COGZYqnDary2u39dIA7wwyLxR+BxIwXM1cBg+uUgyXRngRiM7GGrvQ7NXR4R1s/sVfZCUpf06GKkFei8Sgxbnv+yzjb+cHUFuOEikTLUHqx0WK87Hznb2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0/959W8pdJI0f3EdOWmdEv+zw1Zyp1KEImkrLaQVI0=;
 b=NEkqK2lnVgVSRegLDPpxLMin4wWPeRS4/84MVVmP7blG6nDlI+qRCJhWsEABwJ76lsprm0BFpj4OFfrWCSWJfrgVm75XXgg1nX7Z9FaT0RTIsEZz5fsNXMiOZnwMgOjtZopIpmBdITc+t3puwpng5fxUfvjhSFUaG17yIBAJtUsBqjWavM/C7JUi+bWCWC4QnKBPEq9BXb+OkcLP34tInL+8Vg9+2qsZPDFIK5Yicdc8PjdGaXLPqyj5Kgdo7K7RfrUhvZKG3EVLtUYKGKQcPppv+sSG/fhEMjp0u2A9YFAA5JdjKs7W00JMtYZU+vEEEX7Q2BEQbGD6FZbqsgRkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0/959W8pdJI0f3EdOWmdEv+zw1Zyp1KEImkrLaQVI0=;
 b=hBXA4XMucImu9zyJyBeXMlHDH0m95mSVkRmEsM5w/tu7vnS0iz5oscsSMdD1Q4Q0sluJNrgVn1p0smqHQyFyqh5Wi95RPz3Fru/1Gi7BYXVmmVyRFS5zpR7Pffz12Fkly9Qs3fJ2msMGcfbbNoX5IJg8L5ygmozUOyicM/rXm/c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9543.jpnprd01.prod.outlook.com (2603:1096:400:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:27:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:27:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHc8yZFMuP1bVIRGUixq2TgdBuPhLYsZmtggAAF44CAAAEkYA==
Date: Wed, 3 Jun 2026 07:27:27 +0000
Message-ID:
 <TY3PR01MB1134651DFD308D3DD8AB20FE386132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ah_Ve65DvPhlTZ7a@ninjato>
In-Reply-To: <ah_Ve65DvPhlTZ7a@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9543:EE_
x-ms-office365-filtering-correlation-id: 66a4e797-e97e-45a3-a00b-08dec1419094
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 mKxBFer1Xp5mGIDthr5NVl7owyD+qh3brY6yfcGzN7vi1mBpTICC+kMDW8BQPPSNh4yUUzX/N/4R90vm7Yivw7lgONwedE/VVfJAPWvedruI/hB7kS1Rf0eDOhU5sEKDuOsyPyz7RGv5GcY+F6Nth5FH+FI4d1+pxEXHil7+Xsn+IZRsp+MPe3QB5t/HwF+00anEY31mV6RP4XkfrS9j+HJpw/kaYDH5TuJcA+ykHzCuBAt2GtsVBGbKnAN1b2GtjJDSdGPD8hY7U8r77XINawEKc9xZ79WpUnrA8FfqYhKlM4mgyPLZpHL4VRCQwWdnCdeUARvPn9YeaYWLSziZ3yMl6dc9fUC6L1PbQCGSrN6i8APZOS+G1Ufu0smz2LbdDRSqsTim2Gs4I07Ns6n5Wf/1xZRyuyzNcW/yACE4gip0IqkZeXABk1g2CdfHZlCuAI2pLVZaU3PtLCGZz06ZOw/fnWBpbbd+/fVJEWjko8Ug6o7hGQaXGX+lIp6jA4+sf10wsnDVWOnOyLfRUBxH1j6fOeurKD6MAeJgptuuJEBD5lgDx+9IaSaatxTmg87QIiEgfPQiLG+P8JPkMiiLWGzBFBB2ZXClAmelI5//YVHiBWQ5o5hCMejMSz9wChy+P0bLX843Skb/t7xOZDFD+5PCnxioTMZM5HGmg3FV6pQll6iHRhgqYn9cW1tBiNCHtBH69gS/5VKldbD9BXTUGi4CUgjNF8SEgnAwWtUOuCXqCWM0XQYRr99IU+1ANY3a
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DS7ABLIMPQeJHddM8FXtoZ8T2Q9e9oy3SvXrFXnIAHXZbTpBExZOMKDcxx4m?=
 =?us-ascii?Q?vCQzG32FYrOxEvsznYXxgG4f0SYqBCMUulQ15Q3sQHa6TRilL0xGRvgcPyiF?=
 =?us-ascii?Q?IEG1wh2lmDnflNwGmxpXQkuhjaqfjwHvo+EQ9fV89R6mzrLrhYdeYtsnB9BN?=
 =?us-ascii?Q?5PQ0f6JMbeI1zmf4+9hSNbVex4penaSJRGfA8l9rKKr1Dbt1Cj67wUFHRT2P?=
 =?us-ascii?Q?JIyaZbE57Xdyy1qnJ66ryHHHoTTCtk3+kuqYuLH1dFSWKVnakqsiAbj/m0Kg?=
 =?us-ascii?Q?AhkhEPynI38ASUBPqP22icw+QEiMHYZVJiLnQQqMgFiQUIpvqZY4zDIzC9kp?=
 =?us-ascii?Q?7PptWgq+Xr9Fst2tOroKwqE5XL6UCLfKZ6HmIkiTXB9qXEhHkuYdqXo3T+9J?=
 =?us-ascii?Q?Q5pzIR5ozmL8fBqSk52JCcoTFGbVEv0wfRArdTqZDCpyw054yu4iFFCK6SmB?=
 =?us-ascii?Q?3jzPRHxGIAsjfUME2uwpia71SGqSYRfwF+XGyIVN+YYn/e/5TF7I/cA6g7Zh?=
 =?us-ascii?Q?lqpZxQcrKREzKxigquv0/EdP+A2QDtdEe2LX92wFft6mDqGXFcYph9zG7huA?=
 =?us-ascii?Q?93OmzdTts4ENOl65VB6wQtbKbA+UalzC1xrZQChxl5j4VY+yN0ixw4Nqnvud?=
 =?us-ascii?Q?AyoGbhrYXJzqWSsa6bcCNIP2PWov2HmmfbyaMvKi6yrT2/2Zqipkdt4++Si/?=
 =?us-ascii?Q?ThVPTni5bY8ZuhS9het8FJSybKH8VSCxrYTmgX73DW5t1W1fKhNleEAAnM40?=
 =?us-ascii?Q?COPDFSHQoKAk0z9woyNzyb2L2PSLLuQgZpyYxrW2IOS8WGLu74t9ivy5KPd2?=
 =?us-ascii?Q?w+HMDHRlqnHUs7uXbbRgQbPzkrJtEf3OPWFJPdd9VG0YHF8rRPv3Mac7Vj6s?=
 =?us-ascii?Q?1lRKOrPvYlreaIhPYDEtrRKCx4qyOPIoU/Noa9pn+kETdmMs4Z2gbTh1IzVm?=
 =?us-ascii?Q?TKnnC/5Iu5d+L79wyliOsHDgsB/seG8qnpqhPalJhJmOAjGu4GGuAWAd6jYf?=
 =?us-ascii?Q?lxZVFJroDnPvi4oMIlnDRDEAZitAHVw+XpgdX4SF5LwqQ5tV9HvHbs2MtTIP?=
 =?us-ascii?Q?CZvsij+ZEkieB2pt3Qoe+d+OiS0jz9+i2CAwS8iY/QAYNhTgXORja6HfNfe1?=
 =?us-ascii?Q?+XhdnceogzfQoIV7Q+Bjr3admiDTbHRsCirw5bm1AO7tgOytYyOgPZ68osrz?=
 =?us-ascii?Q?oUJKJMgDyD24mqSIvVKUAF/Tvsy8G43CoZ/00RxPHdkZVQ9bRkuJ87XUhp96?=
 =?us-ascii?Q?RGTbcEYEsaZfRSrb/EajiyLogRZpTjhNFeGgBKW8MNQC00vMPlEsAv+PIiYe?=
 =?us-ascii?Q?bdjVl/RpNRYMbw7mxfMUIDF+wDEYCXY2p3CmivMnmr8qOL7PGK6msNR9Wdu2?=
 =?us-ascii?Q?KGchGbtMw+ypZpXaEhMj4Z5iMNXLgnJ37zQhX2KlOerxZaK95JDE6xUfQPq8?=
 =?us-ascii?Q?SgQpKcfMtU441wOHP5wuvWz+tqPYb48z/3tyzYhwzAG5kF1/bwbJIR5Y8ag7?=
 =?us-ascii?Q?JrkouJmS1LF46d0EMgRg5TcldQa3kVdS/2gSDtk1uu4r8xVRT/TEGAVa17A2?=
 =?us-ascii?Q?Yz87NRrCvZa18BlT+dkLnYdGbxY897/AwHA0CeQXlaUM0ZQsD4f6836sfdcq?=
 =?us-ascii?Q?bvvwqB7bUenfcxE+jz/2yKYJlm0h8pabF7qmAVfKb+hd9q5LWs02gh1TF7iz?=
 =?us-ascii?Q?Sl6QVIzkjXqBJ/Dr+uyT/3nPO8JSHXmttYIsUvTh5fwz/TNTYHXamGDob0OO?=
 =?us-ascii?Q?CGJ7J199xg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a4e797-e97e-45a3-a00b-08dec1419094
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 07:27:27.5446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKQwZBy33euGOh5ldg0C1BqTJ00RK0nClgowQUHw7NSLGKbuMwnN9RW/H+fqypeotmNlmx8fJrpPXQ+b5XZgCkUwiAW9T39xR4qDNFLzjZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9543
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33497-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B46B56357E4

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: wsa+renesas <wsa+renesas@sang-engineering.com>
> Sent: 03 June 2026 08:19
> Subject: Re: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
>=20
>=20
> > I will fix the issue soon.
>=20
> No need to resend from my POV.

I will wait for review comments then.

Cheers,
Biju

