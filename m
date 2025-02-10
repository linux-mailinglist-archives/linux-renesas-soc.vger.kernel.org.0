Return-Path: <linux-renesas-soc+bounces-13005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111BDA2F01F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0DAD1647E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C681F8BA4;
	Mon, 10 Feb 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZavEZNAd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0261C07ED;
	Mon, 10 Feb 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198780; cv=fail; b=MelkFcqktkjlSIwVpAsHRf2dQ2cNF4iZlBHIGtOAGmb84HShCEsPyf/XGwwiEbSCYB2HoBwwYbV5PGuNOWTtqlwrQ21vZQhrtQQwYsgGvbwvhfLnHjM4wWlGrtJ8tSAl2wcnwY0v6/vdAbez1FySIXSt1KOQSmlszAsxwDhUXZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198780; c=relaxed/simple;
	bh=dc2YP2QXtKxLHF4anGkAHdSki56Tzyc/gG2xFb2zTAk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NfYblmxLd03qfuWDv+ciWQLaGgQ6G5BhqvYOq5tseSZT07C/DgDWVuTxjqmgCJOSM4T4WK0LlbB8p4pXJURiSu64ctNrC5bCQE0pD5MxRbaHJCPDassfadaqj04lWvI0hu2YjYph48y5Jd9/O2d6fKB+QRFdSJ4hX++3lZ6OoOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZavEZNAd; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOsETM8cNB9hnyf1V1FA4toPcapyQob75B4sKGDzmudxI8KwkHBG+ORo+9LMFHz+Y75nx4QzBcSaOdGQ7SvFUgcUdhmJIr9BKm8iKZ/BlTmMnJOa4P+Nc+p8w387txhfYU1q0WZaSQehggRzTId2k+yv/qM2xkfqTxOdI5szw1JgkHKqcjmJlRN6q2Yx7rZs6Kyi+Ifg/0dv5eitrQ8b7YojEBg/cgSZACi6outQVP/5HwYT7jIriQ3wpHKF9/RPZPX5TiyqoiTI7A7T/rcjhe6grov4iRbP1PApmMlt7UnL/30g3gYc75BAmGGDOWYat2mbTdRP7CxibYdZIqvt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc2YP2QXtKxLHF4anGkAHdSki56Tzyc/gG2xFb2zTAk=;
 b=AMNBfBz3nx1iinKPsVhWmG6xeRuJxXBJ4/Z/Evq+8dTVpX1mKvG+jr7eIQCO3Izk3yUEqKddmDWUaGFLiyIaqtg6VyJ2P0FLebtsqhC3UrXAXVImDv8RLwlKAi72/eu9V3Y38ZNv9+F+oYHGLquR+sHTXTyx8UTfYxj8zjlNwul5TBNkqZLeXD5M0nCFy9ZLxRpDZdEvqrSu3u1s4Ro8nbAdwVKRJh1DSU0zq5DmlEN2YJXofrtiyekgRPWnJZ5SYE/UQa44PURE7i6aKESo6O1gdY1t7kKqJldNGNw90B7UJHPgj/OKyApbSe5SfNQGpOX8gjhKJVeqIxp/EHXvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc2YP2QXtKxLHF4anGkAHdSki56Tzyc/gG2xFb2zTAk=;
 b=ZavEZNAdSCvuI2KGPGZWPjXxALN06vof+1R/0/KbjMCzmddAVoFn3AOq9ErUP5zwlI5gchFHtxac/UeGNrav/G1cyLjAAum8Pm8uBWjCEjSsThA7y2CTgfSz4E3dNCGTdwpsAmGHpYhgD6DTjIEEN+K0j5rgi0RkUK0+eNKD5sQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5309.jpnprd01.prod.outlook.com (2603:1096:404:8025::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:46:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:46:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Topic: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Index:
 AQHbcm43r4oLrSpVA0ON7evH4m8LNLNAlqCAgAAAnrCAABBIAIAAAZ4wgAAEBACAAAF94IAAAOFQ
Date: Mon, 10 Feb 2025 14:46:14 +0000
Message-ID:
 <TY3PR01MB11346287906F19FDFF7ACA52886F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
 <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
 <TY3PR01MB113461CABD5E18F03B7BE9B8486F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113461CABD5E18F03B7BE9B8486F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5309:EE_
x-ms-office365-filtering-correlation-id: 7acf404b-e361-4f53-d4a0-08dd49e1ab27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UytLZHBwQ3ZmWG5UdW9yTStPeWlPUDY1UURsZVJ6ZXZIUGF1bGZZSmZVYlBj?=
 =?utf-8?B?cmdhUk1FeEYzVWpVQ2JhbjByRzlPSlBpQVNtTllEUWxJQ2NMaStaWU9pS0pw?=
 =?utf-8?B?ZVpidEd0RnI0eWhrNEEwWlJvZGtnQ2FOSFhUYkRDSHVyRStRdFMzNnhtYndz?=
 =?utf-8?B?OU5CdkRyb3pVWXJ1aU1iVlAxQTZzcEdSVUtGSWFabElsSk5WMGxPV1pKWDBW?=
 =?utf-8?B?L2JNUU85RlhvcGsvSnhFN0xnbUY1MDl0L1NjMk1hNE5XY1hOWElKSTBUSjdl?=
 =?utf-8?B?Vy8xWG5yT1J2aGZHaC9OZ1duTTJuU1hUcEJ3cjYwRkVXc01jZkt2cThkc0Jk?=
 =?utf-8?B?cUl6bWRFSFdoZUdxME1pVmIzajJ6U1I5ZWNIV1FEb3o4eEdkKys2THRJWjdX?=
 =?utf-8?B?aGd3bjM0a0o5bmVEKzBDK1VmVDhVbm9zaUROQ2pPRWlUTmpTUEhmekZDcHpP?=
 =?utf-8?B?NHhYOEN6b25WTGtJTVdOc0JoLzgzcHFsSWpnVHVveUxZMEo5NGpGR1VpdWpx?=
 =?utf-8?B?MWRxdWtKMWsrSDJ0WDU4NGdDUDNmdUtzbS96Z21KUWlLNElZS2JqVk1ndG9r?=
 =?utf-8?B?Mzc2T1djaU80b3hhLytBWERoV0dkVm0wYXZ2WWVONk5JWkdQdWNQcTA2b2RJ?=
 =?utf-8?B?dktwRmc0ZklHV2syVlFMdUtwMS9hYUVXWWV2L09QckNqTTIwb25MZmZrZ3Bj?=
 =?utf-8?B?N1dtQmlhdzZtQUc2U05CbWtqN0xaMEgzTFcrWUdCcTc3bHloRkhENjUwdHlK?=
 =?utf-8?B?OU5GQUNJTkNlTTl2N2ZSVDl6ZW5sWTlmZTNHYnJNUnJnZG9YcHVGMkdUdmFj?=
 =?utf-8?B?OVZRUnEyTnl0dUxDM3FIYnNWNGc5YmNnQmt5WTRVNW5VRUhiZUhHcjkycGRG?=
 =?utf-8?B?UFJMUm9GQzlOc2poZ1hnTzZPWXE3V2NhVzRPSVFQdFkyUUV4NUlJa2NYdFMw?=
 =?utf-8?B?a1l3K0RXWjFCa2I5My9XY1pvQ2JLMDY3QVNZWTI4SVRoaUlmM1dzelQ2SXNQ?=
 =?utf-8?B?SW9OYnRtTG9ZY3JPOERPWGJta1RmenZqTXNIWVhzWjliZ2JhN0ZvMld1N2k2?=
 =?utf-8?B?VmVacFRaSTVUK0U3Y25xNDFZZHZ1dDd1NlRSa1VvV0JmSERDbFc1dldqSzJE?=
 =?utf-8?B?bWFCTGFBMlo2Q0tmcDFLRGFrRmFMcndlZnRaM29qSzU3SUNGb0NMUklldHBV?=
 =?utf-8?B?SHNyZDZLV3U4U1pGZUVHaHk2R3d2VWYrRFc0MmN0N3psOHB0dWlPT3lQbUlV?=
 =?utf-8?B?a3Ivd0lORmFuNkFueDl5bi9zaStxa0ZyYkl2Z1pCejZ3dHBoV3ZQMW9SYU5i?=
 =?utf-8?B?S3JZZ0tSYTdMbHJ6dUp1N1VpSWp5L2lEVjRuQ0ZOdEorOGNodjYyQnk2d0Q0?=
 =?utf-8?B?QTBFYjV4b0JKL09jMWJDSERPejJhNFFGbHlrako1eExHbVZlTUtoeHlOQStu?=
 =?utf-8?B?VkdXNmJGMjFjUTFpT3VLUEZBNzhFK1Nka0VGcHExOXZJTGdSTmpsWEhrRkNG?=
 =?utf-8?B?MFRNcnlHbVB6M1gxb2hWMVhPdnB3TDBZN0F5MGs4KzZ3eU5PamZONmJpdE51?=
 =?utf-8?B?aFRFUW96TVBWS0VPaktuQWUzVHp1Qzk3dkVnaG1VSnRGOVNMSE91UVdYL2Mw?=
 =?utf-8?B?K0d1SEUvQ1h4cWtmZ2VFR09jMGl3eTBxT0hXQUN6dGx3UWkwZWFsRmlCSDU3?=
 =?utf-8?B?OFk5L0EzbDZtNGlRQk53SEc1MURwM0ZNU0hyaWgzZ2xuQ0xPU3UwMjNzcUZ3?=
 =?utf-8?B?bHp0MkNjaFg4bm9CMDh2VEdVNHZlWlEwT2w3UWVWTGswUy9kU240enpYMklh?=
 =?utf-8?B?cllIbEROTGt2VG92cVErTHFUUUdFWXFoNENPYnJVRHR6STQrbitCbTc2WktF?=
 =?utf-8?Q?CXbkRKKNWjZW+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VSswN0hReHV2L24zTEVRbVFOc2VVOERKaFF3MnZxejJCQTJuQ2RBSWE1MklS?=
 =?utf-8?B?dDdvWThXUHluS2ZtMWhucWRTOGtNT1BoSGw1V2lwM1RmaFNYY0xBdzdvWFNT?=
 =?utf-8?B?cmU0REo3Uk8yVmlVa05CMTc2TFFNMDJkYng1MFZTbVhpMXNYYVdmbW1hVTVL?=
 =?utf-8?B?WnVYV213bk1uOTVlMlZ4a2pHYXQycGhFeGdwLzhtWkw1SVlZa2JLalRlTkxS?=
 =?utf-8?B?emxJdDJPajhVTWI3ZHB2OFIyWThVejZNaVNUbzgzSzJ1dXZPaGh4S2lkQ3JP?=
 =?utf-8?B?UzRCcjErTTZvRHRmYVN6WWkraWRqWWk2NE83MnVGZWprQU9lZEovT291WVl2?=
 =?utf-8?B?OThSdGJ2VGJqenFLWm1Ua3MrRkxjTGlMMVpiVTZVYVlXVC8yaWVrY0w3RzdR?=
 =?utf-8?B?bG5iczJPQks2Tlc5cmJkTXZqNCtEQlNBcDNaZWZtb2hyTXk0dUZ6QStWWWJa?=
 =?utf-8?B?ckJ5QTIwZHVFK2JSdUNmT0lPL3QzVWZwcFNKbHhpSEd3eTgxcFFweFpXN0RE?=
 =?utf-8?B?MGRtUEEyeFk0aXpiTWlhbTBzYXc4Wnd5MjZjOUFZYlFSS2h1K0kzbFZudHBq?=
 =?utf-8?B?MTFOTzltNkI5cnlGWkIveUE0Q29jNG8yUDlDby9Od0pqSUhwYmpkQWFBUDlw?=
 =?utf-8?B?SGxBc1g2N2FSd0l2cTlaazRnMkRTY1ROS1NtekhVWEljRnZXRmJEK2tHd2Vy?=
 =?utf-8?B?Y0kvR2RpMTBuREsyTyt0b1pOYlJScHZGNUV5L3VnZlR6SDhzUy8zcm56NHdn?=
 =?utf-8?B?MXJ5UzNCNEcxN3lXT1FZWFEzdTdXL3hxWm4yeHZZbGZVaXkxRkJlcXN2MS96?=
 =?utf-8?B?Z05PU0xrcmp1akJwTmp4Z1BMTnhiRzRzQ2JVTlBxR3JlcDdFRkd0aUM3UWUv?=
 =?utf-8?B?eGVKUWtqL2RWekpWWHB6ZG9kRzBtbXd1NUxlTmhjVXcrN24xOXJiMmF0VUt1?=
 =?utf-8?B?bndPK2ZzdlFpeVIxK1VFSjlXVVl2cWY2Rk5zZ3ZzSXQ4RnRpTW10eFc0aWJC?=
 =?utf-8?B?MEdRRGYwdEV0T2hYKzRxL0xUSENFVTZTTzdIQ0pvRVVXbi9vcjlUZGlONDVo?=
 =?utf-8?B?R01PK1dVcDF3OUxvZ0hJOXhLSzVjd3VmeTFkTDUvNnZ1R1ptZ3k0ZUxnd1N2?=
 =?utf-8?B?K0NZS0EzZXBJRjlPUHovS1JVNXNrYi8yMjdDTm9xTVhVb3pNMHZjR3YrQzgx?=
 =?utf-8?B?eW9mQmtteTJLU1d6bmZKaWtZL1pKZUhWYnl6NVd0MGIvRnAyWmE2RDVkL0tZ?=
 =?utf-8?B?bVFYRGZrQWQ2LzFDQVB3c1hFa2c5Q1BYZHhMeHl4ZWVuRUlVQU1MdUhHbFZ3?=
 =?utf-8?B?YUVHeVlnY0xhcWN2Nllqd0ZHNHpwRGRzMnNZR1B1RlhCekNqYklmYnhYUHRF?=
 =?utf-8?B?VlI3MGZtOXYydVp3ek9OblorR1RLSDliMlh6eElBNGtGdmVNdmx1ajVCcmZI?=
 =?utf-8?B?VXg4bitZZVR4TVF4eVlxS1Q0b0xWMFJKODZYa1h0dW4wbm9WYWdnVGNmZVhG?=
 =?utf-8?B?cnVoYWJtR21MaCs3M3R4SHlhZmZzeitMVkFpNGkzaEN4NUJQZ0hnMEtWTWQy?=
 =?utf-8?B?bFlnOU1SdHd3L2FWcnczSTJWS09yRWd2MHJaSktIZG9ycW1vMXM2b2xXaUlE?=
 =?utf-8?B?NThFYVB1S1gzZC9Qem5UTXFlQ2dVbHVZUU9zUUxKQ0puQmJocDhXcEVKL01v?=
 =?utf-8?B?akNtWE9QUTZiVDcwWUZPZXpUQXFVU2NGbjhWNHlVWWtFbmdrajFpb2N0N2VM?=
 =?utf-8?B?ZEIvOE9WUENEazEwZFZBMzlMaU9lcUdac0JiK0w2RTgzcFd3eDRTR2NZUFdL?=
 =?utf-8?B?Ump2cktZalo3dTE0OS9tQ3d4d2ZmTmNLR0txUzVDMHBtT1lPOGtXWWhnYlY4?=
 =?utf-8?B?Sm95Ly9YS0Q1WUJJUkFoamZrM2FXSEhnZ2d2blhEWmQxNUJoQnZTUVNoYzl6?=
 =?utf-8?B?eTVLKzVkRXpZZ2RjS1cyalRFOEdxdmwzSEFhNDBsL1hLbTVPcVRSRjNXakZB?=
 =?utf-8?B?b0lNMGRVeXVNWEZUbnlPL0JqaVVscHZTTHhkYjV0S1VWQzJicTBlakNsME1Z?=
 =?utf-8?B?enhZMWZQd2g5V09obkJ6NFNLQ0lWUTBWMnRSVVUwbkY5MmZiU0Z0QzdMc2NI?=
 =?utf-8?B?SmhKSS9DRFNMTUkya1d5bTIyZm1DTlkwSGR5NytoSVhpNjc4WVpZSEU1WFlI?=
 =?utf-8?B?WXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acf404b-e361-4f53-d4a0-08dd49e1ab27
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:46:14.4005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIzzpK1rIsVVhx71CjyM+9PBa6vJYleM+wxieNb8L9ES+Nk0qoLQQM3zYLR1Pp9b6NsvLZilluFu3SyqhukPT8bT3UK4nf3saFqpoalLP0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5309

SGkgR2VlcnQsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IDEwIEZlYnJ1YXJ5IDIw
MjUgMTQ6NDINCj4gVG86IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMDIvMTRdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IERvY3Vt
ZW50IHNjaSBiaW5kaW5ncyBmb3IgdGhlIFJlbmVzYXMgUlovVDJIIChhLmsuYQ0KPiByOWEwOWcw
NzcpIFNvQw0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4N
Cj4gPiBTZW50OiAxMCBGZWJydWFyeSAyMDI1IDE0OjM1DQo+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCAwMi8xNF0gZHQtYmluZGluZ3M6IHNlcmlhbDogRG9jdW1lbnQgc2NpIGJpbmRpbmdzDQo+ID4g
Zm9yIHRoZSBSZW5lc2FzIFJaL1QySCAoYS5rLmENCj4gPiByOWEwOWcwNzcpIFNvQw0KPiA+DQo+
ID4gSGkgQmlqdSwNCj4gPg0KPiA+IE9uIE1vbiwgMTAgRmViIDIwMjUgYXQgMTU6MjYsIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiA+IFNlbnQ6IDEwIEZlYnJ1YXJ5IDIwMjUgMTQ6MTUN
Cj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwMi8xNF0gZHQtYmluZGluZ3M6IHNlcmlhbDog
RG9jdW1lbnQgc2NpDQo+ID4gPiA+IGJpbmRpbmdzIGZvciB0aGUgUmVuZXNhcyBSWi9UMkggKGEu
ay5hDQo+ID4gPiA+IHI5YTA5ZzA3NykgU29DDQo+ID4gPiA+DQo+ID4gPiA+IE9uIE1vbiwgMTAg
RmViIDIwMjUgYXQgMTQ6MTksIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+
ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+
ID4gPiA+IFNlbnQ6IDEwIEZlYnJ1YXJ5IDIwMjUgMTM6MTUNCj4gPiA+ID4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMDIvMTRdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IERvY3VtZW50IHNjaQ0KPiA+
ID4gPiA+ID4gYmluZGluZ3MgZm9yIHRoZSBSZW5lc2FzIFJaL1QySCAoYS5rLmENCj4gPiA+ID4g
PiA+IHI5YTA5ZzA3NykgU29DDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gV2VkLCAyOSBK
YW4gMjAyNSBhdCAxNzo1MiwgVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnloQGJwLnJl
bmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gRG9jdW1lbnQgUlovVDJIIChhLmsuYSBy
OWEwOWcwNzcpIGluIFNDSSBiaW5kaW5nLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUaGllcnJ5IEJ1bHRlbA0KPiA+ID4gPiA+ID4gPiA8dGhpZXJyeS5idWx0
ZWwueWhAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2Vy
aWFsL3JlbmVzYXMscnpzY2kNCj4gPiA+ID4gPiA+ID4gKysrIC55DQo+ID4gPiA+ID4gPiA+ICsr
KyBhbWwNCj4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSwxMDAgQEANCj4gPiA+ID4gPiA+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0K
PiA+ID4gPiA+ID4gPiArJVlBTUwNCj4gPiA+ID4gPiA+ID4gKzEuMg0KPiA+ID4gPiA+ID4gPiAr
LS0tDQo+ID4gPiA+ID4gPiA+ICskaWQ6DQo+ID4gPiA+ID4gPiA+ICtodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9zZXJpYWwvcmVuZXNhcyxyenNjaS55YW1sIw0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ICJyenNjaSIgaXMgSU1ITyBhIGJhZCBuYW1lLCBhcyBTQ0kgb24gUlovVDIgZGlm
ZmVycyBmcm9tIHRoZQ0KPiA+ID4gPiA+ID4gc2ltaWxhci1uYW1lZCAiU0NJIiAoc29tZXRpbWVz
IGNhbGxlZCAiUlNDSSIgb3IgIlNDSWciKSBvbg0KPiA+ID4gPiA+ID4gUlovQTFILCBSWi9BMk0s
IFJaL0cyTCwgUlovVjJMLCBhbmQNCj4gPiA+ID4gUlovRzNTIChhbmQgbW9zdCBvbGQgU3VwZXJI
IFNvQ3MpLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEJUVywgSSBiZWxpZXZlIHRoZSB2YXJp
YW50IG9uIFJaL1QyIGlzIGFsc28gdXNlZCBvbiBSWi9OMiwgUlovVjJILCBhbmQgUlovRzNFPw0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEhvd2V2ZXIsIGJpbmRpbmctd2lzZSwgdGhleSBhbGwg
c2VlbSB0byBiZSB2ZXJ5IHNpbWlsYXIuDQo+ID4gPiA+ID4gPiBTbyBwZXJoYXBzIHlvdSBjYW4g
anVzdCBhZGQgdGhpcyB0byB0aGUgZXhpc3RpbmcNCj4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxzY2kueWFtbD8NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IEl0IGlzIHByZXNlbnQgaW4gUlovRzNFIGFzIHdlbGwuDQo+ID4gPiA+ID4gUlND
SSBzdXBwb3J0cyBzY2ksIHNjaWYsIGkyYyBhbmQgc3BpIHRoYXQgaXMgdGhlIHJlYXNvbiByZW5l
c2FzLHJ6c2NpLnlhbWwgaW50cm9kdWNlZC4NCj4gPiA+ID4NCj4gPiA+ID4gSWYgeW91IHBsYW4g
dG8gYWRkIHN1cHBvcnQgZm9yIEkyQyBhbmQgU1BJLCB5b3Ugd2lsbCBuZWVkDQo+ID4gPiA+IGRp
ZmZlcmVudCBiaW5kaW5ncyB1bmRlciBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
e2kyYyxzcGl9Ly4NCj4gPiA+DQo+ID4gPiBPSywgSSB0aG91Z2h0IHNpbmNlIGl0IGlzIGEgc2lu
Z2xlIElQLCB3ZSBuZWVkIHRvIHVzZSBhIHNpbmdsZQ0KPiA+ID4gY29tcGF0aWJsZSBhbmQgaW5z
dGFudGlhdGUgYXBwcm9wcmlhdGUgZGV2aWNlIGJhc2VkIG9uIHRoZSBkZXZpY2UNCj4gPiA+IHBy
b3BlcnR5IHJhdGhlciB0aGFuIHNlcGFyYXRlIFNDSSwNCj4gPiBpMmMgYW5kIHNwaSBjb21wYXRp
YmxlLg0KPiA+ID4NCj4gPiA+IFllcywgSSBhZ3JlZSBoYXZpbmcgZGlmZmVyZW50IGRldmljZSBj
b21wYXRpYmxlIGZvciBzYW1lIElQIG1ha2UNCj4gPiA+IGxpZmUgZWFzaWVyLCBubyBuZWVkIHRv
IGFkZCBzcGVjaWZpYyB2ZW5kb3IgcHJvcGVydHkuDQo+ID4NCj4gPiBJIHNhaWQgImRpZmZlcmVu
dCBiaW5kaW5ncyIsIG5vdCAiZGlmZmVyZW50IGNvbXBhdGlibGUgdmFsdWVzIiENCj4gPg0KPiA+
IENmci4gInJlbmVzYXMsdHB1IiBoYXZpbmcgYmluZGluZ3MgaW4gYm90aA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLHRwdS55YW1sDQo+ID4gYW5k
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcmVuZXNhcyx0cHUtcHdtLnlh
bWwuDQo+IA0KPiBUaGFua3MgZm9yIGNsYXJpZmljYXRpb24uIFRoaXMgaXMgc2ltcGxlIHNvbHV0
aW9uLg0KDQpCdXQsIGhlcmUgd2UgbmVlZCB0byBkZWNpZGUsIHdoaWNoIGNoYW5uZWxzIHRvIGJl
IHVzZWQgaW4gU0NJLCBJMkMgYW5kIFNQSQ0KaW4gU29DIGR0c2kNCg0Kb3INCg0KTWF5YmUgZGVm
aW5lIGFsbCB0aGUgY2hhbm5lbHMgYXMgc2NpIGFzIGRlZmF1bHQgYW5kIG92ZXJyaWRlIGl0IGlu
IGJvYXJkIGR0cyBmb3INCkkyYyBhbmQgc3BpIGJhc2VkIG9uIGN1c3RvbWVyIHVzZSBjYXNlPz8N
Cg0KQ2hlZXJzLA0KQmlqdQ0K

