Return-Path: <linux-renesas-soc+bounces-33662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NdyyCDSuJmphbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:57:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B6655E79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=e4CohtsN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FA5B30005BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BD7371D01;
	Mon,  8 Jun 2026 11:57:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD536D50D;
	Mon,  8 Jun 2026 11:57:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919853; cv=fail; b=YcSUS0MwlEcpqVGfOe7ZpxahwLDvOlyr9RtnvCIWyx8LUUPoT0VjqGRB2PzKd2YtD2I8fjg0Stt7SG9PtGplRjMaIrQqmcrFRanWrMqeaRn95vTu2Qv6EPLYdOmMjGah6FQoI0egNCcsUxckTATv9NtKDm3UpMvbLF7uPTo5/xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919853; c=relaxed/simple;
	bh=pJQowsJ9WeJSqJJuQ/SjFMrr4209+CnHDHRobG+r7ok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mIryPkNaSzHv+UFWyay0tz/X8pwXHt2rpommezhxQUuP1gkImUTVetcVMBUdx/mluGNzYUob7pKp4/LbsfxWSVF7USEvgdvgyQxZQGoKxPl4GiFTrJIcErv2wR809I4xPjpO9LDN8kr3bdcP0u+qSoKDcjGwqA0hKl3IG3H6gZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e4CohtsN; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwweuxxqohVNkJJKPiTOYrBOyrp53U8SW9ZCdhSeiNfq5zr30SXeUbAWjHYPvUDheteOkMmL+VPvrzQUCWSTm9VN9ZhbvBUNbDo8n8RIygZWJOgDfMeVtrGdbqAXX33T6+iM32jXNiMWjP/jgfaNW2pUmznHRUMVVOPW8OpHMeuPb9HxqbBLgD8LLlEnay6bY8M18pkDkN2NWdHDcgnfrddZtIKqHDP3CrUjrrMD81tPtxF53Q5oiojHCBkrnNHpCGg2YsEjwq2nTEXa8nDF9wsKh9e9H2xTC1kd6r/YmVakeQfTb/EsRJBJ2RSRm0eaogz84jv5S4vg5AEezWD0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJQowsJ9WeJSqJJuQ/SjFMrr4209+CnHDHRobG+r7ok=;
 b=x7m2OuVsVlNIHxvcAUQo0RYPR426uLZ5++XZEUoQCxxMnCAbIypIzUlzIVx/iwdxOh8drnCj5v86qX76VfuByhLfL+nUC3nvcQfbBJDX4YLsYmzWhFQHU3MToFwjzSjNVPjzt306U52hoV+LXFqC1dckhnC+klRnqPFmeVtOoWIuqasf9H2v4pR7p8aKlzC7Mdrk/E1/JOSSkUGufoy96P6x06Ne9BT2Px190+Do8iACvcK3EtwfYgB4dyo8NGOqLbsfMSy/RFCNKRn+L8gzYtXT/z0E09g68dVa7Sx/gYa/5ZenIkE4AVXeH8QYLUm1CQ+nmJ4leahttoZjkLi73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJQowsJ9WeJSqJJuQ/SjFMrr4209+CnHDHRobG+r7ok=;
 b=e4CohtsNCjqLH5NiQMF9l6o1jXAOZjFnDgGfPtM4oALeiESVWDIDyjXQT0mdz68hPZ4juPKoG2LgxDcjjZLnG6MEsDSLSjsQk1M8SJJgAstmgAnrBGaGrmUpCh5ZILvBJLvSLvj6Cqwp6EW+14+p15VFs+oJfACO7u02mtePHJ8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12528.jpnprd01.prod.outlook.com (2603:1096:405:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:57:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:57:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Index:
 AQHc8pGh26og7GjtHkeCuhYLGQ8HXrY0e8eAgAAAPoCAAABXAIAADYMAgAACtXCAAAczgIAAAFYQgAACCACAAABHQA==
Date: Mon, 8 Jun 2026 11:57:28 +0000
Message-ID:
 <TY3PR01MB1134654BC11EE374961D8A461861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
 <20260608-alluring-remarkable-echidna-d107ea@quoll>
 <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
 <TY3PR01MB1134665BE4CE8FB734BCFAAAF861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5e8719f-6d85-4edf-a645-5be9be7ec980@kernel.org>
 <TY3PR01MB113469E3AB101C3552E721E11861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6960d660-2851-44e3-af89-b334ab6cecc0@kernel.org>
 <TY3PR01MB11346C66B7BD36CB89D19009F861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <71bf9e6a-40c2-4ad3-9156-caa74a3dbaf7@kernel.org>
In-Reply-To: <71bf9e6a-40c2-4ad3-9156-caa74a3dbaf7@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12528:EE_
x-ms-office365-filtering-correlation-id: 5ca23680-3fed-4c04-5830-08dec5551d7a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|11063799006|4143699003|3023799007|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 n7COCDjGXvpFai0qaGUblxY89Xm6HXBPATQg+cK9oIv8chJhKqCVSsxYqa4oXC37R8XA6C0zi+wAzRV9HU4XsE5FhArdAd9TNt189TpK7emb3wz5oQ4sVtjXaha938nBbO9Bz1mfTYSKoIUzPX30M0Ruz0PoAWRmWIrEiYDwRJWmMkfqPHZLzmyvLh9brKhsoeW1zhEih0/fy442rX7NGLuBt3vz9IjNuo8Pu2TbxtuVZwZ6mhkfVYn0+PyDjUJhljIe1WEIJpVp36r4+z1SO/cXek3yd0Rf6tA24K0bvBmkF76gCjyY39VOqxdySizOEoWS1evMriUA/x3/nyeasnY51VbOl3gjdcsb6uTyHGqCaVQOyhQ0e9/St5ncbg+Vt5n5AXHM8M7uHz16iqQXa1QCNmJ2antIi+8KShTksse4AxlBC7N3bZysdD41h3oJkxVZ4OmXAgkEazN95bOBbb4QqiLKv8ZbjN28YIWv9rXLeRfLiryG/4lUlESjAH0a9OpAHomqHmKwBRP3JLROHNk5nQ1o4nnGogIT5mF4W9ilmn7t7E+NiZnOqmIq6Oi+AMR3mTN8nVVyQPW/B+NifXu40pUAGqKeEeLnlE4Y1Zk4F8NWXVqFxTzywB01ULU65mQr21u+ZUIgJA59WAq4MUGigwk42BKOwilC/yo8IbaV0LML72eQsIw3psTxdNQGBDMpdVRRlaPAKEdamtD3EdtDbStkTjwn7OR00ydvcA7/ggLSs0HLLOro8LShUBrO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVNsWUVVYkk3M0d4TERoUXlFL3F4NE15MlJBZDFDS2NGQVo1UFNoeFNBZ2Vs?=
 =?utf-8?B?Z0UwcVU3MHFtNXF1eElsTEFWcE82K3NxQjFKUmVDL0FKNDBBKytFN3lmdElI?=
 =?utf-8?B?aUdza1FUU0M0RkZhUUVmTkFadDJnMmRkZCt4RG9VRDhYRmlwMWxteGtzMHN5?=
 =?utf-8?B?RU9LcEsveTBwaHMyMFhQWUFscHYzVWpsckNlbWxSRldnc2ptVGduUVpPeU15?=
 =?utf-8?B?YytJY29LaE9YSy8xazdrOHl5YmsxNDhLZXB6YUVtMW5uRVVGeE5VZCtGVG9N?=
 =?utf-8?B?bzlkcXR3NDlPYlluaEJEQ2NUR3YxM3A0Ly9qenFwc0RBbHJwRFFlakltcHdS?=
 =?utf-8?B?aDhMUjJUSFpQL0pTeDFuZk5PeXVuUXUxUkxkRStJZmVVQ3FXUHdYREdMVGJP?=
 =?utf-8?B?T3gyK2Q3aFNPUzFIVEdWVmk4SXV3ZndraWFkTjB4MEQ2V2pDOHh4bENGd1BR?=
 =?utf-8?B?amtmSy9hV2l5STBGT2tJb3ZqdU45L1RDMkRRZ00yQzFsbUxKdUU2MDhmYXZS?=
 =?utf-8?B?SnZWdEpPMVIxVThvSFV3L3BqTDVkZ25ZbG9QcnRpMlRDMUcwQ2lVUnNDcFZY?=
 =?utf-8?B?VW5TczQrTFBkaXJ3TGIwVlIxTHJIa2dURVhrSyt5dm9yRnZNdFpReW04Lzli?=
 =?utf-8?B?amtONVpZY3libWdod1o5eW02LzAxaG93Z2hVc1VlWC9pN2h1alRZaFJRamJ0?=
 =?utf-8?B?RDh6MGxHRTRmMnJ0MVgweThLamI2WHJkQlI2SStFUElMVldRSmlrTTRVaTdX?=
 =?utf-8?B?Uis5SElSZmJYT2Z5YklRRnZhVEtPQXdCYkhxRS92S1hhZUxDdS91MGEvVlRx?=
 =?utf-8?B?Y1A0WGpaZXF1OXlIbVFYaDRLVXVZeFpINVVKWGc0a0NDNVdmT2FIOGZsMmZn?=
 =?utf-8?B?RVpUd1FtRVFDUnQ2Nk9EYmxPTnQvQ0tNY3NnK3M5YzBjdXcvRnhrdXIwZDl1?=
 =?utf-8?B?N0orQ1pGMHFUSlVHNXozN216anl3Y0xiUXJnUFM4UFh4SXdlUzQzbkswR2gx?=
 =?utf-8?B?TW9Ocnh3K0h0cFZrd0Y5NlhhL3hLcUR4eDV1eEszREJ1a0pmM3Mxa29GZkpJ?=
 =?utf-8?B?U1YrSzUzaERWcm9xRzdhSXZ1TG83MUNuTEVTV2J4c0l5K1NmeitKNDJUdS9t?=
 =?utf-8?B?YUpxaUI5eThOWHFQUlorMmVtU3RybVc4aGgzSW1HVTR3Q3VlM1EvMW9SMjB5?=
 =?utf-8?B?clJWNUdzZ1lMS08rVjNHdmJrVVVrQVdnM2dGdndYdTVqMVdQaFF0MHpWUHJY?=
 =?utf-8?B?emZDRm5aR0x6aGxRK2pPYlNJdWJZNlNod3g1ajJxU3VlQkdGYUVXWWExTEpV?=
 =?utf-8?B?UHpLenBCMFJYcWNnMng1QVJpNlZWZ3NRMXZhcURFYmhvT3hsa3RDMThaRXhv?=
 =?utf-8?B?eWxway9yUXBreER4MlVXV2l1SUpKUkN2SlNCWlNsdmhOaGxVQUJKN3h1TG5W?=
 =?utf-8?B?L2o3NkJPTjd5MlhQU1IzNTB2aFRVbnZDZkxQVEliUEhJMlBKOXNZeHR0YU0z?=
 =?utf-8?B?U2thbXJtMVBkelZaMFB5VkFUcE1iMVh6R08yKzFVT3dVaVhnMzlOb1NiUzV5?=
 =?utf-8?B?VXBqckF4U0dLM3FIVFNTQzVyZjMxSnpic25ocnQwUHkxMklSci93Z08vd0lk?=
 =?utf-8?B?NzhHR2xpc2Q2ZEN3OEF4WHp6amsyYkpMU3BtY211OVZpM05CTTJMbDgwUkg5?=
 =?utf-8?B?UHFTMmp4cHR2YmhjMHBnajJ4eVZhcUdtQllBWlI0MzFVR3BvUU5wa0RxL0Fl?=
 =?utf-8?B?clZvdTlhVE1JMEpkejlDUVBxbHl3TVlFYkJ1SWtINmVnUEp5ekViU3Y5THYx?=
 =?utf-8?B?RitvdWxJeHNZWFhXZVd3TkNnZGplRThTWHpsU2t1UUEyWm1DclhVeXh6bkds?=
 =?utf-8?B?ek05YWxqTmZlM2ZKL3F2dzk5a1FjNWMxVndmVVRjQk51ODlMS2VmSlB1dWZW?=
 =?utf-8?B?a0tTeFNhd0Job0JkVXJyeUZnZWJYclZyRStEaTd2bTZ0bzJRV3pxZ01UQndn?=
 =?utf-8?B?T1pBeFBnYkhjenYvQUYxV3p4dDU2ZUJYak8wRnpnNzAzK2VLNDBNNHpQUkhL?=
 =?utf-8?B?UWJPTVZkZDJacHExMDJYcDUvWUM3ZG1BZ0ZUVERDYkFpc3phSE9EWW9uME42?=
 =?utf-8?B?bDNoR3BMQy9ld0dFek9hNmR6T1dydUdBVnN3bHVyaDFINy81VXE2VGQ3Q25n?=
 =?utf-8?B?QklBTFZweWxRcmFZTDdFSXIzNXBrNFlGQ2xOL0phdWR6eC9wMW5iRUxpQ0hC?=
 =?utf-8?B?QUJkb2luTVgrdFNXbTc3c2FRZGR6eFpRMDBUZGNGaEJBcW92TWZLM0FxcUlk?=
 =?utf-8?B?ZVBrNW9iUGxEendBREx2RmpPYXFaa1ZnMWlZZTR3WXpVcGpZaHhLdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca23680-3fed-4c04-5830-08dec5551d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 11:57:29.0094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1aTKDAAP3PqlF9geEvfKMVMfbzMA5ALA4Z5tA3Py2DesaDrW3uDAP9hr8srNDmZgnWJntPRzLMRqZvVGjpbUmTOYjRMQt4SgZjFYTTgiKSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12528
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33662-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,nesas.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 185B6655E79

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxMjo1NQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IE1ha2UgcmFuZ2VzIHJlcXVpcmVkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRz
LWNtbg0KPiANCj4gT24gMDgvMDYvMjAyNiAxMzo1MSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkg
S3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+
IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMjo0Nw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1i
aW5kaW5nczogbWZkOiBzeXNjb246IE1ha2UgcmFuZ2VzIHJlcXVpcmVkDQo+ID4+IGZvciByZW5l
c2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pg0KPiA+PiBPbiAwOC8wNi8yMDI2IDEzOjIyLCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4+Pg0KPiA+
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+Pj4+IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMjox
MQ0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2Nvbjog
TWFrZSByYW5nZXMgcmVxdWlyZWQNCj4gPj4+PiBmb3IgcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1j
bW4NCj4gPj4+Pg0KPiA+Pj4+IE9uIDA4LzA2LzIwMjYgMTI6MjYsIEJpanUgRGFzIHdyb3RlOg0K
PiA+Pj4+PiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGFua3Mg
Zm9yIHRoZSBmZWVkYmFjay4NCj4gPj4+Pj4NCj4gPj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+DQo+ID4+Pj4+PiBTZW50OiAwOCBKdW5lIDIwMjYgMTE6MjINCj4gPj4+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2NvbjogTWFrZSByYW5nZXMNCj4gPj4+
Pj4+IHJlcXVpcmVkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4+IE9uIDA4LzA2LzIwMjYgMTI6MjAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+
ID4+Pj4+Pj4gT24gVHVlLCBKdW4gMDIsIDIwMjYgYXQgMDI6MTM6MjlQTSArMDEwMCwgQmlqdSB3
cm90ZToNCj4gPj4+Pj4+Pj4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBBZGQgYSBjb25kaXRpb25hbCBzY2hlbWEgcnVs
ZSB0byB0aGUgc3lzY29uIGJpbmRpbmdzIHRoYXQNCj4gPj4+Pj4+Pj4gcmVxdWlyZXMgdGhlIHJh
bmdlcyBwcm9wZXJ0eSB3aGVuIHRoZSBjb21wYXRpYmxlIHN0cmluZw0KPiA+Pj4+Pj4+PiBjb250
YWlucyByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbi4gVGhpcyBlbnN1cmVzIHRoZSBMVkRTDQo+
ID4+Pj4+Pj4+IGNvbW1vbiBjb250cm9sIGJsb2NrIG9uIHRoZSBSWi9HM0wgU29DIGNvcnJlY3Rs
eSBkZWNsYXJlcyBpdHMNCj4gPj4+Pj4+Pj4gYWRkcmVzcyB0cmFuc2xhdGlvbiwgYXMgdGhlIGRl
dmljZSBoYXMgY2hpbGQgbm9kZXMgdGhhdCBuZWVkIGENCj4gPj4+Pj4+Pj4gdmFsaWQgcmFuZ2Vz
IG1hcHBpbmcgdG8gYmUgZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gPj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwgfCAxNA0KPiA+Pj4+Pj4+PiArKysrKysrKysr
KysrKw0KPiA+Pj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPj4+
Pj4+Pj4NCj4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4gPj4+Pj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4+Pj4+Pj4+IGluZGV4IDljODEwMTBk
NWE3NC4uY2JmODNhMDZhZTI1IDEwMDY0NA0KPiA+Pj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4+Pj4+Pj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4gPj4+Pj4+
Pj4gQEAgLTI2OSw2ICsyNjksOCBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4+PiAgICByZXNldHM6
DQo+ID4+Pj4+Pj4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gKyAg
cmFuZ2VzOiB0cnVlDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBUaGVyZSBhcmUgbm8gY2hpbGRyZW4g
YWxsb3dlZCwgc28gcmFuZ2VzIHByb3BlcnR5IGlzIHdyb25nLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+
Pj4gWW91IGFyZSBjaGFuZ2luZyBiaW5kaW5nIHdoaWNoIERPRVMgTk9UIGFsbG93IHNpbXBsZS1t
ZmQgb3IgYW55DQo+ID4+Pj4+Pj4gb3RoZXIgY2hpbGRyZW4uIFJhbmdlcyBpcyBub3QgYSBwcm9i
bGVtIGhlcmUuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEFuZCBpZiB5b3UgdGVzdGVk
IGl0IG9uIHlvdXIgRFRTLCB5b3Ugd291bGQgc2VlIHRoaXMgZG9lcyBub3Qgd29yay4uLg0KPiA+
Pj4+Pg0KPiA+Pj4+PiBJIGRvbid0IHNlZSBhbnkgd2FybmluZ3Mgb3IgZXJyb3IuIEkgaGF2ZSBk
b25lIHRoaXMgY2hhbmdlIGJhc2VkDQo+ID4+Pj4+IG9uIFJvYidzIGNvbW1lbnQgYmFzZWQgb24g
c2FzaGlrbyByZXZpZXcgWzFdLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJZiB5b3UgYWdyZWUsIEkgY2Fu
IGRyb3AgdGhpcyBwYXRjaC4NCj4gPj4+Pj4NCj4gPj4+Pj4gWzFdDQo+ID4+Pj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYwMTAyMjYxOS5HQTM5NjEzMjQtcm9iaEBrZXJuZWwu
bw0KPiA+Pj4+PiByZw0KPiA+Pj4+PiAvDQo+ID4+Pj4NCj4gPj4+PiBMb29rOg0KPiA+Pj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyNDE5NDQ1Ny40Nzk2ODEtMi1iaWp1LmRh
cy5qekBicC4NCj4gPj4+PiByZQ0KPiA+Pj4+IG5lc2FzLmNvbS8NCj4gPj4+PiBXaGF0IGNvbXBh
dGlibGVzIGFyZSBoZXJlPw0KPiA+Pj4+DQo+ID4+Pj4gTm93IG9wZW4gdGhlIGJpbmRpbmcgLSB3
aGF0IGNvbXBhdGlibGVzIGFyZSBhbGxvd2VkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNt
biA/DQo+ID4+Pg0KPiA+Pj4gT0ssIEkgYW0gbWlzc2luZyB0aGUgZmFsbGJhY2tzICJzaW1wbGUt
bWZkIiwgInN5c2NvbiI7IGluIHRoZQ0KPiA+Pj4gY29tcGF0aWJsZXMgYWxsb3dlZCBmb3IgcmVu
ZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4uDQo+ID4+Pg0KPiA+Pj4gT0ssIEkgd2lsbCBhZGQgdGhv
c2UuDQo+ID4+DQo+ID4+IE5vLCBtYXliZSwgZHVubm8uLi4gSG93IGFueXRoaW5nIGhlcmUgY291
bGQgaGF2ZSBiZWVuIHRlc3RlZD8NCj4gPj4gZHRic19jaGVjayBjbGVhcmx5IHBvaW50cyBlcnJv
cnMgb24geW91ciBEVFMuDQo+ID4NCj4gPiBJIHJhbiB0aGUgYmVsb3cgY29tbWFuZHMgYW5kIG5v
bmUgb2YgdGhlbiB0cmlnZ2VyZWQgdGhlIGVycm9yL3dhcm5pbmcgeW91IGFyZSBzdXNwZWN0aW5n
Lg0KPiA+IEFtIEkgbWlzc2luZyBhbnl0aGluZyBoZXJlPw0KPiA+DQo+ID4gbWFrZSBBUkNIPWFy
bTY0IERUX0NIRUNLRVJfRkxBR1M9LW0gRFRfU0NIRU1BX0ZJTEVTPSR7MX0NCj4gPiBDUk9TU19D
T01QSUxFPX4vJHtUT09MX0NIQUlOfS9iaW4vYWFyY2g2NC1ub25lLWxpbnV4LWdudS0NCj4gPiBk
dF9iaW5kaW5nX2NoZWNrIC1qMzIgbWFrZSBBUkNIPWFybTY0IC1zIGR0YnNfY2hlY2sgLWozMiBt
YWtlDQo+ID4gQVJDSD1hcm02NCBEVF9TQ0hFTUFfRklMRVM9JHsxfQ0KPiA+IENST1NTX0NPTVBJ
TEU9fi8ke1RPT0xfQ0hBSU59L2Jpbi9hYXJjaDY0LW5vbmUtbGludXgtZ251LSAtcw0KPiA+IGR0
YnNfY2hlY2sgLWozMiBtYWtlIEFSQ0g9YXJtNjQNCj4gPiBDUk9TU19DT01QSUxFPX4vJHtUT09M
X0NIQUlOfS9iaW4vYWFyY2g2NC1ub25lLWxpbnV4LWdudS0gVz0xIGR0YnMNCj4gPiAtajMyIDI+
JjEgfCB0ZWUgLWEgYXJtNjQtZHRicy5sb2cNCj4gDQo+IE5vLCB5b3UgbXVzdCB2YWxpZGF0ZSBh
bGwgc2NoZW1hcywgbm90IG9uZSBmaWxlLiBBbmQgd2l0aG91dCBEVFMgb2J2aW91c2x5IHRoaXMg
d2lsbCBub3QgcG9pbnQgYW55DQo+IGVycm9yIG9uIGR0YnNfY2hlY2suDQo+IA0KPiBJIGFtIHJl
dmVydGluZyB5b3VyIGNvbW1pdC4NCg0KV2hhdCBtYWRlIHlvdSB0aGluayB0aGF0IEkgYW0gbm90
IHRlc3Rpbmcgd2l0aCBEVFM/IFBsZWFzZSBkb24ndCBhc3N1bWUgdGhpbmdzLg0KDQpsdmRzOiBs
dmRzLWNtbkAxMDhhMDAwMCB7DQoJCQljb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDhnMDQ2LWx2
ZHMtY21uIiwNCgkJCQkgICAgICJzaW1wbGUtbWZkIiwgInN5c2NvbiI7DQoJCQlyZWcgPSA8MCAw
eDEwOGEwMDAwIDAgMHgxMDAwMD47DQoJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCgkJCSNzaXpl
LWNlbGxzID0gPDI+Ow0KCQkJcmFuZ2VzOw0KDQoJCQlsdmRzMDogbHZkc0AxMCB7DQoJCQkJY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzIjsNCgkJCQlyZWcgPSA8MCAweDEwIDAg
MHg4PjsNCgkJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9NSVBJX0RTSV9QQ0xL
PiwNCgkJCQkJIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X0xWRFNfUExMQ0xLPiwNCgkJCQkJIDwm
Y3BnIENQR19NT0QgUjlBMDhHMDQ2X0xWRFNfQ0xLX0RPVDA+Ow0KCQkJCWNsb2NrLW5hbWVzID0g
InBjbGsiLCAicGh5Y2xrIiwgImRvdGNsayI7DQoJCQkJcmVzZXRzID0gPCZjcGcgUjlBMDhHMDQ2
X0xWRFNfUkVTRVRfTj4sDQoJCQkJIAkgPCZjcGcgUjlBMDhHMDQ2X01JUElfRFNJX1BSRVNFVF9O
PiwNCgkJCQkgCSA8JmNwZyBSOUEwOEcwNDZfTUlQSV9EU0lfQ01OX1JTVEI+LA0KCQkJCSAJIDwm
Y3BnIFI5QTA4RzA0Nl9NSVBJX0RTSV9BUkVTRVRfTj47DQoJCQkJcmVzZXQtbmFtZXMgPSAibHZk
cnN0IiwgInByc3QiLCAicnN0IiwgImFyc3QiOw0KCQkJCXBvd2VyLWRvbWFpbnMgPSA8JmNwZz47
DQoJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCg0KCQkJCXBvcnRzIHsNCgkJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQoJCQkJCSNzaXplLWNlbGxzID0gPDA+Ow0KDQoJCQkJCXBvcnRAMCB7DQoJ
CQkJCQlyZWcgPSA8MD47DQoJCQkJCQlsdmRzMF9pbjogZW5kcG9pbnQgew0KCQkJCQkJCXJlbW90
ZS1lbmRwb2ludCA9IDwmZHVfb3V0X2x2ZHMwPjsNCgkJCQkJCX07DQoJCQkJCX07DQoNCgkJCQkJ
cG9ydEAxIHsNCgkJCQkJCXJlZyA9IDwxPjsNCgkJCQkJCWx2ZHNfY2gwOiBlbmRwb2ludCB7DQoJ
CQkJCQl9Ow0KCQkJCQl9Ow0KCQkJCX07DQoJCQl9Ow0KCQl9Ow0KDQoNCkNoZWVycywNCkJpanUN
Cg==

