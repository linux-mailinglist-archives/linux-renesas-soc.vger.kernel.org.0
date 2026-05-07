Return-Path: <linux-renesas-soc+bounces-32246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGxTES6M/GleRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:57:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C154E8982
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3CE7301C97A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899333F166C;
	Thu,  7 May 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Pj7UP1g/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2923AB293;
	Thu,  7 May 2026 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158458; cv=fail; b=FdfpY1duFCJA/FlbpyOF5XcOXeTX5bY7tmwWCMt4fDXz38q1KYyvR7Ifb5h/IwTGRPyCPolPDfEW/sj2/NRA4OjS4swCxJwM9GzixekAez/9ilILY9ZT6BpBwmv3pRTVY6yGvQAyaKOwv22I98eXbQpuVDn3VOeKzJ+BTSMST3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158458; c=relaxed/simple;
	bh=6WdlbYAuvJ/j691Xw4jmNdjMaOHVpL1BtJ82fg6KnIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JvoUFe1xoBXMuib+7YKIP2//J4RTpFStXywYbaJiRLLfykZF3zXI1L34/wQlGOk20M3cW2oL1/I0oyzAZsHYq/qldgrsXCR+k9dzt2bspys9+hCewzKLLV0tgjzTXvd+IF4qPT18/pZNNABnNzaHx/3grilpBjRGSnhhQQ+KtdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Pj7UP1g/; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvax/OpgFrkUfTsXQcKn1w3gdjCcFIsF+1IfDMwpB3IGaSFP1DodSpuWo1NB2P9kws11F6Ik7Lv7J6lYKXpYqt6saIX4nvbRwu+WTYydqwryWvWByv7Y1knYHsqF3TgU2gNc85fxuljNxWHFjtxPwx6Hdr3SjvybuwA/F2ZzRjY/cRvLoAsNXoOEz28lVhI/UXcfny9NMLXKe4t11MnjatfwhuCzOx48yLqTb2BTxmnkNmYcvvBcHxjm7ZxcuGxEN5dYrJSxdFmnGAwtqDHUNaEGOUhe+RtuO63Ha4aPfJVW+UX/9HIoZZpAUAzzhtv0p+hSNUViKMYCxMYzUxaw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WdlbYAuvJ/j691Xw4jmNdjMaOHVpL1BtJ82fg6KnIU=;
 b=urPFJlfV8wZDWfQRyzfUXszkqMSOukktuFnlOXlu3MP68H7N4i1FaDeHWjgfZM3Yg1QZ0LAXABBC3cX88DR8Dn6t+MUimKvor0/P1oNwfb/tOfftxS1Jnh0JE17Cdu6odOQKUQGFnoITsxq4dU1Wc02DcyoSugTbSC6JtNlmkXc6r8mhMAUjHg352VWSFFmIRC/b6xD4PAg9ctaJwOBljo2DYeHsxq1vMVS1GAGjUJ1igyxkUXhveUgWX146WbVkRLV9Aw2mmRDpWzDPtCxOkBNwZWqp6SiiCQzl7zG+i9VzCiULQqUoXuHtFc8uI0+l7NqidIgOvXiBWyMv92vJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WdlbYAuvJ/j691Xw4jmNdjMaOHVpL1BtJ82fg6KnIU=;
 b=Pj7UP1g/d8Hdf9owEhS7dpnLEy0LtbtB7yTKhS+tWq5q+i9AMIJbnDzn+JGBBiSf3IgGpPKGLpN0fwYtPLdpDQhCJhK0h5bNSfzyyYHbXBgHU0lH4v3J3XVr8+91rMHgJ+VjwTYhaZzDNHqbL9EPpgPMiSgvqX4yTQBR8zWOiMA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14337.jpnprd01.prod.outlook.com (2603:1096:405:23a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 12:54:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 12:54:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for the RSCI
Thread-Topic: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for the RSCI
Thread-Index: AQHc3F8CC82pxaQroU2tM/E/6t4zfbYChYQAgAACGLA=
Date: Thu, 7 May 2026 12:54:13 +0000
Message-ID:
 <TY3PR01MB11346FF16B68931586F640C25863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
 <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14337:EE_
x-ms-office365-filtering-correlation-id: 3a385fa7-fa1d-4248-bf31-08deac37bd6a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 FPCYBfAW0j/S9emVIiX19WGxhZe1TvbzOB3f2sOEx8WYsEphdOmjst6KFZDztIS9G1vNLiiGN9AiJ+skA+gcDnPzvS5FDC2tA+bQ9Acva3ZLskcZKEYzHMRjoTgen8GlY/0WDubJDQZikynvcRh0edvQYY6PGVp77itLCoYNoILgPHIPFQXZ4WD6wlWivs/5jTLq546+msPciIkYwvm+Q/IWFt7qqa5H0j+IaCU82IQfw2XetUd9dMRFyCUbdOKUQSNIZZtSwDfEU0lQBWdNInibgGALWgy1usNM9EPeAWIloStlx0vwZEOLkTfgbud598aFhTqP83k2+tiA6VCdemsiX4Mox/JT+xE0saa5wH7q1w78yi/Xbk2/9CiaKZZe6iBXg7RD/8Fle2eCyU0dgskPTqdDz6lSesnuow09AZ6EfbuEqWtk9MAYi/9VBbNLy36SAxN0WAH8DI89EbJn/yzDZ2L3hkeBEgHLUP3hMX6WPEYlTBmMP4IpdGVKnBO4lNR8j+YhIgaLrZyZjTN5TSO+v52ORPKxH+Bl0kYMf6qLrxfBqgjZMM0NMr2RwYzEk3HTVzUklS+FKP3mEvSwcN7pf+dJAZBUxYUt9WoM9J4eL7fJaOBGXjfSbRtVWkHr9AQQHW6lCtFVDu4N+hrJ5YuF7tZSYHyjtREoauuS46SioiGsyoc6Icg060/VbxswKaYNJPpY7PstG3PH0pFOPW37vBuQnizMGfmDWN5p+AyzzvA5vwP8lCSu/B2u5TwU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1Rxd2NaZFBVdTBmeTA1SmY0UjhUV2cwM1dRUlNlOGJHTTl5dU9Rbmx5NkEw?=
 =?utf-8?B?U1ZKa05CMDQyZ3UxODluRllueWJnZ0hpN1ZMcTJWbVRTU2dkTC9kbDFjTGZN?=
 =?utf-8?B?bUlBckNaWHdiV2xSUitpRTljZFN3aVhKOE5ESGR2bG1nMnBlUURobUZqQ3hw?=
 =?utf-8?B?L2RkN200aUtjRTBJaUZlMTJISTh3NEcxbjQ3TXpEMkdsUWJZNERzSWJ5TEJa?=
 =?utf-8?B?aldocFU3L01mL01jR1N3cUUrbVNDSy82ZVZSSFk1eDAwcWpOUll2SExicFZt?=
 =?utf-8?B?UitTVElsR29TSmN4cmVYdHZ0b00yNVJNUGRrN01YR1VWOGl1MmhNNHhsOEFz?=
 =?utf-8?B?c2V4L1NTeUU4U05PekJKYUFyRk1jZmI1emVGcmlYSzNYbm8xaWRQOVBBWnFR?=
 =?utf-8?B?Tk9aQ29pZVpCemdBbWtQN0tORjE3M3ArQUFjNWZEWWVWNWE5eXc2emcwN3JV?=
 =?utf-8?B?TWtYaUo4WU9xdkY1bW1yYUJhV3UwWjVJY3ptS01keVJwd29ZaEVKU3VkeW1l?=
 =?utf-8?B?T3hKNDF4dUpSM2RpWW1tSENyazZOcnNFeWw1OVB3Y1MrZmNQWWQvdWo1TUFM?=
 =?utf-8?B?MEczNTN2ZTB4YTYwTzd0TEJBU2dzaU5jc1ZGcW4yeHREQkVJM0xZNVFYRkw0?=
 =?utf-8?B?THNOZ0NQVFdnNW04aHBUbzJYWjZtOUZJbExISjNNSXE4dmMzRzBVOHlsM2NW?=
 =?utf-8?B?VkFUMkgxMGEyL05sNHE1YVlpTjNaejlVSS93VDUwN0pvelVPei9UNHU5empz?=
 =?utf-8?B?b1dXbEpOQTFVTTEyVmtscXRQWEh0ZHQ5dC9nS05NMHdlTEU3NFJkbEhnMWJC?=
 =?utf-8?B?RkxuTURXQ0JxNWtETStVS3ZZRGszZS91dHJSRjQyM2lTdlppU2dUWmt4V1dS?=
 =?utf-8?B?Tmk3eWxkdFhnam5WMW9FVjl5Nmw3dTlXcEJaNEJERDY3VFlLMHZxY1kyMDRV?=
 =?utf-8?B?bjV2Q25MQ3AvVDVXdGl3b3N4SnJVNUJhdnROWFI4ZTFuSUFFalE4UlZJTW8v?=
 =?utf-8?B?UWtQcWdXOHJnUmJVdUUwc0EycFdrOGhjUzNGWDhwU2Y2ZURvWmkxRWRXZktB?=
 =?utf-8?B?OFgvV0t2NTI2Ynd5Ti90QzcwQU9iMjh2WG5STkVTTnlhZ1BIL0FoNXNneGVt?=
 =?utf-8?B?eXI5eS8xNjNPUmIwNytFMjZrOUJORnZNSUw5UmV3MVFWZjhQOWYxMTI4WlhS?=
 =?utf-8?B?SEdFZXpoV0ZCb0x1TUJXM1RldUxqTFZoRHo1S0oxVXp3K3FyRGtzdHZEV040?=
 =?utf-8?B?MENNZkxBeUloTkVUek1uVFVCVlZyQ2R4dVpaNFlJU2tReHZ6b0ZicXpVY2hn?=
 =?utf-8?B?b2dFQzlxZ3BCL2MyVXhuWjlDalFiNS9GZTMzYVVHYW1MVlJJeEFhaGtsaVJw?=
 =?utf-8?B?d0Z0M2w4TSs3VEt3aUpvM3drK0hGVUtZVjJnY1UwTHlHRjBuYjk0MGVyYjR2?=
 =?utf-8?B?NzFtUGQ3Z05zVjdyVGlKOWZmNldob0hFM1VqeUNMZVhZMTB4Q24wWDg4RWZu?=
 =?utf-8?B?TTdtQzJ5SnJCc0MrVG8xNWdUdWhGeVc1MHpjSkIzMnpUekkzNmJWZDVHSUlT?=
 =?utf-8?B?eTRQVGpmK3ZtMjNLSzRPOHZwSE0wQW1nZ3VvY25oTlhLblBpNXdpM3AyL3pU?=
 =?utf-8?B?NmtRRER0M1BKaC9nZlpEcDZlNlg3T2xsakpDVkR4QVdlam9tV3lmaGJHQ0Jn?=
 =?utf-8?B?ejRiZEllenVXN0M4MDkySUhHeVhPRE0zZ05lR2NKMjlpczZQcUdxb3NMd3Fs?=
 =?utf-8?B?Ti9kNnZEbXlOYitDTjF5YkoyUWlaWWVCTlBreHRIWXN4UzZFaDIwUlU4dEVo?=
 =?utf-8?B?SkR4UEh6WVA4dEhuZEJ5R0V5WHNrWFRTTTRxc1Y5QjFwcUxXWkE4djd4Q0dH?=
 =?utf-8?B?WmNqbk84eXFEQjB5VEFabzlETVVOS24vQjJKZTd1b1o2Y0lqVFp4WElIT1hJ?=
 =?utf-8?B?bS92cUpneFA2R0J4ZVNYRDV5MVFhNUdmZ3JyM1dlN0cwMmpYRUQzYmdYMHhz?=
 =?utf-8?B?d0s1eTVzdUhzSlNBNUYrY1lBQTdTTVJaUlgxMDBsMjd2cGwvZFd5aVhsSEpC?=
 =?utf-8?B?Vk1SY1FYQTVDU3dFQzZWWjg0enhsN0M2VlR6aDc3aXF4QzZTdCt5ZXl1cUdj?=
 =?utf-8?B?U3JEZVcvZy9OV1ZuTTFmd3dLOFc0ZE93UGVJZlZ6NTJWOFdzT2pHVWRzSWtv?=
 =?utf-8?B?S1FxQUlwQ3h3VFhiKzlNRW1ySWlGbm1CYWVlYk1FZEc3NW9lT244YlFWUThh?=
 =?utf-8?B?L1p6UGdTWmpKb1JFV2huc0E0Slp4ODM2QWNuNUxhRGw2eGtzM0VQbCtGZFNO?=
 =?utf-8?B?MjRUYSsySXcxMk5hOFh5bmZ6aENRK24zTVBtNWxla2tkZHVZUys1dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a385fa7-fa1d-4248-bf31-08deac37bd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 12:54:13.3729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YwoSFCVpMCONFl4yDRSTVqc6ob+j9f923OoXefGJuUm1HTEkyMe+7VSa3n1P8a1HAZep8JbPf6wmqA+wAjj4AHPb8ar5YZJDtT6mLHchxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14337
X-Rspamd-Queue-Id: A5C154E8982
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32246-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE1heSAyMDI2IDEzOjQ0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8zXSBjbGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIGNsb2NrIGFuZCByZXNldCBlbnRyaWVz
IGZvciB0aGUgUlNDSQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgNSBNYXkgMjAyNiBh
dCAwOToxNSwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgY2xvY2sg
YW5kIHJlc2V0IGVudHJpZXMgZm9yIHRoZSBTZXJpYWwgQ29tbXVuaWNhdGlvbnMgSW50ZXJmYWNl
DQo+ID4gKFJTQ0kpIGZvdW5kIG9uIHRoZSBSWi9HM0wgU29DLiBUaGlzIGluY2x1ZGVzIHZhcmlv
dXMgZGl2aWRlcnMgYW5kIG11eA0KPiA+IGNsb2NrcyBuZWVkZWQgZm9yIHRoZSBmb3VyIFJTQ0kg
Y2hhbm5lbHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0t
LSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4gPiBAQCAtMTM3LDYgKzE2Nyw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2VsX2V0aDBfcm1bXSA9IHsNCj4gPiAiLnBsbDZfZGl2
MTAiLCAiZXRoMF9yeGNfcnhfY2xrIiB9OyAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+
IHNlbF9ldGgxX3R4W10gPSB7ICIuZGl2X2V0aDFfdHIiLCAiZXRoMV90eGNfdHhfY2xrIiB9OyAg
c3RhdGljIGNvbnN0DQo+ID4gY2hhciAqIGNvbnN0IHNlbF9ldGgxX3J4W10gPSB7ICIuZGl2X2V0
aDFfdHIiLCAiZXRoMV9yeGNfcnhfY2xrIiB9Ow0KPiA+IHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3Qgc2VsX2V0aDFfcm1bXSA9IHsgIi5wbGw2X2RpdjEwIiwNCj4gPiAiZXRoMV9yeGNfcnhfY2xr
IiB9Ow0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNlbF9yc2NpW10gPSB7ICIucGxs
Ml9kaXY1IiwgIi5wbGwyX2RpdjYiLA0KPiA+ICsiLnBsbDJfZGl2NyIsICIucGxsMl9kaXYyXzQi
IH07DQo+IA0KPiBPSyBpZiBJIHJlbmFtZSBzZWxfcnNjaSB0byBzZWxfcnNjaV9yc3BpIHdoaWxl
IGFwcGx5aW5nLCBzbyBpdCBjYW4gYmUgcmV1c2VkPw0KDQpJIGFncmVlLCBpdCBjYW4gYmUgcmV1
c2VkLg0KDQpUaGFua3MsDQpCaWp1DQoNCj4gDQo+ID4gIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3Qgc2VsX2V0aDBfY2xrX3R4X2lbXSA9IHsgIi5zZWxfZXRoMF90eCIsDQo+ID4gIi5kaXZfZXRo
MF9ybSIgfTsgIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2VsX2V0aDBfY2xrX3J4X2lbXSA9
IHsNCj4gPiAiLnNlbF9ldGgwX3J4IiwgIi5kaXZfZXRoMF9ybSIgfTsgIHN0YXRpYyBjb25zdCBj
aGFyICogY29uc3QNCj4gPiBzZWxfZXRoMV9jbGtfdHhfaVtdID0geyAiLnNlbF9ldGgxX3R4Iiwg
Ii5kaXZfZXRoMV9ybSIgfTsNCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1jbGsg
Zm9yIHY3LjIuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0K
PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

