Return-Path: <linux-renesas-soc+bounces-33334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHcAMGBfGWqwvwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:41:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33917600170
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00789302F9BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB1F3B895B;
	Fri, 29 May 2026 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Uyu58HQm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576AA3B27D3;
	Fri, 29 May 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047575; cv=fail; b=lJ4d2pV8A1fWajpBoYhcYD9BsddNltH6U5o0NqyXTElQeVpALkM44YVcikoqaIIcw9UDWPfg7YnwWTcXjy+JNfwQzFSGK+mcs5f7ERZQXYEEG5+uqUTyNlDqxxFYS4ZzOl+E1LdpdA9bubBXc/qqxTbdfOyvPsWuaHlxxQAs0sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047575; c=relaxed/simple;
	bh=DW3VwbMLMtxQ9iY7WugczNI+2p2z8InaHR1Ap5hUh0M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t4+OtIzRtZaNo2Hp6uylbmhV8/FjE5c8OTG71GPpjpbr8F+1dz/eA/XZCvoNH9sICT5Eqr5QaIBVLB4MvLTNgG28nQ4o6wZ0facjJ+ClYrfA29jdQQdFDj5oyBe4YoBp12DwwZLo3UWFd/C1WpQyGJ31Xe4yC4WDo/gqiNEij50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Uyu58HQm; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl60qlxsFjBIOUP3qXGS3pp6gisbGNMpjDxsEpwmSIEyup0St+z8fNsCRYBkCAo8aMw7PWyxDFZ49PROd7D0yT2ItWKjQrl3xXQ2NEkyA0wa6lXU0lOtArplfPrb4lsrBY0kT5NAyY6MHpC8ypPQMGhwpw8t4lxlhsPHufZLmOEC6OY2P7IizKpgG4w5CctKDv5rU+J/QbUE04Ay51OHn/wk0ZzDzk5stskzveJnTIz1NyWfcW291gYFqsSGXPG6O8frOqnA3CHJ4C7MZfRR8O2r0am7bHEDSOgS8g0z/TWYDXAQKjVJXApDeXmcYiCTk6q2PVioKZ+ElmT414jpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DW3VwbMLMtxQ9iY7WugczNI+2p2z8InaHR1Ap5hUh0M=;
 b=KbclWJ9bwD+1ncRF4G7BEyybDojFR4pI8qBk/ug9eD6KhrqZDo4Wd8nPP+Pb9qaXhpeCWSmuydMBdVMTjT6U22+T3roloUr2MriMEOY1wxa+FSCR5mHsVN+77PEWtBtpvgyr0gBYERvNhVnNkGn0eG/71ZjMndrMhCppnEC8u4x+wvvmUeSng1tw6ZqhoBsRELu5/mJGQDJ5IuoYgulO6DkAAxyLe6UBLbFOAL0mcTTL5bvJG3qW81C3bo/yzUYfvlIJzn+DWc4IgUNVBEFhnEbcvSBPjrf/Vj6Dm1zAsNI/hCvSV6f+uqhXh9Q859QXJ6uwfd5GFkTOyzRQNckt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW3VwbMLMtxQ9iY7WugczNI+2p2z8InaHR1Ap5hUh0M=;
 b=Uyu58HQmCTqkm+SlXAhENBoGfxaGL8tGvQ0Qtbo8UJroC1pUFdK2vr0F6fflSbBsKki0CLBtirmhncHJJDL4zmv4dTxjCAGmasFT38PwuITRQO84m8X3WgazZknoOvtua9G72HbO68bCUj33x3KjK5spfDBH8/0Xhjp8U6naYIM=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYWPR01MB10243.jpnprd01.prod.outlook.com (2603:1096:400:1d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 09:39:30 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2221:b6b2:e5f3:2f0]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2221:b6b2:e5f3:2f0%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 09:39:30 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Thread-Topic: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Thread-Index: AQHc4+T6PYo9V+SM4EiVqK6sBkQi9LYiPxaAgAD5FgCAAZ38EA==
Date: Fri, 29 May 2026 09:39:29 +0000
Message-ID:
 <TY3PR01MB1208987BE39F534A852A38E9DC2162@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
 <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
 <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYWPR01MB10243:EE_
x-ms-office365-filtering-correlation-id: 789de9c7-3444-49ca-3fc8-08debd662eac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|38070700021|6133799003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 fUuycPlF403EJqGmepiupCLVsDnbc7aqaZ+YnyFagnHRUPz12JFgN/JxqJdRumlnc7ymHojjkhBuT8wHFi8ZUWFfm4Crbo9wjGLHNauXx3oWGLcpUdxB1RBF25Py0AWkT+df5s4UNpKdlUl2PssTDVYoT41sMfB8+57ngyPywjH/+kkh62xCgmxQmO1i/QVC0hRhFEyyT9eoQkJtxNQM7agsq6V3EpxGplNjCTnwXQm1LYFWhJduDRY12AYGjCvULOeixXf8cHsAEV+kGpmHx8nWczN3hf2p1DSZOsuSJxB9iHFl7Jjkat30OinF6JgRYwx+M51MP76wwGnz+ZZbJE3kIq+HPU/I8jZZ9qdltavSLAIn+WwC3vIAUR6G3mvsmrThF6IJfPHvYSllmFwMoIHlq5ahNNE8HD7JrFLlLIZoZWlQfmXY/hhuqmOGl6DC+JkCwas4HlsktAc4gAnwPQ4NNiIp+fcvDt8zIpWDZZoFhy4txFwrIhKvH/3Pcgv8XL45w/++GljDwZa+IG22V4i6HRb322jcbopyF/sOLpFfngo3jAX152j6BqVG7GhW9v52+QjtXiVo5DXujYYjy1nHo6RyRmA5u94YoanbZSYrZQXUfRpaDB4OS7WtlKzHlBrAKOcKkp3L5dmdMT7Dd9sKP79gdSsaq8MEKZqG2EcKI3JOejr+d8lr9gve2Vn0wKHwCsh2CF0gNiEQ/eV8fZyRvktKux4pEzcWzWB6K1E2bVCjS3dWIHbZQruJWYD6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHh2cGx0alo3aE9ZckJsTVhyTUdXNHR0TDZCcStFZXFXS040YWlKRHhxeWZl?=
 =?utf-8?B?cmcrTVhlZzZXa3d5RU5kbGFIdjl5bEpiMGZQZ0tUMDZHclFWSW00S1lUQTR1?=
 =?utf-8?B?MStDSGJNL3ZSdk9mdXFzN3dHY3NPdURKdGoyOExQMmJBQ0FNaStuWEFObEJo?=
 =?utf-8?B?UGIxa2l6TUFTcTRSaVoxL2FycTdscmU1QVFZenJyRHNXQ2E3UWF1NkJ6WXBP?=
 =?utf-8?B?S1hFWlNDemw2YkxURW0zVXJmNHNsSk9lUXQ3ckluamNmdFR5bDRVWGdkcFo1?=
 =?utf-8?B?MkhJZ1EzejY0VHUyNVI3UThVOUwyOG00b1lEZ3hqcjRIWGVUcFFBYjBoay9y?=
 =?utf-8?B?TWN2aE5RRTVOZllxaXg5ZnpFN05yaENmbWM0aEVORkRmRkEreTJ2WmpKcStq?=
 =?utf-8?B?SUNKbXM1bjQ1VXlUUGdjc3kzK1d2WGFnZ2dpelZ1dzdjZlVURithSlpEZTZI?=
 =?utf-8?B?RWxMZHNxcitmM1ZEc0tZSjVjTGRrRm9qSmZmU2VWVTJHSG1uY3phdWFkR1hv?=
 =?utf-8?B?dW13cXR0ZDdBY1VCbEFJb1dESGFwZ3pHUjVSOGhOZ09GT1FNSGc2eGcvQlpz?=
 =?utf-8?B?WHlhckMwdTU2K0RZSkVxS3ZRbWNCdXhvNVhJZ3BWMUdzeUlvV2VyZCtBSkFT?=
 =?utf-8?B?bVF5bVl4NGVuRjk4Vjh5OUt6UVRQOEVCS0JoaVJiL3dtS3YrWlNQa0JtclFl?=
 =?utf-8?B?N2xBZTNaaTVRcmR1czhISFdxVjFldU5LSUptZURPR0NjZndiWTZxSjcwaDVp?=
 =?utf-8?B?bUI2N2RYSSt3NkpIVmpWWUVTTEVreWJYWVNpV1NsWGhDQ3BHLzBFWmYwMHhS?=
 =?utf-8?B?T1ZrRE9pbVpLVVUwK1VZcDVQZE9ZVmFPMXdXblBUQVJlNW1yR2c5aWREcDdV?=
 =?utf-8?B?YThwMmhyODFQYUI3WjlmRkhhc1U0eWRhbDZZSUNEaUdXRDMvRjRzWjVoZzJy?=
 =?utf-8?B?TmlrMTlvMHVJK251czVWMFJIWjE4aGM1K0lXeElxVEhQTVdBQUZDTkc5dnNx?=
 =?utf-8?B?TXRjNCtGYnQ0R2w5dDc5QlBXUkROZlVQb2pqTEdmVWEwTHllOFN2N1hFUWdz?=
 =?utf-8?B?QVZSaFJKSjU2eTZQaFNReFVRYWNCQm0rMldPc2dqZ0xJYlJCOGpMVUNjT3JK?=
 =?utf-8?B?MXhJRmV1NjVhYmt0NUhnTUU4ZmpYalJud2hZWGZSZTFIeEtSeDZ0SHQ1WnMw?=
 =?utf-8?B?a2dxeVFEMWlFMERkc1VJVjNCY2ZqbHNEV0plRzV4YWRyRSsyY2hTSlBBVkdo?=
 =?utf-8?B?K3pnclgzak43MklQd3JackFwZ1laQ2YwUjEwWURmZXVncno5TlR6UTRSUTgv?=
 =?utf-8?B?cm5BNWsxVzZTbzl0NmV2ZG9kYkdjTTZYMGhBZUVqeEFDNllnbmtmUEg5RkpG?=
 =?utf-8?B?VnZCbWtKTlFjdXBuMVkzWnpOVjY5cUtQLzF3SGRncFp0NkdlcUloTnZSQ0hC?=
 =?utf-8?B?Ui94SUpDRmxOUlhXV3JaR3FabmREV3dCYVVIRFhSb1RSWDVvTStycnEzRHJX?=
 =?utf-8?B?V0VJK3BtZGFueXc3VWNocDlsbGJVUEFySEZJYmR1WXR4UmFyVTZPckNBVitn?=
 =?utf-8?B?a3VKUlpzczQrSkVCWWM3VWpkYVk3TVFhNXY5YTBvTVJLb0lLVW1JZzk0SENz?=
 =?utf-8?B?cDRGZktEcWFOL1k0T0pnazh0dTBYMVhYMmx3enBxaFdUNm5tay82OWZ1cmcz?=
 =?utf-8?B?cnd2SWZLUmJrN2hML2p5L0dncUxiT3B3Wlk0VHhjVkViZjAvTmlrTE1GTity?=
 =?utf-8?B?a016L2prRGhydC9IZnNMVWVPTjl3N1hWYUhqWGVKMUN0ckQ5c292VldYbTdu?=
 =?utf-8?B?SHlIcEE2YThiNjhGOXdyZk1kdTZQZTMzYUZtajlyVktjWXhxM3puZkdjOGlP?=
 =?utf-8?B?dzh3RGUxTlZlY2pjTW16SzdzNXFkeE4rZWtCbi9iWlJRZmJ1eVZEY1RiRGEz?=
 =?utf-8?B?NXJEbTErQ0d1MGgzL0JKNDNoTnA4c1NTQUVhV2ttUkxUTG1LQkY2TFVoQmlC?=
 =?utf-8?B?WkkvZ1pUb1gxdXQvVmtNY2NETVlxYkxxT1E1RTBJSEdUMHNSSnBTR01XcDc4?=
 =?utf-8?B?YjBqM2ZzMGJuV25qUXJpRzFrRGc4cDJtemViT0x4RENXK2g3bVVvU2hFa3VT?=
 =?utf-8?B?TEJTK0ZPY0lQeUJBQWp3WURya2ZJTDNwQWQvMHRmTlFFNzllNWQzdmdQeUw5?=
 =?utf-8?B?eFBVUnY2V0RkZUt3UWpiU05HN1V3elVCcTZCZjFpLzhlNlFqZi9HWithblZl?=
 =?utf-8?B?bWkyU1FPUE5yUHNTbmFtMTc1NGhLZDdEYW11MHl5Ymo0NHdlTHJLVkFvOGNS?=
 =?utf-8?B?WmhZdDhtd0cwUFlhWDNvOExzYTFvS3ZnLzZJL3hVOFozeCtOZ2Y1MHErREFq?=
 =?utf-8?Q?rWOmKx8UrHNmOo4M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789de9c7-3444-49ca-3fc8-08debd662eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 09:39:29.9916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oV+ZcsU4qNa9FFTZtNmyhoxhW0ZA1wVNFCgqSbCXNVfpylSc5D7IQO7/5x7Oo+fXByJJOfOIFYUV9mk4tkvhMWjAA7cOEMBZJwJt79ipzs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10243
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33334-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,renesas.com:dkim,TY3PR01MB12089.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 33917600170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMjggTWF5IDIwMjYgMDk6NTcNCj4gVG86IExhZCwgUHJhYmhha2FyIDxw
cmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gQ2M6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWls
LmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+OyBsaW51eC0NCj4gcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQmlqdSBEYXMNCj4g
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6dDJoLW4yaC1ldms6IENvbmZpZ3VyZSBlTU1D
L1NESEkgcGlucw0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gT24gV2VkLCAyNyBNYXkgMjAy
NiBhdCAyMDowNiwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3
cm90ZToNCj4gPiBPbiBUaHUsIE1heSAxNCwgMjAyNiBhdCAxMDowMuKAr1BNIEZhYnJpemlvIENh
c3Rybw0KPiA+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
VGhlIEhXIHVzZXIgbWFudWFsIGZvciB0aGUgUmVuZXNhcyBSWi9UMkggYW5kIHRoZSBSWi9OMkgg
c3RhdGVzDQo+ID4gPiB0aGF0IGZvciBTRFIxMDQsIFNEUjUwLCBhbmQgSFMyMDAgdG8gd29yayBw
cm9wZXJseSB0aGUgZU1NQy9TREhJDQo+ID4gPiBpbnRlcmZhY2UgcGlucyBoYXZlIHRvIGJlIGNv
bmZpZ3VyZWQgYXMgc3BlY2lmaWVkIGJlbG93Og0KPiA+ID4gKiBTRG5fQ0xLIHBpbiAtIGRyaXZl
IHN0cmVuZ3RoOiBVbHRyYSBIaWdoLCBzbGV3IHJhdGU6IEZhc3QNCj4gPiA+ICogT3RoZXIgU0Ru
XyogcGluczogZHJpdmUgc3RyZW5ndGg6IEhpZ2gsIHNsZXcgcmF0ZTogRmFzdCwNCj4gPiA+ICAg
U2NobWl0dCB0cmlnZ2VyOiBkaXNhYmxlZCAobm90IGFwcGxpY2FibGUgdG8gU0RuX1JTVCBwaW5z
KS4NCj4gPiA+DQo+ID4gPiBIUyBERFIgYW5kIEREUjUwIGFyZSBjdXJyZW50bHkgbm90IHN1cHBv
cnRlZCwgYW5kIGZvciBldmVyeQ0KPiA+ID4gb3RoZXIgYnVzIG1vZGUgdGhlIGVNTUMvU0RISSBp
bnRlcmZhY2UgcGlucyBzaG91bGQgYmUgY29uZmlndXJlZA0KPiA+ID4gYXMgc3BlY2lmaWVkIGJl
bG93Og0KPiA+ID4gKiBTRG5fQ0xLIHBpbiAtIGRyaXZlIHN0cmVuZ3RoOiBIaWdoLCBzbGV3IHJh
dGU6IEZhc3QNCj4gPiA+ICogT3RoZXIgU0RuXyogcGluczogZHJpdmUgc3RyZW5ndGg6IE1pZGRs
ZSwgc2xldyByYXRlOiBGYXN0LA0KPiA+ID4gICBTY2htaXR0IHRyaWdnZXI6IGRpc2FibGVkIChu
b3QgYXBwbGljYWJsZSB0byBTRG5fUlNUIHBpbnMpLg0KPiA+ID4NCj4gPiA+IEFkanVzdCB0aGUg
cGluIGRlZmluaXRpb25zIGFjY29yZGluZ2x5Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiANCj4g
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yenQyaC1uMmgtZXZrLWNvbW1v
bi5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnp0MmgtbjJo
LWV2ay1jb21tb24uZHRzaQ0KPiA+ID4gQEAgLTI3NSwxMiArMjc1LDYzIEBAIGRhdGEtcGlucyB7
DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5N
VVgoMTIsIDcsIDB4MjkpPiwgLyogU0QwX0RBVEE1ICovDQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMTMsIDAsIDB4MjkpPiwgLyogU0Qw
X0RBVEE2ICovDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhf
UE9SVF9QSU5NVVgoMTMsIDEsIDB4MjkpPjsgLyogU0QwX0RBVEE3ICovDQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw1MDAwPjsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHNsZXctcmF0ZSA9IDwxPjsNCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlucHV0LXNjaG1pdHQtZGlzYWJsZTsNCj4gPiA+ICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ID4NCj4gPiA+IC0gICAgICAgICAgICAgICBjdHJsLXBpbnMgew0KPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaVDJIX1BPUlRfUElOTVVYKDEyLCAw
LCAweDI5KT4sIC8qIFNEMF9DTEsgKi8NCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDxSWlQySF9QT1JUX1BJTk1VWCgxMiwgMSwgMHgyOSk+LCAvKiBTRDBfQ01EICovDQo+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgo
MTMsIDIsIDB4MjkpPjsgLyogU0QwX1JTVCMgKi8NCj4gPiA+ICsgICAgICAgICAgICAgICBjbGst
cGlucyB7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpUMkhfUE9S
VF9QSU5NVVgoMTIsIDAsIDB4MjkpPjsgLyogU0QwX0NMSyAqLw0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8OTAwMD47DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBzbGV3LXJhdGUgPSA8MT47DQo+ID4gPiArICAgICAgICAgICAg
ICAgfTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICBjbWQtcGlucyB7DQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpUMkhfUE9SVF9QSU5NVVgoMTIsIDEs
IDB4MjkpPjsgLyogU0QwX0NNRCAqLw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJp
dmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NTAwMD47DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBzbGV3LXJhdGUgPSA8MT47DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnB1
dC1zY2htaXR0LWRpc2FibGU7DQo+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgICAgICAgICAgICByc3QtcGlucyB7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwaW5tdXggPSA8UlpUMkhfUE9SVF9QSU5NVVgoMTMsIDIsIDB4MjkpPjsgLyogU0QwX1JT
VCMgKi8NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3Jv
YW1wID0gPDUwMDA+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2xldy1yYXRlID0g
PDE+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPiArICAgICAgIH07DQo+ID4gPiAr
DQo+ID4gPiArICAgICAgIHNkaGkwX2VtbWNfcGluc191aHM6IHNkMC1lbW1jLWdyb3VwLXVocyB7
DQo+ID4gVGhpcyBuZWVkcyB0byBiZSBzZDAtZW1tYy11aHMtZ3JvdXAgYW5kIHRvIGtlZXAgaXQg
Y29uc2lzdGVudCwgd2UgY2FuDQo+ID4gcmVuYW1lIHNkaGkwX2VtbWNfcGluc191aHMgdG8gc2Ro
aTBfZW1tY191aHNfcGlucyAoYW5kIHNhbWUgZm9yDQo+ID4gYmVsb3cpLiBTaW5jZSBHZWVydCBo
YXMgYWxyZWFkeSByZXZpZXdlZCwgcGVyaGFwcyB0aGlzIGNhbiBiZSBmaXhlZCB1cA0KPiA+IHdo
aWxlIGFwcGx5aW5nLg0KPiA+DQo+ID4gUmVzdCBMR1RNLA0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IFRoYW5rcywgd2lsbCBmaXggdGhhdCB3aGlsZSBhcHBseWluZy4NCg0KVGhhbmtzIGZv
ciB0YWtpbmcgY2FyZSBvZiB0aGlzIQ0KDQpDaGVlcnMsDQpGYWINCg0KPiANCj4gQXBwYXJlbnRs
eSB3ZSd2ZSBiZWVuIGNvbnNpc3RlbnQgd2l0aCB1c2luZyAiLWdyb3VwIiBhcyBhIHN1ZmZpeCwN
Cj4gYnV0IGhhdmUgYSBtaXggb2YgInBpbnMiIGluIHRoZSBtaWRkbGUgYW5kIGFzIGEgc3VmZml4
Lg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

