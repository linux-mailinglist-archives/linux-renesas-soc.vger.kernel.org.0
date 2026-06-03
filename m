Return-Path: <linux-renesas-soc+bounces-33492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HvuXBgDUH2omqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:13:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 590016350AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:13:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=DLP2LTlj;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC3E0310CBDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 07:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8BB39902D;
	Wed,  3 Jun 2026 07:00:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B486939A809;
	Wed,  3 Jun 2026 07:00:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470030; cv=fail; b=KUnpvLk49H9q03cQH/Tgcd4siYaL7ZaoIjR09+jfruQMZ6WdQIedRTLodGzPF3BKksNBVm+J+MazE1EmsEoFG+r537n4qoXDezj1QZCdZFfYKnuf/DhoKG2daow1taIu4N12kznH6agEIUr5ZWEFsyRziqZPAaEckpzjN1ESCvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470030; c=relaxed/simple;
	bh=K2b33TFMYP/mGQaBoJ/2twkoVauU6XmQezDClIXL+2g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XeV+XoCA6gim9ZGfcDo3XHn+ReAxPJSljeFQ7Dxe4CmFovrrBG31DTC+wvArWhOLpPVyovVGvoEOC4LBheTHpFgLPuIldPOGJHzMHX8xcZi5An5dVEyelTwsSprZlA1ZWeAsQDjuB7zmUUQRIjldYNCqZ8fKKd74f+4ElhAMLbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DLP2LTlj; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ1KajVozkY2QqdQmfpNld9C/DXKIGdgRnNbbNGl3CzxDNW7KfhpzYdMDUgld9DITtPy3wlCux83U/vJp+q73dKlbl3iziG54FQ8yGcjmjXKYkEzFCgcvZkezblDaGlLxubqb08hKso0Cpr2bleuk4t2vwINgWvAn4j4jzzPeOYgkTNJdezWm2sHBG11qOkZH3p54okUaW0yXsJ5PvuGA+VELg27iWq+cbzFGkPh2aUXw3+O4ROgyWvzS/sLBvVsqI/kHVdv++DoBMkhjV3+zLDZYIRtRhIqsmKf0b18b7bpdCX/PPywUIjbejBD++Zsf/7InQLysi3Ta2L7165lFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiIxKhKrGdKIkro4B5UKPgxa2hFzFr/eewdMG3IWG2Y=;
 b=HHeGT//Oa3lOyTQFldQB6beleAQHNVgSU2qThifsirdZOhiL/TAYTuhxlVJGFqxh3qBUIdQz39J2pu56jpN6RVbrv1T1YoFhnQE1bEzoaKYXs7KIDp774gF4ky/jx8iIjl4psn0v3a27YDVAe6Pju8todmkIfHRZ8d9xniPmDadBQWDYuAVegcI3z87cC34ka4SRW+7GvuUSEg++3NrigTwG+AfWxsw9VByJfHJ04yD/QpN3wU44IvqjkJVGW0d4ne9YPzg0RmAz7LTsp6nyOkF1VnQWRw5uT6sqNBluSelFXq8VsFisVwVLh25Sxl3ZGuqliaeu0o6DxpMzQ1HHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiIxKhKrGdKIkro4B5UKPgxa2hFzFr/eewdMG3IWG2Y=;
 b=DLP2LTljYCMQy3fTd/6HR7dmISBQ/BXMV5jshGqD+KETY25qpBuhGudLOnx5Nl1oP04XkGOrxzyzkyEdTf64mFPuNyHLUWIgS8ZrHO5mXYR0+YafvByp4Ap4YziVDRxtbPM23Ic/X1la5bKUVYw1UoD2soi6CQ2RBo2+Ftl4qxg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10700.jpnprd01.prod.outlook.com (2603:1096:400:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Wed, 3 Jun 2026
 07:00:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:00:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHc8yZFMuP1bVIRGUixq2TgdBuPhLYsZmtg
Date: Wed, 3 Jun 2026 07:00:16 +0000
Message-ID:
 <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10700:EE_
x-ms-office365-filtering-correlation-id: b36f8cdb-c7ea-46de-330e-08dec13dc489
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 GVJqJyBQjkRrkcnYHhHL3ffXz/4NWyiancB4lC+GfRyEv9wCgGKyxHJFz5oESQl0L3nNrxjvao/tIjQ85w6HVZyA9aElhML+fuSv3xLvs9IR52zPU+2y0++VTsCtLBp5dWiwpt0FT0dn4yfgeY2ibmQ2FHQufqeyDrN/n8UcLNGwrNaGxrIECMIJBANm2u5bI8abok+YPpxdvHrrDOM/6OiENOhOXuOFvL1oq13ZYRRFJXwKD6imGAPsJF9keSS9OfRwxa27evhDWu19hlr2Ol1oNPoky4Nch/azaBsG7dGBoMsIyEATt2bd6lxU2iTXQZcNJuh0XlJCqL1ba/oJRLpZ5xbs6Ipcpxt9OaZmNpDSV/kh8YTKh80sY0yG+9kf2zzW0dQz2SEarp6hlxbuZHKDeagZFaVMFuJs/yWLF63dUJkyf+uIKXKKliUCGVlkmj4I5PLcIH9WAZioW4Iqsc9J4YLWJy21xKoVmWbB2mWpxnxooE8c/yQ31U7sguzqKlTKp+C4jepv6ojquNHi7A4cnEe+Flth1a5xaHHnJvlxfeliY/t7HrE7tMRYem35Y4QigDZSfupOja3NurPyeMWjFf2miHNMFT9cTGAnS/61A4N9LrxFaebe74KaiOc9yHpLaroWQ8faNGTs7rNLzfK0HOnc/gk7m72UUMnzqo+rFzS0QXvG9d2wxI/WLXuI9CWLx/mHANHc2Rm7/vAETVr/GRBk7FpPyp5pok8um2iNWGFQLGNUNoo3zD/IG9Cj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tKfdwOVIidh0Alxq+yugujhFtRuHnAJfhtvgSJOETP4WWgmuK18JVIjch8Jf?=
 =?us-ascii?Q?3505sId9keyR+5FK4c3xiKSLzLM7Rand8AZRFgl6aj0L0yrIu9pZHOfSG10K?=
 =?us-ascii?Q?VcGFdavfOmr1loi+lpnmqgbmreqJP053kwCXmzO+pGRc8NP+QujpUiC/baXp?=
 =?us-ascii?Q?Yd2W0+nSuX19Pv9iC+heGOuq2kB0NjAX8bHv1NvaccAhWcQjxp466kJCN/my?=
 =?us-ascii?Q?q5aYBmyMKSqE7sLYeulB02516Hs9SprtjLZNqthUqIxHMbljuyqRJTYcQb7B?=
 =?us-ascii?Q?Sf52RtWvR1/D0uVZOJvPBmT0oKeY4bOylXljDx3s5hud6uRrWXW4TypOpI3q?=
 =?us-ascii?Q?DmYZDBX4eedS/hYtq3oMdLSA+LfMPy6P+QnF0cWWa64+Hlp7MVdvyXMeA8Qf?=
 =?us-ascii?Q?g0fiwJxoJgGPS8LTFlnQAY0dZjyGfYnTdBC69KUj9poSlngCGQRxfrUp6MIr?=
 =?us-ascii?Q?Izu0q7sUQMTRCXYvpTloNhsZOw+mGjOhC5hkpzJgaecd5UbtMkyAZukuWgtA?=
 =?us-ascii?Q?BdYnaee/x4cQFIv36LwlE/2ig9w4Cw3WG9C6s5vdUpgVMX7KaIdmuO42u440?=
 =?us-ascii?Q?mk4R0YTQm5RCTzThDiB5cM94jUY9psfl7gSrKk6uZLjUKAdBG42p5yf2rXWO?=
 =?us-ascii?Q?BE9oLxHepAFULd0Vw9+AM9mqISf1QaKp3vslh6jpVKd7XVKEFXEAv/e1f6hT?=
 =?us-ascii?Q?3DGp8v5BxGivejsqV5wOLsNKKTpoJ5VDfcPU74r5k1HW7cfSesas01vjk09a?=
 =?us-ascii?Q?bLZs3EyhcdLJDw0nkaj/XAWW7UHzf1yge18rM+UXL2Nhdp18KmkIS/8u6JP6?=
 =?us-ascii?Q?CWZUHWg1Ys7OJE4WKdPI20tiz9w2XGoXGMyp4wj7SGb1jmufllw080Dly/T/?=
 =?us-ascii?Q?56r56TtKMc3RRm6I36kJHJS/hEnDvYpiP1sEzvO9ApObdNJV+f/AmoMO19hy?=
 =?us-ascii?Q?5pz5uAw/mNBayOOE0UAi6BReXJ2OIv+5O99LGMN1ce/TFoJqTU1Tcf/eJlws?=
 =?us-ascii?Q?h1LHlyffMh+2utmaTxj/qylFaW/t2C+tDELP4P+FA2sHc2cAUgVYXqNaGs9k?=
 =?us-ascii?Q?K5h02WjxoLeGGBCA0/Ue3ZRe/MCFvoMIhMjk9dKZ+rviltGxIyQRjcOtSwgi?=
 =?us-ascii?Q?MNFcbf7Av8VoGG1H3UfRmccDM72M2lXwa7U9IEz25oQQ+x/4P29XJQ7hBWOT?=
 =?us-ascii?Q?XSHfkQ0qgupIomN2VBirqiU+uQwZSCLoso/dO2mDoCHspbIwCrC8LGK79fpo?=
 =?us-ascii?Q?fqyyfOhnJAeoBuhwYbqcwNuTV2uvdf9UnQsMWSiChUnFwCSBKN3GAq1naR3x?=
 =?us-ascii?Q?m0Vh0Zms+tAQAqvpgVjJ0h+/beLukUvCUOSqXfL2Aqp9rMT5X0YL2JU9qMde?=
 =?us-ascii?Q?A/hd01ZBY+tPcWZe1zpFLrSTcTOJJR7oJBlzs0xj9eWTiaabWwsFAWZuTTT7?=
 =?us-ascii?Q?mmgEsZbmZXbpeUFwGK/GXJSns0gCLpNfuiTs3v94023O66Ee14rI9p5rJVl9?=
 =?us-ascii?Q?SPiblHyTKJD5sNfmg5jwMBfEguxSfZmyVo+sKwwLD1p2rkygCAOne5AHwG59?=
 =?us-ascii?Q?etJzKIMfVG6TQnkVrnGy1m4JWj2QjCZqZj52F4SMmrCbnScCZzeQQ2bjuVm7?=
 =?us-ascii?Q?ziw9KmLNmql1mdGlReR1S2oQYZA+w2jQukYb28FW/mMcJMeNP+bdHHZkktS5?=
 =?us-ascii?Q?oNf1ibja2Z5bOxdB6+45Z/UJWPE77004pCblzLrpe/hb6oBJRlHMe2q2PHvZ?=
 =?us-ascii?Q?LP/eYVyhbw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b36f8cdb-c7ea-46de-330e-08dec13dc489
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 07:00:16.6904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heey/y1ha56ZBEGrswOYiiqtFh/UMLAxlYWa5flyCdknJ/SK5Le/pi+iCWMoapGZafZAD8Pk9tZ7BJ07+B1uS10h5POxsdY2rNxcaXuCJ/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10700
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33492-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,vger.kernel.org,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:from_mime,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 590016350AC

Hi all,

Please ignore this series as by mistake instead of patch series 2
I mentioned it as Patch series 17.

I will fix the issue soon.

Sorry for the inconvenience.

Cheers,
Biju

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 June 2026 07:57
> Subject: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3L SoC has:
>=20
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>=20
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does n=
ot support IOVS and PWEN in
> the SDHI register (no internal regulator), unlike SD1 and SD2. It has an =
internal divider for all
> modes except HS400.
> It also has a 2048-bit divider compared to 512 on others. Moreover RZ/G3L=
 supports HS400 enhanced
> strobe mode.
>=20
> v1->v2:
>  * Collected tag for binding patch.
>  * Resending the series as there is an issue with patch threading from
>    patch #14.
>=20
> Biju Das (17):
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>   clk: renesas: r9a08g046: Add clock and reset entries for SDHI
>   pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
>   mmc: renesas_sdhi: Fix whitespace alignment in struct
>     renesas_sdhi_of_data
>   mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct
>     initializer
>   mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock
>     mask
>   mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
>   mmc: renesas_sdhi: Add tuning_delay hw_info flag
>   mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate
>     adjustment
>   mmc: renesas_sdhi: Add optional axis/axim reset controls
>   mmc: renesas_sdhi: Add RZ/G3L SDHI support
>   mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
>   mmc: renesas_sdhi: Add RZ/G3L HS400 support
>   mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
>   arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
>     SDHI1 pincontrol on SMARC EVK
>   arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>   arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
>  .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
>  .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 199 +++++++++++++++
>  drivers/clk/renesas/r9a08g046-cpg.c           |  92 +++++++
>  drivers/mmc/host/renesas_sdhi.h               |  25 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 226 +++++++++++++-----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  71 +++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  67 ++++--
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
>  10 files changed, 889 insertions(+), 128 deletions(-)
>=20
> --
> 2.43.0


