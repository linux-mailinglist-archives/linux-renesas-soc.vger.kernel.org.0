Return-Path: <linux-renesas-soc+bounces-27874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LPjHdYig2nWhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:43:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA068E4B67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E55F3006784
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF603E8C52;
	Wed,  4 Feb 2026 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hhJsNpYb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9543B52EE;
	Wed,  4 Feb 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201685; cv=fail; b=Gbu1eI/n0cBHk33ssUA/UeBydSmCsi4ZsmkiyiJejDr9Uf8QdAnmugLxKaHI91jsg8DCrlfQZuh2m34kd3AuSS84zM8EJHHTWtRjWFCC9iXOZVX9iikFu32xqG+pzYBH1Ac6D4VUX/LGk3EvtFJe2kanwwZJkoP2hXavAx0l4CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201685; c=relaxed/simple;
	bh=15H2ZLh6n1hPgexBTjSZ9uVG2jaQ9PXhpp1SafS89OU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=notRC9Y3GuTP3yV4B7Med1N3uQ7ZnZR1yJAgey1tYSKYImNsmemI5wTKU4s21Gau9WnHChaS37hf/gWF6E4cESjZ/DINq/96efrUPyd0UFSsuSdc5fzxzmbRCQ1PcSHKgoql4ZQy01AT8CyGKghjkxbb0IyNU284YWE3cWs17mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hhJsNpYb; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGQUPaQh6jfSspKACjWUzxBwsA5UfeuldXcYmoxKi3I+Wh3cplHCxeTwrSfvsL4Hk1oBOHPle8g9ARMPuiphXxsxCiDT1BttY+QJB+kGdAC8VlG6zQeAVkQ18Zn1M+5+bz6bxKmG1VQxPVjBMyEor7qn04yG5FyljWJJoxIjVRfmYj0oPTXBIZQsCEv3NDUO0J5ooQuheCM8TxFYyOm1h2cjwZrp/0uHO3SaRGRmdyvMNLLu0RZDoxnJFYMeOZwb/TGHyojyomPq/ql2TsLVObRfPhMvd9+3r8SPkilK71K4kr7rPpOEenpokkDvnx1o11FXWURlgkIyzIT6i0gDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15H2ZLh6n1hPgexBTjSZ9uVG2jaQ9PXhpp1SafS89OU=;
 b=fqDBW+/A0L8MqWU/1M1w/Ps0l7jcwrEaUdP12Xioq6L+aVYGqIU/YWldzTwsysOlHB2CVfAQ8MlW/GlpfqCHu69h97WtZ+/xIigEsJ+4l7BjD4nESWQ7BWcXSIS09wrVqSzNoOT02AQhIJVE1zNyv4sTzM6Qu4alyY/vo1ee/KNMby0BtzwQRaaqjELGNkMjBdxw+MnfKX8cF8bpolei3uP7JooJkbOslhoCqIq8cn33Kg3TFFkyG3HsDleIzSmQfg4apLkbVTk79cYivMExEihst+39pBzlUV5Eut4eFqDMupMy36Bh/HFDy2hwxNcRuce8rYuE9SSpi1HzXoU4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15H2ZLh6n1hPgexBTjSZ9uVG2jaQ9PXhpp1SafS89OU=;
 b=hhJsNpYbKQaQiWQmhff2g7Z+Dx1d9lgszZiAh60lvlbmvlrlAlHw9sI8nAct3RVMOkzJPYWcnj+hp69XrDSguRQ1t5N1D+AaJBEWxK59eogwhaR0VAO95mblMsFzLyncwPKJmWYC/KSgLbwhOCTBTyN+HxBhmvnZdCkO0fi8mec=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17221.jpnprd01.prod.outlook.com (2603:1096:405:339::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 10:41:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 10:41:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Topic: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Index: AQHclWNsQepXURhRS0aTtfgvJAtpW7VyFyQwgAA9qICAAAEloIAAAjsAgAABdKA=
Date: Wed, 4 Feb 2026 10:41:22 +0000
Message-ID:
 <TY3PR01MB11346E1CF9827B7C76B20ACEC8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
 <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uYBYM-VnUXQA3YwEMn1NzWLMkeGYgmW2jb8oo30aPvcQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uYBYM-VnUXQA3YwEMn1NzWLMkeGYgmW2jb8oo30aPvcQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17221:EE_
x-ms-office365-filtering-correlation-id: bf82fd6d-9787-41f9-335c-08de63d9f026
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWpzL2pTamxmd2RXTVA5N3BsdUNnQlFyOUxONlhDTDNPRXFuT2MvNU1BbUVy?=
 =?utf-8?B?MWhtU1ZrRncrNWpZTm5DaVlzNHpBeUxXZHpDYlRweXZsclRVdWEvTTBFZElG?=
 =?utf-8?B?QlpWTlF2UHVqR0c4bU5xanA0NWxmUUVIUDhrSlNTQ2E3OTBDYktYQnJ0RTc2?=
 =?utf-8?B?YVJ2NTBtLzljcmNMak9mem9RM1Npa1BlbSsxV3FRRndOYkU5UWNHVjVJa3JD?=
 =?utf-8?B?K0VzYnZWM3RjSWpGRmhjWmp1Zi9wZlkzcmlJRnlKTldSVVZaZnkvUXpSWG0x?=
 =?utf-8?B?dk4zcDc0YkNsUndZWEE2d2NWZFpOWERidjdCN3JXKzdsVHdaUWp6VXo1VWlB?=
 =?utf-8?B?OEpZbDQyK0wwSmZ6TUgzTDBUWVNDalEvSUVmQVJtaEh2d2FkcVY5cmZ2WXlq?=
 =?utf-8?B?WWdIUEQzK0MrdHk4QThkUTJ4TlVWYzJDd09STVZ6SmEydU13eWU3U3lSRDgv?=
 =?utf-8?B?TkpVNm93cTF2aFdyTlVjSFRZTzJNUGE2Qm9xVnE0OXNwbTJQY3NhdHFpSXBL?=
 =?utf-8?B?b0VjZWc4SVQ1ZTkrZWw2UEdNVHZHMThqU1BtODAxQ2cwMHl6MnZkcTUxalZX?=
 =?utf-8?B?djBKS0xGMU1kQzZUSC85NFpheVR1MW9CNjB1VUFHT3pIRXA0a0FzbkhvN3hl?=
 =?utf-8?B?L1p4Y2UwTTRsaEdPeEk0UTh3YW1jUVBKOGt2RDFwZFREMS90dUpjNDE2Vjhs?=
 =?utf-8?B?TloybExUakRzSUdPUHRNcnVPUUxWbExidzc0SGNBcmhJN0V2SUc3RkdJOUlq?=
 =?utf-8?B?cTdpcWJZR2tDQ3ZTb0NKMXFtZlVicmNpTFJDWXU3QXJqVVc0WnFkYWdydmRv?=
 =?utf-8?B?eE9UdEl0aitQQWpkVHQwVS9jVTZSMkNTRzcyNjFFK1o3ZzlKQ3dzV0VsUFhL?=
 =?utf-8?B?MnI5NFRHVDhKc25zenBPVENoZzFaQUJ6RS9OVXhJNkNGYzZjZ2tnR2o5TXlz?=
 =?utf-8?B?VmtNYWswZ2xuNG1RSERURnNGYm1TajFzaHQ5YmVmbXIwSEh1YkNLUHY3bjZn?=
 =?utf-8?B?S2s0clRveE9WaW5SanB3am05ZlhkZDRJczhXbzFYT3AzYzhNMnBtaW1vMWo4?=
 =?utf-8?B?SkMyUFpuVldVeGs0cW84Sk0vL1M4YTdEbTVibkJrMEdCUEdpVnBicExLdmJV?=
 =?utf-8?B?YjByaDBJOVhpaVV0VE91cW1FOU41VXFOS2s3ZDZyM1JLeDlpbUdpSzRweG5B?=
 =?utf-8?B?aTdjckhEOWdkWk5EeHJLK1FHTXFvK0hUYlhvWnRLRitwZThhcSswenpzT3ds?=
 =?utf-8?B?aVBSMWRqT05ZSlBCdEkvM2MyWWN3RWFnTmFhbTgxYVZzVjJKeHZqR1JUZGFW?=
 =?utf-8?B?V3IyL1Yzb2ZVeGxvSzNnUml4MHhxdjE4TVZKczEwcjZ4RHUrTFdqRkhpckpM?=
 =?utf-8?B?L2VqNytRT0N3QVMxaHBCTVNQS3VrNHBod1h1dVlxZDdqK2tWYjJmYlp5SU9W?=
 =?utf-8?B?RlRqSStBRmwwODVqRk52ZWFJck00Z2lGUzhRQkpreUt1SmFrTExYY3BQVzZw?=
 =?utf-8?B?cGFDR1J2cFA2MlJrVlZHdS9UK2NRQXhVVmJLUTA5eUJUT1p2SFpSRG1SVkFL?=
 =?utf-8?B?Sm55VjBrMEUxRk5CZ21kZkdxWmNEZWpMNWdteWhFQkY3Tmt0UERtVll1ZHRS?=
 =?utf-8?B?OXNUZ3lNTVJGQkxqQWRpeTVhNENwSW1NamE2UUJWRmRyNUNtVUxEd1cvZVBK?=
 =?utf-8?B?VU5Cc2VNR2dYd0JuV2FmcldHV3lzd0FPMUhhcCs3bUZUSmdPOGo3SG1xNHYw?=
 =?utf-8?B?dVpiTWVNZGFHQkViQjVhZ0pEQmxtSVVmbmNNSll1d3FnaHBCa2V4RHRka1BD?=
 =?utf-8?B?QzFUOUU2SmtmQk1PaW1IeDFjVlRSOUE4RFhKR3BqT1ZuRkZlazlCOVBvWjhK?=
 =?utf-8?B?OGtOWnRmVDl5TlhMUVJSOHYybWE1NTNzQjRxYXBvbmRsMTNUZDFxUFA4WS8v?=
 =?utf-8?B?NDNLdU5xb25QR3RubUJXU3lvVzVzd3ZRdDczMzRXellNUmRlN0NzNUdQNGJh?=
 =?utf-8?B?VzB5dUVhTWRheVBFOHZpU1NFUDVGLzdqcjhBVWVwcmdCVklEZjRVVmYxZ0Jz?=
 =?utf-8?B?NEJxYjNiQnJOeDNYa2ZuenI5ZWoyc3JXMmJ5b1IxNTBHVWdGOVBWU2xRYkdy?=
 =?utf-8?B?bzBTalJNbzdtTzg3M0gvcjBvSTlweGpZblZCN2pZZG93SGU2c2loVEs2YzJu?=
 =?utf-8?Q?60268ELswQOpjdEw6IGsDzY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzVNd1dlMHNTY2w1QXZkZVo5UGsxYkJBQ1M0YmZYUW9TN1dXQXpEbmdwMDYx?=
 =?utf-8?B?VGZFZGJpcmx1aGZZUGQ2TlFPT0h1NHV0akhKYTFBSFlLNlhRWUEvNzkyczht?=
 =?utf-8?B?M1FDeC9KZXFaTTJOQkNlRm9Vb2FkdDNJRVJ2L3RvczdXNVc0VzJuQnZpQ2tU?=
 =?utf-8?B?RHBwZGMwM2pJdWU3TVdwYWFNQUg1dTVnRjluQ0lWOWlUYTZudEhoZ2VjK3pj?=
 =?utf-8?B?M0RCdUlEK2lNZUNqaGVzYVhEcFhkejlneE5yS1lNVy9kSUE3Y09IL1lwZXpl?=
 =?utf-8?B?Z1pRVGNub0N5L2FMeHJzTmRXZWFUKzZPczh1cVpZaDQ4RGd4UDdaQ050bjZr?=
 =?utf-8?B?SDlSUzlTOWc5aXNvakQxKy9Dcmd1WlpUejZCSDl1VWdaY2VLVWdLaEpodjk0?=
 =?utf-8?B?aGdLRUdNY3FKc3VOdnYzM0R1S09HdzY0QjdvMStQRzlBUEk2RmJhTVB5QUxU?=
 =?utf-8?B?SmtHbFA1M2k4NzdPRnF4Q3ZVdDRvcUYxODg4eGs5YXdGaDhqWlNwREpCS0Mr?=
 =?utf-8?B?eDNhb2c3aDJySHQwaStHQkt1UkhobWd1dUVtZmI5a2Z1ZFM3cHF0alZ0ck1J?=
 =?utf-8?B?NFJkNkR5Nk5PVllBQWdQYkU0MFVXWTB2WmNheWp3S3ZTWVprQnpERXJkQXp3?=
 =?utf-8?B?RkM2d1RiM0IyczQvcnI4aUd3Q1hxdHh0aTAzbEV6TVIwTFMyUDVGZUE3bnVU?=
 =?utf-8?B?a0tVS2tiREZLREF2dTlIVzJqQ3l4c2w1Z0tRemdmMisrVUQ3ZFg1c2JrWmJG?=
 =?utf-8?B?dWlObXVWbStVRHhibDJSWUlNcUVBWHVMZUlVVFA0Sys3UE1ncWxYT2pCSjBB?=
 =?utf-8?B?YWl4T2pjbVcwZUVrc25xdVk4YnRHTTUwcWpCd2Q0VmxhTXpSTlZDaXVGUXpR?=
 =?utf-8?B?azBjUGZHd3llNElSeHBLdk9PNUlCU1ZOeUVCMHF0Kzd1d3RWOW4rcEZWaU9C?=
 =?utf-8?B?R3UxMjkzQ2hrZk1hcnBWTFhXRVI0TWd1TlN2TEczUWsrRXB0T2tPMGp0S1gy?=
 =?utf-8?B?aUlSakhDd1BsaDBEUUdKNTJkNlhoOEhiei9OT0JMWlM2OHVyS0ZXVHY2aGZH?=
 =?utf-8?B?OVo2MTBTMGlJcEFGc09kYkszTUdQcW1zRmwrZzgzSzVpbXM0a0ZNb1RGUEQx?=
 =?utf-8?B?M2RJYlk4MnhRNk41THVOTTk2b0g2cXBPR2VwSlg2VWdZOWozNDNsZzN0L0Ny?=
 =?utf-8?B?L2VHWDVubzJHVVJpS3dzV2taNkZsdlpRck55QWk5bG1YRnAra2gzbDJZcmZ2?=
 =?utf-8?B?S1RiSEdrVHhQUUhsSGZQUzhCYnZrZFhGaGE0RUJoSHlaa1hEN2JMVUhTYlNR?=
 =?utf-8?B?c0NQdStFSlc0VHo2RGp1S2hxYk94M25FMkxwL25GTzRma1RGdXlFSlBtYktl?=
 =?utf-8?B?aG1uU2laUGV1NUZrV3REVVFVVzJxZTZnR2h3UXlIWXEzWmZWeE5xYTBBenJa?=
 =?utf-8?B?RDN6SEYrWURNT095R09PNjg5L04wcmpVRnR0L0NmazNXWTJPb0VPdk8wTEwr?=
 =?utf-8?B?QnZZeTJMQUNnMThyYkhKMGRTb2FKR2grWFA2VlNHZ2N4NjBtaE1WaVlkdkNk?=
 =?utf-8?B?cjVxcnNiSlgzSHpTTFErVnZOUXlGUmRHeU5oMVJKazR5dXJtS0t2dS9TcklJ?=
 =?utf-8?B?akhTbWlWWk84Z09SVHF0Mm96TWJwSy90ODBXQU41cktDZWxiT0lTTHlpR2Jr?=
 =?utf-8?B?WStYMi9hTjE1UllUYlNBZzhiUDZzZEZOTWord0p5a0hBQUc3Q2p1VkxxUnNO?=
 =?utf-8?B?WnpVTHdoWTJZdllBZW81WXFKdFRvZEhQVll4Z0prS1ZkMGpDQVlrVE1UWUxP?=
 =?utf-8?B?dnJsN05CUElZWU9VMlVMQVRFRDUweWFKd1FJMjYxTDJraktodm9QVEVtN3U3?=
 =?utf-8?B?aFJpNUlzUXpYNE9ZWDdZeVF6VXZwZEtMLzdBeDhKeTBIY3N0bW0rTm9tV2kv?=
 =?utf-8?B?cFNhL0ZtcHRablVtcmtBL0tZUlY0SFJ4S3Z0S0dxa3BTR2ZGTEozRDFjaGdv?=
 =?utf-8?B?UWYzL29VckQydzBPOXBZTkFNaHlEenllVnpBeGU2bHFTZGFseDlxSFlpNFEv?=
 =?utf-8?B?Zzk4R28zVjcvN1pYOGhqQWhDK1BxUGFPalFVZVBUSGlGYmN5d082cUt6OXRV?=
 =?utf-8?B?S3E1a25XTmRzRS92ZkF3ckQxM0ZvRW5OVnA4WUFtanBmS1NuZlhlZnNhNGNl?=
 =?utf-8?B?OC9tVzgzSWJYUkZnMHFxTHFQTHVidUJOaW1nVy9ycWZrM0U1TzIzWEVwZnBL?=
 =?utf-8?B?ZTEvSFlxdDM3RWI5QU10OXBqK3c3c05HTzYybklvc1BlcHhHb29hWGpTTFBW?=
 =?utf-8?B?U1UrQUFQVGRkZThoRUJDWWRPREhlTXc4SjlQM0JUa1gyYUhTOWtPUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bf82fd6d-9787-41f9-335c-08de63d9f026
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 10:41:22.1003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hJtd3SR1FDU5IhwAgl2E9rr+3yfE8YVYDZpd8+k3KbYyqoRSmeeUL9eakYeO5bNW9O0hkwaFpDGj1ECUmgN4u0/ZFSDVFbI+VEc056gTdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27874-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,bp.renesas.com:dkim,glider.be:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: CA068E4B67
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDQgRmVi
cnVhcnkgMjAyNiAxMDozMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNl0gaXJxY2hpcC9y
ZW5lc2FzLXJ6djJoOiBNYWtlIElSUSB0eXBlIGhhbmRsaW5nIHJhbmdlLWF3YXJlDQo+IA0KPiBP
biBXZWQsIEZlYiA0LCAyMDI2IGF0IDEwOjI14oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4NCj4gPiA+IFNlbnQ6IDA0IEZlYnJ1YXJ5IDIwMjYgMTA6MjANCj4gPiA+IFRvOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBDYzogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsDQo+ID4gPiA8cC56YWJlbEBwZW5ndXRy
b25peC5kZT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA+ID4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47DQo+ID4gPiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0gcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+ID4gRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+
OyBQcmFiaGFrYXIgTWFoYWRldg0KPiA+ID4gTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNl0gaXJxY2hp
cC9yZW5lc2FzLXJ6djJoOiBNYWtlIElSUSB0eXBlDQo+ID4gPiBoYW5kbGluZyByYW5nZS1hd2Fy
ZQ0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBGZWIgNCwgMjAy
NiBhdCA2OjUy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkgUHJhYmhha2FyLA0KPiA+ID4gPg0KPiA+ID4gPiBUaGFu
a3MgZm9yIHRoZSBwYXRjaC4NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFp
bC5jb20+DQo+ID4gPiA+ID4gU2VudDogMDMgRmVicnVhcnkgMjAyNiAyMzoxOA0KPiA+ID4gPiA+
IFN1YmplY3Q6IFtQQVRDSCB2MiA0LzZdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogTWFrZSBJUlEg
dHlwZQ0KPiA+ID4gPiA+IGhhbmRsaW5nIHJhbmdlLWF3YXJlDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBSZWZpbmUgSVJRIHR5cGUgaGFuZGxpbmcgdG8g
ZXhwbGljaXRseSBib3VuZCBJUlEgYW5kIFRJTlQgcmFuZ2VzDQo+ID4gPiA+ID4gYW5kIGRpc3Bh
dGNoIGJhc2VkIG9uIHRoZSBoYXJkd2FyZSBJUlEgbnVtYmVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gVGhpcyByZXN0cnVjdHVyZXMgdGhlIGxvZ2ljIHRvIGNsZWFybHkgc2VwYXJhdGUgTk1JLCBJ
UlEsIGFuZA0KPiA+ID4gPiA+IFRJTlQgaGFuZGxpbmcgYW5kIGVuc3VyZXMgb3V0LW9mLXJhbmdl
IGludGVycnVwdHMgYXJlIGlnbm9yZWQNCj4gPiA+ID4gPiBzYWZlbHkuIFRoZSBjaGFuZ2UgcHJl
cGFyZXMgdGhlIGRyaXZlciBmb3IgYWRkaW5nIENBNTUNCj4gPiA+ID4gPiBpbnRlcnJ1cHRzIGlu
dG8gdGhlIElSUSBoaWVyYXJjaHkgZG9tYWluIGJ5IG1ha2luZyB0aGUNCj4gPiA+IGludGVycnVw
dCBjbGFzc2lmaWNhdGlvbiBleHBsaWNpdCBhbmQgZXh0ZW5zaWJsZS4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+
IHYxLT52MjoNCj4gPiA+ID4gPiAtIE5ldyBwYXRjaC4NCj4gPiA+ID4gPiAtLS0NCj4gPHNuaXA+
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAgICBpZiAocmV0KQ0KPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiA+ID4gPiBAQCAtNTA3LDExICs1MjgsMTEgQEAgc3RhdGlj
IGludCByenYyaF9pY3VfYWxsb2Moc3RydWN0DQo+ID4gPiA+ID4gaXJxX2RvbWFpbiAqZG9tYWlu
LCB1bnNpZ25lZCBpbnQgdmlycSwNCj4gPiA+IHVuc2lnbmUNCj4gPiA+ID4gPiAgICAgICAgKiBm
d3NwZWMtPnBhcmFtWzBdLg0KPiA+ID4gPiA+ICAgICAgICAqIGh3aXJxIGlzIGVtYmVkZGVkIGlu
IGJpdHMgMC0xNS4NCj4gPiA+ID4gPiAgICAgICAgKiBUSU5UIGlzIGVtYmVkZGVkIGluIGJpdHMg
MTYtMzEuDQo+ID4gPiA+ID4gKyAgICAgICogQ2hlY2sgaWYgYml0cyAxNi0zMSBhcmUgc2V0IHRv
IGlkZW50aWZ5IFRJTlQgaW50ZXJydXB0cy4NCj4gPiA+ID4gPiAgICAgICAgKi8NCj4gPiA+ID4g
PiAtICAgICBpZiAoaHdpcnEgPj0gSUNVX1RJTlRfU1RBUlQpIHsNCj4gPiA+ID4gPiAtICAgICAg
ICAgICAgIHRpbnQgPSBJQ1VfVElOVF9FWFRSQUNUX0dQSU9JTlQoaHdpcnEpOw0KPiA+ID4gPiA+
ICsgICAgIHRpbnQgPSBJQ1VfVElOVF9FWFRSQUNUX0dQSU9JTlQoaHdpcnEpOw0KPiA+ID4gPiA+
ICsgICAgIGlmICh0aW50KSB7DQo+ID4gPiA+DQo+ID4gPiA+IElzIHRpbnQgPT0gMCBkb2VzIG5v
dCBoYXBwZW4/PyAgSSBtZWFuIEdQSU9pbnQgPT0gMCBpcyBpbnZhbGlkPz8NCj4gPiA+ID4NCj4g
PiA+IEZvciB0aGUgUDBfMCBjYXNlLCB0aW50ID0gMCBhbmQgaHdpcnEgPT0gSUNVX1RJTlRfRVhU
UkFDVF9IV0lSUShod2lycSkuDQo+ID4gPiBJbiB0aGlzIHNpdHVhdGlvbiwgd2UgZG8gbm90IG5l
ZWQgdG8gZW50ZXIgdGhlIGlmIGNvbmRpdGlvbi4NCj4gPg0KPiA+IFlvdSBtZWFuLCBubyBuZWVk
IHRvIGRvIHRoZSBiZWxvd2NoZWNrIGlmIHRpbnQgPTAuIEJ1dCBkbyBvbmx5IHRoaXMgY2hlY2sg
aWYgdGludCA+IDAuDQo+ID4NCj4gTm8sIEkgbWVhbnQgd2UgZGlkbid0IG5lZWQgdG8gcmUtZXh0
cmFjdCBod2lycS4NCj4gDQo+ID4gaWYgKGh3aXJxIDwgSUNVX1RJTlRfU1RBUlQpDQo+IE9rLCB0
byBkbyB0aGlzIGNoZWNrIEkgd2lsbCB1cGRhdGUgdGhlIGlmIGNoZWNrIHRvIGJlbG93IHNvIHRo
YXQgdGhlIGFib3ZlIGNoZWNrIGlzIGRvbmUuDQo+IA0KPiBpZiAodGludCB8fCAoaHdpcnEgPj0g
SUNVX1RJTlRfU1RBUlQgJiYgaHdpcnEgPD0gSUNVX1RJTlRfTEFTVCkpIHsNCg0KQnV0IHRoaXMg
d2lsbCBza2lwIHRoZSBod2lycSBpbnZhbGlkIGVudHJ5Pz8gZm9yIGVnOi0gdGludD0wLCBod2ly
cT0yDQoNCmlmIChod2lycSA8IElDVV9USU5UX1NUQVJUKQ0KCXJldHVybiAtRUlOVkFMOw0KDQpD
aGVlcnMsDQpCaWp1DQo=

