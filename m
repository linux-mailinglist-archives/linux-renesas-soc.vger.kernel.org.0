Return-Path: <linux-renesas-soc+bounces-15131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B22A763E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C0781682F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320921DF26A;
	Mon, 31 Mar 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vwr2Cz6t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC117A2E8;
	Mon, 31 Mar 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415996; cv=fail; b=lIJs0MwDceVzVjzt0C6pOjHx0m5c62OIQGNeQiP5BnKO07N8TpxgxxJgIT21Qf0exR7zqNKNVMt/bTC8UGS659ow4l+Gt+F8+aMfPujWXV4o3zyESoHr1oCgwt5HbccB0lt3nu7xHlxZyy0iR4g/aVH/vTJgU0ts2Jleob1ZvgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415996; c=relaxed/simple;
	bh=UFJEv9DCI+W/k7eJdRfB2p8q9W0Kf+hELo2jPCb7Yiw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ilKdY1BN2MRjPSvioZWbnzrnRgFxIGgiH5/dDkVUhG1FPmPCpamU8z2zp23gEA/bY4hjjIWtMLvg3mB1mGMgFPVTMUR8t5qZL5mwX0m6wbCo1SXtw6Eti+J1WcI/VbpItNekPOyRyC7g2FLoIr0Eg/q/tQICk3EbCP4njeIFLN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vwr2Cz6t; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmJhWaM6XAF7Jp/esGlAa6U1uGZT5ZDBFfWN96Jt5YXDlsap3n9aV1RNV+ymTX1QZ1/hSFaUF3Lzd6pUlu+hxJZYOSXgEU4IBOFeFpKppFObBKssMJrYajhRs/h/R9CvsZKvYRUEeRAf+knPDzbtEMostPArW27S/XRIXxJMc3aPDrGI7okDdyoX1+1GBkk3WhYdE24gEKWmBFYF0ex7H6zc8bjxTQJo0JL32Bm2OEjkKG0R2WpJk0Lo5uPT+pte8tdKUHA8JE7Yx1xIJAOq1C1rwaI1fqp6rZ+i/HB/ZZBEfPXctEbpJv3YH1lWuE12+10MVqStkL7urpecLf3D3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFJEv9DCI+W/k7eJdRfB2p8q9W0Kf+hELo2jPCb7Yiw=;
 b=F2i4KyIIslOlNUsmmQB7HtaOirqfYmeXOEO/j7yJgYyOrzIWzi4RNbpz2pcRKLEd2ga90H0+yI1OnnkSEy4GF6XO0dn0A2PF887ulIuFFLu1NdqAOCSXXwhp/9FAb0Xxa56ZI3e2d5U+64Xvu3NnsigGEo1xSjiV6Izo/fKR2Uckjjo/sB1CZx4wJLGSp6xmP3XSrN+ZY8VzMl6CYS9wHJ7LQAWRBNArBXf6SjNix6hgXYHWgGyUgw/RKfb1/yVPUzlHKLJzIFg+DqTW44ihjLLyq4wy2RuU3SQLPZmPF2t/Z5vLtBNJgOwacgYN0ZbESTa47Saxqn37L6kz/u5rVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFJEv9DCI+W/k7eJdRfB2p8q9W0Kf+hELo2jPCb7Yiw=;
 b=vwr2Cz6t17zkepVVruBEabHXcwkjcyiEKp4oCLlmY3E0LzR8ztoJhIr0TJdwmUQshp+NBqdOwcmYm+X/KN0qGwCC8dmCQjNKnLQhpa0XdsEH1kPp6k5dFBsbnVYBCAnBCmsz7dPTinGQO+0q4AvdrGN48wWJWKKDiwDw8bV4N1E=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB15819.jpnprd01.prod.outlook.com (2603:1096:405:2b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.35; Mon, 31 Mar
 2025 10:13:10 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 10:13:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Prabhakar
	<prabhakar.csengg@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
Thread-Topic: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
Thread-Index: AQHboBwxmb2DVJkt/UWaCOiFKQonaLONBkSAgAACqGA=
Date: Mon, 31 Mar 2025 10:13:09 +0000
Message-ID:
 <TYCPR01MB11332E15E9A94C41A6D46F3FF86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB15819:EE_
x-ms-office365-filtering-correlation-id: 6e26518f-9af4-434c-d299-08dd703ca37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Njh6cC9VUnVKSUtOYkdCQjlmbEdXeVVibDk4N3VVd3RqdCtzek5aV1ZiMEtI?=
 =?utf-8?B?YVJ4VlIrNEt2V3pBOTdjY2YwT1Z1SXd0SUtESVRCM2ZzWFRJVSthTk9WUVVN?=
 =?utf-8?B?OXdiaGgvN2Q1M2lUeDNOd3Q5aUVCekpiTUYrSGxEbFRTL0FhSHNIdHQxSVRF?=
 =?utf-8?B?Y2RySmdHZjFtaXE5U3pXUC8xNCtEQnRXMThwYWtMTXppaTFweTVNVHZXV3Q0?=
 =?utf-8?B?dk5NdFhieG1HOG9FMFYrQmFVdHY3QkdnaUd5SFI3TUZYSGhIYXdMNzZQallm?=
 =?utf-8?B?bUkrbGhiWmlJdG5IR2dYWkhPOXR1bDZkaXVxeXdhVVhxWm5hUEdxUmxNNzVp?=
 =?utf-8?B?WDJaaFhrQkJ3dmNreUlBWnRpTFVFeU9MalpwbzFkTjBJckZSZGw4UnRXU2Ji?=
 =?utf-8?B?YlNqbjVVa3RjNGFuenRrd1RyaVdkaTQzZ05ZS0ZkY25yM1hQWXkxNnVoYTlh?=
 =?utf-8?B?eHJ5SEZZdFNKUVJ5UHlCTjg2dWQ2TGQ4TVlxcmk3MXM5UVREbjd3NDZobEp1?=
 =?utf-8?B?SjdYd2VNNW94bTdLRjBTbURqSWMwZ2psWUdEbnp0TVJrVXdkOGlSYnhCLzhn?=
 =?utf-8?B?QzhWT3MxS3ZXdmtIdzZMYWpuU0N4ajlxMTdGeFJ4aDRzeXR1TjJMNlJRdGpJ?=
 =?utf-8?B?dmxoWTBUUWxwVFB6NllKV2ZtaEpCbktLdWI5ejlrS3lHYTdMc2J2azlEUGs0?=
 =?utf-8?B?cmQxYWR1bEVUK1BhOTN1MGZ2RnFJcC9LVENOUngyMkhpdFRhSDZ5eEJzUlkz?=
 =?utf-8?B?K3gvUytrc2JwTHQwV1hWQWliQmFUZkNuYzRBTkdLeGpuWWFHZnZxbW5MOWJi?=
 =?utf-8?B?ME9lbGl5YTlKWGFkVFNhRlQrUnlaN2JEazhLQjdhaURFT2c0UU5pbmxLRGFy?=
 =?utf-8?B?MjNFVEhRZi9pcFpqM3RicFBZU3Nka2Q2N1lwdTZReXlHTHYzMVJwb0J2ZFFU?=
 =?utf-8?B?eXNJNG5Hb2FCL0NucVhVdDhja3RQVWRGWlkvTnlodHRyYWV3eUx6dXhZZDl1?=
 =?utf-8?B?eW9OQU4wWWlXTE1MMk1sNDhrcUx2MGEzRE5sRGw5VW51Z0prY25UTzJNVWc0?=
 =?utf-8?B?b1kyTkl6L1BNWFRtVHFlRnEzTFlpTVdVTm53U1FxNzMyK2xDRFk4cU5yMmlC?=
 =?utf-8?B?UlVkYnJ4VVp3eVpGVG00dXVwYlZMVGxVbG1HWDl4YTFCQWd5dEFXaDB3WHRa?=
 =?utf-8?B?WC9lZXpaZFI3UlQwdktPU3M3S2NxQVZ5b1BoaTRMeklnSnBic2tGcVY0UHdm?=
 =?utf-8?B?bmluMVNQMTNjbmtFdEdRVCt5YlZ2cTNadkVLdnhWRjRkZ1daN3MzWmJVcFVs?=
 =?utf-8?B?c3MxeEtRTWx3cThKcjNad2VBcDRZOWlMc2xHY0NLRTh3L2Jjb1VCVTZ0TGxn?=
 =?utf-8?B?Z090eDZPS2hYMW9HN2ZJMUEyUGdObkZHUGc4NUgxS1NIZHlBQ2JoUFdOVXJr?=
 =?utf-8?B?ZDJzQTMxWSs5OW1PWTd0elZNNHppaHA5ZXhlSWxKWUtBWUZjUWhiakVsQVlS?=
 =?utf-8?B?UjJYSFZSRzlZaEhuc0szSHY5VFZIeGVNUHhYMDFRNmNuc1VpKzloSWxJWEtE?=
 =?utf-8?B?SWRrckc1b01sYzErQm1tVWlTdGNTSnNNN1VydFptd041MmJaenhMYWVTTHNT?=
 =?utf-8?B?ckxKNW9scFdjUDhJb1g1dEhCbFNZZFMzclZ0UVlOaGJZKzRhWFVMOEs0TjhB?=
 =?utf-8?B?YzJ2dVZMd3BoZWU5NmE4UjZQL09xS2c4RUlnKzdsUjVFZFR5bi9FemZjNXl6?=
 =?utf-8?B?TmlSNWtQWHY3TGJVKzJycXZJUjRmVUtCV1JRbU5vMEsxY0pIUHAwNG14aXZ1?=
 =?utf-8?B?dWhVQy9ITzJIK1gySnNKVkZ5UlQ4RGpldDlVUXR1eVg0bWo1UlBUbU93WUlC?=
 =?utf-8?B?KzJCckY2REFmOExEd3NGa0RSVk4vSVExcVFDeFU3cTdRMCtzWkhPZzNycGcy?=
 =?utf-8?Q?0F2BcwSeMt+ZOUF5Nhu3/m+BZ4oxwQXV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHBvUVpGbTdTTkQ3K2xZMm5XZzlXbEUvYzdvS3pyMVdaYXlrWHNNMHVDaUhT?=
 =?utf-8?B?QTdNd0VEQUE0UHRnem1MM2puUU5zUEhPWklERzZ6OEJiQkZqOUtkZWJTdlJZ?=
 =?utf-8?B?cStiM2RabjZ4eFArcXM4WE1ZVTJzNzNYcFZNaUdXam80dU1GK1NkMTlKSUJ2?=
 =?utf-8?B?cmJ4YUxTNStvNDlXYnUvMUViamI4Mkx5VEtPMjJhTWpEaFQ0U1RuTEsvcDgw?=
 =?utf-8?B?L0o0Wi9mcVNSWDVqUzcvTWdyN3Z2ME81YTVqWVh4SWJTZktzT2tMa2ZyZlQr?=
 =?utf-8?B?MGw5aUhoWjNqSUlUMCtBNlFxdXcyTWtFeEhhUjJqaFFaTnFTOTVaaGFmd1pu?=
 =?utf-8?B?Qmt5OHBOZzYzZjJGQ3RyQUMzenJTc21LRmxyMDZzWklramlwVTNQNG1rWTRp?=
 =?utf-8?B?ZlFISUFFdXIxNC96TlFTSEErWXI4S1lOSmUwSFlULzV3V3A1Sk1iWUM0bXZu?=
 =?utf-8?B?WU5WNkxKZ0Zkb2pMNjBaOU9JSG43TjhQNUExMk9nWjRYek93S2xYWFNQS05X?=
 =?utf-8?B?RFkwRUVIcVlpT0M0dzM5VkNwSEtFZGloMjYvR2gycTQyTEFRSEhqcnBDbE9Q?=
 =?utf-8?B?QTQ0elJTZTZFdXpVSUhGRVM1T1BIeEVOajQ4dGFyank5c2dIRTBvdEZWZnRa?=
 =?utf-8?B?VWhpTE9aSlc1MzVxVzBISVFwMXNqY2NWUldFSGlheVdMNlplcGwxQzl3V00z?=
 =?utf-8?B?ZFR6bFVCcTZPbzl4c1c0N25KUTFlNW5hWm1VKzRWejh6RXhudThFQ3dxRFN4?=
 =?utf-8?B?TURtM2ppUndKSWxjUGJ6WkRCNEc4dGNodEFHUWJnYU5tbEowU08vUVlFU0ov?=
 =?utf-8?B?UXNKL1creTc5cndta3F2eEhKZlJVZTRKR0djOFQxNHpWN0w0cWdMKzVCcWdJ?=
 =?utf-8?B?VHZXcTh6b2FNZ2Rva1I5ZUNVa2E1WFE2RFVrM2RMbjFZYnZHM216T3BtbHN4?=
 =?utf-8?B?dGgyMWxDekNEQzM4TFJJdGlZT2JtbzNBU0RlV1ZXdGRmUWZmWkVCbnRsSmR3?=
 =?utf-8?B?aWV2dEV4c0R4L24vMG9qSExpVlMzN0lmWUxsY0tUNmxRN3VCaStJNXZqZzBO?=
 =?utf-8?B?d2Z2VFRXZUc2dUZIUjUrM2JUMnFKOGRCek5PcWQ0cWJiVmhUN1E3MFk0YzE5?=
 =?utf-8?B?MFo2NXh1TTEzeUlVaEJnQVk3WW5Ib3dTS0FuYnhqL25TZ2FIMUk5UmhLd3FF?=
 =?utf-8?B?OEVPTXk2bVo4SGo2SUpiNTFabUFValpaaVJLNFZ0djhZVzFvUFZnUjRJZ0FX?=
 =?utf-8?B?aGlQS0NTNWtsbmVaNHpPVElVM2R1Vkg3c2tEZkpPcVFRRnlqWGk5NHhnYU8r?=
 =?utf-8?B?NHJiMGFQSDd3V3hkK3BjMGsveXZpVHZQSGcwc2RzdUo1a3R2VEM2TDhIU01o?=
 =?utf-8?B?L1FYSEdNVzMzYkc3c2ltM3pxNkFWYWJxQ2F4V0pSTkE5OThHZXJ4OUxrYnU5?=
 =?utf-8?B?aDhjcDBLdzAvT0VCb1hDcWhnS0dOdTZIVllOVk1rQ1dVcy9STmVrQUtURlVh?=
 =?utf-8?B?T2NVYVd2NlZObHNsMXo5Y1lKTGV5S1B1a0ZNcnVCOEh5TWQvNFo1M0NVNFVT?=
 =?utf-8?B?cjZWeDB0dmVEY2t3YWFVdXg3UGRRYll0OEsycUJ3bjBDVXdNTzlmNytjaVE5?=
 =?utf-8?B?RkRVc21ERUlXaU5RS2Z2dEF3QUtBUGI3ZXhnY3dTd3pqV3FNNnpvSGZYejB1?=
 =?utf-8?B?c0YvaUZGOUdZaE5ncXJyWld5MUR4d3RWK2hSZlRHSndSWm1ZZ280QktMai9M?=
 =?utf-8?B?QjlRWDZXUWF3LzBxUXBKTEp1MmN0WmcrMHRRMWpWajZnTUpBYjRTUjNia0ZT?=
 =?utf-8?B?SDAydDlQUGQzMTkwdmlHZlpzZFdyTEFEbndCdnM2Z3hxRzZIaTllRk10aXR6?=
 =?utf-8?B?M3k1T3U5QVdjZUltVmxDZUd4Wmg3K3E4UUV5c3M2My9SNGlGT1ZjTzdGaFdP?=
 =?utf-8?B?WUF1bExiSEo3MHdqZXNONmhRNXJxMElYV1IyL1dvN3o5T3ZQZk91TjR4NFRV?=
 =?utf-8?B?UDJUNFlRQlVod3BuQnJZZkorckNoTnMxTWFLOUh6eWx2b0FqNy9TeXpZcDNy?=
 =?utf-8?B?OWFjb1U5dnl6OTZxYmVzZnBMelJKc0Zoay9ocjRjdW52cmVncE1yVGlQNXJr?=
 =?utf-8?B?UlFGdTNhWTVnZ0s4cmZoUUlGazdVUEFWbXBndHZoUHNjSm9NaCtLaEt1YjVa?=
 =?utf-8?B?bWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e26518f-9af4-434c-d299-08dd703ca37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:13:09.9602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBJe/3/4TK9lN7kGIYl9IeEd41KaWYCT0M13o72IkfsbnOOktrVhfdr7rI+iKGCnkTaTCiZ1bMhW8kwRL8802GJCdRUIMVGZOB8/gmeCFmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15819

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxMDo1Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gY2xrOiByZW5lc2FzOiByenYyaDog
QWRkIGNsb2NrIGFuZCByZXNldCBlbnRyaWVzIGZvciBVU0IyIGFuZCBHQkVUSA0KPiANCj4gSGkg
UHJhYmhha2FyIChhbmQgQmlqdSksDQo+IA0KPiBPbiBGcmksIDI4IE1hciAyMDI1IGF0IDIxOjAx
LCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToNCj4gPiBOb3Rl
LCB0aGVzZSBwYXRjaCBhcHBseSBvbiB0b3Agb2YgdGhlIGZvbGxvd2luZyBwYXRjaCBzZXJpZXM6
DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI4MjAyNjU1LjQ5MTAzNS0x
LXByYWJoYWthci5tYWhhZGV2LQ0KPiA+IGxhZC5yakBicC5yZW5lc2FzLmNvbS8NCj4gDQo+IFRo
YXQgcGF0Y2ggc2VyaWVzIHdhcyB1bHRpbWF0ZWx5IGlnbm9yZWQgYmVjYXVzZSBpdCB3YXMgbm90
IGNsZWFyIGhvdyBpdCByZWxhdGVkIHRvIG90aGVyIHNpbWlsYXINCj4gcGF0Y2hlcyBmb3IgdGhl
IHNhbWUgZHJpdmVyLiAgU28gcGxlYXNlIGNvb3JkaW5hdGUgYW5kIHJlc2VuZCwgYmFzZWQgb24g
cmVuZXNhcy1jbGstZm9yLXY2LjE2LCBvciBldmVuDQo+IGJldHRlciwNCj4gdjYuMTUtcmMxIG5l
eHQgd2Vlay4NCg0KREVGX0NTRElWIG1hY3JvIGZvciBjbGsgZGl2aWRlciB3aXRoIGN1c3RvbSBj
b2RlIGFzIGl0IHJlcXVpcmVzIFJNVyBvcGVyYXRpb24uDQoNCmFuZA0KDQpERUZfU0RJViBtYWNy
byBmb3IgY2xrIGRpdmlkZXIgd2l0aCBnZW5lcmljIEFQSS4NCg0KU28sIHlvdSBtZWFuIHVzZSBE
RUZfQ1NESVYgbWFjcm8gZm9yIGNsayBkaXZpZGVyIHdpdGggZ2VuZXJpYyBBUEkgPz8NCg0KQ2hl
ZXJzLA0KQmlqdQ0K

