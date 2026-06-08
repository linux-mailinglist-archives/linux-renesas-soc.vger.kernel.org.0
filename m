Return-Path: <linux-renesas-soc+bounces-33656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3KktCQ6mJmokagIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:22:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87180655A25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=R552jMab;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B708300A7F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F683624C3;
	Mon,  8 Jun 2026 11:22:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245543624DE;
	Mon,  8 Jun 2026 11:22:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917770; cv=fail; b=R3/6/8PfiLsnZPdgo9cMhk5CWva9mpDv/c8pkg0/FuZjFJTaVg73c7+M9FzTR2XVn/pS/Zpib0Z6DC/bV0wUYHS488ewz7tFiM6ZFJzCZ0NATy3GEZ8H4NXQdE0ct2vkwmCQFTCxerIlfe4FtKydwGEtyBtzoWSYmY6p46S+q+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917770; c=relaxed/simple;
	bh=eyo7EOoUAPO698siwvT7e0tfq/nsxpgvemPXH5iooUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d03tHNKvcgUBJaPYjLuJEzex/DJJqY0BeKnzrKoyat4awjCGlnDmuAO+M7maTAG8SvtOgR7vcf9CqBbsMVMoYRX10UAfHfS9z+33R89SK8Ww0tSdMU2z/QsSD5vxUqUk4jtQWhZdtU6EXsnkKxg88zOqCGpv2uoxUdI8KcE8cPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R552jMab; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZdBiUAsC9TwYl4EviHHOxOdmOPNq3h6ZXhUAiTYvAIubehdzzCS+XGIXO+swsmDzoPhi7Oc5TKiaED0mpknn8w8HTv6iyCEcN0zcVpnsWjE27CkPUeQJV5cqpU6HrnkzCjdMUFEaCuqALXR+UNigkCsguhgWa3ICyaUdXQsbOwmBt1bm5qUydUdL72c0l80rpbhH79LiaAJUlVsfTa5kU9b4qc+m34MvW0lTTzywomar3z4cInkYG0Cjtuy+euZgxefMu4bh1ciXeO6FL1oiw1Jh26tPhDWi07ukZJQuOJU/iuMdvfGy6ZA9T4MNvcpbqL+duF2xsuQZvTm34mS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyo7EOoUAPO698siwvT7e0tfq/nsxpgvemPXH5iooUU=;
 b=FhIWXhtCtdiHyAsJpmjo8Vcoet4fZKISNwYUAIb7Z+KeMrTsbk1gAlo9hKSgZsSYPIwvLoFDZE7HJZQcGy1uXj4TOILZANx19h51UNvNKHnap/KXSj6EZEdHVJbyahuidAREpUydvOJFNs0fnjTyqNDyqamaJmj6Ip8YppVph5gUo4FwndciHYAnVCmErZuryZgvvBOl+VaGSVmtnFEsDD+TCi80xfzXtAhad09O+OpMpVfcRqB9WkaEgmdT+foyZkIUfjlZl+9NhFOBzcr8jPfmVHiGK82OgnJyb2BoKxAdsrsCyKw/HyAEcayVcjG7pDr4ll37gljuePcxu+S0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyo7EOoUAPO698siwvT7e0tfq/nsxpgvemPXH5iooUU=;
 b=R552jMabDb7mpePMCD6v+N5XBomEfHimsgIIIHzXjtUU5a4Lm1kh9/67q7sfZRLunGIwvPOxGzD3hDBTB2oUz1+KwZUyjwKojIVBxlhpQnntT1YD01lZNYvtqavk97spog/HxnrgW+Z7/s0rhhkf17dZgYOWVukNMO97B5WUmIY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9965.jpnprd01.prod.outlook.com (2603:1096:400:1de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:22:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:22:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Index: AQHc8pGh26og7GjtHkeCuhYLGQ8HXrY0e8eAgAAAPoCAAABXAIAADYMAgAACtXA=
Date: Mon, 8 Jun 2026 11:22:45 +0000
Message-ID:
 <TY3PR01MB113469E3AB101C3552E721E11861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
 <20260608-alluring-remarkable-echidna-d107ea@quoll>
 <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
 <TY3PR01MB1134665BE4CE8FB734BCFAAAF861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5e8719f-6d85-4edf-a645-5be9be7ec980@kernel.org>
In-Reply-To: <f5e8719f-6d85-4edf-a645-5be9be7ec980@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9965:EE_
x-ms-office365-filtering-correlation-id: 3e3efff0-8efb-4c3b-538e-08dec55043e3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|11063799006|4143699003|3023799007|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7cjggVouGT3sPxm+AIRJEJDXXTY6iinsWTiYpg0i46fGp2PGkaTlSBNA7H65r2owlQZ4OxoAwdXqw2RhsPHdSiVxH6jrdixhK+3hlGK3IFlMJnAeif9K2Sg2VpygMaKdnTIuw6vIiWeJTYwx/kZSHDLv22rZbUNKYQVTAkqEQZhnxYswrJNvg4zrm0MU0n/qzK/UPIAVOacBlZ1bZhoD8VMV5lUAmXr/VASlpvLn1y3g6SKJNtQ9+WnlCVaak+XHyLngrYc6Ys+RVJZCqvrYBSv5dZBc2n2ra22VwqZ5N+WiLURDp76fdBMjyculviNJLH4iuON5wpZJheXTiRb5s4QUWSUH7r4epVX97R+8vdMWEe0iZAtHZowM7yXIDIKFFleGfjB4fD3sazAMJnhZZySd+DIfO/MWeNZ9y9xLaDVvixIN/cE53sn95s0aN5K/utGWB40SqXPcBsG7jwB3qj3jhsfQw358VqDsVMXAXNZ3EIDfkMhbOkvRxugHTuUy6OfbGBCv9r6YkZzZm2A1ldU5vPVBaFJmtymDQOYObj1DcpNh2rNK9FPk8e49qFgfxN9/+7M1jxn0qPTyXdId9/SoCu7wW0gCSgz87Ux2WSxskKi5JB4Y4wsYeixUGNfqwtOzk5vkbgdrTQFWqreVQL5hEIROo1oeA+ZWn1Ch1eNPJvXfHyRG+PHiQ7+q7KJd8xVw9A4wg8EwiuSYM0XjUuh5b3M4k8lgcIrKV13VYFIeyYFJIFncghY/aSZZimHU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(11063799006)(4143699003)(3023799007)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDlnbTgwY1c4c2dvSXJKdnJBQlNQM0lpYTdoQVRlQ3ZIQUFncXhFUkNHQnJT?=
 =?utf-8?B?ZkRJRjdXMEl0R2FyY1hwUzBWYTdCOHczYjE3UEY3cnBlRlRTU2xBVkZjMi9O?=
 =?utf-8?B?VXZvaGJVYlk5UU1SMXQ1OG5Ycm54UHQvSFVHZ3NlUnlFMDYwemJKOFg2OXhG?=
 =?utf-8?B?YkMvLzkreFRjVlNvWlYrR3ZhTzdLZi9sbEtrRUVnTEU1b1pZOEJ3Mkg5U2Qr?=
 =?utf-8?B?L1JoZ1NFb0hMWENINjdzWXI1dmF2OHZETjl1c3RlTk5kdzQ4WHUwTEQxSWdJ?=
 =?utf-8?B?cWtPTkZoL3VrZGdkYVh4ZHQ1R0xyeFBLeTZLQ0RVWjNTM0d5c09FOWcwSGl0?=
 =?utf-8?B?Z0RINWsxcDFxc3FlNUpZdWtDVndGVGxSSExYWWMyNkFoRDR5Zmp6eGFwR2p2?=
 =?utf-8?B?dkcrYXRjNUhYNURyRmJ1QTVDelV4TThqRm1PZ1dlWlFJMno5M0RQSWVtZmNk?=
 =?utf-8?B?dUIyTDA1UzFlTjhJZFdzTWRNYUMyVk1ZZVMrOHBlMW1WREpITnhYa1RBVUpF?=
 =?utf-8?B?bkNsQkYvcDJwbWNxNkpSZGhoSEVlTGk5RjRQVk1obGNlalNMdndTZ2ZXdkVG?=
 =?utf-8?B?VWM2OU95UzR2QzRpREtzUmNVU1dVRndTZnBnTnJnQWlQZzBNbTF2OXNqUlJZ?=
 =?utf-8?B?Q2wxZi9ELy8wdFNiR09zeE8rSElaTVpaWVNEWnFEZ0h3cTRlK1BSRU5pb0Uv?=
 =?utf-8?B?WFpHQk9mU1J6N1phNGR5NXVza2JycThEWiswSWJnelJzeDhWNmczZjJxSGNJ?=
 =?utf-8?B?RzJENVRYcEgzbkNQc3JQZ20xT2JydmlPS2czNDY5SHVOUE0xUVBJZkJxNmtM?=
 =?utf-8?B?TFlsKzR6dEx0LzJaenRwdDRDS3pDVk1QQldzNnVsTVZWOW8wbTVBVy9raVRP?=
 =?utf-8?B?ODBMVm5rbFFrYWZ2WXl4bTFqVjZCRlNTSnAzOFRRUmFBSTEyTVlpNGZ6TFQ3?=
 =?utf-8?B?TjZqblZrZWY4cVRpWDhVOEhVWmhGa3dqVXhwTjR3SU5MWXZqSnlDaUZBSHJo?=
 =?utf-8?B?aG5DK3l3endiS0p4enRZcmJpSVlPWFNqK3dUcWJNQUdWYWszS1JnSEl4U0tr?=
 =?utf-8?B?b0dEVHpINm1JRWVnU2E1NTdzbzE5M2FYTnVWVC9hbTR1MTdPdnBVZGdHZlNV?=
 =?utf-8?B?MmdNNVZhbTk4Z0U0OGttVWJaeGdEOHVJZi9JMXJkMWpBS1ZHMG4wNG0zRFE2?=
 =?utf-8?B?dUtXR093U2Vmd1BscG9MbzBNbk8waGVlUkhKSG9VR0llNGJWSUlHT3hrZFdi?=
 =?utf-8?B?SXZxT1FDMTE1SlhxVXZXWVhmeUswUkYxV3hka2IxSjIwSk1SSXBrNzJpSHc1?=
 =?utf-8?B?ckR0SUZETlAwMER2WmZzR1hzWkZVVWs3TEl0OVg4a1VlNmNMd1JNWVJjWnlP?=
 =?utf-8?B?S2h1VXJJK1l1ZXA5V0trWnN2TXAvdlMxWVZ3RXFCV1NGUEd0UlJmU0JxS1c3?=
 =?utf-8?B?UmR2QXVIYTVvc2l0elVuM0ttcVlaWWhNZ2pROTBTTlduS0lFbnNlV3NQSCtF?=
 =?utf-8?B?Z1NTVzFQeko3WHIzWTlobUhBVU1TU3kwMUFIUVowUnlSQWl6Mmd5ejNQRFlS?=
 =?utf-8?B?Qy9pZGRnY0JUd1ZIWVFXb3VDNUxWQjkrYXhKS1FLVS9GZ3pSZHFiRTFUYnVw?=
 =?utf-8?B?NitidmROdFQ1VDgwQVI1UjVDQ2JGZG8yckJDSlBUTnJRb1Q3eDM1US9Rblhq?=
 =?utf-8?B?SmprM3ZCSEZGZmpUamxmS1J2cFRCZFJ6ck9iT3E1VitPVHdtcmRhNDNSNmFY?=
 =?utf-8?B?bHg0VGNJMlpDbGZwblpaNGlxN3UwWWlFMUVadDlwZUV5OXcrR0U4algrcWJT?=
 =?utf-8?B?ZUs5NUMybkRZK1piZUxTenlOdTZRL2UvV3FNWEoyM0Nla2IwSWV5cys3Qk10?=
 =?utf-8?B?S1g3UCtjNEN5QzBCd0k2R0hLcmNNSmFUcmJjMWt1cC9hNTY4VlA4bForbzZa?=
 =?utf-8?B?ODZlWCtXaERtTmF3VGFuVU5OSDc1aXhZelE1OGVNc0ZmMnhKczJvczI3dmRL?=
 =?utf-8?B?Q0FBMHlQMXFhRHdyd0F1NFpPSmIrMWN2NTE1NStDT21WWnpPbytEdlBJNFhq?=
 =?utf-8?B?QmVhSnZGZHdWRTZ1cTNIU3VoVXluK0pCQ09mOU5QUTFGWUhKYjdOc3dkTXFC?=
 =?utf-8?B?Y1VlT1ZTQUE5WmxiVXg2dnRIeStrSGgxVWMxUUVFamQyeW9jOExqeE1ldXRD?=
 =?utf-8?B?QzhJMnlMUEIxbnVyeVVERW4wWVRHa3ZiOTFVQjFjUlEzeXg0aGFIN0N3RXRt?=
 =?utf-8?B?RjE4eXVhQWJwRVJiaFVKWHZMK3lsNkRyRlZ6WUhrdEs3c3V5OFYvMjdsRVB4?=
 =?utf-8?B?QkMwWFdsMU5QYTkxUTlsejg4L2x0Q08vdWsyRGt6NFRtSzVaV05PQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3efff0-8efb-4c3b-538e-08dec55043e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 11:22:45.9886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOEoPiKt9TVbBM1ynsby1gUBpmslT58RzM9adRGkXMZmv/zWz6KWb3wRrpbIpM80RsZ9n7tbHNR5Cl3CT57ziqvHx7dlrrGXF22Ccj8eFyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33656-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87180655A25

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxMjoxMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IE1ha2UgcmFuZ2VzIHJlcXVpcmVkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRz
LWNtbg0KPiANCj4gT24gMDgvMDYvMjAyNiAxMjoyNiwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkg
S3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMDggSnVuZSAyMDI2IDEx
OjIyDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2Nvbjog
TWFrZSByYW5nZXMgcmVxdWlyZWQNCj4gPj4gZm9yIHJlbmVzYXMscjlhMDhnMDQ2LWx2ZHMtY21u
DQo+ID4+DQo+ID4+IE9uIDA4LzA2LzIwMjYgMTI6MjAsIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6DQo+ID4+PiBPbiBUdWUsIEp1biAwMiwgMjAyNiBhdCAwMjoxMzoyOVBNICswMTAwLCBCaWp1
IHdyb3RlOg0KPiA+Pj4+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPj4+Pg0KPiA+Pj4+IEFkZCBhIGNvbmRpdGlvbmFsIHNjaGVtYSBydWxlIHRvIHRoZSBz
eXNjb24gYmluZGluZ3MgdGhhdCByZXF1aXJlcw0KPiA+Pj4+IHRoZSByYW5nZXMgcHJvcGVydHkg
d2hlbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcgY29udGFpbnMNCj4gPj4+PiByZW5lc2FzLHI5YTA4
ZzA0Ni1sdmRzLWNtbi4gVGhpcyBlbnN1cmVzIHRoZSBMVkRTIGNvbW1vbiBjb250cm9sDQo+ID4+
Pj4gYmxvY2sgb24gdGhlIFJaL0czTCBTb0MgY29ycmVjdGx5IGRlY2xhcmVzIGl0cyBhZGRyZXNz
IHRyYW5zbGF0aW9uLA0KPiA+Pj4+IGFzIHRoZSBkZXZpY2UgaGFzIGNoaWxkIG5vZGVzIHRoYXQg
bmVlZCBhIHZhbGlkIHJhbmdlcyBtYXBwaW5nIHRvDQo+ID4+Pj4gYmUgZGVzY3JpYmVkIGluIHRo
ZSBkZXZpY2UgdHJlZS4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbCB8IDE0DQo+ID4+Pj4gKysr
KysrKysrKysrKysNCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4g
Pj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4+Pj4gaW5kZXggOWM4MTAxMGQ1YTc0Li5jYmY4M2Ew
NmFlMjUgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9zeXNjb24ueWFtbA0KPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4gPj4+PiBAQCAtMjY5LDYgKzI2OSw4IEBAIHBy
b3BlcnRpZXM6DQo+ID4+Pj4gICAgcmVzZXRzOg0KPiA+Pj4+ICAgICAgbWF4SXRlbXM6IDENCj4g
Pj4+Pg0KPiA+Pj4+ICsgIHJhbmdlczogdHJ1ZQ0KPiA+Pj4NCj4gPj4+IFRoZXJlIGFyZSBubyBj
aGlsZHJlbiBhbGxvd2VkLCBzbyByYW5nZXMgcHJvcGVydHkgaXMgd3JvbmcuDQo+ID4+Pg0KPiA+
Pj4gWW91IGFyZSBjaGFuZ2luZyBiaW5kaW5nIHdoaWNoIERPRVMgTk9UIGFsbG93IHNpbXBsZS1t
ZmQgb3IgYW55DQo+ID4+PiBvdGhlciBjaGlsZHJlbi4gUmFuZ2VzIGlzIG5vdCBhIHByb2JsZW0g
aGVyZS4NCj4gPj4NCj4gPj4NCj4gPj4gQW5kIGlmIHlvdSB0ZXN0ZWQgaXQgb24geW91ciBEVFMs
IHlvdSB3b3VsZCBzZWUgdGhpcyBkb2VzIG5vdCB3b3JrLi4uDQo+ID4NCj4gPiBJIGRvbid0IHNl
ZSBhbnkgd2FybmluZ3Mgb3IgZXJyb3IuIEkgaGF2ZSBkb25lIHRoaXMgY2hhbmdlIGJhc2VkIG9u
DQo+ID4gUm9iJ3MgY29tbWVudCBiYXNlZCBvbiBzYXNoaWtvIHJldmlldyBbMV0uDQo+ID4NCj4g
PiBJZiB5b3UgYWdyZWUsIEkgY2FuIGRyb3AgdGhpcyBwYXRjaC4NCj4gPg0KPiA+IFsxXQ0KPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYwMTAyMjYxOS5HQTM5NjEzMjQtcm9i
aEBrZXJuZWwub3JnLw0KPiANCj4gTG9vazoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwNTI0MTk0NDU3LjQ3OTY4MS0yLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KPiBX
aGF0IGNvbXBhdGlibGVzIGFyZSBoZXJlPw0KPiANCj4gTm93IG9wZW4gdGhlIGJpbmRpbmcgLSB3
aGF0IGNvbXBhdGlibGVzIGFyZSBhbGxvd2VkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNt
biA/DQoNCk9LLCBJIGFtIG1pc3NpbmcgdGhlIGZhbGxiYWNrcyAic2ltcGxlLW1mZCIsICJzeXNj
b24iOyBpbiB0aGUgY29tcGF0aWJsZXMgYWxsb3dlZA0KZm9yIHJlbmVzYXMscjlhMDhnMDQ2LWx2
ZHMtY21uLg0KDQpPSywgSSB3aWxsIGFkZCB0aG9zZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg==

