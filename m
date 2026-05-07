Return-Path: <linux-renesas-soc+bounces-32237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCEFOziC/GkcQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:14:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875D4E80D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B13430027B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE473EFD1B;
	Thu,  7 May 2026 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B2Jnn/0h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8523DCD99;
	Thu,  7 May 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156085; cv=fail; b=QmKHEzxKt1TQVr5AuIJrDIPbjP6HFjtQmQTQXbe77YfmQog3iMp1+sZzh6CxaxIqGyELWa+iPq11jj6x+urn3wYS25IaiFTIzDaCn/YYVQEytAPlYWPG/7XszVHJ5PpnOaDM/8cz69JZwwzGEZFgiw6oPQtCI4J5B+FJRhSCG9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156085; c=relaxed/simple;
	bh=LqHndnguFGfp/DQqVaFazCHYJxTFwG2xW36+o+GIqco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t4Fyxjz/vKF/RO+pJv2ZFFtBIdPe/4bso9e0Li0vQyKIIWUxWbPrObYpz2u+ywBbjuJEnl313/jgQ9/HhBTcKjTMqHZOYm0j5dYx2eEm7Pz+PW3jxPj8TixK8FxpPq1WSVBN2D4/EDE6Wb+FWc1diuI08XvMLJNBX2O1DR74Rp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B2Jnn/0h; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZJQ8jv3Q339WgPsrMkXwEZoVu2K0bKyBlxozgevC9KE3L7S6fXrxJZqYL5YDwDa42Z0ex5IfRPHh1lys+iWQX/BLFoBgoY6cJi59UT7SCoFE/1T2EmkBQSk7u0JB4EllKY1wVrhy2n3OnMgvAHpeZywuXd4zjP2Oqub8NGVOrNPDJJJcICX+bwuDS91u6lfuxk9UQ2RBWBb8iWn2ZvQxj3FrTOl80aCBEBVWkqJiPJmr6G3s56GDIUUwLP1CMHmdmQS0RlFkFRR/zSUlaWx96tkNsdfQQHqmYGXEyetInldWm4TlycvsuewkkdCVqh/c++S+8lbZzCtnSM1hje7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqHndnguFGfp/DQqVaFazCHYJxTFwG2xW36+o+GIqco=;
 b=hqB6qXKQAe6EWsqEnfN+3Wbs3qXU1TVR02YxHfSIyqxeT0LRSSvGeYh82trxA4XUQhWcKLx11IqE5otv3MBOQRVhYYY41deSLOWOUf2fS2EmTgZ5SGS4HwysTwwK8OCbtuVLnb11/8PQFTbWIO3OWiJSD7O2zVenWRy5pjRPBNmKVSceLNXwMao2oYyEiAZy7XVFfg3T71l9DtDd64Ck75RCaj1KNn423JIJaOxUNuufxrH2h3XO+sFdyxhVIX1npgtvJEx4HCcJNdOTpfNcw4N80wfLzz+MlK2o7hwKTfHunnin/IP8rp/aunNLKB/GV/rgOm5XFfmhzWdRiisB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqHndnguFGfp/DQqVaFazCHYJxTFwG2xW36+o+GIqco=;
 b=B2Jnn/0ht/HAtVv/kaxAiN5W/dnKpVzH3qk+ZOS5t/ZjQgqN99kYUTjSw70HAMccfI/l2jywghBouFMhNySO+pq9DFm9XYcSzuZhpqoEczZFK0L8o7jskNzdY1vYfrOGnylF1lzgXZEjUbu42gmQlH65NP7wyc6M2RU5mpoZkYk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13232.jpnprd01.prod.outlook.com (2603:1096:405:115::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 12:14:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 12:14:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl
 configuration for ETH0
Thread-Topic: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl
 configuration for ETH0
Thread-Index: AQHc2KBo3Ztzio0PUE+OIk2OKpvk/bYCgRyAgAADdKA=
Date: Thu, 7 May 2026 12:14:32 +0000
Message-ID:
 <TY3PR01MB1134654F4CA1F849A9EFC7D30863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
 <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13232:EE_
x-ms-office365-filtering-correlation-id: 7f64db74-288e-48ad-f5da-08deac323283
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|3023799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 YND2KGdXS8fbOaJuizpchvP9faGJBgLO1VMuBz7HMKezYj5vlg/sDbj5PUcgRIrkaHpmNHAu28w+NPiAZjGhkFoQqJYrfwSuoKir+9KH4eDW4AVJIECyFbDab5Xx5OO+cbpU5o+QpyZsNHXpdhVrUmWJjTMIm0i5q7VM3434PTh4ofg/zXS4bsdTxIVs4KLtWw5BSY9fIou1FqC0ZyMCviw/4d2pnXuP+qSMH8jQQY3sB4NpB0nCLU4Ybb3LJpCpyOh1iTVPemrASoKT+g/KXOP6FiV3WsAlBnc65/Au68DQzyktwc57tGmLKfpuDuAusYV8W3Mg1+7Tixclrpj+aetMxu8vsTIO29HBNI8l41ru7NLmZjvy6DQUiiaL7dPWhASRuflzsqJeudMcYLqu8Q0CD8/TY03Bzpq7+i3vjLDznxDWUh1h2AZ2DKn0GB4Dx8XG5jmtACJ18al1kccETJ2ZuqWJZEvs11KL4fJ4cU4gu9zM7nkhfoBxQX5ca5JpNwqV7mebK7gx9E7/y0jVqw4IwYDPtjJqLW/6v51J61BspwxHXF4X/T7HhsKLxzY3RKNhCu3zGn2goMasQOCVa7MBilrYfOvTGuqQ8wxYu6GbB/DDAeVx3IZI0quPlm15XjJJhZGUZEMRPaGS3rWGty3b5cminEJ2BmBJGxazvYgPE6R/NYSfGVxuPd2ZtWvehco66cxPnkqlGMVnJFME8eE4e/pL7OzKl/tfSQcqNDPvCxXksn5HLeRJHLrIdgze
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(3023799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjd6RFpNZDJVOU8rSEM1UmdTVXhwNHhIMlUzb2tYNXNnQkwyOGd4WFZxbjdQ?=
 =?utf-8?B?L0cxTDJ6Y1lxdTdoN0N0QlI2Z0VMSnlXUXVLdFF3T3hVMEladDlqRHZKQjdT?=
 =?utf-8?B?ZHpLK3RCUnAwNG1Xa3N3TVpvSUJVUGFOOXBVV251YVo2Z0hjRG0zV1FJOUY0?=
 =?utf-8?B?aFF1cXRDOE1KbTNDd2JCQzhUYVpCNnBNSXpmM0U4eE9aQ3AwanR3QWV2OXZM?=
 =?utf-8?B?V0p1dUZVN3dVKzFnaklRWXBkRTNsdGVLMFJsLzFsNW9UNjVOUVpsTTE3QVI0?=
 =?utf-8?B?OTVJRW9QWnRpVWFJUUtCTUJicTYyZ0Yzc1BST3NsSG9SSlhVelNpaU93OCs4?=
 =?utf-8?B?ZC9QRnlwb3Z6TkVZSFRzRGlJM1NtdnE4YUVXYXZZQ3NMRzlYOFZjWmJvSWV4?=
 =?utf-8?B?RDg3dDFsdFZteXp3d2E4eVlYb2IxY3hZejBoaDl3b3JoT3Y4QTh0SktpYyt2?=
 =?utf-8?B?cFlpck1iVU9GYWJmZGQ4ZjhQdWUrWndVc1I0V0NoYWlHcFpJdkZub3pjMTJJ?=
 =?utf-8?B?dFNTbWZLMkwxaEtYcTl0YXN3aEp6S3NnVjFmQWJTWGVSOXJBRWdYeGZmL0hk?=
 =?utf-8?B?OUdtbnkyRnhVbUpXUmVoRWF6YzlObjVvSmpVc1AwcjJhU3JIQ0J3RGxxQlk4?=
 =?utf-8?B?UU9Pd1JqeElkZ1VEZGlMbXUxMzNOZFZWbHlYK01tcFBYUkxTSlBDTG1HUCto?=
 =?utf-8?B?aEdhQzA0VVppQytPTW80TTFtckxTbS9rWjE1M1VCRm9oSE1WUlBHV1RZZUNL?=
 =?utf-8?B?Nm0vc2gzQlhteEEvNzUyVVZGMG1Nb1lwa3hMbTNQOVdsS2RNNVp6eWpDTWdE?=
 =?utf-8?B?NnVqMmJmZEZqS1R2RlZNU0FCd1ZCd2xVN2FKZlVHc0tDeDcwUStyUVNDR2pT?=
 =?utf-8?B?TllaUDVWcndoU3VMak5DK3hhajhQRFpEZmh1S3krRm41bnFsNGRLTngvL0dq?=
 =?utf-8?B?eGJUNnJ3STZpamRFZGpHQkd4TFNTTW8wUkQ3YVl6VEdjajBiQmdjTnA2anBn?=
 =?utf-8?B?Nk1OQVJyUlk5d3B5SGZhVWZUUXFNajlJdWJTam1XSFlUcjlvdGlLRTIzbnMr?=
 =?utf-8?B?Z1UxNy9GMXA3QWZBcmIzZDBTdkE0cGVJZWlENy92ZzNxVnJaeVh1TlVsT25C?=
 =?utf-8?B?SEpObkxzbFRqWTdCMVQyUEdiM1VsbFFuZlhIMjdRQ1NnbmZ5NkduTG5sRThF?=
 =?utf-8?B?Y0EwYWRUandJNHpqRUlxTy9SaW4zMW95QWtGL3oxWjV5cjlHbjk3WEtRanVw?=
 =?utf-8?B?TWU0R1c0dHVBRHplT3I5THZmdXl6R0x1d3E0azM4aWNNa3dyRGdoUTVUa25B?=
 =?utf-8?B?azVHUkFZZlg0MlZVWmUwWE1zNmNOMURQUTFpa2RPNkRYVENhVHZveXVyd1BG?=
 =?utf-8?B?eFp2bGZkYm5YdlR2eVY5cTd1WnAxMENLYzhqWTllSzV4L1VFOC9KTnlSTkxa?=
 =?utf-8?B?Mk9vaG5HVkMzTzFzVlFRcHZSQis3VVNIT2g4L0g2RHBRSzJRTUdYKzFtQmI0?=
 =?utf-8?B?bWlCcGNkd1EyWGYxK3Q2Q09vS3ROdTRPazVJd2ppb0t3TnNyZit3UEZwSmJw?=
 =?utf-8?B?MStEdzRXT3lLTW92V3ZIcTFIZWppa0ZnTzRVa3FabkhqenM1TU9UcjRUOW5F?=
 =?utf-8?B?VWtsTzlQVjdjdC9PZFhLQjVDRUJUZHdOaUpSdlYvV2pEb3A3aEw5eEMwT2ZN?=
 =?utf-8?B?bXN6K2I5S2hnbDNkdnkzRExZeVN6QTAzUW1TUWJGSC8wRTJ2VFRxdVVtNzVi?=
 =?utf-8?B?Q2pCdWpHVG1UaXYzMytLNlFSMEZvQmthemJJWlhwM0RwZ01MSnhKWkhmcnJG?=
 =?utf-8?B?N1pvclRTdC90dDQ4ZnlKSFV2MXdKbUp4cnV3M0R2ZFVPaDlIWWphT25Za0Fl?=
 =?utf-8?B?TFRrbVl0UlQ1NkZqd1Z2dWNWa2xOeU5QV3h5c0xOYVgzUzZtZWJrTEwxdmI4?=
 =?utf-8?B?QTJDNTNFN01CMm9iemR2KzVPanBoc0FKVXRKVlViZUdBNVVPQnhjb3JUKytL?=
 =?utf-8?B?ZGpiczZFSVZzcURPb2lWeCtwenZJenN5eDByRkpwK0JGa0RKT0wzNENxdCtu?=
 =?utf-8?B?QXdEV2kyRE93akhyYXBWMTZ6WnZ2ZFhvOFIvcm9WV3pkdUw3Q0pQU2R2SW9S?=
 =?utf-8?B?Z2ZRVDF1MFVyemlyQ01uNytweHVhQ0RoTitXK3BVdEJ0ckdxWWp5dVBvYk9J?=
 =?utf-8?B?am1QYXh6YTBXMDRISGx3Z3ZCcjYwV1FyNnV0VVIrcEExdm41SEJ1RXdhU3di?=
 =?utf-8?B?UXVrNGg2cXJvTy9DUVRBZHo3aGdOVC9ScXpMeEhreHFNcElnNk40cU5ZeU1w?=
 =?utf-8?B?ckJHcnJsU2JRY1FOSXplWWFFaE9VR09TVzhsUG1vYVVja01KSVJyQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f64db74-288e-48ad-f5da-08deac323283
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 12:14:32.8489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPRJOxL8Ro24mT1Oie97qLY7/ddr14nq1GdhYZAAVpe26sxXmQvE900VeAdquI+rbPzHveEsUhiY6sAMQeg4QTuWV6v1DAaTmJB3GHmVKL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13232
X-Rspamd-Queue-Id: 6875D4E80D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32237-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.7:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,renesas.com:email]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE1heSAyMDI2IDEzOjAxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgNS82XSBhcm02NDogZHRzOiByZW5lc2FzOiByemczbC1zbWFyYy1zb206IEFkZCBwaW5jdHJs
IGNvbmZpZ3VyYXRpb24gZm9yIEVUSDANCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDMw
IEFwciAyMDI2IGF0IDE0OjUzLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IEFkZCBwaW4gY29udHJvbCBjb25maWd1cmF0aW9uIGZvciB0aGUgRVRIMCBFdGhlcm5ldCBpbnRl
cmZhY2Ugb24gdGhlDQo+ID4gUlovRzNMIFNNQVJDIFNvTSBib2FyZCBhbmQgYWxzbyBlbmFibGUg
aG90cGx1ZyBzdXBwb3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYzOg0KPiA+ICAqIFNwbGl0IGZy
b20gcGF0Y2gjNg0KPiA+ICAqIEFkZGVkIGhvdHBsdWcgc3VwcG9ydC4NCj4gDQo+IFRoYW5rcyBm
b3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3J6ZzNsLXNtYXJjLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzNsLXNtYXJjLXNvbS5kdHNpDQo+IA0KPiA+IEBAIC01MiwzICs1NSwzMiBAQCBwaHkw
OiBldGhlcm5ldC1waHlANyB7DQo+ID4gICAgICAgICAgICAgICAgIHR4ZDMtc2tldy1wc2VjID0g
PDA+Ow0KPiA+ICAgICAgICAgfTsNCj4gPiAgfTsNCj4gPiArDQo+ID4gKyZwaW5jdHJsIHsNCj4g
PiArICAgICAgIGV0aDBfcGluczogZXRoMCB7DQo+ID4gKyAgICAgICAgICAgICAgIHR4YyB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNMX1BPUlRfUElOTVVYKEIs
IDEsIDEpPjsgIC8qIEVUSDBfVFhDX1JFRl9DTEsgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
b3V0cHV0LWVuYWJsZTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0
aC1taWNyb2FtcCA9IDw1MjAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICAgIGN0cmwgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11
eCA9IDxSWkczTF9QT1JUX1BJTk1VWChBLCAxLCAxKT4sIC8qIE1EQyAqLw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChBLCAwLCAxKT4sIC8q
IE1ESU8gKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9S
VF9QSU5NVVgoQywgMiwgMTUpPiwgLyogUEhZX0lOVFIgKi8NCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQywgMSwgMSk+LCAvKiBSWEQzICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVY
KEMsIDAsIDEpPiwgLyogUlhEMiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxSWkczTF9QT1JUX1BJTk1VWChCLCA3LCAxKT4sIC8qIFJYRDEgKi8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQiwgNiwgMSk+LCAv
KiBSWEQwDQo+ID4gKyAqLw0KPiANCj4gSSB3aWxsIHNvcnQgaW4gYXNjZW5kaW5nIG9yZGVyIHdo
aWxlIGFwcGx5aW5nLg0KDQpPSy4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQiwgMCwgMSk+LCAvKiBSWEMgKi8NCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQSwgMiwgMSk+
LCAvKiBSWF9DVEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpH
M0xfUE9SVF9QSU5NVVgoQiwgNSwgMSk+LCAvKiBUWEQzICovDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEIsIDQsIDEpPiwgLyogVFhEMiAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1V
WChCLCAzLCAxKT4sIC8qIFRYRDEgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQiwgMiwgMSk+LCAvKiBUWEQwDQo+ID4gKyAqLw0KPiAN
Cj4gTGlrZXdpc2UuDQoNCk9LLiBUaGFua3MgZm9yIHRha2luZyBjYXJpbmcgaXQuDQoNCkNoZWVy
cywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpH
M0xfUE9SVF9QSU5NVVgoQSwgMywgMSk+OyAvKiBUWF9DVEwgKi8NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gKyAgICAgICAg
ICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiANCj4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1
ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2Ny4yLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==

