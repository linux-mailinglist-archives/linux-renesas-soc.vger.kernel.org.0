Return-Path: <linux-renesas-soc+bounces-33269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEOuELUUGGrKbggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 12:11:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B25F040D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 12:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2312E310C511
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B670A3B47F5;
	Thu, 28 May 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Jpclq+3t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5FA3B38BC;
	Thu, 28 May 2026 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962087; cv=fail; b=WElv4X5+R/pa98CA/vF4WvH42eSk0De8t9ENnUKJ/nBAONc37Sgu0sYutniAKfQ8+ZgCq92jMvBUQhJDXCTxFcmUXu+/1XEZ3RTMCqF64grChCN/79jZ+ieM/X4FxNgholC+2NcdrY/WFK1bdyRUTpXx32x8xjLaLdAQMHxBIp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962087; c=relaxed/simple;
	bh=uPinZYKoLU48C6SCDzj970C/Dk/CnMbBhHgNPdgOoFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vA8kpnoTIi2F/dWm7BVRtlzZAf66JYD6b6kXxZBTWWXzXcqXxwNdwzI6pd1tTgsHIBrzsWGTu8zCCkxQ0lpbzNQz+ErszIgYCrmfN4M9LEFxjqODe7CDrH3ExVRXZzuHphFlJxqOmHYFAFDu4Tb9M9YzEO2vxeFpkaJdX7mncEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Jpclq+3t; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtKUIZh5YmYo8IhKt2odZleTrB0HQfHyaYFTn80t/H0enzkt7lahAkJKz/a5R6M8CvnWbU6AiT+bm2nCdwjIKMVjiDKQ4tZC1Q5IoEfrC+ltQKHpFxmAJ6UrlDj/wdbHGzrimMVG3ffvtZBhTXaS2fYxeW/RufOPDxaWHA2Ygzm9s0kewbQf0Si8rMTUSnsiE11U38tLumNX8d+/crMuu8RW2A6AZVP64SGyOmL0I8/C/jvV9jQKRTGMbKc6vHvI0S3SeL5kgohaakX4QlNd7SPeScO4YPJMKxGTNYVuB0Lyt8kl+mhX0DtbIOnSs6to8iyUOQX+XIIayuHiKxvV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPinZYKoLU48C6SCDzj970C/Dk/CnMbBhHgNPdgOoFw=;
 b=pWdQU4LqRzQ+00rd2DD9ff3onp2JxkXztXP47NQTPEiqYym4nCFrZBaSQJ8DXVMOizXkZcXQZL7eDGqiUzcPziOZ7HzE4vp+weVQd+9AJxWuiaWF09ooPaby5G+5GBBKLYoFr06dAcjYgMj6+fZtY5TTupWoVguWeYxZeEJVyM7KKDqs7UlyNxvJ/xBOnaLjjkx6Nnb8ZXvNvrP1RF4ckyeR8x2cGQ1C6QUlZsK9hapa42+fGjb0tOsQXJFjmWJWYBRfz45skwQ/tfBKfsdIhMXYaH/TMSJgDJc/BoysSe8A3nteSJH1jSUbQN6pk/fVWrLtPjFTF9qII+XQtC9oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPinZYKoLU48C6SCDzj970C/Dk/CnMbBhHgNPdgOoFw=;
 b=Jpclq+3tUJ57nZ/WlmVlAVJkBkvwUNybEGF5FCxAKS4NMnwgYuyqyk6eO/6SnehxxnoB4eD3HA0kvfm5olUtkpFHr5SBLxZZnDxSEHchC8V0zwCMVc6SmQg/sRImajuvyges/xhvbKpr2PCQzkgz1KtlVHLKY7YndlVfO/bMGDs=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB16244.jpnprd01.prod.outlook.com (2603:1096:405:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 09:54:43 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:54:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "bmasney@redhat.com"
	<bmasney@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound
 support
Thread-Topic: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound
 support
Thread-Index: AQHc7DaopsqIc1GQl0SxgKmNzvuK77Yh8CoAgAFHCvA=
Date: Thu, 28 May 2026 09:54:42 +0000
Message-ID:
 <TY6PR01MB17377B0D207AC5EF3A77605C9FF092@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
 <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYYPR01MB16244:EE_
x-ms-office365-filtering-correlation-id: 3b68a8a8-0170-4dad-0e2e-08debc9f246b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 mua7l3sEly0uE3Y091kt8Ifs+mVUVsdd5u62AhXEd7rkgOexevxw2QHp/uB/uQIk2F+B2LnpsHfjP2RK5V2x0OCDXcxwQPyNQZUP7aGNgvmBTVqVYYQjO5Z0FvH/huR4UaIew4GbAeXiqRks5bw/EJFU7C7g7T0DNp2sY8DLafEser1PkTZ46yqLWV1rzaj+EbAXsW1PztxgGWGIspcI3oqNspIbUReeNpf97VR4DmPpC1XC7L1EnorKZAbEHlB2OHhkkbjBm7Xx8sG0mFedMldAgVdfyXDgek91Kml8jLvXTS2yeHLP38UpKIMRyXWLsJ0NjdsIvkdISDyIWffqWcOEYeD0BWk+eS2WXU0IbDWjtY6eALGUkU/uhDkksON5/jI1NUKPQfWuW4xJxPlswUkxkYYHn57CEgYqf4IpT6YzZiOSekaFoqg1V4E7La7C1FsT9pV3dZjK1AYnGmItNCBZizObyVLrTdG64GaLYLXTcHnYPVWgsVzY55Ua5wh+g9BdJ5OHILptk2wXC2ziPdJy8eY+eZOczOsGCxmEvw1OJBQPeanCfeKQf+8Si+nHaXX0ugJQAiPTFJibuJwoKU90qyVdklEAgtyc58Woemw9B7xi3vvnMRMy2h8LVcWzSSis9cFQiYgdvUgjZ6MoH3nOesgxJiTQqjolgGRk1gBZG2hO40B1v3RPfPyaQ0FejOkf8uy2vuTp/VODyIBTIeHdsQP/2pvHqEMg8GTD3YyKeq5tF7BlFnt9ZoxN+SE3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGRrQ2tkdFRQUHE1bTJoVGJnU2hpYWVscXh0RkQ1MktTcjlaME5Ga3VYQkhO?=
 =?utf-8?B?cHMzSEVKVWZlVnVoTnRWZithWTFaUERlekRvaXFGYjhKMFY0TzFTaFM5akU4?=
 =?utf-8?B?alpVWjRGQlRVbjVIZjdZNFRKZU4rV25IN1pLU083eGhtSFRhR01FdHZnWGRQ?=
 =?utf-8?B?b1JUd0ZFQTNSOXpkaTBvZGZ5NkRkZDU5T2tCeFg2NGVkQmJrRDZpWTZ1eEk3?=
 =?utf-8?B?N0o2czVYM2kwN21rYWVla2RXV3hKQ2M3YjVBbmFvbVVyd2RHWHJVamVzN2VZ?=
 =?utf-8?B?TVhFRnFod0NORnJIZzVtUTIzMUMvTTVqNEFCb0FCWERITFNlVjVqS09LTitF?=
 =?utf-8?B?MzhndmFhVUQ2MEpPOEVycVF2K3FaWVF3UWN4Ri9NRmVHTkgvWHVVYWZESVR0?=
 =?utf-8?B?ZjdFQktSNm80Q2tiMmZURnFlWiszUHRwREpUeXVlZ1UxS0hBQXNYZk14Rzkx?=
 =?utf-8?B?TXdTUlMvZmQrNkpRV1JJK29RNDdML0lHbUtMeFVHU2dyOGNVNzRvakQra0hL?=
 =?utf-8?B?RmNrWU1OUW14aTFUODlTbzNyeDVPR3F2Ui9xMmJDODJ4NnQ3RmdxUmYrUkdS?=
 =?utf-8?B?T3NrUWtqS3VVR3hrRWxoSVBSTzNPWmtEK1NRSmlmU3ExRXlROTc1d1Ayb21H?=
 =?utf-8?B?QU9DWmdub1paOVgwakpTZlNVK3ZBL0JGSEpyTEhsTXpFTXRUNEpnZFcybjgw?=
 =?utf-8?B?STJvd0hFOHVLSGNlS2pTN2NCZ3ZIQ1g3NHRzblMrMjgwMVVKQzNuT1I2SFhO?=
 =?utf-8?B?UXB6eXJtQWcranVjQ1RjcFFpcEs2SmVXYU4xYm96NGNXUTFyOFRxY0JwOHgw?=
 =?utf-8?B?bS9rR2NScFk5ZHR2WFFnZU4yaTRiZk1ueGRnTUVBUHdWY3Ivcm44ZjFHWVQ4?=
 =?utf-8?B?aTlxNkJ6M2w0eXpGdTgrb3JwSFk1WlNIMVlpS3dldnZISXlWQ2xpaGwwQTRP?=
 =?utf-8?B?bXJncEpDVUlObzNqdk1ZUkZNQXNDcXp2S2M0M1BocnR3MW9tVTJ1RXdXcE5W?=
 =?utf-8?B?MGhKRnRrelZ1TkVKVTUyYlMwYzJXbVJlUzlDaVI2Q2VuaG51K1ZQR0F4Vk8v?=
 =?utf-8?B?ZFRZQjRJOGlURHdDRlBSMW16anB5dGpYOWt3ODN1MmxqWno0ellSSU1VN2RF?=
 =?utf-8?B?SExmYXNyeTFneW5EbE12WE5VRlFvdnR1R1RlN3B3N21GZW1CR0FvR1I1Q2Fy?=
 =?utf-8?B?WnVIbnU5c0FBbCtMQ1Z6S3VoY1RMK0dJSkNkL21oT0ZGUnJYejR6aUwydEJ6?=
 =?utf-8?B?SlBkUlNYU1R6aWNnc1p5dkJ3cmI0Vk9LeG5mWkVMMjg4ZW85YjgybHpIa1Zr?=
 =?utf-8?B?Y2VmR1VVa053SWpaMnJsOTUzcG05azFmcVErcGlHamgxMTV4SmtkVy9ObmJS?=
 =?utf-8?B?MFZQQ1hHNCsrWGdaMUpERndIaXdkN2R4cVgzU1YrYklRZ25ONjZKeG1CTVdq?=
 =?utf-8?B?NGtrOXF4TmxtcEtJdHdNUnZ4QUMvYURaWU9vN24yQjY1M3k0Rm5RbGJ1SkN0?=
 =?utf-8?B?MnRGSmdjOXRJOFdCMkgyUDZPanpWWVl2NFVmdmtRSTZTb2V6aFRDWEIwNnBN?=
 =?utf-8?B?Mi9KNE9SSXpZdUxWeTRsZ242R0h4cTQ2akk1K1g2NGxWNjFiZU12R0FLWldE?=
 =?utf-8?B?ZFVHMHFDSEZFOEEzSytGVE5SQzJCN2hyalJrRWpMOHZuZmJIalRvQ2QzekEv?=
 =?utf-8?B?SmNEUkw1ckIzYkF3UEpkakVXd0FrVDMzWVRaTnphK2ZOZWdiWlZVdGQxbGpB?=
 =?utf-8?B?czlOeXJMMjZLcmZWUTZHcDJleGR2N01xNUR1aDhwbWxPaTJQR0hVNDd3eHBS?=
 =?utf-8?B?d2hodE11VkxwZzNkTUJVRHNxc3VMR291ME1TSXhqM3RjTy9aTHFFaU8xemVM?=
 =?utf-8?B?TXJFTnNUQmZWaXJscVoxd2QvdjJTNXlLL3Y3TWkvSDlDZ1VJQmJLeG1mRFBz?=
 =?utf-8?B?dzQrVVZTWGtMdlo0d2tLM1ptSk51MzMzcElEbW54LzRUNjljM3NCQ05XakUw?=
 =?utf-8?B?bU9aVEhwSE42aVdWclZwc3B6aDBaQ2xvMDlFZElXNFRlQlVMWjk3eE5TNUtV?=
 =?utf-8?B?T1dOZXlubllZN2hkdUJKL2Y2RjdEUWU3Um56REJVTmNlM3IxblVNTEZ6a3hU?=
 =?utf-8?B?YzJYaFhFNTA2L2Rzc21FZ3RTTGRqR2RDcG5mNWh0OGRha0kybENabkJESm9J?=
 =?utf-8?B?bVozK2dBdUtjczQwNGdndHc0THhhQWRIRVpCL011TE5WKzhJOStQc0c3ZEZr?=
 =?utf-8?B?QzJjd1NrU0lzOEEyZzZIOTduUjNsckErK0VEN2k1dmlqc3FEZWYwall5ejIv?=
 =?utf-8?B?eDUxcW5qTVJtRkNsNTI0YVprRlJXWWZBQUhGN2Y3TXFPVWpKOUQ3K3BieTlF?=
 =?utf-8?Q?s6nj5BfVLSGWxcd4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b68a8a8-0170-4dad-0e2e-08debc9f246b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 09:54:42.9392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTk609S48j3hsvH7oo2AVqh/XnRz+TMyUSb2/fMbMrikn/ZZgSkYWbNwabu6o3OGC0UWuUf8m3mH+/id1BuBqunxVLXh1LZifbiViqinDBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16244
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33269-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.195.91.184:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,renesas.com:email,13c00000:email,bp.renesas.com:dkim,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 952B25F040D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogTWl0dHdvY2gsIDI3LiBNYWkgMjAyNiAxNjoyMw0KPiBUbzogSm9obiBN
YWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDQvOF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgUlovRzNFDQo+
IFNvdW5kIHN1cHBvcnQNCj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBNb24sIDI1IE1heSAyMDI2
IGF0IDEzOjA3LCBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IEFkZCB0aGUgc25kX3J6ZzNlIG5vZGUgZm9yIHRoZSBSWi9HM0UgU29DIHdp
dGggYWxsIHN1Yi1jb21wb25lbnRzOg0KPiA+DQo+ID4gLSBTU0kgKFNlcmlhbCBTb3VuZCBJbnRl
cmZhY2UpIHVuaXRzIDAtOQ0KPiA+IC0gU1NJVSAoU2VyaWFsIFNvdW5kIEludGVyZmFjZSBVbml0
KSB1bml0cyAwLTI3DQo+ID4gLSBTUkMgKFNhbXBsZSBSYXRlIENvbnZlcnRlcikgdW5pdHMgMC05
DQo+ID4gLSBDVFUgKENoYW5uZWwgVHJhbnNmZXIgVW5pdCkgdW5pdHMgMC03DQo+ID4gLSBEVkMg
KERpZ2l0YWwgVm9sdW1lIENvbnRyb2wpIHVuaXRzIDAtMQ0KPiA+IC0gTUlYIChNaXhlcikgdW5p
dHMgMC0xDQo+ID4NCj4gPiBTdWItbm9kZSBuYW1lcyBmb2xsb3cgdGhlIG5ldyBSWi9HM0Ugc291
bmQgYmluZGluZzogdW5wcmVmaXhlZCAnc3NpJywNCj4gPiAnc3NpdScsICdzcmMnLCAnZHZjJywg
J21peCcsICdjdHUnIHdyYXBwZXIgbm9kZXMgaW5zdGVhZCBvZiB0aGUgbGVnYWN5DQo+ID4gJ3Jj
YXJfc291bmQseHh4JyBSLUNhciBwcmVmaXguDQo+ID4NCj4gPiBXaXJlIHVwIGFsbCA1IERNQSBj
b250cm9sbGVycyAoZG1hYzAtZG1hYzQpIGZvciBlYWNoIGF1ZGlvIHN1Yi1ub2RlDQo+ID4gd2l0
aCByZXBlYXRlZCBjaGFubmVsIG5hbWVzLCBzbyB0aGF0IHRoZSBETUEgY29yZSBjYW4gcGljayB0
aGUgZmlyc3QNCj4gPiBhdmFpbGFibGUgY29udHJvbGxlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0N
Cj4gPg0KPiA+IENoYW5nZXM6DQo+ID4NCj4gPiB2NDoNCj4gPiAgLSBSZW5hbWUgdGhlIGluZGV4
ZWQgY2xvY2stbmFtZXMgYW5kIHJlc2V0LW5hbWVzIGZyb20gdGhlIGRvdHRlZA0KPiA+ICAgIGZv
cm0gKHNzaS5OLCBzcmMuTiwgYWRnLnNzaS5OLCBjbGtfYSwgY2xrX2IsIGNsa19jLCBjbGtfaSkg
dG8gdGhlDQo+ID4gICAgaHlwaGVuYXRlZCBmb3JtIChzc2ktTiwgc3JjLU4sIGFkZy1zc2ktTiwg
YXVkaW8tY2xrYSwgYXVkaW8tY2xrYiwNCj4gPiAgICBhdWRpby1jbGtjLCBhdWRpby1jbGtpKSwg
bWF0Y2hpbmcgdGhlIG5ldyBSWi9HM0Ugc291bmQgYmluZGluZy4NCj4gPiAgLSBSZW5hbWUgdGhl
IHN1Yi1ub2RlcyBmcm9tIHRoZSBsZWdhY3kgcmNhcl9zb3VuZCx7Y3R1LGR2YyxtaXgsc3JjLA0K
PiA+ICAgIHNzaSxzc2l1fSBwcmVmaXggdG8gdGhlIHVucHJlZml4ZWQgY3R1L2R2Yy9taXgvc3Jj
L3NzaS9zc2l1IG5hbWVzDQo+ID4gICAgdXNlZCBieSB0aGUgbmV3IFJaL0czRSBzb3VuZCBiaW5k
aW5nLg0KPiA+ICAtIFJlb3JkZXIgdGhlIGNsb2NrcyBhbmQgcmVzZXRzIHBoYW5kbGUgbGlzdHMg
aW50byBhc2NlbmRpbmcgaW5kZXgNCj4gPiAgICBvcmRlciBhbmQgYW5ub3RhdGUgZWFjaCBlbnRy
eSB3aXRoIGEgcGVyLWxpbmUgY29tbWVudCBuYW1pbmcgdGhlDQo+ID4gICAgY2xvY2sgLyByZXNl
dC4NCj4gPiAgLSBEcm9wIHRoZSAjc291bmQtZGFpLWNlbGxzIGFuZCAjY2xvY2stY2VsbHMgZXhw
bGFuYXRvcnkgY29tbWVudA0KPiA+ICAgIGJsb2NrcyBmcm9tIHRoZSBub2RlLg0KPiA+ICAtIEFs
aWduIHRoZSBjb250aW51YXRpb24gbGluZXMgb2YgdGhlIGRtYXMgcHJvcGVydHkuDQo+ID4gIC0g
Rml4IHRoZSBjb21taXQgbWVzc2FnZTogdGhlIG5vZGUgbGFiZWwgaXMgc25kX3J6ZzNlICh2MyBy
ZWZlcnJlZA0KPiA+ICAgIHRvIGl0IGFzIHJ6ZzNlX3NvdW5kKSwgYW5kIGFkZCBhIHBhcmFncmFw
aCBub3RpbmcgdGhlIHVucHJlZml4ZWQNCj4gPiAgICBzdWItbm9kZSBuYW1lcy4NCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I5YTA5ZzA0Ny5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA5ZzA0Ny5kdHNpDQo+ID4gQEAgLTkxMiw2ICs5MTIsNDgyIEBAIHJzY2k5OiBzZXJp
YWxAMTI4MDMwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAg
c25kX3J6ZzNlOiBzb3VuZEAxM2MwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA0Ny1zb3VuZCI7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDAgMHgxM2MwMDAwMCAwIDB4MTAwMDA+LCAvKiBTQ1UgKi8NCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAweDEzYzIwMDAwIDAgMHgxMDAwMD4s
IC8qIEFERyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDB4MTNjMzAw
MDAgMCAweDEwMDA+LCAgLyogU1NJVSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDwwIDB4MTNjMzEwMDAgMCAweDFGMDAwPiwgLyogU1NJICovDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPDAgMHgxM2M1MDAwMCAwIDB4MTAwMDA+OyAvKiBBdWRpbyBETUFD
DQo+IHBlcmkgcGVyaSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9
ICJzY3UiLCAiYWRnIiwgInNzaXUiLCAic3NpIiwNCj4gImF1ZG1hcHAiOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMjQ1PiwgICAgLyogc3NpLWFs
bCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0Qg
Mzg1PiwgICAgLyogc3NpLTAgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmNwZyBDUEdfTU9EIDM4Nj4sICAgIC8qIHNzaS0xICovDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzODc+LCAgICAvKiBzc2ktMiAqLw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzg4PiwgICAg
Lyogc3NpLTMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBD
UEdfTU9EIDM4OT4sICAgIC8qIHNzaS00ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPCZjcGcgQ1BHX01PRCAzOTA+LCAgICAvKiBzc2ktNSAqLw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzkxPiwgICAgLyogc3NpLTYg
Ki8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDM5
Mj4sICAgIC8qIHNzaS03ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZjcGcgQ1BHX01PRCAzOTM+LCAgICAvKiBzc2ktOCAqLw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzk0PiwgICAgLyogc3NpLTkgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDM3Mj4sICAgIC8q
IHNyYy0wICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BH
X01PRCAzNzM+LCAgICAvKiBzcmMtMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDwmY3BnIENQR19NT0QgMzc0PiwgICAgLyogc3JjLTIgKi8NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDM3NT4sICAgIC8qIHNyYy0zICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNzY+
LCAgICAvKiBzcmMtNCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y3BnIENQR19NT0QgMzc3PiwgICAgLyogc3JjLTUgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDM3OD4sICAgIC8qIHNyYy02ICovDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNzk+LCAgICAvKiBz
cmMtNyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19N
T0QgMzgwPiwgICAgLyogc3JjLTggKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwZyBDUEdfTU9EIDM4MT4sICAgIC8qIHNyYy05ICovDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNzA+LCAgICAvKiBtaXgtMCAqLw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzcxPiwg
ICAgLyogbWl4LTEgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNw
ZyBDUEdfTU9EIDM3MD4sICAgIC8qIGN0dS0wICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNzE+LCAgICAvKiBjdHUtMSAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzY4PiwgICAgLyogZHZj
LTAgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9E
IDM2OT4sICAgIC8qIGR2Yy0xICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZjcGcgQ1BHX01PRCAyNTE+LCAgICAvKiBhdWRpby1jbGthICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAyNTI+LCAgICAvKiBhdWRpby1j
bGtiICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01P
RCAyNTM+LCAgICAvKiBhdWRpby1jbGtjICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPCZjcGcgQ1BHX01PRCAyNTA+LCAgICAvKiBhdWRpby1jbGtpICovDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzODQ+LCAgICAvKiBz
c2lmX3N1cHBseQ0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y3BnIENQR19NT0QgMjQ2PiwgICAgLyogc2N1ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAyNDc+LCAgICAvKiBzY3VfeDIgKi8NCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDM4Mj4sICAgIC8qIHNj
dV9zdXBwbHkgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBD
UEdfTU9EIDM1Mj4sICAgIC8qIGFkZy1zc2ktMCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzUzPiwgICAgLyogYWRnLXNzaS0xICovDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNTQ+LCAgICAv
KiBhZGctc3NpLTIgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNw
ZyBDUEdfTU9EIDM1NT4sICAgIC8qIGFkZy1zc2ktMyAqLw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzU2PiwgICAgLyogYWRnLXNzaS00ICovDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNTc+LCAg
ICAvKiBhZGctc3NpLTUgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNwZyBDUEdfTU9EIDM1OD4sICAgIC8qIGFkZy1zc2ktNiAqLw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMzU5PiwgICAgLyogYWRnLXNzaS03ICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAzNjA+
LCAgICAvKiBhZGctc3NpLTggKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmNwZyBDUEdfTU9EIDM2MT4sICAgIC8qIGFkZy1zc2ktOSAqLw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMjQ4PiwgICAgLyogYXVkbWFwcCAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMjQ5
PjsgICAgLyogYWRnICovDQo+IA0KPiBQbGVhc2UgZHJvcCB0aGVzZSBjb21tZW50cy4uLg0KDQpX
aWxsIGRvIGluIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJkcywNCkpvaG4uDQoNCg==

