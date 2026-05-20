Return-Path: <linux-renesas-soc+bounces-32861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBoTEyCJDWpdygUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:12:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D258B79B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B506F300292B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AF03D565C;
	Wed, 20 May 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Uo7sKLLT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403943D45E9;
	Wed, 20 May 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271833; cv=fail; b=bnJeVqdX4m+LiDaEk9VOFM2BmfZ/jJ6KAS4sWovXIcdRDTOXSV0S+1yoR+OzmxFCyQ+yNqre11tIea38S6Pi+JLZe1iJD+VjZSNghz34RcgH3o8Z4lwcyoYn2v61umsrfFZtAuk4m2ca2DEGAcqzB72SPjtNbqZmOJsTB9aC9Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271833; c=relaxed/simple;
	bh=1Axei+0RjpaPgtKJJ1TzYpN3Juwa/8YLfyaKguzwgg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U2HZaIPX/TZpauW5EsrC54Iu2TXXX5x4bnbbRr8BLpQ8lEqYJbetq8KP6RPvisGzsUucrXHNqL/wChHcZnRJWZ8EVxjJKN0bZU04mXoYC47By0tMcJjhsC6dsGAKJAga7fZN2GvWj4AWbCqc6Jll1EktiCnqF5hTEmNnBHdRYag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Uo7sKLLT; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpI3y5j1KomMYse1js7HoOBW8lJSAJhBiV/hE7b0owoS7CXAN5T6pv8Gv5wiTmGWc7uedTKx6X5gWtbvuw6zhzMCc4v0EiBcPpPoH4WaDy9Lw5tOg81KjYR0vxkWHfLmA8Y0SZlv9X9YWJCtznVHsfnL+KtWCEakVkbGgn1IQgC/3wMYYjo3J+DfTx5M8IZOvdo4s/TzTuJ+UoyakfWQHamemeNjFLatQJIkVCSyS11NJX8bItgRzSDBUoC6ldlOoDrMtNnOkaw7/Qv5OCYbK+p6h5OqFtobkEPOylB7VIsEHR9PI0sZQZwWeFGh4DOTFDRKMEEdWUxYPHTz9E1cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Axei+0RjpaPgtKJJ1TzYpN3Juwa/8YLfyaKguzwgg8=;
 b=XH5d2xEZZyi3FNcEzk8az4J2VL54JHrgIzBmxwsDMaR9PPmyh/FdpdP7SHUvJ2aeOJy9xgduDJkL/MOx7QlQYqr6bOWgHbpgUMPLS2oA+ItZxu4+zNAIgqNWBIoybykmcIgIf+zVfZV38EyUsRzkzMH3mwSeGg8QIB5AcvSvzNobZHTY/AZinM1SZj1A+SIvwgwJhv+Ff0FBT0zj+7t5o83T7TfpSPv9EwQpd4jxymEeykXXQ0vw2GpVVGBjk6KdVS2vcHiFxnDp2+5kzWuK9ogHz7V8fTpU8YiHkXlOwghTHOYnAz8F0oXdTuOrQ8vyGqqGsmfQoQWEQC+eQGXn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Axei+0RjpaPgtKJJ1TzYpN3Juwa/8YLfyaKguzwgg8=;
 b=Uo7sKLLTT5+G7OfeSrgcUiyLRv0BHb7kKWZ21YwFSFIVX3bCDRsczoB17aBVYF4xSwGNICVzyOlHWoefwjlYdRUvm+wlSH+785KYuQj405uUDw1lqbUYXGafq3lCuFcsOQEFsF+jX2vRvZ8ym3ZkmgAo3fuacnxyHPZ6qYfJgtk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14158.jpnprd01.prod.outlook.com (2603:1096:405:21f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 10:10:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 10:10:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: geert <geert@linux-m68k.org>, John Madieu <john.madieu.xa@bp.renesas.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
Thread-Topic: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
Thread-Index: AQHc6DllbNZzElrIwkyf+TxB/QG56bYWpFaAgAADj4CAAAi8gIAAAFVw
Date: Wed, 20 May 2026 10:10:27 +0000
Message-ID:
 <TY3PR01MB1134643DD0A48215D0BB340B186012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com>
 <TY3PR01MB113460DF331AF8A6FF89FF37186012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8un-MUoR9ak=a8XxUp=x8DOhjoVjuXCyd+XMsvK6VHw3Q@mail.gmail.com>
In-Reply-To:
 <CA+V-a8un-MUoR9ak=a8XxUp=x8DOhjoVjuXCyd+XMsvK6VHw3Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14158:EE_
x-ms-office365-filtering-correlation-id: 232b5fff-1eb5-4aa4-0b82-08deb6580416
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|18002099003|56012099003|38070700021|11063799006;
x-microsoft-antispam-message-info:
 eBY2PDvG+8D+4hDFgVRUGzl9G7w6/vfzX+HArlYrMSaPlgGQqVt77RBQhDJ+Ma38xxNkH3t3z4x2Z80RcMSatCtG1WK/6PwrnLpy311ZYcWg5uRq0e7GpeGODJpX3oBR+7VI4tOEK+j7urdikb6f1poFhY2J4Gssud9rFlwHp/PD9BtWOvxuJ6xQqV+PrSyt/q4sqtl8fPqEGPVqF/bT/zfnz9Vq985BUMLvK6fM2bgpOgmCdPY5Vnlpcnr/A7H8ACtUHF6O/Gv0MYXUArRaqWBxpE11mMEUVypV0kWTOr+c0t07Ko5zjfFqMXEsZqR8RhDY2O3gpolawXxmkaYG/920kyyJzaOBNbqs+5xBpAUQy/IsTS1L3RNmkhKsj6dGLMkssROIlwlwck1N0U0niT+/s+/nvS6q1Su9yh8fu2yFTl3Jlf/OcSEKUGxbidQfnDt8x7MWxnBxMWERrKAvhXBTp6VNYUZrYhSo2FkV4Vex3pmmph+mejp6rexTz/dxo1GIdpMns2IA6bJZSbLIL5TiTIMnOdhClOiHy/Nf1vGtW1LaU86Ijve90b4Mb0M2ObwctH6qu15ztyeku/uaw3GTKkJ1bY14SbkdQ9/NGPc41KACueYrGqqcqu00WnAV9cdLU1ppaO+zbOXQVOuZWdjq/pQC2yJoxG5YGDiX0yV+M2DM5wu7wNSVXFIx9sddvDLyFZY7j60wMtN1sAvL1Ea/Xn7AMoPDnsHUjfmlL8ZAB3nKTJtphPAZFF02WR/C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnpvNmk5R1d1dU5rTXdxYzE4emtBYUNnWDVUbXZKQVQvOGQvZE1IdGNZbExj?=
 =?utf-8?B?UGI1cTR2VXZRVW5yWWhoR2wrYk1iTVoyOGRRZ0hINmg0THVyd0ZFRXZWTzVa?=
 =?utf-8?B?YkRzYWVIRDJNNk5vUlBDbHkxRHJoT0tzMmtrUWNmUll5UXJkVnVQYW5Bd3M1?=
 =?utf-8?B?bU5ZNWtOSmQ4TXZ2NExpWTlYdlk3dEdTVk1rSEM2dTBaM1EweThqcElMdjZq?=
 =?utf-8?B?bHp1REFNcC9ZVmtvWEsvcnhKMmI4WjZmSzNtT3p4dXltTlcrdSsxZG5rRmhm?=
 =?utf-8?B?YzFYYjJPYUNtU1VCNnZ1Nkk3Rk5pY2VkbFRuMit0cW4zbWVsK3IwVlJKZ29C?=
 =?utf-8?B?UGdEZnB1VFFySklmTmhFV0FoMkl2cHYxZ2FzWUJjTE51MmgwVjl2OWZOQnVJ?=
 =?utf-8?B?ektSTE5PWVJRSFdmYkJlcDNBT1d1MmdyUEFxVU03em5IeU16R1lwdEVlNlky?=
 =?utf-8?B?RFlvVmdQWFFHTWxCOG9lSm03U1R3Ym8xTytGRXY5aWNTMFRGOHZsZndhVWpY?=
 =?utf-8?B?ejRSNXFBQkJUZldHQVZObVNkdjRlQ0pnbmFiN25sSHY2ZlRNaUxXL2p5UXNi?=
 =?utf-8?B?K2lMa0FtSkl4NFNqQWJYb2UxVUYyRjRpd05ZSEhuSnJjR3FkNWRPZW8zR2xq?=
 =?utf-8?B?Z0I5MC9aeG45UnExcm1RV1pHdUV2bXpjMU5kSDR2RjFxSHBVVWV5Qm5oWW9L?=
 =?utf-8?B?UUJ4R1NqZzU2RXRwSXRoY2xFdVhlb1dFOVZ1M1NlczZzTElNQ2FSNStGK2Fx?=
 =?utf-8?B?bTMvaiswc3NValVZamVxcWpKZkRLQ2JjMUcwbExOU1NwZG10MVc0ZDRlS1Z4?=
 =?utf-8?B?Rk5uRkFYaUdoM2VIYmlZTmlnb1Y5NlBDbXQwMW1MV2FLR2lONEFDUzh4dllP?=
 =?utf-8?B?amdWQkJjVFpod0dnd3RVR3VsdXVvb2NqMFlSMUxpdnZHUFk5SGtWME1qK0kz?=
 =?utf-8?B?VUxnWWtET0Zpcllkellmc25QaC90OHZZUFpKMkdWZlR4UWU2UEh3SnJGRTE5?=
 =?utf-8?B?MnYydFdhaEtnempzU0pWcFh0djRBR2FzTGZwN2VqNklOOFhiVEt4VDlDUitR?=
 =?utf-8?B?dmEyamV6dTEzU3FSSTNZbHZYaVB5RGZkKzNRZWlObENiMzJBblZ6U3pnWXdF?=
 =?utf-8?B?ZnRHcHBqK2xJQnVYQzBtQWJBVHpYTHhZQVVpaHdDYkcrcVlLNEFJTlR3cWty?=
 =?utf-8?B?djJ3R25YUnhDRnN6dlRpdTNZa0w3Q0dMWEwxcDBZQ2RqRTduVlZZWXN3MmZI?=
 =?utf-8?B?YXVhNXFkRU1udEIvd0tSbnk5NmhzK1B1T0dvS2dDazVEYy8renhYSmNVc3JB?=
 =?utf-8?B?U2JmRUxQMDFjVW1lNWdwdGFrVmV6NXRFYzJKYVVPdGFISFRlVWRqV0NobGIz?=
 =?utf-8?B?Q21FS1BYc1hPdkk5ZDR5emlPWnlmczNjOHBadE1kQkY4Mm1GUCsxS1pxdUkx?=
 =?utf-8?B?STY5WE1xOUIxd29YdG15SVJZUXdTMnhSR3BMSjYzSDBRblBOU2dkTEpzZ0dv?=
 =?utf-8?B?UmN4elFOdTJwUjJjQUw5Q056aGNkUnBGMFU3RnozNWRkQlZDRExlMCtjV3FI?=
 =?utf-8?B?NlJKRzAzdkhGblVkQkx4R21BcC9FRVJMOWdjQ3NZTkZMRkY5eWdwNUlXbk44?=
 =?utf-8?B?RU0rRXRUbURIcjQ2VXQ3Z0FNQU1jakxWemlPbWFCRlorV1ZYVEx2RmNCVzl4?=
 =?utf-8?B?a3pCdUpHOFA5dHdpUExySzRKYzRVL1hRQi9PN0wrMVphS3BxeVFDTmlUNkNC?=
 =?utf-8?B?YW96WmZ0SG85NnF6TjRkLzRwWEhVZyt5TDMxRERoRGpQS1dUd0l6cVYwb0po?=
 =?utf-8?B?MXpacGtzSjR2N2NySllzb3FWTEF1R1g1c3h4cVkzYWtzdGVya0V3b0pEUU5S?=
 =?utf-8?B?azdxaXFjclQxV1pTSnpoRzZrL05SWVNYdG0wWjU5dFdBZHppcEt6endPV3RE?=
 =?utf-8?B?S05pQzZlc0tnQ3AzeEZVUWdrNG13T3l6SFFWR1FFaXdTM0dPVUs4U282V3NT?=
 =?utf-8?B?ekdTRXplRWE2Sy9OSGcvMEVVZ3hDQjJRNGNhVENLa1IxU2U5cWFab1hLRWpk?=
 =?utf-8?B?Rkt4WDlWM1pUV1JYdTM3YUw4bi8zcVQrK29vc1ZxMjdUUVNvSmNYWm1HNTBG?=
 =?utf-8?B?enU4RDlwbWpzZ2NhbHBidlAycHJDaTh6RTNGeklDYlFOR2dtbSsvalJhdUNq?=
 =?utf-8?B?NjU4RE1NTFA4b2gyZmtnTkp1aDB2TmJwZHRVNHNZYXZFYVh3UjA5VDk5MXlT?=
 =?utf-8?B?dnJ3VnVpM0pMVWI4cDJDRUZKQnRFc2xEU0E3bDdvVTZlTDZnQk5uUkx0NzBl?=
 =?utf-8?B?L3dCL0RQQTJqWDlEYzJ2UE1KS2lUVDloQkhyQllrN1g5ZnZHaW1KUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 232b5fff-1eb5-4aa4-0b82-08deb6580416
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 10:10:27.4701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCpbtR3Ffuz2FahtvfeAMYxf/qbSH5UphF5b0LpB+D6IjznXvdhQuRsxQY3BMXmhmqefAqOCJBkFL7arwpZ80oHX00kGqegUIvHNFFpaCws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14158
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32861-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 4D0D258B79B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMjAgTWF5
IDIwMjYgMTE6MDgNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdGhlcm1hbDogcmVuZXNhczogcnpn
M2U6IERyb3Agc3RhbGUgc3lzY29uIGRvY3VtZW50YXRpb24NCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBXZWQsIE1heSAyMCwgMjAyNiBhdCAxMDozOOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBHZWVydCwNCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiAyMCBNYXkgMjAyNiAxMDoyNA0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdGhlcm1hbDogcmVuZXNhczogcnpnM2U6IERyb3Ag
c3RhbGUgc3lzY29uDQo+ID4gPiBkb2N1bWVudGF0aW9uDQo+ID4gPg0KPiA+ID4gT24gV2VkLCAy
MCBNYXkgMjAyNiBhdCAxMToxNiwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gUmVtb3ZlIHRoZSBzdGFs
ZSBrZXJuZWwtZG9jIGRlc2NyaXB0aW9uIGxpbmUgZm9yIHRoZSAnc3lzY29uJw0KPiA+ID4gPiBt
ZW1iZXIgZnJvbSBzdHJ1Y3QgcnpnM2VfdGhlcm1hbF9wcml2Lg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gRml4ZXM6IGMzM2VkZDhmOTM2Y2Nm
MmUgKCJ0aGVybWFsOiByZW5lc2FzOiByemczZTogbWFrZSBjYWxpYnJhdGlvbg0KPiA+ID4gdmFs
dWUgcmV0cmlldmFsIHBlci1jaGlwIikNCj4gPiA+DQo+ID4gPiBJZiBjb21taXQgYmY3NDZlMmE0
MWVmZDk4NiAoInRoZXJtYWw6IHJlbmVzYXM6IHJ6ZzNlOiBSZW1vdmUgc3RhbGUNCj4gPiA+IEB0
cmltX29mZnNldCBrZXJuZWwtZG9jIGVudHJ5Iikgd291bGQgaGF2ZSBoYWQgdGhhdCBGaXhlcy10
YWcsDQo+ID4gPiBwZXJoYXBzIGl0IHdvdWxkIGhhdmUgYmVlbiBub3RpY2VkIHRoYXQgdGhhdCBj
b21taXQgcmVtb3ZlZCBfdHdvXyBtZW1iZXJzPw0KPiA+DQo+ID4gSSBwb3N0ZWQgYSBwYXRjaCBy
ZW1vdmluZyBib3RoIHRoZSBtZW1iZXJzLCBTb21laG93IHRoYXQgcGF0Y2ggbWlzc2VkDQo+ID4g
ZnJvbSB0aGUgdGhlcm1hbCBwYXRjaHdvcmsgWzFdDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMDgwOTI4NDguNTMxMy0xLWJpanUuZGFzLmp6QGJw
LnJlbmVzDQo+ID4gYXMuY29tLw0KPiA+DQo+IFNvcnJ5IEkgbWlzc2VkIHRoaXMuIEEgcGFydGlh
bCBjaGFuZ2Ugd2FzIGFscmVhZHkgYXBwbGllZCB3aXRoIGNvbW1pdA0KPiBiZjc0NmUyYTQxZWZk
OTg2ICgidGhlcm1hbDogcmVuZXNhczogcnpnM2U6IFJlbW92ZSBzdGFsZSBAdHJpbV9vZmZzZXQg
a2VybmVsLWRvYyBlbnRyeSIpLiBZb3UgY2FuIHRha2UNCj4gb3ZlciB0aGlzIHBhdGNoIGFuZCBz
ZW5kIGEgdjIuDQoNCkkgYW0gb2sgd2l0aCB5b3VyIHBhdGNoLiBJIGp1c3QgcG9pbnRlZCBvdXQg
dGhhdCB0aGVyZSB3YXMgYSBwYXRjaCByZW1vdmluZyBib3RoIHRoZSBtZW1iZXJzLg0KDQpSZXZp
ZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KDQpDaGVlcnMs
DQpCaWp1DQo=

