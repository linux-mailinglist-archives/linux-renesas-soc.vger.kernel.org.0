Return-Path: <linux-renesas-soc+bounces-34880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+q6DRxfTmrLLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 16:30:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6158F7275E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 16:30:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=WLYxSN2O;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1291E3030EB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDDE270540;
	Wed,  8 Jul 2026 14:29:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F02F8EAE;
	Wed,  8 Jul 2026 14:29:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520958; cv=fail; b=UBhXWfYE365rtXWSqlcovb+bArt6vQZnEGDPekcjT9fWo0hLn6X7MqwQXewgU+/PcJQyo1JLjGNVhoV00XjqG55Wb9Kd2J8J0JIwPw2YEwbUMaux+igsbauSlTsX02Z5MYgDk9ul6ZrXKCtgEv764cnGWFb6jwJ+D620gLXq0HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520958; c=relaxed/simple;
	bh=xu+amsdz4a1Ek8cGBGgefNEDYIW2/s2nLA59bSfYads=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ICRTVrj/i2cC6J41fLn07C12NomAe20pjdvSBtFGBw65KEe4RvOyPuwaVM6lxJfstBa5WM2gfl8oOaeqxNC8J8f66iwySZtbu1LWWhyP1ZPZoPov7bGDFpPdy13d7FDvb+GFteNNZE7huu8pJy4/qnqXiehas7ojIhuReBhg3V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WLYxSN2O; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTkaaVbzomaycPp+hvkvKvj9kloNhvc+uq2fNGEUlZnJUl4PT3sfltc/kuSd0shB+xKw6Am2RDWXRBA5Gj8d55iWD0hvYU7A6JGg/NWqYoHi8x3k95aUjRSQBK3t+FiGKl75yxhstWRq515yHn5rQw0hshAENTx2YNVtJUZRpe8E02HNcujX3EmPbdPVMZDxAjctDE5R4LLm4xnoATYMG4SLnUVdrY5aiZCmbgcpVBSwpohrU5fl5VIcX10qB/iZ0oP15sog1tanuuZqZtqOdOAp4ZQS454oZekA97RHrVA6GJpHX4viwwrpcSqFgUWSIcrQLrgdgXxaRDq9Zr2odA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu+amsdz4a1Ek8cGBGgefNEDYIW2/s2nLA59bSfYads=;
 b=RCr9SMNf9heJprjESYomty+MC4J3o1hXDGKj+l/rVMnVC4Ef0mR9t96qrPHJRtcGjk61wyMnkNUzexIBr2gdJQkr2DeYRa3yfNKPEA3ew/TXUy39xQl7yFVvANga3nM6aoF7BimQ/a9zVGjLDXVgboNDPE8TnQcGpa66SSL6X5lBFGbBMqnw8AIHEBqIXvVfR4v8ClynjAuip4Vh5irWGoIjebDinekUGph8tpJfoiLcXYeuBvt1kPzLAuwE7HEzxIvWaHWa2LzdnPGlzPyegG+Vn3rU5H4D08UqpVd2Id5FVHG5pQvGbiZr7No6ftrBw7xhwBI4gkJ0EcMBdzHz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu+amsdz4a1Ek8cGBGgefNEDYIW2/s2nLA59bSfYads=;
 b=WLYxSN2OiY1JeViIuwPXC3yi85QIbm3KPi0BdQkvZNXGNxXuICYn3bE0kMVMsVIhFA9WMRbcvgbM1mJxQIEQ0SAuXrgsLyOPafGAEymu1gu0ToPwhlt07I45G8trfVyFH/zpyUBz/wepJjxkth4UsbEFUkPl1iLkKZDJPSW+DHs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15810.jpnprd01.prod.outlook.com (2603:1096:405:2c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 14:29:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 14:29:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Topic: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Index: AQHdDh4R5wregCljJ02T5VlOWgMXYrZiKNAAgAEbSiCAAAdAAIAAJFqAgAA/ROA=
Date: Wed, 8 Jul 2026 14:29:12 +0000
Message-ID:
 <TY3PR01MB1134670E7EED71D2251CCB2E886FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
 <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
 <TY3PR01MB113468F9FB9AF3DEB1598462086FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWkew5pEtSoXpnjB0whCb9yi8MGEsvDTgyY0Dk+Ak0ezQ@mail.gmail.com>
 <682a0fae-c366-4353-a987-faa85e71fe11@sirena.org.uk>
In-Reply-To: <682a0fae-c366-4353-a987-faa85e71fe11@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15810:EE_
x-ms-office365-filtering-correlation-id: 366c389e-4617-4bab-f024-08dedcfd47f2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 GG+gxnaC1eJerhDy5Mgcj98+tbWrx5TMrPgFg0n1L6VGbs1MAOBCj/e1hNeSoEDXKtfU/urnvcsb8Q0d/x+mu6a/TJjCsdr24iPIVMGMjh/yViqzmljwvodDukhYIrxr2muI9siSYbBiXUWnH8YOm6wpyv3qzmcylZbNR5+nD6lb3mGZ0iTZ9DTdZ9vcNjuZgv8wzVq38BHdChjgfYlbkOYPyA3mU1/B+KX5VR9rI879N9sK0OjOpZ2XzOpiLYlA/CQvEL3Lb5HMSKV5w7QCKSPAHFbFJASKpTzp9AVVNXAzjoCHY/DHMNsRiGdzA5Mhsizp7VMBLbwOFTxIEr5xuI3tCh2FRWGuiJcme2J1m0KmlFnd6QUECUEGpSgkp34nTCyq7JeL4k30MpBoZdDc8FbzdrDbH/CDZnSyQgDCO3WOdQUEqTnDqR+l6TMNkNT/LAihw/9wzRSrFc4YFtIEpPR/UkwVc2BM7Nt0ngGa/YZIbKfwDq6bMWNSnGU1jPUmtmo6+zH2frseK7rRqNa005iE4omHqK33bXF7U/hSWV/IBedxTPXE2HVY12pc3laZ/qfHd9ic0oaLTOQKru0UwsMNvNWNimgtntaK2n6NQHvoSxAxOHOOiObJFo4DApOyG6t13UpaDfddHGEnb8Jy6TKVjovec32W1Cn+Ava6LU+wdIU73UeSWaxRwbAe2NiM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xBnf5Z+Key6n9LJVs4JZ7mgCmGBqPb8kXfJwYtu71hdmdV5BOgg9ouN4Pd7G?=
 =?us-ascii?Q?jwHdgw5dxXiMhUAKj7ZPmdEKGFGfBwMOBEaZHRr3WS6Lj2wtnM0HTJ2WW37V?=
 =?us-ascii?Q?aVwjz8+yikrLCmH5g8nWhRZu+rSXyu/NKXYnZIC8G90gBcyaP03YEY+guN9W?=
 =?us-ascii?Q?BrvAJe/76PoaUstAyHVrT88pnG1jHN2gjhHwzs/N69PSl4UU3QAQLQ8qejbv?=
 =?us-ascii?Q?Jws2R56K6NulQECzs4jhLD3QU5BgU2dUbsaf5+XaHA6c1e/yeeSft9kqeiit?=
 =?us-ascii?Q?bejA+abaOE6tdWaRCj1meg2kQVTaaaaSBCBuX8bajK+5Uw4ioFbkui5U73d2?=
 =?us-ascii?Q?PTrk70Xz2KEmiDJRCfZjUAJV0jwEjUnsdf0iVrs50XE7pW4amCqxQ3svBl7F?=
 =?us-ascii?Q?58BENuEH/Kc7FmrhpGCpU0LrsGxWayUwb3IExIgCH9yiIAmjwoeZrt0yJob6?=
 =?us-ascii?Q?PHVQiFsoh7eZDEVoMrjWWzAaO9QL0lkWNgOL68ro8RB29Z9gXCuDxYOgoixi?=
 =?us-ascii?Q?MeGcuaPRMVPZq2TDeA9IYuAKm4iXN2AeK2iYo5JcBuHoLZ8136xuLI2dBCO3?=
 =?us-ascii?Q?Ogir16/e2xYm5MgctIE7ir5f0KEmGLmfHNtSLKBg0WmarESn7i+y+seXSb4R?=
 =?us-ascii?Q?70oKAqc9zwl67O6b0kfYMwUuDvlvAcbrucX2FC7J1UePUuQERVrABdYir/2W?=
 =?us-ascii?Q?82/W2GpYqBnlocAJGekj2jmo2yPv8CY6uQkEuPkUhN60fMo9NEIigRduR6EA?=
 =?us-ascii?Q?ZU3h0fKHiqIiyet4kP/AYnmB/hQFos9+d9SrfMgk26afek4LNUR3IaujXiHM?=
 =?us-ascii?Q?H9+RQTr6kwmKvXqEfn+A+7ozLhxWyQ4BBMWPV89oWicXY0zZ44LLixGG85LY?=
 =?us-ascii?Q?o1rmqA22Z0jb1fi4T6nUtg7y0Kgtej0U7W1++Wf+ItBATGAK3FIsPwhdq0Oj?=
 =?us-ascii?Q?bnoTf0f2E9LZTNHnkVUgd+iTlPwsy0eMIPsNNLNciIoUV42hg8TjsbFDuKmO?=
 =?us-ascii?Q?hfOwJ0xw8+AigTicDBrNea9zp0suzB4Cy9s9TzydPAWbh9j6vp048YqyHMiS?=
 =?us-ascii?Q?j7UURP+LqrQCzZlV0XbDfmStlNT/s7h6jZuBNPwcynADeg2kT7DnM0q2noGy?=
 =?us-ascii?Q?QI4nqcrzF1gEF3RRtgIvIQ0HerXuHW8cI3FPUpZ3sprGc4FC6EvFrdSdbNOt?=
 =?us-ascii?Q?tu+WLjU4eXRFOkiK9Il58LafezLPeb2JeP0I+NsWJ/ovT38ugCbXeVNIBzAy?=
 =?us-ascii?Q?Iw4QXWl8rkNngQ3Hv0baaOkb7NOz0d5JSIxtvr92PBqV2Ht7Pdl+rFEOi/06?=
 =?us-ascii?Q?3RNS2uhaF0cl7t+liMb3fLVsldwg3z1cChSxf4AIEFLvaFxYZw2broHPohX5?=
 =?us-ascii?Q?B26+fl0wDAPC94JhqlobnvsLMJd0NEXMmOPYcPRRU1DZQUZCVji9pwwvqBQf?=
 =?us-ascii?Q?1owcmodMk/z00Q1mZojAMOB8FqwvBByIrmgenZ/GqktUP2dtlsnwhYkV5fnN?=
 =?us-ascii?Q?A1lXp1fnKJzUTbO5HOPbKP50tJSD57oiD39GO3Ytyq8MXvmLTvLkMQJrSID/?=
 =?us-ascii?Q?z/iLqZVt/9JKg10sYAyhJIjNcTbZy2LmACy7TPr7Db8s7AqwKpWWselpNXV+?=
 =?us-ascii?Q?a3RPfaQXV0yVzoUoArt5gsEwLrYerldI1A6DgFLER+DQnKyg3ohv+uOC5V+P?=
 =?us-ascii?Q?fHabPHpQsp8IuoJWDkAHfW3h2pHYSlEvhfoyYm1UdaBJveIo0NPHVTV71g0/?=
 =?us-ascii?Q?idVTaFtDjQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 366c389e-4617-4bab-f024-08dedcfd47f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 14:29:12.4639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UF2p03fTdKC57bqJHmcf4lVwvT1du3daRQpbd5/INKed3RhUkSw83LJu2ERkgJeSQL26VLrgDDkCiCWvGNRLSRaZcAsbMuJMKq/WWOYv93Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15810
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34880-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,vger.kernel.org,glider.be,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6158F7275E3

Hi Geert, Mark,

Thanks for the feedback.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 08 July 2026 11:39
> Subject: Re: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ=
/G3L VBUS regulator support
>=20
> On Wed, Jul 08, 2026 at 10:28:46AM +0200, Geert Uytterhoeven wrote:
> > On Wed, 8 Jul 2026 at 10:10, Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
>=20
> > > I will switch to single init explicitly registering 2 drivers like
> > > [1]
>=20
> > Why do you need two platform_driver instances?
> > Because of the different device names? You can use
> > platform_driver.id_table for named platform devices, just like you use
> > platform_driver.driver.of_match_table for DT.
>=20
> Yes, that seems more natural for this - the ID table can point to the set=
 of regulators to register.

OK, will switch to platform_driver.id_table.

Note, Initially I had an issue in probing the device related to
id_table match due to string length restriction in [1], so adjusted
the length to less than 24 chars.

[1]https://elixir.bootlin.com/linux/v7.1.2/source/include/linux/mod_devicet=
able.h#L604

Cheers,
Biju

