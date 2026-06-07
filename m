Return-Path: <linux-renesas-soc+bounces-33641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7p4VKbbZJWrUMgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Jun 2026 22:51:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E79306518D2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Jun 2026 22:51:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=QCtmjqC+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 868F13007C87
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2026 20:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA13329396;
	Sun,  7 Jun 2026 20:50:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB782F1FEA;
	Sun,  7 Jun 2026 20:50:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865459; cv=fail; b=GlwFPl/JbzIm0wWuslEwUIUEqr4fRdilDVmv4CBz2TBiWOO4Z9vo5hM2MJD89C+UmEZXw8cJLsLcZoWPEciPYnEQMHvFkI1qULc8kmNoRNOgWQUMAagn3EzCDZpj6i0LxYI/FKMifocl92iKhmHW0OBZvl6RLR9X2RkXgQR/l5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865459; c=relaxed/simple;
	bh=Ley2Z111R1r4FXtrXgKIQyCF/JPTjQ1e6URCyyRqfd8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ISZh41AqrYBRu6OuXZJ9MKAo3Jy0GdXP9WkvjpSgiZk2mj+hQknvIS7QpdbhH6BZetnGPqSGRzwXTq117Zlgh7zc/1SxRmyWUqH2Z6wIj7OrlCdtB9BNg8WC7uaZZEEGgK91g4ldhQ1zBgpb5SYEQvjfCvJdS8ZqgosVl5X4eGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QCtmjqC+; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnzwSkFzN3Vi5Q/kCJH5rDa3teW4jP9DDztAoc7Jp44E2tuYy6uUi52d4ZES7CK5kgzthjmflDLJoSbV4Y4Z35CMvpIz3GbySeCaud+/57zw678jrykrnwPIW0NdxEYVLiBB28JdA5XwXXmnK1gJs0aivcGECefxhv0TPVqe6SkJmwTQ9gUAw236OHlWaYzfcxUBHnhpEtqKiGcT3sj394BLbAFGS9QR4pwvso0lTxGzX1aQZzhxw8rhe6uCW2tSa2tQ9Ki4BnybkyufnITef5TXatvEEBVwkn2MYyQBDp1By9d9MnWp0BREEyT7ADZxJ9Tu0nJvx7xp5ldvNv1bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ley2Z111R1r4FXtrXgKIQyCF/JPTjQ1e6URCyyRqfd8=;
 b=PAH8hLqLcMAZfR6XjYkxvaNOAkiGz/gcE2tPY7GOeZKjOaRiHzFueX291ohqEmknkPiz/nsLht3g5u9UdBQsALN7SkuErW8DumEkKR0OvrPi9HvbUf6p9fyPi3CcFvUoTCvJKhODDv9e1mYuSb73SFCu0C3UF/ijQe+CqE4JfUqy811ALVkYX2b5xuzhCJQQYbwRfPJ1gn8A6RuQIIJhNLxi9C6B4PAOlIC9cZE4n+h9jMp5IjGCjx1NefonIq3eauCX5/GTEBI4TVZCmWAJZI5PWdk783WqzSaSdG1fNAnvCM+1WSA0YmZcRCG6wJ1bkNQPn22YNuKX3VxMdkT+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ley2Z111R1r4FXtrXgKIQyCF/JPTjQ1e6URCyyRqfd8=;
 b=QCtmjqC+2UfHO0wTSWz9BCPjMd244vyiMspTxVWTSal0a9l3BsfkQ5vveUa0gr6gIfhzaqmxb2ca4wOUH+iBeZW/JBt1Y2bQ73Vsy7tW65f0Oq5gAyBWvTww+M58EYPTcrSmaeGKsD7FYFgJUWPakhYTDk376vbyvFWMY8xvxB0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 20:50:54 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 20:50:49 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, magnus.damm <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Thread-Topic: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Thread-Index: AQHc9SbE88+QH7spg0qrWm41YM+SpLYweniAgAMYn+A=
Date: Sun, 7 Jun 2026 20:50:49 +0000
Message-ID:
 <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
 <178069496769.286078.10840905064274842451.robh@kernel.org>
In-Reply-To: <178069496769.286078.10840905064274842451.robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB7797:EE_
x-ms-office365-filtering-correlation-id: 1f9d9e22-9562-4cac-c0f0-08dec4d674ef
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|13003099007|18002099003|22082099003|11063799006|4143699003|56012099006|3023799007;
x-microsoft-antispam-message-info:
 1hXnZODOLWqI08LBtbX3MQ3++TfLHiXGA5JqxQFrqcLyUEx0bVAH8MM7oRvXweD6NwKx4ls3r475f432QlaFeGMQNXWte5ojlxsxxLzC6F0NGE/0A58wd1XxKnjuxETDJ6s2WiFZwklrIk8AQO7wux+d5GrrEgfjVg3siPxNCqM11ktMVEoTp+QO1RmJf8Fdp5RDtZGxSGK4muc4txV07987NBXtMr68yA2YDW0gDNGYDFiQmt+jSi3ZzjB0mRhqXgEE5Hj6CKtF1o0iyPoG8Pkorqs5EYo+/8eQYKGz4NJ4LQAZse6ZR4hOzzm9/hl/0LrnbfOz7sBfL2tGg98QpeCwdhZMXt9xnqjQupFMJw48YkeU2wrieFtJATtamznGLUZNL4PWeOxGINqd8afFDPXszpGsSz9GH8LsU/t2AxfgRB+Mj+ElpLL1yLhcAjyOwacMixRMngWjfR40B3BABleLuN2YiAUMZTSbSmsXViGs7Pm+uCEvicSrTN03CjRTAykPsPoHx4cbiYLGYzfM0520katJw7CCOX/zsdBBef65lQdpwlMM1kLKQedL2oeA8bb1n0j0URI40mgKO/9hhynWLtaio2KldEa/1Q8+VF12NZfzIkFhoONMPnwM3+0V7CJvENU6V/C5Np/zHhoLjuVPeecQwjYU+Sc8FpDCHAjws/QOC+SZs29e49xReh6lZvOQKI2iCpfc4ZmVGQnBfaCivBnCF2PhhTAKi1019qPOQbTpboy01rq3qEjv+tHe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(13003099007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGwwN1p3dkZnNktHekp6NG8xRVZPWTY5Q1cvbE93TXVNeGJlcW5ZMkh6WmZ3?=
 =?utf-8?B?S3pOcktWcURvWEswdC9vVDRyNmZpekxaRmNMUG5lejFzN1g2b01YbnFlQmxQ?=
 =?utf-8?B?SUlaQmRzekNWcXYxVlhqT1NWZmsvQ0JodXlOQmdEVG4zMDBqWnBwZ0dYNUcz?=
 =?utf-8?B?TmIwYmF5ems0dXBzWWtwNmZQVXBEWkMrN0hlL2FGMXIveFpwRS9xWmdFTGp4?=
 =?utf-8?B?amt4c1duMmIrbDkrQ2xBb2dTdFJkazRFcktEaUZRSVRIVGd0MHRVZ0kzYWR0?=
 =?utf-8?B?b21DVTk0Q3BRTzZjak91UjA3ekczd0RqaUM0WE1jRXIwdU84YUZQYnpIbWZH?=
 =?utf-8?B?a0FVQW5IWkF4Z044aHdlMGw0RTJzWkRlaWJYK01aSExrOE1jQTVlVTZPUTE4?=
 =?utf-8?B?RjkvZFBrVk1HWUV3Mm55eDZIVEVBL1NUYi9IdXBESG1naUxXSlJqWVAzYXZG?=
 =?utf-8?B?SUI3VVYwZkFqWXl6cDlRUm1WTjJXT0g5VitNbWhiMzRCeHJOY0h4SVUweXk5?=
 =?utf-8?B?R3V5SGFqNkhoOElBRmk3bW56VWpSeHZFTmVJaHRKZXp2OXR6Z0orRDBaNnYx?=
 =?utf-8?B?T2hOcVJRRlNkTHF2SWN2SitKN2d1cDNiUEh0UlMvSkFQM21jZ0M0SmtJZU9i?=
 =?utf-8?B?eGdHSjlqRi85Y2JsZE1STlJhTXJMY3FEZ3V3bHpkY0F0eklQS3lJRUdCM3E0?=
 =?utf-8?B?QVVzUXc3UGVzTmJFQ0ZIa28yOXlQZmM1blE3cE1GSkdORmFnODZ6T0EvdSt2?=
 =?utf-8?B?U1hHZHpTUUkyakRPTWxMOWlHR3FKN1oyVDRJYnZOTE1kYWxLWnNxV3dtb2hI?=
 =?utf-8?B?UHZGQklFTWhrR29ZNm55S3JMWktpTUNUa0VBdVZzOXQwcFFyVUJaOU9oZzlM?=
 =?utf-8?B?cFhQM0l5RllzM3NmNWkxdFJVK2xwY09wUmlyeUFmK2NBajlPY0Y2bXREd1Vm?=
 =?utf-8?B?aE9xZFlHTkVUY1ZpbFlBRW1vOTVsc2pxTURCQ3NWb1EvSWR1Z1FicThkWkpI?=
 =?utf-8?B?K1FCdGNwNUJFTHMzcitNMjVBSFhYNnA5NjBvRnFTMHh6Vzg5aGlWdEd6aEYz?=
 =?utf-8?B?SkVscWh0MStrWjFCQkdGQjR3L3o0TE91dTZ6dC9tcFNHeXdURThOVTNObE0x?=
 =?utf-8?B?Qzg0L1NTck5mZURzcDNOY29tUUdJMXdJeS91M1hlNm5XZU9QSThPSzJMdjNy?=
 =?utf-8?B?eDU3R0pXd2QwVmF2UGFpT05ZOU5KcDJGcjgzUk9UVlo5K1VJYnJHRG14dzFp?=
 =?utf-8?B?dmNVLzJwYTY4RXk2Q2tpanB6eWQ1YSt0V3RBVHRSZ01MUU4yRG5uMVROeElh?=
 =?utf-8?B?bWRVM01jV2pYUE43ZUUwNzFkMG4wVjNHM2xBSUdyOEo1RTdtVENTRm9nQkpw?=
 =?utf-8?B?a0wwbWN0a3ZiZ3p2czE5K2ZtSGs3U1VGYlFEMkVzWllqdUlZNXhtY204emZn?=
 =?utf-8?B?Rm5hdzdFWXRFSm1ieGllVWdxc20vWUx4SlpGOFdxQWl1WEpDY3AyZjE0VWJD?=
 =?utf-8?B?QTJkRHVSYXRIUWgrS2lva0hyQmJYOWxsS1hZMEpyZEZuaHdBaW9jcEthZ3Rq?=
 =?utf-8?B?WThsTXN2SVVRcDNVK0xzdHRvOWZIRlVJaVJydS9pUnZIOTAxNlFTbHpsV2cw?=
 =?utf-8?B?MU9veStDR2VJNkdrcXBZZlo0SWdlTHRsYjdzUVNJS2tzQnRlZWlOdGlzSnRl?=
 =?utf-8?B?aURKazRoNlZ5OFU4b1o1SjNFOXNDbFpLMjdIWGJFYWh3Nmo2cXpiU0lURHVy?=
 =?utf-8?B?dXlTLzRCd1Byb3FYdWhVeUtTMHpRYk1xYTlJRGJhY3IxdXh4cEhqNEsrOC9h?=
 =?utf-8?B?MVdyNUtiWmtpNEsxaXZBdnRSRFVtcFlIT2w1QnB4QjVuV1JsUTI3ZFppbkNB?=
 =?utf-8?B?L3lNODFrSUxNRlNPMmJxYi9BRzJ2TlRjMEpmbmRDOC94ckg1aXJXSmFRVVcz?=
 =?utf-8?B?Y0pmTUk3V1NOdVBXbnBidVhSMDVpTVZMVW10MGViZEwxajA0RE5taXdjZi8v?=
 =?utf-8?B?dlN6WVdCSG5HSzNCZEFQd1hEVExiRWkwTnduUlEvQjA2LzNRRHNWQnRZbE45?=
 =?utf-8?B?eFJDQjhzUWVpNURNSlN5aU8xeEZ5b0kvaEo0YmdIQnBWYWNVN0Q2U0hOVjJl?=
 =?utf-8?B?ZEF0Kzhybmdma0g2ZXdSenNLRFJiTDhaaEQ2cVBETHpYUnZ6SWJFMklkZmVs?=
 =?utf-8?B?OE5hS1lRdURjY2JyK1BvMVAvSFBDQjBGS293eHl4VmJwY2VQU3dBR2xCK1Iz?=
 =?utf-8?B?VzJKL1lHVER3SWt3ckRxUWJwVk8xNjJERklTcU9lWVMxSGY5c3hxRlFmMm96?=
 =?utf-8?B?Umh4MWRDSVVWZUpraldRN2d1OUFIQzF6WmF6MVJ1QTRZVy8raWhCZ1JpYXRh?=
 =?utf-8?Q?P07zLtGWSsOgDU94=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9d9e22-9562-4cac-c0f0-08dec4d674ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2026 20:50:49.6940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chnlaQEhqwhnVbNkX3ZZ4VrlSOeJ0fcSOkS5MKj4TIEgcoMR7pcNguM1kwxr/0LVb7llromwL3AOKXrUeYMEsohTB0WrkmgX1V3/dOKIm80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33641-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:lgirdwood@gmail.com,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:conor+dt@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,glider.be,kernel.org,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E79306518D2

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+
IFNlbnQ6IEZyZWl0YWcsIDUuIEp1bmkgMjAyNiAyMzoyOQ0KPiBUbzogSm9obiBNYWRpZXUgPGpv
aG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBB
U29DOiBkdC1iaW5kaW5nczogc291bmQ6IHJlbmVzYXMscjlhMDlnMDQ3OiBGaXgNCj4gZG1hLW5h
bWVzIGFuZCBwb3J0cyBzY2hlbWENCg0KWy4uLl0NCg0KPiA+DQo+ID4gIC4uLi9zb3VuZC9yZW5l
c2FzLHI5YTA5ZzA0Ny1zb3VuZC55YW1sICAgICAgICB8IDEwMCArKysrKysrKystLS0tLS0tLS0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQ0K
PiA+DQo+IA0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19j
aGVjaycgb24geW91ciBwYXRjaDoNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4g
DQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMvcm9iaGVycmluZy9k
dC1yZXZpZXctDQo+IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9yZW5lc2FzLHI5YTA5ZzA0Ny0NCj4gc291bmQuZXhhbXBsZS5kdGI6IHNvdW5kQDEzYzAw
MDAwIChyZW5lc2FzLHI5YTA5ZzA0Ny1zb3VuZCk6DQo+IHBvcnRzOnBvcnRAMDplbmRwb2ludDpj
YXB0dXJlOjA6IFs2LCA3LCA4XSBpcyB0b28gbG9uZw0KPiAJZnJvbSBzY2hlbWEgJGlkOg0KPiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9yZW5lc2FzLHI5YTA5ZzA0Ny1zb3Vu
ZC55YW1sDQo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctDQo+IGNpL2xpbnV4L0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yZW5lc2FzLHI5YTA5ZzA0Ny0NCj4g
c291bmQuZXhhbXBsZS5kdGI6IHNvdW5kQDEzYzAwMDAwIChyZW5lc2FzLHI5YTA5ZzA0Ny1zb3Vu
ZCk6DQo+IHBvcnRzOnBvcnRAMDplbmRwb2ludDpwbGF5YmFjazowOiBbMywgNCwgNV0gaXMgdG9v
IGxvbmcNCj4gCWZyb20gc2NoZW1hICRpZDoNCj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvc291bmQvcmVuZXNhcyxyOWEwOWcwNDctc291bmQueWFtbA0KDQpUaGlzIGlzIHRoZSAnaXRl
bXM6IG1heEl0ZW1zOiAxJyBJIGFkZGVkIG9uIHBsYXliYWNrL2NhcHR1cmUgcGVyIHlvdXIgdjcN
CkNvbW1lbnQgWzFdIG9uIHRoZSBvcmlnaW5hbCBhdWRpbyBkcml2ZXIgc2VyaWVzLiBUaGVzZSBw
aGFuZGxlcyBwb2ludCBhdA0KdGhlIHNzaS1OL3NyYy1OL2R2Yy1OIHN1Yi1ub2Rlcywgd2hpY2gg
YXJlbid0IHNwZWNpZmllciBwcm92aWRlcnMgYW5kDQpoYXZlIG5vICMqLWNlbGxzLCBzbyB0aGUg
bGlzdCBpc24ndCBzcGxpdCBwZXItZW50cnkgYW5kIHRoZSBjb25zdHJhaW50DQp0cmlwcy4NCg0K
V291bGQgeW91IHByZWZlciBJIGRyb3AgaXQgYW5kIGtlZXAgdGhlbSBhcyBhIGJhcmUgcGhhbmRs
ZS1hcnJheSwgYXMNCnJlbmVzYXMscnNuZC55YW1sIGRvZXMsIG9yIGlzIHRoZXJlIGEgZm9ybSB5
b3UnZCByYXRoZXIgc2VlIGhlcmU/DQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNjA2MDIxNDU1MjcuR0EyMTEzNjgtcm9iaEBrZXJuZWwub3JnLw0KDQpSZWdhcmRzLA0KSm9o
bg0KDQoNCg==

