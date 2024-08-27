Return-Path: <linux-renesas-soc+bounces-8363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E39608CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 199CFB23639
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DA019FA72;
	Tue, 27 Aug 2024 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XsL9ZB4c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6719E7EB;
	Tue, 27 Aug 2024 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758450; cv=fail; b=TIOH1BtRJbuM+O/ilH1jqd0RRy1zHJb1WutUOhWiNCPEHahHha5Ym3/ec/Xq0rWdLZAOjMXveuq1QSb3bLmh0vzD22xaGJ9efvIH2v3uYIE2fRICNGy2ZxKqDMyldeUmQNwCtelVM1k41WXyljtfneJ6+aiob2D80JKd2eYv7Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758450; c=relaxed/simple;
	bh=ke+O3GLZXieoF0+1lrt0bgeA4/fwrzOvWxzgpQ7hdg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nMlg4pgbnFqiuR79bKIdSi+t2TAZcwVX0ts6PcJ3SL7OqobZ4yPiM7zPkso/Zzi3Buze5clgMAjeLhv2qfBwHQTL8UZXoHGWXrYqMVWZafjJ0OfnI+QfkcPSSEikh31Hc1v0ryyOpJ/3yiu96UQYPFhPMaRF64aKWXni1e7Uggc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XsL9ZB4c; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlIqwOV6/KmAPJpNNBgKL8Psc72FERcVYLyTexZmtcvAK6iHxEHYqvg2w3fUpN+lIwSDFzlA1SeKvKEdZqILiZPvfSM/nzmO7FaggC1q+Py0+wUDft7lcC6sccT2Ex4vDBWcBX8qs3+LO78HLiqSjVWiStr1gdlom+7oBmHmNU3gHVmqfMwgUJMj0dg/XeKiOdUXn3w0CTWy4NozmrbwXFkcimHxpeUi3ZVKkPHfTtDY4NxxbK0bqP0QRPtQeMtxUBRSFHHoYPrBp98I68MjPycbONzPkTil1s9DtcIa2msA8now5bKSMY2zWYCduNy2SCEt3a7p8cC2kdf1uyZBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke+O3GLZXieoF0+1lrt0bgeA4/fwrzOvWxzgpQ7hdg4=;
 b=mKIFqdogEOGO5arcZuyxsFT1A6i0wZ/YurXNRpeWbqplzp4+sfOaU4nAqAzHCL+o2aAOd2/wD7CZBKRloPL38KMP2HPdgm/YjT12BEk5bcjfpztiVzE4M6UYjQLjkBlsJ81Q/w8ga5bUa5sk822EWQbm7DF6JpGugXI46jBV0d2e12jwmgr8mhYWpobLsRfrN02qCOqcMSmahHQq2SJuZ4tmxBdfunE5tbEXuk1PS2Rb5HmUOwgh4NHIxOeiBrMFNBOXo7tptGoRqJakZTdP8WlWfSxQKtsCI/MKhWGB3FhzXce8vAyy+z1y/cnhNG15e4xp53CLEEx+YjxYQvt00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke+O3GLZXieoF0+1lrt0bgeA4/fwrzOvWxzgpQ7hdg4=;
 b=XsL9ZB4ck9xMrI3OFzarNu1/+2O/jugJM5QeHpLG4U5SBCg9gHfAEqhUtIACcZq6TJPzHxGZNo1oCKzzK1EnIzdKWnkdxoe3ekyFG4ZK9oSXw+vqZORvHGPzPsgLkftFRp8S6pfwVpvQ2MeQ7mvveKXiEetfdFCBB7s2Aqgsk3I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12332.jpnprd01.prod.outlook.com (2603:1096:405:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:34:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 11:34:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Thread-Topic: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Thread-Index: AQHa96EVks8gXgWqqUaSRcZnhpp0+LI5ptmAgAESMACAAEGj4A==
Date: Tue, 27 Aug 2024 11:34:04 +0000
Message-ID:
 <TY3PR01MB11346242C491353B5E04A93B186942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134634E725C4E0EDCBCF3F90868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVYNTAGa8=Ci-4ibcBOz-Rnv9g61tPdC4frFUxj+sH+_A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVYNTAGa8=Ci-4ibcBOz-Rnv9g61tPdC4frFUxj+sH+_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12332:EE_
x-ms-office365-filtering-correlation-id: 73ca52ac-4aef-4a5d-a471-08dcc68c27de
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cExBZFY0SFg1SEdubkk1WksyODU2d1BzdkJFVGlwcFZFNllPMytJYmNaMlBa?=
 =?utf-8?B?OS9reFg1SE9nZUFxM2htaVRiM2lSenBtOXNUbU5HTFV3VUlHdWZoSU1OTUIv?=
 =?utf-8?B?RjVkbXpiSWpidHpweGF2aTd0alZnb0wzRzhwZXZQN1BjRUhLK0hGSW1wYlk3?=
 =?utf-8?B?V1NsdU9MdkpRem9CTkw4WCtwMTRxaVR2V2kxYjlyZEk4QXFiQUFMMStsOUtU?=
 =?utf-8?B?a3JhMTNESk8yVjFwZDdka1RtWWt5QU5IajFrckpQMTB5OG5rdm51WHk4d1pa?=
 =?utf-8?B?WHB6TTl6K2pnaWxHbUVXNmwwMVVwV3AzZVZ6L0s1eWt3SFBaU1VBSzZCNU1W?=
 =?utf-8?B?TXJWNSsrSHk1RTZadjhMOFI5OThZNTd5UFRUYkVMN1l6TmY0b1FweEZtK3FN?=
 =?utf-8?B?SmFmdS90bDNQbWFCakIyWjcwR0RTSlc3RjJYV1FHRjVidjA5VCtXdjVuNUVs?=
 =?utf-8?B?b1MxWHg0QmtpZ3hjUnh5UDdsa0RQMUxHZUs2cC9jajN3ZVVHYUowSzRjbGFj?=
 =?utf-8?B?ZWVML3E1My9aNVFSMjIySFI3K3FFakNCMERTVVpFVkZObGt3dDUwNFA5UitR?=
 =?utf-8?B?MEkwbGkzVXlvZXNWR3cyMkR2ejNuZHhmRVIwcmlLSi9HZTlRaHFrSk1tVlI1?=
 =?utf-8?B?Y2dydDczbStPeVk3SjlPQUNCbm0rMXdjMXdvTFpoUUgyOE9tVlA2OVRCc0Zl?=
 =?utf-8?B?NzR1UVdJalkvOVVDcjBwejg3cVFab2pseHh3dnlTWHdRNnZzZnRXVFA4Ukdh?=
 =?utf-8?B?azdYYjZ1V3dpdE03aENOd3haM25aU2NQZVU1bHpNbUtMK2ZJRm1oa0paNGFR?=
 =?utf-8?B?dHJsZkpickZtK05Ib2o2ZXI2djQrVWJqdlRSS3ErbkNRbnIvalFUZWc1Wjl1?=
 =?utf-8?B?d0pqZkltaDU0N3hiMlVWNVZpRUYzK2lzNDdWaDNBQmlEdmxmeUViTzYvRlAy?=
 =?utf-8?B?VXZKNi91VjlqUklaMTRQRE5CdW5aZHZpQUtGTC9xbmlMa2RlUS9MNDRETCtP?=
 =?utf-8?B?aGp2bHNkNzFNK0xzMFc1REFjSUxNVC84d0NjNkQxQkJFaVh2WkxlazJ0bDFn?=
 =?utf-8?B?TXBHbVIzclFFbmhQMVdjM1hOMVhHNlZGTENyWXlIdEIxOFp6bDl5MnZjejRj?=
 =?utf-8?B?aUladjRBaHZZQ2lPQ3FGTTZFQ1A5Y2lsbHRRT05TeGMyc3Fnb1dFUW93VTYw?=
 =?utf-8?B?YmQwT1ZUYTNuTEZxQXJqVzhOUm9DazBPZDZuTFNaVEJWZ3puTmsxV2xIbzJP?=
 =?utf-8?B?RlJSajRNSTg0WU9oSnJoNDhVaVd5R0I2cVVzYmIvK0thS25OKzMybGNDbWc2?=
 =?utf-8?B?UTlYZlNQTlRsanh0aTR5Z3d1WVNyRlBmNlZYcFRMZUlGNXBZSlFWYUdQTVlp?=
 =?utf-8?B?Q3Q3TGlKbXRZMnByaUs2d29hcFpXWnpXOVZqcDErak1uRFJ0TnF3L05JYW13?=
 =?utf-8?B?ZytSR1ZyZHdKa1N4SndlZG1WREFvTTZ0SHMyS2lxZytMMVBsaWxkbDFYVHlG?=
 =?utf-8?B?WDNFVWtRbjkzNmdOY1QvRWFUWkVzekdXVXpLZ0dzQ3dHcFJibjZGSUUzOTNu?=
 =?utf-8?B?Q041NUZOMDFORkhSZFcvRTdPUi9zNExhM3VHYzhOWmpnUDZyVUV2SmtFOGNv?=
 =?utf-8?B?NHB2dTN0SGVEajVWZkJHeXBnWmU4WHRQcjBwdHZ6V1kvN1dzQUlhVHgyd2pm?=
 =?utf-8?B?dG0yV20zZklhSnplb09XQkpWaXlZaHlZdFMxTGJubERnc1JnNFdtNXpuaFZK?=
 =?utf-8?B?Z0R0aUNLdTRaMjBoNXpMNURsQzdQN3luRlBDZ2xJUERMZENpdkZoRXdNaTlL?=
 =?utf-8?B?WUViR0JQd2ZIMjdYOEVOYXg2WGJjeXpmTFp0NU9IMndoc3hrQ05kQkpWOUlW?=
 =?utf-8?B?QU9hR0pGY0swT1pXRE1rdFB1MDIxUnlSNitmZlFsc29ydnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm5xcTVQRXNLOXR5TnNXQU42bkVQTnl2S2VOL2k1ZFVhTEhKZCtMclJGZVRk?=
 =?utf-8?B?NHVaSUtOeEM4OER6OVlaVDNKcG5kOFlFTGFId1VYZmpoSHBGbnBBRDFuTkhy?=
 =?utf-8?B?V2ppOWx1bUw4M1lZU2liRVNXLzA1NGtRMDU3R2F2cTN5aXBqZGdvSDFPTENm?=
 =?utf-8?B?V3BBUVliR204YXZ3bmVCSkhZNkpCdG5jTm5FOHNublEvamNDN09TQ244OUlj?=
 =?utf-8?B?aS9EVWNTOXdtRWhzYkpHMXhkcTdrWllhQVpiOFN5RVFlQjdrSWRYZmhuLzQy?=
 =?utf-8?B?Rlgyc3dLMjNkK0oxY2hlSzBzdWlubjhibHp2OTROaldHSENCOElhcDJSSlN5?=
 =?utf-8?B?THdDVFdBMkJSR0tlQlllTGtqbUxJbEwrYndlbC9rSTMxUm1Id1dNR0kzNXdM?=
 =?utf-8?B?SDVCZ3p4ZklwSnlubGFyU1RGZVhXK3h4aExiWjlCOUZ1RndaRGZUand0L0w1?=
 =?utf-8?B?dWZYMGNCTTJYNnF2TzYrSzRsWk03RXNYWlVHN0RhMC9xZGJkMElWbk5TRVZM?=
 =?utf-8?B?WUdtRXZkVXJqUDlNTlZSL0N5K1QwbmFZays3QXNCVy9mV1UrbndKVHdGTEVj?=
 =?utf-8?B?WGpyNGk2czRwS1RpUUhrbXFjREVaTXI0c3U5dGdYSUljMS9acmkySUNqRUFj?=
 =?utf-8?B?VFR2aHZSaWMyazMxMFV4Q3VpUHZtSVJXR0xCTXNCeUdVblBhQko5c1ZyNEpL?=
 =?utf-8?B?QUUrZzR3QXdPanluWjFEODhQdVkyQXhOK2VnU1cvT3FySW9jWkdUNXNXKzlF?=
 =?utf-8?B?OHlVb0VpOGNnTWZvZ2hTQTZrVC9tSkMrOGxvY0d3TlVKbWpSVjVURW9BYmxs?=
 =?utf-8?B?Y1QvajhwNXVlR3UvTjU1SzFocVEwS0FFQTRId2U4Q1hSdkZlK2FCbFJxTDg2?=
 =?utf-8?B?UjlmdmJwdmsydThGQ0RqN3p4WDdpVC84WSs0aGtqa2dicGZOWERSeHJMcVdq?=
 =?utf-8?B?NHJmT3lVaGM4bXZyaWlEK1orT0loeTVEOGx6WnM2VFc2R2Fvb3VJSDVlUGVx?=
 =?utf-8?B?Wno4UFVpdXJzUitzV0NMbnBLcmgxR0pvZXJib3VodXpEM0ZVeitUdGZ0bkxx?=
 =?utf-8?B?R0xDcjNKZXc4VjIvWEg4S1A2dy9ZNGtmUDhjNVpTV0psK0MwQU9hZWNhSWNP?=
 =?utf-8?B?eExKV1pUQUkrYkVuYTEwOUoySEVmUlZIRGRmbXhzMG13WExXSEp1Q1RuYkhU?=
 =?utf-8?B?b3lMUThhMGkySXRsU2JyNlpRK0lrMXV2cDZrTjdPeS85RTRwTVJYSHNxdlJq?=
 =?utf-8?B?aWwxaVNNWHhuN0x2YzRLRjU4L3BVQ0hPSy9BbDJ2MTd0NzhVbHBrT1MzSnNi?=
 =?utf-8?B?dDI2clNoemZRT09GQThwMDVKd0U1clFEQmNWelpNb1JlUGZaeEF6QlRqTXJV?=
 =?utf-8?B?MnZIZFlJR1dSYU5lbG9XWXMwd0VxWFRJRGtJSTI1YUZwYzlLaHA1dytaWW9Y?=
 =?utf-8?B?NmxYM2p6TlVXU2l1L3pHb0xxUXFyV2w1S2Z0TGEvNlAwUlUxOFpWTXQ2dzJW?=
 =?utf-8?B?ZEdUeG5lbXVibXR4eEtSbnd2UFhmMEw2SDJuS0lJZklPNnV4TUVFZERSK245?=
 =?utf-8?B?TGtHN29oTkE0VTl6aU9WTmdlTnpnaENETUZsekUwbDdUcytYaTM3bXBiNTU0?=
 =?utf-8?B?b0VwYzBoSC83eEY2N2VOVHpMZHNSL2lQTzY3VjZTQzhITW9qNk1vdXM0R1ox?=
 =?utf-8?B?bGNhU0NoZFN4bUh6bWl0Qi8vL3cwekxDQnpEaDJCY0Vhd0N5YUhpaVdVMHcw?=
 =?utf-8?B?cjA5YlhLUmVZUkpILzlIekdOcUNSREc4N3VhY0pJZ0tsYmQ5bkFhZmdmNEN3?=
 =?utf-8?B?SEF5eWs1alhlK0IzY0RMT2RsZ1VEY0daU0o5WEFKTkRYZFRrcU1sMks0U3Bs?=
 =?utf-8?B?bmU1Zk0zMGs1VllUSm0vWEFBU0hsV0NMaDRuYTVTdHc2YUVOOEU3WWRvVmpT?=
 =?utf-8?B?b1hFck51Rjhyckh5Wkt5ZkFuZktZRHllcnlrajIyVldxNmxCQ1ZWeWxpREl5?=
 =?utf-8?B?bkpVY1BhSUU1cmRrL3VwTDBxWW9vYjRtYy9QeWFjYmh3QnhKQ2ZlOXZxZjhp?=
 =?utf-8?B?Q0tMLzBYSzdGcTF5ZHl6YnV4N003Qmt1b0JVRFdZVG9pd1pCd005eVRsZWRD?=
 =?utf-8?B?U09WVGMyK2tINnhoVW1KbGtQekNTTlhRNU1XNng3Z0RtRHdGUmpERERqaDlO?=
 =?utf-8?B?WHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ca52ac-4aef-4a5d-a471-08dcc68c27de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 11:34:04.6329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGxuasT1WpTmgsWXbyC8F/VWmJUx+cPAMBW4YStHgk7Wg6VpwhAEmN+tG4O2td/2VHa2DRqsAuRmhC2hOQJtXM1merVOqxDXJh7eGZZYNPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12332

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI3LCAy
MDI0IDg6MzkgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NV0gYXJtNjQ6IGR0czogcmVuZXNh
czogcjlhMDdnMDQzdTExLXNtYXJjOiBFbmFibGUgRFUNCj4gDQo+IE9uIE1vbiwgQXVnIDI2LCAy
MDI0IGF0IDU6MTnigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gRW5hYmxlIERVIGFuZCBsaW5rIHdpdGgN
Cj4gPiA+IHRoZSBIRE1JIGFkZC1vbiBib2FyZCBjb25uZWN0ZWQgd2l0aCB0aGUgcGFyYWxsZWwg
Y29ubmVjdG9yIG9uDQo+ID4gPiBSWi9HMlVMIFNNQVJDIEVWIGJ5IHVzaW5nIERldmljZSBUcmVl
IG92ZXJsYXkuDQo+ID4NCj4gPiBPb3BzIFR5cG8gRVYtPkVWSy4gU2hhbGwgSSByZXNlbmQgdGhl
IHBhdGNoLCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQmlqdQ0K
PiA+DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2NC0+djU6DQo+ID4gPiAgKiBDcmVhdGVk
IE92ZXJsYXkgZm9yIEFEViA3NTEzIHRyYW5zbWlpdGVyIGNvbm5lY3RlZCB0byBEVQ0KPiANCj4g
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2Ni4xMg0KPiB3aXRoIHRoZSB0
eXBvIGZpeGVkLg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycywNCkJpanUNCg==

