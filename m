Return-Path: <linux-renesas-soc+bounces-32129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCXmBShS+2n+ZQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 16:37:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEA4DC54C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 16:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F734304AC85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 14:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED02480DFB;
	Wed,  6 May 2026 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rRNIH3Vq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755464657CC;
	Wed,  6 May 2026 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077966; cv=fail; b=asAV7oe1DsTv4VqknHx0bYvTjaaMg0ClsDWDZ8MHx9aUpmB6jQ8fOs1TtNG0W7mOqgvHQggY3VYpO1PhvLuNFGIG10Y8puqPZQ6n4FeXqIzgRV/JehYaZrs+jjwFcjMX9L7vNpRzIyxiM2Lg+0u4h1EFrrUYcFf1fxFJf00t5Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077966; c=relaxed/simple;
	bh=cR57OyfhClRodB/F8HzRPsx0kVAQKigRHNN9ptOSeOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gJYL/B2Z5XOlpT5p1DoA92Gwlcgh0pdZuHfYs/5ppBegBJ2scd8FW8rdhDSuTRowZ0EXIvIhMG9UhatxJ9CVeRXt/ztqopz7W52OEYn+1K6muRzJsC3FEPk+5r+F122JgHBQNUhzt3gWOuxWufMPJGcGBVoVxKf8Aqmi8SdUIZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rRNIH3Vq; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5+ZqsMiy/bgSSFTh1bZ77lBI8XFarF7m1fq3N10p6h1LZegKigXPgve7qZRxt0ekaou/iuZd+l/RVKS9hpuD2euNK8FipxMQ+R8lqFUddMaYdFYejz0kQIzOR2UbOuiU1KPykmkKEdZFAL0+NR3FR88eNekKGAadzdXiYb2PdJMumLHsgVnkT0oQptWINMuuqHwXdN/sYbuEJbpk+HY86qLBz5gfgnYCM2Y1fszMETOQ9890V+R3alKDL2xRd7gcLLptexcZWUx8fXlhyC5NseO4ziiQ+hgwKzEYjNmpbzsJjSo0bQfeptrfglz4ya2ugTDhog1axjEXQSY7a3V0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR57OyfhClRodB/F8HzRPsx0kVAQKigRHNN9ptOSeOw=;
 b=q13ktiGhEGSqymOqFjMREiV6iLeL2ovVOrWTFM4AwmwMFDOxNM+Zb3pMzHpvdkR6+Po0siyh6o7gdfGQQo588qkZ7+SvFQt+qVaixkVJdTjrJ2E2jldg3mmqhh6nEvfBGE2LNN2sCTNYT9iDrFj0RlL7lc4+JfZAN48ZlhqqbncMAT9KdAFutwk0Pm6ey6u5DsI8ooDQiQkX76QYSGFFDl/I9VqsNvSXa5OxCMhSbmV53vXXza5S7/19UbgBpz4LVTzQKQg5abRH40WCAGMwxG7mc5d488TgJRStkJRFJFMmKgO/BYVshUSPOq9E7wbEwQrtKDxX0hXN5UJdJVRSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR57OyfhClRodB/F8HzRPsx0kVAQKigRHNN9ptOSeOw=;
 b=rRNIH3VqTk0X9W2CjaUnMWce/emsI/cGKWWVeck3jd25J9wGirG3gJmc7DmEGknfxMRfBFLVoMvf63LAlNHjMFFdZs8YeCiYD+rsK+6KYvATKEDPbKxud3g90Orb1pV/9X9007NGk5AgBstFIyf4r0koO9uRBji1wDU2PwM31GQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12153.jpnprd01.prod.outlook.com (2603:1096:604:2d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:32:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 14:32:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical module
 clocks
Thread-Topic: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical
 module clocks
Thread-Index: AQHc2IlVIPyv3r0Qd0i0Gm3QvwCNgbYBGEyAgAAAYJA=
Date: Wed, 6 May 2026 14:32:33 +0000
Message-ID:
 <TY3PR01MB113465D0987ADE952AC71E4B6863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12153:EE_
x-ms-office365-filtering-correlation-id: d3d6a2cb-9a7e-4dbb-35d0-08deab7c5007
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 YGKfuIAZkLUz5L0/7a3J975kvs8JzphIYWGBChTYdS8wmh+pq9fEvXEgAwL7aG1KZe3qiq4AK50M76DmnUFvaMj8ezYR6YZm55rJIk1gA2RHb4+pp4WOCA5JNjv7b9ry8/7G1lLf0M423tcqiHeI98mgAJLtwKtn/wnYoPJ/orLz51LneIafr1kWdl352u40BVIb68QiQyDq3Zsq3JOeg0ocH2jprp6b110y6cYcJmEMAAdrcjD9SbsIKZm6vAPNgolO+BxIlikmngPnV5hoIPFmr7InHnlY/qqi/44jS5I02DzdFcj11fhO8d07sS/nhLLA4zo0FoIKUTG+o+lhJnF85VaavkCka9qn2+Ivtb3txOy9858BmER0sg97KypeWm/4bDBYRxaoOozJIqZ5nHBegttNa1LT0sQYO5E+tzKoIhiKt+P+3S5Q3Y5Fqf5a169+bubyF1IuovdXEmIruvASsKYmwlrSwxGmmTQINLLPICMAhQmz/UkXYw+Oinamr0bIMTkW3MH0muZjcxxtwJUYCE7/4b7f+SKp6zK5p92RUTEdpFkvUJnJudKanOFfutyrSMx9Kmhe0vIdonk4NtZ+q90LLcM2YwO4zl9QlLbh05dV0uCYtgc3axXF/ImnPyWCJKRz2Krigxe9thivi0ujeH8Ljg+0HH7iL/1xPj9CPA/KSPMurZiV24QrMN8G/Op/pGOg/Ky1KL2+caDaTKB11P5od6EaFc9dTjhvc4R5UvO05EQVfjo4iI/V+xRF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTMzU2JKT2dZbjJTMHV2NW9wa1cxdmticWRjampmTER1Y2ZqQUNNeWF1TW1T?=
 =?utf-8?B?L3VqdS9PdUFqUDNOUVNxanR0Q2NkMFFocWNHeEl6Ky9RS01QWXRGU05tSVVN?=
 =?utf-8?B?VFQvNWpyQWlTdlFHZ1l0UnJMdUVQYURJeC96R2ZyaDRkWDQvQVp0Qy8wUFRt?=
 =?utf-8?B?MUtFc3dYRFFFWTJ4dlFPZVpDTzFqZTlCY3pVb0hsTWV0UEFGRzY4emVaZnd4?=
 =?utf-8?B?TXpUMHRUYUNPVEJxR2x3NkM0M0dNbFJrL29ZUFJCYnpYNlY5QWRmWjlSa0ZL?=
 =?utf-8?B?bGd5eUpEMStRWmZCZWdrc214WmZnQWN5UmNjc2diN3ExUHB2ZHNhT2hwWlIr?=
 =?utf-8?B?MlVaNUkxUHZmY3lmY3N4ZVZkQTY5VU83bEFsdCtzY1p5L3JTQm5qcWhGRzQw?=
 =?utf-8?B?dEhXSUQ5WDMvb0lFaEwvMDlKalovTXZVNUttRVJNUmZiN2o0QjBrVEtMbnNQ?=
 =?utf-8?B?L0d1dzE4YkY0dFRUOVhGbXpLWGpFQUJHY2ZodHRVQ0pCcTM1K0hBTWxGV053?=
 =?utf-8?B?RFJ2aWhnQnNyOHNsMGN1azlRQXlyK0JiYjM4QUNpZGdCVHVZY3l3VGdkTkVu?=
 =?utf-8?B?M3krQ2lBWEI1bVNtLzIwZHUrQVliWVRjank0ZDYrbEo3dWJVUzY1MndTSjlw?=
 =?utf-8?B?c0VCNmdRaFFWRmVlY2RrUTlsMEJ3blYyK0kxUWxjT3NnZHYwM1JkTE1qS2U4?=
 =?utf-8?B?OE5rcWliWWFkSVRQTDdsb2x4bGRjb0xsOVZ1alBqOTZmQXcyY0xhZUs1bDRn?=
 =?utf-8?B?bTJGSTA2VmRQdnU0Nm1WQXVWVEdTMG12Nk5aNk5VakFFbUxPUzQ4NVV2RzdK?=
 =?utf-8?B?b2VMTnRKcUNPNkpJVTBqZ3VNOUM4NlYvS0lQZmg3QzBqWDAvSDdDQStqdEE4?=
 =?utf-8?B?KzVGWXZRL2JMOCsyWE4zalNUZnpHM3czQTlBcGZOUFQ2aHkyWW5nUExSRmls?=
 =?utf-8?B?b08raldVdms2K1dDbU1pb3JzTXI1ZCtwbGprK2lJZnM1RU1rOUNCaDhEQ2du?=
 =?utf-8?B?T2gvZ2J2TTVTdjVZQks3ZWRkOThqQ05INnlhUzhHSVljZHpNazVjK1drZlcv?=
 =?utf-8?B?OTJLcklkVEJYQUdGdnlJWG1TL05URWRLVjFOcTVzZ3RYM2labEpKOUtqVjdN?=
 =?utf-8?B?Q1dlYmRIMGtHOXlvYzFrSy9jZE95WlcxVDBJMERFRHV4NE4xdWNXVld6YzU5?=
 =?utf-8?B?OTVEaDI4c2ovRzVMYjNCSGVTMTZLUHJxckhWUkRwMVRZQ0VaZWlJdTdtU3Mv?=
 =?utf-8?B?eFJuVFpwZi9oMVA5ZitCcTUrREUvZEMyUmlmMlBWdnpBUER1TTBGak14TkVr?=
 =?utf-8?B?RHZKM1lLZmc3dUJCYks3Q3k0b1hQeUNwYmJnWE41OTlrU3MvT2ZEUXl5Y282?=
 =?utf-8?B?WmhBNXZ6NE1NaEhEeEZiQXMxVlVoM2x4NHpzbjliQ2RXRUJQdWlCUkg1K0Vl?=
 =?utf-8?B?VlQvVHluMUFVNm01dnZqS3FKQW1hMm9yaE0vM1drMTdpaHJpVTRrdkpieGhT?=
 =?utf-8?B?TmVodndDL3NkMWh3MHhlc3o0Y21ZcW9lVHlTSzlHeGhSamxMd2NHUStlcUZq?=
 =?utf-8?B?NkIwKytoWWgySlVSdHllblpqd3RrN2pRM2RlWXNiTGFYTUhoajdUQ1pFOTdN?=
 =?utf-8?B?eWVucU43c3hTeWt5WW9scllUb1ZsTzJLRGNlNjgyamxDdnIwS0J0RnJBempO?=
 =?utf-8?B?K1o4eTdmT045ei8wZ28vYlliUkhINGJkbXhoemR3UTBLTytQNHROSGg3UCsv?=
 =?utf-8?B?dzF2ZlJrUGRTZDA1YlEyd2ZvOXp2ZTN2RVhiVGpYQ0RZakFaZGEvN3hvTG91?=
 =?utf-8?B?dlRxSTFUdTRFRGhnSnVGRzN4ZFptczR2Ym03alZZcjVraFJHNGVXR2FodHA0?=
 =?utf-8?B?MEY1MTRSUVFISUdYZWxqbXUvRmNyRm9iM2tiZzFyblFkTUJzZzRST2N1MEdP?=
 =?utf-8?B?TUJ1QWJHZC9vVDFDNDBXZXZLRGwxbFhsbDZHenN1YVIvSEdQT2ZLZkRQWU8z?=
 =?utf-8?B?bDFpT0xHWFdmNDAvdXhlREppWnRHbUNDdXNTYzFrRnlEY1k0RVJGWk9BdWd6?=
 =?utf-8?B?aWZmWnRzMDJ3MEJVZWdEMk02aEgyOHpJL0JWVHA1WEV5K1pnc21TK3owNVgw?=
 =?utf-8?B?SzNac2dROVZGMVY0d3U5NWU2Yk9qL012VjIyNGJab1BDRDZiV09RSE8xaDlq?=
 =?utf-8?B?bm9FYTJvc3l6S1p2SUFuMXc1STRMTk9XQUFmS2dSNGxDMytsQmJ5dlVYNnF0?=
 =?utf-8?B?dm4yM1FwTEMvbUVhS1RsMmN6QlpsWnJQNU94UlNxb3JiS1d1VzExVDBWYlpx?=
 =?utf-8?B?V3RXU1hCc1FQQmlBYUI2dW9DOFJNK0JtY2VsTkZVU0NPdTA0a095Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d6a2cb-9a7e-4dbb-35d0-08deab7c5007
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 14:32:33.9562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EHCiTEGsiHV65RRfqopDSF/OZbMiVxmm0abSHShJvOoTqzJBEvIXby7FZqLhvDNPikaoyM2ooxVIxYtDkHHxIERz+uwoUGF/YABHwp8DLmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12153
X-Rspamd-Queue-Id: ABCEA4DC54C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32129-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,glider.be:email]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE1heSAyMDI2IDE1OjI5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGNsazogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgSUE1NV9QQ0xLIHRvIGNyaXRpY2FsIG1vZHVs
ZSBjbG9ja3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDMwIEFwciAyMDI2IGF0IDEy
OjA4LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBSOUEwOEcwNDZf
SUE1NV9QQ0xLIHRvIHRoZSBjcml0aWNhbCBtb2R1bGUgY2xvY2tzIGxpc3QgdG8gcHJldmVudA0K
PiA+IHRoZSBjbG9jayBmcm9tIGJlaW5nIGdhdGVkIGR1cmluZyBzdXNwZW5kLCBhcyBpdCBpcyBy
ZXF1aXJlZCBmb3IgdGhlDQo+ID4gaW50ZXJydXB0IGNvbnRyb2xsZXIgKElBNTUpIHRvIGZ1bmN0
aW9uIGNvcnJlY3RseS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4gPiArKysgYi9k
cml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiA+IEBAIC0zMTIsNiArMzEyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9yZXNldCByOWEwOGcwNDZfcmVzZXRzW10NCj4g
PiA9IHsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHI5YTA4ZzA0Nl9jcml0
X21vZF9jbGtzW10gX19pbml0Y29uc3QgPSB7DQo+ID4gICAgICAgICBNT0RfQ0xLX0JBU0UgKyBS
OUEwOEcwNDZfR0lDNjAwX0dJQ0NMSywNCj4gPiArICAgICAgIE1PRF9DTEtfQkFTRSArIFI5QTA4
RzA0Nl9JQTU1X1BDTEssDQo+ID4gICAgICAgICBNT0RfQ0xLX0JBU0UgKyBSOUEwOEcwNDZfSUE1
NV9DTEssDQo+ID4gICAgICAgICBNT0RfQ0xLX0JBU0UgKyBSOUEwOEcwNDZfRE1BQ19BQ0xLLCAg
fTsNCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1jbGsgZm9yIHY3LjIuDQo+IE9y
IGlzIHRoaXMgY3JpdGljYWwsIGFuZCB0aHVzIGEgZml4IGZvciB2Ny4xPw0KDQpObywgaXQgaXMg
bm90IGNyaXRpY2FsLCBhcyBEVFNJIHN1cHBvcnQgZm9yIElDVSBpcyBub3QgdGhlcmUgaW4gNy4x
Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

