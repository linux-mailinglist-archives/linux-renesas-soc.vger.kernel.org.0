Return-Path: <linux-renesas-soc+bounces-32360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPe6AIqiAWpKhAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:34:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8750AFA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 339AA3027306
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A9D3BADAA;
	Mon, 11 May 2026 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X4vybbL8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300820E334;
	Mon, 11 May 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491016; cv=fail; b=Ip3SuPWIywWFMFbVhCEeFGEymCYM1qE5YxyVxYRkcgLZf6dN7eus4HVV1ebl6QXwgUWNfAs6npJNUeAJaXUHPoZjY0qajcPf4E9VfQzRf9BIHl1W5kflUscGmxMQ205dNMkkBlX33h/yd3s1anByja5BgsdFC2u/OHgiBWICWtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491016; c=relaxed/simple;
	bh=5yW5vStuf2GF5ajWxAV11BxJ8yCSHzxMfa0v52AzJmI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xl9o5MciVICZYvfSvSKs7uN0EuIzsigFIdupg47ZptPz/0/05NHWQ8cb6/1XN5/Zw5cd2+deuW/yXe8B/1URCG+cyhEeGpwH5tP6ng9DmoW/hvUaU1U/m2SRe1pM5Aeg77epMXN5y6QJJ4B4pantFdkG3NafjixhtcGMCVjpwVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X4vybbL8; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrUvE0GC/nW0TYnKE3rModXa+eJgBytnweb9I5EeoQjtJ4jYpTuC1snwnb29H8HDnDm7pIZvRoyFFn/Bc9inlULiPcRsCXT/+5khQTrInbpu8LtlpqYdn57LtEHTUqx/aSrJgaZhSw/e6mDDeNOq5kOSSTi0zUGhH9xBh5nUR0BVF6GasG+kYV8urN0Mq0IwRug40lrIFsHD13nysLvA2wSu9w5Fgh6CJ9aHb99bBH2tFgv9UTvR9QyeD89msWctImXpe4eKZ0p2zudjIPCr8NsnxHBjlbidXP1x0TIPyI+MRaIUXiplVduRGufN9p2dM+kfSkh2I3ZrhIrjES7BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yW5vStuf2GF5ajWxAV11BxJ8yCSHzxMfa0v52AzJmI=;
 b=gvMd4a/NBX089D330xaaR9m8oUkyKeGAEGEEEHf1B8wKXv1LS0DQSkjeYDvdrT6vO4xHucMoJHq6Xz51xZHIepGUHlLRTUXfymA97MwHdO7cTj9jV6ZX5yKTGC+9nkraANSR7UnAdTYxSxqDgJj3pZ387AjBwlWDZCDkIAv9/G4TGPK10UXxGOIY/taOlu2p64l+7e4y/fnMdwL+rTC//M8YWQbN2xmaEkKJrL3nfj7hgZ9+LbMCzwZxPQVL6r/ZxB5CKrQltWi0oW49eNG2zjoX8UGXU72tXtOr15ajvb0WgTj5fv5WbSQzAx1w5Dg6csR/0Elal/bREiDLrTnd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yW5vStuf2GF5ajWxAV11BxJ8yCSHzxMfa0v52AzJmI=;
 b=X4vybbL86BaArxZ5D/mrt4FxUCi8SKG2W0M7bKfBeMV7+tOYvH+/5dXrb9Jox946JpLxvzWq3YyP2TQ6XxepLrcraXiLsYPK3q8SyC9Vh45iHl3APMiscjmbpBCZkoOB/2/PfyIRIpunyi/kq+X3yHbVKrLOgT4rP7WrDOWOJ68=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TY4PR01MB15657.jpnprd01.prod.outlook.com (2603:1096:405:2d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:16:50 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:16:49 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v3 12/13] net: renesas: rswitch: add handler for
 FDB notification
Thread-Topic: [PATCH net-next v3 12/13] net: renesas: rswitch: add handler for
 FDB notification
Thread-Index: AQHcwPXQ97XM2omt00CQ1unu/MWXwLXLwRuAgD0KRqA=
Date: Mon, 11 May 2026 09:16:49 +0000
Message-ID:
 <TYRPR01MB1428405271FFF79A580628EAB82382@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
 <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
 <09e99e68-f7b1-415d-b1ed-efe632432222@redhat.com>
In-Reply-To: <09e99e68-f7b1-415d-b1ed-efe632432222@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TY4PR01MB15657:EE_
x-ms-office365-filtering-correlation-id: d6afce13-4934-4dee-52db-08deaf3e0888
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 987gxaDjKe/8P1j8JdZ31lOdTHLKxDvgV3jmPZwuPDZJ+RAlkK3x4GYm3C9abx/+8OtKHrqbW8tAur0NtjnfTY7SH2g3j2/HyL9rw9J1WpKqCuck81nbZqfgUyazpCK2FwAMDqfy4wux0WrE11TtBOdW8+oGeiZkmcJ+Vji2vwpieboTcbrs1EnT72E+rpopq8xo1wWgLFimOzXb7QBVGxxatlCN55KApVsuEslBl/SXcE4mTRcQFEAkBwOltGHbH1r7ZfLzI2ZlLImJ3zK6vgIBMlTCiF+WBX89LC98BTRt9kMDsza2axvQ9bSgl4fT8534Oenz95J2nHYvQ1o9Giw/OuGYVzJR0tXVIQpE58ObncMPC6czGgWyb0KB14wYtCuGL2vAtnXWeMPkiZDjeY/je/DKybZFyjKqQyioFPAjoBpQFGCz+m7piDTAtjMTvc5uwTCIbotj6nvOdmPI/1M3ZWyF9/opCfa1+j8Mhv/u4B28uq7vCPGIgWAGQat6hvX+lNIPiLmOEA1B5OsozieInTRW2wqB1CopcTHgySghEsy7OqwP6dhnjWvKGj3a3xXCVAzD+Y/gAn/F7RmDyogJiAop4nNrgsOo3ETGNodEa/JN5bCguEAgrAFJ9Xi9DRJwrJyTpdnpns6bEKafyKMJt3L5O2oQ0GSqwRSuO4GY+TSQPan0wRrAaIKpnuUIHapkci/212Tj7CH9oj8Q3FVrPECs8SJUTMCBmj7L1tiDAMeBW6gw8Z0xE/Bp2SXx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkt1SDQ3NEUxTnhwbEJIMis4TXN5dUd6QjI2RzVmekNPNmYvSTdzcVpYRTZL?=
 =?utf-8?B?UldHQURheVJsNWZ1MzhBcDF5Nk9lc0YzSWlQdWdXVm5BeE1NVGJ3L1hLQk01?=
 =?utf-8?B?amNXbGlJdUR4b1QzczArbFIxTUxjd2t1NjZxQlV1QlRYWEJPZDRXREZZRXB5?=
 =?utf-8?B?ZFNUL29obUhjMGY3M3lXaVpjVGJkZ2tPNVlLbjJQU2tYVXRia1M1OVZRQVlB?=
 =?utf-8?B?ZXIxdEljZDVLSzQrS2UwMzJ6YUVDRk5BbFcxdTQweHhXcDcvUjNXaFdndVdP?=
 =?utf-8?B?VXVIZndIdXZjSS9DN2pEM0FTczU4TkQyOS95TmdEOFdncFExS04rZEpjcERM?=
 =?utf-8?B?aUZhQlp6bWVnZXVVVkt0SVRscTNtcnZ2WEVWMFljMVEvcGJMQjE2RS9lL0pN?=
 =?utf-8?B?RDQyZFcwUlFyWkYyN3QwWGUyZ09SclBaWGtrQjQ4aE9mS0VocTFIcEZESjNa?=
 =?utf-8?B?RVBLanY0cmxmRzR0Y1MrbHZJR3gzUURCVGhpUVZLRk1IWG5hNUw2WjhteWtS?=
 =?utf-8?B?UFh4RVo1MnJvR3ludmVBYVFXQnZyeGNTTTZVa1ArbW5ERDFHcEhnRW1acnNN?=
 =?utf-8?B?SDJXOXdIZDNYems3ZDhBYUdJQ0YxNzBMTUJIeDJPMlFoOWphSSszT1pvMUdH?=
 =?utf-8?B?YnhYYUgyZGFDeEpCWmJHbDZWQURENlIzRzhSMXFZdkczV2hiUU1Gczc3cWZM?=
 =?utf-8?B?ZVFEY3RsbUc4c3p1T29DUlQ0Rkl6S1RSOU1EMEo5ZDdoeXYwMk5CNHVxdTNh?=
 =?utf-8?B?Ukc4Z2N5dTVLdUxXdXptWWh0dm1WdVRBbWw4WWNFcGdvMHNGK1B2RmsxM1Zi?=
 =?utf-8?B?NGRzd0VlM01EV2lXVE5DcHVmY2FsSjhtMjBWbVBFbDgycUJsUUJ2WmFhV1Nl?=
 =?utf-8?B?bklGVHBrL3YzbGRLZWhGSVZzTUJudEJBazlKU01iMnRPRzR3L1c5NnB3Y2x2?=
 =?utf-8?B?VVF1Q0x3Qms1MGQzS1V4ZkQwd3lJcE5sbDJ3YktBU2JldXpmTmhjdXFXbGMy?=
 =?utf-8?B?Rmh2UUJNOWZKNDI4UVpQNVpjOXJDMnlYeWZJK01RTUpNQWpjZVkrcXpMWGFt?=
 =?utf-8?B?ZUpCc1pUSGhxL0h6V3ZnNGxXMUZPRjlqRWxLcWJZLzVEYm1NeXZvZ1FKeGpJ?=
 =?utf-8?B?K1diRGdwcVN1SGVkcjV0aHcxZFB6bGozVzcvTmxDLzNoKzJMRFBpSG91eTFK?=
 =?utf-8?B?ZUxzN2xlNVNkcXJoclU3K3hKQy9uSGhxVHNuQWZ3TWtIYTRqRC9zZ0lzbXdQ?=
 =?utf-8?B?T3lDWXNXY3czZ3ZVcWxBazhycVlEc294akJid29RanFzN1Y5NW1yZGg5MU45?=
 =?utf-8?B?RUhZY09NOWVqQXhuMWRlTU05eTlCNmNIQXAxc1Iyc0RIc3NrOFZPamVzdDVY?=
 =?utf-8?B?eExLeHVST1ZmcnVkTnBCd0xKc2M4V1dCQUwzR0ZsOFZaU2hleWJrZ3B0b0xB?=
 =?utf-8?B?UlBkbTl5U29UNE5hNk5JcWhUQVdaOHpFb28vY1duNmZnSjMwSlV1ZjNqajky?=
 =?utf-8?B?OTdmbkJOTDRTa2ZSSjJaTEd1MmhUVHJKK0R6OVd4b2NXRnV6UmgwWGZpN0p1?=
 =?utf-8?B?RmR4cytBREtPL2NNVHE3V2t5ZzRlU3JOOEM0a1kzczNDNjhrRVNDNzdmdFAr?=
 =?utf-8?B?L2RGMlpyUHFKTzdmaS9vNDVSYXhDT01FcG5FZk5CSG1vNFM0R2ZoOTE3LzVT?=
 =?utf-8?B?eE9pQ2tDb21aSTVTcDBXTll5UWczOGxyVVNFdUNmZlorK09tT29UNkFqaWZC?=
 =?utf-8?B?N0RlKzQ5c3JCMXo1S0Q3b2kzbldnWjUydzQ3SEFlaUl4aXlXc1I0REJoOUNp?=
 =?utf-8?B?R1BOQjFnK245MzFJNVgyVnhOaFNLdEpFMFlMdzFlZlVTZUorR2hlSlI0RnVw?=
 =?utf-8?B?SlZRQ3FFdm9lNDJPV2hqVVdaLzl2SUJRanMzNElZRmo2bVRqQWNPckNCOEU3?=
 =?utf-8?B?a08rb2dQelMzU1N6azUwK0lTaGpHdlFURkxvVXphbmZjbFhTc3Nic1llSmRp?=
 =?utf-8?B?T3lRL2FqaVljS1pTd2pyZXh3UytGNWhXditTQU8xTVgvOFF1QW9lOFZXNVR5?=
 =?utf-8?B?VWR4S0s3NFBWZ0ZSSXZzWjZFenE3Z0tYUk0xb2NBODlhT2szdlVKRkVpOHMv?=
 =?utf-8?B?R0xvVDdua0dwRHJmZkJrd0pRWVZkeXNPbHMrNjZYdFpCZUFNeGlXcVBBZXZl?=
 =?utf-8?B?VzJTbTVpNVByZnFFcmdtb2xVV2J4K2RNeUJjeURobXBtY2VvSm1yWXZYM0xE?=
 =?utf-8?B?Z3luOWpoWCtFdnVXNmhYdzhVcHVybi9qUGpYUnJYekZhZmh5cm4vbHdFaVla?=
 =?utf-8?B?U01QN2wxdWN6M05Wd1BTMXJla0NmMG1FU0FQcFNqSm9VUWNUbDhsdz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6afce13-4934-4dee-52db-08deaf3e0888
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 09:16:49.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3bQ3+6L+EGYr7+ggZS0CFK0aQwnqVEcWnJYQ+U1udmZr49j524mFVQQ2smc0lwtXE0orsOKbcBQJ7tfVbVm/bc5NN5uJBszo3KYSVynppI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15657
X-Rspamd-Queue-Id: 67F8750AFA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32360-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pbarker.dev:email,davemloft.net:email,lunn.ch:email,ragnatech.se:email]
X-Rspamd-Action: no action

SGVsbG8gUGFvbG8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgY29tbWVudHMuDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUBy
ZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMiwgMjAyNiAzOjA2IFBNDQo+IFRv
OiBNaWNoYWVsIERlZ2UgPG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT47IFlvc2hpaGlybyBTaGlt
b2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT47DQo+IEFuZHJldyBMdW5uIDxh
bmRyZXcrbmV0ZGV2QGx1bm4uY2g+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5u
ZXQ+OyBFcmljIER1bWF6ZXQNCj4gPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNr
aSA8a3ViYUBrZXJuZWwub3JnPjsgbmlrbGFzLnNvZGVybHVuZA0KPiA8bmlrbGFzLnNvZGVybHVu
ZEByYWduYXRlY2guc2U+OyBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj4NCj4gQ2M6IG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1u
ZXh0IHYzIDEyLzEzXSBuZXQ6IHJlbmVzYXM6IHJzd2l0Y2g6IGFkZCBoYW5kbGVyIGZvciBGREIg
bm90aWZpY2F0aW9uDQo+IA0KPiBPbiAzLzMxLzI2IDEyOjA0IFBNLCBNaWNoYWVsIERlZ2Ugd3Jv
dGU6DQo+ID4gKy8qIGNhbGxlZCB1bmRlciByY3VfcmVhZF9sb2NrKCkgKi8NCj4gPiArc3RhdGlj
IGludCByc3dpdGNoX3N3aXRjaGRldl9ldmVudChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0K
PiA+ICsJCQkJICAgdW5zaWduZWQgbG9uZyBldmVudCwNCj4gPiArCQkJCSAgIHZvaWQgKnB0cikN
Cj4gPiArew0KPiA+ICsJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBzd2l0Y2hkZXZfbm90aWZp
ZXJfaW5mb190b19kZXYocHRyKTsNCj4gPiArCXN0cnVjdCByc3dpdGNoX3N3aXRjaGRldl9ldmVu
dF93b3JrICpzd2l0Y2hkZXZfd29yazsNCj4gPiArCXN0cnVjdCBzd2l0Y2hkZXZfbm90aWZpZXJf
ZmRiX2luZm8gKmZkYl9pbmZvOw0KPiA+ICsJc3RydWN0IHN3aXRjaGRldl9ub3RpZmllcl9pbmZv
ICppbmZvID0gcHRyOw0KPiA+ICsJc3RydWN0IHJzd2l0Y2hfcHJpdmF0ZSAqcHJpdjsNCj4gPiAr
CWludCBlcnI7DQo+ID4gKw0KPiA+ICsJcHJpdiA9IGNvbnRhaW5lcl9vZihuYiwgc3RydWN0IHJz
d2l0Y2hfcHJpdmF0ZSwNCj4gPiArcnN3aXRjaF9zd2l0Y2hkZXZfbmIpOw0KPiA+ICsNCj4gPiAr
CXN3aXRjaCAoZXZlbnQpIHsNCj4gPiArCWNhc2UgU1dJVENIREVWX0ZEQl9BRERfVE9fREVWSUNF
Og0KPiA+ICsJCWZhbGx0aHJvdWdoOw0KPiA+ICsJY2FzZSBTV0lUQ0hERVZfRkRCX0RFTF9UT19E
RVZJQ0U6DQo+ID4gKwkJc3dpdGNoZGV2X3dvcmsgPSBremFsbG9jKHNpemVvZigqc3dpdGNoZGV2
X3dvcmspLCBHRlBfQVRPTUlDKTsNCj4gPiArDQo+ID4gKwkJaWYgKCFzd2l0Y2hkZXZfd29yaykN
Cj4gPiArCQkJcmV0dXJuIE5PVElGWV9CQUQ7DQo+ID4gKw0KPiA+ICsJCXN3aXRjaGRldl93b3Jr
LT5uZGV2ID0gaW5mby0+ZGV2Ow0KPiA+ICsJCXN3aXRjaGRldl93b3JrLT5wcml2ID0gcHJpdjsN
Cj4gPiArCQlzd2l0Y2hkZXZfd29yay0+ZXZlbnQgPSBldmVudDsNCj4gPiArDQo+ID4gKwkJZmRi
X2luZm8gPSBjb250YWluZXJfb2YoaW5mbywNCj4gPiArCQkJCQlzdHJ1Y3Qgc3dpdGNoZGV2X25v
dGlmaWVyX2ZkYl9pbmZvLA0KPiA+ICsJCQkJCWluZm8pOw0KPiA+ICsNCj4gPiArCQlJTklUX1dP
UksoJnN3aXRjaGRldl93b3JrLT53b3JrLA0KPiA+ICtyc3dpdGNoX3N3aXRjaGRldl9icmlkZ2Vf
ZmRiX2V2ZW50X3dvcmspOw0KPiA+ICsNCj4gPiArCQltZW1jcHkoJnN3aXRjaGRldl93b3JrLT5m
ZGJfaW5mbywgcHRyLA0KPiA+ICtzaXplb2Yoc3dpdGNoZGV2X3dvcmstPmZkYl9pbmZvKSk7DQo+
ID4gKw0KPiA+ICsJCXN3aXRjaGRldl93b3JrLT5mZGJfaW5mby5hZGRyID0ga3phbGxvYyhFVEhf
QUxFTiwgR0ZQX0FUT01JQyk7DQo+ID4gKwkJaWYgKCFzd2l0Y2hkZXZfd29yay0+ZmRiX2luZm8u
YWRkcikNCj4gPiArCQkJZ290byBlcnJfYWRkcl9hbGxvYzsNCj4gPiArDQo+ID4gKwkJZXRoZXJf
YWRkcl9jb3B5KCh1OCAqKXN3aXRjaGRldl93b3JrLT5mZGJfaW5mby5hZGRyLA0KPiA+ICsJCQkJ
ZmRiX2luZm8tPmFkZHIpOw0KPiA+ICsJCWRldl9ob2xkKG5kZXYpOw0KPiANCj4gUGxlYXNlIHN3
aXRjaCB0byBuZXRkZXZfaG9sZCgpL25ldGRldl9wdXQoKSwgcHJvdmlkaW5nIGEgc3VpdGFibGUg
bmV0ZGV2aWNlX3RyYWNrZXIuDQoNCkRvbmUuIA0KDQpCZXN0IHJlZ2FyZHMsDQoNCk1pY2hhZWwN
Cj4gDQo+IC9QDQoNCg==

