Return-Path: <linux-renesas-soc+bounces-29807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMKlBPXkummdcwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:46:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654AA2C08BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5AE13301B25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1F033F36B;
	Wed, 18 Mar 2026 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vcyo5w7Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7A2D47E9;
	Wed, 18 Mar 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853764; cv=fail; b=g44fKzlYuZMMrgD4ZhDcHmOv1MClOgkeNxsgBeqfNulcCYtULEY5epZuGz10wRXg29WZAdbwfYOcSIX20JPhH2F9zrhor7zqsfSO/e2BLeGeiwHrmDTgkmTsIOFa4ynObOBCTYKrfRdioAVtvnLo1D5lsMl/8plIeOOi+SSVGco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853764; c=relaxed/simple;
	bh=SQ3IqcVKamZseeEoq2T02j6VG1bOF3wQ2wq6BXIlPMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Niqd5pblOklDAlH0+obk+aRlFIKUPg0JzLmd+FtpS/XTy5wS1vVTcbJFEHOLAIOKebo9lBhZxT7+ztdO1DIYy0UGqe7Q4pT2P8FIGEDkZDbP1CgwGXPjgOKbRBVTYIiYAI7r14hXRsbE4JjdrH0+UX94ESXSTz4cRgSIY5khrpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vcyo5w7Y; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/JhXLBx/VBCIwENyLvkswshcnE482IwjV6FbdtZiKJ9teVRUbGWgnW5xU9xJrMm0bkkL4ma1YnRGwC9MN4i3goNIi8aeQ7C70dRvy3muP2KQPe5h+PU22XkifhqZsFo7RjAvwRnorDKLlsZY87qOq2g2PB0wdNLKFER0TDsf/i1bdvvKqOPKHoVeZhGalocGx3F2cCqiqiHXrJXGpld3X1Y/J5Uzdubvdn5kLcTJuQt2d4R7FFXlq4sMwvokYzdgVBSnc2R+jJ/x6F+uEF67bbt8L1LbGLvTNGMkb03aeIJa6QGOnSbS5fTCLRyAP0NsV1tPLfkrKey4qjLvkVkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ3IqcVKamZseeEoq2T02j6VG1bOF3wQ2wq6BXIlPMc=;
 b=jc/QbaCLaQ8uWlLrnGZ/U+HzTvJ6WtBwsXBWDF2V3BJgZFjUvMbBTzXIDw5gzCP/aZ7/n3IPaYP98VGAnq24lUoDZcXfVR26ImU7E2xUKfAzL8rPahVZ6qYMxdpKTsPhWKxmylgHP4CLaAW6SuqbZu6mGN78agTr4cyI1Rf+JSrwH71UVAQUZgfqx9Z5AFEkdMNYOPvsvmiuwTbNtnWdJBwgPZKKesQlovZToVFZ30KscGDvWLeyidkBajR0EUZQE4d9+U9W6rDXRwwE/4cdTLlAoFN/llqzPgD/BA1+wFqmbEAjyFRH+R5IX03cx4OgH9k7cqJU5BZFU6S7vH5KWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQ3IqcVKamZseeEoq2T02j6VG1bOF3wQ2wq6BXIlPMc=;
 b=vcyo5w7Yr23eraVc5du2KJc6iUXti0xsfVAGLV//U0kQudJhTvEspnwlIpqsbY4vnmuUFuIJtH2Au9Sxv2faWAHKWd6QfI7P3/sjdzF+bT7XJSOqlRGrS/OM+Gw2JutU2ygGMRTsL0hWD4kto8NrRJrILvtYoh1UeVprlvT6Hy4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14538.jpnprd01.prod.outlook.com (2603:1096:405:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:09:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:09:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 6/9] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v5 6/9] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Index: AQHctrMZdpYCWhMRiUW1f4oCex+0vbW0ZcCAgAAgMKA=
Date: Wed, 18 Mar 2026 17:09:19 +0000
Message-ID:
 <TY3PR01MB11346A964BFFA95791EBFDAD4864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdVv7rjMfp=53i8iKUSDgTs3ppFW_Q8XJ+KciJnzsHg3Gw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVv7rjMfp=53i8iKUSDgTs3ppFW_Q8XJ+KciJnzsHg3Gw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14538:EE_
x-ms-office365-filtering-correlation-id: 70e9135a-cd37-42cf-1a9e-08de85111812
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 SPewfTiAma5uwzNwH4mfB/2a+J/+1dqh0fDYNgYOcxl/3cps9V1S9ay+guQ/Qsrrjq1ShNdlAZUKp11j1UULgDxZn1EUUv7uomTcp+v+G5d2mWF+PRrQuHzmgcxv5o1fNDNetfoZWXCYXsh/Ix+9nYbCRp+xyWnBFfKKy9Z01csy/5DQjU0SWEwkBv8eLP6FZAHTsQ02Y++07OTHB8SNqaMPbTArysdX4gxKvYGuSTAQ7CImkf9qIz28uuz/DxJ+h5q8pTvnaDRkySBwqVw1OC0Klta+6OTJiTvKJWQqRZj/4p4xbx3ic5AOEgY6tw95KMT8GCA2PvHscTuyehxMYxCnkcU3B1a3u3BO6RBqwY7nsKuoKG/iE9VAEteWwIFJzeFDakutlRW4IDmKkN1OJdBLD3WJ/+T7T8vBUK1WSUrG/DxYGQgYiODttk/csSEtW2oUhrfsc7RzeiKydtlZ9GoPAaIDD//FPSmKkhgGhegbGrUE+Z3MEckTr6QuxvtpNc7H1DlCI402SpT8ZXHD1IwO8uv18FAsYa4lLmX8L6xvqqiDiyIaq7MudgLAokIbMGk881/AIkneT8XQ/eXY14rfZVz3oymkvi8vNwrLnArzuwI+1hHusqUlgObAxqxraXbpg1+jW5zZG2NDVyyqoso/4nR4K7mWffYCzRSZtGS3EdNJ63U27y2kdPUcdZ3Ra3DH+WuIVnU0kAOqGwolfnQi7SvXN9MfQ3D/iQGxNy2nOc1syQ9r8YbBidx3/12yQ/y6dkTv7J6O+IVJ8bun3KCaC+5CrX1WoiObl8W6xek=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGd1b3ZLN0gyUE5XSEl5S3FqQ3JxbGVTSG56K1JJNy9reWdrd005elRBbVNZ?=
 =?utf-8?B?RG4zMnAyWEFBRXM1dDA2YllpVE5OWG0vWlRGZ05takJscENnUmlGcGpZMjJZ?=
 =?utf-8?B?TnBTeEtHQjh1dUQ0US9kT3VaL0pEM1NjK3NweWt3T0NFTE8xUktoemdSRE5Z?=
 =?utf-8?B?V2Q4WjdEVCtJY1hSWTJsVElsTC9ka0drOFpoNURPTGoyZnVRekdQK1BYK0du?=
 =?utf-8?B?SStaa1FEdmFQakZwSGJJQ1JYVWRoVm9aYnZtbm9KRlZraGo2aDBZdnJ4WUlw?=
 =?utf-8?B?b1NFVW9mZlFkOXlCRnlVRFg3cGFjamZIckpSUDJGQmVlbWlidVpvaEpsYVVv?=
 =?utf-8?B?L2Fwb3dLMTV2dXZoa2FtQUE2N2xjK2p6RnZsTHllakxHU0w4T1VxZHhhV3pY?=
 =?utf-8?B?WWN1V2NtQXhiNHdUaXFuTXp2L0pOOHJHWE9kZi83Nk5ldVBoVElxc2dkUGRT?=
 =?utf-8?B?R1JqTm9oSUJVOFZvV2tBQ054eGlQL2kwdzF5WmRYS2ZJRHJNSHJ4OWVqUzlP?=
 =?utf-8?B?WEMrUXNhaytjZjY5aTYyWWFUcENOWUpUVjdiU0ZpNHVCcVhqblA4L1pjNDZN?=
 =?utf-8?B?R3E4eE5Ca21rUk0rTFdjdS9pNEEvVGZPY3A3NmgyNitBQ1JVbjA3NU9xNUVP?=
 =?utf-8?B?cGQ2dVdDb29PZndsektzcThuS1ZyVXpEWWdXVlZ3UEJSR3JYaTUrcWg4U2Fp?=
 =?utf-8?B?SG9PRHZQRXJkdEp2Uk1acVllSXE0MFhtZEJFZGZ5TFZVV01lN1ZhOGg4eHdK?=
 =?utf-8?B?TmZKTWNMdGdyc1M3TjJyRzhhdDFrOE5YUDNyMzFSV0lNM1FlQkZ2K3lwUkZw?=
 =?utf-8?B?bTFhaG5rUzI1d1kvZWpiWjBQcGtlSjQ3b2pCZzFlZkltZlFraExrSGU4YXh2?=
 =?utf-8?B?NHp2aCswY241VVBYRDRtWHE4VHo4cnlDK0FoQ1RYN20veG92SXpUckJqWlZV?=
 =?utf-8?B?TTV3Qm5yQnRzSk94c1JzZ3V2YmYyVXNjMUhEUzBxdEw4T0F6R2FFNXBvWkxJ?=
 =?utf-8?B?YnV2am9FS0hxNzM4MElYYVRtV3FmOC9Kak1RNnZBOHE4UHE2SVV6aTlja29j?=
 =?utf-8?B?bXpCN1Y0amZjN0c3YXZIamZPUEFKVEV2UU5UYkRRYWNuK1h5OTg2TUZ2ZTV6?=
 =?utf-8?B?WWw4RERJUEhnMWduTHBzSVVmZUF6SVBrbjVSamp5MkQwVTczOGU1WndhSkxS?=
 =?utf-8?B?Y0QydFRKOEdsNzJCTjlJMHN6NEFKWTFwUGpyZDZUU2s2OXpiUzFMcGxjcFV1?=
 =?utf-8?B?dTdBVXRVNHFXMzZMQ3dvT2pLVWw5REo3ZzB2T0s5UXZmcEJaN25ISmt0ckF6?=
 =?utf-8?B?eCtRNDY4ODMvS3RDeGlUOU1nUWxKK2pBQS8zMEhsSW4zaHdUbWs1bW5EdWtI?=
 =?utf-8?B?RU9OK1JjV0x6T2orQ1ROenBhVzZGYk52RmY2Rm9zcjZ2a0NHVGpFRTkrMmVZ?=
 =?utf-8?B?c3lxYjkycnhBekdNZVFvcS83ZVBtZlhaeVFmUXR0bm10TlVIcVMxYVRGTDdo?=
 =?utf-8?B?MFprWTA0ZnFnenlwSXlKY24wVngvWURmK1hDTVJJQm9OelpUeHFibHVaYlY5?=
 =?utf-8?B?RkEwVEVNdmFlbG5UTlB1QnlhVzFVUndZNHovVGp3a2Z0QUNBdm9YaWFwdnRQ?=
 =?utf-8?B?VFVpV1lZRWRVYWNrTjRYQkUyc28zclkyMlJBanJHMWtiS292V0FNRXFPMjlr?=
 =?utf-8?B?VXptTFozSmpCcVM5ZEZmeStKNnhyRk52Y3luUDRTU3dueWJrSWlKTWpzRk5h?=
 =?utf-8?B?Z2xkNDB0QXZOTU5CcVNWZmJuWWhhMEhvZDl4WHhmN0g0VXNLTUd5eklTdXhB?=
 =?utf-8?B?eU9YVEFpT1BvanRqT2hQUmFmYTJhNW5mQXYya2grNGplMHNDYzV6QldmRm91?=
 =?utf-8?B?bUFvZUZScTRLZGRJcFJ2MmNLT3llb1F6TU9BcGt5NERkTm1aUXRpUmE2NnU0?=
 =?utf-8?B?S0dUaXlFYjhHQWdJdHBBNnV5Mm5xNjFhczdGY0pLNjBFZjdyYm5nUmdKTlVr?=
 =?utf-8?B?TmtBZmhTdTZxZnh1VFZudkVINXcwZ1JGQWc4S1RoUXFQL0J1S0lSYURsblZa?=
 =?utf-8?B?bGQxWVJsQ0E3S3lZRkNlMzdMZk82b1l5VDRDa2hKcmNUMHh2YWdNWHpubFpv?=
 =?utf-8?B?citGd1FzeEZGSE1sYUZPK1VqdkMwdUFoTW0vR24vR0VtR3VFTVRYUWphM2ls?=
 =?utf-8?B?S1pmZFpITWRReTlyUHo1RTlyYUYzb1RMNng0OGY0ZURqSS9kUTcyV3BMMjBG?=
 =?utf-8?B?WWs3ay81TXdjYTg2aVdYRkJyaGVjQW9PNXZVU1hvUk1XMFkzZjA5WHpwMy9n?=
 =?utf-8?B?VnppQVhVSWU0OUlsbFpIQjc4bkEvZy9vNkEzK0dwcGlpcktYSytEUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e9135a-cd37-42cf-1a9e-08de85111812
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 17:09:19.7080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zp7TcE40JbfAfUUUiOAL7iLPYK2u9U5k2XZLz27QQMxIbxzDT0HKoeHovf3fhvE1b6/58TPpsTnukPTGuDceh4OwQHsDQQUauA7hDKWf07A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14538
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29807-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.949];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,11e40000:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 654AA2C08BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYgMTU6MTINCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSA2LzldIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBpbml0aWFsIERUU0kgZm9yIFJaL0cz
TCBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIDE4IE1hciAyMDI2IGF0IDA5OjQy
LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCB0aGUgaW5pdGlhbCBE
VFNJIGZvciB0aGUgUlovRzNMIFNvQy4NCj4gPiBUaGUgZmlsZXMgaW4gdGhpcyBjb21taXQgaGF2
ZSB0aGUgZm9sbG93aW5nIG1lYW5pbmc6DQo+ID4gICAtIHI5YTA4ZzA0Ni5kdHNpOiAgICBSWi9H
M0wgZmFtaWx5IFNvQyBjb21tb24gcGFydHMNCj4gPiAgIC0gcjlhMDhnMDQ2bDQ4LmR0c2k6IFJa
L0czTCBSOUEwOEcwNDZMNDggU29DLXNwZWNpZmljIHBhcnRzDQo+ID4NCj4gPiBBZGQgcGxhY2Vo
b2xkZXJzIHRvIHJldXNlIHRoZSBjb2RlIGZvciB0aGUgUmVuZXNhcyBTTUFSQyBJSSBjYXJyaWVy
DQo+ID4gYm9hcmQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjQtPnY1Og0KPiA+ICAqIE5vIGNoYW5n
ZQ0KPiA+IHYzLT52NDoNCj4gPiAgKiBGaXhlZCB0eXBvIFIwQTA4RzA0NkwtPlI5QTA4RzA0Nkwg
aW4gY29tbWl0IGRlc2NyaXB0aW9uDQo+ID4gICogRHJvcHBlZCBSOUEwOEcwNDZMNDYgZnJvbSBj
b21taXQgZGVzY3JpcHRpb24NCj4gPiAgKiBEcm9wcGVkIHVudXNlZCBhdWRpb19jbGt7MSwyfSBh
bmRjYW5fY2xrIGRldmljZSBub2Rlcw0KPiA+ICAqIFJlb3JkZXJlZCBpMmMgZGV2aWNlIG5vZGUg
YW5kIHVwZGF0ZWQgcmVnIGVudHJpZXMgYnkgdXNpbmcgbG93ZXItY2FzZQ0KPiA+ICAgIGhleGFk
ZWNpbWFsIG51bWJlcg0KPiA+ICAqIEFkZGVkIHBsYWNlaG9sZGVyIGluIHBpbmN0cmwgbm9kZQ0K
PiA+ICAqIERyb3BwZWQgdW51c2VkIERNQUMgZGV2aWNlIG5vZGUNCj4gPiAgKiBBZGRlZCBwY2ll
IG5vZGUgd2l0aCBwbGFjZWhvbGRlcg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiAN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA4ZzA0Ni5kdHNpDQo+ID4gQEAgLTAsMCArMSwyMTUgQEANCj4gDQo+ID4gKyAgICAgICBz
b2M6IHNvYyB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7
DQo+ID4gKyAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArICAgICAgICAgICAgICAgcmFuZ2VzOw0K
PiANCj4gPiArICAgICAgICAgICAgICAgcGNpZTogcGNpZUAxMWU0MDAwMCB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMWU0MDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwweDAyMDAwMDAwIDAgMHgzMDAwMDAwMCAw
IDB4MzAwMDAwMDAgMCAweDA4MDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAv
KiBNYXAgYWxsIHBvc3NpYmxlIERSQU0gcmFuZ2VzICg0IEdCKS4gKi8NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBkbWEtcmFuZ2VzID0gPDB4NDIwMDAwMDAgMCAweDQwMDAwMDAwIDAgMHg0
MDAwMDAwMCAxIDB4MDAwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJ1cy1y
YW5nZSA9IDwweDAgMHhmZj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5
cGUgPSAicGNpIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwzPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBwbGFjZWhvbGRlciAqLw0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwY2llX3BvcnQwOiBwY2llQDAsMCB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MCAweDAgMHgwIDB4MD47DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHBsYWNlaG9sZGVyICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gDQo+IFRoYXQncyBh
IHJhdGhlciBsYXJnZSBwbGFjZWhvbGRlci4gRG8geW91IG5lZWQgYWxsIG9mIHRoYXQgbm93Pw0K
DQpXZSBjYW4gZHJvcCB0aGUgYmVsb3cgb25lcy4gSSB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVy
c2lvbg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogTWFwIGFsbCBwb3NzaWJsZSBE
UkFNIHJhbmdlcyAoNCBHQikuICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hLXJh
bmdlcyA9IDwweDQyMDAwMDAwIDAgMHg0MDAwMDAwMCAwIDB4NDAwMDAwMDAgMSAweDAwMDAwMDAw
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+Ow0K
DQpDaGVlcnMsDQpCaWp1DQo=

