Return-Path: <linux-renesas-soc+bounces-30591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO3nAvN/ymnX9QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:51:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860135C59D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40E9C3012B75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0B43A6B74;
	Mon, 30 Mar 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u51nr3JQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A813A3E80;
	Mon, 30 Mar 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878692; cv=fail; b=laPhrLlg6rpvkMpgms7t3gs/Clp0yAT0ctI1NRDTXfcDmPLJl5nJvz5e7BQ6I8aixnMBT/veYjwbb5xRwP09zjMtcVlCZch0N2gCMm/Rm3ZnKi2nIzINM3Jj0TVfBfVVODr3c3Q72AfLv2STAZNJcLXhfpelGdbdPjR/nP347HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878692; c=relaxed/simple;
	bh=q0en0MuZpK/+PQ6JbIkqAQmZ6szzbp3tFwJV4FWuLlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LrVE1STJ4tWSimz+Kvi6NNtN6THDbKnRb+pEyS1vKJiX1erR2uxRJ23XBSJncW9SeHne8S7t/RUrA3w5BkvNG2sFKgdpSh5qeiy/iqS/4YNY3CoZb8i/VfQQN7EO+Y+/9YZFbgneWWvvpRY3xqx3dUIiVnZ1jEFK001GalZX0A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=u51nr3JQ; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG2GibhFUEzZ5BUvk5BGCGpLzMpJs3i5mOMbP/pJjJ1xDpS1rfvDWJGcOj7S1hcijGn2ntOXD0xEfTujhofUEb03HtLllEGimg4dD+SRJmDtX8Yf5K2keUB81/6BNK5yk+G1cQbVxlzGDRYM9Z32cEYh/VQ+HAY0PE6WKcTg1zlKhDus9WlCb+s1lC6YlRCfWW4eri3zwO0LKB9mZUoJ7FEEWfb8DvwP08VC7wBWSwHk6KEhbp9ugUgWv2xrwCLDI4zf28NJ+Ow6G5Su/fcYeqTEyLP2BSzGa2lZoaZZHM8iBVjE8Jx6ntaliJP+hujmVnWD4/pswqmWwjY2nlfJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0en0MuZpK/+PQ6JbIkqAQmZ6szzbp3tFwJV4FWuLlQ=;
 b=GX0pIkUrl8LBa4yQ81MR0vh8vW6Z2dnbeu8PNXDhz0eFjOaPA+j4HcJ9isweHQceO/7255bNhsvj2rOW8GczSAbxd1UgdfkZcM3y0FCeaJmadsljbzVTutwe/1cqJl3I+3U/VXZ7ZPxo6T/TCtL5wkOsKGAJgNJB7migiZen20Dbp6UQdlTAlXpWFEswSOjXm9rHxEgGXiOa6Ybp0BYNS0rkjOATj9oFiAMwnvButjDCdsMQVtRiz/Npb3Ow3RY3PJxHnjT3ipMbWg6kXHuiVF0vXEoPvuF159nRcFwQf472ldtOobkFxXsoGas1sMPeND35MZMZwcIIYMSsHh2rnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0en0MuZpK/+PQ6JbIkqAQmZ6szzbp3tFwJV4FWuLlQ=;
 b=u51nr3JQw9Kf+f3Bi7AT2qNrSlOANAJWQlE+CJPQBrQq/BweDPeFbTahL+J3kqiYnz2eEQIhIvXtdyLyFgZyReL9FQnpNBAKKVBN9eMiTDIQ1NaGVRjlvmfRxxljePnLGqGz3z4XZYBmPWNVY9n7NO2Y2ZBWxDxKBBC52USNaGk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6769.jpnprd01.prod.outlook.com (2603:1096:400:b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:51:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:51:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/5] clk: renesas: r9a08g046: Add {GPIO,CA55,WDT,SCIF,I2C}
 clk/resets
Thread-Topic: [PATCH 0/5] clk: renesas: r9a08g046: Add
 {GPIO,CA55,WDT,SCIF,I2C} clk/resets
Thread-Index: AQHcwEh2AfT0rFXSBES6ZWYpJr2QFbXHFdYAgAAAaZA=
Date: Mon, 30 Mar 2026 13:51:22 +0000
Message-ID:
 <TY3PR01MB1134696C35FCF90E70EE081328652A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6769:EE_
x-ms-office365-filtering-correlation-id: 38d6cf2d-249a-498a-0a98-08de8e636d95
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 ZLIkN2fx23zE257Lrv9mcDzPLGKmQc995Reh/RfK6+/fgWT26nXSrpVvw8fkbepBg9XyIhUBzn4vn/ZCmY8dlGGQiG8d3C5Uv1utqhMj/rluF9GJqlYMB3wVnm3nrMSHz1JQDW7xnoiIth/VeFjfP8mJ0o0nzblkp9QcC9dVfLqEdEzHp1/437QZu3SBFBOq4X/VN7qeu4xDOGjho5YBG2+cou8njgDiExZDasMmRR/GLaeG3hywc6mbVyZyMXw1POvYYrrCKfHE8tjCTN/p8XUstf2hzpVRjnc8jY3LqOdrmZG5Wc5VCboGodreln1EOhy5fduzz5K0tyQUCmojpBnbCNBg1MQYBzFaD0mI8al2JJxxL2voAwidY/D52LmZE2Pgfl10Lq8aQyRDvRVNUFuu/bP7VmVL0G4IDQ/fhg3DqsQHcbE5yUxRSkhOUQICeQ946kkLD/q77+AC0zbZUUVx4HNZIu692bRjairG4xwtB9oj/j0xiWCCf2i7+fsLr6KxWuZKDReBQo+IQnyRB5/aJoFd9VSgZavM3r+RQjACfMBUbQr/7N7tYBriO4OH3C9G2DSZDQ8gLsuZRuskYavS+JwrhWcMClZleTPrmsMKGG9FAx7nrQHUvFPIZ+Lwa90+fP81BMKCTgurvWkF3Hi5Rzd3UhZ2Mk8j07tzsVS/NUvnjz2J1z2OFOwxTg9xbLRh69BNEGSKQnPThVJ7i4Ezd716f9SiDjYZy7O3Hl251fCoaEBOR8l68YamEzrwFziB6zNeCtSxybCKmSEwPVpt0ksdvW1kfiHU5NhZ7/s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXZ0TU01NkpidXQ0SUFHRUxUYmJyenRieXZDdzlhQXZPcDNucXhoZjlmdnFH?=
 =?utf-8?B?b1RMUFVOSmpYblB1MllaNmNCRUV5NEVXOXFUQzF5bmFJR1BDUnh2QkwyOFdX?=
 =?utf-8?B?N3VadWNKNjh0eW96NVgyTzE3cUcyd2FZSUE5ZkhFQ2ZRR1d4b1pUc2x1Sk4z?=
 =?utf-8?B?aVIxZmhpRXRWZVRYeFhUUXBOUnRUSng0VHRHeUtmSXpjYVpmQXZETlNOMnNF?=
 =?utf-8?B?ZGs0QTYxYVM1N3JCMnFqN2xQbUFOTTNPUTgwVUl6NzN4KzhSbnIxdk4vNUNp?=
 =?utf-8?B?RzVMY2Vpalp1UWo3SWthbTcrUWwyRTZOUTc2Q0p2Y0p1T0RmS0NqQlBpaWd3?=
 =?utf-8?B?cHFoWkhKU05DWWZzNWd0eEpVaUV6VWJsclYvd09PQWNlb1FGc1o0eW5pdkhV?=
 =?utf-8?B?bnh0OFBWZFdvU3NXN2s2bmlmNytCb0FjNUF3MmluOGM2aVgySVh6SW9WTEN5?=
 =?utf-8?B?Rmg1R0kxaFVoczd0akdNcFQ1enlHa3BMU2dRMHRyOE9nNy94aEZmdUZLTUoy?=
 =?utf-8?B?ZmlHb2kzR2JUZGpiblFuNjZ1MlVZbDBVcFlBTU1SVWU0SmZpUElISzQwQjNW?=
 =?utf-8?B?b1NEWnE2V0pleGNEdlB1R3NheWIwU09MbDBCbnhmQS9jYUlhK1czcGRKd0ZU?=
 =?utf-8?B?UW1tU2JIQlM4bzE5bFV4UDF4d05KK0tyQXE4OXNvOEd1NzB4TnI2WUFBZVU0?=
 =?utf-8?B?cnlaR3hjdDQvMEtZNWQ0WWV1SERrUXlJbkdpMWNCQjFsN29nWEQ0T1ZZZEJD?=
 =?utf-8?B?R3dRZnMzdHNsZzFldWFvZDZ3ZVkzNUpFSkhMVFA3MThrbERZYVM2Z2YxZVp6?=
 =?utf-8?B?dlNSVEJ4QmFVa1BqaEZ2aldNQmRZVGYzTTNibUxJRDkxUVB6VzliTWM3SXVM?=
 =?utf-8?B?MWx4enlwSFJrSWFGWnYwWGpRMDZPRlp1a2hzc0ZWRFZYa0dhRTdDcStTZk1V?=
 =?utf-8?B?TjNVdDJLOE1DNTVpMWVPL0FoazhIWGdiNS81YnJWa2FBWWhqYjE0SEJ0S0Fm?=
 =?utf-8?B?UWNpOVYzNyt2TUlERHBXNTUxbm82aVhjcDR4WkwxcnJDRHBjcFN5WGdoaWRr?=
 =?utf-8?B?eTB5SFpjajBMTm1RT1BmdXZBK3grRHRtT29Hekh4ZG8rRkNJak9VRFArOG9E?=
 =?utf-8?B?VWF0M0paYVJ2UUJwbm94VHJBUWpwaHExekI0aGNEUUxHeUdudHN1RDA2SDBo?=
 =?utf-8?B?Y0d1Y0RKeEdCSHppRlR1L2NHUVBzeVZmL1JhVEo2Z2paODd5U3RhVW90dHRI?=
 =?utf-8?B?S2dzMlhWMnI2M3Yzb1QvcHQ4Wk8vZGRyNmpjamlPclVWV0xYSG9uQzNTYkxy?=
 =?utf-8?B?Q1l5UFFwWG5pTVBDelY0NG1MeGNLc1FsdnFqYkZjQ3YwRUdSYWZSMnJOcUk1?=
 =?utf-8?B?L1FvYkpUUm9zYStoSGNvNXhRWUhYWGtNTkU2SGxaVTA2RUpTRnh1bTRkdWhR?=
 =?utf-8?B?ZjRkUU4yUW5SaGx0cEpyNGhyYXQ0REpuWUNTOVdIdlRmK3pvU1pLK1RLa2xv?=
 =?utf-8?B?OUxNWG1vbVdHamZkVU4rVzJERk1FT2FsSGJEN3V1cHZCRWxoaHJqVExIaGRM?=
 =?utf-8?B?dXQ0VkJjUGZoaWI2eXpLa3lkL2tsR1pqQ1Vvdmw3ekQ0V0Z5anlGWWhWRnpu?=
 =?utf-8?B?azEvQUcranorVGx3eXhNRDI1QmNjNVFlM2ljSFg2bmtQRE9nbVBQSlFYaHp3?=
 =?utf-8?B?ckt4c1Fqa01hdGtIa2VoQTRHb0hYOElpNUtmNmVUdFE0ai91TVdVcGZOdmhQ?=
 =?utf-8?B?NHpOQ3V3Qk9teHdyZ3NCUUpPc0VYM3g3bXVQQVhUc1lFbjRpT0pIenhhb0Ey?=
 =?utf-8?B?ZXpsMkhib1phK0h1S2d4OVIzVjBtYm10bC9CMmtrNHF2RGx5bjNWODZKbVhI?=
 =?utf-8?B?ODhuSDREY3ZMaW53WTRTZ1pKdHBpL3pUc1VvcXF6YXpKNDhydHprbzl1QTBu?=
 =?utf-8?B?em85OHU5dm9tTEZZem5WdmR0SmVTVkZIR3IzUlpMZ0JHV0RGaUREMC9MN0hv?=
 =?utf-8?B?cCtyOEMyekZQQmtRVElnd0FPb2pZYml5WmFOeldQNTVpdllaWUJ1ckxYa0lJ?=
 =?utf-8?B?YW1rWnlUUVQ3S2ZBcyt2WXdvQSs4NzJSdGk1ZUxlS1BKZTExQUFHRUZnNzRD?=
 =?utf-8?B?SFZFOFRxQ1d2TEsyVWtrNUl2alBnL0lkSkV3SThNQ1dQVnlOV281Z1JabERl?=
 =?utf-8?B?OG04TWNPQzFCZGJuSVZDZnBZb1RqUTYrM0lCQ0NPVVRNc1hBN3oyM1l5NUc5?=
 =?utf-8?B?cjdEYnZaL2xWa2hBWkpYcC9NY21BTTFDTUZnd3BmcXNPTTlCaytiVjFzU0pz?=
 =?utf-8?B?SnpUS0pISjh5OGpseXcrNnhHekVBN3p5c0RaQ24vTWJ5T3F0VGlaUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d6cf2d-249a-498a-0a98-08de8e636d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 13:51:22.3939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NF1FlYEEp3HpeygnPe+2Syzg7zkl7T/VRMk6YKlzCIhAlalfmuNkIe4vpo0l55R0QofqBBKKsabfHnYHcFILmmupNcVtYOlxmQIbUYjGSu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6769
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30591-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9860135C59D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzAgTWFyY2ggMjAy
NiAxNDo0NA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0gY2xrOiByZW5lc2FzOiByOWEwOGcw
NDY6IEFkZCB7R1BJTyxDQTU1LFdEVCxTQ0lGLEkyQ30gY2xrL3Jlc2V0cw0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IE9uIE1vbiwgMzAgTWFyIDIwMjYgYXQgMTU6MjMsIEJpanUgPGJpanUuZGFzLmF1
QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB7
R1BJTyxDQTU1LFdEVCxTQ0lGLEkyQ30gY2xrL3Jlc2V0cw0KPiA+IGZvciBSWi9HM0wgU29DLg0K
PiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgZGVwZW5kIHVwb24gWzFdDQo+ID4gWzFdDQo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMzI2MTEwNjQ4LjI5Mzg5LTEtYmlq
dS5kYXMuanpAYnAucmVuZQ0KPiA+IHNhcy5jb20vDQo+ID4NCj4gPiBCaWp1IERhcyAoNSk6DQo+
ID4gICBjbGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIEdQSU8gY2xvY2tzL3Jlc2V0cw0KPiA+
ICAgY2xrOiByZW5lc2FzOiByOWEwOGcwNDY6IEFkZCBDQTU1IGNvcmUgY2xvY2tzDQo+ID4gICBj
bGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIFdEVCBjbG9ja3MvcmVzZXQNCj4gPiAgIGNsazog
cmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgU0NJRnsxLi41fSBjbG9ja3MvcmVzZXQNCj4gPiAgIGNs
azogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgSTJDIGNsb2Nrcy9yZXNldA0KPiANCj4gTm90ZSB0
aGF0IHlvdSBhbHJlYWR5IGhhdmUgc3VibWl0dGVkIDYwJSBvZiB0aGUgcGF0Y2hlcyBpbiB0aGlz
IHNlcmllcyBhcyBwYXJ0IG9mIG90aGVyIHNlcmllcy4uLg0KDQpPb3BzLCB3aGVuIEkgY2hlY2tl
ZCBbMV0sIEkgZGlkIG5vdCBmaW5kIENBNTUsIFdEVCBjbGtzLg0KVGhhdCBpcyByZWFzb24gZm9y
IHNlbmRpbmcgdGhlIHBhdGNoIGFnYWluLg0KDQpOb3cgYWZ0ZXIgcmVjaGVja2luZywgSSBhbSBz
ZWVpbmcgdGhlc2UgcGF0Y2hlcyBpbiBbMV0uDQpJdCBpcyBhIG1pc3Rha2UgZnJvbSBteSBlbmQs
IHNvcnJ5IGZvciB0aGF0Lg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LXJlbmVzYXMtc29jL2xpc3QvP3N1Ym1pdHRlcj0yMTIwMDMNCg0KQ2hlZXJzLA0K
QmlqdQ0K

