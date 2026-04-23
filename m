Return-Path: <linux-renesas-soc+bounces-31563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKPDLdn/6WkHrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:17:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D74512ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F4323029796
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246A43DE45A;
	Thu, 23 Apr 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eog9bHeZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C735C18C;
	Thu, 23 Apr 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942992; cv=fail; b=X5zHTR7AIV5Qowyzti7I9xsvQfYU7Ps7FLygDwl8TA8/oeycRyTzMxWktBIpfGcqDyaKQFbRUlmfM1ywIPPqx8FX7z9GcUTOxTWLpctYrzj5EsYm6WoHbbWwA+MHl6vvMJQNLhcdhbLDaSAqLfrgx4PPWvtX8fZ+sAsTnIEO87E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942992; c=relaxed/simple;
	bh=T4MujSPkJDb0K33ciK1t9WsaFemhAKbfMal3zY0YV8s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LXs2n7tcY8kf7bmZz36ZQ7PYLOKp/ABxPTlWlpt5I1Rg0whwgre8EfFGjaXMP3Y0MNufDOuUSUx1VMexeRhyDtAVSV55re6e6VrcYg+T9o9JqLira8lQqF31GIAwgLdH5YhRPZs5hWEIklvG0HsMjdenjzhshbk4dPfmOb7PXNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eog9bHeZ; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0XAmcKRu/8d4ms05fUXMvri4NslyXcfJPFw4K3ofMKy1s6+a4hdGhDROUAJs/DZqYbj1a+QYtONAyv0SXsCO122w1tVOanBfMMF66oNvacSKpRyc2X9jV7NAx3HNXm9fI8w4zZiagwzHncJaalYsimuSY1VTfYl3JXrUPoztZexifjlOicXu0x6Nk3sknVnJ8vjao066//pPYQkKaR7DshqbCX+7Xl8c59884RqAuJo8Xg7jot8MyFBnS6ZfOIqvh3PNdSSy4s5flupgUbWGrUHkvPYHEmTTA6srl+Mxh/jB5Xenw9krp0fz7J1aKh/RxGQoSgRCVICcxMZc1B9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4MujSPkJDb0K33ciK1t9WsaFemhAKbfMal3zY0YV8s=;
 b=U2OGbsu3jk87KQWeL1btwMGzeCWS7N5g7GuNmyPYgRohtqUodpXyn4KZ2dy5Kij8CyLpsOCIKk36qkt3hN8tJCgl68yTQg0OsFiEPN6guFI+qQSXplT/wXZrIPAK14fBb8JjNSXE0yRo/htuR6sSH7gfuwmdE38xTPKUD2PG7wmekfMt1v3h1Q/UO34+a0QkF72GzVt9c1Em3/H1Ps0UpGSvOMp2tZW2VNCEQlMZBGlrnYMwzLTV9X9KHedpT3GfObm9/ow6WW2/Kx2XTDn0WYZfNjsVtaVOUozNjnYZVM0uWfRG8n7qWoztButWiqeHRn60ytzHuikHQvf9/Zea5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4MujSPkJDb0K33ciK1t9WsaFemhAKbfMal3zY0YV8s=;
 b=eog9bHeZFQqyjgfZjSAylrzbOwY4ImWNoA3yPxd3ByTuiB39QH3ZDfzESdYNFRSlLCQIZ1i+P/McCfBrb1DRAns+5jM/eFu3d+Kz6X2A4Y1hz8U5JDUdzPjn+VchHDfhPcixeh745t0S2nAvuvsUli+XFZANE0Xz9ANPoP/pb6s=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB9324.jpnprd01.prod.outlook.com (2603:1096:400:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 11:16:28 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 11:16:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Thread-Topic: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling
 PLLs
Thread-Index: AQHcvRCq2UZqPdYqQkmSGXtX1tvGN7Xsj2cAgAAbMtA=
Date: Thu, 23 Apr 2026 11:16:28 +0000
Message-ID:
 <TYCPR01MB1133240976499BA4F4CEAABB2862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB9324:EE_
x-ms-office365-filtering-correlation-id: ed843873-0435-4385-a9f7-08dea129c3a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 EcqxnxLqPdI/GpICDnuXJ7vuZifv+MkMCLR5NDImtdjTXjNyCmsbbOzqQV4CXBIzJ4CvpRCthNBUX5ZucrNySTPv5i/6HHZ9Xeub2HvIvYaNnlJADBefJa2y9uAjtJOjpIGxIbgsQODNK8i9sG88g3TEF1jRdoW2H8oNXyHkSU7PuqbS2+MxS1W5zPfFRGtu8UF5QZqscO6LRw1SBsPdpiUybaoLOKRPskGh4QnLixQNXy3ULWIR+hogirHiROxqt7t7hnd1Eu7fUYLMzHNZiF6No869JpdpsW2Jxqc4cIvAmcJIvOyQRxigVtz7gfTvFySbj7ws9TF7gvoRvjMgzl6BRmun4/cUmzGjW5EUlD2VGzEZhV7u7hF06n55tPhCd/9pDBPc0cZIGRqNxDzcZAmDJr+J8XndL8t3jVRvd7gDT48bqWm5n1xRJvLp20TC/5Pyz1KxSB2t+FETuOmyxqIZAtjxBzKigUSPB7Eu2GeN3szwtJRx4MK0fdkwN3rYCgFT6Awom+73kLHvNVAb/DsCkeUHeNa9KbXW7ft8yddk84P7kWdLyiQsCnPkfROEiirtk8or4k9DiKEHA39bLNgDmNKH3Op0ifwbwYqnSHxu2YTf/0s1Vf1NfkLq2EP1g8s01/boVLvFRPxugXVzZjphaHGIN90Db/wIJrLntlryS4RFpoQIGqZ34dN02VjQyWiTJBZ4ESlhQvjgBZgJwe9er4u4zm2hMMN90SNdHQythbdC5QubhMR7wCcSYUkAAb9CdymawNSW6f8OXoog6qLAHSdxi5vfTfMfuVqckeM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkpXM05MSnFyQnpXa2tTdC8rSWw3eEd6dGdPN05MbGpTem9LZDBxTFZBNVRm?=
 =?utf-8?B?UGE0YVM0WFVPaEE3NU9QbDdtenIrdmhlWVhUdkE0T3JCUXcwdkovY3hjWStR?=
 =?utf-8?B?Y3VHWnUwL015WDBIcHJMRi9NOHRTcE92YndweXRrMVZ3UE1EWVB0OXcwbXFl?=
 =?utf-8?B?ZEhXWFRuQzFDV3Q5TWpVMGtNN0xvM255SFRxdVdNd1BXSjlydUZQSTRMTWl1?=
 =?utf-8?B?dThId1FQTk5nNXpLRjNFa0pFRnI0Tm5CWW51cGxPck9WZ3QzbnFsSmRRUWRv?=
 =?utf-8?B?R2RsRjM4cWFZVTJQQkxBRyt4RWpmaVFBMUo0RHQ3c1prbXl2UmFCbFNrUDVu?=
 =?utf-8?B?MUl1YWpnOWJsbUtRTFVHb0RUKzhsa0labmkyTnhtZ243ZjlKL09IZkRSVFlh?=
 =?utf-8?B?Y1hkb0V5LzBhVGUwQWlubXlMcWZ1T0FucUt5Z3lPZVhEUjFweGtZc0oyRHE3?=
 =?utf-8?B?VjJ5VjZidGJwZ2x1OUFXcFRSTWxqL3lUVUw3TW80VldXZXBZK2xQa3J3eUVC?=
 =?utf-8?B?UXdqRU5pdnlUNGFnbStyQlVKaW5sQlBPdmdrU1NOZXFvUHJvZTM0K0F0SjlV?=
 =?utf-8?B?dmxwUld0V3JLV1ZqMUhQRFl6NTE2SXhpR3o0Ukt1amJLenpmWGM2ekpyTTlL?=
 =?utf-8?B?cHdMTFpmdkNKd29XR000czhIeE5Hanl3aDAwY0FQUW45NUpONHE4NGN5M21l?=
 =?utf-8?B?RUhpeG9PZlBoU2pSdWVMRVl4MHZ2cmJlWnFFaDRJRGVZYW83L2VpUVpaVUgy?=
 =?utf-8?B?TGl4QVNxaStFUlhVaGFRbGlQY1ExbENsOWdXeU40LzhzOTIvdm9FYkZYNmg3?=
 =?utf-8?B?U296RDNvUDNTY3NzMkFNbXdxQzJ1RXY1THBCcDBTNnZ4ZExyMEJTV1VtMG5n?=
 =?utf-8?B?eTgzQzhpemF0ZWE2bGpZbGlydzFJMzVScWZXMjZXa1hENzNrcE9oZXE4K3lk?=
 =?utf-8?B?eGFMd3RGeXdFSTRrMk0wN3NuT3QrYWc4NGtCdW9PRXAvK0NYSTg2MFp6S1BM?=
 =?utf-8?B?SDNQVjVzTTVzV3VCUHpmSThrWWxGWDdxaEZJR2hWTW9KbVc0Z1hzRXNqS0VF?=
 =?utf-8?B?ZGM0bS9DUVRQSGxJOG1maTZ2aUt1TVNkSmFYdXc1YzVQRE1XZlBsdnl4dm80?=
 =?utf-8?B?VnpaSzNGeFN3YWlZQ1V5T2syU2Vtc1BFOExjNXd2TTRDMGtyb0hxbFdZdGV3?=
 =?utf-8?B?bXRqZFNieG1ESGwwZE1UcGV4QVFHSm0xdUp5QmNiU3RiczRldmlYYUc0b3RC?=
 =?utf-8?B?dzU5ajZXZXRrdjh4KzMvc1hIOUxxUyt3SHpFZ3FIZmdFMlRRUlorMHN2NEhU?=
 =?utf-8?B?YzR0cU1yRWZGVENkQ2EvV1VuU1lLYVhpNS9WcVZsRnR4SnV6V2doTURnS1dQ?=
 =?utf-8?B?OGs0WFJoeTRCS0dKRXAzTURKazZYMGVsa05zWThqclNKQnl4dk8vV25nN1Fs?=
 =?utf-8?B?U3QzU2dvbmFYM0lRMzRObVp5NW0wNWRGMVdhU3ZndmszUkg1c2JSZUhWUUgy?=
 =?utf-8?B?MlIvOWIyMXg3MHd1YjdBTkIxY1NQalBpcWNiT29CVTBTMXB2QkZZVG1FSHNE?=
 =?utf-8?B?V1Z3NTE1ZklKbm8yc3lFTXZVcTB3QlJpemwrS3hLdnZuVUx2eTZoYXBHU1BZ?=
 =?utf-8?B?b0RoNFF2RTlheWdkQ2luMEd6UkUzTnJSd2M4a00xb01pQ1g4bU5QTGs0TTIz?=
 =?utf-8?B?SEV0a0dyWmpVRTE2T1A0dUdKWnRNWVppMElEZ25BWDRGQjJSbnk0TTI1c0Mz?=
 =?utf-8?B?ODlWQktSZlhzTm5uQnhuRFlNS0ZKV0hTTDJUaUxvQ0RsbGZVWkFPbDU4Qm1w?=
 =?utf-8?B?RnR3TktRU05sTzgxRG8yOVpaTUpqeXVqMlNQUkI1dEZ1OVZCYmY2dUcvRG1v?=
 =?utf-8?B?eTEyNGtRYlBwelRiL2RDOXBuSjJ3NVNXeWtiSHQ0S1pTeUJOdWxUMUJKVlFV?=
 =?utf-8?B?ODQyY1paSUxuaHlKSk9hOHk4ZUc3b0VYZU9PNUtQRnRneVh1TEcveFZWZlkr?=
 =?utf-8?B?UGF0SGpuTWpVL1RGMnloZVhneGVibzdWU1pFWUtaTks4Q2s3YWYxT2N0eGxT?=
 =?utf-8?B?ZG9NTStpKzJDc3AzeWw5TDkwVEFBY0VLbVhTQ09nVnZaMzFVMDBKM0x4c0xz?=
 =?utf-8?B?VFcyeEtoN09NOHlmbWRCKzRKdytTQlZLNnNOVXR3SDZwWHFkbCtsSEY1TTg3?=
 =?utf-8?B?VC9Jd3NSTG9JZ1dEWmU4ZEo3S3RLbm5yM0pLREhhUWVkcGhyMWt5eTFOampG?=
 =?utf-8?B?Z0ZTaXhhUisrMVBlekpQemZOWUZPUjg4VzNRVFphWXlPVTY4S2VkNVltbk9v?=
 =?utf-8?B?M1RvYkhTdG1xR0tIMXU4c3MwVGp5bWVCSjFzbEdPaVErRjIySkM0Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed843873-0435-4385-a9f7-08dea129c3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 11:16:28.1100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLXZ0PxDlBRkumjvVbhkLMlzag3ImGNxM3DscSgPBU0cwo3J1FXvg+SQkq3DRQ8g0r6d239HQCeRYuOwbJp0M0sRquhgjt6857aPLLtivJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9324
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31563-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A0D74512ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIzIEFwcmlsIDIwMjYgMTA6MzcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAyLzRdIGNsazogcmVuZXNhczogcnpnMmw6IEFkZCBzdXBwb3J0IGZvciBlbmFibGluZyBQ
TExzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCAyNiBNYXIgMjAyNiBhdCAxMjowNiwg
QmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgZW5h
YmxpbmcgUExMIGNsb2NrcyBpbiB0aGUgUlovRzNMIENQRyBkcml2ZXIgdG8gdHVybg0KPiA+IG9m
ZiBzb21lIFBMTHMsIGlmIHRoZXkgYXJlIG5vdCBpbiB1c2UoZWc6IFBMTDYsIFBMTDcpDQo+ID4N
Cj4gPiBJbnRyb2R1Y2UgYGlzX2VuYWJsZWRgIGFuZCBgZW5hYmxlYCBjYWxsYmFja3MgdG8gaGFu
ZGxlIFBMTCBzdGF0ZQ0KPiA+IHRyYW5zaXRpb25zLiBXaXRoIHRoZSBgZW5hYmxlYCBjYWxsYmFj
aywgUExMIHdpbGwgYmUgdHVybmVkIE9OIG9ubHkNCj4gPiB3aGVuIHRoZSBQTEwgY29uc3VtZXIg
ZGV2aWNlIGlzIGVuYWJsZWQ7IG90aGVyd2lzZSwgaXQgd2lsbCByZW1haW4NCj4gPiBvZmYuIERl
ZmluZSBuZXcgbWFjcm9zIGZvciBQTEwgc3RhbmRieSBhbmQgbW9uaXRvciByZWdpc3RlcnMgdG8N
Cj4gPiBmYWNpbGl0YXRlIHRoaXMgcHJvY2Vzcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiBAQCAtNTgsNiAr
NTgsMTMgQEANCj4gPiAgI2RlZmluZSBSWkczU19ESVZfTkYgICAgICAgICAgIEdFTk1BU0soMTIs
IDEpDQo+ID4gICNkZWZpbmUgUlpHM1NfU0VMX1BMTCAgICAgICAgICBCSVQoMCkNCj4gPg0KPiA+
ICsjZGVmaW5lIFJaRzNMX1BMTF9TVEJZX09GRlNFVCh4KSAgICAgICAoR0VUX1JFR19TQU1QTExf
Q0xLMSh4KSAtIDB4NCkNCj4gPiArI2RlZmluZSBSWkczTF9QTExfU1RCWV9SRVNFVEIgICAgICAg
ICAgQklUKDApDQo+ID4gKyNkZWZpbmUgUlpHM0xfUExMX1NUQllfUkVTRVRCX1dFTiAgICAgIEJJ
VCgxNikNCj4gPiArI2RlZmluZSBSWkczTF9QTExfTU9OX09GRlNFVCh4KSAgICAgICAgICAgICAg
ICAoR0VUX1JFR19TQU1QTExfQ0xLMSh4KSArIDB4OCkNCj4gDQo+IFRoaXMgLSAweDQgLyArIDB4
OCBpcyBhIGJpdCBoYXJkIHRvIGZvbGxvdy4gIEkgZG9uJ3Qgd2FudCB0byBibG9jayB0aGlzIHNl
cmllcywgc28gZm9yIG5vdyBpdCdzIE9LLg0KDQpPay4NCg0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGdvb2QgdG8gcmVmYWN0b3IgdGhlIHdob2xlIFBMTCBzdWIgcmVnaXN0ZXIgb2Zmc2V0DQo+IGhh
bmRsaW5nOiBjdXJyZW50bHkgdGhlIGNvbmZpZyB2YWx1ZSBjb250YWlucyB0aGUgb2Zmc2V0cyBv
ZiBib3RoIHRoZQ0KPiBDTEsxIGFuZCBDTEsyIHJlZ2lzdGVycyAod2hpY2ggZGlmZmVyIGJ5IGEg
Zml4ZWQgdmFsdWUgb2YgNCkgaW4gdGhlIGNvbmZpZyB2YWx1ZSwgYW5kIHRoZSBvdGhlcg0KPiBy
ZWdpc3RlciBvZmZzZXRzIGFyZSBkZXJpdmVkIHVzaW5nIHRoZSBtYWNyb3MgYWJvdmUuICBJbnN0
ZWFkLCBpdCBjb3VsZCBzdG9yZSB0aGUgbG93ZXN0IFBMTCByZWdpc3RlcnMNCj4gb2Zmc2V0IChT
VEJZKSwgYW5kIGRlcml2ZSBhbGwgb3RoZXJzIGZyb20gdGhhdCBieSBhZGRpdGlvbnMgb25seS4N
Cg0KSSB3aWxsIHNlbmQgZm9sbG93IHVwIHBhdGNoIHRvIGNvcnJlY3QgdGhpcyBsb2dpYyBsYXRl
ci4NCg0KDQo+IA0KPiA+ICtzdGF0aWMgaW50IHJ6ZzNsX2NwZ19wbGxfY2xrX2VuZGlzYWJsZShz
dHJ1Y3QgY2xrX2h3ICpodywgYm9vbA0KPiA+ICtlbmFibGUpIHsNCj4gPiArICAgICAgIHN0cnVj
dCBwbGxfY2xrICpwbGxfY2xrID0gdG9fcGxsKGh3KTsNCj4gPiArICAgICAgIHN0cnVjdCByemcy
bF9jcGdfcHJpdiAqcHJpdiA9IHBsbF9jbGstPnByaXY7DQo+ID4gKyAgICAgICB1MzIgc3RieV9v
ZmZzZXQsIG1vbl9vZmZzZXQ7DQo+ID4gKyAgICAgICB1MzIgdmFsLCBtb25fdmFsOw0KPiA+ICsg
ICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgICBzdGJ5X29mZnNldCA9IFJaRzNMX1BM
TF9TVEJZX09GRlNFVChwbGxfY2xrLT5jb25mKTsNCj4gPiArICAgICAgIG1vbl9vZmZzZXQgPSBS
WkczTF9QTExfTU9OX09GRlNFVChwbGxfY2xrLT5jb25mKTsNCj4gPiArDQo+ID4gKyAgICAgICBp
ZiAoZW5hYmxlKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IFJaRzNMX1BMTF9TVEJZX1JF
U0VUQl9XRU4gfCBSWkczTF9QTExfU1RCWV9SRVNFVEI7DQo+ID4gKyAgICAgICAgICAgICAgIG1v
bl92YWwgPSBSWkczTF9QTExfTU9OX1JFU0VUQiB8IFJaRzNMX1BMTF9NT05fTE9DSzsNCj4gPiAr
ICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IFJaRzNMX1BMTF9TVEJZ
X1JFU0VUQl9XRU47DQo+ID4gKyAgICAgICAgICAgICAgIG1vbl92YWwgPSAwOw0KPiA+ICsgICAg
ICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHdyaXRlbCh2YWwsIHByaXYtPmJhc2UgKyBzdGJ5X29m
ZnNldCk7DQo+ID4gKw0KPiA+ICsgICAgICAgLyogZW5zdXJlIFBMTCBpcyBpbiBub3JtYWwvc3Rh
bmJ5IG1vZGUgKi8NCj4gDQo+IHN0YW5kYnkuDQoNCk9vcHMsIG1pc3NlZCB0aGlzLg0KDQpDaGVl
cnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICByZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRv
bWljKHByaXYtPmJhc2UgKyBtb25fb2Zmc2V0LCB2YWwsIG1vbl92YWwgPT0NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZhbCAmIChSWkczTF9QTExfTU9OX1JF
U0VUQiB8IFJaRzNMX1BMTF9NT05fTE9DSykpLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAxMCwgMTAwKTsNCj4gPiArICAgICAgIGlmIChyZXQpDQo+ID4gKyAg
ICAgICAgICAgICAgIGRldl9lcnIocHJpdi0+ZGV2LCAiRmFpbGVkIHRvICVzIFBMTCAweCV4LyVw
Q1xuIiwgZW5hYmxlID8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAiZW5hYmxlIiA6ICJk
aXNhYmxlIiwgc3RieV9vZmZzZXQsIGh3LT5jbGspOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVy
biByZXQ7DQo+ID4gK30NCj4gDQo+IFdpdGggdGhlIHR5cG8gZml4ZWQ6DQo+IFJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

