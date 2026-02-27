Return-Path: <linux-renesas-soc+bounces-28513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKraAiBdoWmksQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:00:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFE1B4D76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D7530FE8F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 08:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5453A9D83;
	Fri, 27 Feb 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I6dBGWSN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33B36AB77;
	Fri, 27 Feb 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182644; cv=fail; b=XUd5bm7BT1jlevmKcIxEoOAT5ET7UN4Nn/luFax4dH7TfNJ5GpIXDCjtk9iNUahV0GAEkRGW5cuhSuM3D/6Qz6cnJCn2yuqRnNeTx3v/8TKbW+FTQwJqAzRUsge7EcMkeAcLZ/ncW3Nz7XQrbt9NTuzfhF3Rhqr4G5igz0Jz3KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182644; c=relaxed/simple;
	bh=i0Swga5q8rtZAqRLcrCp4JMb+KUOdDKCXzKpzFYDF68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tZ/IwXeJPGpXOqbEeVYrxVdtw4bUZgZaz5cJJl9nT7OB6X/4yFM6/o3YC1VsJCHZcEiItDus/UY6jTaYjl0ldxO8wMDQOgAyvcCl/NTg3F+wfH3Inv0sGsjgktKwp304BB+TC3EFZdD2K/BrPLQLBAXESMK6Zhtmjf52eZLxMb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I6dBGWSN; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDHD+gAlJYFm6L8J4Srlfrv7ufno9pIErxNvkkYktr4pT5bJn3qKSqqQpDWqmfkOhXQoId8a+dDx6VJvErGx5OfRfo9BEKMbrE5vjoiXi6Ts7jCWd+ZTrDcturbAVq7/k1eCYQTIqCy3WMPGT2fbTd2ELeSTwSCLeSeaFW0lLKo/aecu0THsJV2tghBkbHWLk57VCYquK2xgthvqymxd7PIoA6/5fKUrKY+RjtuftTLUP/F5ZSB1f8I+pXnRTjA7xo2x3AyKRzLf0rUV6EUzq5Tu8cvKcuYsOIDxjn/fyPzQxdmcdeuRUNXIfDZGS/I5qPIthT4iM1nSs+I/Bx+bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0Swga5q8rtZAqRLcrCp4JMb+KUOdDKCXzKpzFYDF68=;
 b=hq3MqdF8NFoA3I/KsIaTxHc4M7om7KwdTXv8osPlagXLHUWwmN5QBuAFYPzVlSmmW1RvuXfRWg9fYd0ERI4kfGRqRaxNbHUk0f6+B+raW1QYz/9oj0hTNF2i28gXe50TMlGmx0pB2qsY445hPBL92ybE6Gn0eOVXYf0HrMiJOPxOSPHffhcTadpLpQzglQ2YgRVFc0gOkFKPtrlWphKhs3XiviP16m2uKCwiQEE/jqWAObikOPKBB4Yn1FD0ytxkVlT3f2/jns5arUkpg1sFRSLvMj/2l1pA+g6fW8TGrpwn0ehOcGAT1+ypu3ANNG7X/VSMgdRjH7ojomSaQtWCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0Swga5q8rtZAqRLcrCp4JMb+KUOdDKCXzKpzFYDF68=;
 b=I6dBGWSNW1KnNzco0iBB7TCxKtWDGbJ62xPPf7Xtw3JlnIaVGu4mRzLbAFkdWXTeaFRVwBvLE7x4Jh8qJ54ZJ5sWpp7F91ql1jm7YxliIQrDEJq6Smxpq4EqYGPNmCpadJM25tgzNBWPr+8e4KdpMmPbyWlCg7usWW9IyDBkM1g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB15971.jpnprd01.prod.outlook.com (2603:1096:405:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 08:57:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 08:57:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa
	<abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
	<krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Cristian
 Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Thread-Topic: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Thread-Index: AQHcp0w/AFgImz3nkUSRSU+NP4hsMLWWNEiAgAALEZA=
Date: Fri, 27 Feb 2026 08:57:08 +0000
Message-ID:
 <TY3PR01MB113465AF574202C97FE84AFFC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB15971:EE_
x-ms-office365-filtering-correlation-id: bde232d5-af62-4606-4c1a-08de75de3049
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 LVZRUK2Yh/h5WSX2qrkuF5GChA8oF2b5kElHiabRNmuz8z/rikYbXdlqgFrf5Ig6BG4xiwDipI8OY5iLwIP3/SYGKUEQlvOyBXSBK9gUWqi9UWSXUfpuRmxUCQzVqoen/pFSYNq3L0XZabEWy/bR5HaMv0WfDLW6LwN/2VtaDLbSTcKJnzO5l544jfuSgmQKKaeZ2BGN4FBz9Z/6EIXNN1tA6V8MmAGFxasuW9Xl47SmamjLqBn7poKmfO2QiWD+W4CqaqTXPEBJBYrR31RtWtTSiKhKKs6iB+dLuckNehFE4jHb+CwJfd8/HvBkXRHOcTaULOzLyIUdKLpcBBlCty1eGfaGDXyaQKP6A/F+smp9QG6zME4iWN/pbNCUORQh01mJdo02qEWfNBJiaiJXNGoW9rt43SWwMXpvggMFP9GYhqPtnC/ZCjh+vmKp6b/sYooXMuQA2Azql7odPTQ0Z+rrJGtRhC19TyIk1EP95a4UbnF+jqKzp+maL45SoenDDZokuna+N3alipjhjcVUJyuy32VZg2PlHomGMP9nxANh25Z05NbkOfkbG/kBLyWjHg5mGC+jwg7M35+GN0xW/R99aqzFsEKk5b82ng4iZcVbdmNi0TXlwvrw9xtZmFoQcPZpFP6FchOx592nDLuiIbLz3yYyS9koWSqmoM6USgM+6FSqgtJ5fFmqwNMeG+ROwtHHDn5/4ZrYlfbWqZoiVC4ouALt364qlzmEnpB35K5eLu6MLKU8LfFO7yN8GHjlJEucXCtQ8wz7NKrysliqz6oGl/6QrEst3if4luGIQMc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTNXeXZzV1l2cnlpdk91NWY5dC83a3RxSVFSZFBSZERPN1VCc1daOUE3b2hX?=
 =?utf-8?B?RlFVNnNjd0t2WFBzOGNKQWlRaitEUjk2R1AxdFhTblB5VTg3VlMvMHYyNXRJ?=
 =?utf-8?B?Ty9nbXV5NFJCcXErZ2oxUHpJd2hNUkF1bG1EOGlVU0V5dUl0WWZtaWU3RlpL?=
 =?utf-8?B?aDVwdW91QnFXalNnV0dIQ2lqejJ2UktXM0w1Z1I0RFlxcng0YUZ4Ym5sZUVz?=
 =?utf-8?B?N2dtQVNCVlJTQVJxaWVtRGg2OGhwanJGRFQxSTFqcFB2dUdpVUY0ZW56RkFK?=
 =?utf-8?B?V1MwQlppLzBRYmFmdEE1ZXh5TTFWemNtd3JLbmVENlNqbXdHUG9TNitjeWtZ?=
 =?utf-8?B?UkZLOFIrZGFkSGE3dHZ4YmlKbkpRWXBJM2RPMHNlc0ZzMjZjQ0FpUU5rRTYw?=
 =?utf-8?B?OFN2TDNKZTBYYzV3bkVPYjFoWUhMZ1VnMmRYeitXY1daZ2pwbk5uQnZnVzFG?=
 =?utf-8?B?SkYxbzUxR3QvUjhhTWNKVmpCdDJXZitPeWFOckpsdWp4NFJPRFNNWUVzR21Y?=
 =?utf-8?B?QUo4WkZiUTlHUFg4R1FkZzRwQlcwcVp4NUF0U3pEZVZ0ZG9vaE43SU9WNmR3?=
 =?utf-8?B?MVphQ3AyYzZ0eUhNSDNlRm84bjd5K29RR2ZKUHA1cHNnR3JDeE5kelZVaW5h?=
 =?utf-8?B?RS9veWowNmtXRXpNU3ZWY0ZTcGlPSFBYVDV0RmdCNVRkb1Z3SXYwcG45S0tO?=
 =?utf-8?B?Ujk1cHR3Z1grNVBnSGdTVDVDSlBBUnR3QkV0V0dkWVNjN1h0Ykw5eUwyMWpT?=
 =?utf-8?B?WUpKQyswd3ppM2hZMDNxVk85K1hMZFlUeHUxVGNLWjYrb3gvRitiRDlGK0U4?=
 =?utf-8?B?U0crK1RxRzJMTW9KTnRMdmRETnZIMnppWjZvV2lxMVhGdGNQVitib0tTOUZU?=
 =?utf-8?B?NUkrTktaK1BOL05ZREVNUDRLK3krdkJoT0IzYnJkM0oxa0FuQnlhNFRTYVB4?=
 =?utf-8?B?T1hHK2dmS21NOVd4cnphNzE5ZCthZDFULzM0NFR5ckttazVKK1dNdElKUFVB?=
 =?utf-8?B?R0h3bm5HeXZKVE82NTBJMjJTZlFwWFVYZ2FxREpObW0zeUtFM0x3NmhXbjBh?=
 =?utf-8?B?UFRkVmtqMkZpVmY1UytnRjdjUktoTDd6VzVUcUh4ZzRxc0FTcDQ3bGxVQm91?=
 =?utf-8?B?US9mN29zakt1dHVZVEJ6V1BsOGVQa2NkbkhhbFFBRGR6QWgrU3g1TytXV2lI?=
 =?utf-8?B?R3hubG41cS9heWE0eFgrRXJnSUZ6QW1vQk1WRkdFQU1Rakp6Smd5SnptaWlL?=
 =?utf-8?B?Z3JPYnZNOXBFUFJLbHhBZ0ZoclZ2U0pXWU91SDZjdWwrT1VqVzl6dFN5djVn?=
 =?utf-8?B?VDlCQitIbnhQZEZhY2lMQ0FpNXUraFdSMmdhYmhzREFmSnl0N2NKK3RPWGwy?=
 =?utf-8?B?ZXN2alVyNGx0L3hMMGVwV3E0QVpmN05xWDUzaTJrelhIT1kvVE5neHRwWjFj?=
 =?utf-8?B?ZG5aeVpLNWpaZGs2OVhYdU4rWEhSZSszeTBYRXlGMUtQbW9VMi9RaXRrd0NY?=
 =?utf-8?B?YXpjeU5ERjRVK0lKYUhTVzdUL29xNzJLVDVoYlVUVGhyWU84Ky9lSkF0YzZS?=
 =?utf-8?B?S1kwR2hud0wzZEJ5a2Q4S0Q2ZmNPZjIyWXlWZWV5bUVaNy9wa1o5YUNESTBl?=
 =?utf-8?B?ZlhmcWhtVjdqQ0R5SHpLRy9HSzlMbHRxeHFLeGJHS3lVdjZwalFIckdJRW1j?=
 =?utf-8?B?QjYyVnN4QTh2UFAyV0NNc2VMNVFmRDVrTzVrRDRFZm9PMVJweVdzWEszWmVn?=
 =?utf-8?B?TmpBcmx1OUlITnZRTm4wM3FPWkxkVGJXalFNRm02T2w2UUJMZktlamcrdGdK?=
 =?utf-8?B?M1FKYnB2QUVZWDRocFpOWG4wbG96bnkydElwM1RlUk1nczBpaHpkMm9EZUJ4?=
 =?utf-8?B?YXh1b0FKR1BIK2FFVlNXenp2cmZwM2c2RDJaaEQxRC9kblE3cHE0UWtCL2Rz?=
 =?utf-8?B?VC9XbnNrQjBVV00vTllCanFOYi9CbzlTb1JRTEsrS0lLdjVKbXBnbkkrdmlC?=
 =?utf-8?B?Wi9SRGlMOGxyZzBjUWNYazRSN0RNcGU4YzlrWjVaMWVXaWxxZk40ZU45TDNU?=
 =?utf-8?B?TnNoZzVvMncvTW5OaHk2T2N0OXpPTm51cjEwRUJ6YmVsQjk2VjFEcGVUeGVO?=
 =?utf-8?B?OEg0S1dZZ2NaRTFDMlFEdWxPZTNYMjlRUS81UU9JdXE4SElHUVBhTlYzaTBP?=
 =?utf-8?B?dDFOc3habm5kWkFlL0s0NmpRWWpWeG13QTY5enVURjU0dk1tQWRFNkhtQ2p5?=
 =?utf-8?B?Nk5SK1hTWHBaenI5M1BNT1J5c2NaaVlyS0FablJYek8wUys4aFZ3dlJTY0RS?=
 =?utf-8?B?cVp5WUpvWkY5WmVKZEI4RTZEMzlSNm5nVmRBQSthYjVlaGdMY2FrQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bde232d5-af62-4606-4c1a-08de75de3049
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 08:57:08.6272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xucypV8B9aMIRUhiHT1nk7qGFyP66DuLxx6Q5vqKkFHe7yhi1OgOqf3oPTIC8TCXZAvpLBKaE8Qh7AIOCNzk7b3dHc8DzqHAJj3fZO38NnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15971
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-28513-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.992];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,infradead.org:email]
X-Rspamd-Queue-Id: A8CFE1B4D76
X-Rspamd-Action: no action

VGhhbmtzLCBJIHdpbGwgdGVzdCBhbmQgcHJvdmlkZSB0aGUgZmVlZGJhY2suDQoNCkNoZWVycywN
CkJpanUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsaW51eC1hcm0t
a2VybmVsIDxsaW51eC1hcm0ta2VybmVsLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4gT24g
QmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiAyNyBGZWJydWFyeSAyMDI2IDA4
OjE3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDEvMTNdIGNsazogYWRkIG5ldyBmbGFnIENMS19S
T1VORElOR19GV19NQU5BR0VEDQo+IA0KPiBIaSBCcmlhbiwNCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+IE9uIFRodSwgMjYgRmViIDIwMjYgYXQgMTk6MTcsIEJyaWFuIE1hc25l
eSA8Ym1hc25leUByZWRoYXQuY29tPiB3cm90ZToNCj4gPiBUaGVyZSBhcmUgc29tZSBjbG9ja3Mg
d2hlcmUgdGhlIHJvdW5kaW5nIGlzIG1hbmFnZWQgYnkgdGhlIGhhcmR3YXJlLA0KPiA+IGFuZA0K
PiANCj4gcy9oYXJkd2FyZS9maXJtd2FyZS8NCj4gDQo+IFlvdSBnb3QgbWUgdG90YWxseSBjb25m
dXNlZCwgYWxzby9lc3BlY2lhbGx5IGluIHRoZSBjb3ZlciBsZXR0ZXIhIDstKQ0KPiANCj4gPiB0
aGUgZGV0ZXJtaW5lX3JhdGUoKSBjbGsgb3BzIGlzIGp1c3QgYSBub29wIHRoYXQgc2ltcGx5IHJl
dHVybnMgMC4gQWRkDQo+ID4gYSBuZXcgZmxhZyBmb3IgdGhlc2UgdHlwZSBvZiBjbG9ja3MsIGFu
ZCB1cGRhdGUgdGhlIGNsayBjb3JlIHNvIHRoYXQNCj4gPiB0aGUNCj4gPiBkZXRlcm1pbmVfcmF0
ZSgpIGNsayBvcCBpcyBub3QgcmVxdWlyZWQgd2hlbiB0aGlzIGZsYWcgaXMgc2V0Lg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+DQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQo=

