Return-Path: <linux-renesas-soc+bounces-28784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKwzI9BeqGmZtgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:33:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903EF204563
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96F1A32B92ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 15:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2729434AB19;
	Wed,  4 Mar 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dEn7a2Ts"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DC34D38D;
	Wed,  4 Mar 2026 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639528; cv=fail; b=lJeLMi6yicjncGFyVcUEpj+PCrDGFGIzm/aQ41u9Gq5k2OVJF3YcbqMMTrgEiiij1c0Z5E0WgKP4hbC7axnYcWhWUNiJMEJL/Hy+U6sSb21gK9jYqQ3qoL5D1C1nqSW8y9JgKhLXDu01NLhmprV1zPTiT58Y0j78aj+mwKnipfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639528; c=relaxed/simple;
	bh=GJqxFuZHemFEOA7b1+gYF2CxPdLDq5O0+VTBkAE7GJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=slxkh069QBRRK66mw9OjZkKREmNU0ChYngDafHqxRFi7SKerWaMgu+hhBt5wrkh0m8lGGMMin9Y5wa3UHxKtK/Vv59/NaIIcxzZAB9xjwI7eUEvkW48XLrgt1r0HHMDOWRpK7KEP8P+AKKCjWNKUgmxcOvcPkfjfh3uHT8jwTgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dEn7a2Ts; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbm/NwGMF5i3qTaZlwaah05hCWZr3q+5xLKt/t2jPx8Y9NWGsJL7JJxJUTpNKUXsZk/60FjFA8dzKmBuYjpW/Y0s5u0ckOWGe9RH0g4b0fxQVfvbSf1sG+QBBEz9YeC2mTPuIbWJcpxz9iXbLr3ZRhXNeMIZSVidPot9uvncrS72X7VF8xAXuJng3IaznE1StfdhzY+uDcqI3Gbm6JiDpYY9zOUBmjhRF0jTufnRPevYbleLpt4SZdTE7u7M81C8vC7lDvpGSg9Hnm9YuvyUQP5WltOEj3uKikQ37sWCV2UOYx7jjXlLLwn33yb998xmyAEWDngHOOFlFpPdWw4Udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJqxFuZHemFEOA7b1+gYF2CxPdLDq5O0+VTBkAE7GJo=;
 b=r7ZSlYebK05i9ppsmr54kPKMqkPY0lnFVjog1N2g/QhiSrix+kqGM7mfmWPPQo65XQN44U0UiFPxW5A1l4ss5XQxi0ct1472BpVm5HjsablIBCanyuoF1axWN3sMCma8TNRx91ShCd/YSfR2eRMX3jfc0DysARqF79QM27KDQmrQS60a9hxl83p7n/s6HO43o/mCLKKSeF4E2kNejgVnE/6QhNQvseNaDDGfbtFcYqqpGFhdkkABh5Zz91bmV/smp0Z4WvLiC62c47RBKVNIyJa+A/EUjgLYRFxJn9676WdPNBU1VfJ31A4K77Mpl1kWOKCiVC8apXVenNrKLG4omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJqxFuZHemFEOA7b1+gYF2CxPdLDq5O0+VTBkAE7GJo=;
 b=dEn7a2Tsz+0E25UN4LxHN+pebL/SwD0XXBl6KNzIDiwtV04i5B49/AJ2PRDSQ3g5+9AMOF656NorZ4WjNTTmdT84ObBYAET/sewCRAM4Uw8i9LYeEwTohLqpUIbHGBzthLwR9TNk47sIzA6H8TJ2cafIHNdSblEBOdNC5gRubPs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14250.jpnprd01.prod.outlook.com (2603:1096:405:205::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:52:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:52:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E
 SoC support
Thread-Topic: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document
 RZ/G3E SoC support
Thread-Index: AQHcoCny8bPbTNY9+kOEdB2P1VOs27WIFi6AgBZ6MoCAAAdtAIAAAjSAgAAAqLA=
Date: Wed, 4 Mar 2026 15:52:01 +0000
Message-ID:
 <TY3PR01MB113467498CF0830EE5DC5872B867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <20260218-qualified-octopus-of-luck-5fcbf1@quoll>
 <3cec7787-0787-4b97-8eb6-5fe28f4c2a14@kernel.org>
 <TY3PR01MB113466BB56D07926CD00A8EC4867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <39db1990-5004-4bba-8e2b-3b5e066fccdb@kernel.org>
In-Reply-To: <39db1990-5004-4bba-8e2b-3b5e066fccdb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14250:EE_
x-ms-office365-filtering-correlation-id: 1f5161b3-4b63-4f8f-5320-08de7a05f9ec
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 YftQ685M7PjOv3wsWldxsWAHlOGXfcteFCRtYj454j8rXVrWxn2zrxVFhJTi4EUsu7cPPcVjrqBAYpezSRggxre4yjqioizwdBdfO1YgIYI3hXLk/SJVd+qPrBYk/u32Oi8liTj926zyAoNFSKxvFnOeqiS754ZZigo6j2RCN78/LW9WA9YlXfnPbzJg8H7lK/XLyEVRF0p8WlCPe+u68HmKXFykEVBRbx3rucRf3ZtXcsS4eHR2XP0g0Iv60GvSk1MIs3WNWKn+sYvSzHm9rwDjjo2yvFi4fGIuDqdgHPMRDTAhO0ERHXPeRbgLs4/nH18m2Q07eyfJo/dmTYkx8CLnixl733bUWddnyCeExCrxNKkfvUE6zIvo7uHxHgD1G3MLjSdfvuNo8bI8VcANzZ3Ml5DAKUEscAZ7M7qYGMp4s05crr4JbSgQJNeexpncaEu4xrCF+RkOQjq0IX0iKtk1gOZoZNtGfYw6zxhPjubirez7R+2V9/X/NPRj6Xm+tFtGjc6hDwjpbSIro/gPxvyJ14E6sxD7Bsdn1/U7dL0eRgp9RK30YxQxSgVz+MjIpdaBkQ9IwYCKpsiECqQe4SdnqjF9FsV550pTsbcaZBMW8xqD2baXzZeBZiV6tHK9ItO33RsMW0EgiTZufQYDwNCWrYhEia/8e8CjyPk4Ji5knXnmzGq3M+yEa8hX+hCzkIqmL/3D0+A0hT9FMVaADmXH3psvG0FMlJhelZjdXDFO+aEOYx9Ph98zAdvaLHlL4ChG8Drn631kO+Py//ZMCwBLB58eIvVyUXeGVWz1l64=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjBXSUkvMWNsaTZUOWhRV1FOVHJ2dXlPNCtaY1ZjdkhsZklacWlDT2dhQ29r?=
 =?utf-8?B?bTRXT3M5dWIvNDZPN2tJUHlJNENiTU9BdTR4VmRZbVBXT203QVA4ZVRDVjV6?=
 =?utf-8?B?SEluZGtZTDgvZlFXckpIaWQrUmhsckVUSmZwMGZVbmxwd3F5T1FvRmZ6aGhi?=
 =?utf-8?B?S3JhVWhJeTRrR0ZvVVlOTk8zK3RVVEpydzNGRmw3L0NKdm1sVXhIcTRWQVpI?=
 =?utf-8?B?aGNuUG5wcW5pVURUMHk3bk14U3JJemF6S0ZyaFNJQWhOam5NZGFpNU5FUGxy?=
 =?utf-8?B?MWN3ZUQzVmtlNGNvMDUyd0dnVlpCZ1diRWEyQ3ZQMHBBUXVIYThKRDB4MmJl?=
 =?utf-8?B?cWJjdnJCM2VBT0tDekwwMDU1ZzFNMnY4S0ZPcjBETzlwMmM1S2xRN2dzU1Vr?=
 =?utf-8?B?bVdEMytianFQZXdBd1N5MmpHdGRocC9zWDVuNnNBS1ZyL2R5OVlhNnZUdklI?=
 =?utf-8?B?c2FYWXk3c1ZCT3VFK3dZdXZpV0lFUjNYVzRnSWhTd2JiMFMwMjFueURybk1E?=
 =?utf-8?B?V21PL1VyeDJuWEwzYmZuMDdwMDNGZFVkV2Z4cDJJRE5KQXFFTTBsangxc3h4?=
 =?utf-8?B?WmtnZEJsRDRFR2wwVTBFeUxKeWRwWmpPeFRuRENMVGhhYlgrQU9rYVZOTWhi?=
 =?utf-8?B?WkxGbERpdEtjOEV4eG00UjA1MDRLQkRDS2o0a1E5N0pWVUwyK0pHSUtMZm10?=
 =?utf-8?B?cWN2Zzd5RVlCazVTcWJaTDJQc09SSFlUNjRVaFZtbFNxbS82OStiWk05K2lB?=
 =?utf-8?B?d2ZCbnpJSG1UTndMYjlEaEpoNXhQd0d3VG1hSFg3NE5SVGlKeERmNVNQT0VI?=
 =?utf-8?B?U2piYXAwd3lqVGpmMU9tMjRLNUp3dklRRmhVYWhJaklFbGVUY01VOWN3aDU2?=
 =?utf-8?B?OWsrcnlId3Y3bEdlSE9Db1Y5bTRzby8wNXhtcGNBZzBJZHFZYkxOQVEzTDNU?=
 =?utf-8?B?ZkhmN1RJLzJpZjRIVkJXSWpMemNwQVVqS3ovTUhqaHdjWS9hZ215bFcyVkFW?=
 =?utf-8?B?MnJvZG1rVmdZQlVoYjg0N3YxTkoyalRGTTdDZnFZZUNqbmZ6MXRYeWF2Mi9U?=
 =?utf-8?B?VFQ1MnV4VXNXL1pHTHRGcVRma0VRYm53aUFqNmVOYTVxY1E3MWpxZGV4dHR6?=
 =?utf-8?B?N0tIamd2eFJjK3EwQy91bTl5Vmk0U1N6N3l0bUhDMjhwVnNEL2dCdUxXYzN0?=
 =?utf-8?B?VnJUY3JiN3IrZkRvRjBXSk53dEpXSGdUN2VSb1VtbHlqWDZzV3RCOGsrNmZM?=
 =?utf-8?B?N2h4QmpLOFZFUmtCTnprTERqU0tVVExwd01BbW5CNHhHdUhHSDNaQnVZNmJI?=
 =?utf-8?B?T0pzUDRtSlVlZXZkckhPd2RxOHVBVXFyQ2haaE1mdXhJYUUwNWJQaSsxZGRk?=
 =?utf-8?B?MWV5TEVhejRmeVJPclVkMjNnZFVMamFoSjJYME9YeWdjTkNLTDlSdFlxT3Vm?=
 =?utf-8?B?cGVKN3ZNaDkrVGZKVjNvTE9zRFh3TjZLdzc3NnV5cTI0UytxK3N5RGR3czFP?=
 =?utf-8?B?R2JmU25oZzFBTEtYRmFXdzRUUzljMkcxSXJzc3dwTlQ4NE9oa01tVE4zdW9X?=
 =?utf-8?B?dGJCdzhkK2h2REpLNTdsQjNBV3MzbHZ2ZDRaLzdRb2wwQmZ4c01Vb3hrVlJT?=
 =?utf-8?B?ZGNGUVRUOEpIMTIwNjBab1FlUktrQTR5RzBFeTV5SzJRWDVYR0FiMTB5Z3pU?=
 =?utf-8?B?Y2dNa0pKOVJabmFITkhVTzZxYk4vM1BJbGhmaVRvMEpXbkpNYi9tV2IvSmh2?=
 =?utf-8?B?eHZEODJmOFpqdjJ5SlVJenVPRlN2WjFhRFhWbjBWendocHluYWRmSnI0MkNZ?=
 =?utf-8?B?Q01sb0VGbVdCb1lmdGpLYUZRVmd3Z1BVTGZNL1JBSGdDdWl1T3puYjBuWUV2?=
 =?utf-8?B?a0JOZ2xlSVdqZDQ0a0xTWWtuSURGakYzS0dqTWlVQmdFNXZrSStQdTJ2d2Vt?=
 =?utf-8?B?ZXV5UjAveHVtNEhxbVlRTHlSRFM2YjBBMWJLV0xRakwycmpMR1FVbFEwRHhx?=
 =?utf-8?B?VVplNFpWNDdEMTFLd0tMTCtXUjY3OWVMS1FXdnc1alBJOW1EU3hNbzJ1MVdh?=
 =?utf-8?B?dExLU0VybW1jam5HM0pqNE92M3pOY0REUWxVNVMzYmhSbGJPdDE1ZGoyekgw?=
 =?utf-8?B?YndhV1ZOU1EwZEx1alhQT3hMZFEybTdkUGJsTHVUNTBsZENNUnJsY1dLUmVz?=
 =?utf-8?B?TkFMTjRYNEtpaldiYkVFRkZtN0RRMmJBNFlpN0tSSFEwaEYvU3V1WUJBa0pV?=
 =?utf-8?B?V2VUYnVSQVpuVTh4RmE1OC9oSUZGWVVkZjF2eGhMK2JUZFhVYUwwVUJzaWZQ?=
 =?utf-8?B?SkZ1U1hiOUpuZmMvSlNlazRlYXZBcytxSDRVZXBuWTJWb1B4SDQ2Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5161b3-4b63-4f8f-5320-08de7a05f9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 15:52:01.9481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBcPn/dRkYhjQGeeOUtrIwmB4kCMUwsY2d9eZjYv/IWVZoAb6zHow5fj500/dV4uZkONQP/a5GwuYIpm0wfvYsVQfqZHUivYZnv2wA6yhVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14250
X-Rspamd-Queue-Id: 903EF204563
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28784-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,renesas.com,kernel.org,glider.be,baylibre.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA0
IE1hcmNoIDIwMjYgMTU6NDANCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIHNwaTogZHQtYmlu
ZGluZ3M6IHJlbmVzYXMscnp2MmgtcnNwaTogRG9jdW1lbnQgUlovRzNFIFNvQyBzdXBwb3J0DQo+
IA0KPiBPbiAwNC8wMy8yMDI2IDE2OjM0LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0
b2YgS296bG93c2tpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDog
MDQgTWFyY2ggMjAyNiAxNTowNg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gc3BpOiBk
dC1iaW5kaW5nczogcmVuZXNhcyxyenYyaC1yc3BpOg0KPiA+PiBEb2N1bWVudCBSWi9HM0UgU29D
IHN1cHBvcnQNCj4gPj4NCj4gPj4gT24gMTgvMDIvMjAyNiAwODo1MCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDA1OjIzOjQ3UE0gKzAx
MDAsIFRvbW1hc28gTWVyY2lhaSB3cm90ZToNCj4gPj4+PiBEb2N1bWVudCB0aGUgUlNQSSBjb250
cm9sbGVyIG9uIHRoZSBSZW5lc2FzIFJaL0czRSBTb0MuIFRoZSBibG9jaw0KPiA+Pj4+IGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgUlNQSSBpbXBsZW1lbnRhdGlvbiBmb3VuZCBvbiB0aGUgUlovVjJI
KFApIGZhbWlseS4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFRvbW1hc28gTWVyY2lh
aSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+
ICAtIFRoaXMgcGF0Y2ggZGVwZW5kIHVwIG9uIFswXQ0KPiA+Pj4+ICAtIFswXQ0KPiA+Pj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDEyODIxNTEzMi4xMzUzMzgxLTItY29zbWlu
LWdhYnJpZWwNCj4gPj4+PiAudA0KPiA+Pj4+IGFuaXNsYXYueGFAcmVuZXNhcy5jb20vDQo+ID4+
Pg0KPiA+Pj4gSSBhbSBub3QgZXZlbiBsb29raW5nIHRoZXJlLCBzdGFydCByZXZpZXdpbmcgZWFj
aCBvdGhlciBwYXRjaGVzLCBzbw0KPiA+Pj4geW91IHdvbid0IGJlIHNlbmRpbmcgRklYRVMgaW5z
dGVhZCBvZiByZXZpZXdzLg0KPiA+Pg0KPiA+PiBZb3Uga2luZCBvZiBpZ25vcmVkIHRoZSBwcm9i
bGVtIGFuZCB0aGUgb3RoZXIgcGF0Y2ggZ290IG1lcmdlZC4NCj4gPg0KPiA+IFdlIHByZXBhcmVk
IGEgcGF0Y2ggdXBkYXRpbmcgdGhlIGRlc2NyaXB0aW9uIGFuZCBpdCBpcyB1bmRlciBpbnRlcm5h
bCByZXZpZXc6DQo+IA0KPiBUaGF0J3Mgbm90IHRoZSBwb2ludC4gVGhlIHBvaW50IHdhcyB0aGF0
IHlvdSBnaXZlIFBVQkxJQyByZXZpZXcgdGhhdCBtZW50aW9uZWQgcGF0Y2ggaXMgaW5jb21wbGV0
ZSBhbmQNCj4gbXVzdCBiZSBjaGFuZ2VkLg0KPiANCj4gTm90IHByZXBhcmUgYSBmb2xsb3ctdXAg
cGF0Y2guIFRoYXQncyBleGFjdGx5IG15IGNvbXBsYWluIEkgcmFpc2VkLCBzbyB5b3Ugc29sdmVk
IG5vdGhpbmcuDQoNCldlIHdlcmUgc3VwcG9zZWQgdG8gc2VuZCBhIHYyIHdpdGggZGVzY3JpcHRp
b24gYWZ0ZXIgeW91ciByZXZpZXcsIGJ5IHRoZSB0aW1lIHRoZSBvdGhlciBwYXRjaCBnb3QgbWVy
Z2VkLg0KDQpOb3cgd2UgcHJlcGFyZWQgYW4gaW5jcmVtZW50YWwgcGF0Y2gganVzdCBmb3IgdXBk
YXRpbmcgdGhlIGRlc2NyaXB0aW9uIGFuZCBpdCBpcyB1bmRlciBpbnRlcm5hbCByZXZpZXcuDQoN
Cj4gDQo+ID4NCj4gPiBUaGlzIHdpbGwgY292ZXIgYW55IGNvbWJpbmF0aW9ucy4NCj4gPg0KPiA+
ICAgZGVzY3JpcHRpb246DQo+ID4gICAgICAgTXVzdCBjb250YWluIHVuaXF1ZSByZWZlcmVuY2Vz
IHRvIERNQSBzcGVjaWZpZXJzLCB3aXRoIGF0IGxlYXN0IG9uZQ0KPiA+ICAgICAgIGZvciB0cmFu
c21pc3Npb24gYW5kIG9uZSBmb3IgcmVjZXB0aW9uLiBFYWNoIGNhdGVnb3J5IG1heSBpbmNsdWRl
DQo+ID4gICAgICAgbXVsdGlwbGUgZW50cmllcywgY29uc3RyYWluZWQgb25seSBieSB0aGUgdG90
YWwgbnVtYmVyIG9mIERNQUNzDQo+ID4gICAgICAgYXZhaWxhYmxlIG9uIHRoZSBTb0MuDQo+IA0K
PiBOby4gU29sdmVzIG5vdGhpbmcuIFJlbmVzYXMgZm9sa3Mgd2VyZSBzdXBwb3NlZCB0byByZXZp
ZXcgcGF0Y2hlcyBpbnN0ZWFkIG9mIGxldHRpbmcgcG9vciBjb2RlIGJlDQo+IG1lcmdlZCB0byBU
SEVOIGRldmVsb3AgZml4ZXMuDQoNCldoeSB5b3UgdGhpbmsgdGhpcyBkZXNjcmlwdGlvbiB3b24n
dCBmaXggdGhlIGlzc3VlIHdpdGggbXVsdGlwbGUgRE1BQ1M/DQoNCkl0IHdpbGwgY292ZXIgYWxs
IHRoZSBpbnZhbGlkIGNhc2VzIGZvciBlZzogTnVtIERNQUNzID0gNQ0KDQp7cnh9IC0tPiBDb3Zl
cmVkIGJ5IERNQSBzcGVjaWZpZXJzIHdpdGggYXQgbGVhc3Qgb25lIGZvciB0cmFuc21pc3Npb24g
YW5kIG9uZSBmb3IgcmVjZXB0aW9uLg0Ke3R4fQ0Ke3J4LCByeCwgcngsIHJ4LCByeCwgcnggfSAt
LT4gQ292ZXJlZCBieSB0aGUgdG90YWwgbnVtYmVyIG9mIERNQUNzIGF2YWlsYWJsZSBvbiB0aGUg
U29DLg0Ke3R4LCB0eCwgdHgsIHR4LCB0eCwgdHggfQ0KLi4uLg0KLi4uLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCg0K

