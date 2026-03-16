Return-Path: <linux-renesas-soc+bounces-29467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JfhLELMt2kRVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:24:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36371296E84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48E083008240
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F26F3876CF;
	Mon, 16 Mar 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AhAdJ42J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12A38757A;
	Mon, 16 Mar 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653047; cv=fail; b=mBb/mtzkVVqzKP19DBqDlLx6qF4ddUB0Lx/UImsGZV2mFqpTTIIwidA148IIhRXpWdzx06Z8pcO9vIhHCbk9GBhkM3KvpXpVsL6RhCMyFxtA79RE4w2OxP/OyiU5WTtC2J8YHWEIX5rvk0rLLEIXaVefxApsTJOdh5dU+HJbmaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653047; c=relaxed/simple;
	bh=M9u3JGthekZJ+M+iWBtf0RSFYIivvuidZrAuNuvR1go=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sSDC8PPMLLzR1AObTo/jNMFp9zZ8KaoTiKWZ9LHeRzrnX9G5rAt9d4DiL78AMeEUdzBUZfaMeNt5MzMsyEo3sTh8KqqkyoR8DCkwoi5W6mwFiLVPwETinY//kgfZaIdV7Kr/KlIRTRZXv4COpD5CremkNjx3caTAjBWGcsJao/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AhAdJ42J; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+sd5Reg31B1vNnS+EoxY/aEZvJqY4w8KMTYuYT/jm6nbIPsv+gTF3amS3gGKkFlebzQwYzSxNQw8Z4dH4gd2sh2Mf4Q1bDYEuchRXb6U51MQe273xDLQ0XAItus2NzFk5/7AldZECUtUyOcnvBmDBEHVz+3/DeISwHJY4do2ZNPKjxNqd2O42xqI/oVa7wTggyAFFOQ+bUZA4CTn0XLxe75XebE1az/nFaDIG6pSjGj5J5O4iNxuChSZNyQjKowGZF1APuCvnulSjiH+1nvFdowCDk5rtN9WhtiVuJSdQA94hSq5tsU03x1Hk2MTay//HfSSbZf0qempAXOg/uj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9u3JGthekZJ+M+iWBtf0RSFYIivvuidZrAuNuvR1go=;
 b=NHlDZkjq+hyS7Yzl9g9zqb/BFTmhhzt0z89lD4U2YdAulHU3bUdq/3k4flJHl3CPrksItNO/49ccM4eMuPy6qXxLgnmbpJA90gUf2VUGLEE5WJL6xTU/XdWxBfRg/WTM8hVnmbFfI2Vfi6Ue8E83q6GTB7lkJgm+XXablFPRyJ7UgSCOtyLrYk289fOFXWyVgBH7K92Rzvispe7aGklnmW1CfFHUOf8QMT8xfM+evz7Wd61++qjZmcCAwiZROUrrOgvq3WEChi1MURInAo1Yithb/AbU0QAdeYr6T0IGxJY1VTR/4eKigRD+jtGROX4NEoPwLG+ao5ugXf2pjF+U8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9u3JGthekZJ+M+iWBtf0RSFYIivvuidZrAuNuvR1go=;
 b=AhAdJ42JswMpl2UKyLtBI3bnCZAOK2p5KbaHdRc+Jl9vhyHYJ6wZfL5qaSNu5jM4BTKpkHZIIYsJANtPxWNxLC/XD3EB5doGU7bHIWDBxsrsDxFPTPv6GyAC5AalZupDVTz2wPEpc6lTBaTZFmA7evns+1E4avxEiyOYnmkpuMw=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB7329.jpnprd01.prod.outlook.com (2603:1096:400:c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:23:36 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:23:39 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHcrXaXWsAo+bDDIUGq11MkFHUw/LWpiMOAgAdoV9A=
Date: Mon, 16 Mar 2026 09:23:39 +0000
Message-ID:
 <TY6PR01MB17377196BE939FBC79F082D49FF40A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
 <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB7329:EE_
x-ms-office365-filtering-correlation-id: f5436d8a-30f0-47ef-6752-08de833db55d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 I6KO3Fs7GATZTTLBQVyf0NNS6hic/PQDT/0vwjFH7dqK38rwRGtZgw7cwJ2eVKOXKLC85mxFPNMCfwFgAmIHj9TRbb2+73Pvq9B8fuUUFLYy5SNozzWAtMSEUSyFVWQckY8adl2EjZvlyzy6MR7bsYfA+5v7IQHMoFOILUzQ4Jfd39EHeNbNGHbtM4T5j1OfwIbvPjz2PyTrS1whp8tJKjYzKKeIX8Uo+0wJr/hgKv7HJ0/e0hXrnMH32F3j8mY7PKXxfgGYgWEUR0S3bCLP23MYYPgG3c9stEDjWxPI9H80fpsfm911FMmHZpmD4nNEmdyDsP76QRO8oxbjynaBh7qUJOp6f/tWAvkWkkxfzGvm9GKj3EgYzZUpKxfT2+DTI7FLuaa8lVhUZo5BACK6Kx/shOta1DrDzsPhFFP8Wh9SVrSjYoVJmKIuRHvBorI0jOe5mlUIx9H8U+I/yb0jx4iClM4wFZKBn262/fhyGNjkPwNBDszVOVgiqnBu1TMED7roUGLF2VocxIkWJUijBfJ8kSG/ab6E4t8kdsmdf3kezXzVNKxtac8sj8oSnqfb+sb/n1ny0Rc/YC/Iey275qwrPRZOkHAny8IRYpqRgWX4hoD+Zcx+xO4LUqYgzYr/80kaMDGGZ9c3X7HCFQin+/AhO/TMdsH4lfb6QmB51OmT+ZsZQuZTepcT9pvDluiNRQrPfMqMet34OZWPkZ/R4qHwrydhIvqe6svLBm193YwF+tGipJjtiV6Ro9h5viP8fPr7KiyXPNVRW6CNn5cWRoX4zYk/Enj0yo99P7VorQ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3pHQU80UXhzMGJVNWJFdjg5Rk9nWlFPNDRqVjhzWDZsejdha1R5WTRhN3dv?=
 =?utf-8?B?Ni9vS1pRb2RBUlB6Umo1TjVZbkZuOE1LWDE1b2svaGhnLzhoTkRBaEF4ZDBq?=
 =?utf-8?B?anVjUlJoMVY1UmZuMWJxeDVhOUNwTGxoQkdWYWpRWkxkRDltZG9sTmlhdTNY?=
 =?utf-8?B?OC8va2RlN0k3YzNKUW8xa3g1WVNDeXZ6dERWUGJIV3J4aXAzQjVyVVRYTjBk?=
 =?utf-8?B?eHNGRHhQdW5Fc2tWOTZ2UjJNZ2pxNUhyMlRHSXExaHNKRmpFRGIvaC9pc3Rj?=
 =?utf-8?B?OUVvZFQ1ZUIrZkNqelpidmFMQlcvenJSV0RzemRuK3daM1Jyb1dkYWN6Q1Fi?=
 =?utf-8?B?RnNZQXduQzFIcXNwUHN6QjlEbDFyYndWelNONlRhNWYyUnVLazR0UWFzRUZY?=
 =?utf-8?B?cVhYd2RvTVRGeCs2MTZvLzJONEtYdDFiYVUzMGh6UWl5aTF1QVBtdHEzYnpF?=
 =?utf-8?B?dk83TE5KMnZMbGNyczZ0N01BelVSMnZvMDVNZ0xIYzN2WlYvS092dG1ZcHlT?=
 =?utf-8?B?TTdxazhPVUtiVEFUYmErb2dXelFqNmJHbXlaVzhGYWswaWlyMThBbzYyZ1F5?=
 =?utf-8?B?MWRGdDdKTEIxVkxOcHNsVUtHclFub3Z1eWxhMkZRd21aelorbVc1bnF0bFh2?=
 =?utf-8?B?TDBsYW44LzJqVmZ0NDVUazBDamdCT2FHWHFGY2dMNG1tZ2pSNk12bzA4SWd6?=
 =?utf-8?B?U3ZPdHVlTm56b1orVlFXeSt5YzBHdU1hUUJEUG1PVE5yNTBRU0o1VWlTcGlY?=
 =?utf-8?B?dzVHMzNEVDdkQ1BwT3I0TzRKNlN6OWE5eHJzOEFiNW4raEJ3WnpZbU9ZNWNo?=
 =?utf-8?B?VGlqaUwrbnh3TkMyc1JUZWY5ck1QK1JqbHBqL3lBM3JzdCt2d1Y4bTRxZWZp?=
 =?utf-8?B?OFhDUjlidG1GMnlCeEVadzZGKzVWN1Z1UHFFNkl0Nnh6aTlwbytpRDludkJP?=
 =?utf-8?B?Ynhyb0ovbyt1Rzk5eWVJMWdGcFBVMFZldzZQYWwxWFlmcEMyWWtNc2tyRVJp?=
 =?utf-8?B?cFZiazhpdE1xQnNmcllST2hoOUo2UnNpRHBvQTRIM0c5OWtURTl2YVFYTnAx?=
 =?utf-8?B?TG43dFBSMWZDYVNuTnpWSXptLzdHMHNocWJiaUwvajdQOGk3RUR4akRZUFQ2?=
 =?utf-8?B?TWpWQUpueklIRjA4c1NnVGtDSUI3RkpHSGZkK3ZhSEE1YWU0OGpsd2krQmtC?=
 =?utf-8?B?MXlEaXdsSWVMaFZUWlFwR1pUMmJET3ZQOTBLQ0NuN1JpZ0VNd2VjQWtIU2VM?=
 =?utf-8?B?a05DcW8vVVRLcGx2MlZGZkVpbHdsQWpieGtqWEhKWVRzdUFSWkk1K1hjS0pK?=
 =?utf-8?B?NmNLbmcrL0kyWXNPT2xYcGFtdEZqeHhnd1IvcXdLU1A1RHJnTFp4eUJ1aG1J?=
 =?utf-8?B?VkJERWRNaWVUUGtjVkNFQUoxTkNOSVJuVmRoNnMveXplMTI1d0o2dUpuUy9z?=
 =?utf-8?B?TVo0NmZxTEN1L2w1REEvcnVxMGZlZEVjQ1lpYUxmODlTQXd1dlBSelc3c25N?=
 =?utf-8?B?Q3dlS1pON3FoWlB5c0RSbExGQi8vcWNoWG1WWWVjT0NvcGtTM3lyRnVDNWkx?=
 =?utf-8?B?K2o4RVVYNmdxblYxL3hnOEpNY1BuWTZTTTUrQ1czNndmRHZtOVNFdXo3aEtN?=
 =?utf-8?B?Ym8vR2p0TXluR2E0Uk9zYzVkcXhIRG1CSThacWxDcEhzQmNFSlVld3pUNXFZ?=
 =?utf-8?B?NGx2T3cwTExqTGUzUlM5MnF3cDBVT2FUa05HdUpUdEV3NTIzQlVPa0hSWjJN?=
 =?utf-8?B?ZjgzSWo3N0tPbk5jWlVyUWZmNjd1bFhrYVFlWlpWS3Z0SkkvMG16NG5pYjFh?=
 =?utf-8?B?UUowSFBLNldsb0I2MC9FMnpDV3FoZCtmNE9RTTYwUkNCbk13VmFLU1M5NDNj?=
 =?utf-8?B?VE1Ic3pOek1tTkRGd1gxMWpuMDJuMXNvYjhkMHhFeksrOFp0anEybTZFc3kr?=
 =?utf-8?B?NkNZTVVzanVpWFE5bC9XdndLSFJGWTFTTlRySU9BTmlRTU54UUJkRGo4U2ds?=
 =?utf-8?B?NEhQc2dpckpMNUNjbGFtNzByY1c1NzN0OWRiSyt1N1QzVXhsc1Zkd1lwYUY2?=
 =?utf-8?B?bEVHRUNFdmNCYXhPNUZFUXhRbDFjMGYyQXB3R1MxNEJaSmRLV2U3dWF1YWZa?=
 =?utf-8?B?YVdMbWE2ZGNsclZKcXBndUNyK1FYZlJ3OHg0RkgrdHFycHF4enBtWmN1Z1c4?=
 =?utf-8?B?QW1mVmlscmNlREdFQTZTbmp6Z2YyVFh5blB5c0ovUHJBY1NDdUkzd0duMU8r?=
 =?utf-8?B?QThMVG1CaUs0VWh4NzFYMEVWODkrUUhlRnpBRTM4Q2lBcU5FSjBJMmRIQnl0?=
 =?utf-8?B?cmZrNmdRNjFOcTJsTm9VbGJvVkpKTm9kUk9HWFFGc2FoSktJSTBVbHRrRXZp?=
 =?utf-8?Q?lvgpQFahuyh+EjR8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5436d8a-30f0-47ef-6752-08de833db55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 09:23:39.2201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/ZdnKHt5dVpNR8mJPLiBlnd2uzMWZgpBaCoUIkyB6TbRwaWJ4wEu36C624F79V5Ggw5IUVmUwGAebNqbbeqtatINfJR4snItnts0++g5Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7329
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29467-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 36371296E84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDExLCAyMDI2IDU6MTIgUE0NCj4gVG86IEpv
aG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2OCAxNS8xNV0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJj
Og0KPiBFbmFibGUgUENJZQ0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIEZyaSwgNiBNYXIgMjAy
NiBhdCAxNTozNiwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiBUaGUgUlogU21hcmMgQ3JhcnJpZXItSUkgYm9hcmQgaGFzIFBDSWUgc2xv
dHMgbW91bnRlZCBvbiBpdC4NCj4gPiBFbmFibGUgUENJZSBzdXBwb3J0Lg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0K
PiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDdlNTctc21hcmMuZHRzDQo+ID4gQEAgLTEyMiw2
ICsxMjIsMTEgQEAga2V5LXNsZWVwIHsNCj4gPiAgI2VuZGlmDQo+ID4gIH07DQo+ID4NCj4gPiAr
JnBjaWUgew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZwY2llX3BpbnM+Ow0KPiA+ICsgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gICZwaW5j
dHJsIHsNCj4gPiAgICAgICAgIGNhbmZkX3BpbnM6IGNhbmZkIHsNCj4gPiAgICAgICAgICAgICAg
ICAgY2FuMV9waW5zOiBjYW4xIHsNCj4gPiBAQCAtMTY3LDYgKzE3MiwxNyBAQCByc2NpOV9waW5z
OiByc2NpOSB7DQo+ID4gICAgICAgICAgICAgICAgIGJpYXMtcHVsbC11cDsNCj4gPiAgICAgICAg
IH07DQo+ID4NCj4gPiArICAgICAgIHBjaWUtY2xrcmVxLW4gew0KPiANCj4gUGxlYXNlIHByZXNl
cnZlIHNvcnQgb3JkZXIgKGFscGhhYmV0aWNhbCwgYnkgbm9kZSBuYW1lKS4NCj4gTm8gbmVlZCB0
byByZXNlbmQgdGhpcyBzZXJpZXMganVzdCBmb3IgdGhpcyBjaGFuZ2UuDQo+IA0KDQpTaW5jZSBJ
J3ZlIHJlY2VpdmVkIHNvbWUgb3RoZXIgY29tbWVudHMgb24gdGhpcyBwYXRjaCwNCkknbGwgYWRk
cmVzcyB0aGlzIGluIHY5LCBleGNsdWRpbmcgdGhlIGRyaXZlciBwYXRjaGVzIHRoYXQNCmhhdmUg
YWxyZWFkeSBiZWVuIGFwcGxpZWQgYnkgTWFuaS4NCg0KUmVnYXJkcywNCkpvaG4NCg0KDQo+ID4g
KyAgICAgICAgICAgICAgIGdwaW8taG9nOw0KPiA+ICsgICAgICAgICAgICAgICBncGlvcyA9IDxS
WkczRV9HUElPKDQsIDUpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICBv
dXRwdXQtbG93Ow0KPiA+ICsgICAgICAgICAgICAgICBsaW5lLW5hbWUgPSAicGNpZV9jbGtyZXFf
biI7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHBjaWVfcGluczogcGNpZSB7
DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWChHLCA3LCAx
KT47IC8qIFBDSUVfUlNUX09VVCMNCj4gKi8NCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICAg
ICAgICAgc2NpZl9waW5zOiBzY2lmIHsNCj4gPiAgICAgICAgICAgICAgICAgcGlucyA9ICJTQ0lG
X1RYRCIsICJTQ0lGX1JYRCI7DQo+ID4gICAgICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWlt
cGVkYW5jZSA9IDwxPjsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

