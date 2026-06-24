Return-Path: <linux-renesas-soc+bounces-34390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sOPdEZCqO2okbAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:59:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EA6BD222
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:59:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=W5g3qL1m;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C5BD301627C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FECF3B71D5;
	Wed, 24 Jun 2026 09:59:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF33A0B13;
	Wed, 24 Jun 2026 09:59:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295164; cv=fail; b=bVAmDKBXYNdbjl87iGSb77Al61saKH8XDcfd7dRXT7INvaJvRLmzBvbYRLjuVHKzCwRaKqjtmPWqK1f9mKQEnvJsA+T7WUS42+DjVh8qqAgzBi31VUQR58StsLVbpmC/NyEOatKX8FCxZpFaa+sVPmE5Ytzhm7wdyAiVZsj0muE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295164; c=relaxed/simple;
	bh=0M/P8VUE0htd1GFWMysoYbqPTZ7K9C4+lBCvv9+r9MY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ogo36VR8VT3tIJs0nPZufElrToXjR5P8vzesRcTCC0CFy+4qUVVw7e8HNUzCAqI8TZx6MDRTntn/DH9qSVvpNInmTkKRDk3l9CRHgCpHr3ZT9dwdPVT8snH4Lrr7pyiyyWjwDotMV5u/0bj3BXw+R+HuY2LetJ6X9DeTB7hvUOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W5g3qL1m; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwdPnV016O4tWpR1OsW5lHFHgmMvOOYOKmzes4DHKcHhiJUi6KYB2m6lZLyzWCpRPpKzgqGrlz/corfxuMfdHiYNiH9WxOV1wreMyvN0dS7Mc4fFS2eBJMTKhWJnna+ygorE6SXuQcnaAeFFMwxwYsfsC06dSOMxOAab8NpzXJEvwG0x9Gz/Pi1gcKWcQFQ8kMeXWoyA70VEgxYsOHGrQyWpNzsCF+aDaXa/XTIkrbofx7TI8XmdZSHiBDj7/nMZeeoKlNQwaNn3XU+nB9Ly6OD1j9gLkbrvxyk/+9vP8lOYdZctogxAavcKajoleWJQpCaWQjWYC/wvLl8YwZrb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M/P8VUE0htd1GFWMysoYbqPTZ7K9C4+lBCvv9+r9MY=;
 b=ew0gLVdFTPG61JPlucEhaZfJCZl840G4ygdZ8GMxBqKYTwCkONNwsi1OAN89j+icffzUggXBBau5oDPETh8OoL/Ll63nO/S4AA3G8hQneuGjTGMBu9k8RIQn7wCXl/NbNHHwee5Hz+U4GFEb+IRVvRjkwTTesdKA2Pa7tqXUWaQ1AbLLyV54Vb4q+ie9LL6sBR+GJbpCws0LfZewWmSWySF3K+Ch3jCSyZK43SxI1CZb+rSf8X3Cp5niaPogaWniaFbBWdRXcn01EAwXWhsHGx4tUamRR29d8iu1OR6TCyD1kqfBMMPfofID3xHvBygPlQNLk4GyBVeIdoC4OPEUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M/P8VUE0htd1GFWMysoYbqPTZ7K9C4+lBCvv9+r9MY=;
 b=W5g3qL1mnOw4bzHB0NI238d7PiwiUI8IbD5XrYLw0lc7QRtuVrbU4B1no0+RtRgXN3nhk0lmIrw5by9j6DRW6R8zD5zKjjwhMEfdO4s6pzlMIrQSt1YfFL3xlpFLDgYFqLCGpntlaoaKLadrCpC6OcUYYTrd2guce0PKC2MKqU0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11026.jpnprd01.prod.outlook.com (2603:1096:400:3a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 09:59:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 09:59:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Alex Helms
	<alexander.helms.jy@renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Brian Masney
	<bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Topic: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Index: AQHdAyw/4ueLfPD53keQC6SpXGUnQbZNdPEAgAABB+CAAAHdgIAAAMkw
Date: Wed, 24 Jun 2026 09:59:19 +0000
Message-ID:
 <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll>
 <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org>
In-Reply-To: <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11026:EE_
x-ms-office365-filtering-correlation-id: e7a5627d-549d-4ef0-ef4c-08ded1d74259
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|4143699003|22082099003|11063799006|56012099006|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 zlt3id6Kgfo7VbMIXyescUF2N+FUSiqhWjFuz1GQ3Y7UA8ndztIjYdkUvjMmDwMaBg51FOGGyds5l9cXH/c9vEGqi++Q4rhWa32lA8kNLCTcs0hlKzt9kWF3nzASFRu+g2a1MCV+bBvK7+2M7lC8YxjG8w5hYUM88J2N9plk2mw0Y4KMv2bAs5hMneDptd3l67e8jcO34f9BNS9084Y1ZvbNoxq5W7zaCPK8w1zDFW9fOmasZekXR2ai4hOgnyaFTQp3ZNqBndzLXLdWzyweZyysbx9cvWThu0nLqAapxpGrsBQlXnNCo+1Mhbk/MehqSDSHLB6kFhufoLFgqHQFdnHabBBhYfY/vHHYTWZVRwg4CpDQGONZK1iQfd9/cUHtuvJgLARm3fXhMFcpbjOIKEecph9DRhLimR0aE/r1qe8ugJwyLWKbzhSlfE+qzcIha+dI3gnP8zdJLt7Z6gwT9I7rmxeqrVpJTXQU41TuaeYSIVTllPcu8r3qQOIVyhpooh1POn1SqpVqMFNoKNThtFvG6rH5YR9lWfdz5q9CKDDh64sZbtmBYdnoU16kqp5P6XmLOzuUxY16tQQus8ckkC2Fwa5dlBIX9JsblSry0mYgDOV8OG45SKixYBj/eHNHjA2ENliTc26+C1MiOTr+vgJsUcJ81/P6dG9k9hpsGPYb7uilsJp8HH2pL5cH+b2yWVXxkdcGoJdkxTSTqftL2sEwSkFcAOE1QD7sZJkIIdQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(4143699003)(22082099003)(11063799006)(56012099006)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TStkWWpWdnlDN2lwa3BPUUVOOWFGRGEvU2VDSW45TUZKMC9FQXpGUG1nVU1h?=
 =?utf-8?B?ZFFFTFBtbVFHTTkwdENLTi9rc3oxYnJUbW9ZUzNpNkRnSXBtQVhOd1I1V3ls?=
 =?utf-8?B?Ym02dFVXc2g5Z1dKeGhYcEdJLzVXRWc5ZnY3eE1obVY5cmdLUU8xR083TGRK?=
 =?utf-8?B?bzdHbjhVc1ZQeHlrb2Irakl3S3R1bERNT084WXQyd3R2b0lKMjJYb0VQN2w5?=
 =?utf-8?B?eHY4OCtsLzVNVGJEakhVSEFJY2ZQRndZRWxzV3FHSERoY0RPZUFJNlcyTWcw?=
 =?utf-8?B?U2NjUnhIdU5rVnk4cXJUSmtKdUpVbFFjS21Jc2NsUE94QldybTVpTloxVGhj?=
 =?utf-8?B?YXloTnIwQTl3c3NPQm5sMDF3YXVHcnZNTzVrdGhGWHo2RDkvYlZ3V3dhLzFB?=
 =?utf-8?B?YUhZYVpTNGtNcml0ZEpCTFBPU0RFTFVlODFOYmhya2VNb1JEWGVSSFBJKytm?=
 =?utf-8?B?MW5PNjB3L3BkUEU5TFJkS1VJQU5aVTcvSVdmVTRJS2IzV0FaSUViQ1JtNjRR?=
 =?utf-8?B?UEFjakpuNUxuVjJ2QXNyNmFuS3Jzc2FiTXl3eHhaU3k1ZjQ0a2FtZWNaWkNB?=
 =?utf-8?B?cjVMdUhsVDlvR0lyMXZGTndGNWVMaEJyTFp6R042SXdadHZWWWtqeUlTZ2ww?=
 =?utf-8?B?Y3BEQVVubnFkazlRYXlycHl3cnc1VVYxcldYeSt0OURXUklPSVpZOHJoZ0Vj?=
 =?utf-8?B?STlFSkl3cjBvWEpuOFF2V3FjQmtNblBBMlVRN3liWTF2dDNkQ2tpK3h2S3V0?=
 =?utf-8?B?bjN1Z3cyaEVsYkhxWCtqcDV0WGlXOUNnTzlmZExsWnJtNkRXWTFQeTNvRXF4?=
 =?utf-8?B?UDJTZE05OUJnUmxCako4MW45TE9DWjRoQWNLdlhlQ2hsaGljQ2p1bTBubDNt?=
 =?utf-8?B?bVZyL0htSlpNYkZjVFRNb3FzVkRNWTJ5YUp4eU5XaWhwVjNIbWNkQ3BNNFZ2?=
 =?utf-8?B?M3VTd2UvNDdlSllzRnJwVTkvaVNXV3R6L0s2emZTVW04RHd1QlMzUzBOcW5E?=
 =?utf-8?B?UUd0b0pQbTk1NHRvSDJ6OElYOEU5QjZMNXpiQ0wxWmJjUmR1R05DNXlpY0hk?=
 =?utf-8?B?bUhzb2kxTHEwdDZhMDZYS3ZsMWtGbG03djRNWHdRSWY0SUxSS2pEeHBwa0Zz?=
 =?utf-8?B?b2V6SEQ0ZTYyRmxWdnorN2VWcTVmMnUxd0xicThtQzE4YXRBTkt6THNTOTQ0?=
 =?utf-8?B?ZGx6ZUNzUG5WZ01PMDI5MjQ5MDNRKzhJTDZQRm5JMkE5QkFFc0JPUmtzcXgv?=
 =?utf-8?B?YzFnL2pidkx6NFJ3d1Fqa2tiMXk4NEI4MmQzL2hzODRLdmdLVzBmakRvNTFD?=
 =?utf-8?B?SDcvOHdKY2ZtUkcveTFxSjhUVHB5S1ZIYjdJbjlRLytlTWpTemRuNkZIS3I0?=
 =?utf-8?B?UU56Q2dLR3AxRnlBQVlQSDErTjBBczhpUzhwZTZWeFZyNFFxd1NyZW9CeW1o?=
 =?utf-8?B?N2dkM283SG10MXBpRU90M3VsSU9hc0ZsM1RDa2preUx2MFZiTEpDMkN3cVo4?=
 =?utf-8?B?eGdQS0F6UTRvSFkxTi84WWdEMTIrclc3WkRiamhrQWY4RGFlQ00yclljdFdV?=
 =?utf-8?B?ek5HNExkQ0htaFk4emlqQkRQeUxjQ042Tkx4MmFLNmg0L1B0c05MYUtHTTN0?=
 =?utf-8?B?VU1BbzZaT2lkUFFGN3VwVHVyR1RTZXRGMzdLSVljcWpnNUdwTzNwRHlQN241?=
 =?utf-8?B?L1BQbTY2OEdZOUpiMjV4QkVaQloxZGVGQnJMZUt6VGRFd2d5ZWhwRmtiMkdF?=
 =?utf-8?B?WVEwZ1laRWxHOHkxZUh6STBlRlhnZXVNT3l3dlNrM0FXaWJjdWRLamNEVzZ5?=
 =?utf-8?B?QlU1V3hQRE90TUpZWmkwclFGdU44eE9PamZDYlRqaWU2MHBueU1oVDlaNlBP?=
 =?utf-8?B?RytjdjNaRkRYWDJzT3RKa3JiY1FWUlkzRGgwR2MrUXl0T3krMit5UkJrTnl0?=
 =?utf-8?B?eXhSMW9Ra010RWtHOG9HQTUwQkQ4Tmg5YXZ1WlVaL0owMXVMWHdFR0hYN1pK?=
 =?utf-8?B?ZDlFdVdXbGRIYmU1WGMrRmVuV3lyY3cvWDdlUG41WElNYytSQU51Y3ZZQXNw?=
 =?utf-8?B?VC9JdGxFeG9lSXM4Y2hVcjdONnZwQ1QyVndvenV6dGYzQU44c256NHA1UHIy?=
 =?utf-8?B?TExkbmNseDV1NTRiSlY3UWdpMkUzT1BRakRCWHdmTlh6MnU5UTNQUHVjNmFu?=
 =?utf-8?B?cEZ4dUpyKzJvMFZSMW10OUo0aXRMbENzOE1YV05FaklTNCtvM09naVNxOG4y?=
 =?utf-8?B?UmJLQ1ZIRGxZYlhCZmp4bWJaU29oS3BTbmZLa2xwT0dDRklHS01FNEVadUwz?=
 =?utf-8?B?WkJCZkdQVWtQZ2pnNWdUM3o3NWREOGVrL2ZQSDNEdmhiVC9JNXgvdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a5627d-549d-4ef0-ef4c-08ded1d74259
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 09:59:19.4251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcaUBdah/fSu88C3jZqdca3hM42l5BXvDp4+kafyaAdJf1H1ESmDJSpWIzW1oh9gM0NMY0I4m/rdKkHPJNWBnwwLMrlZIYTGLWmuWV3r1jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34390-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,renesas.com,baylibre.com,kernel.org,gmail.com,redhat.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD6EA6BD222

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEp1bmUgMjAyNiAxMDo1Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogY2xv
Y2s6IHJlbmVzYXMsdmVyc2FjbG9jazc6IFVwZGF0ZSBtYWludGFpbmVyDQo+IA0KPiBPbiAyNC8w
Ni8yMDI2IDExOjQ2LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tp
LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMjQgSnVuZSAyMDI2
IDEwOjQyDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBjbG9jazogcmVu
ZXNhcyx2ZXJzYWNsb2NrNzogVXBkYXRlDQo+ID4+IG1haW50YWluZXINCj4gPj4NCj4gPj4gT24g
VHVlLCBKdW4gMjMsIDIwMjYgYXQgMDU6MjA6MzdQTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPj4+
IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+DQo+ID4+
PiBBbGV4J3MgZW1haWwgaXMgYm91bmNpbmcuIFVwZGF0ZSB0aGUgbWFpbnRhaW5lcnMgbGlzdCB3
aXRoIG15DQo+ID4+PiBjb250YWN0IGRldGFpbHMgdG8gdGFrZSBvdmVyIHRoZSBzY2hlbWEgbWFp
bnRlbmFuY2UuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiBSZWYgWzFdDQo+ID4+PiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2FqcVdldm9mRUozZnY4NTZAcmVkaGF0LmNvbS8N
Cj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMs
dmVyc2FjbG9jazcueWFtbCAgICAgICAgICB8IDIgKy0NCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4gUGxlYXNlIGFsc28gdXBk
YXRlIE1BSU5UQUlORVJTIGZpbGUuDQo+ID4NCj4gPiBJdCBpcyB0YWtlbiBjYXJlIGluIFsxXQ0K
PiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTXVITWRXMC1X
c1p1dWM3UG9WTkM1REJVb1k5ZFArVUxtR1RRNzZWVw0KPiA+IE1PX1NqcGJ1UUBtYWlsLmdtYWls
LmNvbS8NCj4gDQo+IEp1c3Qgc3F1YXNoIHRoZW0gdG9nZXRoZXIuDQo+IA0KPiBXaGVuIHlvdSBm
aXggc3VjaCBpc3N1ZSBsaWtlIHdyb25nIGVtYWlsLCBmaXggaXQgZXZlcnl3aGVyZSwgbm90IGp1
c3Qgb25lLWJ5LW9uZSB3aGVyZSB0aGUgbWFpbnRhaW5lcnMNCj4gbmVlZCB0byBwb2tlIHlvdSB0
byBmaXggaW4gb3RoZXIgcGxhY2VzIGFzIHdlbGwuIEl0IGlzIGdlbmVyaWMgcnVsZSBmb3IgYnVn
cyBhcyB3ZWxsLiBUaGUgd3JvbmcgZW1haWwNCj4gYWRkcmVzcyBpcyB0aGUgbW9zdCBvYnZpb3Vz
IGV4YW1wbGUgaGVyZSwgYmVjYXVzZSBpdCBpcyBhbHNvIGV4dHJlbWVseSBlYXN5LiBKdXN0IHVz
ZSBnaXQgZ3JlcC4NCg0KT2ssIGJ1dCBib3RoIHBhdGNoZXMgd2VyZSBhbHJlYWR5IHF1ZXVlZCBi
eSBHZWVydCBmb3IgNy4zLg0KDQpUaGUgTUFJTlRBSU5FUlMgZmlsZSBwYXRjaCBpcyA5IG1vbnRo
cyBvbGQgcGF0Y2guDQoNCkNoZWVycywNCkJpanUNCg==

