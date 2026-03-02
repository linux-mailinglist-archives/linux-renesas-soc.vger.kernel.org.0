Return-Path: <linux-renesas-soc+bounces-28633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPI9HUOGpWn4DAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:44:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC641D8F01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55282310A616
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 12:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F19D373BEE;
	Mon,  2 Mar 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BhMa18AP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D836EA84;
	Mon,  2 Mar 2026 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455099; cv=fail; b=iiGGPp5+jCBBxIn4JUX6VOftFp1gplVsc5R/JAABF/QTo84o8YKqoUVRNL6T2pC5EWr2aptKAZHDefYwZpTuqR1+dpeKzGNo/grTPktPqZSpDT+yWw1hH7WPRzB7cC3ymCJy3tndYuPsqa9eXsYGWDlprlo6hzoj8CznNh7YZaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455099; c=relaxed/simple;
	bh=HQBRLC6WpjJlzLqk26IWb+udWCCvBfMeHTVwLnIABL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KIDB4r7O1/O3C3vLYlGvq0HB209Ajb6CGVH5RBXBdcgLKtBDdMjgfdQEAyB1R75lh+b6suF2C7unOc6BVFmwa583+ZSTxIFo2jmLBmNv1SMCc6GKVPXIUY3thKvLKxXFZ4QEVjaMq67UnIH2Y9RNfeCBQ5ye51ZpTJi0qmTJGh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BhMa18AP; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg8/zntkGz2R7akKKD5IsuJcCLpw3us692do/EltKkb+6+6r0iv4UxSuidqLbo5BjNVB0S5MLQdXcNyIqi1mpZWZMj/7WOFoggUrVRQ0Gz1V0N6WV2PNDAbwYsgVFLmMmzW7IBcE+r9mZGglZEGy/PUd51RtM7sv0xXJ3o/CSXa7fICDn0IsItnJxM0HClkK7JiMvCVWlKSuik3H4rRHvL+ej22X3atMV3MZAOsQO5RK2LJspYxuJLRycPInTt/oZFi54xGlQhs2mrmGrJPQyKH7AaJEVJTnDzhUB3Ep0fv8qBtP8LFNA97ysA7ePDwpJE49+c0dDiV6wrszqdBmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQBRLC6WpjJlzLqk26IWb+udWCCvBfMeHTVwLnIABL4=;
 b=gRBAUfDDl5eL2L0nf/fNH5XpdP0D+A09xrTPF0LpPSStoe6IQv4Rx9KMvXp37TDEEyao20BY0+qf1h3fG7PbCIcAEFK34A7DV4GWC2y2IJe5c4RrUNnjP9m0l1ADI979nk0Bq76fORw3krjw9gLdt7n9pfIpGRADDABWBk1SnTInCv/cDywoxNwxTOO2aElJRMPKQfzrWCcy89Kucu5bGZa74nqRA38VDgcJNdD7Lzm7U7/gYIzAf/oAmlRl+7ElU9qrkVav3o6KfVeCh068+oLOTyIAIoscaG3UiVuMgw7KrqfTbddwHRpd2DDz01b5xX5qiOifK7cLx3FBV0XXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQBRLC6WpjJlzLqk26IWb+udWCCvBfMeHTVwLnIABL4=;
 b=BhMa18APpIVl/DwjTvBGMs7EmPVV/XMa1x7NRCr7mDFZWpZEroBaUSFjULI0AtHZWiZQayllM6szSyBxBxeheopc375I8mqZVUh4R1FT16fYHZaDdwsXitVoBbl38JRYijWXnz4lNIBLTlk/pkQlCiZtu9tgAZgHiGlYNGnN41A=
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com (2603:1096:604:39f::5)
 by TY7PR01MB14327.jpnprd01.prod.outlook.com (2603:1096:405:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 12:38:14 +0000
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796]) by OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 12:38:14 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Prabhakar <prabhakar.csengg@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v4 5/7] irqchip/renesas-rzv2h: Replace single irq_chip
 with per-region irq_chip instances
Thread-Topic: [PATCH v4 5/7] irqchip/renesas-rzv2h: Replace single irq_chip
 with per-region irq_chip instances
Thread-Index: AQHcpbd0yAeBx0k0CEm8sZ0djCk+zbWWXDUAgATZqhA=
Date: Mon, 2 Mar 2026 12:38:14 +0000
Message-ID:
 <OSCPR01MB143153862ADE03DD56F1A9B63AA7EA@OSCPR01MB14315.jpnprd01.prod.outlook.com>
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260224175618.3160270-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUD-YoEV9qk7Ghr4AwpnOUyL+kTd0TRXphuzty5HdwHOg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUD-YoEV9qk7Ghr4AwpnOUyL+kTd0TRXphuzty5HdwHOg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14315:EE_|TY7PR01MB14327:EE_
x-ms-office365-filtering-correlation-id: db006316-9c38-4331-12db-08de7858925b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 4Q3hKp+S/UYQ0xiNsdRajgRiUrec1KdJh2vikVGQzjSbvLnBok688nkND8W6rRVvZfHWPMvO1/2TnzhehSw5xGVPdLHz+0VKfne9VooGpPDu/NPvwT0uwWpssq34bCNjEnfOoi9w1O3xyZ2bM635QetYTZ4hiTBzUbF6hfTXyQMa67AUk2RzdqDYSOuANxfJF+G2SAZq9odMGu1sKezjH9gm0F8BX9dC/YZMKpbVupjSobQxl+7MHhlIsuwF6+7wEhZXRe921LCVQtJo1AbQoenTJFgibV8YbLmRTJmRgJMwoahOt+ngez1pPqfcLd0dHFLl4hYWaBy6R41YraCEg69LY4/ZWhmqLO5sywg8sM5XmiJAdzwJD0MGIfBKivvXDLA/9VbqOE9GOmJT2NtuKaZJvNcLHGVKNcmbIDHXfNgLfCoeuhXwMGj23HXZgNMdOd3XKVq2HE0i7zNg/SHqgBwEqkWstjMa0me1jXY1WQcbrdWhadr3jcirOI8lRx+KDzcL5tkK82mxJU7qyXcRv80yw/YkEjeG7SjowEjv1u/GgHZvGx7SMDaWI0ZYNZQpP5I18b4s+A9NlPvUvNDOkGeu7LjMlHhZYdRF+mJ6ur+ijyiXss5oFVMRsF7Kdm8+kBV/ruRlL/csdOVGEwdPGSVEe3fBN1eBXpJ9emM8JKSa+NMHIWDLXqV43hUnufluX13nsgQT8YjSmgOfZCc7Ht/loRnzbLD9lvxa40xbgvjtthDVZyy9lAxzVDsEXIGv8gtrraRaUWuwt01TFBYN/k3w0GedyguAgEXHVP/rufA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14315.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDhvc3dMd1JoNzFXZVo4Wk8zZUpYYy9rcm5SZjEvOEsxZFI4S2Z5S0RkYnk5?=
 =?utf-8?B?TVE2S0FzVi9uRVhYYVZqNEtlTk1TQklHVmY5TTZXNFAzanREM3ZUbFd3VFVX?=
 =?utf-8?B?RnJFSEtkMExTeHFwOXRUNndFcjBUVlAxck40eDM4SUZlc3BUYzUvckQvZlov?=
 =?utf-8?B?UkVpQTA0ZEU4bHJKNkcrTER2S2JueHMzQ0NpOW5sUTRoTGlWQk5KRFBEMW8z?=
 =?utf-8?B?a1pRV0M2eGxkL1VUQ25FQ0JYV1RuVUg0bmErYUgyNnI3TkFjVkVuTktIOTRn?=
 =?utf-8?B?YlVWWnFpSkFPNzFRaGZSSm1ZZWs3YXpIZUNRTmNSUFZnVlVOSlV5N05WUHBN?=
 =?utf-8?B?bVlIVUdXOFZHUjlYVFptUFFhSDFoTFRxWGVObzU5azFKMTQ3TEVhMEZuMVdV?=
 =?utf-8?B?ODM4Y00wVkk3VHQySlo1WWxzNXBZQTBmU082MmJ1UDNieFhwZlBEV3hLSnF3?=
 =?utf-8?B?WGJwN0UrM3JHeGJkM0Era2g2dEFqbFpzcmdobCtMU3lPYkl2NXJ5Z0FlcDd5?=
 =?utf-8?B?amRNMTdaV1pHVXFIQ0JnVGlIM1Zkenl5Y0g0SUxBWDlIUGJQajR5VXVkeW1E?=
 =?utf-8?B?UExlQk1kbldiNjNxVjJNNURaMGd0Uy9zSkxKdnQrSTNUc1lZYWZFMGFVd3U0?=
 =?utf-8?B?dk5ybTZxUzBnMlRqTXNLZGduRVhMK1lZeTJQU3lnU0ZYWWgwNGhMVFZZamJ5?=
 =?utf-8?B?dFlLRVBHdTlqL01SYlZVT2JrSWhHOXdXem54akFJVGlwRzRvbzhCbzdBd0RL?=
 =?utf-8?B?VmQ0cWZLR1l0YzBqMkpaeVBaUG5kNXFtUGZxeC9JY1FJNTM4ODF2V0pEbmpP?=
 =?utf-8?B?a05yMHZFbVl1OHJtd0wwMVF2eXVaNjZaV0dqcFRxQTV2R0hucW8yVTByQ1Jv?=
 =?utf-8?B?Q3czbXJEbG5mNUtCNkhtZ2h0UmNtOXBpU0pZMjlrdVpzMGdSY2JsL1gzbEMz?=
 =?utf-8?B?OVI2QUwzRXNZVWFKMWJvZUxJUFpMNVBoRCs4WGRCa21sWXRDbjJJNXIrVVdN?=
 =?utf-8?B?a3JmaWQ3ZHZxM1BXU1lvRnE0QkVzaDVIUm5ka1pHRGMydVZjT25rNmxoZ2Vl?=
 =?utf-8?B?L3VONmU0Qm5WNDViRDJpeHR2M1VJbDZycUZRRkkxNlUzKzF2QktHZ2dhZ0ZC?=
 =?utf-8?B?Vll6OFo1dUM4MTFZb3hrOVlpMzhSR29KR0pTY3VTVGhTcWlOeUtXQlJBMEZk?=
 =?utf-8?B?THBCMkVqWHJxWFlhYVNpNUdwaWxnNmx3SVNPejBNalVpNlB5WEJ3OWt5Y3F0?=
 =?utf-8?B?Q1ZTZUF4TDlGeWFHV3ZHSDVsNmF4SndKOW5FZlJUbDVrcnB6eHlJZ3RtVUJO?=
 =?utf-8?B?M3hUMG53UVRhZk5Ec1U5b0htNEt3WFZOZy9MVDNrT3B5ZUhtQ1ViR0o5NGxz?=
 =?utf-8?B?azQ0dUh0TE50Uk1tQ3JKQjNndWt4K2tJMkNaNjVxVmd5NXliOW5LUDFSenlY?=
 =?utf-8?B?UC9uVWNjYTE1eVRock5WMWE5cFA4WUtwQzhCQkJlSC9qdWNJQlBDbzVwVERZ?=
 =?utf-8?B?SDZwMksxblozbm02RmhDZXh6djFOeldjamhXYWd3eEZCYlU0dDNXSU4vOFZ6?=
 =?utf-8?B?cWZJYTZpaVViSGtSOUFLNUJCY2g0Y0owNnJ2NFJlYlBzZmxEUkZNSXlieDI2?=
 =?utf-8?B?ODF0WUVWUis4bjF3RXRMeHFDMWlMcXh4NmdJYUVBT0hoUzNLbTJLVWg2cXRn?=
 =?utf-8?B?Znp0aURMMmd0QmJwSTNRV1JhQUNtMXJzN2ptSlpvZmZXc3JKSllyZXRpNVBu?=
 =?utf-8?B?NTZCMmk1VVVtYk5Rb1pMY0tERFQrWHVnbVh5aUZQOFhxUERoTTVHQ2doZ29s?=
 =?utf-8?B?U2VrR3VXRWxoMkt5MjBzSkdKdCtDenByUjhCNEp1c1FjMi84S0x2eXdua1g0?=
 =?utf-8?B?VW5aQmtTSU9SYmFDWkpZS1dYaHVDR3pObVgrc3RBQlVpTzJOYUFIeU5YN2Yy?=
 =?utf-8?B?dFl6alpmZ2dpL3BBSTVoRE5xMHpSbE82REJQWUF5VjQrVzIyT3ZVbWtrZ1ll?=
 =?utf-8?B?ZmJOVE5JNExPZ21qaXFUNTZNOHN0ejdDSmlHTWVtTzFEVG9vNURIN2VXZStw?=
 =?utf-8?B?TFh2N0VwbGQ5ZTZGaC9GaHU5SlpEUFlwc1lYa1ZjZklBdWFHa3BYMUlpZGky?=
 =?utf-8?B?dnhwMlNlTXRPSGxvRGVvNFhISXY5cTl5MGNyN09kclRQZ0JHN0ZwdlFOanE2?=
 =?utf-8?B?VkRNeTd2amtHYTVKS0NUTmJkc0NCK2kxM2t5YUdqZmdKUjR3V3dQcFNvV2lk?=
 =?utf-8?B?anlrOUZ6VG9RYXlGV3YxRjhnRzRKVVZBOFA3NmwycUlQY2E1Rkpta0VRY09P?=
 =?utf-8?B?akhnbXZkb01WY1NTbi9SNitHb0ZHNkVkTjcydS84U0JyNDllVFI3RisrOVlR?=
 =?utf-8?Q?C8MU39QdXKUIs7lNfFKHCzh0AKsP+okwLQn+Y?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14315.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db006316-9c38-4331-12db-08de7858925b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 12:38:14.0557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzmqjyWByq2fpYJx8tmhhByuW7MH3horUQx8C7gSktvUwHf9+H/i4Y7ErMTkY6nrNKwRENwL5dqoYYIZfhqcWLDTHvqyoq0/4MuGcGjZUd3/krAWX/lMW8PsghxV1Yfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14327
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28633-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 8FC641D8F01
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KKEZvciBzb21lIHJlYXNv
biB0aGlzIGhhc27igJl0IGxhbmRlZCBpbiBteSBHbWFpbCBpbmJveCkNCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyNyBGZWJydWFy
eSAyMDI2IDEwOjI5DQo+IFRvOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29t
Pg0KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVs
DQo+IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdt
YWlsLmNvbT47IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2Fz
LXNvY0B2Z2VyLmtlcm5lbC5vcmc7IEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT47IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29t
PjsgUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNS83XSBpcnFjaGlwL3JlbmVz
YXMtcnp2Mmg6IFJlcGxhY2Ugc2luZ2xlIGlycV9jaGlwDQo+IHdpdGggcGVyLXJlZ2lvbiBpcnFf
Y2hpcCBpbnN0YW5jZXMNCj4gDQo+IEhpIFByYWJoYWthciwNCj4gDQo+IE9uIFR1ZSwgMjQgRmVi
IDIwMjYgYXQgMTk6MDAsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+
IHdyb3RlOg0KPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFJlcGxhY2UgdGhlIHNpbmdsZSByenYyaF9pY3Vf
Y2hpcCBhbmQgaXRzIGRpc3BhdGNoZXIgY2FsbGJhY2tzIHdpdGgNCj4gPiBkZWRpY2F0ZWQgaXJx
X2NoaXAgaW5zdGFuY2VzIGZvciBlYWNoIGludGVycnVwdCByZWdpb246IE5NSSwgSVJRLCBhbmQN
Cj4gPiBUSU5ULg0KPiA+DQo+ID4gTW92ZSB0aGUgaXJxZF9pc19sZXZlbF90eXBlKCkgY2hlY2sg
YWhlYWQgb2YgdGhlIHNjb3BlZF9ndWFyZCBpbg0KPiA+IHJ6djJoX2ljdV90aW50X2VvaSgpIGFu
ZCByenYyaF9pY3VfaXJxX2VvaSgpIHRvIGF2b2lkIGFjcXVpcmluZyB0aGUNCj4gPiBzcGlubG9j
ayB1bm5lY2Vzc2FyaWx5IGZvciBsZXZlbC10eXBlIGludGVycnVwdHMuDQo+ID4NCj4gPiBEcm9w
IHRoZSBJQ1VfVElOVF9TVEFSVCBndWFyZCBmcm9tIHJ6djJoX3RpbnRfaXJxX2VuZGlzYWJsZSgp
IHNpbmNlIGl0DQo+ID4gaXMgbm93IG9ubHkgcmVhY2hhYmxlIHZpYSB0aGUgVElOVCBjaGlwIHBh
dGguDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiBAQCAtMTY5LDMy
ICsxNjksNTAgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgcnp2MmhfaWN1X3ByaXYNCj4gKmlycV9k
YXRhX3RvX3ByaXYoc3RydWN0IGlycV9kYXRhICpkYXRhKQ0KPiA+ICAgICAgICAgcmV0dXJuIGRh
dGEtPmRvbWFpbi0+aG9zdF9kYXRhOyAgfQ0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIHJ6djJoX2lj
dV9lb2koc3RydWN0IGlycV9kYXRhICpkKQ0KPiA+ICtzdGF0aWMgdm9pZCByenYyaF9pY3VfdGlu
dF9lb2koc3RydWN0IGlycV9kYXRhICpkKQ0KPiA+ICB7DQo+ID4gICAgICAgICBzdHJ1Y3Qgcnp2
MmhfaWN1X3ByaXYgKnByaXYgPSBpcnFfZGF0YV90b19wcml2KGQpOw0KPiA+ICAgICAgICAgdW5z
aWduZWQgaW50IGh3X2lycSA9IGlycWRfdG9faHdpcnEoZCk7DQo+ID4gICAgICAgICB1bnNpZ25l
ZCBpbnQgdGludGlycV9ucjsNCj4gPiAgICAgICAgIHUzMiBiaXQ7DQo+ID4NCj4gPiAtICAgICAg
IHNjb3BlZF9ndWFyZChyYXdfc3BpbmxvY2ssICZwcml2LT5sb2NrKSB7DQo+ID4gLSAgICAgICAg
ICAgICAgIGlmIChod19pcnEgPj0gSUNVX1RJTlRfU1RBUlQpIHsNCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICB0aW50aXJxX25yID0gaHdfaXJxIC0gSUNVX1RJTlRfU1RBUlQ7DQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgYml0ID0gQklUKHRpbnRpcnFfbnIpOw0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGlmICghaXJxZF9pc19sZXZlbF90eXBlKGQpKQ0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoYml0LCBwcml2LT5iYXNlICsg
cHJpdi0NCj4gPmluZm8tPnRfb2ZmcyArIElDVV9UU0NMUik7DQo+ID4gLSAgICAgICAgICAgICAg
IH0gZWxzZSBpZiAoaHdfaXJxID49IElDVV9JUlFfU1RBUlQpIHsNCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICB0aW50aXJxX25yID0gaHdfaXJxIC0gSUNVX0lSUV9TVEFSVDsNCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBiaXQgPSBCSVQodGludGlycV9ucik7DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFpcnFkX2lzX2xldmVsX3R5cGUoZCkpDQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChiaXQsIHByaXYtPmJhc2UgKw0K
PiBJQ1VfSVNDTFIpOw0KPiA+IC0gICAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKElDVV9OU0NMUl9OQ0xSLCBwcml2LT5iYXNl
ICsNCj4gSUNVX05TQ0xSKTsNCj4gPiAtICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgaWYg
KCFpcnFkX2lzX2xldmVsX3R5cGUoZCkpIHsNCj4gPiArICAgICAgICAgICAgICAgdGludGlycV9u
ciA9IGh3X2lycSAtIElDVV9USU5UX1NUQVJUOw0KPiA+ICsgICAgICAgICAgICAgICBiaXQgPSBC
SVQodGludGlycV9ucik7DQo+ID4gKyAgICAgICAgICAgICAgIHNjb3BlZF9ndWFyZChyYXdfc3Bp
bmxvY2ssICZwcml2LT5sb2NrKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlbF9y
ZWxheGVkKGJpdCwgcHJpdi0+YmFzZSArDQo+ID4gKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1Vf
VFNDTFIpOw0KPiANCj4gV2l0aCB0aGUgYmlnIHN3aXRjaCgpIGRlY291cGxlZCBmcm9tIHRoZSBz
Y29wZWRfZ3VhcmQoKSwgdGhlIGNvZGUgYmVjb21lcw0KPiBlYXNpZXIgdG8gcmVhZC4gRG8geW91
IGFjdHVhbGx5IG5lZWQgdGhlIHNjb3BlZF9ndWFyZCgpPw0KPiBUaGUgd3JpdGUgaXMgbm90IFJN
VywgYnV0IGp1c3Qgc2V0dGluZyBhIHNpbmdsZSBiaXQuDQo+DQpSaWdodCwgd2UgY291bGQgZ2V0
IHJpZCBvZiBpdCAoYW5kIGJlbG93IGFzIHBvaW50ZWQpLiBJJ2xsIG1ha2UgdGhlc2UgY2hhbmdl
cyBhbmQgc2VuZCBhIHY1Lg0KDQpDaGVlcnMsDQpQcmFiaGFrYXINCg==

