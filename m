Return-Path: <linux-renesas-soc+bounces-33781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s/VKDON/KGojFgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:04:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B17AE6642F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=iMFJjM4Z;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43518300B18A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 21:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A7B330D29;
	Tue,  9 Jun 2026 21:04:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82361F4C8E;
	Tue,  9 Jun 2026 21:04:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781039062; cv=fail; b=FRs4zQk509+5XAS/5U8zxRBM2x01k8I0H/owTegYyUwG6Orb2FgLBajwZDzfyds05Wie0nBjvSwrb838A7wWEAXkG4L/Y2sOG90NZE4Z1DbjNFp6eMgcZ2p/T+scojM2BCBfb4iD/IR+H91fcOupzj95s2u7xrrdSkAXC5ARvmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781039062; c=relaxed/simple;
	bh=ss5L7/O11OheBjBrRE/V9dQV9KxvXUKi/kuj6L91Cfc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oPHz8X5kvtCnqzHfJAbvEOFEjYUCChgR3wQfFL+L5rfDx+02iA6YWQjGNOo7CpwyozcFkV9lM+fvz5UXj60ozExUW6l5gmCbz7fkAFl16hnPlM7yAoajrMhH5QMWtTPbEorJCnf+WaTetiis5Ob3oGvw3Me8MPHzpBOom5bh7E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iMFJjM4Z; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMMsou4Nb3VpTnKbPV6EtavW5LxgeEOYRnO1NrizPiPW1j0zgBE/RiceHzg/jRDPuHHY+ztjzKINvtsu3tSzGxY86vWqu8J4dbL/H7vUsva1508Vl0nTYYKTyJ8waRYFP9L5kECLrmdue8XbuXFf+ph4XBVHApJcYDRXR6HRLkrJzWq1iCnJMe5LSJxVTLcwoaf/czrBbx/Mpli5GvUT0wQCmsNdOzmA15CqMHvqcF7GGY2t9hdPydPCc5eP32F5+/UJO1PlscFsnrV0mnEV3YyaAm/8gd+EMwfNIMc5XY1JsTY2jelZTj0S+DxOewTX8dfW3eW0jl4hpYemqhgJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss5L7/O11OheBjBrRE/V9dQV9KxvXUKi/kuj6L91Cfc=;
 b=tnWEcJBt2p4J5KVWc0R7jCRSY5mpdLlKgOfVMqZhHDQeuv6MlrpxXofe7V37gSvlyb58VomiwotvdF5gRCdttOH19RjBiwTRBKY0yW04vuXnksFUBiyF2nQNBKX4X9+Gms9XrE5yRu/+uIi1FP4aE7m0lhKTfqOZgNejypZcUoj1ApCjfPZmF90r4Fe+x51XjDxHbu8bOQauSUiYejXjMv8ub2PL/gYVrccv1cycSxZOgnOJhC8o1KwG79jrtNxVtdqO61XBm0Y68oo5oAV7udJ39m4g1ls8LmKiioNZcvw1vLJ6w1K1n7+ebF8TFpxzMM4lrq4QkTzyH1XdKZzDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss5L7/O11OheBjBrRE/V9dQV9KxvXUKi/kuj6L91Cfc=;
 b=iMFJjM4Zc2NKcWt3TcpQSEqa3S93whKpRuSQyHrhJOKds4w+KEY1HuKNQ2JJbG/bq2SXG6rEYqxGpgd3JzaA8fecWkQn5JJQxRNhVMxJKyi9IWLMFp1jSDCVH2+Ufcpq4SYua0NQddyZG59GJ4mlqgrfDFSMArkL+PFwBH1vXBI=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB14080.jpnprd01.prod.outlook.com (2603:1096:405:21d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 21:04:17 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 21:04:17 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>, Felix Gu <ustc.gu@gmail.com>
CC: Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
Thread-Topic: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for
 8-bit RX path
Thread-Index: AQHc9P7Eab5Y7kkD5UeXXTy9jf9gGLY0Tm0AgAH8IQCAAAP9gIAAaiew
Date: Tue, 9 Jun 2026 21:04:17 +0000
Message-ID:
 <TYCPR01MB12093C33B2C33D80117F79D96C21D2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
 <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
 <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
 <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB14080:EE_
x-ms-office365-filtering-correlation-id: ff943a4e-c39e-4744-5520-08dec66aab14
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 yDk+fzlo8K9iI208gPCSEDjUdzIeyoupqMDH4T1xXsdSTdoLOv11H75MkeEawWEKSdeUC+Ewub1nUiYeqpJOpA3wvBdbSNDYxbZrWloapvlUoGqHPICAIdyN5lYn9M9eH9IdTpNNOs1yrHoctay0XB0sywUKPh03gYe5KhpBzzCox7Dp1h31RZ2/5xOGTbf8edeFyiQkcDaJkn944ZHRBYn9OjTEMK7DfNLshAOJT5C0b/QBj1+93sJqmJXGNKOmnyN0X7Ar72L5U0sTQHHz1NhVB0k3FYMhXbGnSLnHWSHrtpAL0OTr+rSyqXyD+6uaT89Yi/LjQscUS4qhbiF/7SWMNOZQhmznHaMPUi4Csf6U9utmaiEetLdA3uukFlGCfy58lqoEsBlA4aSYXCfrJisEI+NtL160xJrcjD6nNjdg2G3VcuiP0Fr71rqhNDug9kC8anMUYEcQ36gVcEB1OTY6r0zubEohsMjsQKLX2SdKOdXoQGktXOgtfrCClrivfPxbNstJ3+X16T6p6yVN/w2IPdTTCH4EAwZUdYu8nBvBQFXfwyiG95Tem5A3rjj3tbdXXkNiNH6x+ifO95bQI0xvs4M4b1p5B0y1CvhuyFK7BVdku8VbOyb/XbLU6qeuBzGPGQlNwIhZdykIjF9HStybjDrMliIVnGy6UoohfDtaNAbdB90RYIdIIaCGvDM7SLzu4ycOx3l45Se2qPlbTUmV4UgOgTZrPebMQ2c/2Ts3HklpFDZMcTElBJaca1o1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0hCUXg0R0hIZlhXVnExQmhmdmZUQmZTWW9LUEV5RlV3Vm84c1hobGcxdmZj?=
 =?utf-8?B?V1lFaUdBWFRFMDFjKzRKQTZ4QytXbEdIaUk3eDh3NEVyYVlncGZHTVBWZHNr?=
 =?utf-8?B?NENmYmtETDhPcHVwUnp6b3p6d3lQNERkU29OcGxDbm1jbExmSm5wVFJLSG1E?=
 =?utf-8?B?UC91U2dVTjFTQXhpMXdFRXRrNkx4clVSYkc1Q0VhWTljTVoxWS9oakVtOCtk?=
 =?utf-8?B?S1NEM0owTFV3bnZuaFh0ZnlIcG5Sdy91d1FVRnVjRU9ndWhhSFFBSlNPaTFM?=
 =?utf-8?B?dE1SdUFRRlFiWWk2elA0aGdhb0prUkcxeFlWTSttM1g5SU9UYzdPemxHa1Vk?=
 =?utf-8?B?UEttak9BSjVWUDhROERaRnpIeE9WKzYyWHNQdnd0TG1RaVVCRE1mUFdlaSs2?=
 =?utf-8?B?cDhlVXA4VWxSdzFZWWpHOGpxajB6V3NBT3puOGhlVkhnZHFyUk45UTdJVkc1?=
 =?utf-8?B?Z3p5OTRTTk5rWGxBYjRCQjA2VVprUitoTjh6V214S2NRZDRNTU84VUgvbS90?=
 =?utf-8?B?MkVWOWM3dHZDZGlkNy9sZ1JCMFR2cTFhMFpFenNVNFJXRGRIYmMrYThMeU5B?=
 =?utf-8?B?RjZNZEFBV1FlYzhwRWp6MVlsVGNza1ZXa01HOVhmVkwvak1ia0o3UVNGcThW?=
 =?utf-8?B?NzJ4MG5YT0pDNzVvMVF5OXhiV1pwUVYvVnErc1pCbUdzSnRROEliSi8rOTdH?=
 =?utf-8?B?S1FIQTRnWjE4dEhQK1N3R3RKRXRaVm1HaVZSSUNVejB2UmNxdmc1cjkxeUpV?=
 =?utf-8?B?OXJXTVNlRzM3SmZMbUo2VnFqbGQ2NzZPTnovYmZuVnUxV1F5WmNidlA4MERH?=
 =?utf-8?B?ZGl3Z2JjdjZ5WW9WckN2a3ZOY2NPU2dPYlAwcFkwNnAwckg2ZXJSZE96MlJt?=
 =?utf-8?B?NUNQM1NLRXNkbTRMbncxVk9uZ1d5OFl5VVBKQUgxQzEwNHVoeDdPUG9iS1ZZ?=
 =?utf-8?B?MkV3YlZnOFBzSGxFMUxYcmhFcU1rVzNORXJ3RjFkdUEvVWlNNnErVGF0S1pE?=
 =?utf-8?B?cEVOMFMwd1FlRzhFbmpFVnF6RzZrUXNzRmFpWmZEdHZ1SHZsVXNvbmRCWEJZ?=
 =?utf-8?B?V1M5WVdWQlFmTi9rOGNzd0oyeHFsZ1pQeXRSQ2s4SWtCckFWRllFbE9zSTlz?=
 =?utf-8?B?RTdUalJ3eENYbXFKWEZKQmtXMk1rZ056SFZwRHhSUjFNakgyNGgzRCs5OGh5?=
 =?utf-8?B?TURGWTJEdmNVcVVWbm1Ja1RFRmhPRmRoRnpHZHVmNnlST0dJY3VmYU8vNUEv?=
 =?utf-8?B?N1JzT1JzMTFGNjdrRlNuT3hYNWplTUdCN0RTTzM4OFVsMFZHSHRZS1QvUVJJ?=
 =?utf-8?B?TngzLzZiRVRGYVVCOENSS3RpaGhmM0lKS2d0TmYwSE9EMTJjaXpDcDZtMjFm?=
 =?utf-8?B?YUlJTmRlUVFKUEI0czVxbVBtSEpKT1prR3c2M011NzNjdWNUZW1YdXd2cHJT?=
 =?utf-8?B?L0ZMRnZqb0RPR0JOcGZjMmtLek05TTNjTmwyTzFEb0ZhMXpIbjZrOWhwd0Y0?=
 =?utf-8?B?am5tcjdIZXdWclMvWVVYdGNjaUREWXpkRzZkdlVycTJ2dUIwRVZxeHVkR3ZL?=
 =?utf-8?B?L2M5L0ZZcEQ5R3ZmSGMyWG83ZXJoQ2JXY004MU85RVpWb1pPbm5QdFhrNVEr?=
 =?utf-8?B?OXZoOFQwZzBWdVBxUTdEdFVCYk44QU5UV2FZR3VTaGVqb2tsVmV0L1pQWWJT?=
 =?utf-8?B?MVNhRVd5QXZJK3d6Tk1OL05yUjhSRXZtMWhYNUtScXZrTUMzSTdvM1VTSzFp?=
 =?utf-8?B?TzJvY0ltaHMvMzhrVWVjdjQ1aWJkOWx0R3JvNTZES2JvQjlPbWVtNlBXUjRH?=
 =?utf-8?B?NnA3OWV4a2NSRlpKbkxCSlE2WU5iUVlQSG45R0dEa2tJZnRIUkpCZzRpek1l?=
 =?utf-8?B?ZHVYc3ZMbnlCanBGbDQyMzd0N2MwTUtNcjhNbVNjMm9DVHZQelZiMCtGY25l?=
 =?utf-8?B?ekxhcUhOZXNORWoxUTR2VzIyWlZMdlZjNGdyOFVteVhBbFZENy9CTDl6cENs?=
 =?utf-8?B?TFdpOFY1bkdoZU5vbWlKK3JHMEpiMENqNzFiRzZqU3JRR3BXSm5PTUhmTXRy?=
 =?utf-8?B?Qnk0cy9CK3doRGhNQnZZT0ZlSm5va1BXMi80MHRyU0pkZ1BrbWxyUkFaOUFx?=
 =?utf-8?B?NE01emNKSXIrYjlPbFRGcVNybFZXemU2RGxhdW4yV05IRU5SMXpxU3JMTlln?=
 =?utf-8?B?VUFkekdFa0VwRFk1R0ZTSkIwOUNSamRiTGMyOVBIK2oxRXZ2MDlXWW9WVjZB?=
 =?utf-8?B?RmhQdEhUMllYbnNEQVNmR3FOV2F1WWpMcTN5dVZwaHlqUk54REIwUGdSc0Zy?=
 =?utf-8?B?L1hPYTVXdE9NT1VqY29SaURXWGtmZWtkTG9qTHphbFljcFl2em1wUjQxaEpu?=
 =?utf-8?Q?XYDJzjBWtfDhQRpc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff943a4e-c39e-4744-5520-08dec66aab14
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 21:04:17.1687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3V36A/xDmbvLqJxQdLsh1PvqxdW4yHJcttuX7kZP94CwP3ay/bMcF6K6iFlLMuJOZQi6H4J4PxC3mPWncJ5y7tcQ+LSCSYD7UMCENC2Kosg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:ustc.gu@gmail.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33781-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,linux-m68k.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B17AE6642F1

SGkgR2VlcnQsIEZlbGl4LA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+DQo+IFNlbnQ6IDA5IEp1bmUgMjAyNiAxNToyOQ0KPiBUbzogRmVsaXggR3Ug
PHVzdGMuZ3VAZ21haWwuY29tPg0KPiBDYzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0
cm8uanpAcmVuZXNhcy5jb20+OyBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+OyBsaW51
eC0NCj4gc3BpQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHNwaTogcnp2MmgtcnNwaTogZml4IGluY29ycmVjdCByZWFkbCgpIGFjY2Vzc29yIGZvciA4LWJp
dCBSWCBwYXRoDQo+IA0KPiBIaSBGZWxpeCwNCj4gDQo+IE9uIFR1ZSwgOSBKdW4gMjAyNiBhdCAx
NjoxNCwgRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwuY29tPiB3cm90ZToNCj4gIE9uIE1vbiwgSnVu
IDgsIDIwMjYgYXQgMzo1NeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOg0KPiA+ID4gT24gRnJpLCA1IEp1biAyMDI2IGF0IDE3OjI2LCBGZWxpeCBH
dSA8dXN0Yy5ndUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBGaXhlczogOGI2
MWM4OTE5ZGZmICgic3BpOiBBZGQgZHJpdmVyIGZvciB0aGUgUlovVjJIKFApIFJTUEkgSVAiKQ0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQo+ID4g
Pg0KPiA+ID4gQWNjb3JkaW5nIHRvIENoYXB0ZXIgNy41IFNlcmlhbCBQZXJpcGhlcmFsIEludGVy
ZmFjZSAoUlNQSSkgU3Vic2VjdGlvbg0KPiA+ID4gNy41LjIuMSBMaXN0IG9mIFJlZ2lzdGVycywg
dGhlIFNQSSBEYXRhIFJlZ2lzdGVyIHN1cHBvcnRzIGFjY2VzcyBzaXplcw0KPiA+ID4gb2YgOCwg
MTYsIGFuZCAzMiBiaXRzLg0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIHRoZSAiQWNjZXNzIFNpemUg
W2JpdHNdKjEiIGNvbHVtbiBoZWFkZXIgaGFzIGEgZm9vdCBub3RlOg0KPiA+ID4NCj4gPiA+ICAg
ICAiTm90ZSAxLiAgVGhlIHJlYWQgYWNjZXNzIHNpemUgaXMgZml4ZWQgYXQgMzIgYml0cy4iDQo+
ID4gPg0KPiA+ID4gSGVuY2UgdGhhdCBtZWFucyB0aGUgcnp2MmhfcnNwaV9yeF91OCgpIGZ1bmN0
aW9uIGFzIGdlbmVyYXRlZCBieSB0aGUNCj4gPiA+IFJaVjJIX1JTUElfUlgoKSBtYWNybyBpcyBj
b3JyZWN0LCBidXQgcnp2MmhfcnNwaV9yeF91MTYoKSBpcyBub3Q/DQoNClRydWUsIGl0IGxvb2tz
IGxpa2Ugcnp2MmhfcnNwaV9yeF91OCgpIGlzIGNvcnJlY3QgYnV0IHJ6djJoX3JzcGlfcnhfdTE2
KCkNCmlzIG5vdCwgYW5kIGNvdWxkIHVzZSBpbXByb3ZpbmcuDQoNCj4gPiA+DQo+ID4gPiBBbHNv
LCByZWFkdygpIGluIHJ6djJoX3J4X2lycV9oYW5kbGVyKCkgaXMgd3JvbmcsIHRvbz8NCg0KVGhh
dCBsb29rcyBjb3JyZWN0IHRvIG1lLiBUaGUgYWNjZXNzIHNpemUgZm9yIFNQU1IgaXMgOCBvciAx
NiBiaXQNCihhcyBzcGVjaWZpZWQgaW4gdGhlIGxpc3Qgb2YgcmVnaXN0ZXJzIGZyb20gc2VjdGlv
biA3LjUuMi4xLCBhbmQgYWxzbw0KcmVwZWF0ZWQgaW4gc2VjdGlvbiA3LjUuMi4yLjE4KSwgYW5k
IHdlIGFyZSByZWFkaW5nIGl0IHdpdGggcmVhZHc/DQoNCkNoZWVycywNCkZhYg0KDQo+ID4gPg0K
PiA+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uLg0KPiA+IEkgZGlkbid0IGNo
ZWNrIHRoZSByZWZlcmVuY2UsIGp1c3QgdGhvdWdodCBpdCdzIGEgbGl0dGxlIHdlaXJkIGhlcmUu
DQo+ID4NCj4gPiBBbHRob3VnaCB0aGUgY29sdW1uIGhlYWRlciBoYXMgYSBmb290bm90ZSB0byBp
bmRpY2F0ZSB0aGUgYWNjZXNzDQo+ID4gc2l6ZSBpcyBmaXhlZCBhdCAzMmJpdHMuDQo+ID4gQnV0
IGluIDcuNS4yLjIgcmVnaXN0ZXIgZGVzY3JpcHRpb24sIGl0IHNwZWNpZmllcyB0aGF0IGZvciBy
ZWdpc3RlcnMgbGlrZQ0KPiA+IFNQRFIsIFNQQ1IsIFNQU0NSLCBTUENNRCwgU1BEQ1IyLCBTUFNT
UiwgdGhlaXIgYWNjZXNzDQo+ID4gc2l6ZSBhcmUgZml4ZWQgYXQgMzJiaXRzLCBidXQgZm9yIFNQ
U1IsIHRoZXJlIGlzIG5vIGZvb3Rub3RlIHRvIHNwZWNpZnkNCj4gPiB0aGUgYWNjZXNzIHNpemUu
DQo+IA0KPiBUcnVlLg0KPiANCj4gPiBBbmQgU1BTUiBpcyAweDUyLCByZWFkbCBvbiB0aGUgcmVn
aXN0ZXIgY2F1c2UgYWxpZ25tZW50IGlzc3VlPw0KPiANCj4gR29vZCBwb2ludC4gTGV0J3Mgd2Fp
dCBmb3IgRmFicml6aW8ncyByZXNwb25zZS4uLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==

