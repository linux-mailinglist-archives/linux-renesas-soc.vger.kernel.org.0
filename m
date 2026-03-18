Return-Path: <linux-renesas-soc+bounces-29805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D+uC9vquml0dAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 19:11:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA8B2C1085
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 19:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14FF4309FC2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B15432F742;
	Wed, 18 Mar 2026 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CkuxX8fN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535613290AF;
	Wed, 18 Mar 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853400; cv=fail; b=e/CKBMzFhK4uSkFh8E0u/q+Cv6X/tp5zht7kIs72liqiuOQmW2va8PxIRD2A9s7zu5mKWBg6aajqkSBaSUK/yBQ58acochOokAvZP+McH2TAjLAtcuU0Jjbvdm00M9YcFvXF1vqiOFjsWg9iyGN+GzyrVO5ZZV+k4EzsV8bnkcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853400; c=relaxed/simple;
	bh=9b3nMTzx7CeKl+p2WhyFfm+kNvBwSeySVpwXxlvVVkM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fugNrujOYDPksRuRLnUXJ+va59IVCyM/a1hC/NvKthSE/ghi038QdurheKi73TPiZLJM7ULKtLFAOU86FQq1PBOHTw1IgEQpfDzxx9h4RvcvZ17e/rutjPUkOe6DtWQytexlA00NKUa71hVUZGGFKDP9ZotUbkdZ7NqdrSpdnD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CkuxX8fN; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVABWSrb+Sc3gD2WEJ8uiuPlo4diN6+EgeLuIfOsW2f54wKoDYRxeeDQEAbtt6Hxtyi0qr3S2gJC1+yehHxHq4xraX1p7TCj5wvxBXgPvLOUEpq3Kh0E9qFrP0NA4J7O+BJQQzuili7q2vCE8Zbz1vVG0qFU1QvzY6D0KZ6/TQkrNYatSnYbfOVPnv1WroVPZ0/mmupm28Qn4kXAgaUMFXlWqZkTgJJ7Ua3o0l/f1t16pExal8CvZL19LUGpJGOE2/u4D31P/okQqcA8njYbCMJgRR54yxhEe9JjPata5jWxRxykZNCMb3S4Ih4JlGrGxuI4oQ5Ea/gG2QWOaiTlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b3nMTzx7CeKl+p2WhyFfm+kNvBwSeySVpwXxlvVVkM=;
 b=jEbk3FU1NtZT1hJ/SfdFrU88BqrcAI+1WezScmpmq9tDOSVcc2FQlbzowqJgrIgMqHTyBHSveNB6d+kPANO0rAq/QVte535WxGsnK/bM0qN0fOEEouO+MQxE66hTwcXvioprT5DcS/hJyQWeVnMVsIXeTew9KfKhFh157UClY+Z/WKq5/6QOxkWPKb20PrhBYGtfhqCmFKAPiv3tlNb7MzG6DFTZEjPLzfO7IlNloQYbnyZS9F8gPK8z9hvZbRdxGGshnRaw0Y2ha1nVwmJgJFVDtgQEgzQ0s7M1gt3OIGsHaEjo845M1X6x6uAZfamlV5a0MdSQFkvpwuPnmoewdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b3nMTzx7CeKl+p2WhyFfm+kNvBwSeySVpwXxlvVVkM=;
 b=CkuxX8fNGL76NCGflH9RJDqN6sUtHTF07jHw0HMf1jw3AJtZaehzNwj4OqKSSZeSl4SPOge6ZhPIKVCoYuwRQFrUoKHnd8+X24Fj75TX2Fm+OOaowgVedyu3BwJj3d/OV5/ULykCc3vzoysCGObtZWKiZms034jJcyiw43eA74A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9600.jpnprd01.prod.outlook.com (2603:1096:400:190::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:03:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:03:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
Thread-Topic: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
Thread-Index: AQHctrMYzyTndVuUVU2e9U4kfWBSaLW0Yq4AgAAh5zA=
Date: Wed, 18 Mar 2026 17:03:15 +0000
Message-ID:
 <TY3PR01MB11346072A839F94962DE4F69F864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9600:EE_
x-ms-office365-filtering-correlation-id: 2727f972-9baa-48b5-a3c9-08de85103f1d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5eOAUFpfkgSLjrmcFGEZWgt2Kp7X6jq4KDDwp/EaqnRO25j39K2V3khDtSbMaejbNoddwj8a31Cg1M861491+mm9wmlnFwEVUTMNSiRRTRnKxZWwLzFDKZWjDDym8qOWu3toe2lmdao/mlfP0pYMP9z3A2RnV8HC6kCiPR7na6MIIjmhzaLWRsuJJXl3oYAHO9LAyandbPaXGfsHSTL2pY0bvqSIAF2g2yCQPhREfMM9aij5S3TFXgaee+P/uJeYOEZ9Vpuo/nyZmVBmXj1/sEMybRb6rxDryQDvXFxQfw11ToFwTLacHCKXn/gpibN8uclqRpI12uYZZwKvGO2RzFtT4p/ACuEDfKij0rT5CtpacnFvUxVWg2uItS/04i0tcDO+cca6ONjZONLn/Mj3iSD0BxmX5HVfIXx/DOpqI++LQymbBBy37lOAD2r/22GJ9WwzfrMUHOkzoLyU9cGTLpjHkvrddPpWuTHF3dwYNnYcII5rSZZHoMl+bUDH8Nu/4/7BkbHBSZWoIamXmWtwbsZxih/ixaBdCB7rL/nbKAu2tBU6yeXdx9+tC2VHITxm6O9sljVI7tABJSpZMoOJl65cdN+bpnZA5XKD8hNOJw3P45/LFCiR6vm2dLke7mcEPG8x9LUYUzXcWYmKIltxq0uZYvaonXYZUVlQ+JfU17SDgE4o9r3JI2UtFaC6Q6+/4gA/s7Ygpqcmz1hLfqyWrRuX3A/Hnmb+ZkPs+GYbrwHtLU3kCkgnq/CIFzajBn0R4x/7KlEqSqXAzsAm7nPfE2FAiaADLW/92YtzbcmJTp4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXYrNEtOMm9iRzZZVDllRVQ0Y2NQVFlnQzN4cnRhbjYrLzhBdFJ6TzB2QUZr?=
 =?utf-8?B?SHpvNDVwaFlqSEdxUVl2cXBtR2Z1Vm1QR1hCWEgyb3FiQVRCVDZpTzNNRGZ5?=
 =?utf-8?B?T1IySGx6ZlJIZEhqNUFLRWh3RG1oVFhTSHhXSXpWL3dGeFY3QWdIcFdGclJU?=
 =?utf-8?B?anBLSXBsY0lkNXJTRlY1RHVDQStvREZKalRpODdvT0RrdFdKcGc0bE55eGdI?=
 =?utf-8?B?S0trMTdSdFBoRis1UHVkWTlNdGRhRFJFcHVGQjFOY1d0dUpkSWlzQTdtalZL?=
 =?utf-8?B?Z1l2TlB6UEhueHAyMlhjeXY2Q1QxK1hmMFVlcDFmNndkOXk2bUc5RGQzaEJM?=
 =?utf-8?B?dW1wMC9nYVZNOHBQR28xckRiVHM4S1JiYitmSzdFbHJPaVRNc2syNGF5YUUv?=
 =?utf-8?B?VVBOa0d3bUJvTEpKV29TNU9UZjczcngyNDl1em9jWTFDcDJWY00xb09Sd21D?=
 =?utf-8?B?ZmppYjF0MkhLNVZTV3NNUjV1cW84MEF3RXZaNUdFa3h4MEJTM1Y0RTQ2YXZr?=
 =?utf-8?B?aDlCa0FDZmhOUDltcytXbG40Yy9vQXlKTENvRkJoSFFKVGM5M1lXTXpqQ3Y4?=
 =?utf-8?B?d2lNNGtqaEcva2w3dkpWeFVtRy95Z0paVDh4N2RHYUhzQ3lFQ3dYSzNqbGlu?=
 =?utf-8?B?QWxwbjlWTG80VjEwZEVaSU8wNmh5c0hJZWgxZG9JK2xhOEh0dG92ditsb3kw?=
 =?utf-8?B?Vm95ZnptVHFEbmFXV2RScThJOFhEZnBmMVdMdUhlc2wvMFR4Y2MxNGU1R3RH?=
 =?utf-8?B?cElsRVFvMEU0NEYzb1VuY3RpNnhsTWNIb0ptRmRqSWkzMVFLclFoMHU1S01C?=
 =?utf-8?B?RHFEdmxnaVhwNVlwYmVMVlE2cGl4bStoN00yeGIyS2h1Nkt3dFE4eEpEOEsr?=
 =?utf-8?B?TmNzOVN5RFdWV2tzaFBqOFFmSWxialc0NWlWbWtwWlptZndmeW0zQjBmVVJJ?=
 =?utf-8?B?TlNBbHBZdTNSZnp4eXRPb3g0aTV0MTZHdnRmc3ZSODlXUmQ1V0J4ck1kZzA4?=
 =?utf-8?B?SjJRcTRHWldramJlRHFnSy85Z3FWdGF3UGpiZ0piMGd1YUJNNDdPVlJYMit0?=
 =?utf-8?B?V0pWWVppTS91bWx3UkN5K1VpWlJjbXQwT1A4cmVTODdlNTNOaU53RFhPVFB3?=
 =?utf-8?B?MVVOb1dLQnE5ZUpHTHp0OUQwVXYrNFJpSjA1aUxuY2hDbGhjLzVaeTBicUJB?=
 =?utf-8?B?N0grcTk4a3hST2FkY0hvZG1vbEErKy9KaGR2STBrdXFvcEZyZEtvQ01XRGhn?=
 =?utf-8?B?aklVK3hMQUpJdTJ6WmZ3enVTbVJoY2FjYitqL0UwQTYzYStRM3BwaGVXdk1C?=
 =?utf-8?B?T1JlR0VTQTdUcEUxSzZ0OXBCRXpMWFJEVHU3ZU04K2gzejdRbzhEV3Yzb2FQ?=
 =?utf-8?B?d2ZndGQwV3NNK0pNdFJTaGUzd0prRU9xd1RWVGIycUxBaFQ3YmJpdmJhYVA2?=
 =?utf-8?B?TnliazFHd3dQTmxGTWdSaUtsMUIvL0d2SUlZUFpDVTRMYVZ3RFpGdFRCYmZw?=
 =?utf-8?B?aUVsM1Fwa1V4ZjlkUG5yRDlUWGw3aytuWUM2eU9yb0d4WEpwQnE1TU01am0x?=
 =?utf-8?B?TmtiWjhUUHFFdzhza3c4NWx0Q09kMjNkQytONktINWFPT0ptOVNKemlManB4?=
 =?utf-8?B?TE5xSkx3Z0tlcnZtUTNBMk1BZHhBUk51dFlJb3JuRFJVNE5GOGw1ZE5vanNs?=
 =?utf-8?B?NVNZWXFWbGZOV2lFZFVqd1p3cjJCV2gxVXlScHg2TkNDK09xcmp3ZGRMWXhh?=
 =?utf-8?B?NERJa2tDbkNkVkZCU2k3MGtBRmZkMENiODlyZG1keUJ5TmpVNUQ1czhVcVBO?=
 =?utf-8?B?M3NCTkRvbXJpZEVnRUtVcEQ3LzN2RjJ5VXBYT0pFY29FSmluUFY2VjI2SWFN?=
 =?utf-8?B?MkF4ckFXVjRvQ1pya3hNNmJWbGxpRFlMSHdPS0dvL0h3TmlEU3VUdTBuTndH?=
 =?utf-8?B?cnVybVNaRGhNQ1ZDS0lFb1pMTXAyMzdrMy9sQW5mM3NNd0tFT3ZlSzkwMWgz?=
 =?utf-8?B?Z2RFd2NGNUxPNlZZMEhwK25vZEZlQ3lzNFg0cm1rM1hCWnNWenMrcmJVdFNr?=
 =?utf-8?B?RFlnbjBQYVRVTXJQL3N6TXN0Vjd4dDlFYzVDdnRqaklnangwZjlyZHhVK2ds?=
 =?utf-8?B?VU9aRnB0RTBKRzJnVEpja0VBSE5RcmlQalJYelI5SUVJZUlabEpwTDZ0cHRJ?=
 =?utf-8?B?MFJpa3hZcTl1dEkrYTlFemlNSFdReVFkdHVqRXI3WEN2aE5Pcm1FUnpDQUdB?=
 =?utf-8?B?WU9jMUZadGpGYllMTXpOZGViT09UOG50L3k4alE2K3lqWUtOR3FDNkNidzk4?=
 =?utf-8?B?SVp4dGEvZEdER3JkeGo1YUlsZ2MxcHBoR3ZWWGkvNEEzeHVWaWtzZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2727f972-9baa-48b5-a3c9-08de85103f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 17:03:15.7882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8E+JSRJNFfXDuKCqRHUOw7uY+emFZ+yYS7p3tbWZz9ZaNzeSDkmk8OpqiwCcbMzM94ug3CI76T+rtSnYvMUgl6/qkq/Q33GAHlgkT/uU7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9600
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29805-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 2AA8B2C1085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYgMTU6MDENCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAzLzldIGNsazogcmVuZXNhczogcjlhMDdnMDR7Myw0fS9yOWEwOGcwNDUtY3BnOiBBZGQg
Y3JpdGljYWwgcmVzZXQgZW50cmllcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgMTgg
TWFyIDIwMjYgYXQgMDk6NDIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4g
VGhlIFJaL0cyTCBTb0MgZmFtaWx5IHJlcXVpcmVzIERNQSByZXNldHMgdG8gYmUgZGVhc3NlcnRl
ZCBmb3Igcm91dGluZw0KPiA+IHNvbWUgcGVyaXBoZXJhbCBpbnRlcnJ1cHRzIHRvIHRoZSBDUFUu
IEFzc2VydGluZyB0aGVzZSByZXNldHMgYWZ0ZXINCj4gPiBib290IHdvdWxkIHNpbGVudGx5IGJy
ZWFrIGludGVycnVwdCBkZWxpdmVyeSB3aXRoIG5vIGRyaXZlciB0byByZXN0b3JlIHRoZW0uDQo+
ID4NCj4gPiBNYXJrIHRoZSBETUEgcmVzZXRzIGFzIGNyaXRpY2FsIGJ5IGFkZGluZyB0aGVtIHRv
IHRoZSBjcml0X3Jlc2V0cw0KPiA+IHRhYmxlIGluIHRoZSBTb0Mtc3BlY2lmaWMgcnpnMmxfY3Bn
X2luZm8gZm9yIHI5YTA3ZzA0MywgcjlhMDdnMDQ0LCBhbmQNCj4gPiByOWEwOGcwNDUsIHByZXZl
bnRpbmcgX19yemcybF9jcGdfYXNzZXJ0KCkgZnJvbSBhc3NlcnRpbmcgdGhlbSBhbmQNCj4gPiBl
bnN1cmluZyB0aGV5IGFyZSBkZWFzc2VydGVkIGR1cmluZyBwcm9iZSBhbmQgcmVzdW1lLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I5YTA3ZzA0My1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMv
cjlhMDdnMDQzLWNwZy5jDQo+ID4gQEAgLTM3OSw2ICszNzksMTEgQEAgc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCByOWEwN2cwNDNfY3JpdF9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+
ICAgICAgICAgTU9EX0NMS19CQVNFICsgUjlBMDdHMDQzX0RNQUNfQUNMSywgIH07DQo+ID4NCj4g
PiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByOWEwN2cwNDNfY3JpdGljYWxfcmVzZXRzW10g
PSB7DQo+IA0KPiAicjlhMDdnMDQzX2NyaXRfcmVzZXRzIiwgZm9yIGNvbnNpc3RlbmN5IHdpdGgg
Ii5jcml0X3Jlc2V0cyIgKGV2ZXJ5d2hlcmUpLg0KDQpBZ3JlZWQuIFdpbGwgZml4IHRoaXMgaW4g
bmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=

