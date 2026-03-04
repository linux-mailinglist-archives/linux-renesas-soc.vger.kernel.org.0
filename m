Return-Path: <linux-renesas-soc+bounces-28781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFB3AztZqGlQtgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:09:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70645203CD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B99743042FCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 15:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDBB355813;
	Wed,  4 Mar 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ihbCnTn7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87D34D4E9;
	Wed,  4 Mar 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638458; cv=fail; b=PTJp71nNHANGqyknIn89LHxTEHpLrO8gETnx9yJAeM+hivUtDSIwE/+Z4ATG1nwq4dFsggpjDh9Zl+u1kqm3aF24ohSixpOWP8TXUvuOz9tm0pmUDtu0lBmGJdjY4wlMV7YBlJMl/jIL/LnP463TcgFzK8gplgHU4syDWFESX7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638458; c=relaxed/simple;
	bh=sY7COO382tDKYpksWcjNPFN7w9VW5RB77jyPG9b0sB0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dzAw0/KzK5HMybQjGZQwsTy+Mi7H/x+nQhafXWvDqXVR6UvmbU7//q8KkVFrAR3eu5r7YQtXg920f7BmGoxEhA2SXiwtFhGDIxU8vWq7/jjR/viztscJEOxh16zC8FXrHNQJcG8aQzVSVBueumeIe3ocZQoZa/dZ0WqWIbX/1YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ihbCnTn7; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fR0i1IKFG26ObGNgCZg7uyfbgMBcU5OWN5DuVoxDHy/SgrQeMPJaA8xxekuf7DFO78V3Gu9mboCpFehoqskAHNxytNl/otk8TGbhAPk4kVlmZb3AzDoDTewB5YN2gmman8ShJRMkS3TG6/EygVabUgX6QGZY8Wk1FiZ/NGd3tSbRpP1FG5TjV6AljQ/cyXflnvA3FAAcrAT/oFoKK98NnvqnULm3odxIAkH1xteL5N9T0HzVQT8b1TQ+qusvZa3SZNa5ZHVopEv2Cn2byCFk3pYUKRfNNpTVGxQxXudwsZ0YJPnRvfFdeQ833RJbgRbVngiepPLzCLMtWOBElhdq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY7COO382tDKYpksWcjNPFN7w9VW5RB77jyPG9b0sB0=;
 b=ZZNuQQxwCto5PKFf1K0VdpQ/ZUjKLlttT6WvlUqNpRavtgayR8lqX3UVDEYc9j2jn11aVJxur0TdLtRr6/LtgyJL0yh/e6MW8uE03Gd5v70knDNUjw0Gult3cyLFVFnyr1AGQWK9CafEaZrDtg3J92YE9K1pcNLXvCIqNKtTQQ+d6VXPEtz2ym3unm3HvMtS4RVueaAoh5fikE+IARjN7Tt0E1yzhQyIwj720VpNv4er0MRq1yYvn5JQ4CZF72BVmZue0BsM3y7zoDJxaMJyUn9wT6JOC18IvTD79aQVpmFXTQ8FxriTszEMTfl8rqDoATRCE/8gc0IQPwsmWAVMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY7COO382tDKYpksWcjNPFN7w9VW5RB77jyPG9b0sB0=;
 b=ihbCnTn7D8SvFCVrpoLkdhphcxAYhlKz5+54ihYqoLTdkxvYbKxbY1EhDH5q+XfDl4GkIYX59+IQxqDp64yS8RQFUT4ANe6pH6QC5bI3ALoITqhtMVYDjgkFA1R86PuVrsX+6u/ZSnXxJOmKdkpDc5P1VTHc1UEyMSB8fLicIZQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYTPR01MB10939.jpnprd01.prod.outlook.com (2603:1096:400:3a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:34:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:34:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E
 SoC support
Thread-Topic: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document
 RZ/G3E SoC support
Thread-Index: AQHcoCny8bPbTNY9+kOEdB2P1VOs27WIFi6AgBZ6MoCAAAdtAA==
Date: Wed, 4 Mar 2026 15:34:13 +0000
Message-ID:
 <TY3PR01MB113466BB56D07926CD00A8EC4867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <20260218-qualified-octopus-of-luck-5fcbf1@quoll>
 <3cec7787-0787-4b97-8eb6-5fe28f4c2a14@kernel.org>
In-Reply-To: <3cec7787-0787-4b97-8eb6-5fe28f4c2a14@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYTPR01MB10939:EE_
x-ms-office365-filtering-correlation-id: 8ae77425-c642-461a-ef7e-08de7a037cf7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 xPqV78sKxZ53WFvz11SDMJx7YTBY14fBVr5kWXYr6GyjKLAaxf4vAHkX3nUOsZXUdkm3q9pnKIlSPWcuJEIm0zomb1GOlGziJRPWO6msnowMN6O2c0T+K1pNXqZLp5Q/+U/i6nCTLEN1J/nhBjCPznCldXvqJlXijTjl1X/9Sj1FH46kLITd0sb+HPtbc1NteyzO8ePUd0dSFBRhyncaE1xj5IpNbzsWmwhhWD3iwl13LExRtokL/DjImwhMDgDWZp6x32XDeZPMmZ1BsulC3SiKuabh8tKh5kwbweUnePJel3jEVLWI9JedFXkEcfTtXdx6KNP7hrIkYES6Y3XWLY/RNSP/dLNr02vKsJgzxzml7mdnBEmFOIsSI59+bN5TflOkLrPfaCuOa0YoXQOaCRYe3CYk39s1EiOm3QM7T/BWtXZgTRoQCHHBpb/ZiYxvXZIv1KC1W9WhpqK9xnp2aP9AO/B6jldRYkABSk3AGRZEdtA+vfi87liWBy2haHmaCqqHaQShyOpg4jU6Pt+WStJUjS82Xf1PotUzqx8rm2qsn9RUNmQWSZuM2CCX5danA527RZzn38C4HBlE6qk1tl/zpZ8KSDm8fN57UgEpm6Wqt3gsysp2n1NYOh0R3oR9VgdA7FCX9k4oenEDs5aD1Mhl/Jwo7snF1OZ8uTwpCcvybPiRRfrWoGLg2B6eOWV3QPqQGo4dVRJNoUOxH33q8Z/uD6+W0lD1be13q02PxQMbkielGCmTHHA64ok4dVuUH4D/hehiu8XEFOlT5PUpmaKmwQk7Ee00ekeCkKVus6M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZW5UUG5XTzRpTXk2UmhPUnF4bXBHdDE0VldKTFZWT0lpOXcyQmFBZkp2VzdO?=
 =?utf-8?B?QXFwbzBqbExJT2pIRkZCYTFYWkozQ0dqaVE3ckJqRCtjdzhtYkJKMnFyZko3?=
 =?utf-8?B?WkZTOWU4b3dvZ3RlZ2JUdDBKSnhESTVISXJwRVRZaCtCZ2FRKzdqSC85WWJx?=
 =?utf-8?B?MzY4VWZmYnk4L2F6eXljdnlYTWF6NnlFK2RSekZjbWo5UEFMUTlSdmp0VHlU?=
 =?utf-8?B?OVFTcy83NDR4KzZjOGJmd3JZRk90Vm5uTjlRYWFvNlpWeDZ6REdGbTFUK2Fr?=
 =?utf-8?B?Ny81YUt6RlRwajVGVjE0NVEyekxkWnV2WjlZR2p5NVNQenY5WEl5ZlorMnpO?=
 =?utf-8?B?SjdMS2pZSlBwajhheVRPdUlYL29adkpobUg5dndhV2NFSGRCT1VwQ2p4Y1Qz?=
 =?utf-8?B?V1JiZ1ZSNmdQNUZPSmRIL1VEMi9oYkkxaVh0TzZSVWMrdkQzTXNDblVBME1t?=
 =?utf-8?B?MERGa1lVUTdCVmFHYlRPUTM1M3hrdlFhUFd3c0pkd0s4YW5UamVrdzJFODZu?=
 =?utf-8?B?L3NkSURuU1RsZjl3SzIrV0QrNyt0eERldmdEREQycmtJU3JXZU9mUUl5QWti?=
 =?utf-8?B?bm5oVXNqQUI1Vk1zbEdadUN4a0tlY0xQbXRJWTdkTXYzaUw0dHM5V3E3Zito?=
 =?utf-8?B?YnhnamdKRFVIeG81S1p3NDZCVFVxZytLLzk2VE1vS2J3eXFIN3V4STM1M3hZ?=
 =?utf-8?B?azdUVXMyT0xXM3dlZUsrU0hYM1Ard3pJcFFhUVltMjVDbmNjdENtcndDWlMx?=
 =?utf-8?B?WWpCSjNhUnlYWUQ4M3lhQXpGditHRC8vVEZKRU9CQXFSTUtQMWlHMExWMk1S?=
 =?utf-8?B?dG05WVhFdExxTVN1allCL1R4UDMvSTlzTzlyTnF2V0RXcWpJRUxkY0FZTk10?=
 =?utf-8?B?WGFaUXR6aVVjZU8zSlRJR0R1d01xMG42dnhKQnBzNzh1dGtyY1N1TCtFcHZM?=
 =?utf-8?B?REJwbFNwbHBVOCswTkhNWk04aUZIMlBlVnU5QmxtaUZYc0ZGVHJ0UTV2RHkv?=
 =?utf-8?B?WmV3UlJidE1qVzJCMnE2TThkZUllZ1l4Q3VUNFRWL0dhbjQrY1FSNkdqWVVZ?=
 =?utf-8?B?N29ldEZzVkR5NjdMK2tnQkw2a0lMQnBEdUVGOER5SnYyU2huaXN1cklmUld3?=
 =?utf-8?B?U1lnemFEbm1jTUc4N0s2SG55eU91ZTVyZE01MWx2TXlaVkkwbzdCL1RTbzNj?=
 =?utf-8?B?bHlrWU5RdjFCWFZoNDdZKysxTWE2dFpsTi9zWlhQNmZZN01DVlVoclpUYVNx?=
 =?utf-8?B?NEljc1B6NHF3WEw3MzJHcjl0bHJDcHltSkJRQkZ3YU5JSGhtTndscjYxTTE3?=
 =?utf-8?B?TlBnbjh1bytYWUZpR3p2UXVTbTYxclNkME0xcU8wVXVKQUh6N1VNeDIwRFBq?=
 =?utf-8?B?bVRTU0V1M2RmcG5vb3hXTHo2SFZKRTlpNnJ1b0gyNFVSR1BWZlYxRy9sUlcr?=
 =?utf-8?B?T2FOWjl0OGRiNVVXWjZXYk5LaTN6dDFvVXd2T1BHdlg5U2ZGejRwekl6WTdl?=
 =?utf-8?B?MEVUSk9YczRraEhydXNBUFBHVmVSRFNUNVlxaUhaWjBmQmw3c2JYM0lRMDk5?=
 =?utf-8?B?UmlVUVZMdFJUSzBJQkdiekJZeUxac1JsWTJHM2o5RnZsa1U2MWFla1BLTys5?=
 =?utf-8?B?anFhUmVBRGNQZjZuMDdwclBnRjBYTEtWODFmZ1F6cHpZbDl4R21HNmJiemY4?=
 =?utf-8?B?b0RxRnE5K0pBdW1jTll3Z08rQVRMNjdSSmxiTEFMc0orajhrTmhwcTZnZU03?=
 =?utf-8?B?THJ6UXpmTEkwb0o5cWFLUzMrN01XU2UxdzA4SHI1b2JEVHFWWjFPbmpVSkRv?=
 =?utf-8?B?S3dtS05ETis3ZVlmdDRwODRvUWUydHVFaStBa1g3Z0dBaHh1V3Y1UHRKUXh1?=
 =?utf-8?B?b2t1TjJrT2ZuMk0yL0NVbS9lRC94V25xNGFEcmx5YU9TM2IwNUdWM0duMlhG?=
 =?utf-8?B?VXArUTdpQXpsRHFwYi9zeHNJZ0tjMEZTL0d4alY5eVI1SDJJaUx6VHlLSDBO?=
 =?utf-8?B?RUhKd09LeXk4K2ZEZzFJK2RicFh1Q1g5V0pkd3VmU1JtcU1LSUxOTG9GYUJr?=
 =?utf-8?B?b01MYlpWTW1FRVdlaGI1WDRYK01RdGFmNnNzTFRDSis2U21MZnlhaUE1RWcz?=
 =?utf-8?B?aXZyREQ3UUxPUHBqR2FnQlhUbCtZQUs5alk1Qnk2NTE5aVhyN3lLMkE4alcz?=
 =?utf-8?B?Y0xwb0VRZ0hpZ2hoRVdvaUtNaEIzTGFVOEl2NnhINUk0N2xlVjhKdDZPNUMv?=
 =?utf-8?B?aW43QkZGa1hlbmxoTmNJSWdEamhsWksweFVsRFg3WXpHSXdGYjdmRTZXRC8z?=
 =?utf-8?B?UmU0emJZN1hqbFk4WHYvY2V0N2swUEppamduVE1jenBHWmEwM3VWZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae77425-c642-461a-ef7e-08de7a037cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 15:34:13.2991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcpfxRjzMqkQzt0beilbPWT8pUJZcGw+LfogM8S77idxEAosAFWZhV1mGz0zaNPIq2mW7cppprt0WpQ4G/tNa53NSfRdka4jPtE5JFtdGLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10939
X-Rspamd-Queue-Id: 70645203CD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28781-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,renesas.com,kernel.org,glider.be,baylibre.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA0
IE1hcmNoIDIwMjYgMTU6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIHNwaTogZHQtYmlu
ZGluZ3M6IHJlbmVzYXMscnp2MmgtcnNwaTogRG9jdW1lbnQgUlovRzNFIFNvQyBzdXBwb3J0DQo+
IA0KPiBPbiAxOC8wMi8yMDI2IDA4OjUwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+
IE9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDA1OjIzOjQ3UE0gKzAxMDAsIFRvbW1hc28gTWVyY2lh
aSB3cm90ZToNCj4gPj4gRG9jdW1lbnQgdGhlIFJTUEkgY29udHJvbGxlciBvbiB0aGUgUmVuZXNh
cyBSWi9HM0UgU29DLiBUaGUgYmxvY2sgaXMNCj4gPj4gY29tcGF0aWJsZSB3aXRoIHRoZSBSU1BJ
IGltcGxlbWVudGF0aW9uIGZvdW5kIG9uIHRoZSBSWi9WMkgoUCkgZmFtaWx5Lg0KPiA+Pg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5y
ZW5lc2FzLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAtIFRoaXMgcGF0Y2ggZGVwZW5kIHVwIG9uIFsw
XQ0KPiA+PiAgLSBbMF0NCj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMTI4
MjE1MTMyLjEzNTMzODEtMi1jb3NtaW4tZ2FicmllbC50DQo+ID4+IGFuaXNsYXYueGFAcmVuZXNh
cy5jb20vDQo+ID4NCj4gPiBJIGFtIG5vdCBldmVuIGxvb2tpbmcgdGhlcmUsIHN0YXJ0IHJldmll
d2luZyBlYWNoIG90aGVyIHBhdGNoZXMsIHNvDQo+ID4geW91IHdvbid0IGJlIHNlbmRpbmcgRklY
RVMgaW5zdGVhZCBvZiByZXZpZXdzLg0KPiANCj4gWW91IGtpbmQgb2YgaWdub3JlZCB0aGUgcHJv
YmxlbSBhbmQgdGhlIG90aGVyIHBhdGNoIGdvdCBtZXJnZWQuDQoNCldlIHByZXBhcmVkIGEgcGF0
Y2ggdXBkYXRpbmcgdGhlIGRlc2NyaXB0aW9uIGFuZCBpdCBpcyB1bmRlciBpbnRlcm5hbCByZXZp
ZXc6DQoNClRoaXMgd2lsbCBjb3ZlciBhbnkgY29tYmluYXRpb25zLg0KDQogIGRlc2NyaXB0aW9u
Og0KICAgICAgTXVzdCBjb250YWluIHVuaXF1ZSByZWZlcmVuY2VzIHRvIERNQSBzcGVjaWZpZXJz
LCB3aXRoIGF0IGxlYXN0IG9uZQ0KICAgICAgZm9yIHRyYW5zbWlzc2lvbiBhbmQgb25lIGZvciBy
ZWNlcHRpb24uIEVhY2ggY2F0ZWdvcnkgbWF5IGluY2x1ZGUNCiAgICAgIG11bHRpcGxlIGVudHJp
ZXMsIGNvbnN0cmFpbmVkIG9ubHkgYnkgdGhlIHRvdGFsIG51bWJlciBvZiBETUFDcw0KICAgICAg
YXZhaWxhYmxlIG9uIHRoZSBTb0MuDQoNCkNoZWVycywNCkJpanUNCg0K

