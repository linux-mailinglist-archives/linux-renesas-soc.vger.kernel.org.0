Return-Path: <linux-renesas-soc+bounces-15934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A992A887CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 155E8178755
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2238127B517;
	Mon, 14 Apr 2025 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Phs35Z8X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF617D2;
	Mon, 14 Apr 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645992; cv=fail; b=Ed/cRzfdgXZHOOhv356TBklZQ1v9lQ1j8tfeWIRkGdrY7E1y7gXqqoqQYqYho3ag0ozEm4V6gNQ5dBF9CR4cT+RbefeioPF95Aq6aIxcPUmIE7a5k757dxZxOX6s9p+hwaMHYTtxBY7JFfX2gMx6DFE5ijKahzf9SiTvPa+5Cv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645992; c=relaxed/simple;
	bh=T+DxcENB32p6jfwVBeW+aYUHAEuI9w1foTRkfO45E44=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YWVg8VgRlzB3TyB5/af0ctbVmc72LO3+eTnIavdZgI1jQfdYsnLWaO0VgfMazQ70J2/frX/S/tjX+gEgal7nz/eQ1yNdeQF5IlGymX0DBlezciT9wIGCvFud0wpem4VNQQYnUYkqnHc9INoIXmj000C9bxkHEBNkBlzzr+O431M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Phs35Z8X; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjV+oRPaGqAbMlgi0sTlgxn2F6Lba8U4ZhE1QoDbJUJCC9kqQTT7Cd9L0PdI7xlKTdZNxPzTaVaGmhXtSCxJCUpxE5Y+0VAAjyjSW2LdEEfN/5tLUBsJAmKtAtGrPnvE633VKMYeNF237U1B686oyAyQvkvex9DsSyyfRzXjL9joV7e5GZEyQLskEjKQyliFcE+W4gZOoGwWCG6yvvC4hePQw/hoZyDqBTAhrHwmn0JpNLU3yCctRyQVAr2ToVf6aYGhVoyHEIBWFoeAJ194tihmWuy30JtHathh+fePhT2x9xykmbDVrO4tNfRoHvKjLbcdS5mfqHTu04+q/LudfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+DxcENB32p6jfwVBeW+aYUHAEuI9w1foTRkfO45E44=;
 b=LJ9s6Lzoi2ynjeCHX24Ed0dkcUg8mITmWILy+1qrRjChINV+ekKuoukMq8NLsOlGaDu/E1iPYvA9+KpgflStR1vvFEYgATG2w4JmyVyWd0+k8MYN53f/WvyUUSUt5urTVjfOBn80W4nhwSvUYvG4AAvqX8ZYTIR5oD/q+9BawHcEYIViOfMuAhQ/zvx+ac2uxeTmWn+UxTtWtAk+Jj95zOta1tAYOFpa9lFva8T0ta3hg8t57Aete/xZMi6UGY+EywL84AqbIqpNyk6l5i7IgPRRXoQSkufH2r9bRcyw1Mcz+vWPxOC5bevTGZhhH0XkXPT8MszkIfUOUZ4yrbm6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+DxcENB32p6jfwVBeW+aYUHAEuI9w1foTRkfO45E44=;
 b=Phs35Z8XnhSc1GilX6OIx2umKI+zdKM8vFQmvvDJcl+GRClE3KmBfD9UeXsUmpMl0fc5pZvBs+sGWFVSM/D0335VVeTBKpq5fVeR0U9DBgpXkh7/8LUKRGaTRrER6ZpEstckybMIIsHaDqjpiencKcJ1IOQg8TMJmoyjp0exfYA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15270.jpnprd01.prod.outlook.com (2603:1096:405:27c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:53:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:53:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Index: AQHbmbbxy9rzBEdWpk2jTCL2tJSV7rOjczAAgAAAXGCAAAN4oA==
Date: Mon, 14 Apr 2025 15:53:02 +0000
Message-ID:
 <TY3PR01MB113460ED4CF3A66CBE22183E386B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
 <20250320164121.193857-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
 <TY3PR01MB11346958A838B887BB07FBC6786B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346958A838B887BB07FBC6786B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15270:EE_
x-ms-office365-filtering-correlation-id: 99c9663e-d493-498f-9d66-08dd7b6c707d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0p2ZFNiMWlHR284YWZDU29wZnZNY1U1SXlLd0pEdHpsWndrR21ndDNKUkV5?=
 =?utf-8?B?NkRQQU92NTh6dGdSdEk2R2ZRdDdwNjJURXdUNFc5ZWl5aUFRUGZhZCsrTDlh?=
 =?utf-8?B?djRrQjkwRHBIQkN6dEN6N0VYQjZxVlNEUDdLZStKS3FUbnZSWVIxYXlnUTF2?=
 =?utf-8?B?SGNqM1JNcXNSTk5DMklVaHdiam9XMTRucmhVWG9yQzdGUWlpUGtmNzA0OWVT?=
 =?utf-8?B?ajlhS1BUOElUZnB2ME5pc0Ztd0hTNWdSSVFSOFVpYit2OTZUSDcrUTdoS3po?=
 =?utf-8?B?aTE3TlZOUUE4YjVzaEpMWWVpczJFelRjVk0yb2FjMzNzWC9iVFlJRXExNjl6?=
 =?utf-8?B?RVZZcDl5ZU1hc3NPemU2UThPc1dJUDNidmo1RU1MZTFBV3h1TWNvT2F2UEh6?=
 =?utf-8?B?RDJlM2hDYmNsS2gwa3BkazdOcms4ZlN2a3p0a0pyd1JkWFRHY3ROMmEzdGFI?=
 =?utf-8?B?Rm5ocllSbVJhNnQ0WU9nOUF6ZWtnMFJaZ0dvVHpwc0VqNllESlVmQ2d6dVRW?=
 =?utf-8?B?TDdyWml0eXNOSnlablNuL3F2SE1ieVhLMTAwcXF5a1ArTW1ja2J0QmVnWWZU?=
 =?utf-8?B?L0svNkxwOHU5dmp1QStVdUZrcFNuZlFybC9iUHBLcFFhN1pLYkRvRWorNlpw?=
 =?utf-8?B?WW5kK1FMSkt0aU1USDRPSE8yV0V1NWMxTVhNc0dIbWhmSGFsczdCQU1Qem1y?=
 =?utf-8?B?VWs1dWRFTlh3OVBkRmdnaXZZTVI1NW9IK0NZRlNlbnpPOXVtNGY4WlNsNDJy?=
 =?utf-8?B?SEdKRi9XSlBZNTB6SEd6T2wydkx5MTA0MHVaTWpLWmY1aU1sQ0NESmNTUVlq?=
 =?utf-8?B?RVJ1dUYvbjNDeXYrMDRaeE1ic0ZNMG9yOGkzL1VacHg1ZHkzcFE1S0tLdHZT?=
 =?utf-8?B?c1dJTlYrbXRCRDdWd25XZHg0Wm8wcWFONktZRHpoQTUrM0hwcVRSeWk4eDZX?=
 =?utf-8?B?U0ZwejJCcnNRTVVXemhQOGNYdWVvZG1wdEw1NmFjYmtKVU10WDBKbGU4MXNk?=
 =?utf-8?B?NEJwdzVHWW1GZFAwWU4zUUtUaTZ0bkduT2QzeDVrUXdFQ1k2K2VSR1Nwa2RH?=
 =?utf-8?B?ckxIN0x5SFFhMm5iY3J4L2k4bTFZSEVUK05tN0E2b3dndFl4dXJ6SXpFTXJX?=
 =?utf-8?B?V2pBOEtlS3lsc2swaUU0YjdiU0NRRDhQMzJHQTFac2psdUNPcHREenhYVk8v?=
 =?utf-8?B?R1hFVzAzOThoZ1FUMHNpWGlqZCtNbVdjSmozRzNyMkNhRVVMdlNFemRHbVJn?=
 =?utf-8?B?NkwwUjd2aTJNZHU4OFJ3N1VlK1hQVTlKRWdNZGU3Y0RWUTFvRjNHY1A1bVFV?=
 =?utf-8?B?MVdVd20yV3VzVDgzeGpMUHJRc0MyNUNUb1R5VEQ4NkxzRXd6YnIwcU1FMWRs?=
 =?utf-8?B?NVJkN0NnbVg2K2tONVNJZzF4dS9jSHVtdzNEc1lvYzduRTEzUUc1UDU0RFRO?=
 =?utf-8?B?SURFdGlpMG5nSWJ3M21VQWt6aXJ0Qkc2OU1pRjU4cE9INVk1OUo5eVNxa0hx?=
 =?utf-8?B?MUwvTmlxZm9EOU04WFpLYXJ4SXdtaHFNTDh4Qks4ZkoxUHNYTlVHcE9Yb1FR?=
 =?utf-8?B?SmNCWjRFMnRQU0tvR0dodllUeGFhYjI0alpYaHVjbUw2ZTc0NjV0cEdDQ3hp?=
 =?utf-8?B?OWtFVUg3alFVT2pSeDc3c244TFBIaTVrcE5sNS9yUzNuYmVGaDVKcG5YV2Fh?=
 =?utf-8?B?TEpaVFRTZDMzSGlBMGI5R2RwQ3NtSlovTTZhcmhNWk92SW1qM015S1JBc3M5?=
 =?utf-8?B?MElST1QrM2x4UkFtM2N5dWJERXJHelVPMFRuY1JoVWRWTjBOVHFaOVU2TzlN?=
 =?utf-8?B?NDdtRVNyTkxtNnRkNnNiTUNpMjNRVmNXdy9zSU5NLy8rV29oOXI3MFNrMDdE?=
 =?utf-8?B?T2M2V2pHYVlCNHkweS85Y1RQY2w3SCthRkhOU3l5UVNVSVhkRGlWbGt2R0hL?=
 =?utf-8?B?Z00waE5WdjRraHpVWGdWNjR4WmZaRXIwbVcrV3JzckhmMDhHTzlucHQvZTZL?=
 =?utf-8?B?ci9ONnFodDRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmRDdXhMVUxJK3R4T3JFaDRSZStMK0MyVHNINVlTSzROTkx0T01rbTZncG1n?=
 =?utf-8?B?UkpuaWIzVEZLVkNQOVVoNWYrc0lnMkplT1kyWGZ6SzNRSzBGRzNQL1BWTnRi?=
 =?utf-8?B?R1ovMGt2WDB3TFEzVTM4Sm5lbGxUR1lSeGlxQUtGNy9JNGlwK1d2bXFmSXZm?=
 =?utf-8?B?RTBqMW56ejBpMmdUVnVKUENjQWMxTjluSDBEL2pScUNaSVUrRU1FakdRcDl6?=
 =?utf-8?B?ZHZ6QXZjRmxJVU1oT0VBQmNaNWNIUmlHSUl5TWY4MU02aERJQkZlZGNxTS9W?=
 =?utf-8?B?Vi9nSnVMNGNGanZFT1RCYXcweWxyZnRralZaVEpRWmNGb2htTnJzZDlOQis5?=
 =?utf-8?B?bzAwRk9rLzNWSmJ6VEEwUG1TT3QxaFpNN2lnVEVrT21kcGlMUklleTVvQ3Bt?=
 =?utf-8?B?U2grcUtzRmV5dkhUMnVsYjhnTHFzZVRQNSt3ZjlZOTVyY3JCZFh1cGk4cVdo?=
 =?utf-8?B?T2dvZnVJN2Iya0ROU0lHVU5sMS9QREVnWTZnQ0NXUEExZTBIeVlBQzBBK3Vy?=
 =?utf-8?B?OEJidzJnU0Y5eFpTOFlud3hTRVYxNGQ4UWhoVS9wdUVsdFg4UitCUis2eW92?=
 =?utf-8?B?K2pYaGZyNUFITnVLN3ltaGlyR25yWXF5TnRkVUw2b2JIRzl1WEtmYktqQ3ll?=
 =?utf-8?B?ZUU0eGppemhmRFVzdEs1a0NNNG9LOTVWMDlxTTFIblpVdzRDaGV2L3l4NmNT?=
 =?utf-8?B?aHhGZ0FDSStZSTZPbklTYzhyRkdsMmQ4ZXBKOU5aRkh6cy8zWEVSV240c2du?=
 =?utf-8?B?TlJzSHNON1FSblVuSVJkY0s1aEM4QSs2U2diRU5rdkVGams4bWMrKzZwWXdN?=
 =?utf-8?B?LzVxODFudjlwRU9qSFBmNmRXTUcwRmVvbWUrVERRNE12WVpXaHZKTmJqRWRV?=
 =?utf-8?B?L296ZjF2NDhjLzEzYXN6MUJHYmFxSmZQRlV5UTBUU0hJaTI1U3prOXNJWFBH?=
 =?utf-8?B?cjhoSTlobXdjemNWRkNBY3RxMWh0ejdyYTBIOERrdktya0tEblM3OVIzaHNx?=
 =?utf-8?B?NzV0anRjU0p2V1d6VDh5bGdwWVZFUXVGa3U1eTd4Z3RVVlc5aFZZZjR2eXY2?=
 =?utf-8?B?TC9KUFRJb2RiNnpyWW5FSjJOUnFmUENtTG8zTllYT2xZQnJqS0hzWWFnL0d6?=
 =?utf-8?B?dzArZGwvWk1xbVJ6ZVg0UjdVakthOVZ6dC9EK1RDUmpEdXdXeEJyU1pvTWVN?=
 =?utf-8?B?eVZzdTNaZFh5SHc2ZEo5MTZ3eG9IdXRNd2ZiNmJMSFVtWVl3QmNuL1Vva0dY?=
 =?utf-8?B?Q2EzWDF0aTk0b0U0emhWYStHcnF5b0pGbTJDL2N4RG55VDlLWmRCVFI0VHZq?=
 =?utf-8?B?cnJnb1BNYWpzYUptK2RLYklWaFRqcEJzT1pLNVdJRERLcWlvblRsNmhTWVA2?=
 =?utf-8?B?TzlVazIyZnlobjRzYUYxbnVMNk4xOTdpUWp3VjJ5cEJpeVZqUnRsV1pFZEN4?=
 =?utf-8?B?NmhyczJ3RDZValN6RUJCT2NTMGVFVFh4V3RlczV5VXRUZlJlcmNzMWphQ3U3?=
 =?utf-8?B?MFZJSUZWQ2wvNVZIUU00aUk5VFRROWpUN2ZGL0NwbmptVzc2SkZUc1BwZWFw?=
 =?utf-8?B?Mk9BOTNVWUlITVE2TGlpZm9UWXVRWmpwdWJneEVUZDgxaVpNZ3V3aVgzNjVJ?=
 =?utf-8?B?OHZ3aHVKT2NzcUZrZGFtc3RScXRBa2VVUHE0VVFVdlcrTzhpTEY0eTZsUGpJ?=
 =?utf-8?B?U1ZPcEUySTgyVlVibmJoRW1KSG9VOXB5ZVdUTDlaSXRjanZYL21XMjhJaU9O?=
 =?utf-8?B?cTQwVk5vQ1pmQk9zazdHcU43YTE1allWdWs2V0JvS3JQOVZIdWhNbm5GTGJj?=
 =?utf-8?B?cXlvRG1xZnE1ckR0bm1pMkFhRktlN0FiZ0dTYnRscDZCRzZyTEYzMWpXRG5r?=
 =?utf-8?B?MXRTV01PaEVVOGVMemozNlczSkxYVkI1dXUyak9CVDV3b096V0FBN1J2V0da?=
 =?utf-8?B?RlQ0dmhSUENHVU43Z0htMGd6ako2RGlad1crWWE4QitsRStUaWcySHNsNmdt?=
 =?utf-8?B?RXR6NmdKejhiYnptSE00dDNYLyt1aEU0bWRiTitKUmZUYktpZkJXOFBLUXJV?=
 =?utf-8?B?b0ZGQkRqaXJsc1ordUNRajdKVE91NEMzMU9oL0dQMFN3RjF1WVFwelJyOTZj?=
 =?utf-8?B?MW9kMGQ5eWxYTG1LQ3VTb0lDWHlBdDNVK2dKV2ZZbHV1ZTJSZ3o2WWxWakZl?=
 =?utf-8?B?dmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c9663e-d493-498f-9d66-08dd7b6c707d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 15:53:02.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcySjoUt++XCxNanlxWzaeITwk80mKK8POGecNbxceOYA/Y1z6xTihn2Jf4j3kxahw216LRqxsIeVKsqWn7wll5pw8qrHdhYL1fx9VdiTeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15270

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiAxNCBBcHJpbCAyMDI1IDE2OjUxDQo+IFRv
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBDYzogTWFnbnVz
IERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBE
b29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5l
bC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBQcmFiaGFrYXIgTWFoYWRldiBM
YWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47DQo+IGJpanUuZGFz
LmF1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMi8z
XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNDdlNTctc21hcmM6IEVuYWJsZSBDQU5GRA0K
PiANCj4gSGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+IFNlbnQ6IDE0IEFwcmlsIDIwMjUgMTY6MzkNCj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDln
MDQ3ZTU3LXNtYXJjOg0KPiA+IEVuYWJsZSBDQU5GRA0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0K
PiA+IE9uIFRodSwgMjAgTWFyIDIwMjUgYXQgMTc6NDEsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBFbmFibGUgQ0FORkQgb24gdGhlIFJaL0czRSBT
TUFSQyBFVksgcGxhdGZvcm0uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2MS0+djI6DQo+
ID4gPiAgKiBTcGxpdCB0aGUgcGF0Y2ggaW50byB0d28uDQo+ID4gPiAgKiBFbmFibGluZyBDQU5G
RCBkb25lIGluIHRoaXMgcGF0Y2ggYW5kIENBTiBUcmFuc2NlaXZlciBvbiBuZXh0IHBhdGNoLg0K
PiA+ID4gICogRGVmaW5lZCB0aGUgbWFjcm9zIFNXX0xDRF9FTiBhbmQgU1dfUERNX0VOICB3aGlj
aCByb3V0ZXMgc2lnbmFscyB0bw0KPiA+ID4gICAgQ0FOMCBhbmQgQ0FOMSBiYXNlZCBvbiBTWVMu
NSBhbmQgQk9PVC42IHN3aXRjaGVzLg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0K
PiA+DQo+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3
LXNtYXJjLmR0cw0KPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5
ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiA+IEBAIC04LDYgKzgsOCBAQA0KPiA+ID4gIC9kdHMtdjEv
Ow0KPiA+ID4NCj4gPiA+ICAvKiBTd2l0Y2ggc2VsZWN0aW9uIHNldHRpbmdzICovDQo+ID4gPiAr
I2RlZmluZSBTV19MQ0RfRU4gICAgICAgICAgICAgIDANCj4gPiA+ICsjZGVmaW5lIFNXX1BETV9F
TiAgICAgICAgICAgICAgMA0KPiA+ID4gICNkZWZpbmUgU1dfU0QwX0RFVl9TRUwgICAgICAgICAw
DQo+ID4gPiAgI2RlZmluZSBTV19TRElPX00yRSAgICAgICAgICAgIDANCj4gPiA+DQo+ID4gPiBA
QCAtMzMsNyArMzUsMzYgQEAgdnFtbWNfc2QxX3B2ZGQ6IHJlZ3VsYXRvci12cW1tYy1zZDEtcHZk
ZCB7DQo+ID4gPiAgICAgICAgIH07DQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiArJmNhbmZkIHsN
Cj4gPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZjYW5mZF9waW5zPjsNCj4gPiA+ICsgICAgICAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiA+ICsNCj4gPiA+ICsjaWYgKCFTV19QRE1f
RU4pDQo+ID4gPiArICAgICAgIGNoYW5uZWwxIHsNCj4gPiA+ICsgICAgICAgICAgICAgICBzdGF0
dXMgPSAib2theSI7DQo+ID4gPiArICAgICAgIH07DQo+ID4gPiArI2VuZGlmDQo+ID4gPiArDQo+
ID4gPiArI2lmICghU1dfTENEX0VOKQ0KPiA+ID4gKyAgICAgICBjaGFubmVsNCB7DQo+ID4gPiAr
ICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4gKyAgICAgICB9Ow0KPiA+ID4g
KyNlbmRpZg0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiAgJnBpbmN0cmwgew0KPiA+ID4gKyAg
ICAgICBjYW5mZF9waW5zOiBjYW5mZCB7DQo+ID4gPiArICAgICAgICAgICAgICAgY2FuMV9waW5z
OiBjYW4xIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczRV9Q
T1JUX1BJTk1VWChMLCAyLCAzKT4sIC8qIFJYICovDQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoTCwgMywgMyk+OyAvKiBUWCAqLw0KPiA+
ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAgICAgY2Fu
NF9waW5zOiBjYW40IHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxS
WkczRV9QT1JUX1BJTk1VWCg1LCAyLCAzKT4sIC8qIFJYICovDQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoNSwgMywgMyk+OyAvKiBUWCAq
Lw0KPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPiArICAgICAgIH07DQo+ID4gPiArDQo+
ID4gPiAgICAgICAgIHNjaWZfcGluczogc2NpZiB7DQo+ID4gPiAgICAgICAgICAgICAgICAgcGlu
cyA9ICJTQ0lGX1RYRCIsICJTQ0lGX1JYRCI7DQo+ID4gPiAgICAgICAgICAgICAgICAgcmVuZXNh
cyxvdXRwdXQtaW1wZWRhbmNlID0gPDE+OyBkaWZmIC0tZ2l0DQo+ID4gPiBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiBpbmRleCBmZDgyZGY4
YWRjMWUuLjFkM2E4NDQxNzRiMyAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRzaQ0KPiA+ID4gQEAgLTI5LDYgKzI5LDEw
IEBAIGFsaWFzZXMgew0KPiA+ID4gICAgICAgICB9Ow0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4g
KyZjYW5mZCB7DQo+ID4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICt9Ow0KPiA+
DQo+ID4gSSBhbSB3b25kZXJpbmcgd2h5IHlvdSBzcGxpdCB0aGlzIGluIHR3byBwYXRjaGVzPw0K
PiA+IEkgYmVsaWV2ZSBDQU4tRkQgZG9lcyBub3Qgd29yayB3aXRob3V0IGFkZGluZyB0aGUgQ0FO
IHRyYW5zY2VpdmVycywNCj4gPiB3aGljaCBpcyBvbmx5IGRvbmUgaW4gdGhlIG5leHQgcGF0Y2g/
DQo+IA0KPiBTVEIgcGluIGlzIGFjdGl2ZSBoaWdoLiBJZiB5b3Ugc2VlIHRoZSBzY2hlbWF0aWMg
R1BJTzggYW5kIEdQSU85IGFyZSBjb250cm9sbGVkIHRocm91Z2ggYSBzd2l0Y2guDQo+IA0KPiBC
eSBkZWZhdWx0LCB0aGV5IGFyZSBzZXQgdG8gR1BJTzhfUE1PRCBhbmQgR1BJTzlfUE1PRCwgbWVh
bmluZyBTVEIgcGlucyBhcmUgcHVsbGVkIERvd24uDQo+IFNvLCB3aXRoIENBTiB0cmFuc2NlaXZl
ciBkcml2ZXIgc3RpbGwgd2UgY2FuIHRlc3QgQ0FORkQuDQoNCg0KVHlwbyB3aXRoLT53aXRob3V0
Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

