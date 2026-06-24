Return-Path: <linux-renesas-soc+bounces-34392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vHE6O56rO2pjbAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 12:04:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D576BD2D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 12:04:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=B4X6ll0I;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0610A3004F6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 10:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CC23B7B72;
	Wed, 24 Jun 2026 10:04:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E273AA1AE;
	Wed, 24 Jun 2026 10:04:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295450; cv=fail; b=JL8pY+mPjnoQeImUQ94gYXHKSA6Q9F1dKH/vojGEpRaA7TA4MsHsCNQG388RVvLdQ44bDuz6xgMtYl7Yv1eviEZgyZn9fSwCq3bbxWdU/s+ynk2Zzm93I06hJ7ykQxeVNb4hUxa7K3nrkxZk2iUkdw8+GCkLDbeRT6S/9AfBXoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295450; c=relaxed/simple;
	bh=jjBZAQFwOAYq5iG8npk6m/wVWvVUj8SEC49CuVZkCSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=spWpR3m2U14CevWzC1KhCbl8EEwyJ0P3LHP2lxc2FZV3yPNnlYOuv5PmSvOhxjS7wGGLYLp5yBMw95U3tDZi23s4dHuPiF032ThaloPUlDUxm5Q1t6cmzixgVi1qwWlIBCpZWJRkhH8UCqPF9rtvmHhh4lWIQ42NILPyjj5+HRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B4X6ll0I; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9H1djdGC4qDiTzkiKSWWb+HcswKLSY5375Jr95NHjwj/Cpm0aaUiolD/s1fJfPW72WNHhWxLCPBpR5qv10vYl0EutrVCr4kaXDeNGeMHomM7WX4FfzggNXE8zS1bBqISfew5MV1cpoo0M4xlRSZyNJ32fs3gRalFBRbtoU6SG3p2RHxfyQgmcVPwbb0BjyL6XtXCcq8Wb1V4H9gw6QHvKpTcAFw/A4cNc66gZ78hbXzMu6rX54tztmLpnkRtyHjFnBT7754EEHT2Gg7OcCgWHSf3YvltwY7uEwe3BCCqkTSGoml8907P8nq2SFhvVGTAgIC9GxuqWmdjave2wrOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjBZAQFwOAYq5iG8npk6m/wVWvVUj8SEC49CuVZkCSs=;
 b=KvKq9cKKoC1obnbLa3nN3LgTGavGySkcaLdchTJVY1MpFPXnhO2+NuzdwjdDdTOBjpeG1g/NT5JMqfsCZASRGEpRdD2pIXEOCVLrdQTxKJWpKZldTpqaNMqhg0GyImDl2CPn+Sq0/jxG5+Wz/bJWu9f6ArH4eTt75QLjDKtiZLMGKVN+0CdSUG2lBF+i7G9fo8i5KIiR3WRTIYjJyAhjAEGW5hNk+l/1axJY7QUp4YjMavKDqgPtBstm0rjrR1XtaQTbkM9ZLgca8iKFLIHeWl9bjKkGFA/djZpX0SR4UNsdm3Fky9AkJeUy1aFAGHOc++cIRd2BW/LVG9fK0fsb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjBZAQFwOAYq5iG8npk6m/wVWvVUj8SEC49CuVZkCSs=;
 b=B4X6ll0IujaqdVUfMZ4wE8X5GZJ6QO2405IqYUG6OPoNDf/E4NnMmagLR5WzMsHx+uRM/9S8r+ieVnpU9eCXNtVNP2kJLBLdvZ4iyy2RmaVeftTTS03JX4ugu4yC62j/I1bG3uwKY4zq1Dh0q+/d4Ax8pVFBzuyy/BB+NWVXRIg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11026.jpnprd01.prod.outlook.com (2603:1096:400:3a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:04:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 10:04:04 +0000
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
Thread-Index:
 AQHdAyw/4ueLfPD53keQC6SpXGUnQbZNdPEAgAABB+CAAAHdgIAAAMkwgAABpACAAABWsA==
Date: Wed, 24 Jun 2026 10:04:04 +0000
Message-ID:
 <TY3PR01MB11346E835A619CCE7C728C25486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll>
 <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org>
 <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <610f349f-b88a-440c-bae2-14199d047d12@kernel.org>
In-Reply-To: <610f349f-b88a-440c-bae2-14199d047d12@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11026:EE_
x-ms-office365-filtering-correlation-id: 02a88e66-15f5-48dc-4ec4-08ded1d7ec51
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|4143699003|22082099003|11063799006|56012099006|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 DeYevxtmC7rc2Yo+NVdX84luaxr506FcJn8NgKg1Vjm961RJtXsAhLfopHNtgvPrIFOTvAwA12njrzEbab0kSjLq3RB2CVmYhYoiXGP6iey/vsi1yloUZ9xzKWRcZX71uIDcxoxTV3lHtMbgkq2iPa4V4pvcUc9434O1qplbGzQgJb/B5jiHuUxnJQHS/SYEj8KzzRGdvPSAFXYCj5NI+FuOppRhpeVdqAPdzptntMLNDTXdoAIP3pzhY7lJuokQo+9ur5CXQ1DxC9d0Ehg++lIlif/W3vKq0Ue3jhP6j0Hvjv0kAPaLgrP27T/bpgLrtCjjP9928iyVNzJJXm0tvDBxmpDfcNVn1M6OEmmLMBI/WI8I0oLIZEg3tqKyG7L8MGkwQoiu/tMW/qb2QmFrrGyp1rfehSHWBGs9+R0g2guiRsy7y6t+7L72gvmCaD05cEH8rSKp1KBAjT3QSvhThq9u1FyWlKSMOpjc8rQsR/d4hsDwM4g985NOWIHodeC1v97ud6i69IXSCBwY7PRDRO2hew+e/0TtcGZ/VUXeruSd0BGrQOASa2QFkB3tbNlWDGVCf9ziWL2o+9mPnTB2tYhtrQsNL2jps4GO5Q4vgHpA49FtjrYo8IK9ixmOyCBpsHsIziKk/hMFWGsBm8FuPXmX+LSSQB1WMjm1H+DzFs09eQ7Wg61c+rMstuvmncwRlaZJFyq0tduczclwsnUq5QU6FbtaUJ+XHc8hhbjuHJk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(4143699003)(22082099003)(11063799006)(56012099006)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUpWZ09PTXJWSFFSRTh2SGJTQzM5TkswYWgxN00yWCsvVGRDMnRHV3NLaW1O?=
 =?utf-8?B?ZUhwQ3QxM0VoUWxRekRaTU1KdFV4ZG16WWI5L3htWTk3Q1RUS1ZlM0pjc3Ev?=
 =?utf-8?B?S1FxY3VVczc4ZFZlWU41eXpNNGM1THNLQ0grS28yeCtlbWo1THZyUmdkRU83?=
 =?utf-8?B?YlNXRFhJNmZZQ1o2VHRRT1ArQ1BqaDJLL0oxRFR2UWNJVlV6cGIydzlvZFVG?=
 =?utf-8?B?TjZDOUIyM3F0a1BwV0xCaS9uT1Rna0traGpTNFY1eVN0T2I0MnlJUlJmU0xQ?=
 =?utf-8?B?cXRaMkQ0czdWZml1NTF0ZkRXekdrNTByRWw5SGhnOXhVYjMvMVFhc0gzeFZJ?=
 =?utf-8?B?ZDZMNlBJRE5qdFM0T2EwUCt6ZUN1c2hNeVNtaFN3SzB2RFowMlNtZ3lhczZO?=
 =?utf-8?B?N3I5bmtuZHVDMEx1V0pHUk15T3lXWXZESi8ybHNQdDFvaVRPaDhXZFE5TkVv?=
 =?utf-8?B?Y1ZiYkZVRVAyQWkzYVpiSWc3aVNWQWNiYWo1cnZKOUlmT1BDT1ZiWDcvVWFJ?=
 =?utf-8?B?RlcwelR5UVVEMFltR2VIL0puS01RazhQUVEwR2NyaUhtc0hTdE1xcU0wY2NK?=
 =?utf-8?B?MjliRDdXdzRUckQrL1A5cWNXR1VESWNCTjEyYk5oQlpRUENQL3NUZkI5SzE2?=
 =?utf-8?B?dDREQm11VUJGeDIzQ0tJWGtBYjk0WG5MTE1oNHNEWnoyNEtqK3ptQWwwSmNB?=
 =?utf-8?B?dHlWQklEbmZpSjB1a1ZzRkJ5Q1EwTW03VEg3b293YmxZY0ZHaGJsMndkMFFm?=
 =?utf-8?B?ZmczbTFXTjl6clQ4VDg1NmM2YjNteWVGdmdLbjQxQmdpVkR2MHFSVk1RVTcr?=
 =?utf-8?B?d1F1b3pqOHdCL1JuY3VpTE93b0tYb1pROGdFdzcxbWxuTklIOHpsRDlUOGtJ?=
 =?utf-8?B?OUwrSE41cHY1aXB5WjBPaHF6djJmUmlSWmZVWUxoTGtxSEp5U0dLRVFBWWJ3?=
 =?utf-8?B?dXRNTEVLSnVUSkg5T1V6dFd3ZXVoOFM1eDg5Yi9Gb09WUjlTYmR0c0lYUWxO?=
 =?utf-8?B?TnlrMWJ5bnpDdk9JTU1DbklrRXB2Kzk5ZlJVK3NJallRYUp4OVdoOXJVSWNN?=
 =?utf-8?B?MFUwSEFleG5lWXRtaU85UTNGb0NqWTBmMWRNdERxTTZ6U1BpWGRKV3ZFVEtu?=
 =?utf-8?B?aEg4dEJRc09td0lrQTBud0w4MjJXVThMVEZOT3ZUSHdSYXN0eDdLRXJ2aGg0?=
 =?utf-8?B?aVFGNUFTRjRBQzIwZWpwdHdlM3E3WGJjZndjMzNLK1RKbVFPQnNTZXhPRnNr?=
 =?utf-8?B?Y1k5MFZpS0lNMG9rVkx1ZkdpZnV0MSszaFc5QWNEU3pMTTVlM1pydGFkU0Vl?=
 =?utf-8?B?VkREc01LN3ZOTkFYc1J3VEozTnQ1SThlZWRHbHp3bEpFY0tpc2lOYzFteGlZ?=
 =?utf-8?B?TUloRTZqQmdLOGM1cFVBYTV6M1llSDdEbnBST3N6NExZTkNpK1BSVnFTeUxB?=
 =?utf-8?B?ZkZVYW1nMzRoYnd2K1llNkp4VVNBb1NHczdTOVBQSWVSMDJoeDh6ODBheWwx?=
 =?utf-8?B?S2J3Z1Vmd1IrY1h1NTdEa2NhWnV3TmZUeXUyZ21EVWJHOTRaenlvV3hQbmFj?=
 =?utf-8?B?WllIZmNCZkEvdi9HbG1ETkJydkJtMzAvaUYxQWxka01HMEZvbktOdU5KU2ds?=
 =?utf-8?B?cGd1NUxxcmsxODArenRKWUJELy9yV2tmeHFKeitKcEZ2VEowMFkrZExkY0Jv?=
 =?utf-8?B?NWt0MnkwTUdzL212NnJ6SGlhQUxsZUFObGI2eUxGRW90NVpUNEM1cGRIZmV1?=
 =?utf-8?B?UDVaR3UvbzRaL2RrUDA0L1BleDhrOVNXdGZ5YXRlY1QwK2Y4c09ZTkRYeEtU?=
 =?utf-8?B?Q3pWZElpalpyUGFmdnpOeTJabVlPVm5NWUgvYlUxOE9yay8yUmFRYjlyMWxz?=
 =?utf-8?B?WG9aWVU0alduSllNcGdmem44bytGNzYrWE13WHNBNCtQUGFYbFdPa3BUaVNz?=
 =?utf-8?B?ZFBSMGk0TFl2SlNyUnNVd3FxUVF0NWN5YnU3U2s3T0tVay9DWXNNaDJTeFJQ?=
 =?utf-8?B?bWJJUDhib0FXK0tXeXl2VzNrL0hiazEzaEpvWU5KZU83QlJsUkQ0c3NLOSt4?=
 =?utf-8?B?eXFlM01WUFZHV1lsWGdLWnBCOTRQNFMyWWx6TWVRektKNFZtVWp0dHlNelBw?=
 =?utf-8?B?bWJLeHd1OElNU1ZSVWxsSElvSG1TMTFjc05aaWpyQzZSaWp1YWVvL2c5MjM3?=
 =?utf-8?B?eFhXWng0dmZGbWpINm9QL2ZnejQvNzRDYlRuYU1SemdhVDBSL1N5SDB2aitU?=
 =?utf-8?B?dWFXcFE2YUdHWTU3MzAyd1pJNFg5a2tJZ3NnVU5nSFd3NlJSUUxzS25YU1A4?=
 =?utf-8?B?ZEFuZ0wvVUVFd3JQYWVCQlE0YkgyNWxwbzU2SDdBcFRIRllvdk5XQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a88e66-15f5-48dc-4ec4-08ded1d7ec51
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 10:04:04.6043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWMwJqeSY1Xt3+bqdGxjIVbBixKLkEfo6TPYw+gPjf+ficOdPqLDhwq1Q23AdPHHe2iX6FRCnorvPN+CttgZx+xD3L+qESH3Z8n0aLGm+gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34392-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48D576BD2D3

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEp1bmUgMjAyNiAxMTowMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogY2xv
Y2s6IHJlbmVzYXMsdmVyc2FjbG9jazc6IFVwZGF0ZSBtYWludGFpbmVyDQo+IA0KPiBPbiAyNC8w
Ni8yMDI2IDExOjU5LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tp
LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMjQgSnVuZSAyMDI2
IDEwOjUyDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBjbG9jazogcmVu
ZXNhcyx2ZXJzYWNsb2NrNzogVXBkYXRlDQo+ID4+IG1haW50YWluZXINCj4gPj4NCj4gPj4gT24g
MjQvMDYvMjAyNiAxMTo0NiwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBLcnp5c3p0b2YgS296
bG93c2tpLA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+
IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4+PiBTZW50
OiAyNCBKdW5lIDIwMjYgMTA6NDINCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5k
aW5nczogY2xvY2s6IHJlbmVzYXMsdmVyc2FjbG9jazc6DQo+ID4+Pj4gVXBkYXRlIG1haW50YWlu
ZXINCj4gPj4+Pg0KPiA+Pj4+IE9uIFR1ZSwgSnVuIDIzLCAyMDI2IGF0IDA1OjIwOjM3UE0gKzAx
MDAsIEJpanUgd3JvdGU6DQo+ID4+Pj4+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPj4+Pj4NCj4gPj4+Pj4gQWxleCdzIGVtYWlsIGlzIGJvdW5jaW5nLiBV
cGRhdGUgdGhlIG1haW50YWluZXJzIGxpc3Qgd2l0aCBteQ0KPiA+Pj4+PiBjb250YWN0IGRldGFp
bHMgdG8gdGFrZSBvdmVyIHRoZSBzY2hlbWEgbWFpbnRlbmFuY2UuDQo+ID4+Pj4+DQo+ID4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4+Pj4gLS0tDQo+ID4+Pj4+IFJlZiBbMV0NCj4gPj4+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9hanFXZXZvZkVKM2Z2ODU2QHJlZGhhdC5jb20vDQo+ID4+Pj4+IC0tLQ0KPiA+
Pj4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyx2ZXJzYWNsb2NrNy55
YW1sICAgICAgICAgIHwgMiArLQ0KPiA+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pj4NCj4gPj4+PiBQbGVhc2UgYWxzbyB1cGRhdGUgTUFJ
TlRBSU5FUlMgZmlsZS4NCj4gPj4+DQo+ID4+PiBJdCBpcyB0YWtlbiBjYXJlIGluIFsxXQ0KPiA+
Pj4NCj4gPj4+IFsxXQ0KPiA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTXVITWRX
MC1Xc1p1dWM3UG9WTkM1REJVb1k5ZFArVUxtR1RRNzYNCj4gPj4+IFZXDQo+ID4+PiBNT19TanBi
dVFAbWFpbC5nbWFpbC5jb20vDQo+ID4+DQo+ID4+IEp1c3Qgc3F1YXNoIHRoZW0gdG9nZXRoZXIu
DQo+ID4+DQo+ID4+IFdoZW4geW91IGZpeCBzdWNoIGlzc3VlIGxpa2Ugd3JvbmcgZW1haWwsIGZp
eCBpdCBldmVyeXdoZXJlLCBub3QganVzdA0KPiA+PiBvbmUtYnktb25lIHdoZXJlIHRoZSBtYWlu
dGFpbmVycyBuZWVkIHRvIHBva2UgeW91IHRvIGZpeCBpbiBvdGhlcg0KPiA+PiBwbGFjZXMgYXMg
d2VsbC4gSXQgaXMgZ2VuZXJpYyBydWxlIGZvciBidWdzIGFzIHdlbGwuIFRoZSB3cm9uZyBlbWFp
bCBhZGRyZXNzIGlzIHRoZSBtb3N0IG9idmlvdXMNCj4gZXhhbXBsZSBoZXJlLCBiZWNhdXNlIGl0
IGlzIGFsc28gZXh0cmVtZWx5IGVhc3kuIEp1c3QgdXNlIGdpdCBncmVwLg0KPiA+DQo+ID4gT2ss
IGJ1dCBib3RoIHBhdGNoZXMgd2VyZSBhbHJlYWR5IHF1ZXVlZCBieSBHZWVydCBmb3IgNy4zLg0K
PiA+DQo+ID4gVGhlIE1BSU5UQUlORVJTIGZpbGUgcGF0Y2ggaXMgOSBtb250aHMgb2xkIHBhdGNo
Lg0KPiANCj4gDQo+IEhtPyBIb3cgb3Igd2hhdCBleGFjdGx5IGlzIDkgbW9udGhzIG9sZD8gSSBk
aWQgYGdpdCBncmVwYCBub3cgYW5kIEkgc3RpbGwgc2VlIG9sZCBlbWFpbCBlbnRyeSBpbiBuZXh0
LQ0KPiAyMDI2MDYxOQ0KDQpOb3Qgc3VyZSwgdGhhdCBwYXRjaCBpcyBwb3N0ZWQgb24gU2VwIDA1
LCAyMDI1DQphbmQgYmFzZWQgb24gQnJpYW4ncyByZXF1ZXN0IEdlZXJ0IHF1ZXVlZCBpdC4NCg0K
U2VlIGJlbG93DQoNCj4gT24gRnJpLCBTZXAgMDUsIDIwMjUgYXQgMDM6MzQ6MzhQTSArMDEwMCwg
QmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4NCj4gPiBBZGQgZW50cmllcyBmb3IgUmVuZXNhcyB2ZXJzYWNsb2NrIDMgY2xvY2sg
ZHJpdmVyLiBXaGlsZSBhdCBpdA0KPiA+IGFkZCBteXNlbGYgYXMgbWFpbnRhaW5lciBmb3IgdmVy
c2FjbG9jayA3IGNsb2NrIGRyaXZlciBhcyBBbGV4J3MNCj4gPiBlbWFpbCBhZGRyZXNzIGJvdW5j
ZXMuDQoNCkNoZWVycywNCkJpanUNCg==

