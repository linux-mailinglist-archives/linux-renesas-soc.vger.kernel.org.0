Return-Path: <linux-renesas-soc+bounces-12482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157DA1BB12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 17:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C438160CBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 16:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB061AA783;
	Fri, 24 Jan 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PpsdW1IA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F91A00D6;
	Fri, 24 Jan 2025 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737737862; cv=fail; b=PNKhGLYs8DiYnGQ35ZQdgEFEmb42Vdw8WsTfbqqgFXQBvUetVMbZB/sc/dXFDgzEsOoNDB8tJ+WpHRcpPlp7/ev2TA+aC7FXTIzVPM8hnTDsAt5IiIf6S0/lr2gwwmUeC0+DOtc81MY2jnh0puaplRjPZZL25CabBO5q+/ic1to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737737862; c=relaxed/simple;
	bh=pdJJGFRpz4WLRNBmYSp/QhyzUc18SJui8AbnJmUwUe0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nHo9CTRt+xSrOx0+D2f0+YPrEm41FdZN1qZmj7OnuQqZ/UQXKhBSiYSxmVly2STBl3YN7hhjvSRlIDOmolQwTCNXNRpuIp9aKZddoZYyrxIu05ouBqtS2pVc2VvzuMq3A6bmsMg5NXV1HWbVVRL3SK10+Pccyu2LKfNVpXPRznI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PpsdW1IA; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmJBujcnycqLI5txPOova+Tw+YlVgrJE4xFjjg/DvqNDbkF6loB34tENIhVFoC5RZdTUhZH+NDHEfKUu7mqgoux+aXiTnYsKC3Qt+cJj65T0n57NoacvUaMHiL2cr20/I3v6WxxLHvWoQ3j9orjIFEYWBBnGVyCCBsERTmlHTr5tRUnCrQ8bcjhROapKzaZdntPe2xlkL7Ym9JGuYFo6mPs//IwBjKqZn43i35tVgYjg8XRQaucmBr5wr2Wnzdqeaj43xyqlW076Gp2zDPlOFqwjk0mdilttZDgjINedIemL/RCvV18Qu7MRVF9PUVP0uUFfrduHZhheQbFszLuGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdJJGFRpz4WLRNBmYSp/QhyzUc18SJui8AbnJmUwUe0=;
 b=N7ggQqkRHRCptEzG5xuB2txnFKiJvbDHlhMgEjQ4g5mC0Fbl+5vs3ZE5t3bPr4Kdnbg5UUiVFw1dLfPYwDkafHtUcV0RDRD+qHROSdqt2l/NE8BioH6s7VKzDMPsgC3XnwwCP8OQN5hRlpsrqcLoRVsLUCnwSQMdWM9JZb/QE5KPCnZa3NYgYFvtB0GfT+UhJcpAlnlyUiltj7WrYU/rlidE1oIAHXJX2q5czj11fZlPwH7r5JQ4JfeDVozZesrkVFY3mvw8YGsxR6QOVED4eDwuDg3o5GaMH9m78OLCLrbsdCMTp6uF9EGtwPFJCIZYe7GBgbfqR+wb7b1jekMEAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdJJGFRpz4WLRNBmYSp/QhyzUc18SJui8AbnJmUwUe0=;
 b=PpsdW1IANHEnndYNcDVbRj9rllICOO0tgTe+VVoWf7y5l74QkbpxjIGz88u6NS+xQGXZ3o33yVbQlE6h2VnpOCDc3pSK3FkSDqBSfSmJBj00ssod2mkOfcg4NQmB7rselpIG2y5VaBRfbmlQqHoZnmX1vYokaKIIehAPqHXzJxA=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by OS3PR01MB9771.jpnprd01.prod.outlook.com (2603:1096:604:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Fri, 24 Jan
 2025 16:57:34 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 16:57:33 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v4 4/9] soc: renesas: rz-sysc: Add support for RZ/G3E
 family
Thread-Topic: [PATCH v4 4/9] soc: renesas: rz-sysc: Add support for RZ/G3E
 family
Thread-Index: AQHbbbkJeUnhWJqpnEuNJwF1sRBlFrMl+scAgAAlTmA=
Date: Fri, 24 Jan 2025 16:57:33 +0000
Message-ID:
 <OSBPR01MB27757C12DA329BFD884A6E3AFFE32@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
 <20250123170508.13578-5-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWHuwdYfm_b9uO8LjmJpAwyRrBTJbeoz5FOyEcYSJqL9A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWHuwdYfm_b9uO8LjmJpAwyRrBTJbeoz5FOyEcYSJqL9A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|OS3PR01MB9771:EE_
x-ms-office365-filtering-correlation-id: c4e05216-5001-4e8d-17da-08dd3c983287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RG5LRUYzMTBvU0tmNWJjQnQrdzBSVGR4VmVRYU9pZHZvZUlESzdSZmcxT3RK?=
 =?utf-8?B?QzBUWEMzMDN1N1NoZEVEU1NwZ2pWeXJweW1kRy9EVkNmazJTT1orNGp5RERV?=
 =?utf-8?B?dytvVlpJMzdXUlA1VTkyT1AwUkxEK1padVVnQzk2b3Rqc1JDVGh5ZEFmTXU1?=
 =?utf-8?B?WGdranJ1Z1pkSGQwNnhOTDAxMFh0bGZOT3FNRmx5YjhRL25FT0llWW1MODly?=
 =?utf-8?B?Wkx0WW85Skp0MVNtYWFXOXlNcFFEM1Bkd0w1Tk1xWGJxeGxsWTU1ekRmcTI4?=
 =?utf-8?B?aDNNRGxsSHduUTdDZWhud3V5UitQQ1VxeHkrZjMvMXI0Q1BwRXE3YzVpOHlO?=
 =?utf-8?B?eHhuNEhJcVJWZGwrbDhCMG1CZ29LZGMxSnA0RkplR0hlYlVvK3VHaGVJYWZB?=
 =?utf-8?B?RWpVMjdvWDdmNVBXdEhndnhWUUpPM0h5T1Z0VUFlYkxlSEtZUGxPZDdqQ1VD?=
 =?utf-8?B?TlhTc3FnQStpMTZkOU9ONjBMV2p3RHRHQ3pmaWxNOHdoQjNrblR3T3E2R2VR?=
 =?utf-8?B?RDIvVWF1QkhBTGpDMUtCRmJyeGFXZHpobzdNMGxWdVQ2MXptMEUxSnVkZll5?=
 =?utf-8?B?NGxYRXBRWHNCQVcyTVQrY0lZN0p5Q1h4Z1Bud3VsRXozRmF1eHVReU03cVU0?=
 =?utf-8?B?QnZXdDJTdHFvMysydUtKM1BTNUZCd0Q3YXhOMDRSMFN4UnFkUW9WZEhuU0w1?=
 =?utf-8?B?algyWlFkLzdRYWFmbFVPWTdnWXBRUmtYNTJ0bVZMY0dSVUNTT25rS1lRVFU2?=
 =?utf-8?B?aTVwVzEvRml1dzlCa3YvMHQ5NXNYcmtxZW9hNVphODVaWmtHUHhpMzZvWnJK?=
 =?utf-8?B?eXVXZHV3M2tjemNCMmVBSFJZYmhsM2dqV2VZRkxtMkpSb2N4WlU3WHg2UFZw?=
 =?utf-8?B?cFpvb0NDYXFkQnk3dGZEcC9EMkh4cE9jbGRtbURIK1JMOXNKNnhBSW1CRkxF?=
 =?utf-8?B?RHFhbVppM0lXbllQUW10R2VIbmlJaEl5MVFHQ0FieUl3eEpoUHc1Y0VleUhq?=
 =?utf-8?B?d1BEc05QbUZUeEZvamxLemtKbXh1WnVTbnZNSElJVlJGbW5GL1h3M2FWQnZW?=
 =?utf-8?B?SWJKMnRiU2l2Q0E2RC84MGtma0NQMW9HSmN0ekVQcWk5YzQvSjAxRlltL2JV?=
 =?utf-8?B?dXBWTlN6azF0U0QvMjZpYlptT3U4MUZCLzVHNzBYZmZZZk5nUnlYOFU5Q1Rl?=
 =?utf-8?B?dW5udlZFbVE0N3l0Nk42TXNJZWUzamd4aGplU2NSRVh2S1duSUVERUJkdU5w?=
 =?utf-8?B?bWtWZ2RWVXd4QWhGbS9vM0RpVlBIc1BJbVlWNUdURnphK2VqZ2hld3NIZTh2?=
 =?utf-8?B?OWFxTDV1U0RXMS9QQlpiZ3BRclVhaXZmQmZod1diMDU3R2szeitUN2xrYS9z?=
 =?utf-8?B?SU8xU3g3NXB3NDJGM2FaTjBlWHFoZ2VwTkVORGhiZ1ExdzVZRE94L3lWclR0?=
 =?utf-8?B?V3ZTSUlCWXFsWWpkcGhrYjYzajg3VFdNYzh2WFMyRVQ4bHFjdEozNG42WXRa?=
 =?utf-8?B?b0JYT0hJTU1Ma29VUm51UC9reTJyUVA3d0dMeVpkbjhtODVWS0JVTGhHbDZm?=
 =?utf-8?B?aDN6b2tyTFZVbFpmSy8xWnI1STczL0NqRkpUNGtDNDR2YzNXNkppV3FRWDkv?=
 =?utf-8?B?dVFDdXB3UmRFNnl1UjFnaExONklvMnoybmh3RXZYMFNiYTVZL1B0b0pxRjFM?=
 =?utf-8?B?WnBrdzN3MmU0NXlqNTFqUUs4SDBvTXVDQVFpN1RVMHR5ZitVNzB0a2U1TXo0?=
 =?utf-8?B?MVFrejF0U0k3RDA0VlBPTyt6c0dRMkJXbmJTVTFsb3ErczFTTHZHZ0xBS1dn?=
 =?utf-8?B?Nmc5KzZHcHU2aFlvMlpxeVpkdmVieUI4U015eGpOMmZuVGhoMDVqeW8rdkxM?=
 =?utf-8?B?N0tibjFCVE9XRDMza2tDbXlFYjJjYkxDcnZXMzg4NDAwVElTTGFRNUxiZ1V4?=
 =?utf-8?Q?3PpTwE8k2LpBOI84oB8/n1txzkT7ZRfK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WitFT2JQeXM0N3Z0VkQyTDI4Z2VhWDZoT1hUTnBIdjJoNXN4cGpzQlJUcVQ4?=
 =?utf-8?B?WlorY1NrZCtrbVczUmhuM29tMVI0emw2STZLc1VJZHk2L2phREdRelVvVDRp?=
 =?utf-8?B?QndiZTBvR3YzSWRvOFhqbkhDRUlhNDNaT1hHWnhCYnZFYnVOWnR6d0pTcTZJ?=
 =?utf-8?B?OFgyUmpZNVhIQlhrWERZUDV1UTlWcUpISW13UDdNQ01zb0FPSWRrY1EvSU9q?=
 =?utf-8?B?UEtRM0pVa0hkRy9ZNGQyQWJiOGc5bzM4QUZFcXJsZHFaR2lRM3VHYlFxUjc4?=
 =?utf-8?B?dUxmc0pzUzFOczYvMTNJdHpNS05DcERGRzVOZ2MyY0UvUkloemlKK042eXZj?=
 =?utf-8?B?NEZDQzlPWFhqVGk0aFBSQTE1R0N5RDVxb2V5bG9veVNObk9FdWtuRVFETzJN?=
 =?utf-8?B?U1U1a2pIemRVaVA0VzBIdVdFSTVseHdudFlrdzVFNDM2bW5qVVR6Q0szSitI?=
 =?utf-8?B?Znh5WXloTDhXYzFXeDBTaW1KV282TTdXOGNGek0vaWxwZ3JPM3VkNnFCckhx?=
 =?utf-8?B?VFg0NnI4WnV6VGkyaFRuMHR5OGd0a0YyOURlSG85Z2NtNk1HdWRDUXRiVDJ5?=
 =?utf-8?B?bGM0YVhrVVpXWTdsWklLTlVCSUxoY0VTQWxFZGphOFhhVStHaFVDTFBmMzBK?=
 =?utf-8?B?WVFSMnk4bjFmby9mS2hHRWNkZkRDcEdjelgxeUxiYVlFT2hWMTBNeDNzc2gw?=
 =?utf-8?B?WkF6b0UwSXFlVHVuWEpHTU1uWGFXQmV0ci9OQ0RKVTYyVVZzM2ZTWnd1UzRT?=
 =?utf-8?B?RTJ2NmZaNFQ0dGZmVGRDdkZsRWZWRDBHS0w2WlhzMmFsTGRDTEZzOTFwOTk3?=
 =?utf-8?B?MEthcFJTL3djb0FYbE9mcmsyQ1JOVmZGWEhkV0tvTFdVNU1KUkhQQUVjNnl5?=
 =?utf-8?B?ZVVSdm1BQmtzWUM4dkRpYXhxYnZsL0NqTUl1aFpxdm9TUzdCNjlieVU2aEJl?=
 =?utf-8?B?WUpNcWNXOUJGejRjbkRwTWpma2dJZHpGa2dhaVptZTlOa0xuVmNnbXd6TFdv?=
 =?utf-8?B?TkJobmFUcjlqa0xaSkhzNUdwRGpveEcrKzJKeDc1NjBmUlljR3RldUllK1Mz?=
 =?utf-8?B?ekhkMTNtUTFQa1h0aUN4NW1CQUVHZkpJTWhBanNvVWhSSXRUV0ErcmtlZXZy?=
 =?utf-8?B?SEFnTlo2b3JzanQzNHB1emo4ZlhRcFhjSEhlUDdnY1Y3em9Ma2F3VXRBQjZa?=
 =?utf-8?B?T3dpbzhRa0FFeERZRjBUaWZ0NGNWZUd3a01pRjJlTGFaSHYxM3dnU2l6YUNS?=
 =?utf-8?B?OE9KaWR3aUJqYmRiSGlMM01GM0NsVmFLRWNhNXNQaGE3ZDVCL3g0SDYyck4w?=
 =?utf-8?B?TThHbnJaV3dnMXcySTVXRFZibkIrSGJBUkl3bndNMmVYbm1KQzlORlhVeGZT?=
 =?utf-8?B?bms3WXoyazA4Z0NwbmoyU2I0bW0zWjJyaEZyWVJLd1gzR3NyUzNzck1nQ1dm?=
 =?utf-8?B?bmNpOTNoVVdsYzNidW4yblR3NUswQVI4QXFNcWpLb3BFNmZhVm03L25LUGx2?=
 =?utf-8?B?NWtlVGRhNjUzV3czbTZGN2s1WGU2dFZIOWc2SmNldkZPdUdURGtzZStzd3N5?=
 =?utf-8?B?dEYrTVVBdW1CZEU1QjZTcWwzdnZCdy8wQURxTmI0UzJNa2REM1pMdHhQS3Zl?=
 =?utf-8?B?bEJ3bnhSdWp3WGFJSm1NNENwUy9DSy9NbVRxUzZTQ2grQzVYcWZJUlJFb3lM?=
 =?utf-8?B?NWJnVVRweFVlM1d2SGZ0Rzh3a1NhUitJdXNrUHBjK005ajhsa3pHUmx1bGxj?=
 =?utf-8?B?bkFlbHc0UWNGZU5YVTluaURTbWI2Rkx4WW10ZHd4THZ4TUVGMFNBOUJHQjhT?=
 =?utf-8?B?SlRmK2hRN3JFdEdWZ1l3TDRWdXRaMGFwQnFTdGNmRlVnUEk1dFYzQ05RWExM?=
 =?utf-8?B?U0UrNlJtdC9FQUJ5aUdVYWc5cTlwTit0a1E5dVpJL2VaaS9UNlJnemZEUEYv?=
 =?utf-8?B?MUExeWozcnRoNUlDblFGdTI1SmR5Nk5kamcvR3VkaFRwd253Y1RwL2dTMWh1?=
 =?utf-8?B?VXBSYnluaXcvRVRWRUxRbVZkK3RCdDlROGtkOGN3UXdYZk94U2JzMnZncFFo?=
 =?utf-8?B?Y2ZhVm1Dc0ZBd3BPWGFoekhMeDIyaXpVNGwvaGJCbDZES3RPRG1sMXFxU1Q1?=
 =?utf-8?B?QkIvc2xmNy9IanRnMVI2bFRpRXdtbk5ta3dDSVpqcEhXZk1DK2JXL1hpK0w0?=
 =?utf-8?B?Z2c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e05216-5001-4e8d-17da-08dd3c983287
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 16:57:33.6626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jky4yG0m25a+4wDT7XhgvBfxanDTiRHLwalisuLJN62yPeic6THCDP+/AbQtHVNddqbnPIxCmwhxEA+gzXtDTpdQ+0lEzmFvaUCjKCZ4Eh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9771

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI0LCAy
MDI1IDM6MjAgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzldIHNvYzogcmVuZXNhczog
cnotc3lzYzogQWRkIHN1cHBvcnQgZm9yIFJaL0czRQ0KPiBmYW1pbHkNCg0KSGkgR2VlcnQsDQoN
ClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBUaHUs
IEphbiAyMywgMjAyNSBhdCA2OjA14oCvUE0gSm9obiBNYWRpZXUNCj4gPGpvaG4ubWFkaWV1Lnhh
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgU29DIGRldGVjdGlvbiBzdXBwb3J0IGZv
ciBSWi9HM0UgU29DLiBBbHNvIGFkZCBzdXBwb3J0IGZvcg0KPiA+IGRldGVjdGluZyB0aGUgbnVt
YmVyIG9mIGNvcmVzIGFuZCBFVEhPUy1VNTUgTlBVIGFuZCBhbHNvIGRldGVjdCBQTEwNCj4gPiBt
aXNtYXRjaCBmb3IgU1cgc2V0dGluZ3Mgb3RoZXIgdGhhbiAxLjdHSHouDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+
ID4gLS0tDQo+ID4gdjMgLT4gdjQ6IE5vIGNoYW5nZXMNCj4gPg0KPiA+IENoYW5nZXMgaW4gdjM6
DQo+ID4gLSBSZW1vdmVkIFN5c2NvbiBzdXBwb3J0DQo+ID4NCj4gPiBDaGFuZ2VzIGluIHYyOg0K
PiA+IC0gR3JvdXAgYml0ZmllbGRzIG9yZGVyZWQgYnkgcmVnaXN0ZXJzDQo+ID4gLSBSZW5hbWUg
U29DLXNwZWNpZmljIGNhbGxiYWNrIGZpZWxkIHRvICdwcmludF9pZCcNCj4gPiAtIEV4cGxpY2l0
ZWx5IHNlbGVjdCAnTUZEX1NZU0NPTicgY29uZmlnIG9wdGlvbg0KPiA+IC0gRG8gbm90IHJlbHkg
b24gJ3N5c2NvbictY29tcGF0aWJsZSBwcm9iaW5nIGFueW1vcmUuDQo+IA0KPiBUaGFua3MgZm9y
IHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3Nv
Yy9yZW5lc2FzL3I5YTA5ZzA0Ny1zeXMuYw0KPiA+IEBAIC0wLDAgKzEsNzEgQEANCj4gPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogUlovRzNF
IFN5c3RlbSBjb250cm9sbGVyIChTWVMpIGRyaXZlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmln
aHQgKEMpIDIwMjUgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2Uu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lv
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAicnotc3lzYy5oIg0KPiA+ICsNCj4gPiArLyogUmVn
aXN0ZXIgT2Zmc2V0cyAqLw0KPiA+ICsjZGVmaW5lIFNZU19MU0lfTU9ERSAgICAgICAgICAgMHgz
MDANCj4gPiArLyoNCj4gPiArICogQk9PVFBMTENBWzE6MF0NCj4gPiArICogICAgICAgICBbMCww
XSA9PiAxLjFHSFoNCj4gPiArICogICAgICAgICBbMCwxXSA9PiAxLjVHSFoNCj4gPiArICogICAg
ICAgICBbMSwwXSA9PiAxLjZHSFoNCj4gPiArICogICAgICAgICBbMSwxXSA9PiAxLjdHSFoNCj4g
PiArICovDQo+ID4gKyNkZWZpbmUgU1lTX0xTSV9NT0RFX1NUQVRfQk9PVFBMTENBNTUgIEdFTk1B
U0soMTIsIDExKQ0KPiA+ICsjZGVmaW5lIFNZU19MU0lfTU9ERV9DQTU1XzFfN0dIWiAgICAgICAw
eDMNCj4gDQo+IFBsZWFzZSBhZGQgYSBibGFuayBsaW5lIGhlcmUuDQoNCldpbGwgZG8sIGluIHY1
Lg0KDQo+IA0KPiA+ICsjZGVmaW5lIFNZU19MU0lfREVWSUQgICAgICAgICAgMHgzMDQNCj4gPiAr
I2RlZmluZSBTWVNfTFNJX0RFVklEX1JFViAgICAgIEdFTk1BU0soMzEsIDI4KQ0KPiA+ICsjZGVm
aW5lIFNZU19MU0lfREVWSURfU1BFQ0lGSUMgR0VOTUFTSygyNywgMCkNCj4gDQo+IFBsZWFzZSBh
bGlnbiB0aGUgc2Vjb25kIGNvbHVtbiBpbiB0aGUgdGhyZWUgbGluZXMgYWJvdmUuDQo+IFBsZWFz
ZSBhZGQgYSBibGFuayBsaW5lIGhlcmUuDQo+IA0KPiA+ICsjZGVmaW5lIFNZU19MU0lfUFJSICAg
ICAgICAgICAgICAgICAgICAweDMwOA0KPiA+ICsjZGVmaW5lIFNZU19MU0lfUFJSX0NBNTVfRElT
ICAgICAgICAgICBCSVQoOCkNCj4gPiArDQo+ID4gKyAgICAgICBkZXZfaW5mbyhkZXYsICJEZXRl
Y3RlZCBSZW5lc2FzICVzIENvcmUgJXMgJXMgUmV2ICVzJXNcbiIsDQo+ID4gKyAgICAgICAgICAg
ICAgICBpc19xdWFkX2NvcmUgPyAiUXVhZCIgOiAiRHVhbCIsDQo+ID4gKyAgICAgICAgICAgICAg
ICBzb2NfZGV2X2F0dHItPmZhbWlseSwNCj4gDQo+IEZpdHMgb24gYSBzaW5nbGUgbGluZS4NCj4g
DQo+ID4gKyAgICAgICAgICAgICAgICBzb2NfZGV2X2F0dHItPnNvY19pZCwNCj4gPiArICAgICAg
ICAgICAgICAgIHNvY19kZXZfYXR0ci0+cmV2aXNpb24sDQo+IA0KPiBMaWtld2lzZS4NCg0KVGhl
eSdsbCBhbGwgYmUgZml4ZWQgaW4gdjUuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICBucHVf
ZW5hYmxlZCA/ICIgd2l0aCBFdGhvcy1VNTUiIDogIiIpOw0KPiA+ICsNCj4gPiArICAgICAgIC8q
IENoZWNrIENBNTUgUExMIGNvbmZpZ3VyYXRpb24gKi8NCj4gPiArICAgICAgIGlmIChGSUVMRF9H
RVQoU1lTX0xTSV9NT0RFX1NUQVRfQk9PVFBMTENBNTUsIG1vZGVfdmFsKSAhPQ0KPiBTWVNfTFNJ
X01PREVfQ0E1NV8xXzdHSFopDQo+ID4gKyAgICAgICAgICAgICAgIGRldl93YXJuKGRldiwgIkNB
NTUgUExMIGlzIG5vdCBzZXQgdG8gMS43R0h6XG4iKTsgfQ0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KUmVnYXJkcywNCkpvaG4N
Cg0K

