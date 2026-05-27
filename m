Return-Path: <linux-renesas-soc+bounces-33224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNMDBvIUF2pf3QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:59:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C45E7557
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68490300EF7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02AE37C112;
	Wed, 27 May 2026 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BXWxyiCH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F537B41C;
	Wed, 27 May 2026 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897181; cv=fail; b=gRS5liEPbwwRkQCdhhFysRGmLaPXIX3xrp9GiegGLhLE/JwNOlAVO3+ExOKCIwRuozeAXWEm2Zn+X3msIUT1B3hwzni4/xfLdYigHy1PpKYKeOHhy5WbrRE1K5SlsFU3+WvYqsv80BIVTc2jqUV4CeYztE06PpewzWfE9/1TDuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897181; c=relaxed/simple;
	bh=4oLCuOsjlQ9w4+jXCT08tBHTrkCGdVagVGKhI+FiE+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B7yAiFFelZ5H/d46xhWZ/IZ63IYvO68mT5hyCHM0pBv3OqULl/jOOChUbwfLx/3D5tAW3qPQkxbDigTmgB8EoKUuiWpkRBYAW66cu1Xy9ru6G7O7j2awcbhegDGTvCUZ+/Q1iAyOQ4WqtS0lpfFHbhD6453UJK+zttlbxfyQtX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BXWxyiCH; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJkGI9WDVhKRgMJSzbQkcAHE169dj2QZoy4bkhDGhrbkY2+lAgrjTdoCtmn/z9wvKK16xoplAH63YY5dPZy/Po0RalP4QdTeIRjF6JbERfHKZeHe+FUi4wTmN4JvR5arSKmlHZbqM/MV8H8JeQ0UZibn3f1fA7TmJoS6FCdNnsW8EgSziuuKTtlmp2c998RnV9P/gXgzJVMFmnm0d/Mc3xsiOA3+i0uSorJ9f5aYoivOoVcFxJnRbmh+AFODpaHKbG5r4qzvjhY1GjrfLyBP8XcVp0ob2oT96T9AvJgYdcRXCKxGRVp35jExwJoxghqyOjIKwJ3LOJWnobkX1bZmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oLCuOsjlQ9w4+jXCT08tBHTrkCGdVagVGKhI+FiE+c=;
 b=Rjh1bSjmR/6/S8rtnUY0C+VMRg0nknotfiB2zpNwZlsC2oWpeVhavH4LEgbaLRDiO9CSJx+kMqEQncfL5DGj/aMkvWXC0bQ4dguuLIlsuPiEHgHZTFrXRLONJpR/zCnOhjQN5c2EAUnY9mSgDJpHVKmBZPWQmzzsZL0ID9h12ve05BPLRoGkktpCqCS2uFHZ9+KBJ6iiZQAeHzS9B7V74jDEDtCK2vWlBcFqlG3CkP4OHPBtnVGe7FvitzcxjMuUk9NUfK2ikFOQNBynusY6pwMZzi4yJfPHky0ZFAJBqTYM/TjswjDnzIpyN+DN0F4edysNL52/ODdRD3K7QXUafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oLCuOsjlQ9w4+jXCT08tBHTrkCGdVagVGKhI+FiE+c=;
 b=BXWxyiCHpehWpKkwpTPemPGrDj255c0qHvZTnNONl3AJ28jInjlXrKvauI+yf3+kE/6UrRP7ME6Nq4oXbKu4kJ4y8Njxt5Kwn7hmunne94fPn3OHYE/YQdF1kqD92WUhoeHPQ2w5PRK8d9d9ynBbV17ZlD6pzSC5GAvQqRDYRQ8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13513.jpnprd01.prod.outlook.com (2603:1096:405:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 15:52:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 15:52:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/4] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio
 keys
Thread-Topic: [PATCH 3/4] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio
 keys
Thread-Index: AQHc3F0d8zzYPB/UfUagFLNzhBFi7rYiIwsAgAAEdGA=
Date: Wed, 27 May 2026 15:52:56 +0000
Message-ID:
 <TY3PR01MB11346DD6AB3AB6D3FFC00FD3286082@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
 <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13513:EE_
x-ms-office365-filtering-correlation-id: 0314760c-eae8-48ed-ecb4-08debc08052a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 gKl4x4oUiWS/nXU5SbUfVFdxLbDiN9+66JXjWz3+efTG29zTvQxYd8ILwLU2t2Atbdes1RQXcrbVLqfp3CuRDKYJiPpo67d2aqExLsax2z4wcJ09lYXrPI1AcXJnyJDZuMoK9B9/KKd7L9Q/0eGEdnP9zUFQK1a39UT9hiDqadu6m9s4UYywURhG0MxvxRCdA9T30lOiWobCwkgDayI9gpKOSs9Uv4CKqeOUOVylI+J+jYRYtljsGdKtd35QJ6fFqMFv9N4WTR3MIfph3fVR9fod5vNQJU2+ug5AWskVbYl47Gn9Rvtd/QSvdlzLDoFnMk+Hd3ehD3tHEuTqU0ZtalyXybVRXgE8BG3CPjMwdyxD8J0NSpfVfltRy8dRpx3DbV8y9uecJv35V7P4E4axvb0C9rR2dtsa5U2KvW0qkEY8bENlAOyfvQ5uoUZf+4Rp1SxYCjLCuSVNBW/Zw+pnkOGDeuJ6ylSSLaB7kiAydv0+nCwVbFZv81UODXRoeMr1vdHgc0GrpkBoFywi5+j/J9GzIgxD4lg5Tr6HTnpfzxoChyFNz3mHvcmSuQy8q5EOQEnKbQGvOU/McftICn+36WbKDnk7EFTFPZeAW5jcUQi/10F76ZbI1MzTaXRIUChQ3WHbxTDm6sZWQ6tfOsoShAwYLWd+Ne3iDh7urk2vybxhF9lcjud97RWfvECeM9UerY+nCxIRP18SnIJ1EbmH37E6uIHOb4PD0yXLZLfOZWFv6/Ku8cPQ58XQ1SewScHC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWJtMHQvb0p4THZ2Z3h5VkhQeldRM1NTSW5TWTZrR04zTVlXaGJIT1dadEoy?=
 =?utf-8?B?aTdCNHQvbHhMaXpjVkc1a0orTWxoS0s2aVVPYTM5NHlkQWpOcWcxYlVWT2Fm?=
 =?utf-8?B?UXdJTU5jckhUVjAzRnRCbkVWSFZsVkpOSFNrRmVJWVJ6UFZYa3JlMytZNnM0?=
 =?utf-8?B?cGxGdmsxalVNWTlBUzR0QnlRUGppWFhmd01UVkovaE0vQmgwSlppVmpSakhw?=
 =?utf-8?B?OTRKMyt5ODZyL0grd1FxMFdsRXozZm8xVzRNaDNtcmMxZXNUeDBoT05xd0th?=
 =?utf-8?B?ak5oMTdYU3Y1TS9CeFU1LzZCbEpneTQycjRHdGFiNmEweFJZUHo0QTV1THow?=
 =?utf-8?B?TE9QU2EzTG1YSlU5SWh0VEJuNnZUWHdreFdjK1N4amU4a3JieHdGVzR1VUhP?=
 =?utf-8?B?SEtMcVg5NVdsb3kwd3NkbWRtMFloczhQZHlUWmk2WFI0ZnU5VkorL1BXcUM2?=
 =?utf-8?B?R3dYMFdFUGgyNXJhYis3ZDVzNGNrdlhHbEJrVkl1bUwwbG9zdmZna1ZZc2FX?=
 =?utf-8?B?eHpGRTdSTFEyNGNWY3hZcGozeldnVGdXSTQzdUUzbmZldUllellLMTQ1K3lL?=
 =?utf-8?B?R29wTi9sSHlGbkVDTVorVThQV0ZMbnlGekJPQzF1dlpxQWxSenBaQTZ2ZHcy?=
 =?utf-8?B?ajBmYkprZVRUMmk1OXZhNXhpemdiL0gvMmVFcHRRM1FiQVpyTjQrbk5tZDhT?=
 =?utf-8?B?UE9ydVVhT3RqWDJJTlZ5T0dsdUpFWlEzK0JGRnJvZHhtN2w1d1daakw2aVN2?=
 =?utf-8?B?NFZDV240Uko3L3g3Ym53RVUrSDV6R0hwV0ZvS0w3NkNYSVRNOHoyT2ZURTVm?=
 =?utf-8?B?T2pydzlCOXZYbjRwaVNCeERPVjFsbVlDRGdjNU9aMFhURFRnVnJzeEZKZlZG?=
 =?utf-8?B?NTlzd21KTXNFaFc2WURJck90TkIvZEFjVml6OG5say9RTmgyS1lIaDE5Z1Q1?=
 =?utf-8?B?WnFCdEFrWDFxSDFXTFQraVdKVWUwOTMzRHVBeXhMZjZBVndZRlFnUXN3RCtw?=
 =?utf-8?B?RkcyaDA4bmdHVGJwZk5Ua09INEhKRG9DT0RmMSsrRmRWSUhkM0p4TExqTEY3?=
 =?utf-8?B?ZStOR3E1b29VbnBpM2lwYWpKczJpMjdkWDRlY3dIRTdFT21oOFVtSFlkUEFY?=
 =?utf-8?B?VmE2RjdDU2ZUS1pqRzFDWThQSGZqaEo5blR6U0d5MlR4TjZoUUppa3VIc2ZY?=
 =?utf-8?B?MHpHNXhORlFWZUgySm5odXJ1ZlJFb3dlRVVsL0NWWVdnZlRhV3FCWmxnSmdx?=
 =?utf-8?B?T253TW5TRm5VZko1UWhrcjdQYmQ0bWlPV1Q4ZTcwQU8yd3dUbDlHdXNSUStZ?=
 =?utf-8?B?ZVpYbnAxeGFGd203UzJaOG16cjArMFFXMnBQa2x5TGo3MTVmUjJSQkVBcHJl?=
 =?utf-8?B?R1lscU5HOFozakZONjh5OEppeDRndGhDUUxDc3poTW1CVWIxUWVlUmRaY3Rk?=
 =?utf-8?B?OVI5MFM0dWQ3ekhpeHFuSHBEYTc0Q0liZm5QWDJGTFRiNWkrK0Fhakk5Y3Nh?=
 =?utf-8?B?eXEvVEpiRjZnWmlLK2JJME1iVmNCQXlMNDV4aUR6Sm03SW1RNWpRZVZxWlYw?=
 =?utf-8?B?NzJSZE9sZml1T2V3TUZDU2Y2dy85bFp0ZW5hNGtlb2FBZTgwVDA0V3RnNEtL?=
 =?utf-8?B?N0hQWmJPL0R5YVV6UkdwL21Na3hRVk9LVEI1eFk4NUI4eUd4VFZVWjVUUnc5?=
 =?utf-8?B?Q1dkRmFKWmUyRHJOQVRzOWRLZDJFZmszUlA3RElLYjhldUVzemx4b1R5QmtK?=
 =?utf-8?B?K0k1YS95Y2ZMam10WDdKdTFXRVJXZ3EwMU9KeWY1NVRsK3FpNDFlVU0rQW44?=
 =?utf-8?B?UTZwY3ArdFhWWGZGVnNVRUdsZlkrR2MzSXNHSm1GSUxmVFN6emZYSXl2NWN1?=
 =?utf-8?B?REVVYXVGTmJrQmhYd2pLNVlRa3Q4c0pHUDJJMit6T2s5OHBmVkQ0bjk1ZTVG?=
 =?utf-8?B?ZGVsejZabUNjZkhzQlptY3R5ellhL1hDUU13dGdhY1FSMk1XYmRvNU9nM1Fh?=
 =?utf-8?B?MXF6MGRpODR6T05jaytpOU03OXR1akViVkFKVnRlZjFPM2Y0QWpWN1Qwa3Nk?=
 =?utf-8?B?Um1lRDA1cU9jYzBMRTBNS2RtZzY1aEF2MW1UUjMyMiswaWhoVzVRTXA1aXJK?=
 =?utf-8?B?VG9hbXJnUTZicVJ4b0VQSlhlM2UwT2szNGdVMXBVRnVnN0FpL0U0MmppckZu?=
 =?utf-8?B?SThKc0YvbUtPRE93QmhaOXBoVVIyNWlOMVZ2b1RMelhqb0VyZ1ZLeThaa1lO?=
 =?utf-8?B?QXRwUkp2UlhTdXQ5WXRTdStkTG5rdVRnK2VHR2Ivd0ZIN21uSmlESVlyYTFD?=
 =?utf-8?B?UGw0SU9nTzB4dEhNR216dkVoMGNZVUkvdjBMOW1OM3V1dXUrZk9RZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0314760c-eae8-48ed-ecb4-08debc08052a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 15:52:56.5321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgafjxCPSF7UsinWWmqWAqWjkxsDvGjch5J550a4POyG/Dklp6c7PCiVO0AWdSK4LA9iMXZg08c01tm6pZcJr0fD6C7ePWoBHKu64U9jh2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13513
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
	TAGGED_FROM(0.00)[bounces-33224-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.979];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 620C45E7557
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI3IE1heSAyMDI2IDE2OjMxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
My80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDZsNDgtc21hcmM6IEFkZCBncGlvIGtl
eXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDUgTWF5IDIwMjYgYXQgMDk6MDIsIEJp
anUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gUlovRzNMIFNNQVJDIEVWSyAgaGFz
IDMgdXNlciBidXR0b25zIGNhbGxlZCBVU0VSX1NXMSwgVVNFUl9TVzIgYW5kDQo+ID4gVVNFUl9T
VzMuIEluc3RhbnRpYXRlIHRoZSBncGlvLWtleXMgZHJpdmVyIGZvciB0aGVzZSBidXR0b25zIGJ5
DQo+ID4gcmVtb3ZpbmcgcGxhY2UgaG9sZGVycyBhbmQgcmVwbGFjaW5nIHByb3BlciBwaW5zIGZv
ciB0aGUgYnV0dG9ucy4NCj4gPg0KPiA+IFRoZSBVU0VSX1NXezEsMiwzfSBjb25maWd1cmVkIGFz
IHdha2V1cC1zb3VyY2UsIHNvIGl0IGNhbiB3YWtldXAgdGhlDQo+ID4gc3lzdGVtIGR1cmluZyBz
MmlkbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRzDQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Nmw0OC1zbWFyYy5kdHMN
Cj4gPiBAQCAtNywxMCArNywxOCBAQA0KPiA+DQo+ID4gIC9kdHMtdjEvOw0KPiA+DQo+ID4gLS8q
IEFkZCBwbGFjZSBob2xkZXIgdG8gYXZvaWQgY29tcGlsYXRpb24gZXJyb3Igd2l0aCByZW5lc2Fz
LXNtYXJjMi5kdHNpICovDQo+ID4gLSNkZWZpbmUgS0VZXzFfR1BJTyAgICAgICAgICAgICAxDQo+
ID4gLSNkZWZpbmUgS0VZXzJfR1BJTyAgICAgICAgICAgICAyDQo+ID4gLSNkZWZpbmUgS0VZXzNf
R1BJTyAgICAgICAgICAgICAzDQo+ID4gKy8qIFN3aXRjaCBzZWxlY3Rpb24gc2V0dGluZ3MgKi8N
Cj4gPiArI2RlZmluZSBSWl9CT09UX01PREUzICAgICAgICAgIDANCj4gPiArI2RlZmluZSBTV19E
UElfRU4gICAgICAgICAgICAgIDANCj4gDQo+IFRoZSBtYWNybyBTV19EUElfRU4gaXMgYWN0aXZl
LWhpZ2guLi4NCj4gDQo+ID4gKyNkZWZpbmUgU1dfR1BJTzQgICAgICAgICAgICAgICAwDQo+IA0K
PiAuLi4gYnV0IHRoZSBtYWNybyBTV19HUElPIGlzIGFjdGl2ZS1sb3c/DQoNCk9LLg0KDQo+IA0K
PiA+ICsNCj4gPiArI2RlZmluZSBQTU9EX0dQSU80ICAgICAgICAgICAgIDANCj4gPiArI2RlZmlu
ZSBQTU9EX0dQSU82ICAgICAgICAgICAgIDANCj4gPiArI2RlZmluZSBQTU9EX0dQSU83ICAgICAg
ICAgICAgIDANCj4gPiArDQo+ID4gKyNkZWZpbmUgS0VZXzFfR1BJTyAgICAgICAgICAgICBSWkcz
TF9HUElPKEosIDMpDQo+ID4gKyNkZWZpbmUgS0VZXzJfR1BJTyAgICAgICAgICAgICBSWkczTF9H
UElPKDYsIDQpDQo+ID4gKyNkZWZpbmUgS0VZXzNfR1BJTyAgICAgICAgICAgICBSWkczTF9HUElP
KDYsIDUpDQo+ID4NCj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiA+
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaD4NCj4gPiBAQCAtMzAsMTEgKzM4
LDE3IEBAIGFsaWFzZXMgew0KPiA+ICB9Ow0KPiA+DQo+ID4gICZrZXlzIHsNCj4gPiAtICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gLQ0KPiA+ICsjaWYgUlpfQk9PVF9NT0RFMyB8fCBT
V19HUElPNCB8fCBQTU9EX0dQSU80DQo+ID4gICAgICAgICAvZGVsZXRlLW5vZGUvIGtleS0xOw0K
PiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyNpZiBTV19EUElfRU4gfHwgUE1PRF9HUElPNg0KPiA+
ICAgICAgICAgL2RlbGV0ZS1ub2RlLyBrZXktMjsNCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICsj
aWYgU1dfRFBJX0VOIHx8IFBNT0RfR1BJTzcNCj4gPiAgICAgICAgIC9kZWxldGUtbm9kZS8ga2V5
LTM7DQo+ID4gKyNlbmRpZg0KPiA+ICB9Ow0KPiA+DQo+ID4gICZwaW5jdHJsIHsNCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNvbS5kdHNp
DQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2wtc21hcmMtc29tLmR0c2kN
Cj4gPiBpbmRleCA2ZDg2Yjg4Y2UxMDQuLmJjMTE3OGM3NDg0YSAxMDA2NDQNCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2wtc21hcmMtc29tLmR0c2kNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2wtc21hcmMtc29tLmR0c2kNCj4gPiBA
QCAtNSw2ICs1LDIzIEBADQo+ID4gICAqIENvcHlyaWdodCAoQykgMjAyNiBSZW5lc2FzIEVsZWN0
cm9uaWNzIENvcnAuDQo+ID4gICAqLw0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIFBsZWFzZSBzZXQg
dGhlIGJlbG93IHN3aXRjaCBwb3NpdGlvbiBvbiB0aGUgU29NIGFuZCB0aGUNCj4gPiArY29ycmVz
cG9uZGluZyBtYWNybw0KPiA+ICsgKiBvbiB0aGUgYm9hcmQgRFRTOg0KPiA+ICsgKg0KPiA+ICsg
KiBTd2l0Y2ggcG9zaXRpb24gU1lTLjUsIE1hY3JvIFNXX0RQSV9FTjoNCj4gPiArICogICAgICAw
IC0gU2VsZWN0IG11bHRpcGxlIFNNQVJDIHNpZ25hbHMgYWN0aXZlDQo+ID4gKyAqICAgICAgMSAt
IFNlbGVjdCBMQ0QNCj4gDQo+IFdoaWxlIHRoZSBTV19EUElfRU4gbWFjcm8gaXMgYWN0aXZlLWhp
Z2gsIHRoZSBzaWduYWwgU1dfRFBJX0VOIyBpcyBhY3RpdmUtbG93LCBzbyBzZXR0aW5nIHRoZSBz
d2l0Y2gNCj4gT04gcHVsbHMgU1dfRFBJX0VOIyBsb3csIHdoaWNoIGlzIE9LLi4uDQo+IA0KPiA+
ICsgKg0KPiA+ICsgKiBTd2l0Y2ggcG9zaXRpb24gQk9PVC4xLCBNYWNybyBSWl9CT09UX01PREUz
Og0KPiA+ICsgKiAgICAgIDAgLSBTZWxlY3QgU0RJTyB7Q0QsSU9WUyxQV0VOfSBhbmQgR1BJTzQg
QWN0aXZlDQo+ID4gKyAqICAgICAgMSAtIFNlbGVjdCBKVEFHIGVuYWJsZWQNCj4gDQo+IFNldHRp
bmcgdGhlIHN3aXRjaCBvbiBwdWxscyBSWl9CT09UX01PREUzIGxvdywgaGVuY2UgZGlzYWJsZXMg
SlRBRyENCj4gU28gdGhpcyBpcyBpbnZlcnRlZCBjb21wYXJlZCB0byBTV19EUElfRU4gYWJvdmU/
DQoNClRoaXMgaXMgYSBtaXN0YWtlLg0KDQoxIC0gU2VsZWN0IFNESU8ge0NELElPVlMsUFdFTn0g
YW5kIEdQSU80IEFjdGl2ZQ0KMCAtIFNlbGVjdCBKVEFHIGVuYWJsZWQNCg0KPiANCj4gPiArICoN
Cj4gPiArICogU3dpdGNoIHBvc2l0aW9uIFNXX0dQSU80LCBNYWNybyBTV19HUElPNDoNCj4gPiAr
ICogICAgICAwIC0gU2VsZWN0IEdQSU80DQo+ID4gKyAqICAgICAgMSAtIFNlbGVjdCBSWl9WQkFU
X1RBTVBFUg0KPiANCj4gVGhpcyBpcyBhIHNpbmdsZSBwb2xlIGRvdWJsZSB0aHJvdyBzd2l0Y2gs
IHNvIHBsZWFzZSBkb2N1bWVudCB0aGUgd2hpY2ggcG9zaXRpb24gY29ycmVzcG9uZHMgdG8gMCBh
bmQNCj4gMToNCj4gDQo+ICAgICAqICAgICAgMCAtIFNlbGVjdCBHUElPNCAocG9zaXRpb24gMi0z
KQ0KPiAgICAgKiAgICAgIDEgLSBTZWxlY3QgUlpfVkJBVF9UQU1QRVIgKHBvc2l0aW9uIDItMSkN
Cj4gDQo+IEhvd2V2ZXIsIEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBsb2dpY2FsIGlmIFNXX0dQ
SU80ID09IDEgd291bGQgbWVhbiB0aGF0IEdQSU80IGlzIGVuYWJsZWQuDQoNCk9LLCBJIHdpbGwg
aW52ZXJ0DQogICAgICogICAgICAxIC0gU2VsZWN0IEdQSU80IChwb3NpdGlvbiAyLTMpDQogICAg
ICogICAgICAwIC0gU2VsZWN0IFJaX1ZCQVRfVEFNUEVSIChwb3NpdGlvbiAyLTEpDQoNCkNoZWVy
cywNCkJpanUNCg0KDQo+IA0KPiA+ICsgKi8NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0
bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=

