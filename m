Return-Path: <linux-renesas-soc+bounces-19308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FBAFB0AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC78189577E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FD228C2A4;
	Mon,  7 Jul 2025 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eY2KH0N/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC1202996;
	Mon,  7 Jul 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882744; cv=fail; b=Q+0St4HcZrvmMNoS+4aohsn/sszckpldF4pocM/I5GfhtFU6U8iAM3BzB5dc2TdkgIRzkrEfv4kCw7lj+/c39dndOmmUu4vN3AXiw0g8piubvUP8xwhtH7y3+FqReicZvyOJDc3O2GIXlyfpyqLCLegIcdPLGiiR1c07YuQltlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882744; c=relaxed/simple;
	bh=i0IAUD0ZVUA6W9ht1QI3mTo/DSK4rQM43gDcZ5Ojs7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mG+IBR7Ts2vlKh6YWxjElkvgQWrtnRjjv5hFkzZBZK2wU6pD6G0oE1W4xrNW6Z3dNoGhwyuExlCzSCUw2e4aq57fXjooGOb3hUhysjGHdMOzXEZgXluy+/ttQ8bAnYcrQjjB1EmSRAhiuzu6fuqUDY4cUL5ssrVww/wxD9Mvd+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eY2KH0N/; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUUhdT28rO/MI2Zi7POk1cf5Bf6evz4eQz0RCJ8Adjqo2eTFTAs22NmGLwW8IG/6LTUKzipKDDtDCrjZ8kEN/qbcrFXeIU1e6kdrVVArNyzBGq2oGcIPI3E8SMnke152TePxYBYT1ZO3gn92IFpmgKdwFgsXYF0dUwvWxWYj7QZScePHqOK+hHhKiXi1po+bSqOjHu2pW94aGhI3Dgp/0lvqRP9kEU+NNMnY3mNb1Hcev3M29j0cb7Dvh1/mw4dFvPlW4cu99va/NMF8VZy9KOERRMHnelFccitmmlsnJrGaznmriZUppb/LioI9kJSNuINL1di1Duqlu2PRy1UkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0IAUD0ZVUA6W9ht1QI3mTo/DSK4rQM43gDcZ5Ojs7Y=;
 b=Hgbm6rN/FsWILBDLT5JbQUKPOwHAM95KA2n7dWICzxr5Kxf5CBl4FSzs9dqUU05jem8P8yrJRj+86vu4gEkhp43ABbNeVjOM3bKZe5HALB52JGNv99vy1CqWjsgR77elqhZswOqkdkifKTmsDz72KzIGSgLcUP0VZNcX8u8IveiZmXWxVnkk5EKvMCf4cg10Ed7KAGcclk9r/vRKX/ZbsnZw0n+IgznpJu/yfOIChyIc+xbRi0hHxy36qtlF6pMcLRe5kv4QEIxg4kDCAEQYHK9ksh245nTwvm/gqCNCpg5UrREKF5+mBa/LKwR76ClNBZORKrTu2yRF37MDmVs3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0IAUD0ZVUA6W9ht1QI3mTo/DSK4rQM43gDcZ5Ojs7Y=;
 b=eY2KH0N/miZ7JLqlXQuNxutsaYFfqbDrrZLjFXRJO+bEL9lqvzhw4nU0DL+XQAQ1nfWj1Dne1al7N0u5ECbNTtubI67ULYxoNBvNsI7Uibx4d3Fdbitflv11wKHDb9QRDbAVpsM6+CvxQx4pgCE/e6XkhyKm8L8BmbvfEAyIzCk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB12105.jpnprd01.prod.outlook.com (2603:1096:400:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 10:05:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:05:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, John Madieu <john.madieu.xa@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] clk: renesas: r9a09g047: Fix typo
Thread-Topic: [PATCH] clk: renesas: r9a09g047: Fix typo
Thread-Index: AQHb7MN1CAj9y+7tHkSRc64obwXCfrQmctoAgAAA2GA=
Date: Mon, 7 Jul 2025 10:05:35 +0000
Message-ID:
 <TY3PR01MB1134672CF0202D4E2060B1DF4864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250704091009.58821-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVzYBx-5Wfp4k_wUqO3Np6Sc+DB_2htX5uVNOqXnaRXbg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVzYBx-5Wfp4k_wUqO3Np6Sc+DB_2htX5uVNOqXnaRXbg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB12105:EE_
x-ms-office365-filtering-correlation-id: 8b91b1f2-2be9-447e-51fa-08ddbd3dd15e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHhSWWRZcmd0R3BSazRtczFlZ29jb1FaK2tVSG5nbnQ2YUJldDdxN1RScEw3?=
 =?utf-8?B?bTJBRDZHakQzUW12MlNsWFE3SjJHMEwwTnZsdXh1Mmx3c1U2enBGZGhXNlJH?=
 =?utf-8?B?Tnh3a1NVK1A1dzRmdC9vUDJjdFAyT1ZQY0ZwU09Ta1BiMkgxdXZ1RG9oaDQz?=
 =?utf-8?B?enFkM2lRWnZvT1J1VXQ1SUZPMVFyb2JvUmtxZElVU0c2RGFYSm5KQjRIcHVz?=
 =?utf-8?B?MXJCR1JYckZCejdVMUsxSU03a3RCLzIyWVN0bGVObVljRVdNdm05QjFLRThM?=
 =?utf-8?B?bXVyMno4Tkh6ZStPRXIvS1VjT1hKNzJ3MzZuZWFIRVlZOGNvMjRUbW4wQnFu?=
 =?utf-8?B?YTZ2TjM4S3RpcjhpTGplb0FJYnlRaHZ6NGtaMWdqLzFjY2xHL3lQZkw1QUg0?=
 =?utf-8?B?Q3YvUEYxb0JxRzYwOXkxb09EcndEVWl0OUZPMHdkYVVjQU9tcm9JVHVqM083?=
 =?utf-8?B?RlRab3BqVG9IOHdSRzVBOXloSzlzNENKRTZPSXV5bk9KWHljRFFxVXJDS052?=
 =?utf-8?B?ZUtkRE9yMUNHbHBocUF5V3NtVm90T29oVVlYNDMrZmZtTlhoT2NJcDB3L2xL?=
 =?utf-8?B?UzNmV3NWcHBwQUVoYzNHa0JjNStNTk5RbTlRUTh1S2E3am9EdUc3UVo1cWdV?=
 =?utf-8?B?RXg5blNwanFJL2g0NFFnTE9XRzAvMkZvV2pZU1psN29zOGpZS0NEUVJwNUZW?=
 =?utf-8?B?Wk12UWRRUDViZGpGbkpJSVlORXlrSG1vUDdMWjJXRDR6U2RkRUJYMmlRdytW?=
 =?utf-8?B?T0xEZEJOdVVnblp5a2RYYnpTLzJMdXNWVzg1dFF6dGVJTjJkanliSGdyOERh?=
 =?utf-8?B?a0JiVWxmeWNKVnUyMDVzcS91b25idi83SnBMRVBlMDJ2cWc1QjBqQ29OaXdP?=
 =?utf-8?B?OVJROWg2Zy9aTWFxV0JQRk9iV0ZianFjQ0h0RkhCcU5ncWlpYkwvaFNJUm9N?=
 =?utf-8?B?WFZxQmFwTmZveFBuL0NoRHMvTHdDV0pMZUZWbkdoZXd1RStCQ2t3U3F3REZa?=
 =?utf-8?B?dGMzU3lrOVRTWU5UT1N2ZkJPVXF3NU1DQ2F0THhNN3k2SC9RcjU4d2M0NWdB?=
 =?utf-8?B?L0lQZmIxOENrZEtBTGJ5ZUVrZlQxTkJmVGM0a3dsZjF4TWZPaTgyeENRaVJD?=
 =?utf-8?B?YkVBSHZxUm0zaE4rSVNWY3RPVVZIdlY3STJqT2pBbzJwRFFjUEo5Um1mcEJC?=
 =?utf-8?B?ZjdScmNYUU15TXF2OTlaWGlYRk1qdmo0bXc1ZkQ4UG1hbTdNV3VYSkt2MFFO?=
 =?utf-8?B?WjFhTjdaMUhvbFNCVm81OHF5WDBNanpYWmRPT1QrK2h6VUV5SWJBZ1ZhOG5k?=
 =?utf-8?B?ZVl3RGY3RjFpakJwVmlyTEt6NnhWZFExVG5FUm5aMkVLVXU3VUVhVUdrZjVS?=
 =?utf-8?B?UG9IV2k2dVBra010T2FrT0I3N3dNUnNpZ3pUWndSK2gvL1NDK1NkWHliaWVJ?=
 =?utf-8?B?QU5SZTdtRStZcVdmamUvT1NZd0VOWDdOQWRQMUlTK05EWmt1OWg3SkZsVmFq?=
 =?utf-8?B?YVNEd0w3WVUwWml6dDRBb0tGdlhkK3RqMUozQjNoR21DbUhMVFdmMkVma2pT?=
 =?utf-8?B?a2g1UkFuNFc5V29zTy9FbXVUVnk1N1RKTTgwcllidU1OU2lrYlNacTlLRDJp?=
 =?utf-8?B?U0IySm8rdkR5NXdhcEJ0ZWo3dk42TVFJWDhxdE1BRVJ0ZzZMZ1o3NWU2S1Zx?=
 =?utf-8?B?VTFRTHd4TkEvTGhUak5NYXc3c2pGdEFnTGw5YStmZWpRVTFUcnprNXNiMlYy?=
 =?utf-8?B?NmlpOHVzVVpUUjNmV2g4L25KUEZjNHYvNXhtR0QwamNyZTJ3UHlyRHpaTXVj?=
 =?utf-8?B?YWkrdGZoK0dwYVVPOFlCZHQ0Z3NaYUF2Mi9UQ2JRMVJKbkYyeXBxOGFhK3BK?=
 =?utf-8?B?WDRtRXVRQUVOUy8zV3pld2d0dzIzYzJ0dDZITTBIZFFlTGhydFlRVnk5Z0tU?=
 =?utf-8?B?VFl1SUZ2MW13ZEovZnlLL3Z6SVBuMlhGcGllTDBISEVxZS9DTTZzdmRjcDZ4?=
 =?utf-8?Q?L4kvOImITdng4QETTGFk3cYFUNmpkA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU1Fc3JjbnpsYmRReXR5U2IyaDYxQzl5ZnM4eFNDT3pYaUhMY2g3ODh2SnV3?=
 =?utf-8?B?YzZuWlRqTGdqbFBzbmZTOGZNaE9lYTkxc3lqdXU0RDNvV2wybnZTRWF1cDdw?=
 =?utf-8?B?ZUQyZkVQeVJleThpUk9SRFNGVzNTSUFhKzFKa1FQNUdQNXZWWER0Q2l1WnBH?=
 =?utf-8?B?ZWhjWDJmNDNKVXVmNVpld2k0cUVlN1pDVS9HTUZaS1c5ZzBkNHZtb1RvWWdN?=
 =?utf-8?B?MFZXVnJSTkNKd1A4ZXdqWk5hdUZPTXFkSC9NK2tnZnAvTG5jR1NMVG9RTFJm?=
 =?utf-8?B?alA5S3lPcHlUN1VLRWxvUWJrcEtjS1RmODRFaGs2Q080ZUZSMUNoRXlkZTlz?=
 =?utf-8?B?QW8wZ1lhWFJUWUxIUFh6RkF5akRLWlVJOXRVdUJpSkxER0FpNzZYZlVSbXRE?=
 =?utf-8?B?dW5weHBtemhqUis0RUlPRjhSVEJkY0xsU2xlaVRYSnRHbUdDSUpTaHYvd0Q0?=
 =?utf-8?B?M0NTNGVOQnR1eURqK2VGZVRheDZpRzdxMk91YUdWUjVKdU1pbjFYNjhIa2hu?=
 =?utf-8?B?UE44VEpRbkZhVXBVam9BeXJxVjloVEdaRk5GM25Ienp4dGNoT0RKVWhEdXlQ?=
 =?utf-8?B?N0JXNTV4QTFiazVOM0x1TE8zeUx0TTdTWERvVXVGTkN4OERQem5kRDBSYVFy?=
 =?utf-8?B?OG96WjRLNjZ0TXZKOE5lMXpOWWdtUUQzQ3hnTTRvTVY0Sk9wYVlxWXZ1bmpX?=
 =?utf-8?B?Y2V3OFNzMmdGUnkrRmRwMWNmaFE1YWcyMUZJNHRlQngyUHMybkVsOTFMQ2Fp?=
 =?utf-8?B?K0hudWlSYmRjMzRiaW03UTVmYlA4V1NUd2NvSloyeU5RbkxycWNMbFd2eWdP?=
 =?utf-8?B?Z2VlM2NHeHNGekhQS1JnSk5KQmVPTHFHWDA4a0pncGdGa2FpV0R5NTNNUFZK?=
 =?utf-8?B?MWZGRStNaFIwWEM3THJoUHI1MndxUXJtZ2diOUNLcDZtQWtsZnc4eHZidDlq?=
 =?utf-8?B?bDhJNEdHS2tzMC9Rb1JCa2xLV0dQbmRHS0NmazdaTGNINnZaMmd4elp4aERv?=
 =?utf-8?B?MGZaQjFNTm1CSGpDVkRXQk5vV0RjeWxOSTVJVHJZZ3AzZk5vb01MNm96bFZa?=
 =?utf-8?B?K3dlT2kyQzZPUkpXRUVIUzJwR2llK0x6Zjg4bGtuekp3YWxsRm5mUURpaEM2?=
 =?utf-8?B?ZVRuVTkvSGg2dCtudjZEV1hocTFYUjFva1dMbVhmeDlXRE9yOCtWdldldmtB?=
 =?utf-8?B?dXdzZWdjZ1N2U2tvOWdRNkkzd2NFa2ZUWXBTRXZtdFNpQXkwcTQrSHUxeGtD?=
 =?utf-8?B?enpwVmlhUUJLK3lDSWp3bC83OHBMU0pUcm5McWdqYkh0dUVWTFBGVGdsbHdU?=
 =?utf-8?B?N1NnN3ByV255c0RsZ252NVBQKytKbEkwa2xXN3I2Tmk1UVBuR3Y4VDdjbmVY?=
 =?utf-8?B?NHE1dzc1YWsxVExaamgzZ3NOVUpNdXFxK3BJbTZrTHJCaENScDkyc2JNRmpt?=
 =?utf-8?B?NXZWaExQeDdwblJ1Zy9VSlZSeWlBMHlkbGxBT1hpbnRyUlhNaGZIMVJzNm03?=
 =?utf-8?B?ekVXQ0RMMXkwWW9MVWMzSWpEck1rY0NKY0tpT3JiYW9KZzlvSWVKbTBjejFC?=
 =?utf-8?B?TUYwWWVMUGdFUzduZVRPOHpnZllxME9PaXNrTldQU2x5VTZSQk83UHF2Vldl?=
 =?utf-8?B?M2dJRExRdGl6dkZ2ZVBZdGh5d05JNklDTVcxWE5hK3NDRUFiRkRjQTZ4eW1U?=
 =?utf-8?B?Y2NJY0ZlUzZyS2QxUXl3SUNBeG54SmdlOEJRVFBJK1l3eDhtem1FODRROHc4?=
 =?utf-8?B?aWV0QWpaZFRhUi96ZmRGVy8vdG0wWjVPMFVwc1g5WWM2SkZPb0ZLd1YwcUpk?=
 =?utf-8?B?UDUyM0kxeEFITHhkUnVCY1UxOVFHUGRsYWtPVHZaYUllRTBQZHhaZnJnWEJy?=
 =?utf-8?B?eDdzR0dQMmtkOGl5UDhiUlYvZkpvV0F3Nkx1Q2I0d1hwZlJKRmpENWJzOHdT?=
 =?utf-8?B?SFo4OWtFL1dqS3JWdUJxWkJYSkVFUXhqWkx4WTUyYVFuVUZjQnd0cjFLNkZL?=
 =?utf-8?B?WWRlQUdDOENudjV0RTFxemlPSXl1eGtub25rSDhySkM1djRYN0FxLzgrYU5p?=
 =?utf-8?B?UHNRRXR3TGpQQnF0MURDUkZRM05XVExwSWw2N2tjWkN0czZiOVRpOGhFS3JM?=
 =?utf-8?B?QU5aRUxVaGJTamkydGpRWW9mWm03U3U3RTNPcElqTG5BMzgwei9IbkZLTnFR?=
 =?utf-8?B?S2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b91b1f2-2be9-447e-51fa-08ddbd3dd15e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 10:05:35.9164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcV/MLPXZBC6QWeHsmR2ZEJ4eLe9QuE6ooZisfaXrwI/xmL4/9q8b9I7CdOeFxR7+KU9GWhe1dnSZljBsMqcoHUCo9GGwMlrsyQLs1f/+jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12105

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDcgSnVseSAyMDI1
IDExOjAyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcjlhMDlnMDQ3OiBG
aXggdHlwbw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgNCBKdWwgMjAyNSBhdCAxMTox
MCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBGaXgg
dGhlIHR5cG8gZXQwX3J4Y2xrLT5ldDBfdHhjbGsgZm9yIHNtdXgyX2diZTBfdHhjbGsuDQo+ID4N
Cj4gPiBGaXhlczogMTdkYzAyZjdkMjkzICgiY2xrOiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBj
bG9jayBhbmQgcmVzZXQNCj4gPiBzaWduYWxzIGZvciB0aGUgR0JFVEggSVBzIikNCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBBcyB0aGUgYmFkIGNvbW1pdCBpcyBvbmx5IHByZXNl
bnQgaW4NCj4gcmVuZXNhcy1jbGssIEkgd2lsbCBmb2xkIHRoZSBmaXggaW50byB0aGUgb3JpZ2lu
YWwgY29tbWl0Lg0KDQpUaGFuayB5b3UgZm9yIHRha2luZyBjYXJlLg0KDQpDaGVlcnMsDQpCaWp1
DQo=

