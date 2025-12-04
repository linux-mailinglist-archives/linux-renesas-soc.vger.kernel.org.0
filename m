Return-Path: <linux-renesas-soc+bounces-25574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E7CA4AB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B01A3092F41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1E1308F18;
	Thu,  4 Dec 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="idt25HLp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F529D293;
	Thu,  4 Dec 2025 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867765; cv=fail; b=rcvhGW2zCDjm4gSJNnjqoYILNQb1CVi8e4tC9V6Ewm8Yg+bwswzZIwrY3zbFRd4smRZq7vCUx3kyghYAKfklVhGRE9jSPp//keyLhGRY+1xOvI6KOMK3ZTF20vXYdDWbPYNHybcCFGokT4+oU5IW7zmM6umWQgJmJMH9wNRDYaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867765; c=relaxed/simple;
	bh=IJ4FUMsE1aOSrPaYistFnqjke5EJoqG4HkcEdnCN9o4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h2aXxeCHNDxGLcU6NqoX3osHdUxFtQ3hSdnFCJ4fowewuAME2sed96/kBYtafhpjHZwR/eZFH+cuUskhPQIsBnJzTrRrYpm6Qq6xtzfKa9TisvrhDXCGg+eXq14/jBy9xkxYhHr5CHn0K2XhVhJJd6eT8vmVj4zU3QGn/nMVjvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=idt25HLp; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQcNoAcQSqRDltVHcep16WakF12jY8Pyd9IMQWeW9XtHnNvftWry0KQQxUpM6EABB9aEjk1UtlRiRNXFyI7FsYiiloF9vQ85lRV6ptubEznK0t6izIQDc4sqNk3xTj9dA2SNLTv5JB4iZxM5XXr2aeDlklms+VTLthmTwZ8fSxQ9SkNgmj5CBdgAos00D5R4NpM9s2RIsjSffmi7GN49rVvZd8vONGcenGBkiKqFau0g2VX0ZaNdiQ1oJwb1LNFFF7R/JKq2MdnwSwB3t+QRRol6b9u7XAb8WoWSBOWOvImLXutaK0jD0iKXiJZYZYb2A15wFJFQ/LfV6ymUYrXoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ4FUMsE1aOSrPaYistFnqjke5EJoqG4HkcEdnCN9o4=;
 b=F4c8C6BkAFPm+KahV6HBpLrHY2dc8kSJlxGsBEOyeluAE4jtfrXEBN5cqqBDPNAGjxz/6zyw0NaEPj5+AVj5dGa5EuoIO+FXZjcDHlKcNIJnqJPfTnndOezkp9AvwCchEo2rAzdIgP0TTLGCQBEDNxQSkCC4zIPWljjikBwaGLzcal3iZSi1R8qRgLWB2UFMtynl2VB6sNCdXN9mns66jkBVKSBf4CrO2XW1t7oaQ70v5fkon7kOy5dq+4VMkylNzaVJu9H6i5N5D1fSbqu/lYgObnULGM05O1P/CdL/H3SGkTMSHMLgF4dF/QwDjrbTJoQm9bHgAqTtCklc8XfcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ4FUMsE1aOSrPaYistFnqjke5EJoqG4HkcEdnCN9o4=;
 b=idt25HLpOp6WXb7LaGan0hG+x+enO6RUGsRR+xQxgTWMI54HNF5ETH6LynbsJqLI8J3shQ3ZvIPiYOLGtEIgr2tWEG+EEZVKfcR+EsUF3MjTLatvCkEPKJKqnIMhOgypWO8Hu5mMVgCW3/94m26i4AxXS/+9oNZlH515lWKuwV0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB10854.jpnprd01.prod.outlook.com (2603:1096:400:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:02:39 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 17:02:38 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	magnus.damm <magnus.damm@gmail.com>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH net-next 0/3] net: stmmac: add physical port
 identification support
Thread-Topic: [PATCH net-next 0/3] net: stmmac: add physical port
 identification support
Thread-Index: AQHcZT7MFzRRA71rTESfd5g0Q5Hcp7URszqw
Date: Thu, 4 Dec 2025 17:02:38 +0000
Message-ID:
 <TY6PR01MB173777655F56FEDC8AAE308FCFFA6A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
 <f169f89b-3694-41b0-a431-cc845ad659da@kernel.org>
In-Reply-To: <f169f89b-3694-41b0-a431-cc845ad659da@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB10854:EE_
x-ms-office365-filtering-correlation-id: 728dc637-70ac-4745-a2a5-08de3356edf7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3Z0aGcrZHRzMmZKcUVYd3liRWdBQUhDKzJJS1F1bFdzVCt5UW9yMVQ2TzlG?=
 =?utf-8?B?M2VvcDFtakJGVk1vSHRmYmZGV3pSL2J6bDdjN2kvclgyNUk1YVNtT093aXBa?=
 =?utf-8?B?NVRxeU9nVTNLdzNmTjBKQ1BZUnU3ZEtZZDV3Q002Qmt5RklYSm9JNjd1Y0lw?=
 =?utf-8?B?MStWb2tUcjZFcUJnb1dENFZWQ3pZRVBsSGVzRXhWUE1rV25XZWlYd1FKa2xV?=
 =?utf-8?B?S0ozOEdkbGlTUVFTbFJTejNRK0tndkVKVEdOTW9wVG1WdXRIRndKQkEzSzRh?=
 =?utf-8?B?WmNUSEVGVXBQZmVva1JhRmhHeW5wbDd5WUdLTkJ2eVBYNURRQVV2dldrdXBm?=
 =?utf-8?B?eUVXaE53QVlKR095WVNyek9zU3k4cFNJWXNBU1RIQmM2OFhqbGpkVkEwVDQr?=
 =?utf-8?B?VGFWUU9CejV6cEJhS1NvQk5oNm5QUnhoMFdFLysxWnlENkk5U1R2b2RyN1lQ?=
 =?utf-8?B?RHJPOG5XRWZzeE8waDUvVnVFbXJ2YVd6Njk1OEpLbGRzMnlHQkoxK0VvdCt6?=
 =?utf-8?B?c2VpSE1NbVJ5alhCd05qUXJIL1FOMzhMMGNpZkdOeWx4TFNwYWt1RmRKanJ6?=
 =?utf-8?B?ZXRzVFk2UzJzMFF5eERiczZ0eEdXbUYzWExCZGpabkdpKzd3OWVWQ2JXL0VC?=
 =?utf-8?B?NmFrUUVKVkhpay9sMGxOYUg4VlR5SnFsT1pHUlFRa04wOWNaUXcwdWRzUUdV?=
 =?utf-8?B?TFlzNTNaWUEram9ta2Y1STNKOFpVU2RQeWQwTkw4aFFQUmlQNUw1U3N0eU13?=
 =?utf-8?B?RUM5MWdDOFlScE01UVJsYnFZWG5mRWhqRzVKLzJtdzgraFFmNnRPWm40UG9H?=
 =?utf-8?B?RU5DVDE4RTI1Mnpvd2Nvb0o4QXVQYlpEa0ZEY3BWRmYrZ1YzME9GWGVONVJY?=
 =?utf-8?B?MUlaTGJYMDNJSmFhQnlKSTJLckxqR3RxT2hsYUJzWjlLQWtZMkFNYTM4ajU0?=
 =?utf-8?B?OFY2b2hMbVV1K0d6VmhtbEdHclg5akZienF0a0NwUjFkWGdFL2QyVnRwS3lr?=
 =?utf-8?B?L05BY3JzVzVZbExQRXIvSXdDS3dibTVmZW45RkI1SDEzNFcxLzhXOGd0RmE2?=
 =?utf-8?B?NktkVUtBak84ekd1Qm55OVNLR05sZ0ZyS1VSUzRhaXFWR2xwME9lVGlTZmsx?=
 =?utf-8?B?MW8zSEk2TlNDOHJ2M2VUeUpndzdMeUNRT3Z0a1N6VStKL2lBemRpbXBUYkhE?=
 =?utf-8?B?RUZOY0NRMHNKcjY0Z0E3MkIvZ2h5TkVEbWQ3VDJoWVg3OTU2ZGRrcWZpOVNm?=
 =?utf-8?B?MEJUWW1VeXFqRTExNk9jalZRdnBONHNBZUlRWXF1bk10Wmd5SWhMbjA3V1Fx?=
 =?utf-8?B?RXRHSzgrcDhrdUZzTzVKeFhuSDNOdUw5QWN6U3Nnbmx6L1JzV0ZFcTNJM0dB?=
 =?utf-8?B?eVRpNHV5bVVCMy9ianpMYzA5NEY1UkJNejJTVWdRQ29tdmoycHREb2c3cThl?=
 =?utf-8?B?M21WVUorQ21tOUpRTmJKcG94ZzlRL1ZPWGhSUENqaVoreVZvMU5uakhVTjFw?=
 =?utf-8?B?RkdRSCt3VmFLT0VEUFQ2MHNmcUQ0Vkxxalk3MDdnS0ZqbXA5bS9EaDJWanli?=
 =?utf-8?B?aEVjbWZiQkFIek4xNnlHT1NxNGdjMzFvb1lya1l6OU9vK1ppcmlESkVpTnps?=
 =?utf-8?B?M2lsbWpKR3p0bTE3djF4dWpLRmZ5dEc4U1BsSG8zTFlFU2YzUUFpam85MHQz?=
 =?utf-8?B?RkNVZ2pUNXNpbnZwSVVoZXY2RjFQT2RxbG5VTkpPQkx4eU5VVVdCMzd2ZnQ5?=
 =?utf-8?B?RmpvQ3NhTWFLUVVPdUFwVVJyMG1sUGpBLzlRNTM4TzBxZmtqSHc4REc5Mlhu?=
 =?utf-8?B?MWtTeUNrMkZzWEl6UFBEZTNTRm44d2tXNzlhbVp0SURCM1YvSFBleW01TnM0?=
 =?utf-8?B?WWlpS0JEanN4aDFybTRvKzR2b0QvNitNRUZaUGoyWHpjMXZqN0JrZFRqbFFI?=
 =?utf-8?B?S2c1c2toOXQ2R2RtOS9mZzJldCtvSW5iait0Lys1L0w4TjZlUTI5ZVZBZE9P?=
 =?utf-8?B?U1hhbm01Rlo1cDI3eDIwNWczNkZ5L2xPTVMrSUsvUTNzWjNSZWp4Wi9ZeGhN?=
 =?utf-8?B?ZTlUdUY3Rmw3YXFrd1grY09yRnUxVi9JclV1QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGduQnNWVTRuS0hDVVJWOUhYY1VLVlBqTmZzQVA0UUViVlBCWDhWT0d2Q2hJ?=
 =?utf-8?B?VnN1TS9kVHFLRFVWSmtJa1lLeU9Yc3pjL1R1aDFGaERDQXBXMUgyNDhjSXla?=
 =?utf-8?B?SUJvQU1kZ0lHTHZxM3lscFlrelJJT1dXSzBIdWFRZGxWR3lXaU9oVGpiQnYy?=
 =?utf-8?B?aTl3NkxFVm1oNnQ4K0lpV1dCME5pMmxYdm5RbGxIM05DYVBockVyamtscGVG?=
 =?utf-8?B?bVN0WkdhSEl2VVRranBOaDJLSDZuL2VFME9QNmJBWnJLUnN1QzZRT3dhQm9F?=
 =?utf-8?B?TDhvdzFlY0oybUpHV0NTRmtYOXNIRmUvM0FKaG9wcFlTSXdWWWRjY1V0TWtO?=
 =?utf-8?B?eDRUUEIvQi84aGNrOENzd3pDY2lJSkNmbGxZWjFqUkpSQWZCaGZxdEhXdUdC?=
 =?utf-8?B?ZloweFZuTzB5eXNmRlF0ZUUzVGdlT3lnRUFad1NlS1E0aWl6dWd0OWRMNzFo?=
 =?utf-8?B?Z3NaWjBNdlg4MWsvZXJ0aVRFL212clN0TmpPTGJWNkZDY00wNTVjdjBBQmpu?=
 =?utf-8?B?TlI5ZXJRdmRoelZhZ3RFbzB3eGVwemgweDl3Qlh1ZFZKdy9PTTY3cy9uQ3A5?=
 =?utf-8?B?T095d0xxNEprejZ2amdNUFkvV3lIUFIwbUR0NElrZ0FBcUpmUEs0d0NSb09a?=
 =?utf-8?B?dHFxekNTTmxaYkMzZmxCUWFoNmdKUnpPZWg2WFdLbUc2YktvVzlnaW5mTUND?=
 =?utf-8?B?UlNsTktLSEc1YUJCTXlISmllNWQ4dWU4b0NpVnJmUWlMUU5lNTU1TjcrVVMy?=
 =?utf-8?B?Vm53elBKL3crVGpaTkk0cU5KU2JFWEtEQlU4NUV3bTZoTGg0c29IakZHZSt4?=
 =?utf-8?B?dlZ2Nnc4anpreWtBWDE4Znh4SmJZQnJ4aEtzLzIwTElxK2ZOOFNBa0JNdExV?=
 =?utf-8?B?eE1mR2JGdnF1RFEwMmY2MHVaNk9XbUkvUUNYY1l6aUQvTEdGSFlYUXBjejFk?=
 =?utf-8?B?dGZrLzVtNWZvb2hNa3lhekFVdEM1S0lwZFJHK0VuRXpJTGZ5MDhnaGFpSWd0?=
 =?utf-8?B?ZjNHOVlzRlNQUWtDQW1RbGVMV1kybFVmeHJvekdWUVBSWkd5TmFTTldwUWtF?=
 =?utf-8?B?eEx0a1VWV2svQmRaaGZvQXdJYkZOdXA5L2pQcmNKaXFUMWNJRFJhU2hWdmJK?=
 =?utf-8?B?WTJ3cFNNS2h0SXFEUnZMQmhtWTgxU2dvRmlJQ29tVHlJd3J3V3hMUWxyRk1T?=
 =?utf-8?B?N2xYZHdtT3JTazYybFAwRHpSOEZuQmpvaUJZN0grcWtoclBxYVRvYnhsK3VY?=
 =?utf-8?B?U2Q0TU03UFNIK3AwSUw4MlBGWDB6RGlJVDZmaTYrcWlOSXMzSzN3dDM1TG84?=
 =?utf-8?B?RUVKTjZ2RTZaZUozaCtHdlk2V2IzcmhnRVhRbnRwYXN1VytLTWkwckVDL05v?=
 =?utf-8?B?VmJmVGxPamllQ0dRZm51MXJBNnN5Q1lydklXdFZxU2hSZ2RjNHZ3WEtINGdZ?=
 =?utf-8?B?K2FENGlXenpmT2pFbGZMU1RIcXdva3ZOYnVVM3NzRm93SnpDdzdSVEZMUW1D?=
 =?utf-8?B?SFJjRXNMMU9ReVBZZWJUamxWTE5kODRVMWcrYWQ2Z2IrYStZUGtSVW1vSktI?=
 =?utf-8?B?WGRobkgySnVHSlBHUm9YMW1mU0x6djFNRy9qeVhkeFRMVWNxNml3czVpRVlm?=
 =?utf-8?B?MHJPTitLaTBmK282Z0hndzB5VENoS1NDRDNKNWRLY3lEUTdkT2s4RXBJakw1?=
 =?utf-8?B?RmFXMVN0Sk84L3VvSGpwdzcrRDI0djNUc05wSkFIdUdXdmVsajJwTHY2SDR3?=
 =?utf-8?B?QTdjN2FOOCtES3NOR2NIaHBkR04ySm1nSkNtV1ZXTDZmbTJhTjV5TXdWaWcy?=
 =?utf-8?B?emhaMDliTzRyMnBNcExLTjduUDl0cHRXZnljY1VCL2ZuUm9EaS9YcExqYklh?=
 =?utf-8?B?UnRsK0ErOTQ5RE91RHlxMDAvU3VPWms3d0k1bEwvRjhVb0pZc1N0VVlUTEFK?=
 =?utf-8?B?ZlI2MzFwVGdrSlpqbUhzV1ZTSk5RVlRIb2V4aUZVVndqc1RkMFp1S25MNVhG?=
 =?utf-8?B?ejF5c1RLaVUxd2lnOElJUllnaTFIQ0o3OHc1bVoxUzlFVEJZbW1ab2xHb1hH?=
 =?utf-8?B?V2Z4QWh2NTNYUDR3Qmx4azJqZFhYSlA3cll3RGpyYS9mamNuRmw5RlBRTXcz?=
 =?utf-8?B?RS9XdjhMbm16ckZJT2tFSVk0dGFoYXB5QytnUTNLZkJBejFCNEl2L1h4L2xl?=
 =?utf-8?B?V2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 728dc637-70ac-4745-a2a5-08de3356edf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 17:02:38.5739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhCmMnq4lrrXqKnmnRpNWjK/5IG9Du+8d72sY9j/U0557fkgoPKrCctUSPubxKFsELv9Tk1Spa3eW93llGTNtbwL8JtQVlVtsD7B9CP6BPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10854

SGkgS3J5c3RvZiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNl
bWJlciA0LCAyMDI1IDU6NTUgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBi
cC5yZW5lc2FzLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgYW5kcmV3K25ldGRldkBsdW5uLmNoOw0KPiBkYXZl
bUBkYXZlbWxvZnQubmV0OyBlZHVtYXpldEBnb29nbGUuY29tOyBrdWJhQGtlcm5lbC5vcmc7DQo+
IHBhYmVuaUByZWRoYXQuY29tOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsN
Cj4gY29ub3IrZHRAa2VybmVsLm9yZzsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUNCj4gQ2M6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IENsYXVkaXUuQmV6bmVhDQo+IDxj
bGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+OyBsaW51eEBhcm1saW51eC5vcmcudWs7IG1hZ251cy5k
YW1tDQo+IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29t
Ow0KPiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IDAvM10gbmV0OiBzdG1t
YWM6IGFkZCBwaHlzaWNhbCBwb3J0DQo+IGlkZW50aWZpY2F0aW9uIHN1cHBvcnQNCj4gDQo+IE9u
IDA0LzEyLzIwMjUgMTc6NDAsIEpvaG4gTWFkaWV1IHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIGFk
ZHMgcGh5c2ljYWwgcG9ydCBpZGVudGlmaWNhdGlvbiBzdXBwb3J0IHRvIHRoZSBzdG1tYWMNCj4g
PiBkcml2ZXIsIGVuYWJsaW5nIHVzZXJzcGFjZSB0byBxdWVyeSBoYXJkd2FyZS1zdGFibGUgaWRl
bnRpZmllcnMgZm9yDQo+ID4gbmV0d29yayBpbnRlcmZhY2VzIHZpYSBuZG9fZ2V0X3BoeXNfcG9y
dF9pZCgpIGFuZA0KPiBuZG9fZ2V0X3BoeXNfcG9ydF9uYW1lKCkuDQo+ID4NCj4gPiBPbiBzeXN0
ZW1zIHdpdGggbXVsdGlwbGUgZXRoZXJuZXQgY29udHJvbGxlcnMgc2hhcmluZyB0aGUgc2FtZSBk
cml2ZXIsDQo+ID4gcGh5c2ljYWwgcG9ydCBpZGVudGlmaWNhdGlvbiBwcm92aWRlcyBzdGFibGUg
aWRlbnRpZmllcnMgdGhhdCBwZXJzaXN0DQo+ID4gYWNyb3NzIHJlYm9vdHMgYW5kIGFyZSBpbmRl
cGVuZGVudCBvZiBpbnRlcmZhY2UgZW51bWVyYXRpb24gb3JkZXIuDQo+ID4gVGhpcyBpcyBwYXJ0
aWN1bGFybHkgdXNlZnVsIGZvciBwcmVkaWN0YWJsZSBuZXR3b3JrIGludGVyZmFjZSBuYW1pbmcN
Cj4gPiBhbmQgZm9yIGNvcnJlbGF0aW5nIGludGVyZmFjZXMgd2l0aCBwaHlzaWNhbCBjb25uZWN0
b3JzLg0KPiA+DQo+ID4gVGhlIGltcGxlbWVudGF0aW9uIGZvbGxvd3MgYSB0d28tdGllciBhcHBy
b2FjaDoNCj4gPg0KPiANCj4gDQo+IFBsZWFzZSBzbG93IGRvd24uIFlvdSBzZW50IHRocmVlIGNv
cGllcyBvZiB0aGUgc2FtZS4NCg0KSSdtIHNvcnJ5IGZvciB0aGUgbm9pc2UuIFNvbWV0aGluZyB3
cm9uZyBoYXBwZW5lZCB3aGlsZSBzZW5kaW5nDQp0aGUgcGF0Y2ggc2VyaWVzIG91dC4gV2lsbCB0
YWtlIGNhcmUgbmV4dCB0aW1lLg0KDQpSZWdhcmQsDQpKb2huDQoNCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQo=

