Return-Path: <linux-renesas-soc+bounces-28524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBdxGWZ9oWkUtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:17:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DE1B6704
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E9E308A150
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4921E2459E7;
	Fri, 27 Feb 2026 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="h3+brrVN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBF2566F5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191006; cv=fail; b=hRmUSIt1sjxd7LeV2Qemt491XWAaLI7HRTulNheC6299vrNu0tRQgdKzNEDxsl3fTvJUg0zSUWuihh/B+G38Z6O7cWlOTfp/jyyKot5324A03EREUHLsfVwbjqMfYmgOz/clOwGQDBSqOKteTPVKYlbO6NL10C2XYE4IqL9CEu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191006; c=relaxed/simple;
	bh=A/kpgK9wUD08j24AEdek3ZQpXFgeRhqrF7znuv6jc9Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r9Kk4lbSz7kv1iIL8/tEYH8pdJMcJ4u7tudkXwC+lqjE06nIWUfn4T+9Ruv1Muuecq+DEt6/LzjRzLkFE13VgtB64/Arfu8YZVUZ2X5Ehe6PVWNo3UEwvm1PBA3RCMvoW2FF68XP8uXVPMyzqYtvySNk6hatAf4ov/blf/x+1y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=h3+brrVN; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN2d3wJ13yH62bj7GsJz0JhQZTGnoCru21M9/LR+Snp5jC6oq4+2nu7D32IrTRijBofOFO2jQh2MVhsvxNXuZzGyWcFl/HvtU6LOiQ3ZK6M25RoNLJdctsDBBD3U7S6X0TiGHkk48WkbIkefUkk8heu5mGrWDAoLKOGl8pghYw2hNH2cWJvLWnJAcJUm89YasIwEFfCCrlHULDC4TnKzaLi+q7YgrM5T/GN8uE0CcDD4tI8zrL+kkDNX362/dqXKqmk8SWir6ln9/gylipm36XKFNuKhAUZs2ZJTRtPQL2O69dHETbmutVm/QXA6WMx7pJq7qeNEE5DfWF+bCRNPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/kpgK9wUD08j24AEdek3ZQpXFgeRhqrF7znuv6jc9Q=;
 b=XN8BDtISIr8q4hMTvliey0y8U8xNPKzS9rshjLCZLNtBgIPs39rj3vWgT9zDV2P1pHa30NuT8ptoTd8+Zz1UQYYD9KvGUVpYaoiXZbo5lsn/2Brrk44eqYhyirkA1pZCd+bfV+QMy3nHD3V3oW2iU3EhNWOjS7gO6fdfZOyFd/yGvARX81kAcOI4TAK4l/hQwZZtHa41r82nEulhpydalUsi/FI/lRUaFNeqQNxT1nveBEjlbYAPoXPPxQvGB55gdz/tdpEEr2e5++bOgHPxvtZyRq/h3bTi1FTPhwVoGtfbeZU7jlmw7kYKQYyQr4h2BxiYnzOp8AYMWDi2fBcE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/kpgK9wUD08j24AEdek3ZQpXFgeRhqrF7znuv6jc9Q=;
 b=h3+brrVNHhsvi3cC8Kp44ikwnoz8Z1RKq2br8DTPPISufUiB7ivagDT8LT6zgsIbVtHXyhM2Ne6ANFvHt6vljde1fKxpo9HxbsA2RcIvir7k511IE3P5cVoibO5KXy9j0DK3trXV3LYMbAtaXgWA9+Pz1QnjnA0uztbi760W5aY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10603.jpnprd01.prod.outlook.com (2603:1096:400:2fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 11:16:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:16:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Chris Brandt <Chris.Brandt@renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Topic: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Index: AQHcp4u/eZzblQs3SEG9Nd1aSbBwPLWWWTZQgAAKcwCAAAIWgA==
Date: Fri, 27 Feb 2026 11:16:40 +0000
Message-ID:
 <TY3PR01MB11346EA14A9256419980281408673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227015216.2721504-1-chris.brandt@renesas.com>
 <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10603:EE_
x-ms-office365-filtering-correlation-id: 1e445766-f0b8-4e60-aa22-08de75f1ae93
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 BAGGf27Wodr3VBFzCaMZvB85gyQ/k0jAsNgMqsuZzeccOvtxOmB6bPuILp6mCGr3N6v5CoKk3agfYqNzHXDverJUbKQBCl3lp+pWbUIZS00WCA8X6OO9OGKlY889NqEikvBK/XasYAB3e7BjtnbrRWwswiCeBineOW2GIfongmUxZEW5c7SydGtaMdII7Qg+4hzI/Wr5ezXlJmC1gVkD1WoQok+Oqccuaxr0JOMN/9fiAdfpi56t/SXbbhKMEJUfC1NmgKW4RG2t7KS7sxPt4V4yueW6KYrYqtZBKqLtHjAXjexygQp60TrGnxjBNWVJhgkDvvvIpvLjzlz2Wy9f+O8gk2aVrlj04zNPEHwbT4kt2w/YXVimHI/1A3ucfdXJNhLVsNUqzZhyryCjKgmRifsXHiiwkRN43XM0RoUNAOv8LtNc1b6aJ18zRrUYXybNySh4YgitfCsbYjzQC937FTNcZm4yOUX3i6N6/zf3mvTNhKKXr6V7tPNGJ6/NQlNyYEY7O8dnCG3A3mjHVsu9TCgDZhtqQCVr28LRBJRszkYF7On6u14zdN4uVA5qBdMnf4vTSl/v/8Gvd/+CUzp5xMbGuLTRH5PMyDX0hmfMsJwaNjlTnOoVrX9Nu6ci5wCREzl+D6OM2ia201OQdQ3sPsfEOs58gkV2QhRK2ipLeaulv3nF0znjzLkcVouc+Ig3B5aMrTGSi6VLGEw8ezC7dUq894uAzgCInRoDCRqys/48cG4HDYQQJvkQm8Rap45isKhZkZd3r0C4pC8nwnlu/nrUO3DuWtVrFp55C6VHP/I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGhicGN5S0RINDA1RDVjYUxrUTBpRTRTaTlDQjdGNDQ3U3VzWEVLVFZYTjI3?=
 =?utf-8?B?OE56UEdaMGs5MExxNndPYWZ0ZUh0enRSUXh2Zlh1SWREMlBtcytkSzhoZTZ2?=
 =?utf-8?B?aml1U0U5akZ0bFZUY2lhc2FGQ3I4Y2F6Z0FiMU1xR2NBUUQwQy9KUDVSOGxS?=
 =?utf-8?B?alFDK0dkbmszWUlhQis1T3JnNitRZE5OOVpMNHp2QWFJMXY2SkUvNmk4Um5T?=
 =?utf-8?B?R1VyY25FUDMwZFNxTm9kd0UzWGUwWjVQN21oQWZJVStDMm9HcnlwVHNKWTRl?=
 =?utf-8?B?N1VXb1Vxc25CUHZZWFhHZTIwQWJjcnBOSDJiUEdOalB2S1FMQkc1bGw5bWdr?=
 =?utf-8?B?dHhmcTZTYUw2WWsvSEhteldVQURsSFNkcDdZYkxPcEdhb0F2MnlsU2ZSYnpT?=
 =?utf-8?B?SjhlR0xTZ1Y3aXNlZElYWkwwTmlteWZQUjIzYmI5eGYwbElsZlQxTHc5U1Ew?=
 =?utf-8?B?ekxQNkdxZ08vZS8wSHhKOWdmOVFVeVFRL2dneWFabTlySGdOTjI2dWYxWkk1?=
 =?utf-8?B?Q3ZOODFBaTBoMnMxRGNoRzh6M0RUYWZYcFk2eHNodXp0NnlHRnVvSEJob1JP?=
 =?utf-8?B?aTl3TDhXeHNYTE91d1NWbE81S29FLzRHRmF0U2VodTgydStqcFA1Y0NtVkN4?=
 =?utf-8?B?dFJqM2JTdUtBcjNwRkZtMjY2UFVBeThDbVNKd1VZWGVZTEMvdkNPMG40dEZ6?=
 =?utf-8?B?R0dVbjhRN1hoVkYzM2FsQlltMmp4c3l4RnVVQUw4alg5Y0xRaXd5VkpIbmRC?=
 =?utf-8?B?TG5wRG0wNGk4M3M1V2Yzc1MyVEpaMHFSMEdkeDdLRU1TUkRDaHRSeVZVeG9i?=
 =?utf-8?B?WEpvTVp0ek9mQkJleGlTUGVvTUNielFoblBKbXNRTklCYUFpdUtTMG8yUkFv?=
 =?utf-8?B?SnA4K1NXaUFnL3V2S1E4MHRaVHc3M1h2MEg0cHd2bHZ4WGNlK1BHVzZBbGVV?=
 =?utf-8?B?WitjekR3RWlrMUlXQWJFa1V0VUJSUUdWdGZoNVhGc243NnNXUEVGZlo4YUx3?=
 =?utf-8?B?MDN1MGUzTTVXdi80Vk1LWk50aUZZbXlUd0NCdjBFNmo1ZmZXTFRhUGxuSmFE?=
 =?utf-8?B?SWVNRzdyeVd5MmxBYVF4ZHpKMVN6YitUVzZraTAzNm52Mkw1SVRIWkU1U1o5?=
 =?utf-8?B?MzJlV0pkaGwyQlRVd20rQmxFcSt5aXNaKzZRdFAvVEQ4RVFIbHpWMG4rZ3JK?=
 =?utf-8?B?UlJGK2l4Q1J0RDVSSzR1NXJMck8rdjVjNEZHV21MYUVRUm5YU0NQNDc0MHNx?=
 =?utf-8?B?RG9Bb2x1Snlwd0t1NzMvUkJuMTNuZ1N5NzRtOW1Lb0RSY2lDOHpFLzQ5VUVZ?=
 =?utf-8?B?NG9HQ29TajB5UU1uOVEvb3FJaENnSGlpeTJwWnBNQllFbXFWQVI3YW9ERkoz?=
 =?utf-8?B?MDV2Sll2MDZaNDhYMWFyUGZLUUFYdzZaRnRSUEVsZjd1NFl3Kzg5VFBvSEpW?=
 =?utf-8?B?U1R2cGhTYVprRVVqRElwa214eGRnYlo0bnFkM1Q1aEhoWjh0b3FMRjhQMUs5?=
 =?utf-8?B?RkZOLytGQUtLeTdUUTJ3K205bmQ1MzFFY3hVZjVsNkVNSHJpeU56djdWSllp?=
 =?utf-8?B?TjFndDRySi8vYm8ySktVVHE5dEhNVzUxaDdQTVliOFdZY3pMRlhqRGdzSWF4?=
 =?utf-8?B?R0FzaVBGczVDblo2T3kxTGVVRXhaV2QyZXFobDN1RmN5TWxUdVNHNVNOL2Va?=
 =?utf-8?B?QjJhOGdjQ3FxaGdKQUgrSzkzZ2tFNDRQY253LzFRZC84c3VuS0RQMVNGS2Yz?=
 =?utf-8?B?ZEVVNDdKbG9LR0FqYXhNWkJDZG1aaFlCOUlQVzRsRDkzTTFhUm5mNjFHSnRY?=
 =?utf-8?B?cG9laDF2aEEzM09VMkRZV3dmY3BnTjRHT054cEVpYXo1ZjZqaE9SRkxuNysr?=
 =?utf-8?B?Y0ZNbzR1ZCsvNTlzZ1JhK0Qvbmg3cytZNjgwYVFTUFNoMGRHVWhMOFpVRUh4?=
 =?utf-8?B?eWU2eHBDTDM0Qm1QcVhrTE5JU3RUSTVRVnQzZ1Q1SHNUY1lhczJ3b25HalFo?=
 =?utf-8?B?S1lxai90U2xIZnBiT1pxM1JSU1hTUHh0SjVqVlJHcThYdmk4ZUpMODFEam0y?=
 =?utf-8?B?cVpDZVo4RE9iaGZiaE1UZXMrck9UNTFOTWxqWTRFTG5OZkN3RHpZM1NiU1Ew?=
 =?utf-8?B?S0Fvbld3cnVZaEVrY0I4Q3JmQ2p2S1ErbUljTE5JWjcxRXJHd3IrbjFFckJX?=
 =?utf-8?B?cElLd2RRNERhY3ZocnlzdHc3T0wrQTRvYVdEcUgyWXJiSGxmY3p4YklLSWFU?=
 =?utf-8?B?ZFVDbGdYdGcvSEd4c2tnVmgxNmZaQWVFa2RBTGZFQkM1Zk5SM2U3aWVCcnIx?=
 =?utf-8?B?R0Z0MWRsN3RNNzZKd29MZ3BCWm04Vk85cE0wNldoOXE3L1p2bUNLQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e445766-f0b8-4e60-aa22-08de75f1ae93
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 11:16:40.8907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Enxa1TSdLJLcxXCBWyXmzs5g5QMCWt/rS/PlcO5J51Ox3rAAHRbqcUmSM5j6qL1zMuExNVnZGePvNQ25Q58AqvMW4x3wzVoZBq1OT9f6Loo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28524-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 7A8DE1B6704
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjcgRmVicnVhcnkg
MjAyNiAxMTowOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3XSBkcm06IHJlbmVzYXM6IHJ6LWR1
OiBtaXBpX2RzaTogU2V0IERTSSBkaXZpZGVyDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJp
LCAyNyBGZWIgMjAyNiBhdCAxMTo1MCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IEZyb206IENocmlzIEJyYW5kdCA8Y2hyaXMuYnJhbmR0QHJlbmVz
YXMuY29tPiBCZWZvcmUgdGhlIE1JUEkgRFNJDQo+ID4gPiBjbG9jayBzb3VyY2UgY2FuIGJlIGNv
bmZpZ3VyZWQsIHRoZSB0YXJnZXQgZGl2aWRlIHJhdGlvIG5lZWRzIHRvIGJlIHNldC4NCj4gPiA+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBCcmFuZHQgPGNocmlzLmJyYW5kdEByZW5lc2Fz
LmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiBUZXN0ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gPg0KPiA+IEZpeGVzOiA1YTQzMjZmMmUzYjEgKCJjbGs6IHJlbmVzYXM6IHJ6ZzJs
OiBSZW1vdmUgRFNJIGNsb2NrIHJhdGUNCj4gPiByZXN0cmljdGlvbnMiKQ0KPiA+DQo+ID4gQXMg
bXkgdGVzdGluZyBzaG93cyB0aGUgYWJvdmUgY29tbWl0IGJyZWFrcyBSWi97RzJMLCBWMkx9IFNN
QVJDIEVWSw0KPiA+IGNvbm5lY3RlZCB0byBBRFY3NTM1LiBUaGlzIHBhdGNoIGhhcyBmdW5jdGlv
bmFsIGRlcGVuZGVuY3kgb24gdGhlIGFib3ZlIGNvbW1pdC4NCj4gPg0KPiA+IEhpIE1heGltZSwg
TWFhcnRlbiBMYW5raG9yc3QgYW5kIFRob21hcywNCj4gPg0KPiA+IENhbiB5b3UgcGxlYXNlIGFw
cGx5IHRoaXMgcGF0Y2ggdG8gZHJtLW1pc2MtZml4ZXMgcGxlYXNlIGFzIHRoZQ0KPiA+IGRpc3Bs
YXkgaXMgYnJva2VuIG9uIDYuMTkga2VybmVsIHNpbmNlIHRoZSBhYm92ZSBGaXhlcyBjb21taXQ/
DQo+IA0KPiBzLzYuMTkvNy4wLXJjMS8NCg0KWWVzLCBpdCBpcyA3LjAtcmMxDQoNCkNoZWVycywN
CkJpanUNCg==

