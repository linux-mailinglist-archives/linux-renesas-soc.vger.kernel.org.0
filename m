Return-Path: <linux-renesas-soc+bounces-28539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDTEFYWroWm1vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:34:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C721B90C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4683306A11F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87A12D0602;
	Fri, 27 Feb 2026 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vlocsZij"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9189270568;
	Fri, 27 Feb 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202760; cv=fail; b=Lnte6g8istmmGRBgwj0MCyFbqkkK/lGafo7K2V4i6I4D38yirWNFSkVNCYLRx6cbJ4chDdBMmZsCRANxu4TQVs0TCIaOZAcwzRw7k3c2Al6jAQYZnK7sM7JBPzAhHFceROpFXI7MYqs15q8+Z+2WcZR/DKz25Ox/chdhTtOyR+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202760; c=relaxed/simple;
	bh=OZ60ghbUNjoiO1VdblWBzb7XZfAC4LJ/ZQCVcuMVB/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cppoMbpWaieVRcBgKq4JmtAY0/QLO5atwUUSFktSt3WuxG3Xk8LJD/4XBgJeOACcllFWc93kHFDO1FaMY25Hlk/Es1G4JhrjbnO0VyV/zHzMqrNwpB+TOs8Z5iaDRriseotHl9EFL1CNFiXEEH4WcCetQ9drkS7Ovl0FgZqB9GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vlocsZij; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIjJJKBTqQ4Re6kQG6mrRvPh9vObssTqSQKmPEd1FLTss9UqzMlkQeQMufnQM/etb9EwENiaDGK4w7X8AqTxr3jjiAKMSBoklTC+Z1cvY31Xoccyp51M0kD+Wo4FTlfLLsI1NKAxHgV8A8NrAf6fbkjCq6Qv8zSgFaM7DhaEGtrtUCc1hB/YDkmmoK5oV119PCVWMgpIib3hXQdZxWAnygNZ+t7gw+fkyReBKZqBXxoH/30BVedSW1QUmmUbWAA0cx5JIdYyLO6/rXhS7bs89Kl0DszKZd20o1VzUCmEHoRgqq/9p6+v9MS7n6Im45bTybtJy6oJgspc9ETh8w0M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENWclE/VxDdewBN3BQ0dpZRMn+4IXFeDo3nWf0LdcsQ=;
 b=kRVNMtKLP4MTq2C5sNfXNzmaXdavbNXkThRLaD6+OULGhhR5HRLYGCtcXxCAIjkupOgrI6RD3SebEEngb4RdCnhzRRY0FDPN/sSJDDHWGgKzSDUg0AoEwObzx6djwQEzBf40SV9grovThYX/4CGkegBLqiuWndapEmWNUoyZu9vNzRSO++75hK7OCaiubiBG8oaou9whVwoe7YdrTZ4tW7RwdIjGFTG5CJmzA5u6pBJtzaif8dztWAshKBakAJyTtHrcd0G9QFtUTqdd0mVVGKFDzx28W17l0+aZ1CiW+PLtUVpCims/lIHi0gxF9dlAnnmtScMY/kWpb3NW8BbtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENWclE/VxDdewBN3BQ0dpZRMn+4IXFeDo3nWf0LdcsQ=;
 b=vlocsZijaYH6rjO/f5vPATd4iNSdWjOxT1XRwPJOMmVT3ngxPtH9V03nm8H/KwDL6HONwiPYY7/JQLagJZSDheW7esIRTKSWtv6Y3Fnwj3WngtrG+X/1GgzibwNpMbgdKBprAyuvBCRUOKimDInBK0ufiB9B+1I32uU7jOSQ2j4=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB14563.jpnprd01.prod.outlook.com (2603:1096:405:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 14:32:32 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:32:31 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
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
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Topic: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Index: AQHcofBJZRfdCHLVEEKSNsUxz8rOc7WLR8QAgAtbH0A=
Date: Fri, 27 Feb 2026 14:32:31 +0000
Message-ID:
 <TY6PR01MB17377D03E5B473D43B9EEA50DFF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-12-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB113465A6DF24308C10019193B8668A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113465A6DF24308C10019193B8668A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB14563:EE_
x-ms-office365-filtering-correlation-id: fc4e0b01-f0fb-4e3b-a882-08de760d0aa9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 YrgTrMBkXOTGbtBG+rYNfwbMM5b1WfIkacBiw908Ko+oWzoCyuoLUNDdhT6XJIb42FjHOrz5HHENQMoNbeTJqYA2bxcaPLC0unZyRMEiL8ShXQCAtGqnRyyajMTZOqPtgs0tvAQ2vEUfTjcAee/Cg6EWf9x2Y/H2SyxVrqhufNR+KkXAddeOGpgjUchdcPPYgWpnkFiefooVGr8hYEWzwdNm6YRkeBJ6dTkuRwo/QuhpCMk6DZB/i/AjPedRkuStQM+X4rbrb4AHTxE1PoTITF3CWsEDS5DwwPk2OHQFRY4AzzZ0N5/51z99dOQQxgGYwYMMOGrwQl0iY5IpaI3oaN9PdUh2/VwWPEnRN55veZ0CWvY0sLWoMi4pJd4AVtcyoqSHP6GXZZXOs3Uu2lgzw5lPaC16BT9cD9DxS68Tby+r/btF5qFYp8xhhu8yI+wJGZTXBmr1sc4cPJ7/lPD/Tq+LvJcXCOr1uZ2BUO6RS/r/k0X4BD6ZwKedCwzaI8Xg9Hh0IbMn5pFz3tber3rw2pqCIQMyDHwWg8VmbmSbweG6y13i+mWzehHqRCGnZGjnLOo5e0xJH1sAPExFcOQE82KHjQYvipDs2QuKUdlrfti8NSgpE/Dm6yHzMvMkQlQUY8lAPoXjwUGthbCgvmnimHSeMVZNDfS48ncg6qUEdgui2bPsGtNv6xKXf6ZQ7nF/vKo6oVqa9DfANQXVjM5kScPg1CUu4QY7ZKbvnNUZzzXHf8PF8QqXirC+C52BFPBW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vz/A4976tja5qWAvEwcX/1FIhUvaWNIp7IYVoJ58LbzBvin/afosYegcaaKX?=
 =?us-ascii?Q?R6c3KOjkRxtKdK6aeb6+ambnmN+DP8EN9DXye5PaRxQFm9oWwXLrcE42pQtN?=
 =?us-ascii?Q?sHiwvklpNmhVKfD+6d76W3oYIbwJMLqFo4iGYGJqO6uQ3zKZjAOL53anByEQ?=
 =?us-ascii?Q?gimgeKYkRu83KqVMqKXT+BB08DalJxJbHNf+pmFOood9tvjcVY+sMxztIwu1?=
 =?us-ascii?Q?1WHb6t4kwuAg6ouZyZUCS9HS9gEP+sLUiaVuvEg+aItxeG1oWxnS+S2qKWUn?=
 =?us-ascii?Q?dsc6+7qxL+UvQpXWslOBRY0EoHBKeBUHVsY6NOu1LZ+oBV9AY1fXEUtfGSqh?=
 =?us-ascii?Q?aRrQkiu2T/qbMz90g2tALyfmFMLL6ayCcg9SrAeWVST16PJAn0zrfAP8wVbu?=
 =?us-ascii?Q?HQbYtPiOiF6omGbq//2GSJi+MdQ680IC+YhHGdZqZEmLFaxPdjtFmPQVLbrK?=
 =?us-ascii?Q?ugu+vCkxNrcgUUSkBS3wtoynVvwtOrk9kWBXEC4XLhMxdCsBUd9h1tM9r1Bv?=
 =?us-ascii?Q?rg0yyEh9rFdBASs5boW39TlG3c9NYFMgWq/hYc0ZaVwtwMoNW1lBIBn81ABT?=
 =?us-ascii?Q?4e09qPMnvRL2Mt79W4ouCqU3OSVhhqEoiBQ8r1UtHFi6lGHPKWXDga+OhdXK?=
 =?us-ascii?Q?i4x6a/1jvdBdFLfxnbsUxsgs8+VZjNgO0anLeRwU66f8m36gI51igzDu6XUF?=
 =?us-ascii?Q?QbbcUIZz1Bn+zynYUEg9EUKT+4VzhKdHInJBW5WnuiKEjWLVL4yRI+1wd5F9?=
 =?us-ascii?Q?6Y6Yx3Cg5P5V4xQGHMN4JYLbFHpMFA9rvveTOnCaE3rGUjcQL8lMMzR2uJPu?=
 =?us-ascii?Q?m1y7ocoXmrfjb5Z3Z8YOk51rWGHzz7P7WE1zL4F/G9YGJ7vkrxhBfPM1kkG2?=
 =?us-ascii?Q?eihvC0FLcbNzj+PY8I48yP/+nyLkInvB96C7vLQjXMwKCTNQtm0t4LsehzSk?=
 =?us-ascii?Q?kW1fHngyEN0C+xn6wxI+VXayhjYLK/skTdu0zxXhL6hQ5Jp7pQNwSLvIAS7q?=
 =?us-ascii?Q?Wrop8UMhw1Q7GYnkE3pZQj+WB54TFNQHyL/lRy4N9SfCUJAgs+QkhUHwRp8a?=
 =?us-ascii?Q?qNDAufSXmhDFkLdy/FVbshRWKY2UC/X+hWoO1p7G1hTF/Fpj4lUkylN8jfOk?=
 =?us-ascii?Q?tVugcG38DmBEyt2+rPt0YrK2W1sPbSYAjQUsWAOMRVD+P9i5Zw+i1PdtQzq1?=
 =?us-ascii?Q?p1B64F1k+d9VR8tW2zngNVXrB+34fHQqXonAqA6z5FDfKHbzff9mbxPZzrz2?=
 =?us-ascii?Q?8H4mKvsoSTPqp1P1ffHRDZYztmj1VXlbaSxVfL+1/1Cpmp0oK1DkuxuIt2rB?=
 =?us-ascii?Q?9DAGnZ6lKxCFhCGS8RInvgbttfx3OblNDw3WX5kgg7joR0b/gvICsr0/4KF4?=
 =?us-ascii?Q?mLrYecFcVyKlZIzYGhJQ7oV5/4VBXUnAD/KjFJcbOMbH0boTy38rMHlY9fIG?=
 =?us-ascii?Q?c3avfrb/8QQ0Xa3vNnUPV3Gj6UgsRLZC0RGOTY9oFde4P5VBTVMsgxuHBLWj?=
 =?us-ascii?Q?eF7N68fsQAOsoPYUn7lVefm/ru/74ROdJuJDVyzCW1/LJqfRBOGpEEw88PP5?=
 =?us-ascii?Q?chKANSrtt8KRzwpDOug9QrploGWkYFDwJTekgcDrFgTcLb1rqtybD6BEMdEo?=
 =?us-ascii?Q?X57LWYsuSicZaa2ZpHDPYvYht4VRUFIdHZF9xgVRIchxCIv1HLg14/kP9lb1?=
 =?us-ascii?Q?0ng30UswQqUKQZoP3j7UiTxqtYZPdv86URxapH/SBqhXUZz9O3wHCujEzMfO?=
 =?us-ascii?Q?F8BirsAzMwGl6s2iRPzguJkC6baimt4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4e0b01-f0fb-4e3b-a882-08de760d0aa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 14:32:31.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRelGP1x3fyeqFA4oeKPHYu+5t6P8osBNG5GcSwMt4Obc5L4Qda95jm729Ppg4KN/xU0PyoKjlnJUiwtswsl+Dlh9zbi4vy1nRZvC6Bds/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14563
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28539-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: E7C721B90C3
X-Rspamd-Action: no action

Hi Biju,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, February 20, 2026 9:49 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> krzk+dt@kernel.org
> Cc: robh@kernel.org; bhelgaas@google.com; conor+dt@kernel.org;
> magnus.damm <magnus.damm@gmail.com>; linux-pci@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> clk@vger.kernel.org; john.madieu@gmail.com; John Madieu
> <john.madieu.xa@bp.renesas.com>
> Subject: RE: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code
> for RZ/G3E compatibility
>=20
> Hi John Madieu,
>=20
> Thanks for the patch
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 19 February 2026 22:36
> > Subject: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code
> > for RZ/G3E compatibility
> >
> > Program the class code register explicitly during PCIe configuration
> > initialization. RZ/G3E requires this register to be set, while RZ/G3S
> has these values as hardware defaults.
> >
> > This configuration is harmless for RZ/G3S where these match the
> > hardware defaults, and necessary for RZ/G3E to properly identify the
> device as a PCI bridge.
> >
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v6: Collected Rb tag from Claudiu
> > v5:
> >  - Used field_prep for non-constant mask to fix test robot warnings
> >
> > v4: No changes
> > v3: No changes
> > v2: No changes
> >
> >  drivers/pci/controller/pcie-rzg3s-host.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c
> > b/drivers/pci/controller/pcie-rzg3s-host.c
> > index c66532a3dae0..f7c23a56da5f 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1065,6 +1065,7 @@ static int rzg3s_pcie_set_max_link_speed(struct
> > rzg3s_pcie_host *host)  static int rzg3s_pcie_config_init(struct
> rzg3s_pcie_host *host)  {
> >  	struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host);
> > +	u32 mask =3D GENMASK(31, 8);
> >  	struct resource_entry *ft;
> >  	struct resource *bus;
> >  	u8 subordinate_bus;
> > @@ -1088,6 +1089,13 @@ static int rzg3s_pcie_config_init(struct
> rzg3s_pcie_host *host)
> >  	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
> >  	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
> >
> > +	/*
> > +	 * Explicitly program class code. RZ/G3E requires this
> configuration.
> > +	 * Harmless for RZ/G3S where this matches the hardware default.
> > +	 */
> > +	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
>=20
> If it is RZ/G3E register specific, Maybe better to define this mask at
> top level??
>=20

Most drivers are using the same approach, defining the class
instead of using hardcoded value, especially since the register
is from specification.

See RCar [1] and Mediatek [2] examples.

[1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/pci/controller=
/pcie-rcar-host.c#L448
[2]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/pci/controller=
/pcie-mediatek-gen3.c#L451

Regards,
John

> Cheers,
> Biju
>=20
> > +			       field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
> > +
> >  	/* Disable access control to the CFGU */
> >  	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> >
> > --
> > 2.25.1


