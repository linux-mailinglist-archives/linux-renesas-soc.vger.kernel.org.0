Return-Path: <linux-renesas-soc+bounces-26277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C885CF2E2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518623029BBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D87C2F0C7A;
	Mon,  5 Jan 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QttSzw2y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36332D6E73;
	Mon,  5 Jan 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606963; cv=fail; b=rBLs05ttWASOZQAX/2tMEK3RrqdfRYKIFIpX9wHC241ddkZZ7lH8WWWxnQFlfhX9fqPVOaOuCyc/ctuQa2d/xjVFg/WPIMaXdiMbIg0/ShOAtX2S8+w2XvUgMbfyyxsFer+hBZy3ReQ8DzbMK7Tk8zogaJIxZBO0+Jedaxz9GyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606963; c=relaxed/simple;
	bh=yGE7Z1YlER1r3DrQ4GrN8zpT8PKabr+EPhBNL94ZUd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iw6r+G5tbj904szO9qdRhSeLIt4hdEerlk9XJzdG/hZQFIptjAxnDVCPweouAGe+6qcculxBDutJmfMNyqR8QIu9+zeq1tV1n0NeJdwwcZkiGgZ0+BY3GwlnOmLhmq+I4o0qrXDsmfej9a/IymgNJC9WZq+xM+JlXIvbNBDah6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QttSzw2y; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPZTdRTUQrjGexy8und4pQhNrn/JCq/uAQ1fgcHe/asDMRmR0wjqRu0uOUPDEo1BUoKT7axLJuIkqGeICsOL2Pf/+fS8lQtIO70+XB8UMiCmtoJmgZcCDaRrpeLdqjh0vTSqO13Nljh8mtPZqyyT/M3voVUAaD1IcirE8IhoQC0JQiGh8jUD+yYVFVSx+YP+tZ6szC3aqUscsxJn5Q0i752sKO9rktJVQ8DUjbdYawJcUUVIPu3CQdKeGlSimE6Gvh02FGioBxYLj0tfSr6gnZXF0Uh1bWT2zOYKBjuXYfcBP2l1yN5hHv7B9bp2w5s8CcDsGqRGx/VEa4Z7k3ThKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGE7Z1YlER1r3DrQ4GrN8zpT8PKabr+EPhBNL94ZUd0=;
 b=UV1sbBOISSOPRm8ruKEGgWk+TE67rJOW2wN1ej76Mt8zSNQQhyZPXv4ovEFa3QJBMtaaFkIVU/giTo5PzxSjQmRvEURG30SAZkijKsbUV9yboX/2CvHCkme14wVYBMIpWYjmi7TxaYECf79Io0mIgyVs+rw2ma1xS5EEKhHcdMqviS1EUfcM0RrRt7oNbISzQIiAedbBEeAg6dL8uvXZEQ/dcEaPj3YpWgqyDUQs9gMqmh0Wj/W0gLooltJCsDb3VP0vqqWqv0Y6QwSau14AFiz6HuVOor9GxBLtnoXH2icZBD0epW/55v/xJ/GsRktsllP7iOVpfk37FVuq+63J2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGE7Z1YlER1r3DrQ4GrN8zpT8PKabr+EPhBNL94ZUd0=;
 b=QttSzw2ypWCWjtJDE3s60d/476jlk8Zt0vruhAfQmbSrBMy075UfQVTBZqPUj9rP7DaZMu0rNm8tDJMPfXL7cICeblt43PVZx++3494VESiFFPeiCFPmAs5pWBnVlhk4pVxYe8LZUpvqmomcZ1eAKIGYLe/sShKOMdJVXW53Aw4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7338.jpnprd01.prod.outlook.com (2603:1096:400:f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:55:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:55:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index: AQHcei7B1N01Ink3mEOQFkmXK5jCLrU7dX1AgAfhcQCAAAXMAA==
Date: Mon, 5 Jan 2026 09:55:56 +0000
Message-ID:
 <TY3PR01MB1134668FE2F55ACABB0F10B428686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aVuEPIXTckqCxtJV@tom-desktop>
In-Reply-To: <aVuEPIXTckqCxtJV@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7338:EE_
x-ms-office365-filtering-correlation-id: 2e6e287c-f84c-4b57-4257-08de4c409f20
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjJtQ3k5UEZXWmwwRWgyNjI1SkZmQldacEZRVTZDOE04WjlQU0Njc0pzVTdp?=
 =?utf-8?B?TitpMC9ydURmd2lvOE5ORER6Y0hMYkpmMnBOSXVLalMyS2N0MVRmRnI4bVRn?=
 =?utf-8?B?cUtBcDZTbHVzang0UnU0bFM0RExld25zQ1U1alNvbW5nMnRzSFJZM3dOMWNZ?=
 =?utf-8?B?aDdIb3ZYZU16TUFNS25xR0RhZVFaV1hocGpENzN2Tmc4bkwzd05DK0lpNmZG?=
 =?utf-8?B?MFhreS9wR0xYOG0vZFAwelU2a0dQbzJKczZIYjV3Q2lpREV6czRJRWllRVBS?=
 =?utf-8?B?WUZsY1ptamlSN2FEblVyS2l3eVpwWW5yWEpSaDhrWWZ1amZIWW1Wa0pLSU50?=
 =?utf-8?B?TTlBTnlKeU1nb2VkTW9mNklpMmtIU3dsQThJbUFUWnpBRGtDak8yTmxTYW1I?=
 =?utf-8?B?enZMTWhpMWxjVjFhWVFDdkFkZ3pCV1h5aHd3MTBwMit0QWxCVDNTd3VYUjhy?=
 =?utf-8?B?cTNYd3FuV3NIQ05WeGtnWkoxZmxuN3UyajVOTnU2WitOSEk3YldpY3lSME1h?=
 =?utf-8?B?eTUzMUZYSHUxTEZmUEJYVDh1WEpvSVBkdWJxWlBkUzZWcEdGVHdZaU1Vakhu?=
 =?utf-8?B?R0NlVEFCVVVoMG42bUJCWnFvSlRKT0tHKzZXSExwSml3b3lMR01CSjJ2RTM0?=
 =?utf-8?B?WUNPb0VFYzhQMDNEYnJxVzgzNDVJSGZyVm5DZU1wM0xvbGc4bVh5dGVqaWUv?=
 =?utf-8?B?aktVUW5hWWFybFZwTjk1MnZheHdsTk9XYy9JeklDNDZKTVdocFpOaFMwRlY2?=
 =?utf-8?B?SXJoUjdIOWc1VG9nbzliRkFMTFhpb2FCWmJhY3p2dDN5RGVwNFBwZVZ3TXNW?=
 =?utf-8?B?UlBNbHZxRFlobWcxK2ZKbnY4bUZzSkxhMnRpWkF1b1hzYUNzYXNhU3QzNjR0?=
 =?utf-8?B?OU4xZ0c4U3A5Y3Q4RmJVSEJIaURRUlY2cm9ka0NqU2hVMmU1WGFpSm1vcjVz?=
 =?utf-8?B?MkVVTStUQ1AwQTYrK2lVTVpuRFgveDhDazR2SmRpc1VqS2pLM3pzb1AwUlRF?=
 =?utf-8?B?OXBoRkZFVXZnVjEwNjBKSXFyYkNQTnhxTU9IRjRmc3Z3MjJSSDB5bDlsMnB6?=
 =?utf-8?B?L3JkYUFpTWFsVWtNbURwWW9ncEQ4eFRRV0x3MDJLdjlyYlhDWVZDRFViU04w?=
 =?utf-8?B?Ynl1L2ZUVmpPemd2Y3Z5YTU1dGh6ZWhxY0pCNzZSMG5waGRkR3RQY005RXhM?=
 =?utf-8?B?WTFjSjF2ZWtBbFJzb3dseWoxZGhER092VGNRaEVRWlhGWHpaS0lsLzhjOVgw?=
 =?utf-8?B?TGN0N2JqUmovQTdOVlFLR1p5ZzZ0SmVwQmRBMnBQQkk3TVpkSnJVOG5lNVE5?=
 =?utf-8?B?T1NDWG5TdFNoNWxrYUVWLy9JUUdZMUl5T2xBbXB6a3hySi9Lby9rMjJzRUl2?=
 =?utf-8?B?di9XaXlBclZWNk01OE1uWktHUFJnTElleU4zV0hOYVBmQjQ2Uml3MG1XM2s1?=
 =?utf-8?B?V3VOVGxjT3BtMldpVkZYcFRsWWNGUWRCVVhSNHlMRlZSNTB6TVl1bXVvOUFy?=
 =?utf-8?B?ak9JQjBkYnpUaU5nRWx6dG1QRzhNT0UxUTRQT01laEkydUptNCt1WEVqMFhS?=
 =?utf-8?B?TUdHQllod1NIM1AyMnhCRGJsbUJNbzdUSTk4M2V6ckwrMk51M2JUamZaQWU2?=
 =?utf-8?B?am02MnFUQUpSOHlIa1h0VTNYYjduOFV1NlBNUXdzSjBKTDhUZnB3RlpibUNa?=
 =?utf-8?B?MGR3MlQwN2JzQnpHc2tKR3FQSDlPOTZMVHppTC9lSjBFdzBVTmtXVHBjVE1j?=
 =?utf-8?B?OHpVUUJQNVFDMThGMDc4djlicmQ3UEZ1NU95elpoU1daZ1huTkptd2pFWnpW?=
 =?utf-8?B?L29OUEdMYk8ycHViekVuUWVia2JDci9xbEtPT0xPSWt5U2xMMi8xQVRIS3dD?=
 =?utf-8?B?QVl4QUprZVlCWnFNUzlFZEpQbDloUFpHY3RUZFU0cThwZitaTVBOdkdIdUdE?=
 =?utf-8?B?d0s2MGhDaW9hZUtkRnBna3JQQ2tLc3lQQWg1aE51aXJxV1YwaEp6TjdEeDJ5?=
 =?utf-8?B?ekxJSHBGWXpuZ3ZidnRZSEFEd0JwQ212M2xuWi95L0lQNHZsc0o0YXhaTjRG?=
 =?utf-8?Q?r3Y900?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1J4TmE2d3BNNG5DcEc3cWgvNzNYQlc2ek9DNG5NbkRaOUhUQ0d3MERsR25Q?=
 =?utf-8?B?cnpyQjFXSWRFc2ZjbEF1bllkeDFvYzdLcE1XUkZYbDJZOUJtSHJqbTRiREc2?=
 =?utf-8?B?emZqVjNuZUpBNC9yVi9XcS9QYzFpOTRYanBxQmd0N1hqTWsrQ2VYZ2czR3da?=
 =?utf-8?B?ZTBIZXRwT2dyc1FNZzJrc2JSdnZsdWtvTmJaOFU0b3lIQ2gxWG51K21tRy9Q?=
 =?utf-8?B?S2d1VEJSai94SWt2TGZieGVCRFU1bE9IOXcxUWlDcTA1UFgxYjBqTFF2OXZB?=
 =?utf-8?B?WTd5NWN6alFUZCtoRWplYjhpWk1NNWorQXp0ZU9PbXhaVUZQNlRCZmJUaU1H?=
 =?utf-8?B?OFZjcGJXZHdjWjh4ZlJkbUpnNDJnNlhCMWY5RmMrT3pXdEZGMStpd0pNVmho?=
 =?utf-8?B?ZEM0Vm94eWZpZE1pTUFQdFFlY1JWVUs2TnNnVjJkbUxWN1lvRldoS2RvTVJv?=
 =?utf-8?B?TGxzaS80TU9yTlY0TVFzL2R2bEZOV0p6UFQzenprNUpUTXRER0ZZcjF0Q1RJ?=
 =?utf-8?B?a2RXNmJzclNIdVdha3dTSkl3T3BJcHpyc0J3SWpIdlpHUXpxd1cwYzFoVkxK?=
 =?utf-8?B?VEFjbGExMDhQdE1sdjZHV0hlVUFiUXc4UjlRMEpuQlZJdzFQK3FYbnU2NlJv?=
 =?utf-8?B?VGNRUjBQcTFHMlhocnFBaE95Q0drem5yV2RENy9kSkhIYUNuMjJ2RXdTbTYy?=
 =?utf-8?B?T1dQaDBYWksyTmM1Tjd2bE50Y2xidzdjbndaWU9tVVI0bGp0T0tnZUY0ZTBD?=
 =?utf-8?B?UmU1ZU5xYytYY3FxcEQ3NTJXRUxuTGdob2o5ZGFHRWRDcWI5MG5oUisvNk43?=
 =?utf-8?B?UnRTek1HOUpLNGdTZHIrdlNGVlcycXUyVTZUM1lmNDRSamdHRkNhajBqaUNS?=
 =?utf-8?B?cVI4VkoxcGdubWswL1VvZmZnNXVyNG0vMjYyT2xnTGpLU3dVM3VyUS9aYU9K?=
 =?utf-8?B?R1JuZnp4R05YanV3OW90N0tlSHJwQzBiSHE5SEVXVG9Gc1lUeitMTDQzVEtK?=
 =?utf-8?B?VEFSaElXSVptQmdQVzV0Rk1vQUNwTjF6WlBwWWJWRVpHanRVSStjekJlZTdw?=
 =?utf-8?B?dkIyZFZDWWpFelJmcjhCcmppK0dCdmtoQzJEcVdBdFBJNkFKc3ArM3RrTy8y?=
 =?utf-8?B?RUcrbHNNWG1DN0pYaXhvZy9lWXMwaXc5dmpUU0tJdVZaQWErajZKTnI0QlFQ?=
 =?utf-8?B?aVdkQytzMXpiM2tMcStUYkJiZHpyRzdIMHM0M3lBdDYrblIydGlvZXpJUnFw?=
 =?utf-8?B?MTNGZjZ5bVdrZy9FT0xuNFFrbWRDa241alYxY25wQko3Wm55ZzBxMUlJWDY5?=
 =?utf-8?B?dDVWSGtLaTZuYlhaR1NSN2JrdkpVM3AwV05OVUQzd3pjbFc4b2VBWWRUcCtY?=
 =?utf-8?B?ekp0TThJUzYwNVUrRFo3eGowUDlzTzRyaEoraHRkUFBkUS9MSEZEWFVHeGtE?=
 =?utf-8?B?aStyamp5N2NpTWFaRllRZGtseXJVemo1NGhCdmpBMWd6ZVdpdmZDNTFudlhq?=
 =?utf-8?B?ZDExdG5paklxY3g1Y3R5MThJVDhpSGloMjlCNHNTdkg2SW9sUkR1WlB4YllD?=
 =?utf-8?B?ZzFBcGNEdGVxY0RpNmMrdXdta2hoWEhBYTV5M2dXQXYzYklCbkFEWUdjYmtk?=
 =?utf-8?B?citSc1BSZFI0a0dGY0Rxdk0wQmxQdVludmNRU3V1Y3VKS3FSMFh0L1dPQmpN?=
 =?utf-8?B?RDJVOXlQUGFXaG9YUVBXL2hGRHAzakFNUXdtQnFxR2lNZTkzQlRpOVRpbnRD?=
 =?utf-8?B?V3lSMExpTWNrcmlFQkxZelNFRlFybStpUnh6eXE5aXF2cnIyTFRJWTd3Z05z?=
 =?utf-8?B?Zy84TGdtcy9qNGlaeEZvOFhVNHF2Q3NzekhHQ2NpMEROby9tMFpWeVkrTXRn?=
 =?utf-8?B?cjNPNkRXSE80Z0Fnbk94TEl1TkN0NmtJamk0bW9Mam90amtHT3NKdG0yNlA1?=
 =?utf-8?B?d1BBK0pZU2FUeUFSUmwydk95VHp1Z01xTFU3bFNod3RVb0pxbEFRUFo4aTF1?=
 =?utf-8?B?L3YvK0ZuOEYvOVEvemE2Tk9aQlA1cGJEMXEzMWRxRTBjRVJkUjdUR2ZjV2Ru?=
 =?utf-8?B?V1NJNlRDTWZ5MGdYREZWNlJ2UUN0aGlPRmtHNTJsUFpSVWl0VThIWHJONDM1?=
 =?utf-8?B?M0xLbElLQzhYTGNvYmViSk5IY0lHTzQyeFVRRVVvOGpwMlZGU3E2SHJWZmhq?=
 =?utf-8?B?eUJHcDhWanJqVnk5cUZ5RDJHd1dkRDIxa05jdnVhWmxPb205T0dKYzMxb3c5?=
 =?utf-8?B?aVdHSklKekdNeVFnUTFWdzBoVHByNmtTczBRMDg4TG56MXdWMm9HUVp6VGxv?=
 =?utf-8?B?NkhKd1h4VXBKV2pqMlZKdlpMb3Q0dkoxQU5VVStpWkV3bjkrN1lsdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6e287c-f84c-4b57-4257-08de4c409f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:55:56.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmV2sKu1zsl0rBIPS0wS+PFgZU6+w6IaePF4ru99qS3uflgZ/5x5vRCICzErvF4rUa+YJll19Wcw26AIDbb/PdGkprT7fZLJgRCXZl6bODo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7338

SGkgVG9tbWFzbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21t
YXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gU2VudDog
MDUgSmFudWFyeSAyMDI2IDA5OjI4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS80XSBpM2M6
IHJlbmVzYXM6IFN3aXRjaCB0byBjbGtfYnVsayBBUEkgYW5kIHN0b3JlIGNsb2NrcyBpbiBwcml2
YXRlIGRhdGENCj4gDQo+IEhpIEJpanUsDQo+IFRoYW5rcyBmb3IgeW91IHJldmlldyENCj4gDQo+
IE9uIFdlZCwgRGVjIDMxLCAyMDI1IGF0IDA5OjA4OjU0QU0gKzAwMDAsIEJpanUgRGFzIHdyb3Rl
Og0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9t
OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+IFNlbnQ6IDMxIERlY2VtYmVyIDIwMjUgMDg6MjMNCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2
MyAxLzRdIGkzYzogcmVuZXNhczogU3dpdGNoIHRvIGNsa19idWxrIEFQSSBhbmQNCj4gPiA+IHN0
b3JlIGNsb2NrcyBpbiBwcml2YXRlIGRhdGENCj4gPiA+DQo+ID4gPiBSZXBsYWNlIGluZGl2aWR1
YWwgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBjYWxscyB3aXRoIHRoZSBjbGtfYnVsaw0KPiA+ID4g
QVBJIGFuZCBzdG9yZSB0aGUgY2xvY2sgaGFuZGxlcyBpbiB0aGUgZHJpdmVyJ3MgcHJpdmF0ZSBk
YXRhIHN0cnVjdHVyZS4NCj4gPiA+DQo+ID4gPiBBbGwgY2xvY2tzIHJlcXVpcmVkIGJ5IHRoZSBj
b250cm9sbGVyIGFyZSBub3cgYWNxdWlyZWQgYW5kIGVuYWJsZWQNCj4gPiA+IHVzaW5nIGRldm1f
Y2xrX2J1bGtfZ2V0X2FsbF9lbmFibGVkKCksIHJlbW92aW5nIHRoZSBuZWVkIGZvciBwZXItU29D
DQo+ID4gPiBjbG9jayBoYW5kbGluZyBhbmQgdGhlIHJlbmVzYXNfaTNjX2NvbmZpZyBkYXRhLg0K
PiA+ID4gVGhlIFRDTEsgaXMgYWNjZXNzZWQgdmlhIGEgZml4ZWQgaW5kZXggaW4gdGhlIGJ1bGsg
Y2xvY2sgYXJyYXkuDQo+ID4gPg0KPiA+ID4gU2ltcGxpZnkgdGhlIGNvZGUgYW5kIHByZXBhcmUg
dGhlIGRyaXZlciBmb3IgdXBjb21pbmcgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydC4NCj4gPiA+DQo+
ID4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gPiA+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNv
bT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjItPnYzOg0KPiA+ID4gIC0gQWRkZWQgZGVmaW5lIGZvciBU
Q0xLIGluZGV4Lg0KPiA+ID4gIC0gVXNlIGRldm1fY2xrX2J1bGtfZ2V0X2FsbF9lbmFibGVkKCkg
aW50byByZW5lc2FzX2kzY19wcm9iZSgpLg0KPiA+ID4gIC0gSW1wcm92ZWQgY29tbWl0IGJvZHku
DQo+ID4gPiAgLSBEcm9wcGVkIHVubmVjZXNzYXJ5IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qg
cmVuZXNhc19pM2NfY2xrc1tdLg0KPiA+ID4gIC0gUmVtb3ZlZCB0aGUgbmVlZCBmb3IgcGVyLVNv
QyBjbG9jayBoYW5kbGluZyBhbmQgdGhlIHJlbmVzYXNfaTNjX2NvbmZpZyBkYXRhLg0KPiA+ID4N
Cj4gPiA+IHYxLT52MjoNCj4gPiA+ICAtIE5ldyBwYXRjaC4NCj4gPiA+DQo+ID4gPiAgZHJpdmVy
cy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgfCA0Mw0KPiA+ID4gKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MzIgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9yZW5lc2FzLWkzYy5jDQo+ID4gPiBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkz
Yy5jDQo+ID4gPiBpbmRleCA0MjZhNDE4ZjI5YjYuLjFiOGY0YmU5YWQ2NyAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYw0KPiA+ID4gQEAgLTE5OCw2ICsxOTgsOCBAQA0K
PiA+ID4gICNkZWZpbmUgUkVORVNBU19JM0NfTUFYX0RFVlMJOA0KPiA+ID4gICNkZWZpbmUgSTJD
X0lOSVRfTVNHCQktMQ0KPiA+ID4NCj4gPiA+ICsjZGVmaW5lIFJFTkVTQVNfSTNDX1RDTEtfSURY
CTENCj4gPiA+ICsNCj4gPiA+ICBlbnVtIGkzY19pbnRlcm5hbF9zdGF0ZSB7DQo+ID4gPiAgCUkz
Q19JTlRFUk5BTF9TVEFURV9ESVNBQkxFRCwNCj4gPiA+ICAJSTNDX0lOVEVSTkFMX1NUQVRFX0NP
TlRST0xMRVJfSURMRSwNCj4gPiA+IEBAIC0yNTksNyArMjYxLDggQEAgc3RydWN0IHJlbmVzYXNf
aTNjIHsNCj4gPiA+ICAJdTggYWRkcnNbUkVORVNBU19JM0NfTUFYX0RFVlNdOw0KPiA+ID4gIAlz
dHJ1Y3QgcmVuZXNhc19pM2NfeGZlcnF1ZXVlIHhmZXJxdWV1ZTsNCj4gPiA+ICAJdm9pZCBfX2lv
bWVtICpyZWdzOw0KPiA+ID4gLQlzdHJ1Y3QgY2xrICp0Y2xrOw0KPiA+ID4gKwlzdHJ1Y3QgY2xr
X2J1bGtfZGF0YSAqY2xrczsNCj4gPiA+ICsJdTggbnVtX2Nsa3M7DQo+ID4gPiAgfTsNCj4gPiA+
DQo+ID4gPiAgc3RydWN0IHJlbmVzYXNfaTNjX2kyY19kZXZfZGF0YSB7DQo+ID4gPiBAQCAtMjcy
LDEwICsyNzUsNiBAQCBzdHJ1Y3QgcmVuZXNhc19pM2NfaXJxX2Rlc2Mgew0KPiA+ID4gIAljb25z
dCBjaGFyICpkZXNjOw0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gLXN0cnVjdCByZW5lc2FzX2kz
Y19jb25maWcgew0KPiA+ID4gLQl1bnNpZ25lZCBpbnQgaGFzX3BjbGtydzoxOw0KPiA+ID4gLX07
DQo+ID4gPiAtDQo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIHJlbmVzYXNfaTNjX3JlZ191cGRh
dGUodm9pZCBfX2lvbWVtICpyZWcsIHUzMiBtYXNrLCB1MzIgdmFsKSAgew0KPiA+ID4gIAl1MzIg
ZGF0YSA9IHJlYWRsKHJlZyk7DQo+ID4gPiBAQCAtNDg5LDcgKzQ4OCw3IEBAIHN0YXRpYyBpbnQg
cmVuZXNhc19pM2NfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkNCj4g
PiA+ICAJaW50IG9kX2hpZ2hfdGlja3MsIG9kX2xvd190aWNrcywgaTJjX3RvdGFsX3RpY2tzOw0K
PiA+ID4gIAlpbnQgcmV0Ow0KPiA+ID4NCj4gPiA+IC0JcmF0ZSA9IGNsa19nZXRfcmF0ZShpM2Mt
PnRjbGspOw0KPiA+ID4gKwlyYXRlID0gY2xrX2dldF9yYXRlKGkzYy0+Y2xrc1tSRU5FU0FTX0kz
Q19UQ0xLX0lEWF0uY2xrKTsNCj4gPiA+ICAJaWYgKCFyYXRlKQ0KPiA+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4gPg0KPiA+ID4gQEAgLTEzMDIsMTMgKzEzMDEsOCBAQCBzdGF0aWMgaW50IHJl
bmVzYXNfaTNjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ID4gPiAg
CXN0cnVjdCByZW5lc2FzX2kzYyAqaTNjOw0KPiA+ID4gIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAq
cmVzZXQ7DQo+ID4gPiAtCXN0cnVjdCBjbGsgKmNsazsNCj4gPiA+IC0JY29uc3Qgc3RydWN0IHJl
bmVzYXNfaTNjX2NvbmZpZyAqY29uZmlnID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2
LT5kZXYpOw0KPiA+ID4gIAlpbnQgcmV0LCBpOw0KPiA+ID4NCj4gPiA+IC0JaWYgKCFjb25maWcp
DQo+ID4gPiAtCQlyZXR1cm4gLUVOT0RBVEE7DQo+ID4gPiAtDQo+ID4gPiAgCWkzYyA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmkzYyksIEdGUF9LRVJORUwpOw0KPiA+ID4gIAlp
ZiAoIWkzYykNCj4gPiA+ICAJCXJldHVybiAtRU5PTUVNOw0KPiA+ID4gQEAgLTEzMTcsMTkgKzEz
MTEsMTEgQEAgc3RhdGljIGludCByZW5lc2FzX2kzY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiA+ID4gIAlpZiAoSVNfRVJSKGkzYy0+cmVncykpDQo+ID4gPiAgCQlyZXR1
cm4gUFRSX0VSUihpM2MtPnJlZ3MpOw0KPiA+ID4NCj4gPiA+IC0JY2xrID0gZGV2bV9jbGtfZ2V0
X2VuYWJsZWQoJnBkZXYtPmRldiwgInBjbGsiKTsNCj4gPiA+IC0JaWYgKElTX0VSUihjbGspKQ0K
PiA+ID4gLQkJcmV0dXJuIFBUUl9FUlIoY2xrKTsNCj4gPiA+IC0NCj4gPiA+IC0JaWYgKGNvbmZp
Zy0+aGFzX3BjbGtydykgew0KPiA+ID4gLQkJY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBk
ZXYtPmRldiwgInBjbGtydyIpOw0KPiA+DQo+ID4gVGhpcyBzdGlsbCBhbiBvcHRpb25hbCBjbG9j
ayBmb3IgUlovRzNTLg0KPiA+DQo+ID4gPiAtCQlpZiAoSVNfRVJSKGNsaykpDQo+ID4gPiAtCQkJ
cmV0dXJuIFBUUl9FUlIoY2xrKTsNCj4gPiA+IC0JfQ0KPiA+ID4gKwlyZXQgPSBkZXZtX2Nsa19i
dWxrX2dldF9hbGxfZW5hYmxlZCgmcGRldi0+ZGV2LCAmaTNjLT5jbGtzKTsNCj4gPg0KPiA+DQo+
ID4gVGhpcyB3aWxsIGJyZWFrIFJaL0czUyBhcyBpdCBkb2VzIG5vdCBoYXZlICJwY2xrcnciDQo+
IA0KPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcgYnV0Og0KPiANCj4gTG9va2luZyBh
dCBEVCBiaW5kaW5nIChyZW5lc2FzLGkzYy55YW1sKSB3ZSBoYXZlOg0KPiANCj4gIC0gUlovRzNT
IChyOWEwOGcwNDUpOiBIYXMgb25seSAyIGNsb2NrcyAocGNsaywgdGNsaykgLSBzZWUgbWF4SXRl
bXM6IDINCj4gIC0gUlovRzNFIChyOWEwOWcwNDcpOiBIYXMgMyBjbG9ja3MgKHBjbGssIHRjbGss
IHBjbGtydykgLSBzZWUgbWluSXRlbXM6IDMNCj4gDQo+IFRoZW46DQo+IA0KPiByZXQgPSBkZXZt
X2Nsa19idWxrX2dldF9hbGxfZW5hYmxlZCgmcGRldi0+ZGV2LCAmaTNjLT5jbGtzKTsNCj4gDQo+
ICAtIE9uIFJaL0czUzogR2V0IDIgY2xvY2tzIOKGkiByZXQgPSAyLCBpM2MtPm51bV9jbGtzID0g
Mg0KPiAgLSBPbiBSWi9HM0U6IEdldCAzIGNsb2NrcyDihpIgcmV0ID0gMywgaTNjLT5udW1fY2xr
cyA9IDMNCj4gDQo+IFRoZW4gSSB0aGluayB0aGVyZSBpcyBubyBuZWVkIGZvciBjb25maWctPmhh
c19wY2xrcncgZmxhZyBhbnltb3JlLg0KPiANCj4gQW5kIGFzOg0KPiANCj4gY2xvY2stbmFtZXM6
DQo+ICAgaXRlbXM6DQo+ICAgICAtIGNvbnN0OiBwY2xrDQo+ICAgICAtIGNvbnN0OiB0Y2xrDQo+
ICAgICAtIGNvbnN0OiBwY2xrcncNCj4gDQo+IHRjbGsgd2lsbCBiZSBhbHdheXMgMSAtPiBSRU5F
U0FTX0kzQ19UQ0xLX0lEWCA9IDENCj4gDQo+IEknbSBtaXNzaW5nIHNvbWVudGhpbmc/DQoNCkkg
bWlzc2VkIHRoZSBEVCBzY2hlbWEgdmFsaWRhdGlvbiBjaGVjaywgdGhhdCBvZmZsb2FkcyB0aGUN
CmNoZWNrcyBpbiBkcml2ZXIgY29kZS4NCg0KUGF0Y2ggTEdUTQ0KDQpSZXZpZXdlZC1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KDQpDaGVlcnMsDQpCaWp1DQo=

