Return-Path: <linux-renesas-soc+bounces-8131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC195CA93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AE091F21C4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B9917E01E;
	Fri, 23 Aug 2024 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JgpaTWyq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C637144;
	Fri, 23 Aug 2024 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409501; cv=fail; b=mQfHPW1ubLoVhZsWAYgN1g2G/MHAcy462NF6J2V4TolAku9IoRF+2YYIwAU+chgI+ncRYHz6qx/nv0jqfk5q0x+nSu9KpUkMfRifixkvoFeUFa5MFbWwqkQkc6nepBzmXCjZjC/TDRzNs7lRtNE0xV4T+/ux07WOf9+i0FZw7q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409501; c=relaxed/simple;
	bh=FVy9xJFKlm7OPytZPf8kx2y4L6LNlPQQdnsrc946I7A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kTjmuAufpcXf8nN0e22dg+yfZIor5AUXPz46UgqeEGzaPEX2Z0o5fk551f6EIIGLMQ7DawMwBHqoARHwJdh4jT7OEJ3cXGYEGGPBIxKqdVTABsTSCO3dgC1B6YOTJKkgoElGLk5F236xbz82Mx70vWtfrVcJyAx19UrR2+cWhHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JgpaTWyq; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v41a989kVbl534oIhTDvunf5I1es0A/n6l0wnQB0eRD7JESS5Ol/FVnrPFx3Dq8Vk8vwyfsEuMhwFNiBRlkC9h/6tANGVd6fUhH1U5JeTdL6w3l0PwkKT0F6L/4qZa0B/Dy56vPWPNk9i18ePzFPHvF4zDSYiXM+2qtsolhfdBKEkq8OFVRzatSkn1D9TxGKIaWhvzXPTPTmx0gTNxdKU0WalFptdLNOvOHyk0abGQv2wHQV2VIyPUbzyJLcOJKuCESwHHKu4tXsCPCfg66Rtv6dPGkgEl5b5DrHULa+JyxXud4O5v5bd+jspHnjJXVtGnOfE5Ye02b6ebGoE+bsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVy9xJFKlm7OPytZPf8kx2y4L6LNlPQQdnsrc946I7A=;
 b=FjRnMrFxqvSaaf4VKS1/Xx1aR9FcMCjFgNpxpxztTHoqdkMaztMPEmtdUnnGxc2V/SsbA/Adm2Vsc5G1/QxwZynMgTo3hKcL7xFf7Uymw19TrOxwcxg2gfRVHKdha8GOXpNkBoFkgMW/Prxx+8qCkCKUFIhcWxwWA88fIAiHQxbLvislZhpAo+Nah5wk1Kn5DAtoL5AnZzQZmvHLiYVgaTNCESyMuhT/bjhe9q9TsgdPEd4Xa1aMc8Qo/iTjtYp7CXxzD6ptQ61PyYxTgsVBBrCVfz1N7W3oSdKNjUyC2RynScQfwhpvzxfav/zapOevFhbeNox5PQsDyu1aaXkj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVy9xJFKlm7OPytZPf8kx2y4L6LNlPQQdnsrc946I7A=;
 b=JgpaTWyqFZruVPteaT6Zks/su9xGcMAuCKNRXGO4mXhgghPmRwGPwalTvglIcVJh5b0gtlWBfNp3WxrDkAoEaKj6pu0TBu6gWilVxHgZ0cEhrQhAXUm2rbc6RXmEgmM+eJvh7Zy0UVRVmKR1US8P+nOrP8VrcJVvulpj30elf4c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7972.jpnprd01.prod.outlook.com (2603:1096:604:1be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 10:38:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:38:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Thread-Index: AQHa3m8e92YEq2zHb0+2/Goto6PN9rI0yWUAgAAKeSA=
Date: Fri, 23 Aug 2024 10:38:13 +0000
Message-ID:
 <TY3PR01MB11346A149470437928A63D2A586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7972:EE_
x-ms-office365-filtering-correlation-id: 5a760371-d106-42a9-b08a-08dcc35fb0c6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0graXBhZU90VC83V3hLMDNaMWp3L1hqaithVzU4RU5QeHlkaGdJYzkvU0ZS?=
 =?utf-8?B?OG5zY0RpUGI3RGFML3NnMGRqeGxQbVhYZWpEa0M5b2lyYW5QZ1VnbkhWQTNw?=
 =?utf-8?B?L05BeElYRzFrQmVZZ09YK2RhN1JDcEFYTFBTem5CcEg0WTFuWFdJc3RWaDdo?=
 =?utf-8?B?enFEVkEyT0NKNW03UjJxSWtPQW16YjhkUWNlaXZMR0xZcXdEWWM3M3lBQnYr?=
 =?utf-8?B?WUJGQzhuQVFXaVNnN2VwWnI4a0ZzMW1lWUgrRkdhaXk3MFFKbWRHaUxrNmVP?=
 =?utf-8?B?TGZpbnB5QVNnQTZzeG5WcytoSlNuVXBBQ3orR081VjVhSzJOU2lmc0VyWnZ3?=
 =?utf-8?B?R0JZdHloMUxhdmh3SFJOUkcvdjBUc3hscmFWQXFTdnpXZFNrbGcrc0pPN2FS?=
 =?utf-8?B?bTVkMFhCcW1MbXh4NnMyRGdiTE1IVEhzemJON0IzUUJLU2hJeGtBejE4TkVt?=
 =?utf-8?B?YnoxR0lnVjRTZFVGekRNU29qdGtGRHVUZFVYQXQ4bkpMY0dhRHF3WHF4UnVI?=
 =?utf-8?B?VnAxRkZBdnBOcmVmUG5LZXVKclB4VEQ0d2djeHFMYkV6V09MWjFYbW1nc01P?=
 =?utf-8?B?YVVQNmZ2Z3NmdjdhMmk1QTZsZXpEMlZyaFFGaWhGd1RNV0UzczlNZDNnUGtV?=
 =?utf-8?B?WEFCeU42MXZCRllnTTRmWHRDNUtTRlpucVB6OFRUSGt0Y01KaTRlSCtPTDFF?=
 =?utf-8?B?Mno3ZUUxV1BmN2U3QkZvWVE1L2E3U0pTT1VLS09hSEdxWlpjenJrTWhnTUVU?=
 =?utf-8?B?OEJIVTdaWG8yblFhczRkQk4xYWJUTXFYK0pjeldUb1hNTlRUUzQ0VUtQVFQ4?=
 =?utf-8?B?cUJUc2dsSzJNSnI0VUNoZnBYeEs3NUhqSHZvZ2F2NXljTjg5VnJHTk9VMmE0?=
 =?utf-8?B?NTh1d21JMUl0VTVuNWhvU2JGRE9veDFEdUcrci9wb0JpZVp6cVZ2Um5mZUJI?=
 =?utf-8?B?S2xmTDBBZ2loZUFEVWg4anZGcWRpTlYyelJsSW5wRm9HdDV2cmNUMXNvMkhz?=
 =?utf-8?B?RXphTGplVkIrQ3NtT0VWc0JVckN2Y3NsM3hWNjY3dFA3NC9YTmt4emRZajJs?=
 =?utf-8?B?MTJ2bE9GK0libUkwbG01bjZ4aUJtNzdtQzU4L293UG4vVFFMeTBTdnE5YTNi?=
 =?utf-8?B?Skw3MHhWMHl4ajN0TGt4Ni9Na3NiblJydTBFaTVNWG5FODltbFFpYTFnYUFR?=
 =?utf-8?B?KzZ3YU9jdVkzUFkvQzkyb1lvS3ZPZ3hKS0JqdlJoN3NYZHZ2K1U5SEhySWVq?=
 =?utf-8?B?SURDbTFQaVN2YlhEeGpuREJ6L3M3V3NFWmJkNHZXNnVCUkt5QjhXRUE3SzdK?=
 =?utf-8?B?UU5JcUUrOFJrYjhqZ2x5ckw3WWR5eEJSVStxbi85dGpUS1NDRGsvMzJVdzV5?=
 =?utf-8?B?WjJvY1VnNGQ4eC9zSDl2TGUvN3pwWkNFMjV2YmgyaG03Y2RnVVJGS0hiZnFh?=
 =?utf-8?B?L3p0Rk50K1JFYVJoekVBMTAzRWdLSm1XdFpXaERaRjBKaEtCNE5UWlZIRlIy?=
 =?utf-8?B?MVowL2xWZnBGdXE2YkNBYm9oK2pNRzQzaVZCYVowc2lDb0dCOGI5SE5CUFp6?=
 =?utf-8?B?NEM4eUM1ZTIxbWNDY0FzQjlXWWVyNkVKUnFKbTVWc0NnVkFQQUFERmhPMUsw?=
 =?utf-8?B?aFhBa2NERlJLK3A3aXlVV3FOVG1TSGFlc0tVcVZ6Z1NPMktaRzVvNzFwdTZC?=
 =?utf-8?B?cy80ckk0bTNGVDhacUl3OG1PdU45Um8rdHI4Myt1YzIvcjhLY3hMb1ZLZUNa?=
 =?utf-8?B?MmJlZm1nQ1RGOTBkMkdBdEVJV0crVkkwZjJ6ZVpyMHVvQXN3YjBhcHlENnp1?=
 =?utf-8?B?T1ptWUhZM1hhc0thK2J5RG9CbWVrR3BubVkvbkJ0NS9aM2d3NGVVV0UvZGpI?=
 =?utf-8?B?YWtMU0J5dzBOTWR3VndJcXNVNG9wb2hQUGptWmZTRnRVU1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2Y2WEdDVGg1TEdLSTZYNStQQVNrQUFSTTBUUzdKNDJpc2VEWmhNUnR5WlNU?=
 =?utf-8?B?azhZN2x5aGFJdmJoMGRtcGZ6dGZINXVsMFJLaGVjMDJWNXg5T0w0WUF3TVJJ?=
 =?utf-8?B?YjM3RVEydnNnWTdvODJqZTVuRzJhV2tXTUR0aEhOck1rblNQT2sxSFhKbDk3?=
 =?utf-8?B?SFB6NnY2NlZCNGpRUit4TE1PMnltMmhsVTIzakR4cUtXT0hsbThQREZxbnJk?=
 =?utf-8?B?Z1pTZWVpOE81c2pHRnlCRERjWEFKOEszaHY2Q2NzbDZCc041NCtPMXpRWVp2?=
 =?utf-8?B?MFdIRnpHOWpWY0IyYk1SU3pUODBVZE5qRWFrQm95Ui9hOGdjd0hiTUMwM29u?=
 =?utf-8?B?NHlLUTVseUVqZU5qdVRmNUNFcHRSZllqSkFSRmRuT1l1c3U5YUY2UHJPUzZ0?=
 =?utf-8?B?dzk1aVhXRjVSWWNMU2hsN2p1Y0hnNVV6Y3l6Y3FhVDcrdFYzZzNGZ09Hd3dl?=
 =?utf-8?B?eDJyakl6RlZyZGllb0hOendxaExPS2JnL2dJdmtnWXZKR2ZVa29iR3FZNmhN?=
 =?utf-8?B?SFhSUWVBRzViM2R5QVlLdE9tRGNQZkIwc241SjNsUVZKcFpUWGtQa0h4Visz?=
 =?utf-8?B?VkVpNzcxMmxzUkpvTlgvVWpXTE1CT2xUYjhtN3ZxdEhadEQ5L2prM1J6NWd6?=
 =?utf-8?B?THlnV3djaklrSlVuV3VXZmQ1KzMva3FYRCtycnhXN0xuZmtJc0JtYnRVL2k3?=
 =?utf-8?B?L0I4MU1iMS9RTUlQMGZqTUdON2JxSjJSdlNJT3RUWXh2RXFyQm1adTlLMDVi?=
 =?utf-8?B?LzcwN2xVS0N5ODV3VU1EWjl1Z2pMdXNWUlluQS8yUVJZanZCQkR3MHI0TGZn?=
 =?utf-8?B?NWlYWHpLd1U4U3JNZEhyanY0S2EvYkVyNlFja0dPR2VEWkJTeXJ5bno0Q25t?=
 =?utf-8?B?TjZoLzR2YXRBMnE1Ym12UUMvUlgyaU5icDBkaXdMa2ZxWjA3cEx2aGhjVGNK?=
 =?utf-8?B?bW94dHFHL2pHMS9Fak95dWZuUHlvVlBnb3VONU91T0FCZlR4UlBRVldrcVB2?=
 =?utf-8?B?YXRQMEthVU4wdEhVbG9hZFV4MWZaTmlXY1NZZmtZS2tDcUZKYWh1cml4NmM5?=
 =?utf-8?B?dWFZNjFON092ei85ZWpUM3lyeXg4QjE2RWJESkoxNmZ5dE5XZHlZRCtrVXVh?=
 =?utf-8?B?bDFBVjBwTjNMR0ZJVlpQTGZGTzVNUkRUSUIwQmpPVlB4Tkh6QTRYeHdEVU1B?=
 =?utf-8?B?QnZudkRqYjhrN0xzTWpLU2h1QnBtTUhlRTVQN2c1bGhuM044SE1KL3JydGg5?=
 =?utf-8?B?YkVlUWk2dDZYYkhsM2dGWTdPM0crQkh6eUdkbG5PVFVpM2JYYmZXRytpUHhn?=
 =?utf-8?B?Y1VaeGo5d1ZHaDU1OWY1amxwRWFwbFJEcDcyOHdoaDMvYnowRks3TnA5VC9r?=
 =?utf-8?B?dlYvYy9QN1R6WUhUb3p5V1A3bGhXMHJQcmtwSlRMcU9KM1dxajIxOS8xTGE1?=
 =?utf-8?B?aTdrWStXd0RveDdwa2VjbzVZNWxIZDBWWmxsZFBzaEpwZnBPRXNXMW9SekUz?=
 =?utf-8?B?aWNyTk9FL1o0U3VwLzBYcXB2RU9pZ0hObmZIZjEwY0ZvUEJjb1NCM2RMRmZZ?=
 =?utf-8?B?bHE0YmNUK2d2VEk2WHVsVXJ5SWcvQ3p6ZXpHSWtPSm0reTM1MStQUVJOVTZE?=
 =?utf-8?B?M0RYNHpMUFUwKzFyWkxMNEhoSDM0ZXllVTloajNjZTFPTXdtZVpVUWJNZWQ1?=
 =?utf-8?B?a1I2SjF6NTdmVVdyOUtEV2ZKME5tQmF2OEpRSmxFaFFWQ3BwRXlNc2drZlk0?=
 =?utf-8?B?LzY1L2J3aTFvNWRPaFpPMDFGbHNuT1I5cFhTeDlNeVJvSEJZTzduVGo4Qkdi?=
 =?utf-8?B?YWU0alNFOHRNN3BUWVdWRUhHSFBBL3A4U2d5bWRVWjhpZWR1UFV6ZWE4WXE1?=
 =?utf-8?B?Yzd2SWJZV1AvbE9qSVZHcUlUcm5NQlhCWldSSStSTXhtblVHOHFZRWZaNFVl?=
 =?utf-8?B?U2cwaEpvRkdLeVQ3dFFNRS8rdXl5M1FmT0R4V3BldU5MYm9mbWJ3UFFHY1hn?=
 =?utf-8?B?cWxZMmF0TndYUlhnZG40L29DNjJYT0hYTnFwZUQxeUlFZkJKOUZ2VW5LV2NZ?=
 =?utf-8?B?SjNvQzR3YUp3MFJSTlhndmlhRStqWWFVQmJ0eWFyN0RybEJDTiszRTV2Tm0v?=
 =?utf-8?B?U2JGL1NXb0d5R2g4ck1HNlUwbkRaQzl4QWx6UTR1ZFA2UWlsaGhjT3NMeTgr?=
 =?utf-8?B?L2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a760371-d106-42a9-b08a-08dcc35fb0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 10:38:13.4303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAXhxhnLYiBvJxOIeLMcdhNBD00QtJBF3dZxz0dudM+5EW9EhzVyAX1l2ySqkhY5JnXh250HwSHVvktHHc1yx8Fk9kx6JpOgwDbz/HyxY/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7972

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDEwOjU5IEFNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMi8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYzogRW5h
YmxlIEhETUkgYXVkaW8NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEp1bCAyNSwgMjAy
NCBhdCAxMDo0NuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gRW5hYmxlIEhETUkgYXVkaW8gb24gUlove0cyTCxWMkx9IFNNQVJDIEVWSy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLXBpbmZ1bmN0aW9uLmR0c2kNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtcGluZnVuY3Rpb24uZHRz
aQ0KPiA+IEBAIC0xNDMsNiArMTQzLDEzIEBAIHNzaTBfcGluczogc3NpMCB7DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg0NSwgMywgMSk+OyAvKiBSWEQg
Ki8NCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgIHNzaTFfcGluczogc3NpMSB7DQo+
ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCg0NiwgMCwgMSk+
LCAvKiBCQ0sgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElO
TVVYKDQ2LCAxLCAxKT4sIC8qIFJDSyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8
UlpHMkxfUE9SVF9QSU5NVVgoNDYsIDIsIDEpPiwgLyogVFhEICovDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg0NiwgMywgMSk+OyAvKiBSWEQgKi8NCj4g
DQo+IFJYRC9JMlMyX1NESU4gaXMgbm90IHdpcmVkIG9uIHRoZSBjYXJyaWVyIGJvYXJkLg0KPiBP
SyB0byBkcm9wIGl0Pw0KDQpZZXMsIGl0IGNhbiBiZSBkcm9wcGVkIGFzIGl0IGlzIG5vdCB3aXJl
ZCBvbiB0aGUgQ2Fycmllci4NCkkgd2lsbCBzZW5kIGEgcGF0Y2ggZHJvcHBpbmcgdGhpcy4NCg0K
Q2hlZXJzLA0KQmlqdQ0K

