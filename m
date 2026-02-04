Return-Path: <linux-renesas-soc+bounces-27881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJIxHS5Fg2nqkgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 14:10:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DFE635A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 14:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2849930479E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 13:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F7C40B6C0;
	Wed,  4 Feb 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g5NCDJ+F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1A3EBF31;
	Wed,  4 Feb 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210236; cv=fail; b=UH0Mbx3l60hm0GiCUXHsgcrGlfhtA4uikw7nEEUoWg+KKWAoyt6ncvoredOvJJjJxxuSKpvrHE/04XIWMKqbfWnY+J5rltLh7s/XQJ7lbMwyCBluENbqi7HBJtTnc3Hu0qRW8YUxGFIFIn96IlB605x5W6NLtz+5r/zRDdFZGNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210236; c=relaxed/simple;
	bh=AtMisHx/2+3xHInQY2DEkULivzyHAsMZSNxsEUbqNms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K5Px4FaTOOuWc28R1cg2PKZo7hl2CDpZ3qhHLK1vwgFy1wnS0ggxou8hGLWlU2prSJL20YicDcC/CDDFNGWMSdH2UeahASWorg5l4RLeVVvVGjhoSMIRU/2MD0gr0OU7SdYqwQQgWgqE3ZvrLUlVp04k5+hKEGnLqJpFfQ9Ozh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g5NCDJ+F; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwc5To44XeTAhBbpVrwOv4kUdyPEjJk87yJy79cryzHtuz0opAjDRd0aaRiOSPzfJZjBlh7kqBqZEEXO9mv1s7lcKOe4h1QtTNiKhm9UFaARUTxfrn6KVFWRYp/Fv3aBZ3YzVMDpN+BCERP08nGnwe2v5ewK8bdR/lYxcWO/VqIZDqmVZLFqQoFnMEpMZziVlLFBrwL7WfbhP3SwcoLF0Nl8q+IVzJa6btLjmQ0MuStmcr0EM/N8bqNEiohVN2PBphsXst6D12oiF4WC0+k6SZjV3aPvKazeFSoanKY0RwOPBjsRU3oYxEXjvfzEuI17/TqxViUCfXDk9AijY1J6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtMisHx/2+3xHInQY2DEkULivzyHAsMZSNxsEUbqNms=;
 b=PBRhyuV2c9CkCGXtbpU1WQldOxo/dSr3K9Yvn1tEd6pkQT8ZTd73AwEORAUe0YKAWdqvyeqKamvlluYDHSLgmLdiaXsP++cIJtPjFJEmrM8/Nxr61NbjZcom9/7cdj7fO0ij2IUWzGrwaAtxRlLELVAhukevT+NQEZQt+QrsvdQsr35Q5k1L8U6QKMpOUCfeaU6x+cZ6N6Bnemy2hxostgcPbnd4wcxEKQPF5xCBxN/LDWfKw2E6b1b75iMD25n0nIkZ6Tl+BShQ9pwBWtMvgE7aFpzP9WuMZ9SxhraSJUSkH8orfWMznOK65dZ46/LNe48zk9k8Bn2ChNWPi9wmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtMisHx/2+3xHInQY2DEkULivzyHAsMZSNxsEUbqNms=;
 b=g5NCDJ+F93VaDr4wlzRC4gbT4rM5/supbFb/hu+ZJ2xt4MT1AvLbDDYe8qu8/DMjJwi9lZAs4bjV5osf+Im4uNqNS/qmYmuo2vP/QS22VtpYaCx1TR2nF+S4d2LEPaaGFSAi4jN7o3KMP493OFYrCVCQO1JndmiNBs5fwyiR9JA=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB7040.jpnprd01.prod.outlook.com (2603:1096:400:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:03:52 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 13:03:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for
 system boot
Thread-Topic: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for
 system boot
Thread-Index: AQHckfWfxalaQTQtTUmt2nxwy1sHfrVyhS4AgAACW5A=
Date: Wed, 4 Feb 2026 13:03:51 +0000
Message-ID:
 <TYCPR01MB11332FCD36CC7FF10B8E0C5CA8698A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
 <d024e1f1-ab7e-4b90-9be3-a55e130c2b67@tuxon.dev>
In-Reply-To: <d024e1f1-ab7e-4b90-9be3-a55e130c2b67@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB7040:EE_
x-ms-office365-filtering-correlation-id: 88a000cf-feba-478e-1ec5-08de63edd832
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXFybW5ZQzJ0YmVjbkpIelh6dnd2clByaHdNSlVDVk05N0d0NjQyZjl6MlQ1?=
 =?utf-8?B?bDhlNU0zZFBzdjBLM0w3ZXp5eVRzQ3BVRDB5U2J6c21XMkg1cFRDYTdqQUJr?=
 =?utf-8?B?Q2lhOUhnM2gxQ3NndC9hZlF0cFo1VmJ2ZitORkFwbjY0Y2F1eWQ0THkyNDhD?=
 =?utf-8?B?aFpaM0VMc0k0cXc3eDJlNWNMWTRaRVpyb1RwOXhIZVUwN0ZtMGZZV0Y1U3ow?=
 =?utf-8?B?VVdGQkhrN3ZpU0FxT3BHWVlJVFpWbWhlSmZoVE4rc0NhK1YrRGRhcHNDd3VO?=
 =?utf-8?B?RXRpRU5FNzVFR1BqT1VjRWFzdWExaDFSbTM5N2I1ekp4bkltbkN2NnEyUlZZ?=
 =?utf-8?B?UW54aElySUk2MUVBRVZiWDdFalhsNGg4akRiRmxncU9qeWlaOHgySUZQTXo1?=
 =?utf-8?B?OWlaTnNYdE5kZDVKSnIxdnlvNWQ1VjIrMU1CbDJtL0UrQ0p3ZlRlUmk4QStm?=
 =?utf-8?B?b2FhdnpLNWllZ3JYczdBaVB6MFZYdGNhNWYyRXJ5d3ZjUnFtV0VMMkYwQm1s?=
 =?utf-8?B?NDI5ZkE5d3Y2ZWQwNGhZaU42WUVueGNTUjBvTTE4T0NrdEFyNUp1SG1HS050?=
 =?utf-8?B?WUl2L2QreTZ4Z08ydUpTN3JQc2hVMFd6VXVCcWNWSGpUTVI0ZENycUZKcUtM?=
 =?utf-8?B?d000bjA0OE85R254R3VQcnVLVHhPTm14SlNTOXJUV0QvQ2FxMHlqcDVuNUJm?=
 =?utf-8?B?Nll6WFpQUTRNZUw1ZGF4MDhFcVhtbHlURUorKzFQUjQ0UGZPYjZSVFZqRWFu?=
 =?utf-8?B?OWtjaUhkNXVKSnh5OFNUTHFzTnhDbGs3dVcvUGhoMmI0U2taSjArZVlGYzlB?=
 =?utf-8?B?N0pRUi9GNGtuWmt2c0N0VStrSEhFb09qUTV1WkpzQ2kvUitSZHZSL2ZJellL?=
 =?utf-8?B?QllXT1pEU2ZLbVEzRXlITmd3N2FEUnZUV2lVMG9odENtMkVUL0Z6Q3A0US94?=
 =?utf-8?B?bTdjeGovOWhsNE5mdDJ3ODNWTC9CYXk2ZDR0U0N2T0JqV1hTZmJYZ1ZqUDRy?=
 =?utf-8?B?c21nM1ZTVk9Nci8zMWRDclV4UnhVR0YzcUR0M3dSRklwZUdtY05WTDN2M2JF?=
 =?utf-8?B?dXhCN3B4VlhoNzN1alZob1pVeTlFZTVjZGJKdmszYVRzcS9zNngzK0Y2VTFm?=
 =?utf-8?B?eDN4UHNua2E2b1R2dG8rZVB5ZEZxM3pKME1XYWI5dGF5YjlMdkVTZi9EVFFy?=
 =?utf-8?B?TmpBTFJZTEtlRnZKMXJzOUkwZ1VNUkdCVzBmbStadzhLb3ltdURpUVJVL2hv?=
 =?utf-8?B?NUZYcmxBaGN3VUVKWWlka01HVi9FU2NVaXpIYzdXWG1RSlV0T2xJLytzcVlB?=
 =?utf-8?B?alZuY29JNWpnNUcwVU9pTXdvWlZlOXR4eGorZGVkUUZSVHoweXBHWlhCRXc0?=
 =?utf-8?B?S0tCcm16bmNVczQ4N3lmUWhGb29RU1BuYWFvQlFYSTdlbmFXT01zOWpROEQw?=
 =?utf-8?B?ajNYMkx0ejFkNkhOb1hTNUgwcUFKVjBXSnp0ZVdUcUhJOHdKcmdwdTRQODZV?=
 =?utf-8?B?RC9GNWwrMnJEU25VR1RIWWtubnRZaUZkdTJWMll5cmNIMVFkK1JVekJZM2ZJ?=
 =?utf-8?B?a1lxRldPbDNmWTdpU0pEaGxISktHSGs1QUZBY2JoTWM5RkdrS2lBWVQ2ZE9i?=
 =?utf-8?B?RjZDbDZrVHo1N3RhNVVGSkJkS3JHUURUVFdKNms2WC9IS1Y2aEFnUk9NM3pv?=
 =?utf-8?B?bkRpdW9OZzQ2dFBQTTJLSmc3WFpWQlZ0cm83V3BISmh4ZG5Tc0d6eFlUSm14?=
 =?utf-8?B?ZzhhK2tsZU14UEJCL056NWhlczM1NWJ2RmN4WG1MZldWd2wzUmtqa2JEUzRZ?=
 =?utf-8?B?MDlwaXlNT2FlbHc4L3ovT2FzcGhEZm93S0RBUmtnMjFvVlBZeWFjZmRXclNB?=
 =?utf-8?B?VEhrV2dqMjU4SStPVi9CTlo5WUxIS0E3MUhVTjU4SCtLY3hqcVVOd3JYZFNR?=
 =?utf-8?B?V3pxZmdqankvbEtFY2VYTVovSitNYnQ0QjFhNUk5RytZSGljY2dtMGQzMkNq?=
 =?utf-8?B?QzBYM2RKbm1oZ0tRd2V3TGVOVXIvMm1CWWYwNE1kZ0p5WHcxbDJWNDl1WTZU?=
 =?utf-8?B?cmVvbEJqdWxhY0oxTTgzMUF5NTVHaDlqZjZ2RzlkbW9CbElyQ1ZPYkJla0hU?=
 =?utf-8?B?WUowUnBNR205TWJSVnlsdWtqckNLV1NFNVJLeDczdFV3MkFma0FieGpDR3Vx?=
 =?utf-8?Q?0yYJ9ebmofZuF9JKHWZi+SQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVFNdmVEUERRNEtLUkRYVFNzNCt3U3p1c2VjOXZDNU41b21mU05ZQk9HM1Q1?=
 =?utf-8?B?N2RJdyttQjJEMjV3Qll5MyszS0tVNTNXWTlhWVJQVG9wNHloRnJLc3ZmS0Rx?=
 =?utf-8?B?NFVSUFhpVHNDOElyMGVkZUFSSDNmM1MvVk1VU29zbE1EYVJnVm9wdGtCSUJQ?=
 =?utf-8?B?MVZZdlpaOW1LdjFPUjJDN3NXejM2KzNvNXBSWmtQaDNEVVQraTcxcm5nc3cz?=
 =?utf-8?B?MEpQeC9nUDF1QURJVTRWZmE1cUsxV0R5M3VSY1JNTGZ5RWgyeWZLZGQ2NzhK?=
 =?utf-8?B?WlBtM2QzQ2QvT1NhZ2kyNVpJZTY3bWxEZmZJTXpHN21sY0pNRWxEd2dUMzJW?=
 =?utf-8?B?Tjc4N2wvMkg3c2tmdFl1NEpuR1JMamovWnBZRHdKYlhEdUtsRloxY2R0bnVK?=
 =?utf-8?B?UUJaT3ZLWXl6NVJVWVJlVThLN0RMRGhSbU53cjlzZ01sVGovTCtoNi93QU0w?=
 =?utf-8?B?d0owNS96K240WkNuMzVlVTNLM1hHVyt5YThSbVVwbGtGQlgrbGdEdjlYa1V6?=
 =?utf-8?B?UmJJM05abEF2MjIxYWY3VXdod1VtM0FCRXlCRkFHVldsYlVucDZlRHNuZVVj?=
 =?utf-8?B?bEVKbGp6OXNZY0IrTVRBUW1Mdk1QQmxSTWJBbWFwOUVldUJzN25TL0QvUExF?=
 =?utf-8?B?U0cra09XOEVJWlpaQy90RXhOWnRCV0NjV0xpNUNZSFhRWmVEbTZ6dW85bjEr?=
 =?utf-8?B?TmdMZ3c2ZVdQdzdjMmFyT1Ntd3JsTjFqMXJCSTYxWVZmVmo4MUhnRE5GcHFX?=
 =?utf-8?B?bmhyeS96Y0RPN1NENTFSOUc5dEZQY3NyMDF4NDZFNWxFN29NRkZhaVE1aTVI?=
 =?utf-8?B?NmhxOElRa3dCeGI4emdDb3ZDY2xqei8wS0phVlRCeDNKSEJKMjF0QlF4Mysv?=
 =?utf-8?B?dFFYMTh0ekJDRDEzVGZGWGU3MnlHc2xoTnhlYkdZY0ZQOGFpVE9Kbi9vOUgx?=
 =?utf-8?B?aWF3NzRPczhUNEZyemFhQzY1U3NXL3hnWjdONHlGcUxZeEs4M2trYXduRysw?=
 =?utf-8?B?ZXFiRHdpdVQwTGY3QU9uWlppaUl1aUgxLy91TzFyQ0tCWGtSanM1amUwNGcr?=
 =?utf-8?B?UEhCemgzazRBOWZzZEFCajZuZ2RzeHhPdXpVUXpkVG9wb0M4YnRDdVFSOGJo?=
 =?utf-8?B?Q1RpdGxCcWNiTkdSdjhKSUZOb0ZzMHNQcnE0U1NUUTk1R0FCd0F1Y2JKV1J5?=
 =?utf-8?B?QVlIZWl2NWJOZHJKeUIxaUFqUnU5SGx5QjZjZDhxYlZSWHQ1cy9PSXpOOUhR?=
 =?utf-8?B?cUY5dDd6MlczRmkwMmFTTW03aUlFM3hSdWQ1YzZmZ0tBcXM2VCtPQmw4T0tm?=
 =?utf-8?B?SkVKa0NRMVVhamRncU9YSWF4TzRZcDZRVEc4MjBWd2RSSVJnUHlEQThjcXR2?=
 =?utf-8?B?RXlJV1RXcmFPbXVGZjFEcHhFMlMzREZYMjQ0RE5MbGRIeGgrWFNpRElmQjA5?=
 =?utf-8?B?MUdYckExTTJZR2xWRHFLeW5hM1dIY0VBRFRLVjRvUE5BY083Y3BnSDBxQlRk?=
 =?utf-8?B?YXJ1TXBaRU9MODdBMXBxbGNLU200TU10b20vOVJJQlgxTnJKM1FyYlo5U3FB?=
 =?utf-8?B?Q3BWYnNwVEYyZ21mSGs4ZWtkSkFDKzRxdFRDQUN3YkE5b3lzNG5hODJWNXY0?=
 =?utf-8?B?R21QWW5YVjRHNVdXVjZ6SzhNKzFVL3BOY0U0cWQvMHB4dnlMUk5OczE0UWFi?=
 =?utf-8?B?Z1owRVYzVitKajhuZVp3eFRoWlEzckl1bU16Z05TcGJ3NVRLTllFSGFubVp1?=
 =?utf-8?B?SG52T0hnN1F1Rk1hL0xoaklCWHdhNzJrUTFxQUhad1ZYSmU2NHJGeFU5UUdN?=
 =?utf-8?B?MHNFQUdocTJtdTRuZlphUFhhWXNha2paV1BOcEJCNUQ2aHFhTUwxOWFEeGhK?=
 =?utf-8?B?bmhkVVBzLzEwWVY4NVJUMy9BZFE2OGx5NGkyYy9PSVVZa0RQdUZCM2I2NEpt?=
 =?utf-8?B?SERJSWN2VVh1c0Z5M2FaeUZDSkRGZElWTStIK3duQmFoRlV6YUQzQk0vWGVn?=
 =?utf-8?B?dS91Vms3eTJiUXlDUWM0TE5ZR212OXZlL1FJVGtHcEVRY003T2FJVWlPN0Qw?=
 =?utf-8?B?M2pBSFZjZnBzYnErUTNjbU5FdGI5YjVUelNGZFBuTVRTYkFFYWVlN040R0kr?=
 =?utf-8?B?RmhJQ08ybVdneU9IbmRQS091a2dpY2kwOGlZd05xVVhnTm5saFlUOHZXVmdT?=
 =?utf-8?B?TGJEa1ZoTEpJclU1dzlmclpJRlVrRHM3eVY2WWtLZVArWkVDRlUrUjJHWU16?=
 =?utf-8?B?RFZhdHBxamFhR1hlaVh0WTkyMytGTmV0YTdlbis2Q0U5cko5ZG84VXJoZHFs?=
 =?utf-8?B?ejZUdHJkZlljMVBVT0Q4Z1lRQUEvdnFwYnptU25EdDFYMUlaKzA2dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a000cf-feba-478e-1ec5-08de63edd832
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 13:03:51.7995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyHyWa36O30Ttnv5CQ3gjzLo3vEW/wNIxnWoiMHWIGNbwa0XsG3UHb+6J7oREw+Ot3HMg7gYZVRoHDyYxEzASSw8XF2cLtaavougQGs4rkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7040
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27881-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[tuxon.dev,gmail.com,glider.be,baylibre.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4F5DFE635A
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDQgRmVicnVhcnkgMjAyNiAxMjo0
OA0KPiBUbzogYmlqdS5kYXMuYXUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT47IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNaWNoYWVsDQo+IFR1cnF1ZXR0ZSA8
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+
DQo+IENjOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBjbGtAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJo
YWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmw6IERyb3AgRE1BIGRyaXZlciBkZXBlbmRlbmN5IGZv
ciBzeXN0ZW0gYm9vdA0KPiANCj4gSGksIEJpanUsDQo+IA0KPiBPbiAxLzMwLzI2IDE2OjM0LCBC
aWp1IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IEFzIHBlciBzZWN0aW9uIDQuNi4xLjcuMSBvZiB0aGUgUlovRzNMIGhhcmR3
YXJlIG1hbnVhbCAiUHJlY2F1dGlvbg0KPiA+IHdoZW4gdXNlIHRoZSBwZXJpcGhlcmFsIG1vZHVs
ZXMgd2hpY2ggY2FuIGluaXRpYXRlIERNQSBDb250cm9sbGVyIiwgaXQNCj4gPiBpcyBzdGF0ZWQg
dGhhdCBpdCBuZWVkcyB0aGUgYmVsb3cgcmVnaXN0ZXIgc2V0dGluZ3MgZXZlbiBpZiBETUENCj4g
PiBjb250cm9sbGVyIGlzIG5vdCB1c2VkOg0KPiA+ICAgLSBTZXQgQ1BHX0NMS09OX0RNQUNfUkVH
IHJlZ2lzdGVyIHRvIHN1cHBseSBhIGNsb2NrIGZvciBETUEgQ29udHJvbGxlci4NCj4gPiAgIC0g
U2V0IENQR19SU1RfRE1BQyByZWdpc3RlciB0byByZWxlYXNlIGEgcmVzZXQgZm9yIERNQSBDb250
cm9sbGVyLg0KPiA+DQo+ID4gQ3VycmVudGx5LCB0aGUgc2VyaWFsIElSUSBpcyBub3Qgcm91dGVk
IHRvIHRoZSBDUFUgaWYgdGhlIERNQSBBQ0xLIGlzDQo+ID4gb2ZmLCBvciBpZiBETUEgcmVzZXRz
IGJlaW5nIGluIHRoZSBhc3NlcnRlZCBzdGF0ZSByZXN1bHQgaW4gbm90DQo+ID4gZ2V0dGluZyBz
ZXJpYWwgSVJRcyBmb3IgdGhlIGNvbnNvbGUuIEZpeCB0aGUgaXNzdWUgYnkgZXhwbGljaXRseQ0K
PiA+IGRlYXNzZXJ0aW5nIHRoZSBETUEgcmVzZXRzIGR1cmluZyBwcm9iZSwgYW5kIHNpbmNlIHRo
ZSBETUEgY2xrIGlzIGENCj4gPiBjcml0aWNhbCBjbG9jaywgaXQgd2lsbCBiZSB0dXJuZWQgb24g
Zm9yZXZlci4gVGhpcyB3aWxsIGFsbG93IGJvb3Rpbmcgc3lzdGVtIHdpdGhvdXQgRE1BIGRyaXZl
ci4NCj4gPg0KPiA+IFJaL0cyTCBTb0MgbG9zZXMgcG93ZXIgZHVyaW5nIHMycmFtLiBFeHBsaWNp
dGx5IHR1cm4gb24gY2xrL2RlYXNzZXJ0DQo+ID4gcmVzZXRzIHRvIGdldCB0aGUgY29uc29sZSBk
dXJpbmcgd2FrZXVwLg0KPiA+DQo+ID4gVGhlIERNQSBkcml2ZXIgaXMgdXNlZCBieSBib3RoIFJa
L0cyTCBhbmQgUlovVjJIIGZhbWlseSBTb0NzLiBUaGUNCj4gPiBsYXR0ZXIgZG9lcyBub3QgaGF2
ZSBhbnkgaXNzdWUgcmVsYXRlZCB0byBzZXJpYWwgSVJRIHJvdXRpbmcuIFRoZQ0KPiA+IHJlc2V0
IGFzc2VydCBpbiBETUEgZHJpdmVyIHdpbGwgaW1wYWN0IHdha2V1cCB1c2luZyBzZXJpYWwgSVJR
IG9uDQo+ID4gUlovRzJMIFNvQ3MuIFRoZQ0KPiA+IGNwZ19zdXNwZW5kKCkgaXMgc3VzcGVuZC1u
by1pcnEgd2hpY2ggc3VzcGVuZHMgbGF0ZXIgdGhhbiBETUEgZHJpdmVyLg0KPiA+IFNvLCBkZWFz
c2VydCB0aGVyZXNldCBpbiBjcGdfc3VzcGVuZCgpIGZvciBtYWtpbmcgYXZhaWxhYmxlIHRoZSBz
ZXJpYWwNCj4gPiBJUlEgYXMgYSB3YWtldXAgc291cmNlIGZvciBzMmlkbGUuDQo+ID4NCj4gPiBX
aXRoIHRoZXNlIGNoYW5nZXMsIHRoZSBSWi9HMkwtYmFzZWQgc3lzdGVtczoNCj4gPiAgwqAxKSBj
YW4gYm9vdCB3aXRob3V0IHRoZSBETUEgZHJpdmVyDQo+ID4gIMKgMikgZ2V0IHNlcmlhbCBJUlEg
YXZhaWxhYmxlIGFzIHdha2V1cCBzb3VyY2UgZm9yIHMyaWRsZQ0KPiA+ICDCoDMpIGdldCBzZXJp
YWwgY29uc29sZSBwcm9tcHQgZHVyaW5nIHdha2V1cCBvZiBzMnJhbS4NCj4gPiAgwqA0KSBoYXMg
bm8gZGVwZW5kZW5jeSBvbiBib290bG9hZGVycyBmb3IgdHVybmluZyBvbiBETUEgY2xrcy9yZWxl
YXNpbmcNCj4gPiAgwqAgICB0aGUgcmVzZXRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNw
Zy5jDQo+ID4gYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jIGluZGV4IGY0ZGViNWQz
YjgzNy4uMTY3NzFhMDEwMWJkDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yemcybC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3Bn
LmMNCj4gPiBAQCAtODYsNiArODYsMTIgQEANCj4gPiAgICNkZWZpbmUgUExMNV9IU0NMS19NSU4J
CTEwMDAwMDAwDQo+ID4gICAjZGVmaW5lIFBMTDVfSFNDTEtfTUFYCQkxODc1MDAwMDANCj4gPg0K
PiA+ICsvKiBDcml0aWNhbCBjbGsvcmVzZXRzIHRvIHJvdXRlIHNlcmlhbCBJUlEgdG8gQ1BVIGJ5
IGRlZmF1bHQgKi8NCj4gPiArI2RlZmluZSBDUEdfQ0xLT05fRE1BQ19SRUcJMHg1MmMNCj4gPiAr
I2RlZmluZSBDUEdfUlNUX0RNQUMJCTB4ODJjDQo+ID4gKyNkZWZpbmUgQ1BHX0NMS09OX0RNQUNf
UkVHX0FDTEtfT04JKChCSVQoMCkgPDwgMTYpIHwgQklUKDApKQ0KPiA+ICsjZGVmaW5lIENQR19S
U1RfRE1BQ19ERUFTU0VSVEVEX0FMTAkoKEdFTk1BU0soMSwgMCkgPDwgMTYpIHwgR0VOTUFTSygx
LCAwKSkNCj4gPiArDQo+ID4gICAvKioNCj4gPiAgICAqIHN0cnVjdCBjbGtfaHdfZGF0YSAtIGNs
b2NrIGhhcmR3YXJlIGRhdGENCj4gPiAgICAqIEBodzogY2xvY2sgaHcNCj4gPiBAQCAtMjA1MSwy
MSArMjA1Nyw0OCBAQCBzdGF0aWMgaW50IF9faW5pdCByemcybF9jcGdfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAlpZiAoZXJyb3IpDQo+ID4gICAJCXJldHVybiBl
cnJvcjsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIERlYXNzZXJ0IERNQSByZXNldHMgdG8gcm91
dGUgdGhlIHNlcmlhbCBJUlEgdG8gQ1BVIGZvciBzZXJpYWwNCj4gPiArCSAqIGNvbnNvbGUgZHVy
aW5nIGJvb3QuIERNQSBjbGsgaXMgY3JpdGljYWwgY2xrIGFuZCBpdCB3aWxsIGJlDQo+ID4gKwkg
KiB0dXJuZWQgb24gZm9yZXZlci4NCj4gPiArCSAqLw0KPiA+ICsJd3JpdGVsKENQR19SU1RfRE1B
Q19ERUFTU0VSVEVEX0FMTCwgcHJpdi0+YmFzZSArIENQR19SU1RfRE1BQyk7DQo+ID4gKw0KPiA+
ICAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoIm1zdG9wIiwgMDQ0NCwgTlVMTCwgcHJpdiwgJnJ6ZzJs
X21vZF9jbG9ja19tc3RvcF9mb3BzKTsNCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAgIH0NCj4gPg0K
PiA+ICtzdGF0aWMgaW50IHJ6ZzJsX2NwZ19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikgew0K
PiA+ICsJc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIERlYXNzZXJ0IERNQSByZXNldHMgdG8gcm91dGUg
dGhlIHNlcmlhbCBJUlEgdG8gQ1BVIGZvciBtYWtpbmcNCj4gPiArCSAqIHNlcmlhbCBJUlEgYXZh
aWxhYmxlIGFzIHdha2V1cCBzb3VyY2UgZm9yIHMyaWRsZS4NCj4gPiArCSAqLw0KPiA+ICsJd3Jp
dGVsKENQR19SU1RfRE1BQ19ERUFTU0VSVEVEX0FMTCwgcHJpdi0+YmFzZSArIENQR19SU1RfRE1B
Qyk7DQo+IA0KPiBJbnN0ZWFkIG9mIHRoaXMsIHlvdSBjYW4gbWFyayB0aGVzZSByZXNldHMgYXMg
Y3JpdGljYWwgZnJvbSB0aGUgU29DIHNwZWNpZmljIGRyaXZlcnMgYW5kIGJhc2VkIG9uDQo+IHRo
YXQsIGRvbid0IGV2ZXIgYXNzZXJ0IHRoZW0gaW4gX19yemcybF9jcGdfYXNzZXJ0KCksIHRvIGF2
b2lkIGFueSBwb3RlbnRpYWwgd2luZG93IHdoZW4gdGhpcyBjYW4gYmUNCj4gYXNzZXJ0ZWQgYnkg
dGhlIHVzZXIgYW5kIHRoZW4gZGUtYXNzZXJ0ZWQgYmFjayBoZXJlLg0KDQpPSy4gV2lsbCBkcm9w
IGZyb20gdGhpcyBwYXRjaCwgYXMgaXQgbWFrZSBzZW5zZSB0byBoYXZlIGNyaXRpY2FsIHJlc3Rz
IGxpa2UgY3JpdGljYWwgY2xvY2sNCmZvciB0aGlzIHR5cGUgb2YgdXNlIGNhc2UuDQoNCj4gDQo+
ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgcnpnMmxfY3Bn
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHJ6ZzJs
X2NwZ19wcml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4NCj4gPiAgIAlyemcy
bF9tb2RfY2xvY2tfaW5pdF9tc3RvcChwcml2KTsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIERl
YXNzZXJ0IERNQSByZXNldHMgYW5kIGVuYWJsZSBjbGsgdG8gcm91dGUgc2VyaWFsIElSUSB0byBD
UFUgZm9yDQo+ID4gKwkgKiBzZXJpYWwgY29uc29sZSBkdXJpbmcgd2FrZXVwIGZyb20gczJyYW0g
YXMgdGhlIFNvQyBpcyBpbiBERFINCj4gPiArCSAqIHJldGVudGlvbiBtb2RlLg0KPiA+ICsJICov
DQo+ID4gKwl3cml0ZWwoQ1BHX0NMS09OX0RNQUNfUkVHX0FDTEtfT04sIHByaXYtPmJhc2UgKyBD
UEdfQ0xLT05fRE1BQ19SRUcpOw0KPiANCj4gVGhpcyBuZWVkIHRvIGJlIHNldCBiZWZvcmUgTVNU
T1AgdG8gZm9sbG93IHRoZSBNU1RPUCBhbmQgY2xvY2sgY29uZmlndXJhdGlvbiBzZXF1ZW5jZSBk
ZXNjcmliZWQgaW4gdGhlDQo+IEhXIG1hbnVhbCAoc2VjdGlvbiA0Mi4yLjIuIGluIFJaL0cyTCBI
VyBtYW51YWwsIHJldi4xLjMwKS4NCg0KT0ssIGl0IGNhbiBiZSBtb3ZlZC4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IA0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUNCg==

