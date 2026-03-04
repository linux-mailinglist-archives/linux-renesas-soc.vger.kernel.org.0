Return-Path: <linux-renesas-soc+bounces-28780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCqSLsBOqGmvsgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 16:24:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67179202989
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 16:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A98EB302796A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 15:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030F3331A43;
	Wed,  4 Mar 2026 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R5pA3pTZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF832A3EC;
	Wed,  4 Mar 2026 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637524; cv=fail; b=f9k71L0NPj9Xw/1Vv8HOqCgQUgcL+6K58FbMsjQzhS+eIQ2Tb2bwY3ETIAOc1kaeBNFoBSVPnlmW+6G8ztLqBkoJx+e27AvDUM/jLlmwP8SwNcgftfZER22UW5BVhH6iOUTwJ+DeX8U99d4cJ+WFwJrweUA027KbnmZVOPyD2/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637524; c=relaxed/simple;
	bh=HhixIVsLmQvWZY3Gt8xIlbBisd2q2hwTKqBR6nrnekU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AZ8jbSJ+bjQAwF/KmuzF4DW8qmHCSBiIyYWMVl3SXHlJPsz8jwFqtHI6NIHR/Sy/imiC2kNw3G0UsIIiIzq1UDGKuvaeo4Nn+B0CgDqbdcBeEX06KLbbcGp9MrF0EzAz+ygNzpTNxc7t8fj3cc6a2YNWX6KUOaQKlsik+8XVO/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R5pA3pTZ; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyUPxUzpBUjKpqCs54MY1ubZGCVZdGeB9hoW/vYvm2uhfakaEi/BVH8d+8eyY3Nru+uknpAb7/0cqTVwdT1JYWZyePdwWIpFdIgT4bJ26DejAABdI7c0pTFn5E/giuCWWRCGZ/JH2eUwnlNUFK+RMSIeGCgM9hiUgGj7Tqwu2eC6HuMIHg94ytggfPpS0ssVUj0Zfy4Ib0nN50ABsqy8ihHOJ97WsoncqF7ChjHhVNgm0x53/Vt5YXMYhAxdsIovQw1OY9NrkubffbmZapRg6VcxO/TgQ1oWHN+KA0aQg8qKAkDr+hmMLPlVJmifn05dGZc3V4jGCUmubboiyJw2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhixIVsLmQvWZY3Gt8xIlbBisd2q2hwTKqBR6nrnekU=;
 b=p9AaXlgWbS9f6pBWmEt6KdolxsnROQSoZioAKeCLafj4BJSiFJZrkY0Myjzi+KFAWPkbtNBa53othXbUt2mWRgzQqCp5vebML2Qn09GJsl48WRh1HJyLvMDxgUhL+210Z1ElkLvAlxgzdHe+yFoAfwrEqaKWAqfNA1HN98jTJd7vn+JTVowvDVUoOGrfiiOEbTzcasuS1NB8mzWGzsq0+zMbFV5/PiUDm7I0spD5iglEVnpUz5fTpmSTJM5DxF2ZNVECcF8Ixp/a5R/vTeVo42UxsXgsTs75hOJyjr+Y+Ja58bv+EQ0KYBiBc+F+3Ti1S7FMxZXMf4bU0yWIkm5JVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhixIVsLmQvWZY3Gt8xIlbBisd2q2hwTKqBR6nrnekU=;
 b=R5pA3pTZN2QDiFXuDDpDDzvM1oqz+3snLg48W4xtn65dV/kLop8cuqgCXNLTkpTRim12HqTkVv88Y+aZtPAdH6RlRM5pd19DAIcNIMhZLJV7kwkzEMaHuIQG12DeukBmtPQRT+xeKlXBGEviXKMK+t7qzd+AdGkRyG5gtQKDvZo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY6PR01MB17410.jpnprd01.prod.outlook.com (2603:1096:405:35a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:18:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:18:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L
 SoC
Thread-Topic: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcq6tl0kg0H5FQ2EeOkUiXc+QUbbWeeNkAgAABc7A=
Date: Wed, 4 Mar 2026 15:18:37 +0000
Message-ID:
 <TY3PR01MB11346B3A18D2EDE88B8A45C1B867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
 <13d4fd79-784e-407a-9f2b-41cd9a86f232@kernel.org>
In-Reply-To: <13d4fd79-784e-407a-9f2b-41cd9a86f232@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY6PR01MB17410:EE_
x-ms-office365-filtering-correlation-id: eefa241e-5331-41f3-fc8d-08de7a014f38
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 mPkTy1pVCOFokXeuxosDhHCs6wkMDaktETN5Cv5Of6+ig2027+ul9TzWBYv9Y5rqd8DbYfevFXRY/1Pujl7gkX8ilj23hVqfX6m0MXQnk8M2TJoRBf9qeY698t6DnW6tvOgzCbrdPVvdyq7buVJo+2k82/odIG9+r88+vjhlvcBuYLeOIAMb72CIVY2VaEWuvH7ht8wIATUcQ5kPbVf+uyTp73wSs/4sSuYLBICLYS+Jc8HTawLlLCvVYkonOVl5pz2ofv2RAUg+ISaJ2kZBZTs/aJq7TA7JgbR/meJLk8D6PsKIqYjQ7v3Kkbm9N7KBdrvrULFa2aCb3epdbgDmxgx6yPCzbNjhOrAPLTOzAIOKokOQQ0hWcV4IbJqxoimtfTIi84sYtd21J5VdcA5q+qS13PhQFwUdPRbCt/mjCP4rEd74o/UkJPR0arydirz78x+jmt/wKVGEZPJ2bS3HrNbtBdjSrA/4y+o23/raGOWS90eVtpFnEIZ93kPJUu35ajQ9YNFFMZbuEGTQAfwA11wQ5YiDXWS+DGiYX60y5Ob3WHVMoJESa+pL5Uq4E3Yg5T9EASXqYaHlhIEX27noN8NVPSsRfDQNwkN/qcAE60SizPM4zuuGrT+G5x1IzDn4cqDPt/jicmgd9dorlheQIcBjToqGjYkWl5rKCCvV/2LVr/roGLHyeZqKOgbSkPkofPcjMylbPIXd+upXpF9mk84SRjquVtW5OGhK6DXKVxjpECBoxOUZZFb9k6LM0xV9yQ8dPK2bEqSOlsOWVtniUQqVkGdAa9E6CQlVTlDHQIY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akhVRmxONDgxQ0MydmZWNGxWMUlxRW1OazM3QWhXYkZBTDh2WlgzdXVNb2s5?=
 =?utf-8?B?dTFOQnNlb1lUdUMveHBsanNTN2dMaGxtcnNxQ1dqYU5Cc3ArYkFWTDl5N1k5?=
 =?utf-8?B?ME1lWmR2SVBxY085TUpNT2dXK3RBNEYyRE9XWWRqQ2hWRS85bFlCeVV5cUh6?=
 =?utf-8?B?bERFZ0JSaStUbDhuWkx2Q2ViS2oyR21QWmY2RnNJaWxyeEYvK3VxUmpSZlQ3?=
 =?utf-8?B?MGFzV2VUdzQvUFN2a3FPUlYyaXJMVGxWQ0hzNi9DTGJZWWtLcVlIRUJtUHJy?=
 =?utf-8?B?L0huV05UcnF2K29jTElxN1ZRaXAzOFd5SnFYMEdacUE4clREUWY1d0ZEejQw?=
 =?utf-8?B?ZTd1WDJGVVBGMnd2ME9vWHhDdEl0U0M3a3J4YUd6UXN1cnFRbkJaZ3pqRGVy?=
 =?utf-8?B?Y2RPa0lGdWUyaUYzWXdtSE5IYUR5WlVXS0d2c25CVFZwRWFPbndYcEtZODRK?=
 =?utf-8?B?amhTV282QjRNM0VHbzdIMjBsalpxQ3dqTlk1Vlc3S2NWTHQzdjloYUJSZ0hB?=
 =?utf-8?B?TW5pM0tjMTBXRkdvWm0yb01JLzlrQjM2WVNXb29DczJRY0VmTDhPb1FaVThF?=
 =?utf-8?B?a3FzY1B2NjZuUnE4cHpjUmhyenFpL056R1J4eDJKeDhyN0Y2S3NQalVTQ1o4?=
 =?utf-8?B?dTIwWjg4U2JUY1krU1N3NVFHdFBvZVQwRkVHSWJ5blF3SFhNTVhLSkRMZW9L?=
 =?utf-8?B?TkxmeG5MYjRFbjhLYVFpTTBvQVVYWGhTbXoxeStPWU5wazBWSkJ2U3hGSkp1?=
 =?utf-8?B?QWxZU2VNbmc4bUs3L0svRGpsdC8vaUFEWDA4TDNOMDZvQ2xBRy9tMm1ZUFBX?=
 =?utf-8?B?UDVSTndWM2pRVVREU0hHUTVmMCtNeFlrWGIrMndCVCtESGdQbVJaaU1vTWtN?=
 =?utf-8?B?YytKeEU1Qkd6eHV3TXdaUEo0dnJkQVRTUFdPZnByWE4rOHVkZFN2OUo1SmVa?=
 =?utf-8?B?b3plNno5VGo2U3BXOHBFTGxBL0xkUjNVcWVkZkF5NUdaTTRsZEkzUERCdjZj?=
 =?utf-8?B?Z1paZXJOTndYeDZONTE4bzFSR2JIdGtWMURjbTE4VkdxWVUzdkkvenZQQVIr?=
 =?utf-8?B?a1Jra1FQcDllVG1VR2ZTQ21MTUNpbndJZUg3MDZCa0I2K0d5R0pSWE9MNEhT?=
 =?utf-8?B?V2I0UFppTFlEK1BjTWZtbmEyQWxtT290NHhncWVHVWlteWR1akZWS1MraHRy?=
 =?utf-8?B?eHNNSnFqWUZHeDZlVmc1Y2NOOE9JdWc2Zi9XcVhPS09Ra3RCc0paRzFvYzlh?=
 =?utf-8?B?N3pIWjdSYzhSTmRwZTRUS3RiWUdsTGF5dVJ3Q1MwYnhQbktqd3FxOUR3dTYy?=
 =?utf-8?B?MERuV2ZLYlhBcm1ZUjVjUW9TbVBFbktHbE93dldNU0NRRGhoZnlqM3YxcVdL?=
 =?utf-8?B?d25OVG9zUzNFV1ZUUHhyYVFwWTkyQlBDMEgwRC96Zmx6eGo2dHRwL2lhYU5w?=
 =?utf-8?B?UEQ1UFR6WStVODNVd2VHa1VYTEhPMzRrdUd4QzAzV05JbmlVbnVlemU4dFZV?=
 =?utf-8?B?MGx3V0lOd29keWNwYlJ2YlBTQWVFaTl1Um1XT0VOQkR0eUgrUTZrZ2tQWmd5?=
 =?utf-8?B?TEV2bTJjN29nUXRHSUpjVGpNSzJLYUtlcGxPWW9kK2c0b0U4dnhmQ2V5emxH?=
 =?utf-8?B?NjVQaUppV0RTTUJwaFhmcFMvUHRzV0FibVkrWVpsS1RsSjlQR0FENDlFQnVx?=
 =?utf-8?B?bGtGZ3ZZU0VQQTFYQ0VlcU1zUG9JTit2Wm1idlZOZVY3UUlaVUg3Z2c2Nk5R?=
 =?utf-8?B?KzBhcUVpbElCTWI3L1pMUTZVTGRHK29MV1hnTzVTdkZzU3Z4NXkybDRIZDlC?=
 =?utf-8?B?QjhmSFpTQkt1SkdJQ0xRZGtzczZ0QTYycnlTa2ZzdUtsditYZ3RLU3dBTGhH?=
 =?utf-8?B?MVFCWTJrNzZBKzExYjdqa1l3RkorekJ5N2VzMUx3cjlKTmpvWHpyY0wwdnA2?=
 =?utf-8?B?YXZRM0pWMDFJSFBoblJ2dTNXYUpBVGpSamVJWnR0bDB5MXRqVS83cW4zNzhi?=
 =?utf-8?B?RDhKNUdmQzhQZEx0MWViTmZJeVNPZ2JLT0toTGVmejRHZjJ0TkkyNmNkdkRO?=
 =?utf-8?B?cDI1VUFxbnE3V1ZoR1g0VE9yRHBkZmFwRWhSSkwxd1FhZDhnbnJrRlhTMjFk?=
 =?utf-8?B?b2NFQjZTT1piTU5PRTlnMGFwdVdZSHg3Uy9XcHlqelRsVTc2aExEWGlFaUI3?=
 =?utf-8?B?M1Nnck5vOE51L2FESXpRMEtWZFRFUGJlV2NuVEZPdDZwRlh1cUlicjV5RWNq?=
 =?utf-8?B?TzA5OHBNSWw0OFVwTS82a0d1UUxYVENNaW1pSVY2OU8wU1FVUTl6K21lak9p?=
 =?utf-8?B?cmlibEhJd3VqN0N2N3VpNG8vK0MzQnJwaTdtWGZoZDRpTitTNFR1Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eefa241e-5331-41f3-fc8d-08de7a014f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 15:18:37.5636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWl4o/3ZI+ky3Gl86nduek4NMUMGCtTE5Yfvl/xYwl/YxKYyjdA5Yk0xUAZgWnK9y3bdHl4SN98lOjDppSl0lG7ubZJ2yPsyim2aWOnee5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17410
X-Rspamd-Queue-Id: 67179202989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-28780-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,renesas.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gU2VudDogMDQgTWFyY2ggMjAyNiAxNTowNA0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IHNwaTogcmVuZXNhcyxyenYyaC1yc3BpOiBEb2N1
bWVudCBSWi9HM0wgU29DDQo+IA0KPiBPbiAwNC8wMy8yMDI2IDA4OjQ5LCBCaWp1IHdyb3RlOg0K
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IERvY3VtZW50IFJTUEkgSVAgZm91bmQgb24gdGhlIFJaL0czTCBTb0MuIFRoZSBSU1BJIElQIGlz
IGNvbXBhdGlibGUNCj4gPiB3aXRoIHRoZSBSWi9WMkggUlNQSSBJUCwgYnV0IGhhcyAyIGNsb2Nr
cyBjb21wYXJlZCB0byAzIG9uIFJaL1YySC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRp
bmdzL3NwaS9yZW5lc2FzLHJ6djJoLXJzcGkueWFtbCAgICAgIHwgMjYgKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9yZW5l
c2FzLHJ6djJoLXJzcGkueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9yZW5lc2FzLHJ6djJoLXJzcGkueWFtbA0KPiA+IGluZGV4IGNmOGI3MzNiNzY2ZC4u
NTk5YzA2ZmYwOGU1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zcGkvcmVuZXNhcyxyenYyaC1yc3BpLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3JlbmVzYXMscnp2MmgtcnNwaS55YW1sDQo+ID4g
QEAgLTEzLDYgKzEzLDcgQEAgcHJvcGVydGllczoNCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+ICAg
ICAgb25lT2Y6DQo+ID4gICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxy
OWEwOGcwNDYtcnNwaSAjIFJaL0czTA0KPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA1
Ny1yc3BpICMgUlovVjJIKFApDQo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDlnMDc3LXJz
cGkgIyBSWi9UMkgNCj4gPiAgICAgICAgLSBpdGVtczoNCj4gPiBAQCAtODUsNiArODYsMzEgQEAg
cmVxdWlyZWQ6DQo+ID4NCj4gPiAgYWxsT2Y6DQo+ID4gICAgLSAkcmVmOiBzcGktY29udHJvbGxl
ci55YW1sIw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAg
ICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOGcwNDYtcnNwaQ0KPiA+
ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6
DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogMg0KPiA+ICsNCj4gPiArICAgICAgICBjbG9jay1u
YW1lczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBw
Y2xrDQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHRjbGsNCj4gPiArICAgICAgICBkbWFzOg0K
PiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAgICAgICAgZG1hLW5hbWVz
Og0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gDQo+IFNvIGV2ZW4gYWZ0ZXIgbXkgb2Jq
ZWN0aW9ucyBoZXJlOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOWQwOGRkZGEtNDAz
ZS00NThkLTk1ZTQtNGU3NjkxNWRmODVkQGtlcm5lbC5vcmcvDQo+IA0KPiB0aGlzIHdhcyBub3Qg
Zml4ZWQgYW5kIFJlbmVzYXMgZGlkIG5vdCBwcm92aWRlIGFjdHVhbCBjcm9zcy1wYXRjaCByZXZp
ZXcuDQoNClRoYXQgcGF0Y2ggaXMgbm90IGNvcnJlY3QuIFNlZSBiZWxvdy4NCg0KPiANCj4gVGhp
cyBpcyBzdGlsbCBwcm9iYWJseSB3cm9uZyBhcyBwb2ludGVkIG91dCBieSBvdGhlciBwYXRjaGVz
IGJ5IFJlbmVzYXMuDQo+IEFsc28sIHlvdSBjYW5ub3QgaGF2ZSBmbGV4aWJsZSBuYW1lcy4NCg0K
WW91IGNhbiBoYXZlICJyeCIsICJ0eCIgaW4gYW55IG9yZGVyIGFuZCB7cngsIHR4fSBzaG91bGQg
YmUgdW5pcXVlIGRtYSBzcGVjaWZpZXINCmFuZCAgaXQgc2hvdWxkIGhhdmUgYXQgbGVhc3QgMSB0
eCBhbmQgMSByeCBmb3IgbXVsdGlwbGUgRE1BQy4NCg0KRm9yIFJaL0czTCBTb0MsIG9ubHkgMSBE
TUEgYW5kIE5vdGhpbmcgcHJldmVudCB1cyB0byBzcGVjaWZ5IGl0IGFzIHsgcngsIHR4fSBvciB7
cngsIHR4fQ0KDQpCdXQgZm9yIFJaL0czRSBTb0MsIDUgRE1BQyBhbmQgd2UgdGVzdGVkIGFsbCB0
aGUgY29tYmluYXRpb25zDQoNCkRNQUMwe3J4fSBETUFDMHt0eH0NCkRNQUMwe3J4fSBETUFDMXt0
eH0NCkRNQUMxe3J4fSBETUFDMHt0eH0NCkRNQUMwe3J4fSBETUFDMnt0eH0NCkRNQUMye3J4fSBE
TUFDMHt0eH0NCkRNQUMwe3J4fSBETUFDM3t0eH0NCkRNQUMze3J4fSBETUFDMHt0eH0NCkRNQUMw
e3J4fSBETUFDNHt0eH0NCkRNQUM0e3J4fSBETUFDMHt0eH0NCkRNQUMxe3J4fSBETUFDMnt0eH0N
CkRNQUMye3J4fSBETUFDMXt0eH0NCkRNQUMxe3J4fSBETUFDM3t0eH0NCkRNQUMze3J4fSBETUFD
MXt0eH0NCkRNQUMxe3J4fSBETUFDNHt0eH0NCkRNQUM0e3J4fSBETUFDMXt0eH0NCkRNQUMye3J4
fSBETUFDM3t0eH0NCkRNQUMze3J4fSBETUFDMnt0eH0NCkRNQUMye3J4fSBETUFDNHt0eH0gDQpE
TUFDNHtyeH0gRE1BQzJ7dHh9IA0KRE1BQzN7cnh9IERNQUM0e3R4fQ0KRE1BQzR7cnh9IERNQUMz
e3R4fQ0KDQp7IHJ4LCB0eCwgcnh9IA0KeyByeCwgdHgsIHJ4LCByeH0NCnsgcngsIHJ4LCByeCwg
cngsIHR4fQ0KDQphbnkgY29tYmluYXRpb25zIGlzIHZhbGlkIHdpdGggYXRsZWFzdCAxIHR4IGFu
ZCAxIHJ4Lg0KDQoNCkFyZSB3ZSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/IFBsZWFzZSBsZXQgdXMg
a25vdy4NCg0KDQpDaGVlcnMsDQpCaWp1DQo=

