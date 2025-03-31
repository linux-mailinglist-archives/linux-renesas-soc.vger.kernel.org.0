Return-Path: <linux-renesas-soc+bounces-15134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BEA76410
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47C5C1684E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1721DF987;
	Mon, 31 Mar 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vHguy1pE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64427726;
	Mon, 31 Mar 2025 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743416535; cv=fail; b=kfiz1cJ7yVxyIMA8WqMoUuBNB8XjsQLKnyE/DNKJr0Eg0/2B3Lo4LO3O+WGiWJ1Gjm69ro9CjEJIyfKT1LAeMHABLD104KnnRUbf4ifpZR6yQVKtxo7wptK/9K/9YMOfsVsLbllkCX2mrEqvjVsqSH7yN9XO3rDoCpAQpu8eVjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743416535; c=relaxed/simple;
	bh=L4J0lsLR5ex1iNIPgk6Tm21/SPQI5D9jZJkTes2ykIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u6WRU7Parg9j/rlN404w6tukng8TaM6MCdfDBs0KWsoL535jQwmXH+3maOhopfsEQnLa4bJKRv0+ffkPxzPgfmLNCzg+AXoWXErcK93rr+FDuiqlJJNApafDXsgN69mIgi2/W+GWMyKHeK8qgbTqu/l8DilYnFtNdfDinhtA8PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vHguy1pE; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdlCw1yAOEiIltgawH8zJbmMuxgSIsAmYFSCUfHI4aNAZjdO+BYgKB62ympX9oG2SEGVWm9NuziiDuidYMAWg4am6pz2MXVxogQxlYMym4c68JBvz1ZgO/s9b8/eC/Jgvqvfpf16MEQXculpoMLkD1VTrJZAsC89oWIsxwFVY3RhD57udT4gDG7QeqEXgFIYZAZwkPIfClS0q68I9l5YDQWgbZkGxVEsyljBuUigO/Vl+bh3vUUaxiHI1rGVRwiYG4msVUtYH9/+HfkgwcigdRtJ64iJ1UfUfR+fW3ixxpOrXKbfy/u3/F6h0HlZkl5NIyNekuBsP5f7oBUR/sN2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4J0lsLR5ex1iNIPgk6Tm21/SPQI5D9jZJkTes2ykIQ=;
 b=WHnr8TQc53zETt8r/mIho1Jz+FjTo5pZwGD/cehlXPpCVSXtGRVe+qYNuEajTIe5pXhKguPTIk8CRnEqxOIaT+iZIxtnKkcmDjo7e/P2OkAb1G1nrfvX48I/zTLOeMxP1hTEvdyGqZCFq40n6h3AwVU6HXbRZKKJnkhwFhtWGlcxAYUoJFUvOBC6Pzcem+08m6S7oC3lGLYIk/OuyBthuN94dfo9m5jpuqdCIBVsHRrOgW/E4EqleGfaBmtgHB5ab5rHMRG+0eWLRBC1Wyfetyq5TkOcKFt8puJ69+t76kO1aWPnY6rvUabYrd/MQhng7WKdQSuc5sTA2sSdUIFS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4J0lsLR5ex1iNIPgk6Tm21/SPQI5D9jZJkTes2ykIQ=;
 b=vHguy1pEP3mFiJrEmaOph8FdrqP6wjYdB3yA+SVdtgf5ZJ++YPwymIWf8fm50wL8AVl6c+WVYBpLxs0/yuIyWmHgufPb8cCypWLjTw/sD4Mh+2JHu1ztBxcu6HcAKZdwSIpZIk23vbYRA89J+fd7U08N5pHtw7oZz8LMZUuWLRc=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB13753.jpnprd01.prod.outlook.com (2603:1096:604:368::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Mon, 31 Mar
 2025 10:22:08 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 10:22:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
Thread-Topic: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
Thread-Index: AQHboBwxmb2DVJkt/UWaCOiFKQonaLONBkSAgAACqGCAAAQJAIAAAC2w
Date: Mon, 31 Mar 2025 10:22:08 +0000
Message-ID:
 <TYCPR01MB11332019749FDE47EACB56C3786AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com>
 <TYCPR01MB11332E15E9A94C41A6D46F3FF86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdU4AGWR=4G2+U_tG8GzxE-j+ZT8oia9SwNH8YyU7jLu0g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU4AGWR=4G2+U_tG8GzxE-j+ZT8oia9SwNH8YyU7jLu0g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB13753:EE_
x-ms-office365-filtering-correlation-id: ec332547-07b1-44a1-c099-08dd703de4a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDduMzlLTFFGNEtOVWw2Unp1ZGhCclhwWjJ6YkpwL0lxWkJabk5MbVpaWDNY?=
 =?utf-8?B?akRlOEhha01JeGhvekNDTkliS1IyQ1dLVWxRdWlkZHBQSDRrNkN5bnZpaity?=
 =?utf-8?B?dlNWVTRTeTJPcWk1RWgzSXFjRWcyVnZpeGQzOXNLMjhDMm92a3JNTDZVSXdF?=
 =?utf-8?B?QnRHMmxkbHM3ZklVS3F3OFNTRjk3Yy9IZFc4SkJzN1FESmNkRE5RTSswZVFn?=
 =?utf-8?B?K1k5Y2YrZ3gyVW9tUHhTT0NzM01HeXVWVVB5N0JxTmdNUGJyVVpoajZBNTlK?=
 =?utf-8?B?SjJyY3NVdHpzRm5GYzQzblo3ZTdSMVNRLzljMEZOOGlWWFRhcHF0eVBIUXo2?=
 =?utf-8?B?OHIxRldkd3JsTHJTSGF5ZjVlYk1JZ1RkYllsenlWUExleHhiMmd6UnJESDZH?=
 =?utf-8?B?dTRYd3V4ZFlvOS83cVRRM2VaWFhoZ054Q2lOejI0ZjAwRnVkRm5OelM0Nkd6?=
 =?utf-8?B?R2h1dERuQ0hwWjZyTWJVREczSFh2UFBXNnpvS2wzdndiVjRPcGtTb1Bqb1Fr?=
 =?utf-8?B?M1FnRHoxTkM4WUZodjduTnIzWkRkL3V2Y3lJeHdKREg5MWxHd21IaGxMNkd5?=
 =?utf-8?B?a1BJNFkxeGs1UHNreEJYL0k4cVpZeUx2bTJweUYydFdDYTNsbXEyWGhwNlkz?=
 =?utf-8?B?TWtjazV6QXg4eXRQQXdJYUQwdlNxdHdWQzhpZkZ0K0NDSVVOeERTTmJmaDF3?=
 =?utf-8?B?VVhXUkVpRmd5QS9wemhmMXNZR2R5QWxBczhYa0E1Smw1QWZhN0E1eEt3b1R2?=
 =?utf-8?B?NHEvSFRTRVR1SGQwNVBMWVo1dm9iVTlMMi9HbVlvMDJQc1BLcE5DekRwYjFF?=
 =?utf-8?B?bjN4OFhrNUtLdVBCdTJJRTZnYkdLTkdWWjlaa2JtRERKeFp6M0ZGelNKZWNr?=
 =?utf-8?B?cVRYTWRoOVRrVVBDYlBvYUdBTjZHSHJNWTNyc2RGSVVVWmpmUGVxWXMrUzJU?=
 =?utf-8?B?aXVLbmlaM3paUWdsbE8xMFpwM0tid1lTYWhSVXpaeUM5Vi9xSGFqaVUyNUxm?=
 =?utf-8?B?SzMwM3d1b29idktJaTNjSUh5NlhYcjVCaW1yYUVaaFAwb1BYWVIrKzV3dzRB?=
 =?utf-8?B?Vmg4YTRxZ04zOU1SUjNSWkJnUzhzdUh1bFppT0drbWlQZEJDVVJpV0pMWFUx?=
 =?utf-8?B?REozMGpCUk1KVEYreVFNRkJKZXJlYU82eXdCaW45Zm1ZdEJvQzhId24yZzRD?=
 =?utf-8?B?S1J6M1JJclY4ZzFxaVVxK050SXdUMzFVV1E1SmxrRWF0aUhDMlR2OWRmSjBo?=
 =?utf-8?B?UERUY1dDVXdJODNoWWZ6WUdKNTdRVEZabVJGcHU0SGRJRitqUXdQRjBUaS9T?=
 =?utf-8?B?bWN6dzlGYUg2TkNPbEQ3T0duSjJsM2ZHeDloNldSdng1REVZdDk1M0lSa01G?=
 =?utf-8?B?WmI3dnhUUGJ1aXB6Zk52eURraW9CZFgyRlR0cGRWbllIeDNjL1pkSmlleVBz?=
 =?utf-8?B?UTUyK0NOWXVCU2IrdDdXcnhMSTJaVUxmK0VLeFVwUFdKV2c3ME10TDBPUGdM?=
 =?utf-8?B?V3JKWjhoR1JleFNiV1hUeVU4bHVCRlV0aFNiZ2QrOEMwSUNINzlOL0hxZ1lx?=
 =?utf-8?B?SUUveXhzY2ZicFFOcXlpM29JZVhqT1JUOWNhMHlzVUZOUlBhbTBlM05PamxM?=
 =?utf-8?B?ZzdjV3IzYmpYUUNsRDRta1NPQUgyQzZqbkRiYnJKZ3ViTlArc29FVG80UThC?=
 =?utf-8?B?aDc3ay9aQW9xdG9wbFlhWGZFWDF5dnZxZitORTdwc0I1SUlGQzgycUZsTGM1?=
 =?utf-8?B?S1lSVjV5YkhOajdrV1pJSGgrSkpUUkMwK25Yak9NT0ZzSktkR3A2UE5xRzJK?=
 =?utf-8?B?c1JqUmEvK1ZzMGFDcGoxWDA4eGhHT09NckVhWitIR1NYcGhOdWxUNlNSSk1n?=
 =?utf-8?B?T1dJSjBiMFVDNDFBaTRzTmtoYzJ2WUlyWlVDRDVNQ0psSHdUazEweHBVYU1T?=
 =?utf-8?Q?IMvKSAvcxgn2dCgIeSjZVoB9fjvcVB7W?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEtqUmVPbXpMRE92U2g1NmdVVmlYOW45b1VhU3hmd3NXVW9BYXRlNUhPUGZD?=
 =?utf-8?B?Z010SFpxTTVoSWpySUhaRWFHdTRGM2QzdU5LK2lqSWtRcE9EcFIzdFkvTm5F?=
 =?utf-8?B?TUlJaGlsTWVzNFVuaU9tVGRNTXQ1VTlpc0dMd245dVZHMkN5N2x4U2RhOGpQ?=
 =?utf-8?B?VGVDalBHcFJ4M3lRRVcvSUwxN1pDVDlFVlFTQzlhdW45djY5T3dQVEswS0FO?=
 =?utf-8?B?TWRMUXJLSk9HRTh2bkZJT2VpYlRFY01XYmpjbnJnOXRzcVpEb2VRdXYrNTQx?=
 =?utf-8?B?dkV4QzdXdk5MWVByR2JPU3NxcFZBL1ZsbXhncVZpYjJxNENQQkZham5VVnlV?=
 =?utf-8?B?b1EwY0dMcDM2SVZhQ0ZSYUhRRzJhcE93Q280V2w4U3Y5Y2N0RVBGd0xNWUx0?=
 =?utf-8?B?T0VUbllONjZNTklEZzVkc21XU29VRFVOQ2ZHMVlkbUJsUVdTeUhEaytDc2xN?=
 =?utf-8?B?K2V5Vm5teUpVTnd4UFZJMmVNRVMzY2lORkMvLzVCWFJlRmZzc21RN21hcEx0?=
 =?utf-8?B?Vi93RmJJOS9Uc0dGWSt2b3JvZ1c1bzMxcHRiSzdvcGdmNnp6R3orRzlrdjBK?=
 =?utf-8?B?SkhVQlRWYUZERk5OUzZBSTIvYWEzaWtiZm95U0RJR2F3Z2h6SWJCV0h4U0hR?=
 =?utf-8?B?akkvWHhFRGE4eExmMjFCNTNsWGh3aW43eVUzaXo0Nko4ZnR2aFY0Nk5OZnp4?=
 =?utf-8?B?aVloVE5ETG1WZUpxZWw4Vmcwelo1YjJJYmtBcGM2Tnc4eEJieVd1VmhMZllh?=
 =?utf-8?B?TTVLZElsdGg5dE1hVmYzZE9QeXBXTFdNM2tRRzF2MExzRk9WMDkxY3hkU0VU?=
 =?utf-8?B?R0F0Mm1BcjQyYWRKRkIxRlJ1MCtWM05wcm1lVDlTSjVZOW1DR2I1cEl6V01y?=
 =?utf-8?B?UWxTTmRFZjdGVXArSnVtdFNVQ01OR3BJSkVPUk1HcnJ4K0YvejdQZjl2dTFa?=
 =?utf-8?B?Z1A4WFliMlpuR0M0Mm5tSVEyMWliMmphRnJTNkNKSnVRZThJMGxXOWZnTjU3?=
 =?utf-8?B?cUdBdzRqMmxwYU50T0duTEo0U3NVQWthbXFwKzAzdVpsVnBTUkhWWjV4cnlr?=
 =?utf-8?B?eHhLTldBMUpJUjhBNUFHOHRhS2JFRyt2NzRrVDN5bTVTdXlBV2xDT0JaaVky?=
 =?utf-8?B?d1gwM01kWGJpa1VLTnhOUUtLbHZxaUJsd0p6ejNYQTlvOFl6OGNlZDNYZnlJ?=
 =?utf-8?B?dHJibnB4Z1FROGdTSTBuMG9sY04yUDdYZUdmVmlXWTd3Nm82TktnQ05qSlZs?=
 =?utf-8?B?RVAySXd6by9mUzY4T2ErSjRWTE1mRnlFakNVN01IeVYwOFhySlkvaERUWlhM?=
 =?utf-8?B?NURSaGx1elYvd2pRcUhiaTZrY2JvMVVzRUdFYjluWXVlSVpxWUpTVk03d21l?=
 =?utf-8?B?UXhDY0padjBMWDVFbUgyaFVEMGI0cHBEZTdQQ2tXWlVhaVpQdmhiYlUyNHJx?=
 =?utf-8?B?Wi9qeHpsTW4vQW5McURBakxoUFpDNFhiUVdwelZ0bW5nM2UwNitJeG9vOGJF?=
 =?utf-8?B?TE82aDFMVjJZTFRycTg5ckdsdnFRYy9LU3J2cHlIcHNlTFNkcXBHWWdyOC9X?=
 =?utf-8?B?L1EzWE4yZ3lxZ1l0bGpOSjl3T3NNRG5Ic3pKWWdnN3lDWUNWYWVuQ0Q0QkNX?=
 =?utf-8?B?V2N3QU5EVVJZNERjRzlwV21leG9xUWVIWjU2SmIrZWQyUVNHWGZFNk5JQlkz?=
 =?utf-8?B?U3FUczRSSTRsQXFJTDBWZldVWlN3ZWVaaHVnMTFoMTNaTXR2d2dRS050S3da?=
 =?utf-8?B?UHhlYnhadC9yWWlOd3R3UTl1YUF1UFJIc2tYVXByUEN2TFVPNm9kOFdJTkln?=
 =?utf-8?B?MXZhVTQ0Sk9oQlFNNVZJRi9hdlg5TC9vQ1A4SWxTeXJPTVNSOFpXQTcxMC8w?=
 =?utf-8?B?UHVzRkRZSHEycXQ5emFGR3FDbjEwemNXaTFlUzFaQ2ZvUnEycXdZZFVuSFZ1?=
 =?utf-8?B?TmJOeGRIVjBPMjB5RjNUSGVqYUlEek03TXVQdlNmWDNFMkpzZWNSVG8xbW4w?=
 =?utf-8?B?SXBVNHJaTkFzZkUzaXhZYks1OXF4QlRlOW0yZjZoVGJPVmtpdU5sTWN2VzYw?=
 =?utf-8?B?aUlPR2xCUElZNEMvcGZXUDV5L1JuaXZqMFZ0NXRFTkxGNHVuTHFzR2dncm9D?=
 =?utf-8?B?RDBpR1pDQmx6RURNa21VZkprenJTak5TVEgwOFNXKzkyZS9PMkcxTFdaRG1u?=
 =?utf-8?B?Y3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec332547-07b1-44a1-c099-08dd703de4a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:22:08.7866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5UPjYtAZ6iMbu01EK6zRG6+e/auFFn+StJZU0pkqwO+ohesZLbz5fuogvMF36bDldO7NikiW/F0GakngUonbQJJHafWpHE9fDf3JLGAvYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13753

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxMToyMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gY2xrOiByZW5lc2FzOiByenYyaDog
QWRkIGNsb2NrIGFuZCByZXNldCBlbnRyaWVzIGZvciBVU0IyIGFuZCBHQkVUSA0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIE1vbiwgMzEgTWFyIDIwMjUgYXQgMTI6MTMsIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBGcmksIDI4IE1hciAyMDI1DQo+ID4gPiBh
dCAyMTowMSwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gPiA+IE5vdGUsIHRoZXNlIHBhdGNoIGFwcGx5IG9uIHRvcCBvZiB0aGUgZm9sbG93aW5nIHBh
dGNoIHNlcmllczoNCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI4
MjAyNjU1LjQ5MTAzNS0xLXByYWJoYWthci5tYWhhDQo+ID4gPiA+IGRldi0NCj4gPiA+ID4gbGFk
LnJqQGJwLnJlbmVzYXMuY29tLw0KPiA+ID4NCj4gPiA+IFRoYXQgcGF0Y2ggc2VyaWVzIHdhcyB1
bHRpbWF0ZWx5IGlnbm9yZWQgYmVjYXVzZSBpdCB3YXMgbm90IGNsZWFyDQo+ID4gPiBob3cgaXQg
cmVsYXRlZCB0byBvdGhlciBzaW1pbGFyIHBhdGNoZXMgZm9yIHRoZSBzYW1lIGRyaXZlci4gIFNv
DQo+ID4gPiBwbGVhc2UgY29vcmRpbmF0ZSBhbmQgcmVzZW5kLCBiYXNlZCBvbiByZW5lc2FzLWNs
ay1mb3ItdjYuMTYsIG9yDQo+ID4gPiBldmVuIGJldHRlciwNCj4gPiA+IHY2LjE1LXJjMSBuZXh0
IHdlZWsuDQo+ID4NCj4gPiBERUZfQ1NESVYgbWFjcm8gZm9yIGNsayBkaXZpZGVyIHdpdGggY3Vz
dG9tIGNvZGUgYXMgaXQgcmVxdWlyZXMgUk1XIG9wZXJhdGlvbi4NCj4gPg0KPiA+IGFuZA0KPiA+
DQo+ID4gREVGX1NESVYgbWFjcm8gZm9yIGNsayBkaXZpZGVyIHdpdGggZ2VuZXJpYyBBUEkuDQo+
ID4NCj4gPiBTbywgeW91IG1lYW4gdXNlIERFRl9DU0RJViBtYWNybyBmb3IgY2xrIGRpdmlkZXIg
d2l0aCBnZW5lcmljIEFQSSA/Pw0KPiANCj4gTm8sIEkgbWVhbiB5b3UgYW5kIFByYWJoYWthciBz
aG91bGQgY29vcmRpbmF0ZSwgYW5kIHJlc2VuZCBhbnkgc2VyaWVzIHdoaWNoIHlvdSBzdGlsbCB3
YW50IHRvIHNlZQ0KPiBhcHBsaWVkLg0KDQpUaGFua3MsIGl0IGlzIGNsZWFyIG5vdy4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K

