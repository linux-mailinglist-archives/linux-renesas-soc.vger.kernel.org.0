Return-Path: <linux-renesas-soc+bounces-14054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBDA54892
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 287F97A299B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 10:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37E0202984;
	Thu,  6 Mar 2025 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pxOZ6/Xf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023032080EA;
	Thu,  6 Mar 2025 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258751; cv=fail; b=VOei25ZSBVoJ/wbATUchJLf2MzdMkoqjFM8FnPgcNq+zfBqFta/00lugheMmtA+Q4V7SvI3mSETmaFANCUNktylLMPl0B9xyUnSaomzOwYWwpC20FAbSlQJCi0y1TZL2G8taXBktiisXm0gAFBOBA3anI7DThkgZ5ziphgVK9Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258751; c=relaxed/simple;
	bh=TCSy7rbHVPsUG344oyc/Of137fYL9aiXj/ndt4yUk7k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bedUEl4ZsM1r2yg97wyB9bIQAOidYJ5r2QLqE5k4Df2ZKjwAoAzNYrxtBqkA+uT/T8/Cwr57RyeX7jgZsnI4btqZOC9xvJ2vErAxwvKGfY7XhXw/nE5g7eiqZmN2uEW8aNjioLwO7rV/8SKWeBmI9fTzD3VKDO6dU4W2lGTEnTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pxOZ6/Xf; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsmWHAmGKJnmf5nmdAvxEbQL2FdedJWEoDE79k39TqUVzLiNLhK+KMRlpPSHoeGZskZD8DKYx7r86Ga2f/JAt88WqtyBzJYyMnwFPFv2l2ZWHwBIcwOWFzRZFMjgwug6qzmW9lKrzugVMXbVqTuV03iHbv66aRJlWqrIVBwEqmrVk2Q0ZGmwIAPS7EL7UkPFggDmq+xkelIlRWYa11QLWn4s1tEgjRTsiHyJDcEWzCLaQ1cHus9SQs3u/ossImu6Pzn9N8VspBBdqsxuvQDB0Yi4zBrocx0sagfPwQ//P4G+NgvZIJ78X0oHKTBZt/J+yX25N9Ddo8+IbQPbuVpZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCSy7rbHVPsUG344oyc/Of137fYL9aiXj/ndt4yUk7k=;
 b=FdGKqkAEvxXS1HRNXZoYOE/9paCAzCcEE8ICRxCq+anmfGCso3mJ2ZLOnf21UK6iw8kh2eOiBkHEtC0BwV7EkNwYwdiJPJ4N9PBIpiZxyhZ6BrpQ/AhsYG5Ec+u6USkTUS8mndmY+iHWZ+fSSvFE0r98Fx1gMHNyW3nqH3gO+5aT2NBTVcE6UcVIE+Wksq43y1ve8lBgq1BEDkd/9Gev9XGRxnAibOpoU7oZjRpsaACSkmY52v2g5ubS37OWvwF4ZAeVXLNTu4HWS8+CAtHfOpYYxCmMzreZITasMIDwkpYX0rc6tc/D0g8jfqvlDQjIlzzbkhbzUo6n26CIxYSY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCSy7rbHVPsUG344oyc/Of137fYL9aiXj/ndt4yUk7k=;
 b=pxOZ6/XfsD5um9H3RgQstvnHabnoqOgO26x0pNZB4J8zaxYpHB80qCqrhY8XsrdSVCVpeOmnJozCuvy92s3Io3m7SxOQGTcnCc7bJlxKBZ7C8P4BQ3GSPC74NYsolHWKX8EDR88v9IP6bxOF9Eq2AuvqjzW+piqom/WCtTVTvaY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9611.jpnprd01.prod.outlook.com (2603:1096:400:1a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Thu, 6 Mar
 2025 10:59:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:59:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHbifr8yhGKdMSrsUi/t69sg72qNLNl9V2AgAADdPA=
Date: Thu, 6 Mar 2025 10:59:04 +0000
Message-ID:
 <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9611:EE_
x-ms-office365-filtering-correlation-id: 4ff1432f-6513-403b-985b-08dd5c9de937
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHF5UXNEOWhkdVM4R3FhaHF4U1FCRFppbTJKay9xOE5iOWxjaXhPRWw0b1hr?=
 =?utf-8?B?OFRBMnk1VVV6Tm1uRlZla0taMUk1K0d3M21Hb2tVeFJFelRmUXVnRU9CSEFt?=
 =?utf-8?B?emFHOW9ETGRYR21TSURuWGdOUVB4Z0xOOEI2QnFvN3VhQmtjak4zTWVDTUJW?=
 =?utf-8?B?ck5SZjdlQ2FYT2daUlRTMW02V2pZUHZmdUxpYm5FOGFjdzI4dVc2YndzUks4?=
 =?utf-8?B?ZEp4ckFBbmhLRlI2bW9BdlV1SUFpLzkrL0phdSt2RVY2UHllTnVHV3ltYklJ?=
 =?utf-8?B?aVRkSzVMZHN0QlFVSG5nd3I4ZTErdGVsMG1ZbG9Cb0VOR1BDdlVybWVEeUkr?=
 =?utf-8?B?R2ZEY0JBQmlxemt6a3BVU0tWZ2x0NTNFUjJnTGlKRXU3S2h4bTNPemJDTm04?=
 =?utf-8?B?d3pVcVY0TC9Vbm9WemZjZXVkQWd4Q0w3aTYwTHZMZWprTFNkQkJhLzNIbzhY?=
 =?utf-8?B?RGRNaXFnT2NLME1NamhJdGpkRWU0RlNMbnFuS2FGSVBmd0VVRG4wREQzVnBx?=
 =?utf-8?B?SkU3aEcrNTF5cndmNzgvVlZSTHpIcWZjQitMRStSc1VJbjJvR1RqbHVUNDlh?=
 =?utf-8?B?Z3dHMmt0bjQ4SjB6SUhKdDZvaldjL3FUaGhhYWY3eHdhN0VlL2FzdnpGRWpL?=
 =?utf-8?B?Zkd0bE9DSGhJeTRkbmJjb1pZSDRTQnlKRVIyT0NNYW9UZ2lCakFOZXdmS0NC?=
 =?utf-8?B?U2MvL2VHaWovUyswM1Q5OXZuV0hPRDRhcWtDMmpOeVlYRzRnZWp5cUFydjlZ?=
 =?utf-8?B?WWZTMTQ4T2hIajdVdmxGOTl6Nko4Lzc1VGgzUmttU20wVS9oSXRLS2lGQktv?=
 =?utf-8?B?U3NqZ1BXckJ1dUloNFlldUlaazlXWHNzS0ZuUW9UWU5ES09qYUVpbFQ5Nm04?=
 =?utf-8?B?L3pQL0ZsRTg0MlV5R3JES1liSldvWjJDZ241SVZhampkSldNWkl3akRXOVhj?=
 =?utf-8?B?N0tNRU9Eblc0RDlkYnd4R2xYTVRIRmE0OHRIaFZCTExhdW1QOENjRFFYaGo4?=
 =?utf-8?B?VVhYSUJSSWxYR2xxQ2FQT3RVUDZadWk3alhnRW1DZ2dXRE10TWl5bElQdGFY?=
 =?utf-8?B?c1BQRWRZWjZwb2JDOFRMbTdqanpndFFNY0Q1dlM0RXpqMWpNQ1lBdk9RSjdz?=
 =?utf-8?B?Snlaai9KOGE4WHh1NnhWaHdBSjJLU2hiM1RoeW5nOVRDblgrMTVDNTVwZEhy?=
 =?utf-8?B?RU1YcEQxVkNBK1hUQkViNVhYWGJlalIxUTArdXhPZ2ZaRG5RVENsaldtUjhG?=
 =?utf-8?B?aXdBbk1oSEdia2Y0dFVEZnNBU0RGR0FlQ3ZhalIreWFhRTZLWWJ5RCtEYXlr?=
 =?utf-8?B?ekdxbGxKMzVsR1EraTUvZXRNSnFaeVNFUWQ4UUF4ck5aZHNIU3Zwdzg5N3RS?=
 =?utf-8?B?UHJ3c3Y3MjJDeXRxU2VpWlQzUzc5U3VRT1FVZGFSK0tMUktyUlE4RHBpTkZS?=
 =?utf-8?B?UVg0cmNUWWtRQi9lN0R6VDZCeXdHdTYwQ2JHZkRTREpiNE1zWU1sdDJYcXlm?=
 =?utf-8?B?bXhtazRCRERwTGREWXBzSWVOODY3TDZpWitISVhsaFg3VXJDNWxyeS9RT3pq?=
 =?utf-8?B?TlNGRFVIdlUxeTAxWWpQeVlyWkdTVVBEd2JCS3BaVDloNmJWYm9qVXZYOENz?=
 =?utf-8?B?RE51L2lPZmFmK280MCs0T1NWNTFodTJmYVEwUTBseDRCVzRKYnBWZEd2K0hD?=
 =?utf-8?B?K09qUk5aR1ZrK09HNnVFdUlEZTMyT2lCSEJxdDVCNXBWTndBWmJieHpaS3la?=
 =?utf-8?B?bDY2NkFseUZYME92OG9nVHRYR2pnaUZUNzZjQkJoenJMa2hBdVJqUnZwRkg4?=
 =?utf-8?B?N2RIb0VoS3lIUVJaUlZkMStKNURLQ05YbUVHdlpBRS9WSFM0aGV1SnNXMGZU?=
 =?utf-8?B?S1ozZWE5Njdwbm1LVWwvNHVqTEh1cWlmdWNVNFEwM3hIZmVCT3V4RXZqc0dt?=
 =?utf-8?Q?+oXXqR4pbK3FzvuDdr4aHu73VKt/F/vG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THFYaC9JQkorL0FKRWpnTkhvWlpzVlhES1VDQW1Ub3o4c1A1Y0liQW81UEZR?=
 =?utf-8?B?aGdRRDJDM0NEZ2ZOZkZTWnU4QTNFcWVzUWt6QUZST0lHWnVNS1JoMEhYeFlQ?=
 =?utf-8?B?V1E1U0lZbXdpdUgxZ3VSODFKVGhxNExYd3BDd2ZndnBSRWl4UkpyL3ZqTUti?=
 =?utf-8?B?WW1RZlhwZGtVT0Q1ZEtCR21kN003TGwyM1NhWmxBb2xjVnhBT1pKUVpHKytP?=
 =?utf-8?B?clBWdFdPejlqWit6cVd5SWo4dGNSUlc5N2lYWGs2RElENEROODE5eS8xd1FC?=
 =?utf-8?B?cWxvdG5TWUdmcFhoNDFhYVdQL2RTOEM2RUMxajMrVHJkNGozbzZqdWQrcVpJ?=
 =?utf-8?B?SlpJVzBmUVBBV3lYdVlOcTk2R2o2RzZIeFRidHFPeHp5VnRhbVlhSzdVOWVo?=
 =?utf-8?B?SzJ4cGRjMXVZR1dNVXlLUkZUM1k2eHF4WjZFNmp3eGJVMFNEaWJMU1VVMUhn?=
 =?utf-8?B?ZllEdG0zSnZ5RHludjZycXdwOERWc1B5QnorRG5MRzd0TTM1eTNtenRxRUdU?=
 =?utf-8?B?czdtNXhXZk1Ja2tQdHpXVm96ZXBpd0YyWjNBMktmMHc1Y3BrU0NFYnhrUzNq?=
 =?utf-8?B?RHdKQ1UrT3JZWmpPaGY4WXlWK3FyVDg4VHdjYWJrSjhLVHhEcG5ZdHAwZDBw?=
 =?utf-8?B?RmU5RWJUNTArSlc2YXFYd2trU2phRXZrcWpRNzBFcDJoM2lnZkpVMkZQbVRU?=
 =?utf-8?B?aFVpMEcrSjBxK010UkRwTzYzNEFiNlF0bTREbjE1QmFiU0NXbEFsallxZVE0?=
 =?utf-8?B?Q3pZekhaRVU0TXNwVUJQRjZFeG80TWVYVXliRlZzU2FoUXk3MVMzS2RRRzkw?=
 =?utf-8?B?ZXNRVm1RUTN4eUl1UlhmQlJUK3VIaGJwNUJRaWY3cmxLQjNpakkvdUJSZEVJ?=
 =?utf-8?B?TmlXUkhKYnVhUFJFQmlCYU1yejQwOTVkVHRoWU9oRHo1R3d3ejArcTlyNWF3?=
 =?utf-8?B?bUxhdmFvbjcxRmx2ZDh4djJtVzJPNHhDTkxmajRrdWo0NlV4aWt0NzB4SmhW?=
 =?utf-8?B?b1pJZ0Jjbm5MQU13QzVsTGx5ODRpcFVaUERzc1BQTFRhUmorc0cwNVM4SDNN?=
 =?utf-8?B?ZlZqYkFZMWU4VklpNGRxNEQxQzFFL1Urck42RmJjbm5MRnpCRzNjaTY2NVBz?=
 =?utf-8?B?VjJFcWtQaFNRY1NpT0RQbzdCQXNUR2pWbVBlY20zY3ZEQi9WSlJBb2Rwampj?=
 =?utf-8?B?RzhjTDh5a01TZUtCRmZSZ3M3RE1lbmU0VTZBQm9BMWxTZkFCc1E0N3pOVFFq?=
 =?utf-8?B?QmdLeWphcXlzWlpvWTJybjNDNG1kbVhjRVFBeGxtamxNVU8ybVFBQjdVUFlz?=
 =?utf-8?B?blJ1V1BzSnRJQ0d2NVBpWVNiT2Q1bTAyQ3JMRURHL1VOQnR5N2kwd1dXaVRx?=
 =?utf-8?B?dFpOblp4NzI4NTk1MGM4dm1RQVo4RkROWmtvTVV6VHpiOFdQaVBOVTVEdk1m?=
 =?utf-8?B?bWZQZVRyaEVFNWF1bVlQcU9pTTJoSk95elhFTzlZR1dVL0cxd25VRW1PMjA3?=
 =?utf-8?B?czZaMFRCcit3VW5QVWNpTWxDY2xTSGhiMkJuc0cvNVljdE5yUWdNckN0L0Rp?=
 =?utf-8?B?RUpOS2ZMVmhVMGo0RVd2WFZTclZDcWZ4azRlQS9LcXNNZmt6bWlSM2p0RnFD?=
 =?utf-8?B?MVJTcVRlcGd6UkdVeDN3SHB6KytkUTY5cmpnOGVVRE1YbS9tS0FUM1pEOEls?=
 =?utf-8?B?TkZRekU2S0JKbE5JR2FRQUZaRGlKeDdLZE8vOFJvSHd5MnJmSEJlajhvOUN1?=
 =?utf-8?B?b292c0JmT2JycU0xVVZqSCsycUE1UERLQUxZKy9Td1QxS3NkODdQTlUwNm5Z?=
 =?utf-8?B?SmVmMUlOeVNYNkhlTEZidlk3YnVqYkxxU2hxeXV6TC9lVXhQYk5pSFVuRGdh?=
 =?utf-8?B?a2FBNjh0S1JuQ2hmRW15TjBWNjBsaWV0UW9ISTRhcjk0d2NLNTJSM0tGRW1E?=
 =?utf-8?B?d0NKNE1uU0p6azMzM25RVmJaUytNMklXLy9JcS8rNnJmR2VnSDNmVnFCV25G?=
 =?utf-8?B?NlNGN1FTdXZHRzhrRE5jNEszLy91MTFjbkFyTGhvdVJ5empzM05JTlN0WEtp?=
 =?utf-8?B?TExqTTVXcW9ia3d1MzN6NDUzREVXL2FrQk0rQUxxOStvM3Q2Y1grZmJHQW9l?=
 =?utf-8?B?OHdKSGE1Q3pGenNnODZTU3FWWTlnbFpROXlEYXJlT1Q1UHVTak9udERJaklS?=
 =?utf-8?B?VlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff1432f-6513-403b-985b-08dd5c9de937
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 10:59:04.8290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cr2A8q8LCYBQo256sUQghKKg5y6S4h5e3hz+biFkiUOi3aPBRC0fsAw4RznUP4z8yZk+JYuFrym1z33wS/aFd8Ux1BicKGlYkMQtrtwKaxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9611

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgTWFyY2ggMjAy
NSAxMDo0NA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IG1lbW9yeTog
RG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDI4
IEZlYiAyMDI1IGF0IDE3OjA4LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IERvY3VtZW50IHN1cHBvcnQgZm9yIHRoZSBFeHBhbmRlZCBTZXJpYWwgUGVy
aXBoZXJhbCBJbnRlcmZhY2UgKHhTUEkpDQo+ID4gQ29udHJvbGxlciBpbiB0aGUgUmVuZXNhcyBS
Wi9HM0UgKFI5QTA5RzA0NykgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9yZW5lc2FzLHJ6LQ0KPiA+ICsrKyB4c3Bp
LnlhbWwNCj4gDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAg
IGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA0Ny14c3BpICAjIFJa
L0czRQ0KPiA+ICsgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6LXhzcGkgICAgICAgICAjIGEgZ2Vu
ZXJpYyBSWiB4U1BJIGRldmljZQ0KPiANCj4gSXMgdGhpcyB0aGUgc2FtZSB2YXJpYW50IG9mIFJQ
Qy1JRiBhcyB1c2VkIG9uIG9sZGVyICJSWiIgU29DcyBsaWtlDQo+IFJaL0ExIGFuZCBSWi9BMj8N
Cj4gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIHRoZW4gSSBkbyBub3Qgb2JqZWN0IGFnYWluc3QgaW50
cm9kdWNpbmcgcnoteHNwaS4NCg0KTm8sIGJ5IGxvb2tpbmcgYXQgdGhlIHJlZ2lzdGVycywNCkkg
dGhpbmsgb25lIG9uIFJaL0ExIGFuZCBSWi9BMiBpcyBzYW1lIGFzIFJaL0cyTC4gU28gcmVuZXNh
cyxyemcybC1ycGMtaWYNCndpbGwgZml0IHRoZXJlLg0KDQpDaGVlcnMsDQpCaWp1DQo=

