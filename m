Return-Path: <linux-renesas-soc+bounces-13210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12AAA38154
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66CF91667B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7C521773F;
	Mon, 17 Feb 2025 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HAAHIBkv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05528BE8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739790498; cv=fail; b=qBWZuwDIjGdThWeqfeKflpAa/V8pV7azIRXhgoxxYXtUYLf4ytm6CvSrgIDdRIhIEMrVUKE6JNNN/XmoQyMZQ7w93drkESKvk39UV/XgymAfl7rEreilN/T4XCucwknJYwlQLBtUcvxpnnXsY24Qf7/8+h8pL4g7MnUkzAux/mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739790498; c=relaxed/simple;
	bh=poOsVVU3GMYuu6uVpU/0LmmeHKRQcdDlGacC5H8Cbrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tl7wK0TOydcBWxgSViBadRIzNhxT7VgLQ0SBBEgIRmMq6CRdxD+2hGjtUwqtLfWc/8tuNnzqU8FodLwHuHRwzvGEEeEzWFNcaQg1TupxuW3WU5ARmsBIVhmtkq72sfPyN90EpomUKDX/lXUDmGipfMiUI1Dd+lZ1Ci3c2tH+KhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HAAHIBkv; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZnkwzIzJ+Me+t9ZgGp5w6pO50UhuUt5AlWyUiD2+KN4xwJ1FJ1zXJVCIMbSUhx7Di7jYiTq8kRbYX58gGeR9mHqLQWlrMXR4JgK2VEJp6ot4EfPvnzUgiaVRLvPHSs+JRv+sKjm7WJuOQv4fDjwvGc+Co2poZdpQGZn3f8zOlacGwLAHqsDpxLgfee8zC1EuNDvH1RtRSejfJmQxZJJJNAIP8AHgQdnjU8qmz/sZmZNLlMDlS8tssnKfxPWs7Fwneg/OMvXOsoXQ5rAUJdxbyjs9p0SKKtIMzQqcwZXkb0djrUtQuikAdoPXkP1almd7QooT72Ola2Uf6dDdL17XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poOsVVU3GMYuu6uVpU/0LmmeHKRQcdDlGacC5H8Cbrc=;
 b=dnx0jbul7aO3gyIj8hJ3R3LPVdlMrggCYPoPFX6DnewpzX2JCLCfLczQlWS7O7p+7jU9i7vBku2FRpS99JsbjCBhkFW1PA5BydaPblGxgZAW/k9FKcoBr5RG8ROlxob9W5Z4dZCb7n+e7rEksxzdGpw03V5w2ZX1BQdwxQnB8HtrAwcsblM06qwcmOnHR2FH6eP1LhX5fWL9OuF7YIo7JZ48d+q1kIRWDFaU+Dvrtf/zsfxHplH3TvRkqaGer/GtdFUJ9f8ywl39aPA6wNWgsyQKo5xZa2t81lkNj2kVGV8Oo/1VlCF0bgD5EynvHyr+x59VFh8XpvIvMNV0jJKYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poOsVVU3GMYuu6uVpU/0LmmeHKRQcdDlGacC5H8Cbrc=;
 b=HAAHIBkvdXS3DKgCTgqlMNerj70ev822ctDp1SNvBCfMLnGqGwHwjE9+lhMydj5W0o4g18aQoVIAeCCZLcq6tClpoO1+sdL9xoU8HXM0LrTZE9G/9JvFxQD0ZstvwBeHMBQyJjnBtFkC8+j0Yk7uwTrnVvTmWvGgxZ6KE/S/sl0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB10660.jpnprd01.prod.outlook.com (2603:1096:400:2a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 11:08:12 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:08:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Topic: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Index: AQHbfT8Y3I1B7eINBUqE9x3mj8SpN7NLQhkwgAAV+wCAAALH4IAAAuDA
Date: Mon, 17 Feb 2025 11:08:12 +0000
Message-ID:
 <TYCPR01MB11332CB5C33EFB0F40725D99886FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
 <TYCPR01MB1133241DF620FA6D88965C76E86FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB1133241DF620FA6D88965C76E86FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB10660:EE_
x-ms-office365-filtering-correlation-id: d8bae0f5-81f3-4aad-7eec-08dd4f435e63
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckZSMGh1SWNwU2hnUUZUWWJMdFBCck1KcTZmWDJLUU9DdHJBc21IdDZSNkha?=
 =?utf-8?B?TjU3YXpKVFFWeGUwT1l2bDRCcVMyUTJUVXdwR0J0VjVJaDUzTkV2Mzl1bU81?=
 =?utf-8?B?NGNSenRKdmwydVJPNVZRdkJYT09WY21OM1pFb1lsZW9heEVGdHlFTUVVTlJ3?=
 =?utf-8?B?VW9PSEk1T1lhQTRvNEt5bTlSOEFDQko2NGc3OUEyNDEzTEV3SEd3ODlpb0dn?=
 =?utf-8?B?L3E5aTdBN3JuYU1ydEhIZnlxZXlQbGY5NmIrMTlYbFZaNjBBS2FGQTRaL0pC?=
 =?utf-8?B?UG1QRHYwZFhJdnZQMDg0eHMrdUMvVkVCWmJpSndVZTg2amNWTEM1OHFUbW1G?=
 =?utf-8?B?ZDU1VTVFRGs3ZXo5Y1pBZ0lyM0FCMUtCUEZhTHZNbDUwL2VMdis1VWtScStP?=
 =?utf-8?B?bEU5Z1Q5MGo4ODlqZERqeHV6QWtrZ1JsTkxMYnNLWUpjRU5BbTZDdkVjTVBq?=
 =?utf-8?B?RXUrRitpNzJWRjNBNnl4V2N0VTFMemNkdFA5UXBIVjZsbHhxNktNVFV3aU1N?=
 =?utf-8?B?VjkrWXZvVVl4MVQ3ekJld2hUaEh4YVl6S3hvdHo1Q3llSTkycmNKZFVYNDcr?=
 =?utf-8?B?UWZYeTJLS3RHdlFEMW9UcnQxUzZGVUlsQzJNOWFEWXE2ZndqWmJqQXNoVlFM?=
 =?utf-8?B?MVY2ZmZXSzVqWi90V1EwdnFFb21CZklnQ244WldjQm0zRkJZVzhsQldqb1R6?=
 =?utf-8?B?d3NETmpFd3ZSSDhMYnRpdVdBTnZHbythYUxWZVZTOTBnNFNQbjZGY3Q1Q1Z2?=
 =?utf-8?B?dGxYa2ZtaXpwcUw2c1RTSXIwc0FGaGtKcHJVRkRPa2dMWXNmTFdoUWZDOWxM?=
 =?utf-8?B?NldZWWRPN0hjVWxiaFRMZW0zOTFkSmZrK1ZRMHVWa1oxYy80Zk1Gek56MEVX?=
 =?utf-8?B?Q0dpcC81cEhmZHgzOFlaQlVPZGI4a2djckwzeGJ3VnpTYVYvVVFWRnVMUk9w?=
 =?utf-8?B?dG9MZlExUHJIcnBLUTJxQThQRkJETmRHTXMxNTBONWp5alJ6VlVKdmFKS3Nh?=
 =?utf-8?B?b2xERW5NK0I4bkZzb2J5amRCM21uL0ZJMUtjNmMyY3dER2pYVzlGcCtxYlFX?=
 =?utf-8?B?MFJubU9UbW9iN3dxcVdOZjMyM0NvN0hxcUVzNGtXdEU4SS9Da0RmQnI1cno2?=
 =?utf-8?B?NUlNY0pkRllvaWtYYzdYckRmcmxOMlRBcjRGdU1QVWcrVGZ2MUNjZHh1UDhY?=
 =?utf-8?B?V2RaUXlrTUZMZGQwMWM3ZDVTV3RlNWt4RDJaVXVjbC9JZzMrRm1NdjBUWFVp?=
 =?utf-8?B?dmo5VUZJSWVNa0UzeEhwNlIwRTltOW5Ob0g1T2VCYU1RTUNnTVFiNXp6V1Uv?=
 =?utf-8?B?ZjRLb3cwUDNHT1k5clBodjNZVEtTNWt0MkRxdFdZVGg2SFVob2RJcDNpN3gy?=
 =?utf-8?B?UGZ2R1NBMVFDN01jTGFXVzZpY0JoajJFdEF5TG5mUUx0S3FQQ0JYTXNjREpV?=
 =?utf-8?B?UUNpekpsb21FMndHSVVydnowS3hmbWtTVWtkT2V2S3NkcVhrdTdja2RTd21j?=
 =?utf-8?B?bFlTU013cUlIUlJEWVFmdkZzNzRlVytOeWNEd1pMUTVBellkeEllY1VEUUdQ?=
 =?utf-8?B?cTBjdm5yZzBmY3Rhcmw3MlVNOGN3L000c29xN09WQUs0VVJISDk5UnhnTnM5?=
 =?utf-8?B?dU1IMWxpT0xIU3A5TlRsSE9lOWtlNlJOT2RSM01PdVE0M2FKU2pBNjN5MVZo?=
 =?utf-8?B?NmlUc0M2SE5QK05mclp6M0hxTTBhVXpwc1czUXhxZUZXSks3VmExNm5YaVhN?=
 =?utf-8?B?Z1ZEdDhPTS9SQXlzY1hMclQzTlQyMTlKZDlVYkVPdm5IbHlMTEFWdjZtZVhv?=
 =?utf-8?B?U1RFMmlYUWpHd0M5LzlLVThjTmQrVXdRV29vT2pRSXZ4S1BLaGNJd01ZeDNC?=
 =?utf-8?B?T0N1T1l0TncyZXJkemV0VWhCZEJFN1orZlcrZjhsS0g3aFh3ZTZrcWpVSnVZ?=
 =?utf-8?Q?PgEvHOon8NO9qtMMvKEjOWoa6JTHzr7k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R25lU2JPUXBBSXFwNjhVbEN1NGQ1WFhXK0FBcm9WaDQwVm80UFMvakNtWHdU?=
 =?utf-8?B?SDdPcmg0Wi80ancvV0pyMEJQNG9UZG8ra1hTSVo2ek40NGw3VjNJMm4yUk4w?=
 =?utf-8?B?Y1lYaml2NWNORWVJWVk3cHg5Rk1TbEpVbTJzZXlOd1l1TDRNVXF6c1V6aHhL?=
 =?utf-8?B?b1pUZ0VXSXNCNjdTK1dyY2h1T0xydDZvMEl3aEc2ekZTb1VCVE43bzlESkxs?=
 =?utf-8?B?TGhYblZ6c3pIaGwwc2RwdzJDS2tFaHVGcXU2bHJOc0xQejlDeXNmcklrSkFS?=
 =?utf-8?B?NUdNMjJydGI5L3UwMWd1cVV5QlVIY2J2bXYrTVFXcU4wb3VmVkkrZ0crWjQv?=
 =?utf-8?B?cExYZC9VY2JzK1I2cmhJRStGbFlxZjZhOWw3QnF5WTV1YVZDWW0wSjRmbENO?=
 =?utf-8?B?bTQ3RXdnUk1BU1JVam1wTWRDWTY1VFJuNGtoMzVGVVlDRUZUako5S1N2ZTZV?=
 =?utf-8?B?aTZ4WVdFOU5xdjA5VVVaalNsYzRPWnQxMVptZ3BURTVnRkZ6ZSt6L3RsMFJl?=
 =?utf-8?B?NnJ2SWlpSmRqcWtwTXJ0WXdZUlMwa1hKc3ovWGYrSWlrcnU0V041WmdBQ0VP?=
 =?utf-8?B?K0lGQmdrcDlldi9OcStTdXJCaStOOGFSNGlibVZ0Mk1PbFFLYWZRMDZFUVhm?=
 =?utf-8?B?N3hMNzJUVnhiQlljMzc4VzV5Mi9neUY1QnUreXdBdlBOSlEzWlR3T0RycW92?=
 =?utf-8?B?QmxuakVCbU14UVNqZWhoeVUzeWpRU2Zta2dEeGdTaWZCd25WS0dwekdEb0Ru?=
 =?utf-8?B?by9OeUJSSGZ5cmtXZGc3UHV3K3NqcmxiTjJGd0JqaUNFZXpnVVdUWXpRcGtR?=
 =?utf-8?B?ZGphWkpWeHBreUtSOW83MFBlNCtRaHpMbU9iTGZZaVVHMGMzVnNwUDBRNEZR?=
 =?utf-8?B?djd5dGFvUDM5VkJiZVZmZmpjNnp0enNlSFN1MmFHaUpmd2dwYjRUZFJBbDk4?=
 =?utf-8?B?V1Q4UGpLNFNiN3pmK3g4ZWllTDVvWVVaQ2IrTVRXYWxaRWhrUVl6U2lwM3Mz?=
 =?utf-8?B?aGxMamtGMEErU1F6UEIzR1lDWDhMeWI1bk93OVFodEZEb1diR05iLzFSbk9G?=
 =?utf-8?B?b1RHVnJCYkNOb1k5M0pna3NYQmt3L1N5TmdlbnIxM0RSZHRWbEhwUHYxLzVq?=
 =?utf-8?B?L0RoNGVNczhYZjdtTkwxUDRQRWVGMjdyQ1I1UFhhbWlKU0ZkbU1Rb0Z3bmhG?=
 =?utf-8?B?aEFyT1U1QXJFNzJYZEdNLzNya0lPU3E3dXl3akFFMlptS09vd05lL2EwWnB0?=
 =?utf-8?B?ZXRiQVFXeDhsTmhhN3VqU1N2YU9SUlNpQkJ2eEhJczBBT1J6em43bkRNb1cx?=
 =?utf-8?B?MXlOR0FXU0VzVVA4K0dlVEx0R0pCak9mMjRJWGoycUcvUTNnb1NYaEZUS3hu?=
 =?utf-8?B?SHZJV0NnRzArMlpibjc1aVFrcEp6NVA3MjU2M1NMZEhTOEFRQWh2ZHVKSmhR?=
 =?utf-8?B?M05tbngwVnU1VW9vakoxSTlKZ2N0SHRnSC9SOHZXbFZZQ3Z1dllEYlVRcjg0?=
 =?utf-8?B?Ui9CRzlyQmp6UnZ3T085R09qZUdWWnV4MXRCc3M0aVZkaFUxbjJtVjVISExN?=
 =?utf-8?B?OW1LbTNhbU9iTnhXN3pscFRBN0tUbGdlMzZ1ZWpQb2lmaGhNOU5wUWNVS2lk?=
 =?utf-8?B?Z0FoK0dxUWsvOGo1WHU5amlpSHZxYStyc2lycVYvRjFrY1RJNlNibThVcGJ2?=
 =?utf-8?B?THZTUk9YcVJSQ3Q4TkpHRUtIV1BUNmQycHEyU1pSaENkdG52anJ5Vk5aMHlU?=
 =?utf-8?B?UnlMaWxXRk4yMTFwRHFtMzJQSmpGMG9kRi9lTlI3eG5POVgvNWdGWnBkYU1P?=
 =?utf-8?B?ZHlxUGZ0RkcrdmZ5Z2tKdGFKWlo3R3o1aWZPWmFXbFVtL0VlMUIrNFBFNVph?=
 =?utf-8?B?em12UkxiS3BmZ1Rmais4akQ0M1RwbE1QRzlpZjZLbFRkblU5RGw0blVUMHRr?=
 =?utf-8?B?SjhPdVp0NHhmdlZ4dlpsOTlvWU52UHIyb1kweVdaZWpFVE1POFlKRWdRem1h?=
 =?utf-8?B?cktrTzJ5QytGKzJmdUhpKzVBY3Q4b1k5ejVNcGg2eEFvOWlVN0VGUktGVExv?=
 =?utf-8?B?NU5RdWl1Qm5oYitrUk5YUlp4anVFOVNqM0FUcWxmbDQ1dHVBWUJKcUtnemM2?=
 =?utf-8?B?bzkrR2JyN2tRVGQwSE81aEtRRWJLVktuMXBycHBXNUxyMjdKa2Uyei9ESGRk?=
 =?utf-8?B?MEE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bae0f5-81f3-4aad-7eec-08dd4f435e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 11:08:12.1028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ybn9RW9dwt+3SJmomyweOSDAtnjrp9qm46S9JlcPjGYlulDdf9W6oN3RwTxLd2356YHQBZFMg+REzBWONvwBKX6z9lKGYgK6q09Tl2BsI18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10660

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogMTcgRmVicnVhcnkgMjAyNSAxMTowMw0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDEwLzEy
XSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IERyb3AgVFNTUl9USUVOIG1hY3JvDQo+IA0KPiBIaSBH
ZWVydCwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+DQo+ID4gU2VudDogMTcgRmVicnVhcnkgMjAyNSAxMDo0Nw0KPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMTAvMTJdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogRHJvcCBUU1NS
X1RJRU4NCj4gPiBtYWNybw0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IE9uIE1vbiwgMTcg
RmViIDIwMjUgYXQgMTA6MzYsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4g
RnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBTZW50
OiAxMiBGZWJydWFyeSAyMDI1IDExOjEyDQo+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NSAxMC8x
Ml0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBEcm9wIFRTU1JfVElFTg0KPiA+ID4gPiBtYWNybw0K
PiA+ID4gPg0KPiA+ID4gPiBPbiBSWi9HM0UsIFRJRU4gYml0IHBvc2l0aW9uIGlzIGF0IDE1IGNv
bXBhcmVkIHRvIDcgb24gUlovVjJILiBUaGUNCj4gPiA+ID4gbWFjcm8NCj4gPiA+ID4gSUNVX1RT
U1JfVElFTihuKSBjYW4gYmUgcmVwbGFjZWQgd2l0aCB0aGUgaW5saW5lIGxvZ2ljDQo+ID4gPiA+
IEJJVChmaWVsZF93aWR0aCAtIDEpIDw8IChuICogZmllbGR3aWR0aCkgZm9yIHN1cHBvcnRpbmcg
Ym90aCBTb0NzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2NC0+djU6DQo+
ID4gPiA+ICAqIFNob3J0ZW5lZCB0c3NyIGNhbGN1bGF0aW9uIGluIHJ6djJoX3RpbnRfaXJxX2Vu
ZGlzYWJsZSgpLg0KPiA+ID4gPiAgKiBBZGRlZCB0c3NyX3NoaWZ0X2ZhY3RvciB2YXJpYWJsZSBm
b3Igb3B0aW1pemluZyB0aGUgY2FsY3VsYXRpb24NCj4gPiA+ID4gICAgaW4gcnp2MmhfdGludF9z
ZXRfdHlwZSgpIGFzIHRoZSBuZXh0IHBhdGNoIHVzZXMgdGhlIHNhbWUgZmFjdG9yLg0KPiA+ID4g
PiB2NDoNCj4gPiA+ID4gICogTmV3IHBhdGNoDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMgfCA5ICsrKysrLS0tLQ0KPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+
ID4gPiA+IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+ID4gaW5k
ZXggOThhNmE3Y2QzNjExLi4zNjM1NTk3YWU0YzEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gPiA+IEBAIC02Niw3ICs2Niw2IEBADQo+ID4g
PiA+DQo+ID4gPiA+ICAjZGVmaW5lIElDVV9UU1NSX1RTU0VMX1BSRVAodHNzZWwsIG4pICAgICAg
ICAgICAgICAgICgodHNzZWwpIDw8ICgobikgKiA4KSkNCj4gPiA+ID4gICNkZWZpbmUgSUNVX1RT
U1JfVFNTRUxfTUFTSyhuKSAgICAgICAgICAgICAgICAgICAgICAgSUNVX1RTU1JfVFNTRUxfUFJF
UCgweDdGLCBuKQ0KPiA+ID4gPiAtI2RlZmluZSBJQ1VfVFNTUl9USUVOKG4pICAgICAgICAgICAg
ICAgICAgICAgKEJJVCg3KSA8PCAoKG4pICogOCkpDQo+ID4gPg0KPiA+ID4NCj4gPiA+IFBsZWFz
ZSBsZXQgbWUga25vdywgaW5zdGVhZCBJIHNob3VsZCByZXRhaW4gdGhpcyBtYWNybyB3aXRoWzFd
IGFuZCBzZWUgY2hhbmdlcyBiZWxvdyBpbmxpbmVkPz8NCj4gPg0KPiA+IFdoYXQgZG9lcyBbMV0g
cmVmZXIgdG8/DQo+IA0KPiBPb3BzIFsxXSByZWZlcnMgdG8NCj4gDQo+IFsxXQ0KPiANCj4gI2Rl
ZmluZSBJQ1VfVFNTUl9USUVOKG1hc2ssIG4sIHNoaWZ0KSAoKG1hc2spIDw8ICgobikgKiAoc2hp
ZnQpKSkNCj4gDQo+IA0KPiA+DQo+ID4gPiAjZGVmaW5lIElDVV9UU1NSX1RJRU4obWFzaywgbiwg
c2hpZnQpICgobWFzaykgPDwgKChuKSAqIChzaGlmdCkpKQ0KPiA+DQo+ID4gSXNuJ3QgIm1hc2si
IGFsd2F5cyAiQklUKHNoaWZ0IC0xKSI/DQo+IA0KPiBUaGF0IGlzIGNvcnJlY3QuDQo+IA0KPiA+
DQo+ID4gInNoaWZ0IiBpcyBub3QgdGhlIHNoaWZ0IHZhbHVlICh0aGF0IGlzICJuICogc2hpZnQi
KSwgYnV0IHRoZSBmaWVsZCB3aWR0aC4NCj4gDQo+IE9rLCBHb29kIHBvaW50LCBub3cgaXQgY2Fu
IGJlIHNob3J0ZW5lZCBhcw0KPiANCj4gI2RlZmluZSBJQ1VfVFNTUl9USUVOKGZpZWxkX3dpZHRo
LCBuKSAoQklUKChmaWVsZF93aWR0aCkgLSAxKSA8PCAoKG4pICogKGZpZWxkX3dpZHRoKSAtIDEp
KQ0KDQpUeXBvLiBDb3JyZWN0IG9uZSBpcw0KDQojZGVmaW5lIElDVV9UU1NSX1RJRU4oZmllbGRf
d2lkdGgsIG4pIChCSVQoKGZpZWxkX3dpZHRoKSAtIDEpIDw8ICgobikgKiAoZmllbGRfd2lkdGgp
KQ0KDQpDaGVlcnMsDQpCaWp1DQo=

