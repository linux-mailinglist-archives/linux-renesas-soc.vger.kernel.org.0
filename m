Return-Path: <linux-renesas-soc+bounces-27352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH5VE3aEc2kDxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:23:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63076F98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D106A3039EC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803F630FC37;
	Fri, 23 Jan 2026 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BBJYyKyh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4051BA930;
	Fri, 23 Jan 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178046; cv=fail; b=YklxvwFXKAJifEQ4d3PzUoZKNwBqZjR6G2D9fA6qO+KXsY3Ys0l/uB9Y5e3N4qb0uT0Zhjin9zTfBoSNrgithayJQlImMaJhTO7dOqr0KOYC8cvWA99hoZqnSF1PkAGZB+RanKcBzFw2BWd1o6GcouXoXqVQGqQzws7qC2goQwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178046; c=relaxed/simple;
	bh=fHJ5yTTxwpIIBbvUnDtu8u6qUDFOCn41bTAjQTpTOlY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IfMg3obsH2UHxSk84/HUGQ+rpe3nKCjWRn+nfQlA4MhFI0UGw0GsI39uj9QVE3qTO1pSRQvNVw/CypqkyCXBwFtpNDRXWRKGBsseKHWIG+VavYnhFnVYuNzuYe+aCuLhoyIj8MfkCFBox6Ek4FRk1NdANlV/Enc3uMobQDZL/lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BBJYyKyh; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dofdNAeb6jCC4EXx/yu2V/s+C5U1XLFH94EUuoTDHWt/2d/VV1wIGoxD/QQfNYZ4M4+DuPZGiolJEozk6yC3kXMxWVAZaKo76E5/O8aLoLXLa7jbMJG4rB8nhrq11kAo8mXbusplvIMyB8jmKO1rp1MSdXPf7GtQJyacJckFeRiufP8GmWHeSb58SrXN0566mAk4FPlE+ET1HtRs05ooTGMbmCQPrDf4oL48SyDstJeSsxPu7/t67pqByNP4xUFvUSmLXD1al9X5z08cUvTToB60SQrqEiEquBROkoTc6W/QD9U9mO3FDlbJ6Bov0POXlBGUkNjN/h4WSnMlSEokbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D4zXCQPRm7Yhax6ehJDbKhBwiNTzNBdazAkzCk4vXs=;
 b=nJC60UnXnO1WcTtaiZZKZhtjZEeubnVsyFiwSo59pxl8vjFFu45tl04cWEFOLTfdcJzlO8RyOS2v3yqubrGoaW+KDZogwqu7Ls4eWcxWtXFYF/J5etR6vlMo7XiowoQ/PRSeuMk/18+JDPZmxM009uRMvDcqkOsjijmmw4w6kFSZyQWPUg/Z/Myb31ySZ3Fr78/boBdpBw0ILm/Z+2JhiPmV5vhH66661cTKxCTGCM373kCraivKQxrLxNB52c0byVtljFaG9eqkqiHhonxoD2f2uKnuFynAMMh4M2dkBU+X8huMWr9br7l4tI+iVcKbTB3gr2PACLN1mVfU1Dwn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D4zXCQPRm7Yhax6ehJDbKhBwiNTzNBdazAkzCk4vXs=;
 b=BBJYyKyhUt9Kp+1OvFVLrxFCJ4bycQYDfqSiiDj4UrSntE0vnOm+cABhQryk57YpdymuiLHDMnFzySrE1nLA1sehZfoY1R/uGz2DvPcnQdTyEsZD1jHzipWJd/irGwXUFKroExicKNaHbkTbFll+rCd64y70a48PUpgE7J9oUvs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14940.jpnprd01.prod.outlook.com (2603:1096:604:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:20:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:20:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHcjHDzR9FqpLlwnk+/IlAqDba/yLVfzV5w
Date: Fri, 23 Jan 2026 14:20:39 +0000
Message-ID:
 <TY3PR01MB11346C8FD2A15580D4FAF501D8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14940:EE_
x-ms-office365-filtering-correlation-id: d77954f8-5272-4ddb-b26f-08de5a8a9598
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+hpRsdvS3N1JvG7HlIa4jXeVWk/CIQ8IW42S9a46BG/N2f1eKJUffQcYvehT?=
 =?us-ascii?Q?GV7lthC0bZX+w3YZ0yT6XToTzVfBKcvTNjdGwGnF1YW1GDbekPiXpy7vPegE?=
 =?us-ascii?Q?F7RrEfuK35KtDq+sn2QX2eno+4iwSXxzEJo7uS+HIL4Yx/YagpeS0L/Mz7P5?=
 =?us-ascii?Q?B7c/8/ynoue/CbEkQbNG3uHZe8zI+DL1uTogxFPPbaNnUWrYLofnCbNDk+/W?=
 =?us-ascii?Q?SIROmRWQ6ueAkAFlTi+3WfqoSKIdngnSpGmdVGNfkQnrjK00Ys4DYGpLlgR7?=
 =?us-ascii?Q?T2DH9jkjgDWu2vBRRg9NFH830r53gd/nDneFp6z+bp/2c/EEdbHMOK5KQiRy?=
 =?us-ascii?Q?MbHEpNnQhObFeC0OxeFyrLOl2vMp203Y7dnBNGibkVP4uKcUhCJfHh/i1cDv?=
 =?us-ascii?Q?dskx0tBwz38FU46d9FrDkZFDI+bE8u2sK8mRx1TLEuUL5IbKa3Ls4gDxlVwQ?=
 =?us-ascii?Q?TMRA7eOMVWhErAaUNZlD+4w1S94oTniVLhaAtYK0Q0JOZv6d7boObe4nkiK4?=
 =?us-ascii?Q?YlC3MpdDgIh9/CA7F1rHr8L8NbGf0KBxZj+UI55dv99ehDxcM5kiIQetYUjp?=
 =?us-ascii?Q?SCrJ29BI5h3+ap3v1SBouwVAEE7WRwR7wd5DssM1HdwPVEomuSquACzocgfI?=
 =?us-ascii?Q?I58ZLWmaSGOLZOqVPihDV/ZfJkBPOJbOZe1X5BzhlbCUg5oWIER6Sxr262LF?=
 =?us-ascii?Q?s8rg+r015eMJYKyYhWgu4L/9gA5CVYkLrU6dJRY60Rkq0FKtCEeMNwLKaBqI?=
 =?us-ascii?Q?0LXZS7azO7Niw+jiqsDgI0CDEO+vm1VfyGAa9xTUsMxYPSpe28hT8x4nTKi8?=
 =?us-ascii?Q?w0mn4+jeVOKbG720CagKxB/39y99/yDFjam1Xo9l5bBESkPWcgdbUVnig+O4?=
 =?us-ascii?Q?Vdr0TqSIKXsvfATviBx2w2EOZ8FVDjZoje0ReN/vJsIaGQbcGr2KCPdqoRNS?=
 =?us-ascii?Q?At1AnJEdhEPn+4eWc5J5LIZiuAWRBiTSW8o4cBPlPVNoz8dttK6CKY60INUk?=
 =?us-ascii?Q?98y4Dre+EPWzKfO30zrYxP6hPSO5eLGM208njiESw32cKkfuDPmjf/c84H34?=
 =?us-ascii?Q?Fjj8HKmwrb5j6GafMbcbySsBH5jOc7Ro2gL5/byXnKIoSOf7WSThUPKt/Vd1?=
 =?us-ascii?Q?TqVGxlwnesqPj72NSs8ucaGY2EmUR4vLFSCsSKVp4RF/LgeJs6lAIBFnHe/c?=
 =?us-ascii?Q?tHl3OTRebqjjoDOPldkYTKJBsPG9A50u62uApMOyqwxPU/9t9lpFjbx7dyDx?=
 =?us-ascii?Q?YkT0V9oC8aKhCGC1uzpMiyVtOqRKbPekVY2B6day8GmUIyeioJ1wk1kSl7ER?=
 =?us-ascii?Q?tTCS3j26WtRoeAv8418WjZudVNYSPXd+Hf82vqzllNLS5MjIa0vSOJuLSNOS?=
 =?us-ascii?Q?274nKaphAnCDuJoqOHJuqaxy0EQdkR/KnN15x2zq4aRCrVsfLsw7hdEzLHJv?=
 =?us-ascii?Q?KoVJQn81H0dIAuJdnH8j2IGXpxH5lxkYSIGPQVETZt/AVGZkROsyJkvbOshw?=
 =?us-ascii?Q?ht0PrpDPN59rvnQQgGeF+DaYMsIcjZXMeGcP63dR4EHPtsQBy0oDpunf8TZZ?=
 =?us-ascii?Q?Lc8/JcCeGnIptlAr8FCKF69olc/G2V+1KTE2Mh0IJPWs2uuTpVLWdas3D39i?=
 =?us-ascii?Q?JZpOmUSMJnJlh5qHObK7v9Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cLXZZNGY5O7CZ0DUUUV9layvv7vtJ6YsDLHAuupUljJArZtczN41NbvBFJ9a?=
 =?us-ascii?Q?3N0Xrk2ZLc6goDWg96wXEiDvSSmkGIHEPTF4XtXbRXhz5kx86bxpShPdRrj0?=
 =?us-ascii?Q?NEtAz/NAx4iZk7mZBO7naMJhDWUbvtMosuJiNqVzY6IKz4A1Ue1hcbXiYXLy?=
 =?us-ascii?Q?UlHYqACHgQL+M4w/R9e+z4Y8qgj3t/HBZrmzPV/PVX64oTMmx+T4ah9EKl2D?=
 =?us-ascii?Q?5QlCU46KlTM9hc4u5JYuWUEorsxeKZ1zX3e53cnOo5klmfyCYmYxfV14QvQ0?=
 =?us-ascii?Q?DMToFyORoinZ/AgVZBrFV/1k0lDzakf8rPDQ3FaAmH1lt5oZDUWm4am4AF/L?=
 =?us-ascii?Q?SMeeZQGQyU/0WTEqJahzypCzYkQMUYc3nxvLpNPRzE9pozEJzAJzRmPztF04?=
 =?us-ascii?Q?Xtc8oyaEmJ3nTknPaTmJG8BSRHTFxIFiQCSffHrDSpmOBUFIzRpiwwatibxH?=
 =?us-ascii?Q?yM3DmS2Suyw1KsFmpjitJ9oQ623MUV8vb5G+vC5DOouY7mZnAij9/uFasxg/?=
 =?us-ascii?Q?hh06aTA3Gl3anTDzTmmpKZgN3gmQawO6i69GYloieJADiXMAeKhKIqj/MaeD?=
 =?us-ascii?Q?Dk4vwjdqbwen2JSOo3vxRbM+pXPFErnEwSuOOhUEQbtkdgPHXmlz/0A3FT1R?=
 =?us-ascii?Q?dBCAn4GOvOSqg5t8gn2sZDvX39gdxp749PDtxBjHe7lObPjN1bzI/xNk5MSK?=
 =?us-ascii?Q?Q6tGHyndRDKMDu8yt44ct5L2RCjgEbxK/bCGJI9qZYm53BfuUFhUW9P2MJXl?=
 =?us-ascii?Q?Rl3Y18vxXwCLjSwQZC9YVFcF7Zj4ET7G25SbtsmhBwygobc5fqhmqjGYRXZa?=
 =?us-ascii?Q?upyaz6pC+Jmcna9Ww/SXD3ulg1kR6qO575/+dXWuYM+qmmlYQJzheBSATM1b?=
 =?us-ascii?Q?m5fbxsztrUCQmVDPQio+k4UQMibRBaPg0KAn/cT2TVtfkmjqD1xkvb+zcaFg?=
 =?us-ascii?Q?RBKPdNk9epNl79O9IDH++Kqajie2BMvP9GaMLfJZycG4T+xUnHFaakRgjhGP?=
 =?us-ascii?Q?GSbpHiB9zTjZ4fBMBB/JwQxrbpo0IATLzxRI3/U6wji3YBPK8Qu8HWaL8nrV?=
 =?us-ascii?Q?NTIwAYeMRFmNs5nV4sje789shgiGABhkuWaqwdSRRSRa9MDmwnb0reoLARjm?=
 =?us-ascii?Q?PKs+rW3llLMUMpS+z1a359elAPoCupYzcDmgs8nI2HIlhdn4LG/CrhXaU8GU?=
 =?us-ascii?Q?A0jTNbKpAso02zas/B21tn21sVYA4pJNfdzFJ1/YC4v7M7OpFKJFqRcnbGrU?=
 =?us-ascii?Q?heBIhuKEAMLn8meOQA0Muy7dio5de05OhiHeKfJu36cPgydcmNMb4CEXfgpZ?=
 =?us-ascii?Q?mV+MCimXWJOGtWjk7ayVDY2W3s9YRSi5IOimYIwdM/twRefbMSkbDWv+DVBz?=
 =?us-ascii?Q?cRzivqO2JXFqazQ9N+Ll/Q1FmtmtuCWQSt+sHsn4vuoY9trErw1GYYw2VW/j?=
 =?us-ascii?Q?WI4QoLaeDLdzWV05gsTHLs/cjWS3M8dvn5ni/iqJDY+uLwQCMsxxsFqjbkKg?=
 =?us-ascii?Q?bn0PMOSJ4yfTEWPrKQFowW7o3KBgbMOWyRAupBgHZBBdSkBR/kX16JHT0/vo?=
 =?us-ascii?Q?aoyEn370zLMH36WBOm5vup7Gwadfkj7Qvb5YGfuIzloPMCzcK4cH/H/XZHGV?=
 =?us-ascii?Q?mZEUq3X/7igv00V+fpxOFpnMFKx5vwLWplEkOuzxZJJSWxTAVCU9ZLrmsHSq?=
 =?us-ascii?Q?Y88+UnWgFmXSB7tUOxSsrGAqZyjSSUJvh/1YI12eFPsxJqIDctaVsSGflFPU?=
 =?us-ascii?Q?BtCY//4rGA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77954f8-5272-4ddb-b26f-08de5a8a9598
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 14:20:39.4951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uk2sCwrRlf4uwbGFlgJKLweE1m97zWkX2UaU3m4ChM17KKym8bNvlYHyhoxeMeLk6fvfRn99NbNEWvlY15u0s9Pusm6z3jGJgkAiJdqoSfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27352-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.986];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 9C63076F98
X-Rspamd-Action: no action


Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 23 January 2026 14:01
> Subject: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable=
 PCIe
>=20
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v2:
>  - Removed board-specific dma-ranges.
>  - Merged enablement and pinmux assignment in same file
>=20
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 696903dc7a63..6ec34e7565bc 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -122,6 +122,12 @@ key-sleep {
>  #endif
>  };
>=20
> +&pcie {
> +	pinctrl-0 =3D <&pcie_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

PCIe slot present on SMARC2 carrier board and the entry is missing in renes=
as-smarc2.dtsi

Cheers,
Biju

> +
>  &pinctrl {
>  	canfd_pins: canfd {
>  		can1_pins: can1 {
> @@ -167,6 +173,17 @@ rsci9_pins: rsci9 {
>  		bias-pull-up;
>  	};
>=20
> +	pcie-clkreq-n {
> +		gpio-hog;
> +		gpios =3D <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name =3D "pcie_clkreq_n";
> +	};
> +
> +	pcie_pins: pcie {
> +		pinmux =3D <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> +	};
> +
>  	scif_pins: scif {
>  		pins =3D "SCIF_TXD", "SCIF_RXD";
>  		renesas,output-impedance =3D <1>;
> --
> 2.25.1


