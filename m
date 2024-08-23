Return-Path: <linux-renesas-soc+bounces-8133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406695CB04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036291F23443
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 10:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADE0187547;
	Fri, 23 Aug 2024 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cISSZ3Br"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1B1862B2;
	Fri, 23 Aug 2024 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724410293; cv=fail; b=BqQepYdocxAPni2sHS8kYvRCwLnhgU8GWaUDUWg62XUCYPajKggZotDkTqTZmaDWnVyTxBcNW4grnSGsyAK0+etPbhIYiENRVhVJV0p4z3UfdxLafJOd7Bl2uim2smySL4OkFXHW0CrLYcuWVSaq3+63U6sWftG41imxltIhK+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724410293; c=relaxed/simple;
	bh=TFpvDLcFfUW3OGI1mkRUMOvbPjBTUEt9gRQNkydHrAU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LnZb1hWXKOgP3eLA379Y/EVpkS+YQa7EGKtAk/WwcKQf5ZbZDNQ29TbhU2dpYtzsfb4P1Gvu7ucssSuDsgcoKf5eskU8S7FBj5MVZqTMVxJ8tE/Iwt4huazS5iosO8rYk7VhYlOFYVDcRQkhpWiJCkT/NlKiDUM3Xz5JEOw5PT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cISSZ3Br; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R++SQJSDDqBgCCwZSO7gR09zxvB7Be+h1qSiWsvnGzyNvsOMdTs6IR7HqbwaxwQ9JXhjah+4S9WPDk3uINb/sOIJHfxFlVzFI7VBVWwLMwWNU7WxlIR+7ZsNT72qdNsDcvwNwSkj8TgmVzbb+Uil0X2F1+zrQjV876Di8BPnCg4fxzdpnHLMmmgiVbucEo67SoplisQj+d+PBdfEicLMmNokmb1ekrqM2QpTUut+JOJcJ52SYNe5fvjVr0h5mncwjWHCDGMbqqUyAM7iy/8aiXBZTm7MUnqKkRlvw5FgD68NoH6uo9SXLuXTx7C9k0QLbmhkkS6GWyWIx8keYc/XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFpvDLcFfUW3OGI1mkRUMOvbPjBTUEt9gRQNkydHrAU=;
 b=oN8ttyMOINWnZrsrCdf37UBj/ZZHHlqKecUSpZhEZXLKWEnObUUmIhqQ4pHs2bJWh9NTeS8be7nQ0MhPr1i2wJ/u8iZ0gOy/kDyKlsQC0LQzMdFnPwhr2FG6k/qIWtlusaT5Wyc0YgwSKgQchKNOHZmzke/SrzEgpBmidCGOsMnYnTorm8Et75ln9QHsXkqll47tDKH32nV0ahBRXIejn7Ru4w1AeEL9lWvDGp2+kpjKclwSoZgdFkgnTO5N+RHrhhoQrNlXv7NtnQUk/lsieE5vopAaYJlmIMGoChdpBFz3qLqBXOVhC+/rRcB6E+9v74pFwaVcyD6uuVPDIxTB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFpvDLcFfUW3OGI1mkRUMOvbPjBTUEt9gRQNkydHrAU=;
 b=cISSZ3BrzaEuO+pJ4FhDu9rR6kLJvTGcYcnBDgF0oBsKkwbdnSHquHNZoNZAVdzqJbfo4Rj3yfu5dSkmuNdaVxY727pWAqyRLO3tXy+luseOQD15Fiw8v2rTg4ksHlx6r01oL+VO7fSlk0pJ2vOk80vKcwa2DlYSFTu3WJc7LaM=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB6295.jpnprd01.prod.outlook.com (2603:1096:604:eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 10:51:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:51:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Index: AQHa3m8e92YEq2zHb0+2/Goto6PN9rI0yWUAgAAM6sA=
Date: Fri, 23 Aug 2024 10:51:22 +0000
Message-ID:
 <TYCPR01MB11332D1DEA64F992A0B05499286882@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
 <20240725084559.13127-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUi+++pYU3jDP2pB3o0mH8+UgnczDyrckKQzL59O92E0w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUi+++pYU3jDP2pB3o0mH8+UgnczDyrckKQzL59O92E0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB6295:EE_
x-ms-office365-filtering-correlation-id: c1480ef1-ece9-4833-897c-08dcc36186f8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmUyUFFoWW9oSHh5MFB5bWtrRzhQYXBRWE94MEc0OUFyelNURkp6T2F1dk4w?=
 =?utf-8?B?dFZadi9xZjJ3bHhLYXhRVDlkNDdPSTFtUEErVE9qZ0s0V0dkTFQ2ZGtRNWpI?=
 =?utf-8?B?L2tuVlp4akl1TytiTzBFckgzZVlRRmZrcUt4L0ptNXFHVi9kemlqb2FrN0Z2?=
 =?utf-8?B?bEQwcGRIbUFPaUNBdU8vM0lEYXU3MkdGU1lsWmJUVGZJL3FOb3l5ZGIzb2Fn?=
 =?utf-8?B?eG9RK0ZnSVFGTXkrSGN2VGdrU25mM1FhNEdYL0h5L0YxOXdXeU5FREozd2Vh?=
 =?utf-8?B?VWhOeHNuUXlBdk4rUW9lQ0Mwbkl0TzRoRUZ3Qk10V3NreWUydHRaSFNYUFZI?=
 =?utf-8?B?djRidWRSTXp1VEQwbGswd0I1MmQ2OU5yUHFIWSs3UloxTnJNTERZc1FQV3d4?=
 =?utf-8?B?aVd0M0lyalpzUHVzcnhsN1RYeDNFS1k1ZzRDR0xQN0svYjh6bU1PZUpObUpX?=
 =?utf-8?B?aHJPaFMrYTNuWklYei9IUHAyUU1qYy9wbk9oNjJBSzRZZUV0UzZRcCtuVFlS?=
 =?utf-8?B?RTlZWlJjek16TXd3R0xTekV2aFBiRHByWkM3dXBtVGk1UmFhb2J3SnFUaEhV?=
 =?utf-8?B?RVRZNjBnSHI3UFFORG5zQ3N3YTExWTZDOXJBaUI5V242RXJyaVlhTlpqd29I?=
 =?utf-8?B?c05nbVZEQW5NOE9CeHFFVXdOMUtZalZtZngrNzNsNE9CbjFNeGUweEdOMU9T?=
 =?utf-8?B?V1hoV3hGOGZ0MUFMV1BtZXRGajhxQ1hwVXQ5ejVSRmxKTXVaNDUzSmFVTS9L?=
 =?utf-8?B?Y0FCNlZTVXlqSkN2NWRwcEtNUkh4QkVvQmZiTml0cFFFYXcra01rbTJIb0x4?=
 =?utf-8?B?TDZIN0YxVnVpOUpMK1RZcy9iaUd2TGVYL2JCTzFNZzNVdjk3S1dES0VLc2ZR?=
 =?utf-8?B?alMzRG0zQ2dJMXdJbUFiNlBnT1VkUXJiTE5NUnBHcndTQWxTdEZlSjBPT3FL?=
 =?utf-8?B?RWdkMkQxVWIxbEpwVXFyTmlxQmRmcjB1RWFZTUtkaDRGVVFVdlluUmtXdlBL?=
 =?utf-8?B?dHIvb2ZBckUzQnZUem51UysvQ0g1QUNqaW1OUmtmT0h4VzREMjBCcWhIZXlx?=
 =?utf-8?B?Y2FzWjk3dHNLd0xJcGRGblpBQ3VieU00SlZIejdaZHVyenVab200Nlh3Rzlm?=
 =?utf-8?B?OXBBbDlLRUxScGVpUXRlR1B0SnlyckVUdTk1KzdmOGt1VThNcUp5dkZzeXZr?=
 =?utf-8?B?cEdFTFlkOHo4b0JlQWJsWVNHQTlZc3ZMVGwxeWRSb2J6WHE1QzQ1dDhxR2dk?=
 =?utf-8?B?UXgrc0RQT1FXV3pjRVJEM0NJQmtvZlF1R1YxbEgzaExVM2kwY2p0TFNURE5v?=
 =?utf-8?B?N3psamRCRUlTd0dWMUVJNTdnSDBNTUFvN2pQZERDUGhpT3pCL3dtRXVEcm9E?=
 =?utf-8?B?TDBSSmlmNDVHWHVlV2ZLb09VY1BpbzE0a3M3TkQvTVJCdjgrSVUvTW8xV21u?=
 =?utf-8?B?ZUp0cGJ0T2tXOXlsTGhHOFoxOVJQWTZkS1JhVlpqNWN1TEJkdFRGNWlnYzZw?=
 =?utf-8?B?eVNsSEF1VlQ3amZoU0tRSm81MExqeE4zNlp6VVBxeDl3a1h4QkV0M1ZUbGRW?=
 =?utf-8?B?UkVlc1JLTzJFd0kyWnppT3ZuUU1lNjI0Z2xtOEs1Q0Zpa211bWpaK3RhYVlH?=
 =?utf-8?B?a3VxNk1JVW1HS3owZDR3L1N2aTZBb1NjODEwUkxGTTFCSXdPRHV4N3JCNGhr?=
 =?utf-8?B?U1NISWZyektxeXBmVjRENEEzWW9mRXhOTTRBZndpalR2ZmgvMVR1eEprQzBV?=
 =?utf-8?B?YzhEdDYrU1NYZVVEbFBIUloxaHk5N3ZBMDN3UkJDQ1ZNRTk5NGowSjJQSXM1?=
 =?utf-8?B?V2VPT2x0WVlQejgzSVJmdy9NeTlkN3JURm5KM3F6N3VtT2R2eWFRdDJOTlkr?=
 =?utf-8?B?MFUveDhOUzQ4MEhYTHZYWTNka3pLWlNxSktYa2JnZnhTMWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWVHMmljZEI4NGZWTTl3NlJBVGZnSndXSGp3Z3krb0s3c3JWMTBZQzJUb1Y5?=
 =?utf-8?B?d25vR2k2N1dHeWJOSXlMYmZkdE9GSHJUQW1qYWpqL1JOYUpidGoxWXJoVklx?=
 =?utf-8?B?anM0MWpOQlhvUEJ6U05tamRiUEhMOTNGNW9CSHkxRWdPODlFMU9KUWkvMGxi?=
 =?utf-8?B?bG9iVUZXMjhQUmhVUDN1NDVhYmhKVkNKb3Riak5UV1VwdHNabElxOWduMW9J?=
 =?utf-8?B?VU9wVnZuUmJVR0k4Vk01SGJ1SVZod21icmY3b280Y3I3eWVtN1JjMUMvaVVE?=
 =?utf-8?B?MHlxVHh6TFZIM1llODFGNzRqWmpKR2M2ZFJIekliNXkwU1ZtZ3I5V20zODFv?=
 =?utf-8?B?bjZSUXVNRHpSZUhpL3V5WE5nVkVKTU1CR3JFYUpra1FvcnhIT2Rqa0s5TnFt?=
 =?utf-8?B?M2FyamZ6ejdpT1YrVVVHaHVwRmxIQjI2aThKRG03ODByMUJpa0RaZDJDYmVM?=
 =?utf-8?B?NkdacWZpZlYzcmN6QmdqTGxQMFduVTY5TWFBa2c1dzNCUHUwQ3lUMlQ3WEp2?=
 =?utf-8?B?cGd0RlJHMzR5VUFhRXZEck1VQWJVTEd5bVhLZm1FZ3BpS1E4YjRwOHF5TytJ?=
 =?utf-8?B?MjQzalJ0enJSb1FwQk5obHMzSFZGL3dIZWhuUTg1U0xXMytpdEI2RERpakc5?=
 =?utf-8?B?dFZ4ZldYL250ekFXOU45bnFnZThWRnNUSjdoT1JieEp3K1IybVNQTk9BcE4w?=
 =?utf-8?B?Mkh4NE5kMTgvK0ZpN0UvUVpzRUxzelJCZTNMSDdFMk84SzNQbUNlUXdjY1M4?=
 =?utf-8?B?TFFyOVdpR1pZRkJLdmVMREw0SjZsaEV5cVRnWDBtaVpKYzlkZDlISGFPWWZH?=
 =?utf-8?B?d0J1cDBrN3c2ai9qOFJJVE5jSUtFMnhyUUZyRDljMjhrR3NUZEJVci9NZHd2?=
 =?utf-8?B?UkpINU95ZHNnRzY1M1lwcEJ6SXZsdFd3ZW1ncm44eVBZVXdFY3R0L1B1NGJm?=
 =?utf-8?B?L2xXbFhodHFuYnpCcCtyTUVRaC9tTyswZFpiSHMvY0RkL0J3K04vQ010SGlP?=
 =?utf-8?B?cDFQbnNGMUdwQXdFRlJ5MTJmcXVtcHFWQWJidEVQMFVJVDRxQmYvdHdSb1NR?=
 =?utf-8?B?ZzhlVXg4cGhqeUtzOHZlSGdZdjNKTXN5U0lvK25SQWhEZEhldCtGdEVESTN1?=
 =?utf-8?B?M1BPbkwxQUoyUko3aHpBalRGUHluUFQ2amQzaDl4M1h0VHJEQnVKWndHMW5F?=
 =?utf-8?B?Nyt2ZzIvQnpFQTNLeVJJM211WFpNbGJzd3NyeEZyV05zck5FbUVwckJVQVZT?=
 =?utf-8?B?QzZhNVdHcEhRdDZOeXozdjNkbXNySXR1TXYxRHpwcWtOUzI1WXNZY0R3NWh3?=
 =?utf-8?B?Vmw2aE1aa1BEbWJwQVd2WFNseUI0bjJ1ZGRQN2tlOHc4UDVZZlBOcFo1OXBF?=
 =?utf-8?B?WlZoZldjcWhyekl4VjNaTWI0cHJ2TzlCalhvV3VScUNiTzlrVS83V2FqcTlj?=
 =?utf-8?B?RmRSMjB4L1ZzRElQaU1aQjMwQ3NjOVZ3NjhHejNkTitDY1pkUDREUmtZQWNt?=
 =?utf-8?B?SkIxUHhTSnY4YlA1dkUwVHpPSkJhQzVyYW44QkZJUFF0T3pEWndCZlpXS0da?=
 =?utf-8?B?S24rQW8zc1lDNkdrQTlER1dXQ0ZjeC9TQTJiVDYrTTZXMURBZElLSCtJZTl5?=
 =?utf-8?B?RTl6RVByN3ROb2p0WHgzaUt2STBPZm9IVThYcWM5N29uM0lPQnVxREZVelNt?=
 =?utf-8?B?N1ZReVZWSEZjTnYrUmN4QmhCUVBwS3lINFhrYWRKalp0ZDBkT1JHMG9zUEFO?=
 =?utf-8?B?MGJTVCtSR2RDRWxGZFhzY2xzeDNUbGJVYXY3TEttcDVTbThUZjVhQVJ2aHY3?=
 =?utf-8?B?dkc1Z1U1c3FjQnJLb3Z1bzBNaFB4OVNXTE1jNGFRR29rYVQ3K2M0RzFRQnBv?=
 =?utf-8?B?bkJPcm1vcmY1RGhzQWR6Y3Yyb0xGN1FmcHBmSjNCcDJhWFB2cFh2aTU2c3lL?=
 =?utf-8?B?Y2xHai9vU2ZKWmRRTzAzZDdKSnNiV3Q5dkp0dFdIeFhDOWY5UXNoUytUaFZD?=
 =?utf-8?B?SmwxbStCRVFKYnhJWlZqcnNHRTYyMlRjVm14L0NBeW0vdnJkWFQzVUp5WXcz?=
 =?utf-8?B?eW1nU0NTdVloVVc3c3lPblVjNERhNGJRcWlrRkt0Z1d6THlQNlN1REZUdHhS?=
 =?utf-8?B?T0hRWU1rOFhCbDM1WlBGek94a0lvZUZsZ2NPL0lMQ2M0ajhYQStJYTFtUDBN?=
 =?utf-8?B?OHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1480ef1-ece9-4833-897c-08dcc36186f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 10:51:22.2850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ouU3ZQKzk12HjibgRNC10MsrpwJVG5oQI3Hiyd3DWS1w897R9oqTqyRi1Y12PdN3b1DSGQJMNtigZcDTDKATQsRyKWhlNcOWqMh0bv9LIAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6295

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0
IDIzLCAyMDI0IDEwOjU5IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBhcm02NDogZHRz
OiByZW5lc2FzOiByemcybC1zbWFyYzogRW5hYmxlIEhETUkgYXVkaW8NCj4gDQo+IEhpIEJpanUs
DQo+IA0KPiBPbiBUaHUsIEp1bCAyNSwgMjAyNCBhdCAxMDo0NuKAr0FNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gRW5hYmxlIEhETUkgYXVkaW8gb24g
Ulove0cyTCxWMkx9IFNNQVJDIEVWSy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJj
LXBpbmZ1bmN0aW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cnpnMmwtc21hcmMtcGluZnVuY3Rpb24uZHRzaQ0KPiA+IEBAIC0xNDMsNiArMTQzLDEzIEBAIHNz
aTBfcGluczogc3NpMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JU
X1BJTk1VWCg0NSwgMywgMSk+OyAvKiBSWEQgKi8NCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiAr
ICAgICAgIHNzaTFfcGluczogc3NpMSB7DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxS
WkcyTF9QT1JUX1BJTk1VWCg0NiwgMCwgMSk+LCAvKiBCQ0sgKi8NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElOTVVYKDQ2LCAxLCAxKT4sIC8qIFJDSyAqLw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDYsIDIsIDEpPiwg
LyogVFhEICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1V
WCg0NiwgMywgMSk+OyAvKiBSWEQgKi8NCj4gDQo+IFJYRC9JMlMyX1NESU4gaXMgbm90IHdpcmVk
IG9uIHRoZSBjYXJyaWVyIGJvYXJkLg0KPiBPSyB0byBkcm9wIGl0Pw0KPiANCj4gVGhlIHJlc3Qg
TEdUTSAoYnV0IEknbSBubyBhdWRpbyBiaW5kaW5ncyBleHBlcnQpLg0KDQpJcyBkdCBiaW5kaW5n
IGNoZWNrIGFsbG93cyBjb25kaXRpb25hbCBtYWNyb3M/DQoNCkJhc2VkIG9uIHN3aXRjaCBwb3Np
dGlvbiBhdWRpbyBzaWduYWwgc3NpMCBpcyByb3V0ZWQgdG8gQXVkaW8gY29kZWMNCk9yIHNzaTEg
aXMgcm91dGVkIHRvIEhETUkgYXVkaW8gcG9ydA0KDQpUaGUgZm9ybWVyIG9uZSBkb2VzIG5vdCB1
c2UgZ3JhcGggd2hlcmUgYXMgbGF0dGVyIG9uZSB1c2VzIGF1ZGlvIGdyYXBoDQpIb3cgZG8gSSBk
ZXNjcmliZSB0aGlzIGluIGJpbmRpbmdzPw0KDQpsaWtlIGR0cywgc29tZXRoaW5nIGxpa2UgYmVs
b3cgc3VwcG9ydGVkIGluIGR0IGJpbmRpbmdzPz8NCg0KI2lmIFgNCkF1ZGlvIGNvZGVjDQojZWxz
ZQ0KSERNSSBBdWRpbw0KI2VuZGlmDQoNCkNoZWVycywNCkJpanUNCg==

