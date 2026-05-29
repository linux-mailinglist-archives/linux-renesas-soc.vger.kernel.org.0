Return-Path: <linux-renesas-soc+bounces-33336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJICMKZoGWpMwQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:21:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AE600B5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F177B311D6A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464113C061C;
	Fri, 29 May 2026 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VqIkkOXQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69F3C2799;
	Fri, 29 May 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049754; cv=fail; b=bihvj6cYg9t9ZmC0aArGaNNxNFFM7bS2ZYx9rbQ0wpeEJ2ZK/WYsw0vN8dwvB48uHJo1Y4cDrYgWYU6t2dPqiio2TqNpRxAZjhPJhSxRTLA1TKUxuyGmbQT6y6mgqtyLqueQIx9hLBb6kXiGrERTvOp7+bz/hm/DlXBMbK53Wik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049754; c=relaxed/simple;
	bh=M/cEEhN5ZbyeMTTLcrdE8u02X3wJgJU5Cce76tkFJ2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U86d/Zp88QGe5j1p/PRZWhm58o5+E/EgNWDhfLDVNI3hnQ8Flv7hnetEcWwgUkpfcXKmutsGVdCSAG5f/cT9p/mn3DxBQ03SmNc0fQkAyXtmK7CLR4gevy0XX687qhnc4R7BFDILNR5kPOgWDqChU48MJZd7e8Rahh4WiYlmLU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VqIkkOXQ; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FygpKjPy4Jjahe4iIu1tDbmhfw11dCgsWXqUoUQbM4LnOa/e9EZ8pYicYtGa58MBym5K7uSc5dZdzMnv3tHVnTHuNGm59C8hHrcCUDz3MLThqLK9by/pd3kyof1oYdsGHxRhcD70QEuCTHqErkuKix4b0Vx2HJoxi87i2WQ4YVV/xQo/9Zh/t+9jzJ25cDbu5tKnOc/qEzCTuY5jPC47T/7AHa/fFvU/ivBgdl6RJH/JYJkr7Efz+QzciM3zhx5849wKAeYXkoIYapQ1HbamokbrX3whxLwWYJxsK5kwGqsbf1AOhskPMgLrHDQvtMxUFzoNjGHM5u9ExLQJ52YCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/cEEhN5ZbyeMTTLcrdE8u02X3wJgJU5Cce76tkFJ2U=;
 b=M9RhZZSVvqWAZFx7FNKolbB22qw1DRrCRMovJ6pQcdITodEQu8hQrfS/Uo4vdkdK0nrnsDuraXFDh5XT8QiNs0ttC2r9c/6BCl0DualUHOgef7tjkvCNXg/FX9/XCRooq3AYC73tOnQJ4o2JfjrWuiF2F13zJBde0DLJ3MQeD8mW/7h2YtdCVvqVd0l/mBZT/ip2jKp/dEepoC0kiyiaKXN0lFMvilHaGdVoHbekVzptbP+YK5hvHaxLvEAmd+xdiZWvARH6tUfW0l5omivh9JNkiAL3PClvamWxEXVy3JEL2nllZ3Aswj+1fu8bn1ud5y09fMcgbUlTrNGb1dmCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/cEEhN5ZbyeMTTLcrdE8u02X3wJgJU5Cce76tkFJ2U=;
 b=VqIkkOXQDnvym3yboWZksuvHNRjEGn9ONlMna6ecN0P9T28fZK7EGv/42rzlp4guxB7h8C7uJQhp4GsXh3QxViKsyeVfEJkBP4kM+6RYj2CpBDgla8Oobb+P4N5ghjbCHmnubNuz2mqm7fr4jUn2WGhCVDzif7ikXxoQHmVVogQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10072.jpnprd01.prod.outlook.com (2603:1096:604:1de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 10:15:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 10:15:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 rsci{1,2,3} nodes
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 rsci{1,2,3} nodes
Thread-Index: AQHc53ZXGieIIIP58UeTyJj49W45+bYk0xiAgAAFemA=
Date: Fri, 29 May 2026 10:15:47 +0000
Message-ID:
 <TY3PR01MB113462F7B853E3245BB07370986162@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
 <20260519100022.116318-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXEnidpA01431Rqm_X1ro0XD0zRXuYEao1Y2H5dB6BF6w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXEnidpA01431Rqm_X1ro0XD0zRXuYEao1Y2H5dB6BF6w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10072:EE_
x-ms-office365-filtering-correlation-id: d0a155e6-6496-4426-cd89-08debd6b4045
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 nc0GSMRKs/QqIPQlgpeaJjGLj4+iL/+C3pyXa6M/j7fgiJYAcGFyMN8mx/v3bsHMOoQEohZko9/ClGG4dAr+PZXUvka4/AsV7fwbW1f/UKWGu6FAVNnJp3kAAmmVIVTdrLQZwxDXApHiC1m4lbE/OQuFf9X69XU1f8CPLkAGhbciFzxG4JQXUxczy51k83O7nu2sT1upb30CDs1aa7haNJzU8etEqm1WwPH2mP2+b8cs6pBKfZanYTOvNe3TdjA1AEtyx8HKoh6mYVwAw73YQ+gGVW7cByHyc00XiTs6Z2yTmmHsbmQ2jVOsIlL9Z/88x+qtq22FE8KXUzv+3CZpd1cJM3HzMtotS4YVH6SvxxaZsJpYFxq1lG4pTi1LVQwAIOE3wFTeQD2fif6CO1BCQL8gML33h9QXrVa1J1QHxrX250np2L2HQCtmndqiDVh4G36d5Qdb9TDIOP4iZLB6/qV8q/q3nLyarbcXmWbGVjmX7S/yOfkLdOeImtTTsEhvokXtWzJ+ela/8T3peLnPgD4E9E68Jlv5RRqjjY+zrPar7Io7dcBrp51lhU0Fj/kWmwmo10wcWkkKn1kXPOT8u1yjLKlsk431xcJmAg9cI6NF0c1iBXTRbgmK/p+NgTn+K0DCUN52JzucdhevFBQmjU5F9U8LkI9hLRJANWEoRB1bqcXuTVDK41Fo+qQyHl3Y56Cr9b9rZVxyf994hYE2MxMSOICmUhbj2xstPGQzu6TlnJpe+Sc1UE8yO9ygOkWa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d05rL0pDSHhJSktRYjR2Ny9sUkJpV29SMWx1WklEQnRsdVIxY0F0SG1DWU5u?=
 =?utf-8?B?WUFJZ2Nja3JtbTNWcGhLaWhIK2pMeG14U3JIc3gxdUMwQWhUb1ZiNFF2TitO?=
 =?utf-8?B?WXM5WlRpdXpWbDNNS0ZJTEwzODY4cnlwdXQ1Z0dKYnZ4UnVsSk1GdVRVZStt?=
 =?utf-8?B?Mzl6STcyMDVpVEdaZ1UxeGVTbUVibG1jajFtTStVTWIxbUdLSHFLYlpreFBS?=
 =?utf-8?B?ZXVZQnY1bzFxblhuVnlsbThTOTBIWE1aMDNvUHYwaHFpVHRydkc2dS9HV1ZL?=
 =?utf-8?B?TFlCUThud2dhMFpHcXpFMURrSnorblVCTzc3dzZuNWZBejc1RTJRQ21XRTNQ?=
 =?utf-8?B?NHBKYmk2bnJVL0V3M2V2TU5YZ21LMXhGa3ZwcXhGdXJqdkx5bE51UXM3MWJo?=
 =?utf-8?B?TDB0SVY1OHlkRGpvQllNOXNqWkk4a2V1Mkl3bjV0QlJjWU1NRDJDVlRKWEdz?=
 =?utf-8?B?blpMVU5EYURqT0c4UmlFMFhEWVkrWUtDbVBkUmYxMnVCejgrYkp5MitFQVVT?=
 =?utf-8?B?dGk2VWRWNzhPUnpKR0FPUGVBSTlYR2tiR0dtSjRQM0ZaN3I4SUh1RTdkR2pN?=
 =?utf-8?B?R3JIUzBMQTdkcFRkRXJVT09GaDNiZjY2T0czZEcvKy9lY3hLZkdOS2dkMkw5?=
 =?utf-8?B?S04zOVdJTVl5M1poSm5PV1ZadVI0Y1dLbHBwcGdjbm5ZZkZoQVYwRDZrU3Rx?=
 =?utf-8?B?dlozcTBRWXRVcDdxVFQxMzVWS1Q0Yld3RmdkL1psWHJMTkdhRlorZ2p2LzFo?=
 =?utf-8?B?ZUdjNU5Yc0F1a09WcVo3L044UVF3dDNObEsvdndaTUExRlNWY2F0VE1iRGRv?=
 =?utf-8?B?SXpqNzNRNURzcjVJMjVldWxpcU0yY0REaFRNRUJQVVRxbnQvcnVybWZ6cWg1?=
 =?utf-8?B?UlM0U2hjUkxReWxnWjlPSXhKdzVYTFpIR1pGOVA0L1N5TW5BMHFSZWhBNVpx?=
 =?utf-8?B?MlFxNWhhRW0xa1NTYWFjeXNnVGMvVGN2VE5qNUNTZ0VhSEVBSXFWWWF4RERI?=
 =?utf-8?B?N1V0eWl6MWYzaTlQQXFGOUJzTWlmRjRvVHh3S1BOYTdZNDB6ckdNcUFLSnJL?=
 =?utf-8?B?aFpXOVJCc284ektYdjBES0lvaDI2dkhvSFNoR3JueDUvcElLc3ViN2RGSnZQ?=
 =?utf-8?B?dnlpVEFEQnEzZXc1NEVpd1FWZzhCN3d5TGlab2xuc0NOay9RRDd4S2JRaGZV?=
 =?utf-8?B?UGpmMmVjb05mMlVtYTRCaEFRYnNPbE1XekFZMFJOR084dkZPQU5ENjhoeFYr?=
 =?utf-8?B?NmpFb1FSaDdJQnRXZ1R0VGIwMlV0TVJDci9qV3R6Zlp0UW9vVjR6Q1c4NW9O?=
 =?utf-8?B?QUpEWTZlTEZhV1JNcEoyQmFMd0ZtOVQ3YWVkemVXUXRLdTdCREhXQzFITGNC?=
 =?utf-8?B?ajEvUWNsRzVVVVE0WmEySmRtOVVFWDljY0psaVU1d0xKOE51NDFEcjdPWGxG?=
 =?utf-8?B?K0Z6eDFKOFBpNjllZjV3bnJWZ1NuaFM2MUkwQ1hPRnpiK0JtQldscmVXZGdw?=
 =?utf-8?B?V1lWNnUyTjE4SUY1U2xZcU45N01rZXdaUC9iMU1Zc2syU0JDUHZuWHIyT1RD?=
 =?utf-8?B?Q1l6cWtvZHZCSTg4a1MrYlFoeTlrUk5BeFVPeXAzdHBGTnZaVFYzRGY0Ykc3?=
 =?utf-8?B?RjFlVjRsS2pFZDcwc0xBZWd2TDE5L0pwenpJNnlIOWdZb2oxaXdxQmRLNzAv?=
 =?utf-8?B?eHllMkxVZWxoRGZjUmxBR09qU1cvUkFnV1pyWTdtZkdBbUI5V0FGTXhkd3RR?=
 =?utf-8?B?eDRnWnFpRC9QbzhEKzlSMGxXbHd1M1pPYmt1ZjFDYU50Y2tIVzBOWjZNQklp?=
 =?utf-8?B?eHpUWFVIT1RqU3RUelR4L2hsQjBYTUpYWlBoblU2Kzl6cmJvcHBLbWVvV2R3?=
 =?utf-8?B?M3VnYmRkbEdnY2R1WTFrQ25jUDFBMmRPK0JTd1pBZEJzQm95amFqZmRFMXpi?=
 =?utf-8?B?cnUwVGl3ZVdneXF1RW5VM1JYcjFLL21lUVFDdDNza2EvSTI4RWtFNWtjZnln?=
 =?utf-8?B?NUJpckZDQ2dpYzVZSktlMlVHcDVqZG9BOWFISWFkOVgyTHdQVzJFNzBIZU9B?=
 =?utf-8?B?UUpZNUhteGpKakRiS0FCN2hFdlhKZjFZMUwwT2JiODdFeHRiUU1SVS9zbWNv?=
 =?utf-8?B?Z3ZwMmpuNXU2MUlWblQ0VGttRFQ5ZWZVRU9DQUNlYmpvbEhaZ0N2b0JvVmdJ?=
 =?utf-8?B?WFgvWVlGRjg2VmFuNnloYTVRU0IwbGJ0Y3pQUDBRcDlMVHh3aUpCN2xIWXZt?=
 =?utf-8?B?eHJ4LzZ3MlUzbDhYMHhHd3ZqZmZxbXhmRWc1Q29wM0xRYmpaMTl3cThJNkl5?=
 =?utf-8?B?bEVkV1FZT3dXVVZwNm03K3JhSjZNTFZ3ZlRXYkk0V2hDUjFxV2JaUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a155e6-6496-4426-cd89-08debd6b4045
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 10:15:47.0444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gtLxqdzoVi2OoalxL6uhmN5CY7e4iW5BotM2zzxFTOFpB47WsyhcMiHeutjrxC6zn7g+wJzRRYx3TtV4V9196H914eQX+B2a6SOAo5IcM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10072
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33336-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 3D1AE600B5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI5IE1heSAyMDI2IDEwOjU0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
Mi8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDZsNDgtc21hcmM6IEVuYWJsZSByc2Np
ezEsMiwzfSBub2Rlcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTkgTWF5IDIwMjYg
YXQgMTI6MDAsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gRW5hYmxlIHJz
Y2l7MSwyLDN9IGRldmljZSBub2RlcyBmb3IgdGhlIFJaL0czTCBTTUFSQyBFVksuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Nmw0OC1zbWFyYy5kdHMNCj4gDQo+ID4gQEAgLTE0
Nyw2ICsxNzUsMzcgQEAgc3NpMF9waW5zOiBzc2kwIHsNCj4gPiAgICAgICAgIH07DQo+ID4gIH07
DQo+ID4NCj4gPiArI2lmIFNXX1NFUjBfUE1PRA0KPiA+ICsmcnNjaTEgew0KPiA+ICsgICAgICAg
cGluY3RybC0wID0gPCZyc2NpMV9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgdWFydC1oYXMtcnRzY3RzOw0KPiA+ICsNCj4g
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArI2VuZGlmDQo+ID4gKw0K
PiA+ICsjaWYgKCFTV19EUElfRU4pICYmIChTV19TRVIwX1BNT0QpDQo+IA0KPiBDYW4gJ3QgeW91
IGRyb3AgdGhlIGxhc3QgcGFydD8NCj4gICAtIElmIFNXX1NFUjBfUE1PRCBpcyBlbmFibGVkLCBy
c2NpMiBpcyByb3V0ZWQgdG8gdGhlIFBNT0QgY29ubmVjdG9yLA0KPiAgIC0gSWYgU1dfU0VSMF9Q
TU9EIGlzIGRpc2FibGVkLCByc2NpMiBpcyByb3V0ZWQgdG8gdGhlIE0uMiBjb25uZWN0b3INCj4g
ICAgIChyZXBsYWNpbmcgcnNjaTEgYWJvdmUpDQo+IEluIGJvdGggY2FzZXMgaXQgaXMgYXZhaWxh
YmxlIGZvciB1c2UuDQoNCg0KWWVzLCB5b3UgYXJlIGNvcnJlY3QsIHRoYXQgbWFjcm8gU1dfU0VS
MF9QTU9EIGNoZWNrIGlzIG5vdCBuZWVkZWQgZm9yDQpyc2NpMi4gSSBuZWVkIHRvIGZpeCB0aGlz
IGZvciBSWi9HM0UgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsmcnNjaTIg
ew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZyc2NpMl9waW5zPjsNCj4gPiArICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgdWFydC1oYXMtcnRz
Y3RzOw0KPiA+ICsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiAr
I2VuZGlmDQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==

