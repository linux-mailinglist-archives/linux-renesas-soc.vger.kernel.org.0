Return-Path: <linux-renesas-soc+bounces-27131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHuzI2Pgb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:06:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 007874B006
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1041D58E215
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEF63BFE2F;
	Tue, 20 Jan 2026 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MTgGCC0r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943034B693;
	Tue, 20 Jan 2026 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929645; cv=fail; b=NY5zlBedxzzXfbsmhp1HENacMYBmDZ6XzX/YZuBG0roGBwDiUat319TkK97hOAt3lcAcmah1zPhf/exwOQHQkg1WV8z/RfGXM08ty63PzXsgqaz6Kgy5ix20SLw2Ji/z/CMtJgBALvg/9Sh5PAWp3tngLqEgvVkYYov+050Mhxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929645; c=relaxed/simple;
	bh=skU8QXVIYdch+f1Rlk/B/4cuDVStkuthVvs/v8khi40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wh3HtVp5bFgosh/eFJD2jYhqn1fr719ywlA7tzjkABIXwOTQC9gHjjepc6Se9DqxGPLF+VBKNKzLmKO0GGkTAHmDdwFvgaEBuGX30BmB1FbcrSMFtXdj3zWHJFKuDkckeqsWVKFPMb2hw3XA33JKEUUhRGWUSEuv9/qKbfktrP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MTgGCC0r; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjA4DJB98JU2Q2NiCDgPhYho8l13SWTHND20o9321kbA5rYb6cx6fPe5LNGEqjFR5dT4SiolpVYDaQRYrxZQLBSXiwgynXShsxOYQgGZOGtuEV0zCBAOA84Ya2vDA6D24ZlUKY1WwrEKHxb9s+UgGZcVHUyo1/HvWbIklKY0dcyoPEtWqbTBI3/3OKyPmROt2IykcHFWKdH7oVJtPiudyW2Y9DDgsotRIBgk0aTPT6Fum4c3+/8Qb0YZMOaGg644/0z1Exo3tUmq9vysDQxVwpQdIzlWQ79DvoImpW7pgHtYFwwMRlHf1roPzKag95j8o6ttaaDZdtNL60wc6iF/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8zzrtXJeP2YmsHcamfuINhe3MBzW9Cro+RbUNLH46g=;
 b=yql0Kzv0LAzspDI3Vnx0WGsDmVyqv1u7laaF96CdTVOZmAth8t63b41Neg+xePNMor6RI0cyxWWiuTM8b4+GiG10O2iZilAZaAzYSJEUBMyX/T5wRJbRsC/5imkTYI8q+HFLKHOaJBwy9mU+zPtaS/iSQwDWX1ddrQIQZiFJrE2qvyTgVC3/M0/tT/FNNAzUnakDxObRkw7zIreh3O20qAcETKYSIW/N9GUWKuiDEt059bBrIv2/326qiizjAdUQ7MK8wBvkWO2EmjWeRwLVsr9ZAnBdJY882A1oSI6ITBOCdw1Il0qn7Br0PrKhd9wfvhKUWZFzABccGwaciq1+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8zzrtXJeP2YmsHcamfuINhe3MBzW9Cro+RbUNLH46g=;
 b=MTgGCC0rxTVDJn/2blXJIW+AtPZlU5qrlh2NnF5t9d05DOsXny3sBJlwI4J1NOFt8vHJdeNIfukMC2MicSb/19U8Epklhqnw8+gOxGEjU3UxdojHfWr7EskTFidaxxKL2ZOilZ5dFlayH8rLNMOU9H96Lc1tkNi/GdzwJvSb94g=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYYPR01MB13021.jpnprd01.prod.outlook.com (2603:1096:405:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:20:29 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:20:29 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] clk: versaclock3: Remove unused SE2 clock select
 macro
Thread-Topic: [PATCH v2 1/5] clk: versaclock3: Remove unused SE2 clock select
 macro
Thread-Index: AQHcih5VzGx8IGGfMUSPpaSPNWEpd7VbTY6Q
Date: Tue, 20 Jan 2026 17:20:29 +0000
Message-ID:
 <TYCPR01MB120936F6433948C6C8C307B37C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-2-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYYPR01MB13021:EE_
x-ms-office365-filtering-correlation-id: d2579e4b-f8b4-4369-6060-08de584835d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Grj9xtkAy2E2WIGESCJ0aa2SsuFdwAdnUdIdc3A73nxifpAzRYk9V9A6QPov?=
 =?us-ascii?Q?pEG+R8MS8/tyd3pLo+lk2QGOG03XwybAFhkAqiXgS8I9t+NdXqgemVWWmVjE?=
 =?us-ascii?Q?5ubQDA8YqALEOCN5NTCGJRuleauR38gQjB24GOh9YXFymMdF0uyxr6FYRbok?=
 =?us-ascii?Q?VOlxVa9AtcJ6cdSGN1OGccIyfXlP+a6HGJReOyJZ6eAAVO/kwXkmhrChusm5?=
 =?us-ascii?Q?25oKw6FkkGsjaVFNFzJ6H5R4yrXoaVRleDfPLLjEEMgszva9JdIy6TTAwSkA?=
 =?us-ascii?Q?Nm5LPg8YBg02nrxeSqDw3UHEn1YjoIIRNjbFI+yx9msEPYT/rJQTBKPSRjoK?=
 =?us-ascii?Q?XSuQ+ho4A1c+5JEud7YdhYjVa+fL/r3cgwlCpeoPVjyNqRmPw45kTjDtnMrd?=
 =?us-ascii?Q?rqLMjNFZNWi62to6ULErjHXBtKZsRPpmDnd6GG0v6zzgQzJbJtReRveupCuV?=
 =?us-ascii?Q?aG2369VsIp81wkxQxmdG+vaV8iMc96fhXKvnwnQCcTLqao+pE4EF8VhgQY+d?=
 =?us-ascii?Q?OeQgYZJBu70OHPDYvXTua7ccYfAWbEZq/S8wjSl69SuvRcNe6TcRwSHXcSAR?=
 =?us-ascii?Q?ksvJRDaQORCna12MNB4luoaGddP9fcOWysBuLVQJ0/H0OE8i00R2cJphQyPQ?=
 =?us-ascii?Q?sf/PLYGqpMhJgRgfgsqOXJWRRFMhOsYwZ9JwLIkn/qsyq2se/j3dOKaLJFB0?=
 =?us-ascii?Q?NXMZ4VGdpaJMn6q313uZN0RTaJg5cYK8Ey9sUGYG4ovU9mYYXkdd650O+Sm8?=
 =?us-ascii?Q?aMfXYvhqaRAk7dpI+QlREMui6cQXxD+Cq1CnyArT2iYW6DdBUSJucT337H1b?=
 =?us-ascii?Q?sV9U06sqlZttKS7jhnt5TRwBW7HopCMZlyYwwr3YK7e7+jnLZhrjYJWGQs4U?=
 =?us-ascii?Q?K+ku1xVLaHp/jCkIOjwAeBqxPxHkUjqburmk8HcHo4NQEAEmkw6leWEJcPTF?=
 =?us-ascii?Q?g+XPF28WMZywnugZ4Pm66V53xKSolDhQRFblA9MIBbshYXIrwh/JDQOyuMYb?=
 =?us-ascii?Q?6KK1LSrt8phKtreLwvCTdJqzztC86SiPLVqN42agUyqUByTOh7wo60vp485B?=
 =?us-ascii?Q?BhNATL8IdE8yv3PSO5yoHbRng7j2GQuBk2fcPEgP8zk43YjrDKZCtKAVhmEn?=
 =?us-ascii?Q?luseZ7V66m+GcxhqKckOx0sqmIr8SN7V1CPpK5NxzIvhXrEVF21slI50eE+j?=
 =?us-ascii?Q?iO/PQFB/U8UgIJWVqhhaSeWfBfoJvrpNc+3gFmsfcdbkYl6BiUOydvXPdHLQ?=
 =?us-ascii?Q?VtzlNYnHXQ8oNu/k0/ZfINZH9jJTbA6kJenbqQbwkW6uyeUYz/7w4CO/Up37?=
 =?us-ascii?Q?4vo04npyQZlRDxlIQczGzkYGJ+LEDN5PWVehzehyyDi05HCVqbhVwCY5Qmqc?=
 =?us-ascii?Q?mnli8GRVpVd10OY7YYY6SrUybNbQsNqFHdZM+dwM/jSZ4RiRm1hTv81VjaZd?=
 =?us-ascii?Q?XcbByA6daQ7IP0Bjojss0vD6KpjphEQZbHrh8p/9TUqNCZYhszuvpwXNwwp5?=
 =?us-ascii?Q?1hjgbDEDyjF8ePdwmaXy3OnvOQ/yeHLuecwhUrnfCfWB806UmC8t3Ab20EnB?=
 =?us-ascii?Q?Bgt26vdLmtZ7UxwC3UcuIBbU8PJi6Wi5vSRUfIo/wwOyBbJcEyn0Aa/9Ln5/?=
 =?us-ascii?Q?yduKWYOKMH9JRJxw3y9qUBM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MxTbhzZvmWXyE1AuRXUY0A52/h5d1ixs52JQ4FHjeXSFBN5brKR0bycbFTFp?=
 =?us-ascii?Q?odlr5PqeVnZ7PZBZT5d7vd3p874ztGqQb3MbvhfmoiYjCOeySI/NOVD0yTcz?=
 =?us-ascii?Q?JB3pI59uA8JaQHOilAmquIebG1oGry2Kg7Izqw//PztbLl4rJg+BLr5+Oedk?=
 =?us-ascii?Q?lDGbHzl85x9g9tRVBoRRNpVS0XxJdD4sbUS9FZzIun3jDd9dgh8Tc24LZL8T?=
 =?us-ascii?Q?gT+jvbI3T5IV8VFoBQkNo4WnkKpaidb8VxlEx9L5mgO3VzwHIRJuOh/w1YTQ?=
 =?us-ascii?Q?Zwf9/jfI2et+0RTCQ0DzzesWd6rv1WPhs8kqtvXi6XeaaRw8yTzP4/2jOjPT?=
 =?us-ascii?Q?mru5KdnW2qxof9NG5NoHqmKu2VlfP3oTdE68psHMjjq7+pVlWnsLjtaUrN76?=
 =?us-ascii?Q?R2DyhzLbRWJKq6QbVn4Y2BYNxEPiaFfJW0k5w+p+MXoOr7pxm9JdOvbXhcxm?=
 =?us-ascii?Q?OQ3Bncpv+W0khnX2Ac8SrellZgZARgWwfdNM8OcAxJQ8UyToVj3Su2S8vTWF?=
 =?us-ascii?Q?NyVkGFtnnlyV5P5gglHDouQQN6SEQuBNi//w7yB0kBYKyB/r+vZRV0W+NQK6?=
 =?us-ascii?Q?g2blyKJYZ2GujTflXiR8vn97r6Wto4FSidyzpNmIARN73iLLYJ5ycX9UQytc?=
 =?us-ascii?Q?orOSpAJQJa5IFdmJE9mtJh09AnISadyhmOaefMwBg8AIStc1idlQhY536MfO?=
 =?us-ascii?Q?TeGJIlIofKaf2CXuPNjZtwbHKWTRdjJuCZ3b9ybEThEsW28oqybQMnsDpFJC?=
 =?us-ascii?Q?+PN2vR1zZwrcNm6xcOMF+DUJihAOYCkIViip30Q8hRO7qUiAuN9Nu/tdyhJ7?=
 =?us-ascii?Q?aUU5uOlQGkjcj3mrXF/wCjyjRy8lDnXswzhCYzfJT7WWW7AuZjKbwZBABMbt?=
 =?us-ascii?Q?SbqV111TzWz5xgGS6m7plGhrY7Muk2nLWPlDFkK+SGvYDGW5X4maOkmC0nbV?=
 =?us-ascii?Q?Gk8XhQYjfBPp4cQKFRwH3KeisWTMVVb4U1aLWBkzmzbXOiD9qqGGykF6jvvS?=
 =?us-ascii?Q?MV6N6KNU3ZjPSp5u41DHHIfnCxwtEYTxlFJ+tGVJ1TZrjPG5iFBPvRhsrmA8?=
 =?us-ascii?Q?24M7+W756GlUFlGKbr2ur+NxyPp7peU3kkf6XpwX+gi26w8HuSlRvz9PLa3d?=
 =?us-ascii?Q?8+c31eTzR3EX9b9/G5A3acA5acVseIz0Enq2GJWsalRHFr1AdfSuCh5Uk/Qk?=
 =?us-ascii?Q?z8rmSPuY7FJl4Ci3sRcbaucFw3zBrXfZYo1aWP1WODknbYGEidUk3TIgaFqJ?=
 =?us-ascii?Q?XQ6/udPzkXHHKZCLhXud5BRo+aTUrcYC2+doqnepKG8DyEYNPKEzibggblEj?=
 =?us-ascii?Q?Yf0rMBb/RgICVrjWChxESARZl3MgS+uHoYRoZ2JQpi15GkOOTdQTsICHuyF/?=
 =?us-ascii?Q?iOgdtuOK22b2qOTLA3CxbPVILqwL3CvZ+/ABelzKlPxxfFAX9mTzw14gRqz3?=
 =?us-ascii?Q?LcCh0+KXmiwszunJb6WSy+dTbPKdnyZbSTBqrXoviQoSlM0NdvrxhLlnrkxX?=
 =?us-ascii?Q?qvoDgNdnoTugUJT7pQ+hs2KENSnGdU3J2892q2q57d7jYq6k74NQiV7kvFCa?=
 =?us-ascii?Q?SFBWBfCjZMr42rNOafb5Dmp7BBrPRrFWPJqw2deUA4GPX8nFYfxc+ELDSr9o?=
 =?us-ascii?Q?3RFZP+NP0IdBLQxJuGlfkooVaTDAjk2LBaQ0++9UY7VlPRyhE3k9iE5wMePG?=
 =?us-ascii?Q?bwK2Fp33l6ScjpuSQWwVeSPyho5P4D8BHrT+W++7r91YqlgxCkOKkgxgQz45?=
 =?us-ascii?Q?r0kPwyq+iMZSrajkKV8G1G/JS5LDnSM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2579e4b-f8b4-4369-6060-08de584835d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:20:29.7359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLkv4H9z4a1e5LDQk+ADpeGI5w3SnxXLSEcCVFzOsb39BDJrTUIxNoZZXbzXH3mxcZnMKEuW1AaldvaUj0GNPA2x78anViWXCV2j/1A1KGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13021
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27131-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email,renesas.com:dkim,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 007874B006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 20 January 2026 15:06
> To: geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>; robh@ke=
rnel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mturquette@baylibre.com; sboyd@kernel.org; Biju Das =
<biju.das.jz@bp.renesas.com>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: [PATCH v2 1/5] clk: versaclock3: Remove unused SE2 clock select =
macro
>=20
> The VC3_SE2_CTRL_REG0_SE2_CLK_SEL macro is no longer used since
> commit ae6040cd7c7f8 ("clk: versaclock3: Prepare for the addition of
> 5L35023 device"), which switched SE2 clock select handling to use
> variant-specific OF data (se2_clk_sel_msk).
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v2 changes: None.
>=20
>  drivers/clk/clk-versaclock3.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c
> index 1849863dbd67..f387cdb12f48 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -61,7 +61,6 @@
>  #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
>=20
>  #define VC3_SE2_CTRL_REG0		0x1f
> -#define VC3_SE2_CTRL_REG0_SE2_CLK_SEL	BIT(6)
>=20
>  #define VC3_SE3_DIFF1_CTRL_REG		0x21
>  #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
> --
> 2.51.0


