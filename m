Return-Path: <linux-renesas-soc+bounces-12900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85CA2A6F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 432CC188A9D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0482C227B97;
	Thu,  6 Feb 2025 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Jb6QDp9G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1322757F;
	Thu,  6 Feb 2025 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840023; cv=fail; b=hXMrQ/z0KliMrMMIBwadbWipVjeSiDSdh/1IfrFz6+uX42R/pnFI+qYWL2BunaXF+uFe5dV3R59LVyosS7h++0zPkCX77M45nuxIVQ3hWvAfwZ1d5FpoIWQJ4pZqLH0FTwSioooWxK9x9segMHBova5kNKsJGo2ODSEZOdYTvXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840023; c=relaxed/simple;
	bh=G6EoSz5rHKtYvjpNoq263S/X6dFhaqe7coX3WmcyOxo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PQGkTlqJri+29bQELNnQHl+2LPmmGSesj3t5M4XwgSxoHPMl1+Kin3w8slQO8YfsucGwMKO2dtwf1B1dlK6vAiLQv67tYAVy3eQ/aKupGYbiOYO6vE9Z5bdgX3jkJRZZLcj/Z8V3F2ckGTekjzj94Yqg5RUVcCQ9shC7HtFafOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Jb6QDp9G; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSKStMG9ADLRBy7iT7kcck5Z8Ts1w71DTM066hMHLEH6yyHTHyvEb0pMQ8uRhI7eKBd4jBKxBlWyoor280dHWeEonI0wO0vfg/nhT1Rtpi0JGcFUiZxDNVRRlbU1latHA9amiEop624O7frVa61TXAYzueyaTfPxEHuNoDvxA8vZP5Yx+ispgFhGq06mWG8JyKF/DS/D+VzX8QR87uBqhkSC4NugnaALdom27WM5ZCVdiNb8YetzpfHrt+ROs652vhYrMXNalFEeGTw2gFcT7jsIhJDzXaH+/8chSvBkIP+f4usTTw/L0a/IYvSdmqJhoLz6F1De2miirKxJ3gkLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6EoSz5rHKtYvjpNoq263S/X6dFhaqe7coX3WmcyOxo=;
 b=UEdOfvuqemgAyrQs0/coipnQ9/ujkI7Ha4sbvrapRzsdKk4yzakugsVg7ezIO8TF5X+8MEiqxCrhA098zu8u+WQ6lf6Kjqzg594ekhd5Z7gb+68IsNQ2fds3X6n3A6krRmy2Peojp794DD1oEY3/5miqf3kGrrmYJ7bo8gQd4ZW8Nga+d694ySNDDXKY8jn16sIyDAa1ugEKlFPz/1Qu9Q3s9YyOZI1gg0OIOWsNidSe8tGSMkg+5xKxHpISQc1SihdhfjTZbEPNDydZDkgms+8JNzOznMtRQm+w2xi2mCf2V7sDkePdKvOTuU05BnREfu2YlaksD+Ws8zYJAI+KAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6EoSz5rHKtYvjpNoq263S/X6dFhaqe7coX3WmcyOxo=;
 b=Jb6QDp9GuxASiqJ/SOaY5p45nurKYnSSmAGTq5opZrVrcyHm0/7NDPUJtEkEZpmnh6cKM+vHyok60WJEiUyiYiPA438QSawKArp8ztvsDXCkH9HDQqvB/Fk8w6wCjKxr80cxxovL8jydBcHElQzJ0Pai5YKemQaL/myaQ4weGRU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12998.jpnprd01.prod.outlook.com (2603:1096:405:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 11:06:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:06:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Index: AQHbc9LHJ1EZ6jvpdUu3wePcW5HPZrM6EQAAgAATpzA=
Date: Thu, 6 Feb 2025 11:06:57 +0000
Message-ID:
 <TY3PR01MB11346AB8A783B82A21E6A59A986F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWDQ5F69B8HHA+e=0AtGFwaods4oAfsDdEx63KP0-HRow@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWDQ5F69B8HHA+e=0AtGFwaods4oAfsDdEx63KP0-HRow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12998:EE_
x-ms-office365-filtering-correlation-id: 70dbdeb1-823b-4d72-70db-08dd469e5f72
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZnA4M1RKRVUxYUFZQU8xNnlrWFk0MFhWRFprdjJjd0RuSjVZZjZZUDh1K0tQ?=
 =?utf-8?B?S3VZeTRNRXFmWVR6SzJncEJkVE1lYUJQVGFGdlRqMWltYmxjd2cvUkRUZFJO?=
 =?utf-8?B?cDFmWm9CSUxrNXp4ZXdRaVlQVi9IMVEyQlNpdzA2QU9KZU5aM2s3WmFMSm11?=
 =?utf-8?B?Ykw1VDYxaGN2VWZXVC9zQW5xcnIvT3pKZ3MwaW85NzhoNktkV1pRRUYvdjc5?=
 =?utf-8?B?ZDV0S09LVDZ0bytJV25wL2hKTnBVV1BodXo0SThLUTgyMTkzNlVlRGN6MkpS?=
 =?utf-8?B?Q05qbXRKTTJXYUJ5aXVoTlN6Y0tZcEVxTDFzdjFtOGd0S2IvVElvUmRGSXM1?=
 =?utf-8?B?czZsUlJOODFQL0MrWnZzN1d1d0JjQUhEZWNuK0Z0Qll2ZzNMRHBOVTBYVmtr?=
 =?utf-8?B?WFFBZDkxUnExUXBzbDhPcUpEWjRyaG5GVGpKS2JHUXN3R3VTT1FQZTdLZFZP?=
 =?utf-8?B?bExLOHFvZVhRbE9PSEIzTG9lUGdLMjBYQVFoK0JQaHd5OXkzaDUyaW9aSVp2?=
 =?utf-8?B?OUU2NFh5RlNLallNUzNBRUt0ck5YSjU4UVBVSDZIOHNERUFTYmRxVVhERU55?=
 =?utf-8?B?c1B3NU5vaTJNUk8zcDlHUlBxOEJCb3ZqbEFsd2xkOU5tTjFOUmhab3NkWGNz?=
 =?utf-8?B?ZkMxKzAwU1BOUUszYkxXOStCRmlXWitrQ3cxb25aa2h0ZzUvQk5jNnFCSm5m?=
 =?utf-8?B?VG5qWTcxVzlPUUxHeTZ3LzRMSHRhaENFUFlWdWl1Y2NLOEZRQW9Bd2s4ZzBJ?=
 =?utf-8?B?eWhrT0U0MHg0S2o1Mm5IUzFnM21qWXFVcnUxdEpqbytaTEs5KzBHSVd3QW9m?=
 =?utf-8?B?TlEwWHdwZjhVcUpsTm9TWUdVSi8vS0thbklwVXo5M29JZmJEWUJqYlNkdGo5?=
 =?utf-8?B?UVJQOWFybFl3Y1ZLYVd6OTcrOWNJWERnWG91TVljNTV5T01ZWXBBbWcvZURQ?=
 =?utf-8?B?MFVIcUJtTkRpazBTMjdiSmdNYm1QMWZ6ejdiS0dTblNqYm0rOW13RGR2ZVdl?=
 =?utf-8?B?bWF0LytDNVBEYmRpalEzVFVacWNmUkxTUFByajZPK2NXanZPQ2t6M2FwU0Fh?=
 =?utf-8?B?c0txYVUySk1zTWNIU01DdnduZ0VQSGdvRjdrK2g4eGVXbFRnK1d0aWl4anU5?=
 =?utf-8?B?RFRuVFNUWlJzUDU0VTJYclQyME1pcy9MaU5hRUkyQVBSc3lqdW9vRW5ZbU5N?=
 =?utf-8?B?YXFlZFRWMkFzVzRoN3VXTnl2T3plMFdOcXlIS0hzdkIxSGlYZzdGSzFCS2FC?=
 =?utf-8?B?RGVCV08wV0VXZEloeW1yd2dvZCttRDdWMXRWc0NKNmNIay9taUd2QmUyYlZq?=
 =?utf-8?B?d1FPYXI3QW5XU2RqUU9JSkFuREx3WjZ4aHBlTGYwR1UyWERIbFpFSjNsRFJR?=
 =?utf-8?B?Wms2UFZycVk5aE40ell6UTQ5L0RuRFJTUVgzRm1UUDhhd1hRdUoxR0NIYlpL?=
 =?utf-8?B?bU5VZTI5NldhK3JnNVM1SlN6dmtxTVBXbUhORDI4bVhEQnlHSWkyVXIxQlZq?=
 =?utf-8?B?dWY4WlRCSERWWEIvVnB4aGtzY1lzSVhYL0RMeHpvc2RBejA3MklNamRoVGdL?=
 =?utf-8?B?VXZuSGk5NDVPeFVyQlhMMW1yNW5iODl5OTd2ZGZGdXQ5R08rbWRmRW1GN0N5?=
 =?utf-8?B?ZEVuOERUeWRRTU00M0hFbUdKSU40bmI5Mlc5cVNlQ21zNGcwVzFDRE9PT2RS?=
 =?utf-8?B?SmQ2cFdDWG9USzVvajRVMXZUZWZSOEZNRjVXMUhoVkFuM2VzYU1WdTFqczJT?=
 =?utf-8?B?eE5XWWlNeGkraFVyTkF6OVRuelpKRGc5cVU1dmo4cXAvNnBHaUFJQnJoS0pC?=
 =?utf-8?B?M3dRUmpTWGRpMWFja0JVR3BpamZEL3d2a0N0VnIxZ0NUTTJCVkwwMEV6QWZz?=
 =?utf-8?B?bDVHL0toQTE3REFTTyttcE5GTDFJcDNybjYrUEo1VGFBNlBWcDd5Qk93YUJ4?=
 =?utf-8?Q?3Bf7ahXBXyPinKxcJFU+YmPzS0EPXLPx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWxrY1lRdXJMbzZJODJBeFZJZm9sVWR3aEtYQXk4MUxxWWVNNUN5c1UrUzNr?=
 =?utf-8?B?djJUN2dtWXhMVUpybG1VRnZ6Y0U5Y0tHSEQ1NUFaL253UDBkZjhYL2hIZXN0?=
 =?utf-8?B?TzRWZU90OUswbnl5VG44Tm1aa1FCdzdBWkZaTHQ4NU9TTm1TWFpIbHkzVHJ1?=
 =?utf-8?B?RlZWMGpEeisvZXhZbmFSQjhqQWR2UWJkeXFHQ2tDczhUQ0w0cFVKUDl5ajNp?=
 =?utf-8?B?Vnc1V29yM2wwTzh0K3RzR3I1Yjd2Rk1UZFQvaVVmRjFmSnc0OTZwK3BUb0U0?=
 =?utf-8?B?clNqNHdTdXFIR0tMVlNJbVRqd285VVFXQ0VYYStva0RmYkF3TUdZL3RRK0hZ?=
 =?utf-8?B?R0VJWDY3ZnJhRXdzbzJqRW1xUURQRk1qZDVKT3RKRktZeUJ6V3lyVEtWNTYv?=
 =?utf-8?B?MXRFeWRVeXQ1M3dqODdGYm5QR3FQNGJyNEZuSHl5Y3ZLTytUZUJJODBrSHc0?=
 =?utf-8?B?REluZUJlK0FDd2NGdGxPNFZPMTVLYjBlVnh6dmU3Q1d3T2xsUEhUZTkwWlE3?=
 =?utf-8?B?TVZSMzZ0dVNMK3dpKzBCNGU5RFlTSGQzQ1pJMkpiMkVCejJvUnYySzArdlRS?=
 =?utf-8?B?ZkxITkR4S2VmQU10NWFlZ2pQOFdYSS9LKzlBU0didG9hTUV0bGwxME9ocWNq?=
 =?utf-8?B?aVU4RG1wL0FRZVBzMTF0REFmYW1VZlU4U1RzSmZtOXI0NXNPeWNVSmN5RC9D?=
 =?utf-8?B?ODRiakVLZWF6OFRNZ3RIRHhVNzI3Tnd4TWwwYzlFaEZsTlVuZGJRQ0RlOC9i?=
 =?utf-8?B?d0U4bnUrbTMyV3VndmFyNUt2TWVUT0l3bmZnNk0rK1Y2a1cxTnljWWdXMU5J?=
 =?utf-8?B?N09vbm9BYnc4OG9UWU13L1FvWmpiVjJScXhRbmxISllSRGpWZWdpaU9QSTZF?=
 =?utf-8?B?OXhzNlFaM2o0SFFXQ203UEdLME5BUEdPWjVoY3VQM3NvOUtpM0d0Ymh4eXRF?=
 =?utf-8?B?a1FQSXI2QlRTaE53MG5CdGd5VnZ1Y1hEZ0VTRTArYi9kRHU0UmIvVXhLbU9V?=
 =?utf-8?B?ZFFKckdISk1nSUk4U3VqdGNHNldKdFJUdDY1R01pQ0tKblJmTk15S2JhUHVt?=
 =?utf-8?B?Nk9YcTNLSmdPVmx6T2tpSERIYk5HN1FKek9PdVc4YmFNRWJaaktyRDg0c01T?=
 =?utf-8?B?VnhVRnlwWDM5b200OS9UQXZRaTNEQjFRU0dUTk1uam1QWEZmcDRXRGtFRm1I?=
 =?utf-8?B?SUpmOUVGOGN4cEYySlNXRWJZM09IMjJHQzM1ckovTnlod3F2bTFGekh5cWtR?=
 =?utf-8?B?OVhOLzVwNFl2WnJqN0dsaW01Q0sxZ0Y3WHdIKzdrU0loZXZtRmVtYU9xQmkv?=
 =?utf-8?B?R0lVY2xHQ3BLck9najFLVjFKUVhhbG9NckNCRklQVGJhZ284WG1uS01NSGo3?=
 =?utf-8?B?QklBME40cmpMdGpYV3hBSkFDSWs3UnkrUnE4WWtLaHRadGZyV3NaVnJPWkpw?=
 =?utf-8?B?aDRWUDVIMi81bEMyMjBuaW4vTzlJZkJYdmZLN2Z5cE1GdXZ0V0FYU0MwYnov?=
 =?utf-8?B?MFZGSmpHbmJhZzkwUnhzYk5xTTlWUmFTQ2Q2OVB5b1RWMG9NWXdXY1NrWFJn?=
 =?utf-8?B?dEhmMHNrYUVnNmFSU1Z4N1BDdHZsZ3V2Wlp5dzdQamw2TGZpWU1nRVd3RXNy?=
 =?utf-8?B?cnhmL1ZRdEJQbXRhbUljbkZySzlUZ09iUldnd3ZLYWFEUDB0NGtOL0RjSWVk?=
 =?utf-8?B?eWdEU1Q0bW1KZlEwZ0FkQXRjNWw5ZmpJY21KVjQ4c0tHNXNHRWFVbnMxVi9Y?=
 =?utf-8?B?MElSK1VBd2RUN21xM0FUVnhNNVRLbWpQOTgybHF6M0dSaXFuZ1J2blZpWVBW?=
 =?utf-8?B?K1FSRWI4MktIMS8zTzEvY3B2YmFXK1JUa0NVT2Y1VXQ3WUpBOHVJTnNXRTY1?=
 =?utf-8?B?Q0l0ZnRaYzRMQTg0aU8zbjlMN3ZTY3d0UXdyQ0d0bG1XZStwN3l4MXF2Y2JF?=
 =?utf-8?B?amdQczhuSUFnUk4rL0twMHJLS3lxeE84UmR5bmVOVWduZjFrK3dqZ3IrRWwv?=
 =?utf-8?B?YjQrZklyRmJVVXphdE55ZVcwOFM1Z044bG9CT3lBVWdJZEtSZ0xnUEFncE9S?=
 =?utf-8?B?cHNDd0JaYkNJM00vaVprWU5jc2JUdG5XZjZyZUc2MDRSWHhFSk9SaU4wZjdn?=
 =?utf-8?B?M3ZLc0xZWlkxVlVZaXNzWTZIc2I3UnBKcmpRaHY1akR5VHZxRHpuMkN3YW4z?=
 =?utf-8?B?WUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dbdeb1-823b-4d72-70db-08dd469e5f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 11:06:57.6081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9cAGVDYE4Q/JfUfhhsH4HpsoCQJ+towuT+vnMxfUTPpugIAmaWeAwQ1NYCI6jge/E76cvH5FB9XjOHmtE/m4cD93KwGChk2VDOFVCjcxEkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12998

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjUgMDk6NDkNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiA2LzhdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNlLXNtYXJjLXNvbTogRW5hYmxl
IFNESEl7MCwyfQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgMzEgSmFuIDIwMjUgYXQg
MTI6MjUsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
RW5hYmxlIGVNTUMgb24gU0RISTAgYW5kIFNEIG9uIFNESEkyIG9uIFJaL0czRSBTTUFSQyBTb00u
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1z
bWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcz
ZS1zbWFyYy1zb20uZHRzaQ0KPiANCj4gPg0KPiA+ICsmcGluY3RybCB7DQo+ID4gKyAgICAgICBz
ZGhpMF9lbW1jX3BpbnM6IHNkMGVtbWMgew0KPiANCj4gc2RoaTBfZW1tY19waW5zOiBzZDAtZW1t
YyB7DQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBzZDAtZW1tYy1jdHJsIHsNCj4g
DQo+IGFuZCBkcm9wIHRoZSAiLWVtbWMiIGhlcmUgYW5kIGJlbG93LCB0byBhbGlnbiB3aXRoIHNk
MC11c2QgaW4gdGhlIG5leHQgcGF0Y2guDQoNCkFncmVlZCB3aWxsIGZpeCB0aGlzIGluIG5leHQg
dmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

