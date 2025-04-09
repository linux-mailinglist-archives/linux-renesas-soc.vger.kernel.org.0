Return-Path: <linux-renesas-soc+bounces-15673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD794A82717
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 16:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E7E461A46
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9427D26156D;
	Wed,  9 Apr 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Mvgv+Xr2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D902253E4;
	Wed,  9 Apr 2025 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207451; cv=fail; b=syBa4nzxm6xYKDsnHF2iaH3mlJ9BEKRFGrbX4NIaoVlHBJ75UVueJ5m79AxtEJDO3EgxJ5E5vxVpAP9x1iiYgkne6kr0jhPgesDWv/OZ4fyrtQKJ/S376D0h6pHMtBMpBZ7QAe9S1KnD3yZqhMWJtdZfKIgi3ztghzM+qc94kyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207451; c=relaxed/simple;
	bh=lsJdR2xbXLQXC8XdERmNgo87Q9hdr260XLAvOj9oEiE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YAAjfsY1s7/pUhROOhXlK5PiMKv14tchMJIVJqYIUj5K2fnYxl0xvIsR7mtLUi1fpVBeq5fN/sQfhARgcduH8K/80t4o5sS/vkKMbDJEbUbrdLeBNQY2uP3VIJ3SKDwuFK+c4ie/+dTksebtzf3ZoeozrPXeM/fxWQzuxjKAqWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Mvgv+Xr2; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9zXxFI0efiKJSmUFWdk3YnbDAzV6gc5RsHheew2EF8KlCRoRNbmnnyejKet9n4SY1FSUDuzoJEfvTiXA+XNMrBXSuxKd+MYAFbBPKYUjbSTArQdiCHBLLOcm/hHJtRLaN4Fr6XmYdT1NYRnb9YWQ1yAlFY0gotfSJ6ntmNr9QIRq+Kn7KmvccoAWaO7z3kGLzfcvOpKZsTF/FxbAvyYRuIJ8J3DMySPdvGlT3Zx/8PYZL3sQMF3nEW1DpWJeorUaJwe6iDprPjFDh8r5G5oTobZCgerBxUBIA0qIRr2FeorQo4uDOTGsyYgjBWYeNpRm/kAl4ozszrrVpdpLBc0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsJdR2xbXLQXC8XdERmNgo87Q9hdr260XLAvOj9oEiE=;
 b=Tn6ROiikEUlluCEx9nSE1t/EnWVMV+BozWAcVHdXnisznNC61ZAjRbTJeGYZQfZLiHC4hqRs2+Hrnb8QPRjBT3gAi3z+OSH8OMJ7vkWadZ1jHbnHfgHrC/A+anojCMU+jXelUoFlQk+YumyqlDLW0JlGXOAOi4Bj7swH77Jm97MHjQ5FaDGRulYQUHF4GO/DrdQrOv14b2I+ogRlGDcAvK/LhSnHFge0RI/9tBhxkfyV5zq/HaT/NFXNk0vlFfSxeydOMMSSggVc1wdpNo4tUSlUdZ0V2kBuTINySp9Kj9vLZxjPeVuJCf431CW0m8LytjVTkVFnRv56nmmquGfnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsJdR2xbXLQXC8XdERmNgo87Q9hdr260XLAvOj9oEiE=;
 b=Mvgv+Xr2DfKvvGmTz1nHJKDeqdnt0cd5phdTKRr9PN6BOnZN7K8T45I3zfTOH20mqnutvVRu9N9hSQg9LMVFAWG3HYEC0QRlAyQpc9nRERkgkpT0BqXACKEuSDqB8TEx2/dxpW2JgOSZ513s1FWDGPhv3Jz3d/4BQACba8TWPHc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13871.jpnprd01.prod.outlook.com (2603:1096:405:1f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 14:04:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:03:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Lechner <david@lechnology.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] clk: davinci: Use of_get_available_child_by_name()
Thread-Topic: [PATCH v2] clk: davinci: Use of_get_available_child_by_name()
Thread-Index: AQHbp6CKhs5ZxZt+7EyobP9yhFNTDbOZ1PoAgAGL8cA=
Date: Wed, 9 Apr 2025 14:03:55 +0000
Message-ID:
 <TY3PR01MB11346B692BDFE96328F64DB3D86B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407093623.36974-1-biju.das.jz@bp.renesas.com>
 <449e458d-6698-41dd-8a5f-ade964909b21@lechnology.com>
In-Reply-To: <449e458d-6698-41dd-8a5f-ade964909b21@lechnology.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13871:EE_
x-ms-office365-filtering-correlation-id: a3afd463-0162-41eb-b12a-08dd776f5d9c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUtyS29HRWVNVTh1bGhTODYrblZMeHpERzF2Zm1lUXdQVFA3ZVhMSmIyWjF3?=
 =?utf-8?B?SmE2QkJsTFZ4c3N5Zlp5WE9paGtJL1NKbXdYQkRERlpsMHZidzZvTFV6WHJP?=
 =?utf-8?B?TWhGRHdsL0xlejIvOXN0VnFveUNPV0ZtVThNcFdseWRFSXBrbVhkbWNWYWI3?=
 =?utf-8?B?T2tQY0J1V1pqTXIxYUJEWDBvMmJpUGVTU0hQSjQ3eGE5N0c1aTY5N3drbGR4?=
 =?utf-8?B?SlF6M1ZRTkppeDZub2ZWTVQzc25uQjZTcVNPdVhZZ2tJUXQ3NEtaOXNiNS9t?=
 =?utf-8?B?cy85UHVxcXNhQ0lRWWM5RFZzTlpNU2ZhSENzRDA2bkt0SXZ0VWZwczlYYmdw?=
 =?utf-8?B?Yklkb29GZFprWFJjSzk1aE43LzNNbTB3ZStENElydll1elhaL2lvbzRSVzV6?=
 =?utf-8?B?bUpLNzBZQ09GdVB3bHpWeTJXbk51cG84Q1NSMk1zY09wMFRpZzBveHJxSi9S?=
 =?utf-8?B?Snl4RW9VY2dhUVFRby9scTJVdlRkNkVPNURMVmhRUnNmVXNGSmdTQUFVanJD?=
 =?utf-8?B?d1VUczg2Z3ZZcTdWVUFOdHVEWWRPR2huSXFpQnhVU0tUYU5vQTkrbktGTkNS?=
 =?utf-8?B?M21NalJjeWdmbjVIeTdLVjBmVTIrN29QeGhKRS9GYy9DR3M1YlJ6VHhFSDVL?=
 =?utf-8?B?UW1jSVFzdHpBc2h4RHNIaHhGMVdlK21TdFQxd1RPaGlqK0NOdzd5NmovTXhp?=
 =?utf-8?B?V3lkZEdzVWwxVmpGemNSSFF6Y3g1MmE1ZXRCbE5CVTBHWVowcjMwK1NoODJQ?=
 =?utf-8?B?QjFSaGkyb3o1U29jeW1FeGJtZWc2VU5naVI3VHNJT3d3Vk1GLzBpbUtBNEVS?=
 =?utf-8?B?RHBpUEJWM1Z5QVhKOGdUdE1hUUFmbnc2RGZsNnFneGZ3bWJlQ0l3dU9yR0NB?=
 =?utf-8?B?TDA0amNWc3lobXFYSS90NHZ4cFh5Wk5Nd3ZGV3pDbGJUbDJZT3FUbDVIVk1D?=
 =?utf-8?B?YkZXaGVBZ3M1bjR3UTRzRXhVTHhYN1l2bE53bnhZaURwdDkxRUFjdmdzelVz?=
 =?utf-8?B?V1FUUmx2VGZCOUZhRGpjY3NMTnJqSC9taUQzT211M2w3M2l6SnBzUlBxK1NV?=
 =?utf-8?B?MWlpNUlnUXRKWFlEZ1MrTWJFNzRmcS95VFdnZlpCY1FyL3JvNDExaUkydjcw?=
 =?utf-8?B?ajd3SE9FeVlnaUg1Q0toZDFpOTQwSEZreTFNcUJXN2F3aWE4OWlrYWNEYkpH?=
 =?utf-8?B?SGFaamtGbjNwbElWZmxUbHpPWC9UYk1jdGFObXFjVVRlcDhpN1p4REMxdDlm?=
 =?utf-8?B?d0Y3cGlpekJPMlVpRzN5R0dBb09JcnhRemkySDN6V0tLblJrTzYrNHRyaFVK?=
 =?utf-8?B?cUFNWnlwVWZrWVdENWtNakcvWEJESTRrUmllaE5HUzQvZ2tPS21FVWdOeCtO?=
 =?utf-8?B?WkdscXU2OWE4UXVickExdXZUbUE1aEtBNDR3MDB5L0pERTQvMWMrK2tmTFIx?=
 =?utf-8?B?Q1JuanRrWmxsUDIrMFdIS1FqZ0NIZVNxcHQvU0FtRXpwTVFZZDg3aDFTZTh4?=
 =?utf-8?B?b05XcVJZRkNOTXYwWjd0ZUdKMmljeFhTV1RxS2pseCtxSzVzRzR3WmRybjVq?=
 =?utf-8?B?OGczNFRzME0waEx5dGxOSmJzZ3l1c2MyeStrZk53bjI4bk56QjVnZjhqeEpy?=
 =?utf-8?B?eGE2N3ZIam9sVWJIQjRRaURsdUMwNHlwQXFMN0ttV2lLLzlvclJYN3IvN1hC?=
 =?utf-8?B?VldyTVk0b2hCeGpRVjlLWStCcVRDRTZ6RUFSMkdlcGIyeDk5U1dENm9rcklK?=
 =?utf-8?B?SmcybXhnZ2dWdUFMdk14MmZxTFZBMDN0SXg5K1ZaZDNTeXlsQXB0emMyeHlW?=
 =?utf-8?B?YUl6aG83TUU1TkNrWWpGVkZycmZ4RTZDcHYzcTYyVkxWK1cyN0ZrUm5IR0Ns?=
 =?utf-8?B?THRBc2dnYW5nY2xuT3BGMHhKUkdSTmlaaUVDbE5kV280aHNmdkVrQTIweVlH?=
 =?utf-8?Q?2nGlzjkpN7j3qAgDVmLtOoeOa0lAD4P6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmtxWFk5TjFtellEeGhiV0ZOaDhmUmhWNDE1WVF1bGFKTURUaE5QWFhrQ0w5?=
 =?utf-8?B?RHBYMERmd1R1OTJtY2FnbzJpM0lqSEFOckhESFVwY25kdGhGWEpScWtBVS9v?=
 =?utf-8?B?M0Z2VWp4d09rQUxUTXRmeXppNDEvMW00VlNiN2ZVVFkvUmJVL3BhdU5oY1RQ?=
 =?utf-8?B?aFZsRUVBVUFyck4wME5CZkttMEFQKys5T2M0MmpsSUUzRUcvQWw2Skwyc3lp?=
 =?utf-8?B?Z21VMHFsYzZWSVBNeTZJNkpDQ0JKN3Y1TGhVQTRxR0ZOeDExSE1FeTM4R2lo?=
 =?utf-8?B?aVZhVzJnclZNTXJILzFQWXlDOFFvc3lOQUhNYnJMcUNIY2UwYXprSTNBYWVY?=
 =?utf-8?B?T3ZpNUlqQ04vMlYyUC85aERPbkpnaU04VTNQUS8zcXpYQXFpekMrTGtmelU2?=
 =?utf-8?B?U2ZOb3VGaXhVRGlXaVB6dFNwR0ZqNnhFei91RDVwL0VEMlQ5a08xbzFiOGdS?=
 =?utf-8?B?SHJaOFpSRGQzbFVLRWk5cytsQlUrcGtRa0k4Q09mbEZIbDJiQ21YZHExZ0N3?=
 =?utf-8?B?UGR4TXIvTlQ4alZYS2trdHlSbDdFTTBQS2ZCZTdQMjIxZ0dwTUI0SG5zdXlR?=
 =?utf-8?B?a1g5ditMVGI2emhzdkZiTzI1c2RoYVZtYzVBRE12d2lUaXhhdHkzZzhSWVVa?=
 =?utf-8?B?U0xHOFhEWUJHQWM3by91b2pqaFlLZTVac2dOaldyd20wM0VVcHMvNEloRkp6?=
 =?utf-8?B?aENKVEFoNDFLSEg1RmpLdmFDUENma3BKUXRBR0hpZ3ErVllpOFVuVFZmNHZX?=
 =?utf-8?B?SXJvRWlLQ2paTW5HaWZKMC9CUEcvQnBlYklSNEU5cGZ2SWIvQ09hYUl5MDZ2?=
 =?utf-8?B?ZE1lazVVZFAweEYwanVqRm10UGs2bldRQ3VwdGNOcld1eU1DNFo2Y3JGdTFm?=
 =?utf-8?B?eWxoUTNJMlFKWFBNVUUrTE12VUZEZlZ5ZkI1N3hPU2lpaS9GUWZIQUdQV05H?=
 =?utf-8?B?aGxKT04yS0JkNUVxejdxRE9ZUmhRYjQybDVqelAyQUxreitiS01JekNKTDZx?=
 =?utf-8?B?SEJQalVWU00zajJWM1cwR3hXVU1DdzJqdE9ZbzE0VGkwdkcrUXFJS1Y4aWc4?=
 =?utf-8?B?MUg0UEFmNFVnYUVyNzkxVU5raWZnYnlBd1NFeW90dlg0ZmRxY01PalR4TThq?=
 =?utf-8?B?VjJBZjFIZVRsZWEwL2EySnVjd1lvTXZYYmxxQ1NZT1hGTGpJd2Y2MDBYTVhm?=
 =?utf-8?B?YTVHaE00M3RPeEpOeFpwTmtYZHdETE5UbVVVZ0V2MkdhSkxWTktnalhNWkU5?=
 =?utf-8?B?UlM0eldRTktPemxFSndDNE9rOU5jdDVwRmlycGt4SDJhZkg0dzZWNHZkT09N?=
 =?utf-8?B?TFppZlJxRlBHNWwwdjdJMi8wUU9PbVBJcHh1OXc5NVl5ak9yQXRJSUVVN2E5?=
 =?utf-8?B?SHM3aGluUVdTOWFWaTFtSHI3OWJEZnRMVVRUS0ZYTTY4V1I2Tk50UTNYYVlp?=
 =?utf-8?B?ZEJlNlFkVVlFZjlBNlFXajBwU2xWRmZtYWQxZ3ZUV2dhZkJRdXRzQTdQb1NB?=
 =?utf-8?B?RUFVTDBQOTlNOVVSbEVTSW1xQUVHd1lMbnVoNjR1UkNHZEVEZFBpK2MrOHAr?=
 =?utf-8?B?OHRrUExpalArUlRBc3NqVlh6d3VXSzYyODBxbGp3bkpwMGNGUi9iZThzMHZU?=
 =?utf-8?B?cUFtT1REYTZPdktSYzRZalM1aldURzdPS2doaktDL2picDhpTmVSWTY5NCtq?=
 =?utf-8?B?d3hhMUZHTzBBcFZWVUxEV3ZRVnVSK25xTTcrb3dxN3J5WlFOeWMvYlBRV2Rr?=
 =?utf-8?B?V1ZTSVJiWlJQK0kvc1FENmtBSGd1d0lIbDJGVUMzSkdQQWUzMzBDZFR4UmZn?=
 =?utf-8?B?VHFvblBwdnVXa1NaMEVPUlpia3VMeGlZemtmR3FvODdvY3BDWDYzazFYTGV0?=
 =?utf-8?B?V1BXU0g5ckpHY0grRFlSTjNicFMrNWt2UnhzbjNnaURPeHB2ZEE1bkxiMnh3?=
 =?utf-8?B?b1hVVjRDWEsyQ1R1ZG9xOHd0dlBHWE5HOVIra2hCc09ZVHBkdTVGeGJWdi9y?=
 =?utf-8?B?YUhnVjAxMGF4eHlLa0xhSkdXOXcyZkhJNExrdW9vOC9Yc3JYUVNScVovV2Vw?=
 =?utf-8?B?SGdxZGZ0WDBCazdLTklGeUZYLy9OVFF2YXFnV3YxUVJ1ZGcrdksvSkQrTWQr?=
 =?utf-8?B?V0NFMDJzRTF6TDhPc0lnZVh6T0JHM2FiRlFWLzNqb0RJN25oNi9XNnpWaW9I?=
 =?utf-8?B?VEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3afd463-0162-41eb-b12a-08dd776f5d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 14:03:55.1514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBLittigMTNFwpHyKplpLVrwUbxvZR3ijwjm+VE20R336rjVKdfsVWAtyiH4Gn6TGCAqS1YJczEluzo6EXvvVinwOIeYm0EUDUM8GaziAYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13871

SGkgRGF2aWQgTGVjaG5lciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4NCj4gU2VudDogMDggQXByaWwg
MjAyNSAxNToyNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBjbGs6IGRhdmluY2k6IFVzZSBv
Zl9nZXRfYXZhaWxhYmxlX2NoaWxkX2J5X25hbWUoKQ0KPiANCj4gT24gNC83LzI1IDQ6MzYgQU0s
IEJpanUgRGFzIHdyb3RlOg0KPiA+IFNpbXBsaWZ5IG9mX2RhdmluY2lfcGxsX2luaXQoKSBieSB1
c2luZyBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2J5X25hbWUoKS4NCj4gPg0KPiA+IFdoaWxlIGF0
IGl0LCBtb3ZlIG9mX25vZGVfcHV0KGNoaWxkKSBpbnNpZGUgdGhlIGlmIGJsb2NrIHRvIGF2b2lk
DQo+ID4gYWRkaXRpb25hbCBjaGVjayBpZiBvZl9jaGlsZCBpcyBOVUxMLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0t
LQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBSZWJhc2VkIHRvIG5leHQgYXMgdGhlIGRlcGVuZGVuY3kg
cGF0Y2ggaGl0cyBvbiA2LjE1LXJjMS4NCj4gPiAtLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBEYXZp
ZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4NCj4gDQo+ID4gIGRyaXZlcnMvY2xrL2Rh
dmluY2kvcGxsLmMgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvZGF2aW5jaS9wbGwuYyBiL2RyaXZlcnMvY2xrL2RhdmluY2kvcGxs
LmMNCj4gPiBpbmRleCA2ODA3YTJlZmE5M2IuLmEyMzZkZmVjY2RiMSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2Nsay9kYXZpbmNpL3BsbC5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvZGF2aW5j
aS9wbGwuYw0KPiA+IEBAIC03NjMsMTMgKzc2MywxMyBAQCBpbnQgb2ZfZGF2aW5jaV9wbGxfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwNCj4gPiAgCQly
ZXR1cm4gUFRSX0VSUihjbGspOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQljaGlsZCA9IG9mX2dldF9j
aGlsZF9ieV9uYW1lKG5vZGUsICJwbGxvdXQiKTsNCj4gPiAtCWlmIChvZl9kZXZpY2VfaXNfYXZh
aWxhYmxlKGNoaWxkKSkNCj4gPiArCWNoaWxkID0gb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9u
YW1lKG5vZGUsICJwbGxvdXQiKTsNCj4gPiArCWlmIChjaGlsZCkNCj4gPiAgCQlvZl9jbGtfYWRk
X3Byb3ZpZGVyKGNoaWxkLCBvZl9jbGtfc3JjX3NpbXBsZV9nZXQsIGNsayk7DQo+ID4gIAlvZl9u
b2RlX3B1dChjaGlsZCk7DQo+IA0KPiBJdCBpcyBhIGJpdCBvZGQgdG8gbW92ZSB0aGUgb3RoZXIg
b2Zfbm9kZV9wdXQoKSBpbnNpZGUgdGhlIGlmIGJ1dCBub3QgdGhpcyBvbmUuDQoNClllcywgaXQg
Y2FuIGFsc28gbW92ZSBpbnNpZGUgaWYuDQoNCkNoZWVycywNCkJpanUNCg0K

