Return-Path: <linux-renesas-soc+bounces-13220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB71A387BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 16:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888231894CCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 15:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BE22248AC;
	Mon, 17 Feb 2025 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s7BA6aP7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E089224883
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806485; cv=fail; b=Akk1UfUdKxRBSmbrH/OQpS5Q1gyCucs5pLbePuYbdYPnkRF+ahh2Fy7gQWVPUQZhClukW8phMp8Cp6kO5+E0dJ1N/aOzYIstut4vQUye2asrED53sDTvNeSUyqyQbEohwAXo8PYBBXqMTVnmsQoHNETMBmlL1r7/p6qDT8YY4hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806485; c=relaxed/simple;
	bh=n3Pf5MBWWeIRlbpzLdwdp8tmscBCSThiIYveYW1oqHM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lzmzVRxds+4dhQTiApJzHfDEqL1059v6fAacpo+Ibcd6PkKLjs0zGyg47ohiBqqHKq6UAnDS8mKuwhncbNlnA3a3vifY0iiVNIVFU+ZdA+YHHKg+DGqkwQbQy5j9ooT+fY+RxIBcnB7HwmwHj4HAowUilGkG2HuCTOq+qALzG4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s7BA6aP7; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgVVXMvxTjjXu9d8jUKI2XEG9JTyqrnPl2yRd143WDX+nPYk79HeEMy2l585sJH8LMGcZkB8bqYWZAJgX7FnEjwKzU1RKnY//XVEiUPcUIqQeeoCH5hHOYnB278IdkGdPMtbEyD+TxxNViHUszZpKWJgxaJ7MNQI+ZPvoC6FDltSsCe0zgTqvouzK4pnfNjpkcjRx1nS1OQqfwvbqpXAB4gw7xSxGMbGW5kUrEl/4LO/mCektj0I8nVU5CPUDIXYES4DGePWgwBvnrP6gGE5njtKOzsuSYP7j8NJp/SNKqiu8hyhhHhIu6ZwcudOhQX76w4LL+MYtj0TsIgYATZ8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Pf5MBWWeIRlbpzLdwdp8tmscBCSThiIYveYW1oqHM=;
 b=nHgD8SNUwnGKFHQkMW0+7AB6q3I2sGX14o8R3vER8Ulxdjsf7EDBXHY0w+4A3NC/1Lj9eu65rbRqLPz9nLjo4eI8ikl3safSAlE5v3skYK06qf41sN1HcjInvAnaDt0XN9FtYhI3y5oozpJ2VZRyoXXvqT01gBazjfQsnu7UAiRr+21M2cpSI55Vw++1ufiEYErmwFU/b/Avw8btqTWMugcqrFYKHds+iyBPQVpZTX+Zba2aXbs7lQpP7eQoV7DGa3l/HweI7XYRWoOWYTEGRWYNXwky3lcvOHhjJMwTCIHIF3RZvj/ftR0k7tn6fcQJ7eBJRSdUZELTnm2pTD5FVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Pf5MBWWeIRlbpzLdwdp8tmscBCSThiIYveYW1oqHM=;
 b=s7BA6aP7VeRpBqrzrptf4oOL6YwscLaHTrJdcPYEbdlrzjFvpYTygdJvpfLgDWIY2cMlEG0M/3F5F5CXC2YCuPxVhY3541/xDm5XNElzRI3cs+SA4qtCemZuL6dJhRYGop2hYPLSsNBWJv80PYZoP32ml+19sO9x93/HcOSud/I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8553.jpnprd01.prod.outlook.com (2603:1096:604:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 15:34:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8445.019; Mon, 17 Feb 2025
 15:34:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Topic: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Index: AQHbfT8Y3I1B7eINBUqE9x3mj8SpN7NLQhkwgAAV+wCAAALH4IAAAuDAgAA7DlA=
Date: Mon, 17 Feb 2025 15:34:32 +0000
Message-ID:
 <TY3PR01MB1134622DC584DA55CA79D3B6A86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
 <TYCPR01MB1133241DF620FA6D88965C76E86FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TYCPR01MB11332CB5C33EFB0F40725D99886FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332CB5C33EFB0F40725D99886FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8553:EE_
x-ms-office365-filtering-correlation-id: 3c8569d9-2f91-4975-458f-08dd4f689343
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUxBZjZNVEZwemIzQTZDNEtzL2p0Q29UcHBIU25jc3AvRjR1OFNUdi9EQzIv?=
 =?utf-8?B?bXA4eVJJbHQ2ZktzbThFbW9nRW1jWWdtMFZEVkFFeFJKdWlXU0EvbExGQWVR?=
 =?utf-8?B?QXFOekVlaDdVUTNZWkNudjVzUFRENnkvSE1EcVp3aEwzWWhlUUZLZ0o2RkR6?=
 =?utf-8?B?NHJNNW4vRWw1M0dzSmx1T0dwUitKc0NTNnRCYnFOUVZWY3FUQ0dNNVBnMGQ1?=
 =?utf-8?B?dHpVSE5LY1kzUTlNVk1Vc3cxTmhVTXVUVDAvR2RPZkRLRXRCSmpXdExKdmo5?=
 =?utf-8?B?bGJLeE9paTFkNjNzeFhoelpMam1kNU5kTEN4Ui9LSE1kaVRra2lST0VjZFZE?=
 =?utf-8?B?MkNMYzRLRWt5NFhER1IyL1pGM1J5R3RwWVpwaXZyVDcrWElid0RWNnZsZTBL?=
 =?utf-8?B?azFnMXNaeC9RZDRmT1dwaS9FTG8rSzdvRkpsOE1tUUhWN2ZVSnlOUXl3VkhR?=
 =?utf-8?B?bU1OQkZWMXo0enVWSmtYOWk1cUZEUmczR1pWSHJPZVlWcUFqTFhya1dpRXky?=
 =?utf-8?B?Q09pcFhBZ2hhYm42dEYzRjlLbG1lOVMwQ3RkTFFiRDFLYVBBWnNGdzV1M2lu?=
 =?utf-8?B?TUt2ZXRLMkJsMkh1WkY0MWFyOENVUmJsNDZYVUdJa0dkayt2NzBJaHFhWUdz?=
 =?utf-8?B?dVZsVGwxSGxIMjcvSjZmdGVSaGxJV0NTRDJiNk8zRG9kcnNZR0taYkFxSGFi?=
 =?utf-8?B?ZWVpN1JmZytKbkZqdVNvTFlRU3JQcTFBUmR5QmRodllIeTJUdDBFTmxHeHRy?=
 =?utf-8?B?c3RVZFNlZUd3N3lQMHNsMm9vbWdwZEI0NWZtek9sOVltUXVlS3dYUFQxNCtr?=
 =?utf-8?B?UExpZFE2b212VGRyb0J0WXVNd1dzTndNR05xSkxNdW4rMXhCYnF3NG5obFkx?=
 =?utf-8?B?eFA0N0VtTFFMYm5TR1A2cGlpb01XRWlPZTM0b0ROdkpLa2JuREdBVENqRVB3?=
 =?utf-8?B?c1hhTDNKWWQ1VE83akJYUXI1ekNHZ0Nvcnc2bTlRS1BmV2hsUlNpcEFiVkgz?=
 =?utf-8?B?bEt4ZTFOTnhrM1VlbXhRZDNpQlRzdkZjYWVSUzlHOEV5bDdJbWJ0Q1AwS2pn?=
 =?utf-8?B?Q2NWU0VueVlzU05KNHdGdXpidy9mcExWL1prM0xJME1LU09IZHpUSHRqM1BO?=
 =?utf-8?B?alVwS3Rab3U4aUVsUEg0Vzdoc3F3ZGVOUmh1cVdKbG1KL3MvR2pFOHkvby9D?=
 =?utf-8?B?K0xDRDBlRm1JSXpJZDVMaG5oME91UEo1bWY5dDVLVWRHQ2czaGw4Ukdsakpw?=
 =?utf-8?B?d2J0SWVWSDFkQTdVN0FhY0p3OERHcVA2QWx5NHFnT2NVMS9vUWVNMXdOS2E5?=
 =?utf-8?B?TEgxN2U2TDB4T1pvbVFEU1B0VVMxcGo0WmRsdUQrTG5VeXhEODlHZ3l3L2Nm?=
 =?utf-8?B?UmpyaGZ6T1JHT2J5V0hjYW93WWxiTzhyM0kzeEFGa0t4T2dUT2Z1UmVQQjFY?=
 =?utf-8?B?VGlDQzk1a1AxVExPT1NlZXIzWnlHMUx0clpySG5Qdm5yVzdRVDhXaUl4MzZB?=
 =?utf-8?B?a2Y5ajhQN2RhU3F4clNRV0h6d3c3SkhDbmg2N3p0MVVpeTIySjI3VXYyNTM4?=
 =?utf-8?B?UGVpTW9IWXZhKzY1WklUWnZXWkk3V1U4T0lmdXExOGN5cUh6MUtGMGRMQzRu?=
 =?utf-8?B?QmFEcHRRS2s2Nm5uUE5MNFVCQUZFcUcxbVpONEszYWpOQ09LdjNNN2JKNVRV?=
 =?utf-8?B?VmVLRDh5eUdVMEJIZTdYaTlXdXJqeTRmQ1NPRWM3WXltbjcxY1RGTjVRbkZt?=
 =?utf-8?B?OWlOVWN5VnljT1FrWGEwMWcxTVF4MHVHUmZKUW9PZE9oMlByb29abFgrVzhS?=
 =?utf-8?B?WGVHZm03YnMyTEVjQ3lYMlBScCs1N05Rbjc1S0pheDZyb1pFa2ZPaS9FRzZH?=
 =?utf-8?B?Y0NlcnMzZHJRYVJJYUpkZDA2SVFRRGh1RFlMZWdUM3JvY0RnWklmN2VMRWUw?=
 =?utf-8?Q?8xqd6us0d93I5PwnuVRSGprewklcAW0Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWRpUlZKdFJQMTZITHpIeFFNcGpuWVBSS0RNb3RIMWNMY05KaVVrazZKbFNJ?=
 =?utf-8?B?d0lTZll5YlRVUkVRS0RFWURXUXdHNi9JVEQ0ekgrdWpHamN6WXNoNGRqRnAx?=
 =?utf-8?B?czRZMFlEUzBBejRvWnY2dDdWTTNiV0VlTGJIbTU2eDdYTmFVRmVScG5EdHJh?=
 =?utf-8?B?Q3E4UFVhaGVEaXRjRW0rdDRNK28yTGx3bGxYMGVoejZDQXhSOHgydlNlQkl4?=
 =?utf-8?B?NHNQUWs4NFFiTVhlczZPblR1MS9NRVJrWVI5ZjMvZGRSSWZwaUIzYnNxOWlD?=
 =?utf-8?B?TVUyUFI3dzRzeFhmV1hNN3EydEtlKzJhNS9OSm03SkNjRmRLaWlPZGY2N0dJ?=
 =?utf-8?B?TjZRb3F3MkV0VkhJbnRaK3VQRkxqS2tiUG8ybklaQVVJYTYyRTQzcms5UFFS?=
 =?utf-8?B?RHZsdExnOWNvVWtoOElyZkhhTWpXbk1OcDNaUGl6cUtielFUaTN3a3MyVkE2?=
 =?utf-8?B?M2kyc0dCVUNOQ3p6SEsyc1pXWnMxV0tkNmc2ZG95U2d4d0tpNlBZdk1hVjJt?=
 =?utf-8?B?TStIWXpCbjFhTzFoeWdoMXFQeDRkeW4vWHRCVzNwNkZhOVZQcTIzRUdKZE5y?=
 =?utf-8?B?eFB1Rjd4b3ZmWlA4cDRKNmZFUjNwSWxhaldqRGZQRzV2SU0vdzF6MC8xTjRx?=
 =?utf-8?B?Rm5xUVlXSWVHUkNqQy9JTk9UeVBTbEZ0akxWUlBEdGFnQUIvQ3R0UFZEY1lX?=
 =?utf-8?B?RzhsWUFjekJWWldsV2l4WUdENGFSU2ZuK3ZNb01FeHA3cm1qTkFtWlhFcXlD?=
 =?utf-8?B?OXNvamdmRXEwQXppUVA2VHNYVVg1bm40YlZpYk1jRWhxLzhXYVJPZE5ERU1Q?=
 =?utf-8?B?Y1hQLzlzYkVNcnJRRU90N3J6b2N6Qi9CTWdDeHpaLysxaFpUeFlyRHdKbCs3?=
 =?utf-8?B?cDI5cmxZWlJVOXBjd3dsbEpuU0NIQ055RVhKQkZuYkIwaVB0ZlNvOGVieGxz?=
 =?utf-8?B?bmxrM3hGeW9CanNjNlJIZlo4MWJ0c3ZSK3pWNEdDWUhDdVJGN09yYS9QWVdE?=
 =?utf-8?B?ZmNBQXgxMFFiMm1qclIwaGlSc3lIRnVMenlIYzlJK2FmZ2ppazF2c3M2dXR1?=
 =?utf-8?B?SGRaZTN6SXc3SzBUQnMyM2NXZGFYRzM1MXZIdTE0d2UrMmhVVHVlMVZTeUkx?=
 =?utf-8?B?b1lQN05ONG40WDFaN1dPQlpZR25tOGRpN2VveHp2SzMvd01DNHVrVHlJSC9a?=
 =?utf-8?B?Ni9pMHB3ZHkwMXJvbExRWnVPMWlvKzY0QXBHeERyUDE5UUI3YXJqR3lQU2Vq?=
 =?utf-8?B?UC9nTG9TK3NqN25EQ3FadjVIT1UxTmZmL0RvRlJkVVZaY2ZEeGNjcFVubHVV?=
 =?utf-8?B?WmRkZWNYWldWaGpCYzN0bWFrR2VCOWxpTmpLVklMbk1rTEo5Y1N1SlN3Q3E3?=
 =?utf-8?B?VGsyUFUzL0kvWVlzc2tXRmxWMlNwRC81cW1CUjk3WjRJMHpyK21JRUNGWkdi?=
 =?utf-8?B?UUMyamRIVkFReSs0a3g1VlFhck4xRUNYUmozQis2RUhSODNwdVlnZWNYRkFK?=
 =?utf-8?B?QzdxQlVFbjhBS1djN3pEbzJjSGhiUnpJb2hHaW96cm0zdFF3YkxoaEpJVStu?=
 =?utf-8?B?ME9YU0pyVmlOU0N0Rko3S29SeFEvWkNjbGtDNXYwam5oRUNtaG1GNDd3ZkE0?=
 =?utf-8?B?NEs3U0g2R1I2UjhXUStQaURSYno0MjhTTW5aUGlraUNhOTBJODZWbmlXRDln?=
 =?utf-8?B?M1BwVnZ6aW5iYy85MkNUdEhvTjZyZkg0cDl6SmY3bGJXOWpicGN4QmRPOTU4?=
 =?utf-8?B?VnYzRGlkdTFBWDVTYlNNemphYzlGbnRqNmROMlIvMisrT1Z2MGhsN2o1U1dY?=
 =?utf-8?B?ZUQ3VDkzRWZxSTR3cGZpRE03OGNoVmZaN3lVNXROZ3QxdWYwTW5QRDBLWVdL?=
 =?utf-8?B?bDM3MEhYOFZyNFU5cVBKbktXUUZsUWp5NC9JbDcxQ1l1VlpVdk4vLzlsak9C?=
 =?utf-8?B?cVNLMjFsdzEvTXkxZEVjQjJyVGcvRFVVeXYwYU9kYndxZ0tPLzQ5aFE5eVc4?=
 =?utf-8?B?OG1YMDBJSzdIWTBSZmFNclF3OFFEMzY2QUtPMkhzcDVUc3Jrd20xWWFKOHp6?=
 =?utf-8?B?eEtCMEZ6TjZwWjkwaXBZTHkwR2IxZHpQWnBxS2dweEdsclJSeUNUMGdHd1pQ?=
 =?utf-8?B?cS9aQm1aL0p1VThmQmt2c3hJUExwcGNKQkNYeGhXUExmdWJLU0VZc3RUdDZF?=
 =?utf-8?B?YVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8569d9-2f91-4975-458f-08dd4f689343
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 15:34:32.2005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fldHsSGk/MjXHga8JkKl7ua3YiGsZ18g0AToiB6O6BzMXuySLfqt1L7/hKqdTvGLlTGFdv6IXdD0iHS3Jh5RAERlU60VhXA0fiDqrBcsfew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8553

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMNCj4gU2VudDogMTcgRmVicnVhcnkgMjAyNSAxMTowOA0KPiBTdWJqZWN0OiBSRTogW1BBVENI
IHY1IDEwLzEyXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IERyb3AgVFNTUl9USUVOIG1hY3JvDQo+
IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBCaWp1
IERhcw0KPiA+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjUgMTE6MDMNCj4gPiBTdWJqZWN0OiBSRTog
W1BBVENIIHY1IDEwLzEyXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IERyb3AgVFNTUl9USUVODQo+
ID4gbWFjcm8NCj4gPg0KPiA+IEhpIEdlZXJ0LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVl
ZGJhY2suDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9t
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+ID4gU2VudDog
MTcgRmVicnVhcnkgMjAyNSAxMDo0Nw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxMC8x
Ml0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBEcm9wIFRTU1JfVElFTg0KPiA+ID4gbWFjcm8NCj4g
PiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgMTcgRmViIDIwMjUgYXQg
MTA6MzYsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
Pg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IDEy
IEZlYnJ1YXJ5IDIwMjUgMTE6MTINCj4gPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjUgMTAvMTJd
IGlycWNoaXAvcmVuZXNhcy1yenYyaDogRHJvcCBUU1NSX1RJRU4NCj4gPiA+ID4gPiBtYWNybw0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gUlovRzNFLCBUSUVOIGJpdCBwb3NpdGlvbiBpcyBhdCAx
NSBjb21wYXJlZCB0byA3IG9uIFJaL1YySC4NCj4gPiA+ID4gPiBUaGUgbWFjcm8NCj4gPiA+ID4g
PiBJQ1VfVFNTUl9USUVOKG4pIGNhbiBiZSByZXBsYWNlZCB3aXRoIHRoZSBpbmxpbmUgbG9naWMN
Cj4gPiA+ID4gPiBCSVQoZmllbGRfd2lkdGggLSAxKSA8PCAobiAqIGZpZWxkd2lkdGgpIGZvciBz
dXBwb3J0aW5nIGJvdGggU29Dcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4g
PiA+ID4gPiB2NC0+djU6DQo+ID4gPiA+ID4gICogU2hvcnRlbmVkIHRzc3IgY2FsY3VsYXRpb24g
aW4gcnp2MmhfdGludF9pcnFfZW5kaXNhYmxlKCkuDQo+ID4gPiA+ID4gICogQWRkZWQgdHNzcl9z
aGlmdF9mYWN0b3IgdmFyaWFibGUgZm9yIG9wdGltaXppbmcgdGhlIGNhbGN1bGF0aW9uDQo+ID4g
PiA+ID4gICAgaW4gcnp2MmhfdGludF9zZXRfdHlwZSgpIGFzIHRoZSBuZXh0IHBhdGNoIHVzZXMg
dGhlIHNhbWUgZmFjdG9yLg0KPiA+ID4gPiA+IHY0Og0KPiA+ID4gPiA+ICAqIE5ldyBwYXRjaA0K
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2
MmguYyB8IDkgKysrKystLS0tDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gPiA+ID4gaW5kZXggOThhNmE3Y2QzNjEx
Li4zNjM1NTk3YWU0YzEgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJl
bmVzYXMtcnp2MmguYw0KPiA+ID4gPiA+IEBAIC02Niw3ICs2Niw2IEBADQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiAgI2RlZmluZSBJQ1VfVFNTUl9UU1NFTF9QUkVQKHRzc2VsLCBuKSAgICAgICAgICAg
ICAgICAoKHRzc2VsKSA8PCAoKG4pICogOCkpDQo+ID4gPiA+ID4gICNkZWZpbmUgSUNVX1RTU1Jf
VFNTRUxfTUFTSyhuKSAgICAgICAgICAgICAgICAgICAgICAgSUNVX1RTU1JfVFNTRUxfUFJFUCgw
eDdGLCBuKQ0KPiA+ID4gPiA+IC0jZGVmaW5lIElDVV9UU1NSX1RJRU4obikgICAgICAgICAgICAg
ICAgICAgICAoQklUKDcpIDw8ICgobikgKiA4KSkNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
UGxlYXNlIGxldCBtZSBrbm93LCBpbnN0ZWFkIEkgc2hvdWxkIHJldGFpbiB0aGlzIG1hY3JvIHdp
dGhbMV0gYW5kIHNlZSBjaGFuZ2VzIGJlbG93IGlubGluZWQ/Pw0KPiA+ID4NCj4gPiA+IFdoYXQg
ZG9lcyBbMV0gcmVmZXIgdG8/DQo+ID4NCj4gPiBPb3BzIFsxXSByZWZlcnMgdG8NCj4gPg0KPiA+
IFsxXQ0KPiA+DQo+ID4gI2RlZmluZSBJQ1VfVFNTUl9USUVOKG1hc2ssIG4sIHNoaWZ0KSAoKG1h
c2spIDw8ICgobikgKiAoc2hpZnQpKSkNCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gPiAjZGVmaW5l
IElDVV9UU1NSX1RJRU4obWFzaywgbiwgc2hpZnQpICgobWFzaykgPDwgKChuKSAqIChzaGlmdCkp
KQ0KPiA+ID4NCj4gPiA+IElzbid0ICJtYXNrIiBhbHdheXMgIkJJVChzaGlmdCAtMSkiPw0KPiA+
DQo+ID4gVGhhdCBpcyBjb3JyZWN0Lg0KPiA+DQo+ID4gPg0KPiA+ID4gInNoaWZ0IiBpcyBub3Qg
dGhlIHNoaWZ0IHZhbHVlICh0aGF0IGlzICJuICogc2hpZnQiKSwgYnV0IHRoZSBmaWVsZCB3aWR0
aC4NCj4gPg0KPiA+IE9rLCBHb29kIHBvaW50LCBub3cgaXQgY2FuIGJlIHNob3J0ZW5lZCBhcw0K
PiA+DQo+ID4gI2RlZmluZSBJQ1VfVFNTUl9USUVOKGZpZWxkX3dpZHRoLCBuKSAoQklUKChmaWVs
ZF93aWR0aCkgLSAxKSA8PCAoKG4pDQo+ID4gKiAoZmllbGRfd2lkdGgpIC0gMSkpDQo+IA0KPiBU
eXBvLiBDb3JyZWN0IG9uZSBpcw0KPiANCj4gI2RlZmluZSBJQ1VfVFNTUl9USUVOKGZpZWxkX3dp
ZHRoLCBuKSAoQklUKChmaWVsZF93aWR0aCkgLSAxKSA8PCAoKG4pICogKGZpZWxkX3dpZHRoKSkN
Cg0KRmluYWxseSBjb3JyZWN0ZWQgdGhpcyBtYWNybyBhcyBiZWxvdyB0byBmaXggdGhlIFdhcm5p
bmdzL2Vycm9yIFsyXQ0KDQojZGVmaW5lIElDVV9UU1NSX1RJRU4oX2ZpZWxkX3dpZHRoLCBuKQlc
DQooe1wNCgkJdHlwZW9mKF9maWVsZF93aWR0aCkgKGZpZWxkX3dpZHRoKSA9IChfZmllbGRfd2lk
dGgpOyBcDQoJCUJJVCgoZmllbGRfd2lkdGgpIC0gMSkgPDwgKChuKSAqIChmaWVsZF93aWR0aCkp
OyBcDQp9KQ0KDQpbMl0NCkVSUk9SOiBNYWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQg
YmUgZW5jbG9zZWQgaW4gcGFyZW50aGVzZXMNCiMyNDogRklMRTogZHJpdmVycy9pcnFjaGlwL2ly
cS1yZW5lc2FzLXJ6djJoLmM6Njk6DQorI2RlZmluZSBJQ1VfVFNTUl9USUVOKGZfd2lkdGgsIG4p
CQlCSVQoKGZfd2lkdGgpIC0gMSkgPDwgKChuKSAqIChmX3dpZHRoKSkNCg0KQ0hFQ0s6IE1hY3Jv
IGFyZ3VtZW50IHJldXNlICdmX3dpZHRoJyAtIHBvc3NpYmxlIHNpZGUtZWZmZWN0cz8NCiMyNDog
RklMRTogZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmM6Njk6DQorI2RlZmluZSBJ
Q1VfVFNTUl9USUVOKGZfd2lkdGgsIG4pCQlCSVQoKGZfd2lkdGgpIC0gMSkgPDwgKChuKSAqIChm
X3dpZHRoKSkNCg0KdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxIGNoZWNrcywgMjcgbGlu
ZXMgY2hlY2tlZA0KDQpDaGVlcnMsDQpCaWp1DQo=

