Return-Path: <linux-renesas-soc+bounces-19822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E7B17E0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A17A1C26378
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E941420B80B;
	Fri,  1 Aug 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CHaeO5Kw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409A1F4188;
	Fri,  1 Aug 2025 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035927; cv=fail; b=Jr0i7ORpmV+TcVcYlLr4gcotHlMi5l7uMctKNR0z0LWuyzdUwgMyIxqyuoxYF1LGu7DXndDY48MAzKjDZzF1fN+w3jGU/l8cj6RLJUgruAgKFmx05kFJ1LjMP12P35n1hLGBH7nOFRCLGRijjx6yDFQa8t+2eFz+3OHuDtu9uIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035927; c=relaxed/simple;
	bh=LHJ+D215tpvpL3Tp5+Q1H7LiQcMk56DSm/8lH6XPfxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qqaq5MWW8FOxaPU6l6jOiiGFjqDywk//HRqxtm7g0nbjY7qmnoPDPv5XoCSZPzkP08gAcpxVHUJkKjtQ+H8vATj257Pd+whqbxP0YeAWtu0FEALgqpAcU/hhFezWhYyXnu8VtHG9hbivdquRJsm404zCWKSCtfiAOKm/8uPjk9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CHaeO5Kw; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWXYfxH6ufN+6uN1FtCzclSgG5qDqASePVSdfAa/dWztiLrF7ZcIM6p/XID5G9PIPvm3PoEm5sSL930trZrCf7spTR2jiR8CUNIymVqGVzV40qv+JlJd7kOQ4x/jn+Sf6kiVbJbl74yBgANLF/h1nMLQIkoaJIrVaK3WN+JI7yqE4Ci0+kdMSRU+b0jtpPlQzgcCIb9MhapkkGVm9CocWceJtYLsmJY/TKSx5wIx/PKdtF7f022psHAHV9r/boCM96Q5OrD8lUpj/Ug0xqyosqa+wPl3WdabsGeS9UQsYk37vRCbxUko3SSQqitoE7G8I5eAEEAWzADHnOIR6iUvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHJ+D215tpvpL3Tp5+Q1H7LiQcMk56DSm/8lH6XPfxc=;
 b=knfVa993M3lLexZ3QaRbl/aKDe/YjhzxCgVRV6YMO9BygKRYx1g879t+Gfey2T7IJj/SMQGNdd15ZB+Lpk+rygHIcAgRHo00hSYCzjBOb6QmwS+SvGydpqq6NEzp3t129P8MuwwvLpnet+8+N8RE6negsf49skod5Pk67kNmFRquoryJO7I5yzJWjEAUfKv/dvexCKLRjBbKsCNfm3JIyI/DhVXdYLGxmuz8c1P8tmZpI27ydU66njv85buDRk1jdvDoMzKbhB2mlCLDa9iUYH/8/jBf0AmhV4ahnE9N25hjyRPiUsnHn33J8IfPWrAFAL2A+l1UkkzZu78OiZhN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHJ+D215tpvpL3Tp5+Q1H7LiQcMk56DSm/8lH6XPfxc=;
 b=CHaeO5KwNgL0b1TFg5vnSF7bkQT/zNSTRW/3h4504aZe8aKUTzWsnydxwFF62AxN9FJTms1fpRtExYKlHVCO2WvZAGESQP0YQs7R00xsuDk4BGYbLKk3B56/FCL+lYRDTfmAkV+5hU8i/xyQMj09Y6qixLIbJ6HGziXlGkwQVZI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11128.jpnprd01.prod.outlook.com (2603:1096:400:364::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:11:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:11:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting
 node
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting
 node
Thread-Index: AQHcAhnPYXXZJZvDfUKebpJ6p3R1PbRNZ/qAgAALdYA=
Date: Fri, 1 Aug 2025 08:11:58 +0000
Message-ID:
 <TY3PR01MB11346C00F991D3D718D16417A8626A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXTbOcYPrgHxpCNJEWNhcd8e5NBC0gyYQXn0KmQ8wqEMw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXTbOcYPrgHxpCNJEWNhcd8e5NBC0gyYQXn0KmQ8wqEMw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11128:EE_
x-ms-office365-filtering-correlation-id: e5afa66a-f97b-448a-7aac-08ddd0d31670
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UEprNlNXbVNhd0tjdUtJZTlKQ2FMRzB0L3NaeU5uRzN4djYzeGFmT0RGZ2VV?=
 =?utf-8?B?b2RadUY2TCtHOU1jclowdmVCZkQ3c01BZ2ttS25CUnE2VHE0T0NuRjdDK3Vo?=
 =?utf-8?B?RDg4SzZNUVg1TXI5S1dTTzBWbUJZenpUeG1ManA4NEwwQnNIRHJBZU5tOVJX?=
 =?utf-8?B?UUJLcEV3d2M3SFg3RElXVGtzdi9aV3VIdEUrQkVvQTMvR1lIOFNwbWprdE0y?=
 =?utf-8?B?dFgwU1NQZWxJOGcwU2RjVnM4TThmeG9aM2VvemNaYlQwT2g1NjBGV2xWWUNv?=
 =?utf-8?B?TUJlZ3NtcFFvQzZJWkI0VXVwcThDNmEwTW5rS2RPR3VWSHpxMkdEZTNJbW14?=
 =?utf-8?B?OUhmRUdBQjFkNXc0NG9VMUdES0wxZUJxanh0ZHF1SEQ4M3plN21RS2FXbHpC?=
 =?utf-8?B?SFNrWHI0NXJaT2JYSjdMV0JKcEtyWGFEWUJaWFdUN0xNMnpITVBZdmk3Z0NH?=
 =?utf-8?B?NHByb0FmbXhkU3hBblg3OFV5UmxsM2h2TW5ualFnSE5LS2RRNlhsVUdxUjVr?=
 =?utf-8?B?QitFd1hKQ3kvTUJiempKWE5uNHNBYVpZOFh0R2lOa3RsZG9QTUQ3UkN2L04w?=
 =?utf-8?B?R3V4Um9GRnlYbVBtMGl3MlMyK2tXN2szTEhKSE5Fdnl4TUpzaE5IOG5TSU5R?=
 =?utf-8?B?b0Z4SXl2TGRVQndSdFhrK3V1QTA4M3NaOEpRSWxkUEVSTkNiLytVeFIxSnQ5?=
 =?utf-8?B?KzEyMCtDMUgxMVVBVDlFamttYnRvOHljYWszQVJrZE5RMjJJYzRKbUJwcEl5?=
 =?utf-8?B?LzZJUkdlb3ZUVDRtbzMvbVF0TnBjVlowSlY1bnZmNVMvR3dVMnYrNjNsYWVv?=
 =?utf-8?B?WkNUV2doL1hDV2lnYnZ5UCtpNnNGRjVXNlhYZjR1SXYycXZTUkF2Sm9DNER1?=
 =?utf-8?B?R1dMMURrdXNFOUZRdUhwOTRpWTlWV0R2cnY4dE94czE2dzIydDliN1FmVXgy?=
 =?utf-8?B?RzVhNEFzakJVMnd6REE1M2t1b0FSSDVWcTBhRWFJeHZkeTZ4OGxnYVM4TkJz?=
 =?utf-8?B?dkVMVWpIc2pkSHFwOHdUUERlcmRCdzRjc2RMa21Fa2FmWm90cytGSFVqdVhv?=
 =?utf-8?B?b1BDMHZkRVY4cXQ4QzFCWmFRZVV1d3VTaWR5YkJiNGlwOG1OYk9DZ2g5NGZY?=
 =?utf-8?B?NWZxNHJkOEYrcHAwNEo4Zmh2RzBCcnl2MGYvNXpLcGFYc0s2KytrVjJUdnhQ?=
 =?utf-8?B?anRhT2dxdTQrcFFLZUpXTm82VmsvelFWeit1eVJyaHRxK0p1clNBUzA0SktU?=
 =?utf-8?B?WmJ4NVBiOVk1bXVlbVE2dnBHWTczT2FmdVM1alpIUENIdWk1UFNienU4R25s?=
 =?utf-8?B?cFFlM2RNSGhpeUV3RTRabXlFQUJlaGZ2em0zMmNBOGZNc0N1VjJVSHd0bk84?=
 =?utf-8?B?NTBDUVE2RStqRnJyVm5NbStTUFFwQjBCK0sxRWh1dVN2K1QvRVpKMzEzVzNz?=
 =?utf-8?B?NmllVTlwQVpSSDl0R0ZQUlVneXpiK3FXSEsyWDlWWklGOFFNRkhZcWV3Njgv?=
 =?utf-8?B?V1NpTzIvUjdIMDQ1OVBnc2JRR042Qm5iaDVYbGhibHBXc2kxLzl1VXY5WVBI?=
 =?utf-8?B?VlV5REhNdWE4dUdxSllEU0dlejUxcm9WM2NpVWs5eGxLQVBRdy9YcE9qaDNx?=
 =?utf-8?B?WTRhVkJYYmkwN21QSG8wSlpRb1ArQ1c5ZkNXMEV3Y2c5VTE5OTdJMWxnaVdx?=
 =?utf-8?B?b3NtR3k4Z3ZaL1RieWJFeDFHRFd0VWJleGt4akFxSjNkcndaM21PZTZpTkth?=
 =?utf-8?B?bGNQZXRSdFJobHg0OHRxb2FlVVlMU1ZjbVdXcExHTDUrZlVieUhFZmlPRkV5?=
 =?utf-8?B?WUNTak1nRDg5SFc0bVBlUFhST0VoWisvRzJSVzk3SmtiUi94UW5jbkVTM2ZH?=
 =?utf-8?B?d2ozSldKUkpWODVRWHBwaEFQTmhzd00rWkt3VTY2dUk3QUxDWThRcjlkT01M?=
 =?utf-8?B?S1FIL2l0Mzh5VTJvUzkvNzlic2ovUjdTc0d0YnJ1b0V2NTZHU2UzeW5Gc2g0?=
 =?utf-8?B?NFM4NmxmdkhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dU1zWTEyTDhWTUhMemx2REUyK290T0FMbUZrdkxFUUJsV054a3BUeHhVbTZU?=
 =?utf-8?B?aUZpTHlQaFR0dHNKblA5R1JLNUFHTWZzZGxaNHJJdk9yRG94RGtaSzlzUUY3?=
 =?utf-8?B?czdtQnBXN2lBc1FyQzZCWWwrL0hVMGtFVlQ4bGtiS0J6UU4rSFVaMTEzQkpm?=
 =?utf-8?B?cW00S0tkMGtsLzhIMmNFeEV5T0srZlpXTHc0eU1GemdNT3U3YlU4eVRFUVNv?=
 =?utf-8?B?MEFpek1INEp4YWdTbUNvT1p4RkIyWlEzWnlaMUNKdE9tSnF3SGlSOEZUeE5M?=
 =?utf-8?B?VkFidS9ZWVRENTJVRzJNN0NiYkdpQjFIZjVFU24wOVl1TC8vMFlOMTJxbUkw?=
 =?utf-8?B?ZTI0ejJ1TkpDM1FwNUJaTDU4d09rclF5MzVJc3BtbmxGTXZFZ2thWVNEYzZU?=
 =?utf-8?B?NW4xUHpRZklDYWd4L1RkajZXa1ZWRS9zQUdpalp4Um82Rlc2ZldBQzFhcWFo?=
 =?utf-8?B?Qng2MGRkdEZlN3NZMHM3YkJqSlorNzFBcWFGb2k1MW9TZDVRMUVtY3RTdTU2?=
 =?utf-8?B?bkJoaU8rQlhRZTZ0UDl2eDl1RlVDVVJSUS9vc0gxVEVXQjdZQzYvZUZMMDV2?=
 =?utf-8?B?MjhTTnZhaG54d0VKZlFDb0h2ajFmTHZCMTN5aVU1Mmh1TGhQYUNnUDBNckdP?=
 =?utf-8?B?ZGNGN2lrNW5zZ0ZJVnNpUW0yVmliWm9YSXJQY2xsK0kyYytYZHB2Qk1IdXhU?=
 =?utf-8?B?L2ZkRGVGQ1JwTWZlTzZmajVaclBhcXRlWHhvTTRVTkI5bXB6akZSTTdKek1s?=
 =?utf-8?B?QWRPcjZkSHhnd2NjalVZaG5oQjliSTNlWmN4RUdwRUhHdXduZ1RLZUJzU0dj?=
 =?utf-8?B?S3dET0lrQkJnSm9JZXY4NVlJajZqVkVwdEJoaHpDaXNGeHJzTlFhY3pTQVg5?=
 =?utf-8?B?VnFDM252cmFlYjdyWC9mcUVRQ0xIa3c4ZG9ibUxPWFRpekd1Nk1ZNzdoZ1JU?=
 =?utf-8?B?WDlSaC9iTUhVeEF3T3F3Z0I1Um1waEZRd1VMNHNxalNLWW5XM05NenUweS96?=
 =?utf-8?B?UmliTTZwZ2p4OUhvMHZPZUQ5aDFybzk4YnJBSVRiSjRidEZPRG1JdzBva1lW?=
 =?utf-8?B?b21zM0dZTDNucDFIK0ZJeVhIWXVwcUVZdzdRQVBoUy9sWU9tc0ptejJ2RGN6?=
 =?utf-8?B?U0ZuNi9UWTU3Ykx2M2dSUzRBVXRYSTJBSDBvckZCRUFtU1YyRVQwVFNKb3Jy?=
 =?utf-8?B?UzFkcWxqaEVMKytydXdreDBQOW56YlByRnZzNFpCdVd3K2JNbmNwY3ZzdGQx?=
 =?utf-8?B?NDI0b0FQTzYrSzVRV3Y4N0lYcFFwZlRpdmxUdEo1R3kwWkdyVWhobVFFcUU2?=
 =?utf-8?B?bUhWMnlLaWl1OVpzK0psazEra0hxaURlTUlXYjBPWVZVeXg0UlJqZnNDZ3h2?=
 =?utf-8?B?MDVEdTBFMUt3K0dINzdRQmYyYTBuMXRYMVB4T2RySko0ajArWFlCNG92cXcy?=
 =?utf-8?B?WHhZem1rQ1c5alhpdWdNYUNmSWxUYzBlMmFuWkdsaEQwWDlLVGk0TFAwY2Zz?=
 =?utf-8?B?NWlUSUs3bjdCZXUvZTdoNUZsL0swNnZMQTJuRFRqcjBrbExncWtvQVBXRzFO?=
 =?utf-8?B?SUc3bUZlQXVVN1c4VjA5QThyK2dmbVc1UU1WZWpBT3RqN2lLZ2JyOVIvQlRi?=
 =?utf-8?B?emRuOWFhVjhCSUl4Rmo0MXB1ZHZTemhzQnhvSnAzWHZ4dkNsQlBPWmx4cjBE?=
 =?utf-8?B?ZXFkSm4wRmZrR1hONHpEamxYaGRwNjY0TU1ieDdqemNtdEhFUnNKYXRKaG5F?=
 =?utf-8?B?bzNNRFpieEd6SUcwakgwOWtKKzF4YzRQb0V2eHlqSExVQWpRaGIrV0JFakNv?=
 =?utf-8?B?endpbERoVlQwZzdCSjFnT3FPZENtTDAzbEZ4Z01Rc3Z2MW1CWXJHMThPYXhJ?=
 =?utf-8?B?WW1hNFQxWGdhdDhBWHJKSXdyWTlxWlhRSTNPd1pva1FWTkx3WEh5UVg4WlBZ?=
 =?utf-8?B?SzFpUzc2OG13SlFJVlVjSkp5M3hJSEtYRTZkT3pBZlQ2aVN2WlhDMFBWQ3RB?=
 =?utf-8?B?Qm9QS25JZzF6SjVOSW1CMC9UM1JhaFB6SS8vTm5qU1daVm4zZGZnTTVqcWtD?=
 =?utf-8?B?Y2FhdjVHT0dOSlErNTZwZ0daMHBtRTR3SlMxOHhnOHUxbGJxMVVwOEhWeWc3?=
 =?utf-8?B?NUk4bFhPSFlCTzkydHlsOTMzZlV3VFVWNG1Ra2Jmb3ZvSGY2NzJpeTUzVVlI?=
 =?utf-8?B?a1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e5afa66a-f97b-448a-7aac-08ddd0d31670
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 08:11:58.9172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nx8i+APjy4u2HXU3XdEJdtUkl8MdsGIrNObRWAhDpMw2g9MsNVYb/OpV0K++E1pzxh0tUfeKqWqUq41cGuxxX2iQH60iqGQcAUxbJiUzbVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11128

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDAxIEF1Z3VzdCAyMDI1IDA4OjMwDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsYy1zbWFyYzogRml4IHR5cG8gZm9yIGRlbGV0
aW5nIG5vZGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDMxIEp1bCAyMDI1IGF0IDE0
OjUxLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEZpeCB0eXBvIGZvciBk
ZWxldGluZyBub2RlICdjaGFubmVsQDAnLT4nY2hhbm5lbDAnLg0KPiA+DQo+ID4gRml4ZXM6IDQ2
ZGE2MzI3MzRhNSAoImFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsYy1zbWFyYzogRW5hYmxlIENB
TkZEDQo+ID4gY2hhbm5lbCAxIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0K
PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0K
PiA+IEBAIC00OCw3ICs0OCw3IEBAIHNvdW5kX2NhcmQgew0KPiA+ICAjaWYgKFNXX1NDSUZfQ0FO
IHx8IFNXX1JTUElfQ0FOKQ0KPiA+ICAmY2FuZmQgew0KPiA+ICAgICAgICAgcGluY3RybC0wID0g
PCZjYW4xX3BpbnM+Ow0KPiA+IC0gICAgICAgL2RlbGV0ZS1ub2RlLyBjaGFubmVsQDA7DQo+ID4g
KyAgICAgICAvZGVsZXRlLW5vZGUvIGNoYW5uZWwwOw0KPiANCj4gQXMgcG9pbnRlZCBvdXQgYnkg
Um9iJ3MgYm90LCB5b3UgbXVzdCBub3QgZGVsZXRlIHRoaXMgbm9kZS4NCj4gSW5zdGVhZCwgc2V0
IGNoYW5uZWwwJ3Mgc3RhdHVzIHRvIGRpc2FibGVkLg0KDQpPSy4gV2lsbCBmaXggdGhpcyBpbiBu
ZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==

