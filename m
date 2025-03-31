Return-Path: <linux-renesas-soc+bounces-15215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E07A76D69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E7016AE97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0201213E8E;
	Mon, 31 Mar 2025 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IT6CHbrg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B72757F3;
	Mon, 31 Mar 2025 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448463; cv=fail; b=ua5ZS+/jJGffsPuCb5bSDHbby2DuyFuDN2xRKNGI627cgA74CjX8lNN+0mAhO8jNVI8GPaw8ri4GGsxWE1eLbrWKzrqTdvGYtZwSSkkGG7CXqJ2NLtqWR9k3MOsJNFU/TW9XjlC8OOeocUv8exIVvlnf44V255GflUPHaWJ6GJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448463; c=relaxed/simple;
	bh=Hrz1ned2O19KdY8mH4NlJrZypaYBNx50xDfJt41+orU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SyX99NtyS2O3mN4ZhgTvtqcaYuFexue8EbsB114Lfd02Dwzj69GpKUPimp2JyWb5qV59KZNeY8y7DfGZ2tR6D5Ta7GzjL09hibvbwx7xHmv3BKx89mXeb6REBLTDO2CDvp2ERf18gQ8e4bG4lO97I83sBK/CmTiThHE7SldeDig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IT6CHbrg; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdiAGEHOlhG6i5V1eTf1gS8ps7uf5LsZreUXmAqzvhETXAps9DZs1dNQp3cjaZmc/sDjBxIRtd4RBKQbPqeTfKVS+tamgEelfuiPfkNsfnUQ+O09+887VXZV22htDQuCVzl4y+lAqSekc6s1hPqKcW6o5Xrdzrpj9jtDGnxBml8hiIoXGnBm8iD0z0UCAR4YftIDydL6enrXDHt92Hb3dY6+4g0DEjE4+CAVa0lBX3LWiQrbsXfJrYBRK5ZvQ1QBMI6ru382FXHgATZR1Q7WZrXHa7fMRcNp+6tbGXWbspJWtP/9IZoK4ap2UQzIn5tLRl8L4bfsUNBUcU6VaH6/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hrz1ned2O19KdY8mH4NlJrZypaYBNx50xDfJt41+orU=;
 b=n8mrEgrj5xSJEL0lsnj1p9qUV7dXhB3cEtWZQWJDO6Az1N9xka8GDrtt4i86eZQUz6SBdkxGVjH5iNpqWr1FqWpvwYS/xEPXJJLA/fbpE37rD6P6Y8eMIDkq9WQdVYY/Yb93CLgNIqJ11QqOHHpUZwo/8cGEq5Dq+bogHSk8otMY5sPEvCkXXb3Sh3DZj2qLTsbJ59w/yEZiSqPSRdeCh4/az7S1j4BofdKXTLKbz/jwhg6wdSE6jSWO1BDjx7zXzx9kaPo6Mrt/BPDcpXKZHyud6+dBqaf0e4D37jNKMPwGoE9u1rBsEi6eIWFkpJ3LHo27SHUHnPWw8SvfhKq5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hrz1ned2O19KdY8mH4NlJrZypaYBNx50xDfJt41+orU=;
 b=IT6CHbrg9qPzKa1srX+iJ7j69Gf35vYe7zDOjMGFQsVmIk/ms6JAD2/3TUrgH63uyTSrLNQx3Uy4nM5QYedyunTTDRJsjvjkjenCZvLjgwycbjwyl4TqqrHjieda1DeHlDd8t03i/+uKzVRQNejqF8l88qGZn1JQFmEKKGOSghY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13082.jpnprd01.prod.outlook.com (2603:1096:405:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Mon, 31 Mar
 2025 19:14:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 19:14:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index:
 AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4wgAAIGYCAAAV54IAAD5qAgAAAPbCAADFHAIAAAGvAgAAKzICAAAGV4A==
Date: Mon, 31 Mar 2025 19:14:15 +0000
Message-ID:
 <TY3PR01MB1134613EEE68898A11BECE47286AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
 <TY3PR01MB11346E47B6455546AD1E6062886AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWucnfe_r63Bio0-k9nxzBEgpWHmatR8y8VEUHGzSe7MA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWucnfe_r63Bio0-k9nxzBEgpWHmatR8y8VEUHGzSe7MA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13082:EE_
x-ms-office365-filtering-correlation-id: 7dd93652-a4bb-4d93-8c06-08dd70883a77
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVg1elpzWWEva0IrQzZuYUxVT0F2eGcyci9YMTFmZ1JKaGNCRFh0ZXRYMGpv?=
 =?utf-8?B?aU9GRlB4QU9CaXcyTWpEM0FleDE2YThISkltN3FlM2V6ODgzVCtPNHBMWVhD?=
 =?utf-8?B?alAwcVBLcEoyTkdCbTFzQWpPdWY1VytDcjZMbmdtMUFIeHY4NEN1SWsrTjE3?=
 =?utf-8?B?czRxL3pkOURQR1ArQUYxYVpPUG9YRElXczNXTUZHWG12aTdYY2lPQUxZY2pR?=
 =?utf-8?B?TmxCbU9sN1VUM09NZ2dCdjNxUVFwNy9JcC9oK2ZrelQ4bTMwVDMwaWJiTlB0?=
 =?utf-8?B?TDZzVjJTUTAySmZ1NTdMZ2dzWlh0REx3ck5WSlhsZmNIc09NSFoza1MwSnFD?=
 =?utf-8?B?aHVwTG9pYk5iYjNpSEloL1EreVdzeWMrREdEdlorZXBoc3B4RGZ5TjRrWThI?=
 =?utf-8?B?NWZaM0xkQVhHckF6cEhhbXVvUUl2ZVd1empjZEhlNlJTNHkwR01MQjRKbitD?=
 =?utf-8?B?Q05iSEJVNkduM1JYZDBLQ0kzalNwNlVEcCtHeHdTaW1jUnd0OE9RVGk3U2E1?=
 =?utf-8?B?aURxK2Y0T3FaU2loSThLYXJXVm5EQlN0VlNVQWJ1TVlKQ2trczdDTVozRTdS?=
 =?utf-8?B?Nis2VzdlN2F2ck55bFZUK1N2cGdGc3ptYk03Rk5MOWswSmI3S0UrbWtZVWE4?=
 =?utf-8?B?Q1RxdURrNlZ1UFA0aXN1NVNUZnJBR3MyVmQyTGFWcUhuQVp0R1hUblpxNjkx?=
 =?utf-8?B?QzErN1BQUEZnenp0U1pxZnA5Wk9nWCtrQmloSXIrRyt6c0MvcHQxeEpMZngx?=
 =?utf-8?B?SERXMVRyU3F6SExUWnQ4WGoyMENZdURZcDFhQk55OUNCTWFRd29QYXNKT1Nw?=
 =?utf-8?B?SEdORWRqTXluWnVXSDRLT2wySHFhdEJaRGxma0p1VUdzbDl6bVZia09TaEw0?=
 =?utf-8?B?WVNKK1NnNW0xR09WRTIzM0FxWlZ0My82ajFkdm1mcHJwRDlIdVhWMVI2UXR0?=
 =?utf-8?B?M24rS1JNRXVnN2JFNDhjamV2Vy9RdXNTYVlFWnBJVGFHc2hDNGJVMDF3R3dr?=
 =?utf-8?B?OVZ1QVBWQW5SV1J2Y1VpZXgzRmlzblJJS25IcGIySE5xTG5nVnlWcDAxdjNI?=
 =?utf-8?B?TWlmWTV1MmVPUndCdHplWWplQUpHL1VrYWpPS0Q3alJNVjRMeElRcXdNS1M4?=
 =?utf-8?B?R1Bxd0NGRnF1VnNQVS9vWFU3enhVeUFRZ2dVUWlRMW5IM09FaUpjM2lOdjRy?=
 =?utf-8?B?cnFXSnRCZE5hRnNnUHlTWTFlVzIwOGF1dnoydWlaTytmaHhkUklPTVRKU2Rm?=
 =?utf-8?B?bGtGYjYydTNDSGZxb1pRQzR2TnZaVmE3S3c4RkZlN2FvcmxxYlBONzJ4akRi?=
 =?utf-8?B?NTExVDMxRDFMWGtBdnc4Qzk4N1JEQ1BtRjR1T1pHMWliS2U1Y2wwQ0RtWmJD?=
 =?utf-8?B?bERHNlJ4dFBCbE1La3Y3SXhBQ2pkWWw5MzFWeU5jNFFJSUYzWlBUSGhIVUFN?=
 =?utf-8?B?dFN6ZDRyNlljM2prKzNmUUFGdDVzWWdMNWJHVkprWEZ0NVJuNHlCVk9kNkxK?=
 =?utf-8?B?RERVWmVXUGxqVi9ZRm9zZWF0a29TS28zNEg3dmdUM1ovK0NFNGtoUXFLRE9h?=
 =?utf-8?B?Y0lIRGhSa1pnd295czZWMWl5dTVyQWphQ0UyQ3FNbjZUQzRVL080V1VhN0tU?=
 =?utf-8?B?T3JkaDhGRERlaFBJRlZ6dnlGLzk4SlpUK05TWE9xYmVUeEppTmUwRzdXcDEz?=
 =?utf-8?B?Y292YzhZZmpBVkxXNVdXa1E3RkZNUnlEd1R1Wk1zazlGbDJTOUxtejBlazlS?=
 =?utf-8?B?UmJGSUpLS09xY1VlTlNZZ0F2YjdIT3oyMU1KQk03MVYwUGhSSW1QYjUzK1Rh?=
 =?utf-8?B?YjdWMnphd25adm5UTnp2N2tkLzRDTlV4WjdrMXZOL0lONVZZSnd2VjYwQnBv?=
 =?utf-8?B?SjFBc3dteUhnazZwbFVZV0Vuanp5RVNXbkhCUCtISVkzSDBXdkcrb0JGL01t?=
 =?utf-8?Q?IxYi5D64dc3pyOq7m9zJ14hl80iQurVN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejR3WXF6bTdLdWYwaW1xa0RTZzVOR0FxWUlialhnS0MwNWZKT283ZWFLUmxQ?=
 =?utf-8?B?ZitkYjJPSFhENDNRU3ZMdE1kQ0JhdHF0aCtlY1BqelR0QllMdjRFNEswbmtz?=
 =?utf-8?B?WjUrbDlwQjJCZCs1VUNFRmVpaW5kQU9DVm1qU0tlZEIwSEUxWEhzTE9LbkZN?=
 =?utf-8?B?NDQ5YVFTR3lSYytMMDBEeUNFNXdJUW9rdzV4aXJXYWNLa1pIUFQzaSsxazZ5?=
 =?utf-8?B?SDlvenBJV1RNSEJTZndoanp1T3RsL1hoWDZsckVmUWk0TUdIU3I1c0IxZGtJ?=
 =?utf-8?B?ZUlXTnRCSElyeUxnaFF4MDhKa1Nya3ArSVZsV25jc0l4SFd2dXZkYTREeHlu?=
 =?utf-8?B?OW5XU01VMGxJQlVBR0s4elpJdEE5WTJpMjR2RnpnaTlncjNjNmV3VXVHWERa?=
 =?utf-8?B?NTY0SUJrWGRpeDVTUFQ1MDU2c3RxbFNtOWJGcktmbFZVaUNnYTNmc0JlRDRr?=
 =?utf-8?B?RnUybFlqUE9hOWRabWZ3Q0F3bUpGZlp6dWRtSlhvZjZDekt1QnBKajREMkhr?=
 =?utf-8?B?cmlkSittTklkUS9Pd0xacnJ4ZjcxNGNFV2xRUUM0K2xJdlAwTXg0NDlLWGlT?=
 =?utf-8?B?UTdzamVzWnJGTU5qcWJsU3BQYTJwUVo5UVk5OGtGZUVTY2htZ1Q5S3VjZ3VK?=
 =?utf-8?B?V2FrWDIza0xHc3Y3bTk5OVRnK0FTN3V2dnp2MGNGNFpEdkY3MGpSOXhoRkMy?=
 =?utf-8?B?ZW5uYUQ2OUg4ZlVyYWdRcWJSU3Zxd0JGSDhUT01TUUtUckVTVkd0aS9WT1c1?=
 =?utf-8?B?Q1F3NWdxaXI5d2pLZGw1SitNYllQOVZhMnFUYXk3QkgxTXphWEFCY0tMSnVV?=
 =?utf-8?B?bU4vYkJQZDhXV1ZmSTB1RUFwTEpYK2F4RnZrZW8zanFpT0E2cGNOMko5RDlE?=
 =?utf-8?B?eCtkYjJHOFgxMnJJdGRiSHpjVnJDdUUvUUVFMGxnaC9IY2tuRVNUTWhqeEkv?=
 =?utf-8?B?Yi9VRXl0dlJqWUdsZk8wSXlTeHNuNVJhcWVKQXVqV0xHclJtUDY0Z1ViUDlh?=
 =?utf-8?B?K1dHUDY1WEUwQW1JdVdsNDNCRngxOTZGSXFIYmZkRzRjUlZRaHpUTENFYW9L?=
 =?utf-8?B?cG9SODA5Yi94RmlsU21hR1Fic3diYkJJeHFqdTNTS21vdVZvTHdsZlFoZ1Qx?=
 =?utf-8?B?OXpzeHJXZW5Ga2NiNzFtclBHNFdGMyt2aEpaSHBMNGdPZGJvajdORTIyK3ZC?=
 =?utf-8?B?MlFkYjJQMVFOQXpTWC94OGdLVlhnRE9kS3hZS2JVN1ZUU0E2YmRUMFVCUzdl?=
 =?utf-8?B?dmlmU09MZklQNDFqdmtUVHYvRWdaVkd1ZUVCSnpIVXpEc0ZPTUt3R2JxUDMx?=
 =?utf-8?B?WGFsTjNLQmYrNHBGaWIrVm43czZJZ3h3Ukh6dXpza04rdTZUaG9tUHAwYjJC?=
 =?utf-8?B?WURrbHpQamZDSTM5eElER3ZMTGNmZ3FBTGIrZGhGSmptT2FVUzluU2tYTnlj?=
 =?utf-8?B?RUJMZE5KeXhwWUk4WmFYTUpsbk5xUU13b3hQRjZaN3dlTGMxb1dVS1ZBMXVv?=
 =?utf-8?B?RExBNkRlRmNxMXVTK0FBL3dwckExUnZrSTN4dkhVcDEzazFJWiswQ0RGdmU2?=
 =?utf-8?B?QTV1VUhvdTNPTm5tTjRRNmxqa2E5WGlqTjhTeHdpYVhldkRHTnJxbmZOZ0Vt?=
 =?utf-8?B?NXRRSCt5dVdUMjJGam95T3U5R0xxcG1YZ1FTL1NITTEvRXJuQUx1QU52bTZS?=
 =?utf-8?B?RndYUWV6dzZtenFCcmFIK2dBd2RaTDhMSDJXUnIySkV0MW9OZzRwcG5ObmQy?=
 =?utf-8?B?VlBEMGlYZTNjVSszcE5jRzRyWTVFR2pGMzQ3bXkrR0FybFQ4d25rd283V1Vm?=
 =?utf-8?B?d2Ric3BEdFVyUWxCWjA3cGk0aEJjRzA2MjJjRmNUM1g1ZkdzbmIwR0V5YzBj?=
 =?utf-8?B?V2FCWS9zVVZ6YzJudlZibWpJVUQrZWwzSVpTN0dCOC8veFlFay9RRDlyUldP?=
 =?utf-8?B?cEhqVUU1NFIwTnpiSExGNTBNWUxzUHh6MWF1MDdDbUlNZENld0Q3TVJkMUts?=
 =?utf-8?B?OUova1RnS2FsTlJOTE80blRKQWg5NjJFR0l1KzQ4dENYUWtKUitwbzdxWDUy?=
 =?utf-8?B?SnhUQzlGUDZyeEhqeFRrRnhUNE4zK003YVAydWJ3RkJObEVoMWU0S3RlV2RR?=
 =?utf-8?B?K09vbU1DWklxWnl5cU8rN0tNYTBIbnpXRnJJYmJUU053YmdsNFNPUVp0UW1i?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd93652-a4bb-4d93-8c06-08dd70883a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 19:14:15.5178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpLITgLOueRd4nchOtkge/Ckwg3lokLgIjcrs1QrjVZiG7H5IOLNj91AMLdPyLhEYCJbFMYu/jMZ5VuAjeBq8KW++Hynq1HR6YabPfuvSuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13082

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMjA6MDUNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAxLzldIGR0LWJpbmRpbmdzOiBtZW1vcnk6IERvY3VtZW50IFJaL0czRSBzdXBwb3J0DQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCAzMSBNYXIgMjAyNSBhdCAyMDoyOSwgQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIE1vbiwgMzEgTWFyIDIwMjUN
Cj4gPiA+IGF0IDE3OjMzLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IE9uIE1vbiwgMzEgTWFyDQo+ID4gPiA+ID4gMjAyNSBhdCAxNjozNCwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gTW9uLCAzMQ0KPiA+
ID4gPiA+ID4gPiBNYXINCj4gPiA+ID4gPiA+ID4gMjAyNSBhdCAxNTo1NCwgQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+IEZyb206
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gRG9jdW1lbnQNCj4gPiA+ID4g
PiA+ID4gPiA+IHN1cHBvcnQgZm9yIHRoZSBFeHBhbmRlZCBTZXJpYWwgUGVyaXBoZXJhbCBJbnRl
cmZhY2UNCj4gPiA+ID4gPiA+ID4gPiA+ICh4U1BJKSBDb250cm9sbGVyIGluIHRoZSBSZW5lc2Fz
IFJaL0czRQ0KPiA+ID4gPiA+ID4gPiA+ID4gKFI5QTA5RzA0NykgU29DLg0KPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8
cm9iaEBrZXJuZWwub3JnPg0KPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGUNCj4gPiA+ID4gPiA+ID4g
PiA+ICsrKyBycy9yDQo+ID4gPiA+ID4gPiA+ID4gPiArKysgZW5lcw0KPiA+ID4gPiA+ID4gPiA+
ID4gKysrIGFzLHINCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyB6ZzNlDQo+ID4gPiA+ID4gPiA+ID4g
PiArKysgLXhzcGkueWFtbA0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICBz
cGlAMTEwMzAwMDAgew0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHI5YTA5ZzA0Ny14c3BpIjsNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgIHJlZyA9
IDwweDExMDMwMDAwIDB4MTAwMDA+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsNCj4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgICAgIHJlZy1uYW1lcyA9ICJyZWdzIiwgImRpcm1hcCI7DQo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI4IElSUV9UWVBFX0VE
R0VfUklTSU5HPiwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICA8R0lD
X1NQSSAyMjkgSVJRX1RZUEVfRURHRV9SSVNJTkc+Ow0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgaW50ZXJydXB0LW5hbWVzID0gInB1bHNlIiwgImVycl9wdWxzZSI7DQo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDB4OWY+LCA8JmNwZyBDUEdfTU9E
IDB4YTA+LA0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01P
RCAweGExPiwgPCZjcGcgQ1BHX01PRA0KPiA+ID4gPiA+ID4gPiA+ID4gKyAweGExPjsNCj4gPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IE9uIHRoZSBuZXh0IHZlcnNpb24gSSBhbSBnb2lu
ZyB0byB1cGRhdGUgc3BpeDIgY2xrIGFzDQo+ID4gPiA+ID4gPiA+ID4gPCZjcGcgQ1BHX0NPUkUg
UjlBMDlHMDQ3X1NQSV9DTEtfU1BJWDI+DQo+ID4gPg0KPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBS
Wi9HM0UgY2xvY2sgc3lzdGVtIGRpYWdyYW0sICh0aGUgcGFyZW50IG9mKQ0KPiA+ID4gY2xrX3Nw
aSBpcyBkZXJpdmVkIGZyb20gKHRoZSBwYXJlbnQgb2YpIGNsa19zcGl4Miwgbm90IHRoZSBvdGhl
ciB3YXkgYXJvdW5kPw0KPiA+ID4gU28geW91IGNhbiBtb2RlbCBjbGtfc3BpIGFzIGEgZml4ZWQg
ZGl2aWRlciBjbG9jayB3aXRoIHBhcmVudA0KPiA+ID4gY2xrX3NwaXgyIGFuZCBmYWN0b3IgdHdv
LiAgSS5lLiBwcm92aWRlIGEgbmV3IGNvcmUgY2xvY2sgUjlBMDlHMDQ3X1NQSV9DTEtfU1BJIGlu
c3RlYWQgb2YgeW91cg0KPiBwcm9wb3NlZCBSOUEwOUcwNDdfU1BJX0NMS19TUElYMj8NCj4gICAg
IF5eXl4NCg0KT0suDQoNCj4gDQo+ID4gPiA+ID4gPiA+IFdoYXQncyBzcGl4MiBjbGs/IEFoLCBy
ZS1hZGRpbmcgZHJvcHBlZCBsaW5lOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgY2xvY2stbmFtZXMgPSAiYWhiIiwgImF4aSIsICJzcGkiLCAic3BpeDIiOw0KPiAN
Cj4gPiBDYW4geW91IHBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzIHRvIGhhbmRsZSB0aGlzPw0K
PiANCj4gU2VlIGFib3ZlIF5eXl4gOy0pDQo+IA0KPiA+IDEpIEdhdGUgb25seSBzcGkgY2xrDQo+
IA0KPiBHYXRlIG9ubHkgY2xrX3NwaXgyLCB3aGljaCBpcyB0aGUgcGFyZW50IG9mIGNsa19zcGku
DQo+IFNvIGVuYWJsaW5nIGFueSBvZiB0aGVtIHdpbGwgKHByb3BhZ2F0ZSB0bykgZW5hYmxlIGNs
a19zcGl4Miwgd2hpY2ggdXNlcyB0aGUgaGFyZHdhcmUgZ2F0ZS4NCg0KQWdyZWVkLg0KDQo+IA0K
PiA+IDIpIEZvciBtb25pdG9yaW5nIHVzZSBib3RoIGNsb2NrDQo+IA0KPiBDaGVjayBvbmx5IGNs
a19zcGl4MiBmb3IgbW9uaXRvcmluZy4NCg0KT2suDQoNCj4gDQo+ID4gMykgQ2xvY2sgc3BlY2lm
aWVyIG5lZWRzIHR3byBkaXN0aW5jdCBlbnRyaWVzLiBTbyB0aGF0IGNvbnN1bWVyIHdpbGwgZ2V0
DQo+ID4gICAgcHJvcGVyIHJhdGVzIGZvciBib3RoIGNsb2Nrcy4NCj4gDQo+IGNsa19zcGkgd291
bGQgYmUgYSBzZXBhcmF0ZSBmaXhlZC1kaXZpZGVyIGNsb2NrLg0KDQpBZ3JlZWQuDQoNCkNoZWVy
cywNCkJpanUNCg==

