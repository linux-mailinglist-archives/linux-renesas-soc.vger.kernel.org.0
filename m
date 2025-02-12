Return-Path: <linux-renesas-soc+bounces-13058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF32A32170
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 09:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F32657A2154
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 08:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54C21FBCB1;
	Wed, 12 Feb 2025 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FWD/Mn2N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A27204C0C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739350194; cv=fail; b=k5xzOli2oaYoyICKm0xhsx6GTbbyh8yMZr4iXmcvpV4rEdry+2qZmQb29q6BjzTei7KwGupVj1tqRd1ThZ/XPpQbZN5Uial2kWEqT0Z0wNWVAKAbDd6Az1ef91clamgG71hS2gbxju8ygEm4TWdRhg83J/uvrKwIKcND0uENIn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739350194; c=relaxed/simple;
	bh=UIX4sHSn7gC/PuHSgohEVopVpXjaK7zWjiasmCkKuk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y5y8XFuwFwFxoLBy4rxJ4kMjXA494E/fKxcAPU+rdk6CbMgjDP4J2/TxsYQ8VdJYXSt2UCpXDxJqZP++0UsAV9AzltzZJJs2zqPVhKeX6e9qNdAoDto9WY4gnGysVp7R1aNahYarrIj9H0nzSey2cErC98X+9ZJx8uNYbx1vy70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FWD/Mn2N; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDvfZRlxKLI5S4zic8ohq2fBD6fXL6REkZb6pbJAsj+vfBXcpnnXyh5V9a3lN3u8xjiyE4Z8pY6UuRJ+faKroXv5G8DaJ5r2grMf97cenx1EhAkJJ5lWV167ap+EkijcUVKp+VXslvawSQqPXZnaCIdLURcgktc3Zxu8imOdyNq0LIZeftvjRc9GJlsX7/8pAe7NYwNDfME53uvkL/ASXZ9MZSACfGDJlQbni962Gup33RmcUAmATZ948i6waCCzRkZQdgCR0WqWtpl6jtMDKaxcjHID/YjWpVf9nhviK6wUAY/Fnjhk5OSy7fTyZ7+87df72cbyBzUA7f9OsOg13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIX4sHSn7gC/PuHSgohEVopVpXjaK7zWjiasmCkKuk4=;
 b=BcnH9OvZOa/AMGAilYGKd5EX5AY809vUn24Nb63EWcWYfa5SEfMUfcYypMYpZ/kES6POfEb53a5k0/1m3E7xwR0Go00bVtDb8I9qZ97olCR/pnlZ//x1Lfpgl7iLyU0YMfKOqwYJUbuEc4qYlgiA4czBFiuiiakvZyjqhVEQ9jthSI32lhdahmCDk645N91V33wHchfvoFCj8EM+ohMXIiegxES01/43I8so8PLilHDB9pUd4CJElzsIDHcIZdXNuwOy8nFU5aUehDYcXxstO84q1W5SEFjCRMcj+WfPwioE2Bd8K5eoUcQok2M+8aPUHxJDQ2qNNhBhIuYPIhZiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIX4sHSn7gC/PuHSgohEVopVpXjaK7zWjiasmCkKuk4=;
 b=FWD/Mn2NW3DXPvJKzWi/z0DtVzwZhu7C4lJ826tt3y//q7L7ieQv89FaxcWm4aN8svlfUgj8n+ngO4iryGv3EqA3SK3Q2IXDlg2rNXzAvC4a8mO/nbBc/DIA7SjozvMtuWywwOF8st5AqSSI+HNzeir924cpfWrNTfI7XdgCga4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15518.jpnprd01.prod.outlook.com (2603:1096:405:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 08:49:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 08:49:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Thomas Gleixner <tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 10/12] irqchip/renesas-rzv2h: Drop macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Topic: [PATCH v4 10/12] irqchip/renesas-rzv2h: Drop macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Index: AQHbeVStcgjoUlhYoUWGerm77TeBVLM73IkAgAeGtlA=
Date: Wed, 12 Feb 2025 08:49:46 +0000
Message-ID:
 <TY3PR01MB113461457BD52A04AC7AF5AA686FC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
 <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
 <8fb03758-d256-4e8d-aacc-e97639892a33@omp.ru>
In-Reply-To: <8fb03758-d256-4e8d-aacc-e97639892a33@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15518:EE_
x-ms-office365-filtering-correlation-id: c5791ea9-011b-4f07-c305-08dd4b423396
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDJkOS9TZ2VyWFVrVjdSaU5JY3RPd1FqK01lNDNsM2ZSZTNQZWNyTlNqcUxr?=
 =?utf-8?B?WVJ3K0haamVBQnliaUdLMlpNdmozcmFIWFVsL2hzcXdGVUVyMitkSFMyWWRL?=
 =?utf-8?B?ckdVNWcwYnprTFcwTVFCcG1hNUtkTWgyOWRoc3BmRnY1Q0RQOXEvQjRSSGFp?=
 =?utf-8?B?RkRrVUJEc2dNUWt5SlRET1c4MzQxVGRJSElCcHFrQzlnM2JNQ25wQU8yZkpm?=
 =?utf-8?B?Qkp4OVl1Q3pBd05QZ0xFa1h1OXZZM21zdmZ3Y2dJYUVjTnZVd1V3Z0J1US9n?=
 =?utf-8?B?eHZGeGxFcUlEY1RBamZKWS9GQUxtSHRiTXVVRlhqdENYM2NXd0V2WXF2Mjlk?=
 =?utf-8?B?UGQxZ0xOeXRkTm1OV2ZkN1dGdkM4dFNkMTlmNGJ4d2YxbWtvRmR6Q0ViQW9M?=
 =?utf-8?B?TDh4MHVvenBTOERYT3JnbVJKTS9tcU9GQSs1UzNVSkg3UlU1a2o2UnFFNjBZ?=
 =?utf-8?B?UUFPZ21rcHY4ZnhQakFTQ3JEMUVVNFE1STgxQllPT2dQQWtpWHRNaFFKSUw5?=
 =?utf-8?B?RWl3NE8xMnJ3SzdiLzUvVlVLcGtOVjhOcmh6VkxVWnpGMlNoOG1McWpIZXRp?=
 =?utf-8?B?NGhPSXQ1V3dyTkhpalVEY09CMmNmVTFCakdobDM0dHdROFhmdnE1ODNsM0FT?=
 =?utf-8?B?M1F2U0psYTJuTWIzM1B2bEg4dzdPMzNIbk9GVkY5K2RJMUFDME5ueVNNNFZS?=
 =?utf-8?B?aEFLbDlzTGRuZ0NIczhjQ2lwWGt1aXBsR1psdnNYYm1pRHZFeCtsVXM0emFv?=
 =?utf-8?B?bU04T0l1Mnptc09pV0hubSt0WitDVS80bnQyejRYMmZEci9kdEt6RzJIeVZu?=
 =?utf-8?B?RzJJdkNrQisyamMxa2QrOVRqWWFCRitIV3kvRjg3Rk1ZSXF5dFdaRXBNakJ2?=
 =?utf-8?B?bFYxUmxYQ0xNVU1mU0U3Mm9xK0JtQmpZcGZYY3A1OWZQcE1hUUU5elZpMEky?=
 =?utf-8?B?V29FWm56SFZwa2VLWXZ5WUw0eHlrcDRWRTZrSjQ5TGFjZC9HVmU4UHpIWjEw?=
 =?utf-8?B?OEx3cGkyME96cE9xU1NpUkhDOG9XZ00zL0VTSmVsUTJQMDNwbkZTd0FjRDB2?=
 =?utf-8?B?bThlMWsxUmYxa2pjSG8ydWFnd3I3S25BRWM0TUgxRlJRNmdQZ3lCWk96aUxK?=
 =?utf-8?B?UmthVklnT29ZWmNTdm9lZTlJTlh6OW5uUy9BNVhoNkczNXhVZDUxSXpqZWkr?=
 =?utf-8?B?T1ZISGpsV1V1RXBGRmpRaTVPU3ZPU0JoN2lWRFRFdFRGRWNKVU5xZHhMTGk3?=
 =?utf-8?B?elNFUHBGQ0ZOY2RXOER1OHNsODg4cldmOW5uakVYUzFmZkFsVjZPUkJKMEtK?=
 =?utf-8?B?TWxPUGI5bzM5S3VSTXhtTHk0V2tPOUVudnBCSG9PZFg0YXRiUVRpNDBCRWZy?=
 =?utf-8?B?cHM1R3QwdVRoa0d2WnFkaVNDQ09VTEY3Qm4rd1FOcHRLcC9LWlZhdXl3OHZN?=
 =?utf-8?B?QVk5TnJVcjBuaXNyNytSV0NCRkEvL3lUM29zd213YkgrOUEwVGFIa1d3NlF4?=
 =?utf-8?B?ZTJJSGFWQ21QMWdOUzF2R0FyNkpDQ3VtbUpZRk1jaXoxR3UyWk5naERyaXo2?=
 =?utf-8?B?T1M4OWxKbTIxbFpaSjlQQTRBUEJqMXNOcHVnRVRqb1JWQ2J0dzZHUW9tdEtP?=
 =?utf-8?B?cVdvbEdVZkRqc3pubU1CcW1CNzdKQWw3dk1peXluWG1JYklmU3BsM0htM2RV?=
 =?utf-8?B?NjdQV1hFbUhEa0tSU1pTUWsyVnFLMXl0b2pOcWlaNkM4cmx4dk12dWxhWEgr?=
 =?utf-8?B?c1FITjVBV21mZkt6UXFpeHlvN0ErWFdieklPVlU2WThUZ1dQL3pxZ3VLRzlG?=
 =?utf-8?B?Y2tpSUt5QUJZZ3RxaGZiVVQ0aXRSYkplVEdBaVdlMTVSWTlnUm02dHJMeEFp?=
 =?utf-8?B?c3JSKzJSdFZPczIyREE2cmM0ZHR0R2NPVU1teHFKRTVtTVRsTFg2bHJhN2Uz?=
 =?utf-8?Q?BxWOUFp+ZRDWnc/mWej4xhA9zINgcf0G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFVuY3lNVG14bnF2UnI3ZDFnNDZ5RnkzcDNxZU5sV2VQVk11VStkY3Jaemh4?=
 =?utf-8?B?d3Y4ejg1VUhZSGplTWJPYkJnRnlvczlVa2taZGVrQ0NOZGFidVh1TkQ5TGp0?=
 =?utf-8?B?cVFraGJsVWFQSDhHTVd4QTRSY3JOV1ZxTDQzenJWd0FQQ2daTkRPQnpUaTYx?=
 =?utf-8?B?RGJiTTZIMUpzVFZOakp1K2dObUYvR0ZOUE0xRXQyRkFGTWNOSDllNnUxTk4z?=
 =?utf-8?B?YnZqSFJXbW51UFJCT0NCMVJpTGtWbGx0bURadnBQVWgwbWxUbVo2RlE2WGFN?=
 =?utf-8?B?bEc3SG82S05BMFZ5MzVCbnhjdkZjTzhtT3UxK0VpNml2TGNzK1AvYzlHc2Iw?=
 =?utf-8?B?b2prM0tWZ3FZR0ZZZE5uVjYyL0gyTWZkdmRkY0I5Snh3VDFGMFd5OTE1b2wr?=
 =?utf-8?B?bVlZWitra015VEZNd1lVU2FlTEFvUFVrTmkydFJCWGxha2JWTXdNcGpWeUpJ?=
 =?utf-8?B?c3F1TlBWU1FJL0pLYmdaV0Y4WllxTzZxVEQwd1BydUZVKzdaOXdQVWdXajNZ?=
 =?utf-8?B?cmNwOVlKK0dHUTN4bU1BbU1XUGlzTk93Snh2UzJEdklRNGtOWmZZMElkL05n?=
 =?utf-8?B?cUtZT1hPdmVQcnY4TC95NDBrM1FjYUQ4RnczTUV4ZFNOT0k1TjkwLytkL1Rp?=
 =?utf-8?B?VW1pNWpBN2M5UHdZL2owSmVkRHF0c3A4NUdublZvZEMvZTRMTkpxR1dKNkVP?=
 =?utf-8?B?amNCeWxLQTAvWU93UXpKdTJiK3lhV2ZCRUdWQ2R5K3B5NzJCS3gxMWhZOThH?=
 =?utf-8?B?UTFPNTFPRk8wbXdpZ3U4K3dhT3NwV0RXc0U1elBFbTBRa1cvUFUxZktFdTB1?=
 =?utf-8?B?WHYyN0dKLzJxMVJoL0ljb2p3K0FwTGp2OVpIZHRSWERGc0tmRGcvTHhvVlhU?=
 =?utf-8?B?STN4elhxRDJHMElLN0pRcTVPRHcrRkhCOXNlNjh4OTNKc3RSY3FTRU94OUJi?=
 =?utf-8?B?YnpmdGcvU1JHaS9Sd25CeVhZQnFLSHY1Qkc1UmRabUZ2a2VGUW9HZkdhMmdI?=
 =?utf-8?B?Q2MxYW8xcUI1anYzSXU3ZlVLVENFMVlHL2F6SUllZitsVXJKcEUwY2ljWUJj?=
 =?utf-8?B?NlF2blRRdmNzUjNoQ2xGaVRMYVNLYkhmS0ZqRnhvcnRZRW80bC8zMGtYVDMx?=
 =?utf-8?B?aWRuNU4xNGhpUU5mRDNHbUw3UE5qc041NTVpMEw5bkZ3Yms1NTZEOTY3OWlj?=
 =?utf-8?B?UE80NU91M1NXZVdad3RpTWZWZmwwU1pId2ZYb1JyQ2ZjNFp3NGRqNlB1Wkox?=
 =?utf-8?B?S0NoTXFBQ3o0QU9Yckhhc1NBZlFWdmM5MitacWRzUTQ3UW9IVm1DRlUxekdI?=
 =?utf-8?B?MllFcXpiOGhiV0ZWY2xHM2JLL2d0NS9QajFSZEJhYkpmdU1jSWRXNysvd3ZL?=
 =?utf-8?B?ZHlWZnd0MkJZZU5KUVRNckFYVThtUVcxalhZamxuVndYQmRodC9SNDlkUGI3?=
 =?utf-8?B?dUVQN3hxd0NKNWNaSzhqN2J3eWRIZHpmZGJqS08yYlFFUWdHZ3BJOHY2R3Qv?=
 =?utf-8?B?K21CV1QrZ1VpTHFEc3k0dFlRSUNsRGYzWmlFUjEwY1FjYXlyOHNXMVRmQWw1?=
 =?utf-8?B?Tll5WGQwTzZEdmRuNnpGdWtoMnM2T0kveTU4ajI0d1VHQW1yRi85amhYdEg4?=
 =?utf-8?B?OWZDci9MMytYa2ZUSEZRZ0wzQ1VLRHJJUnFsczI5UXc3OXlMUjh3ditXREJ6?=
 =?utf-8?B?QXlZSk1uTEkxYWU2ZHpEcStLakluaS81QlQvTzRFS09KcDV3UVpHTG5MMExM?=
 =?utf-8?B?MUt0Slo0b1pacU55QXdjazJRL2lUMzZhZDFCaDhjYlR4WTZSb3ozUldJdXBx?=
 =?utf-8?B?Um9Qc2J0eUJOUlBZN0htdHVuVEZQK2VUakJia2R4S0pDem5GY25vWEN1Rngr?=
 =?utf-8?B?cDR4UDJCL0wyTVZWT3BPTWdIM255bEtHTVEwT2xBV2pKTlU4WDB6cXhwUmJD?=
 =?utf-8?B?NDNmUEw2K0ZPMUJILzd4ODB4bUFZNEprT2I3MVE4VEJEa3RRZjBwOEpBQ0xC?=
 =?utf-8?B?NFQ5SnV5ZHN1VnVIQmFaL3pqd0VMb2g1MU5yTERadVFiOWVxYnlvQVhnWTlj?=
 =?utf-8?B?c3o1SHd5ZG82c0NqakErMURHY0xqR3pNSVdhUlNGS3Boa2hUU0RWQnJzWWVl?=
 =?utf-8?B?WUVRTTFYY2t5eXoxSStsSnY0N3RxZFVrY3pETy80ZGxYQUpJd0dzVVRsbVVJ?=
 =?utf-8?B?VVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5791ea9-011b-4f07-c305-08dd4b423396
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 08:49:46.1529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtY0lOwMcCez9Rsc9SlHVi1lq1KzRXRq8nti1V8Y4B6xvBMjWF+xWZiTP7MLom5EQTJ+XoEAs4IRKLKHgPo2LVbeWA9qeesEgMVsV/YgtQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15518

SGkgU2VyZ2V5LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1
Pg0KPiBTZW50OiAwNyBGZWJydWFyeSAyMDI1IDEzOjUzDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMTAvMTJdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogRHJvcCBtYWNyb3MgSUNVX1RTU1JfVFNT
RUxfe01BU0ssUFJFUH0NCj4gDQo+IE9uIDIvNy8yNSAyOjM2IFBNLCBCaWp1IERhcyB3cm90ZToN
Cj4gDQo+ID4gT24gUlovRzNFLCBUU1NFTCByZWdpc3RlciBmaWVsZCBpcyA4IGJpdHMgd2lkZSBj
b21wYXJlZCB0byA3IG9uIFJaL1YySC4NCj4gPiBBbHNvIGJpdHMgOC4uMTQgaXMgcmVzZXJ2ZWQg
b24gUlovRzNFIGFuZCBhbnkgd3JpdGVzIG9uIHRoZXNlIHJlc2VydmVkDQo+ID4gYml0cyBpcyBp
Z25vcmVkLiBVc2UgdGhlIGJpdG1hc2sgR0VOTUFTSyhmaWVsZF93aWR0aCAtIDIsIDApIG9uIGJv
dGgNCj4gPiBTb0NzIGZvciBleHRyYWN0aW5nIFRTU0VMIGFuZCB3ZSBjYW4gZHJvcCB0aGUgbWFj
cm9zDQo+ID4gSUNVX1RTU1JfVFNTRUxfUFJFUCBhbmQgSUNVX1RTU1JfVFNTRUxfTUFTSy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gWy4uLl0NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVu
ZXNhcy1yenYyaC5jDQo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYw0K
PiA+IGluZGV4IDZkMWRlOTI3N2M3ZC4uNzFkMDY4MjBlNTk4IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gKysrIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gWy4uLl0NCj4gPiBAQCAtMzIxLDggKzMxOCw5IEBA
IHN0YXRpYyBpbnQgcnp2MmhfdGludF9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2ln
bmVkIGludCB0eXBlKQ0KPiA+ICAJZ3VhcmQocmF3X3NwaW5sb2NrKSgmcHJpdi0+bG9jayk7DQo+
ID4NCj4gPiAgCXRzc3IgPSByZWFkbF9yZWxheGVkKHByaXYtPmJhc2UgKyBwcml2LT5pbmZvLT50
X29mZnMgKyBJQ1VfVFNTUih0c3NyX2spKTsNCj4gPiAtCXRzc3IgJj0gfihJQ1VfVFNTUl9UU1NF
TF9NQVNLKHRzc2VsX24pIHwgdGllbik7DQo+ID4gLQl0c3NyIHw9IElDVV9UU1NSX1RTU0VMX1BS
RVAodGludCwgdHNzZWxfbik7DQo+ID4gKwl0c3NyICY9IH4oKEdFTk1BU0socHJpdi0+aW5mby0+
ZmllbGRfd2lkdGggLSAyLCAwKSA8PA0KPiA+ICsJCSAgICh0c3NlbF9uICogcHJpdi0+aW5mby0+
ZmllbGRfd2lkdGgpKSB8IHRpZW4pOw0KPiA+ICsJdHNzciB8PSAodGludCA8PCAodHNzZWxfbiAq
IHByaXYtPmluZm8tPmZpZWxkX3dpZHRoKSk7DQo+IA0KPiAgICBEb24ndCBuZWVkICgpIGFyb3Vu
ZCB0aGUgfD0ncyBydmFsdWUuDQoNCkFncmVlLiBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lv
bi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

