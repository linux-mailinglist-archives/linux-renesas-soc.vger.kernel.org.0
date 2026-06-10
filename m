Return-Path: <linux-renesas-soc+bounces-33791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TcW7DQ3wKGrPNwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:03:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D8665D47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=D6d5ck1L;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42E293010A8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 05:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AA12F5A13;
	Wed, 10 Jun 2026 05:03:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFDD2EB0F;
	Wed, 10 Jun 2026 05:03:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781067782; cv=fail; b=LdwVQFOmhuDA8FtHuxzCSNZPrbclAZBxsQ3itwEwqAAUNx14lwbkzTb+rH9xMKJda3A5S3pTwIMXGloV00Iow8tkfHp4MrFFXxtUBy9ez2C8uwuJOzCi+K59Gpvx5MCADGdk4PzbRkAPjrOelT2egTnaFd7z3Ye342y/iRukrC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781067782; c=relaxed/simple;
	bh=68PdQOd6hoVKxPjwxlbrPs31wg2qsL6W73wTSOl7DcQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XjcRWk7+ZBOK7N/Y9bhFL/2cby0abBbnKYTuRVTthysT6s4zqFmRsK+cXrj/Waw+AnaWh9hxPAoG5NFg/cxwUXNkBTUMLFDLhL2LQy5evNyfNRy+Xjp4k0wtpHsFKKvGZb4qipNNnRlhRZCv589Vt1dhEFz0icro6kD8I6l+uRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D6d5ck1L; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrSSHwO0oOvK9JMhWfkKeL0YIh7W+rQjFY/BsgGLA/Mu4x1qpEF5oOyfNpNHGvnIUKKvUALusdG/JXV2IBWMuqJ9dK/cdMtpq8FxgX8fMeVvpM+uLc/1mpUVVvrVaechf5/gMuNrFjK8RfShK4PREDp2q/UKS4yKei73UJrBDRVrooUDeOCQwASOKAWR8+UBKGxHJ7U7NYY4TyCbvqaLTPRGAJfAeiJ8CjsATqAeCiJTgY+zyNPdkTVCUgtrHd1SmrdwnoLnFfkH9WyHNBQzlLZm9XVq6Au2obvegTX7BnbKgGaBfl+5+AwMgJBvle04pNoseK4edteYCCa8Doc1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68PdQOd6hoVKxPjwxlbrPs31wg2qsL6W73wTSOl7DcQ=;
 b=et6/N/wcR05rOyvXPznq4hYp0CkBC16G4c+EmdxRh49MHXtnMXlrBRMMQzFd+gpeEzgvVHDHP5zHD/JFafcZ2Ng9C0gA3vndMB+Tw1okzMJbDbS4hfN1My2cYVv/WvRS8UW1hVYH1QdUagziJjOAyM/ah9QdqI3Tj2SBOlogReaiI+PtmBf4gG+f0OWPhegzTy4zH+Zl3ufaGAynSHbyzvUd2NU+aALDAsG01nCHlVmvKAHGorR4Jl29gW0CCKlSPzt8oC4HMRti07hevAMqvnQP6vKApQoz2VRKjye4yikLovBiS2YfvsWdtnkCkGWpJvrBZC3Poaw8gfIi/C24vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68PdQOd6hoVKxPjwxlbrPs31wg2qsL6W73wTSOl7DcQ=;
 b=D6d5ck1LdyqKQoUK/67PpucC3MZYb9pEd0LbEiRuMVRsw/YA80iv0uCBqDwIgS+jkGBDMC2VPqSb3Sku8a8VABYJLp3PRD+S5bNmHykRQ8MiDtpE5gpB67K0Oixoz0Uh4khqio8klSvFycLpzBSNzhIDH8MQ8q7PTUG+JPxgpK8=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB6648.jpnprd01.prod.outlook.com (2603:1096:604:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 05:02:58 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 05:02:48 +0000
From: Michael Dege <michael.dege@renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [net-next 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Thread-Topic: [net-next 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Thread-Index: AQHc+Fs3milErLaePE6c6cVEOdftPrY3Op7Q
Date: Wed, 10 Jun 2026 05:02:48 +0000
Message-ID:
 <TY4PR01MB1428267DC1F642A7935EC302D821A2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB6648:EE_
x-ms-office365-filtering-correlation-id: 60ed3cbb-c021-46a1-2699-08dec6ad843a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|921020|11063799006|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 SbFD+5jtWBGPZZpaj0hCAzMUIYpz3q9nij1e0CY+fgMQ1fIXK5Aex+UAyCNsID7DiiiyNXg43n4F7JwBQwKrfF7Md41BiHqh1JgaVBy+Kb9vGFojDOVhg7CHCyzhJ8NrxomochmrUdpXOb7EE7R195Un0sP761CHn3Px26e7Fg05iXOZB7cO4SdSuqNXggxBgZbDNX2nQyHrs9N5N+4u9z8uxfiHOWhpXlvG+ZgMnttXnDatHOkQ5eLdPBinckb5w4IV36S1/ZXochJvEbYu92VRGZ5tnxkUH00nwGi02u9NHK7RMKjATytvbX+7Xi0DFfVX/BbeOdHw4cbDXj1iwY5PSEkKvRkoxB9GP6OwgPdpvME2Go9WTnWQv5CvjkNNAIR6Q6cLMeRXVrNNyAkAddMnX3RpWtgD6GGTG/JvkSTNrDXmnKVQjGNEYJ3Wrle2ICKZ7+u8TFAU1Xq5cwdTkxOHoDZD0TwMLdgpUKhLe/6aPo6wT8uvw8MyfXyUATbJFy30/ge5PKNcQ9QzwXV3SDrzbMs9MI1peyaTz37k9a5FJRq4e8VwrVE7Sqld8WQ+FMrjHZJMkWGpafcIaQ/WBXGo+qy3yiEyORqcbBfRBm77Ob42ZM+zn7liGfv6Vzk/j+ijs5/RjGLB8qIzza6WdGNOhdcsVgkeVTzDAzt3KcrwnNETj1W0dBiZydWUlTish/CUSZkIg4/pHeo/MYKx+B7qSIGARzWUJ2tsYjg6dq6DlfuWVuAZ6OLjBEoWlRJXDd+KwnYkfv8r3AWLIeINiw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(921020)(11063799006)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MG9LTURBYnFiWDZXaThXNmxlVGZrTXVLdFY4VWJGRncvRjQzeG9RU2Y4RjU2?=
 =?utf-8?B?NWZ0cUxxNmJsd1Q4Sm5jcFdyTGNNMlc5WEVkN1NsQ3ZQMTNSRnAyNHhnS0RU?=
 =?utf-8?B?NG5QbTdnUW5nOEtDcTRhM2JkN1RxYTVIZ3ZDalFXWnByS20xOUNhSFlNaW9o?=
 =?utf-8?B?c0FRQ25yWkt2Z3hYeGZBU3VIRk82T2R5aTVGaFJBekR3U3VBQXVaSm5rQ0tF?=
 =?utf-8?B?OTdWdGhIYlNqZWtDSjNNSjc5cytrQVUzTTVrUXlLZ3ZZek52L2dTSTUzV0Zn?=
 =?utf-8?B?Q3FIWGtJdjVDVDRxLzZwdjFjclJwY2lQS3VDTDU4MlJSQkRqMVBGU2RYVDND?=
 =?utf-8?B?UEFKc1c5UVNCdmVmeWs1QjRrRzlCSGhBN2hyenBJS2sxN2xEdno0UFVqbndU?=
 =?utf-8?B?ak5XMU5GM2cwRlR4Ync2TUNFVHdGQ29XUXNDSWpmRXZQczBEb0hrOVdFaFV2?=
 =?utf-8?B?aWl2MlUxNWlza1ZSWkhWUURMZFJJT295REtlNkZKYjN1SjBBeUxjcGRhYWNI?=
 =?utf-8?B?WXNPdDFIZjJLcmZKdHpKNXIvWlIxRTBMNGs4alFUV1I0SitXT2VUY1V3cDJW?=
 =?utf-8?B?YjI5eGlBT2pMaHpKclh2clpQc1FtNXVsVnJHT1RLaXI0bmhmNERXTW0zV21i?=
 =?utf-8?B?TTV3WnI5SldZQUY5WkdHZVM0Mzh0N1hTOVZDZVpVcGMwampTMkd4ek1IdTFz?=
 =?utf-8?B?a1dZY1lKOG1XaGtJYlE0QXFtM0lzZElteit5T3ZWYUdFSDRsYTQwc1FOWGhG?=
 =?utf-8?B?RmM4UVRYNjFBdU5ZbElHV0J6VnRCVDBPTXAzdUE3dFdCekY3T1d2MHZ1OHhl?=
 =?utf-8?B?R1lBMWhxU3FHUDBscVpURVpuOU1KZ2lNNDVxQklpU1JoN2ZDcFNubnlpdlVs?=
 =?utf-8?B?U0YwYXVSOFpwNWkxaStzaGRrcEpYclJVQ2toSXoyQUlwRk0wRmlZdUh0TVFy?=
 =?utf-8?B?VVB6V0FYYVFFaHE0OFl5d0I2TXBZNG5ia1E5UDJ4N3VYNVZjTjR0SkVVOUFM?=
 =?utf-8?B?QXRud2NOemtndXo3cllmaG5kam03L1czRHA5SGRRZ0kvT0J4bzVZRUtid3VZ?=
 =?utf-8?B?RWtOalZxZzNTSklzZUo2czMrMGZSYTE2ZVFJNXR2MCtHREJycFFMZmR5dUJ0?=
 =?utf-8?B?UU5RVWRvTWFqUTV6bGNRREtJNit0bWh2V2V5d1hhRC9PTG1ZaXVUQzlrbDBI?=
 =?utf-8?B?Q3Z2MHgxWS93Y3BuRDJKRHhSSE1tMElIbVg4akJvTFVWbFJqMUJ4aUIwSDhU?=
 =?utf-8?B?Y0x3em9oVlZCbmY3dGY1cDNoYVh3Q0laeEpTeWVoRG52c0gxZXFUZlRyNDBi?=
 =?utf-8?B?RndwTGRubXdOMXd5bSsvbW1qQ29jWERTaG83aVNmbGZYb2tzdUczQmozdVZH?=
 =?utf-8?B?ZFZEWlpTKzlWWHM1TDQ3d3lxQzZ2NXpQM0k1Qlh4MWZ0OFpZRXNBSlR3UHBx?=
 =?utf-8?B?bTF2OUwvaWZVN1gyU1E5L2xKVTVXQWRxK1A2bFc5L3VFSjNUNjFlbmdQTGdx?=
 =?utf-8?B?M0w2NmthQjB4QzlMYXBTVzNEZFhieWNjT091YmF3OGQ3NVIvTXQ3WEhQdTQ5?=
 =?utf-8?B?WFBpYm9lSXR2Tjg0OVRFdzNJVVBNdXA3S1lqdHIvSTY1UkszUFlEQ3hySVhM?=
 =?utf-8?B?SVRvcTRncVZQdWxYMElkTjhpNVlmK0I2TUZjb1NoK1VYdnZIb3V4MEFFcXA1?=
 =?utf-8?B?WnBIYnRETGhWTEs2bnd4c2JQdHRqWnJ2RlFPWHlBZ0JPUFVUbHUwdUJpRGRU?=
 =?utf-8?B?RWdLME5NcTg1alV6eE9ZQXFrNzZZTkdJZGpnbGtjWTlwZktjQnZUMFN3eXd1?=
 =?utf-8?B?dHIrclFoSzJHbGpaWjhvd0M4dkIwU2NKak9qL2JWdWhZRDdDV2JqVktiVGdZ?=
 =?utf-8?B?dUQ0bExod2N1RUlKVVZLdmJkQU1GeHd0bEtsdm0vdEIrUlFDK3FwR0krVWg3?=
 =?utf-8?B?OFo4VXJlV2MwcExTVCsxOWhGdXIzMlRBVHpsaXp5eTh1MnZ3L0RLdzE0U3JD?=
 =?utf-8?B?TE1TM1F2QUJtN1RlZWRzK3RLbTRNd0g0N1RTaXdJWWVLVDFKRFpCNHd5eWlS?=
 =?utf-8?B?VThpWE1rR0pRNzJyS2F0Y3FOUU9nZ081TkRleFBsSkF2TlcyZnpXdXFZRVR0?=
 =?utf-8?B?YkNtZ0h4bGR0dktPY241TnFDU0ZQZDY2elJwbzhqbWl1UzB0MDZ3VEpjRWVS?=
 =?utf-8?B?ZFlJaHpRbGpSTWJPak1DdUl6OWtaZHIwRXdMc1c3d1Vsa3B0dkV1V3QrQlRE?=
 =?utf-8?B?VTcycjFlSko4M2p5dnBSRjJoR0Z3eEJmWjlDbHJaVzhBNitMWk5tSVhIMUxC?=
 =?utf-8?B?WGVuU1VEWmtNS2llcXptQ0VBZDhvQ0FYRldDL09SUHpHMlpxeHBQZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ed3cbb-c021-46a1-2699-08dec6ad843a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 05:02:48.2867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prukAEII+1m3SEsYPPXl27tjDcb9PwLMW5jpjZtpXSh/sHhD+JtSoqdcb1mNoodIfmMEsIlQXuufosFDM3HmlA3pr4k3lYkzNw6Pt/XhmYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6648
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33791-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_SENDER(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lunn.ch:email,renesas.com:dkim,renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 237D8665D47

SGVsbG8gTmlrbGFzLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZWZmb3J0IHRvIGNsZWFuIHRoaXMg
ZHJpdmVyIHVwLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pa2xh
cyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiBT
ZW50OiBUdWVzZGF5LCBKdW5lIDksIDIwMjYgMTE6NTcgUE0NCj4gVG86IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgbWFnbnVzLmRhbW0NCj4gPG1hZ251cy5kYW1t
QGdtYWlsLmNvbT47IFJpY2hhcmQgQ29jaHJhbiA8cmljaGFyZGNvY2hyYW5AZ21haWwuY29tPjsg
QW5kcmV3IEx1bm4NCj4gPGFuZHJldytuZXRkZXZAbHVubi5jaD47IERhdmlkUy4gTWlsbGVyIDxk
YXZlbUBkYXZlbWxvZnQubmV0PjsgRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPjsN
Cj4gSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz47IFBhb2xvIEFiZW5pIDxwYWJlbmlA
cmVkaGF0LmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5ldGRl
dkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJs
dW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiBTdWJqZWN0OiBbbmV0LW5leHQgMC8zXSBwdHA6
IEFkZCBkcml2ZXIgZm9yIFItQ2FyIEdlbjQgZ1BUUCB0aW1lcg0KPiANCj4gSGVsbG8sDQo+IA0K
PiBUaGlzIHNlcmllcyBpcyB0aGUgZmlyc3QgcGFydCBjbGVhbmluZyB1cCBob3cgUFRQIHRpbWVy
IHN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgb24gUi1DYXIgR2VuNC4NCj4gQ3VycmVudGx5IHRoZXJl
IGlzIHBhcnRpYWwgc3VwcG9ydCBmb3IgaXQgaW4gc29tZSBvZiB0aGUgRXRoZXJuZXQgZGV2aWNl
cyB0aGF0IGNhbiB1c2UgaXQsIGJ1dCBub3QNCj4gYWxsLg0KPiANCj4gVGhlIHBhcnRpYWwgc3Vw
cG9ydCBoYXZlIGJlZW4gaW1wbGVtZW50ZWQgYnkgaGFja2luZyB0aGUgZ1BUUCBtb2R1bGUgZGly
ZWN0bHkgaW50byB0aGUgZmlyc3QgRXRoZXJuZXQNCj4gZGV2aWNlIGRyaXZlciB0aGF0IHVzZWQg
aXQsIFJUU04gZm9yIFY0SCBhbmQgUlNXSVRDSCBmb3IgUzQuIFRoaXMgaXMgdW5kZXJzdGFuZGFi
bGUgYXMgZWFybGllciBSLUNhcg0KPiBnZW5lcmF0aW9ucyBoYWQgYSBkZWRpY2F0ZWQgZ1BUUCB0
aW1lciBmb3IgZWFjaCBFdGhlcm5ldCBkZXZpY2UsIGJ1dCBvbg0KPiBHZW40IHRoZXJlIGlzIGEg
c2luZ2xlIHN5c3RlbS13aWRlIFBUUCB0aW1lciBzaGFyZWQgYnkgYWxsLg0KPiANCj4gVGhlIGN1
cnJlbnQgaW1wbGVtZW50YXRpb24gbWFrZXMgaXQgaW1wb3NzaWJsZSBmb3Igb3RoZXIgRXRoZXJu
ZXQgZGV2aWNlcyBvbiB0aGUgcGxhdGZvcm0gdG8gdXNlIHRoZQ0KPiBQVFAgdGltZXIgd2l0aG91
dCBtZXNzaW5nIGFyb3VuZCB3aXRoIG90aGVyIEV0aGVybmV0IGRldmljZSBkcml2ZXJzLg0KPiAN
Cj4gVGhlIGVmZm9ydCB0byBjbGVhbiB0aGlzIHVwIHN0YXJ0cyB3aXRoIHRoaXMgc2VyaWVzIHdo
aWNoIGFkZHMgdGhlIHN5c3RlbS13aWRlIGdQVFAgdGltZXIgYXMgaXRzIG93bg0KPiBkcml2ZXIg
YW5kIGRldmljZSB0cmVlIG5vZGUuDQo+IA0KPiBUaGlzIHNlcmllcyB3aWxsIHRoZW4gYmUgZm9s
bG93ZWQgYnkgd29yayB0byBhZGQgcHJvcGVyIFBUUCBzdXBwb3J0IHRvIHRoZSBSLUNhciBSQVZC
IEdlbjQgZHJpdmVyLA0KPiB3aGljaCBjdXJyZW50bHkgYWR2ZXJ0aXNlcyB0byB1c2VyLXNwYWNl
IGl0IHN1cHBvcnRzIFBUUCBidXQgd2hpY2ggaW1wbGVtZW50YXRpb24gaXMgYnJva2VuIGFuZCBk
b2VzDQo+IG5vdCB3b3JrLg0KPiANCj4gVGhpcyB3aWxsIGluIHR1cm4gYmUgZm9sbG93ZWQgYnkg
d29yayB0byB0aGUgUlRTTiBhbmQgUlNXSVRDSCBkcml2ZXJzIHdpbGwgYmUgYmUgc3dpdGNoZWQg
ZnJvbSBpdHMNCj4gY3VycmVudCBwYXJ0aWFsIHN1cHBvcnQgYnkgbWFwcGluZyB0aGUgZ1BUUCBh
ZGRyZXNzIHNwYWNlIGRpcmVjdGx5IHRvIGluc3RlYWQgdXNlIHRoaXMgZHJpdmVyLg0KPiANCj4g
V2hpbGUgaGF2aW5nIGJvdGggdGhpcyBkcml2ZXIgYW5kIHRoZSAiZGlyZWN0IGFjY2Vzc2luZyBv
ZiByZWdpc3RlcnMgYnkgdGhlIHVzZXIgZHJpdmVyIiBpbiBvcGVyYXRpb24NCj4gYXQgdGhlIHNh
bWUgdGltZSB3b3JrcywgYnV0IGl0IGlzIG5vdCByZWNvbW1lbmRlZC4gSXQgd29ya3MgYnkgY2hh
bmNlIGR1ZSB0byBob3cgYm90aCB0aGUgUlRTTiBhbmQNCj4gUlNXSVRDSCBkcml2ZXJzIGludGVy
bmFsIHdvcmtpbmdzLg0KPiANCj4gRm9yIHRoaXMgcmVhc29uIHRoaXMgbmV3IHNvbHV0aW9uIHdp
bGwgb25seSBiZSBlbmFibGVkIG9uIHBsYXRmb3JtcyBhZnRlciBhbGwgdXNlcidzIG9mIHRoZSBn
UFRQIGNsb2NrDQo+IGhhdmUgbW92ZWQgdG8gb25seSB1c2UgdGhlIG5ldyBjZW50cmFsaXplZCB0
aW1lci4NCj4gDQo+IEZvciBzb21lIHBsYXRmb3JtcyB0aGlzIGlzIHN0cmFpZ2h0IGZvcndhcmQs
IHN1Y2ggYXMgVjRIIFNwYXJyb3cgSGF3aywgd2hpY2ggb25seSBoYXZlIHRoZSBSQVZCDQo+IEV0
aGVybmV0IGludGVyZmFjZS4gVGhpcyBwbGF0Zm9ybSBjdXJyZW50bHkgaGF2ZSBubyB1c2VycyBv
ZiB0aGUgUFRQIHRpbWVyLCBidXQgc3RpbGwgYWR2ZXJ0aXNlIGl0DQo+IHN1cHBvcnRzIGl0LiBU
aGlzIGFuZCB0aGUgc29vbiB0byBiZSBwb3N0ZWQgUkFWQiBwYXRjaGVzIHNvbHZlcyB0aGF0Lg0K
PiANCj4gQXMgdGhlIFJBVkIgcGF0Y2hlcyBkZXBlbmRzIG9uIHRoaXMgc2VyaWVzIHRoZSBkZXZp
Y2UgdHJlZSBub2RlIGZvciB0aGUgZ1BUUCBjbG9jayBpcyBhZGRlZCBpbiB0aGlzDQo+IHNlcmll
cyBidXQgd2lsbCBiZSBlbmFibGVkIGFuZCBsaW5rZWQgdG8gY29uc3VtZXJzIGluIHRoZSBSQVZC
IGdQVFAgc2VyaWVzIGZvciBwbGF0Zm9ybXMgd2hlcmUgaXQgd2lsbA0KPiBub3QgY29uZmxpY3Qg
d2l0aCBSVFNOIGFuZCBSU1dJVENILiBBbmQgZnVydGhlciBlbmFibGVkIGFzIG1vcmUgb2YgdGhp
cyBpcyBjbGVhbmVkIHVwLg0KPiANCj4gVGhlIGdQVFAgZHJpdmVyIGl0c2VsZiBpcyBoZWF2aWx5
IGluZmx1ZW5jZSBieSB0aGUgZXhpc3RpbmcgcGFydGlhbCBzdXBwb3J0IGZvciBnUFRQIGluIHRo
ZSBSVFNOIGFuZA0KPiBSU1dJVENIIGRyaXZlcnMgYW5kIHRoZSBSZW5lc2FzIEJTUC4NCj4gDQo+
IE5pa2xhcyBTw7ZkZXJsdW5kICgzKToNCj4gICBkdC1iaW5kaW5nczogcHRwOiByZW5lc2FzLHJj
YXItZ2VuNC1ncHRwOiBBZGQgYmluZGluZyBmb3IgUi1DYXIgR2VuNA0KPiAgIHB0cDogQWRkIGRy
aXZlciBmb3IgUi1DYXIgR2VuNA0KPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3OWcwOiBB
ZGQgZ1BUUCBub2RlDQo+IA0KPiAgLi4uL2JpbmRpbmdzL3B0cC9yZW5lc2FzLHJjYXItZ2VuNC1n
cHRwLnlhbWwgIHwgIDY0ICsrKysrDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDcgKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3OWcwLmR0c2kgICAgIHwgICA5ICsNCj4gIGRyaXZlcnMvcHRwL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMiArDQo+ICBkcml2ZXJzL3B0cC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9wdHAvcHRwX3JjYXJfZ2VuNC5j
ICAgICAgICAgICAgICAgICAgIHwgMjE5ICsrKysrKysrKysrKysrKysrKw0KPiAgNiBmaWxlcyBj
aGFuZ2VkLCAzMTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wdHAvcmVuZXNhcyxyY2FyLWdlbjQtZ3B0cC55YW1s
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wdHAvcHRwX3JjYXJfZ2VuNC5jDQo+IA0K
PiAtLQ0KPiAyLjU0LjANCj4gDQpBcmUgeW91IGF3YXJlLCB0aGF0IEdlbjUgaXMgb24gdGhlIGhv
cml6b24/IFRoZSBmaXJzdCBwYXRjaGVzIGZvciBYNUggaGF2ZSBiZWVuIHVwLXN0cmVhbWVkLiBY
NUggd2lsbA0KYmUgdXNpbmcgdGhlIHNhbWUgZ1BUUCBkcml2ZXIuIEkgdGhpbmsgaXQgd291bGQg
YmUgYSBnb29kIGlkZWEgdG8gbWFrZSB0aGlzIGRyaXZlciBnZW5lcmljLCBtZWFuaW5nDQpsZWF2
ZSBvdXQgdGhlIHJlZmVyZW5jZXMgdG8gR2VuNC4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCkJlc3Qg
cmVnYXJkcywNCg0KTWljaGFlbA0K

