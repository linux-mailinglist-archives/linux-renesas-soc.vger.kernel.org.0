Return-Path: <linux-renesas-soc+bounces-35010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncnOE5KvUGrK3QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:38:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743B738911
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=du21Kbvh;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AB833010B97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2873E0C70;
	Fri, 10 Jul 2026 08:34:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD63D170C;
	Fri, 10 Jul 2026 08:34:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672479; cv=fail; b=D00eqKtYANCF6GpK4ruW8+UhiXdcdsEjOxe+H/GV7bAvGjo0sdYwW+MVxqog/lSc/sbt6sJwNCVQfJuPM7GTsgirdWAfsUCPxUEWTSDk0Tdl9hjgEvSqVOwK7VkKYn8no4g14uiR8Q1XuvLACSoBMhgsm5gGmAupE5lv54dfH/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672479; c=relaxed/simple;
	bh=1n6seokUjnbx8Te8eVxgY0ifpe8t5JM/5knjAhKyoqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j/4Sv0xi/fAveI15z+fuRINHknfG0NuUtCrTp5ZDH8OMvCpXrhcLWyvgDxm9YNPiL73aBEbvikKGz2IABD1P3qg2vKJi2xEC6nMaenNC6vYjJWU1HJC3qMTreN//NrXMN2MRdxm+VWxMGGkv04fbuQ2q24aXMhMINwEAPSb6T28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=du21Kbvh; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMu/AvjXwGgBEgYqh7H/7LMAFw5PfDdS9NsWYI+ZXEYtRg8FuA8aLN5YEq4vighsxRqUSgj1o/9NrR8mFugwGsjthrGMC4CTkqVLmD7dt4fLQa0j9pKdzkSu1RxzvHNYsesoVaUf7w41c0MQhkfguGs+mmk8v+1UNh2GZrJI0pIVTmQPRijcOkL8gFfTLAu1YcIVkn4ud1DmQFbVodSk6jwpQDsYCAYbIru4NJdQODluc5cqEscXcZn4SQ7507YFTD5FxMpmUArsaugukUI1Lo8bjMkdXYSJWI4tCwxi9iZ5DOOju66mYPl0aYmOo6n5DGwq5ASpKXTEE/RB/22PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HzkF+RSklm4sBmiM8epx7cqZ7R/xhegIod20kqoRwU=;
 b=g3Wk9KAE6ytu8GsJob+u+oCHyCZImeMnjVsmPKQAGe3mP75CY1LncJ3psQOaxEXv6ojoIrO8V3qBwccGI9hYmBwlqoZKGiAO6UV8KXFIEvBsNFmTPmkA63DgTqIsF+po6xFAfYTrv+W8jTTARcqsEWKtA2IfT6hFuE0MNAnkWCOG2LMdKpGtvu3buaFg+dh8SAn/gpQsCyO/ufp30mMSSra5LvCLzO4B2NY0iqNCnuaUFmhadfSe68VPCyN6SY+sd0eKz2d+DK/9JkTlCFhVQ8LBciwTzimtXSfWwK+wpIxTRshKTCBUIrjhxwGVLkQGvFcTmE3b6iX7aCkvCKJt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HzkF+RSklm4sBmiM8epx7cqZ7R/xhegIod20kqoRwU=;
 b=du21KbvhGekV0oOcRYlGz9Edsv0PU/BKiIdVZhSgRPB6HVHgT4txpIEH2myN3ETs6i4ARfvbMA/OuRG332co9T+HVjLDuDPwJHZFSpGe8u/tvGpnTBH5dQCZIaqZPW8cwBtSR7v1dc42oJS2+4E8jW8Jtpa2po50uCyCC9qr4lI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11009.jpnprd01.prod.outlook.com (2603:1096:400:3a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:34:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:34:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 03/12] mmc: renesas_sdhi: Add clk_mask field to
 support flexible clock divider widths
Thread-Topic: [PATCH v19 03/12] mmc: renesas_sdhi: Add clk_mask field to
 support flexible clock divider widths
Thread-Index: AQHdD9lDK3uoNbI+I0OVF6e1/S21orZmbNKQ
Date: Fri, 10 Jul 2026 08:34:31 +0000
Message-ID:
 <TY3PR01MB113467654628ABA5A68195B1F86FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11009:EE_
x-ms-office365-filtering-correlation-id: 5f7485a2-9d1a-4bfa-b769-08dede5e1094
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 mwTrjyVszW9WPBESmMhMOFTqYieVyPWJqeMu3XpC6N9DzWWC8Mx3JBJqA5TjjbTqDajvsdhvumnqpRLquIPWdc4JsKrwyws0dqkJM/1R01Bzqy1l9eXi/i6iatn09fFOQpBpQNzhLH5wjzRqz+nSE4aUQDv3abgAHt5m/Nxrq8kTy2484XywmADKDKxrnIhae6du5l4ASNyUgrcrtwcazOhmjuz2z/n70uCKHQkBim9Y9fcJLeVqYA7n1TxAFFnwpNVt7W6NtDmaKcaKmP3qCDEgkMog24/G8WE2nDLLa5RENmgNQZdo1xT3J1mZlnjdTdkLWgUFEkoLtdXiVA6Qcv9T3z84NiQgJlS9YPLKjKtrrfgVoW8syyDf7RSmHHZwl3Y1skR2sNwO9e7nluQnXsFDvhmhL7ZLHcduzqS5W46A59m48F7oEzff9FiSDCTc8GaVZBWw3AwBEePOP/x9A++ybUB096EF4HlRCi+dC0nPej3y90k0SUmbxAIiGJLvNmm1qNsjti5wm0SWLc5k22EZc5MXbMLZSKdHUIt4/IFM18VTAu+Cs2KF6n8780DAkp61GDMn7DnUoI2fUU6gOwKtglnbgDz34CIqnMNEKhG5pcWaKoS/znNwCppr4zbb2Knki7cJfdiUbr+mEENjnAcpXdn9bQKWMls9dn0QnGU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U7DrIuqBKR2r9Qff1aSTqwWPhkenUxny5vXThTsgi87DX+S2EbRXGVrT2X9t?=
 =?us-ascii?Q?2pH1q7M/jJPJ8YEvuqa+VIi2celVaue9vFppuUskhZBWRRkEmXeMTJJ2j3Es?=
 =?us-ascii?Q?prfSnc48PNbc8z8wrP/rrBxWR7VpdHycRfy7lzBm2YEiWZMUjXH2Thw9O77r?=
 =?us-ascii?Q?sP6ZvW5tq2MCeuTAC0P1/Iitq2WRIkS85hORN4Xnw6FfWXpZRjb/DiqZXP/K?=
 =?us-ascii?Q?M3HH0TIGd+q7QzFhfJ9QXd5Qn4zKTSnac5IWqJkjdZYvEGFojw3ewjF+lptW?=
 =?us-ascii?Q?BRcX8EnxoCSvshIzgDb1kam6L7cyJGsRxQMvlPNcASlifVNPlUeMCIaBOge8?=
 =?us-ascii?Q?4trQaRRV5Lw3kk7cFIt6EAChctzncEzaQ1FBBAnDcOWouyu1F1eayuUfjPU2?=
 =?us-ascii?Q?VeQu7mzZAN9qHlInUV79AZ8XwBC7aF8v42s5K96iFyQ5r2BgurJhzCZc38nk?=
 =?us-ascii?Q?Fh87CKxDuzkYr8EFnU74OZPqrlXIIEB/adHonaPv4J5KVEdgOYbnDiLiiG41?=
 =?us-ascii?Q?7CXH0WivKVSQwVFt1mP8WI8Sg5NQNejXBbHP9zGsnlzsv/BZMvwwPR4JhrOq?=
 =?us-ascii?Q?mtX3cbNtojYm5xETj5f1sckYGhgzKC8y1A5xLyfOFr0w915qo4p3z6nmmrmc?=
 =?us-ascii?Q?iHSFocsP6dsYqBI1jKrpnOUFoJ42A/VUequV/efv3NMIik4JvBA0JnAVMm0l?=
 =?us-ascii?Q?jtk1nE5Qd4esQPAqTaWzg2RzL6jsUWalz2DgIz0KDz8HR1A58CaLrjBJrzQz?=
 =?us-ascii?Q?mq1J0XyzdiP5mSoBtjS7V6msD7W/DjD9I6jKeKkBPdyjdPoYwj0GKz6wj8G1?=
 =?us-ascii?Q?714gfpIEthDXnavuanKHrcNOuwnQeyEPr43YOOtXosPeoebNQHJZ3nkPwxWV?=
 =?us-ascii?Q?JdXga7enx4uDzpSKNGAxHRYZFR6UZQIyexL8sKEvubVDwZyL3vBPUJp78OQI?=
 =?us-ascii?Q?+5prUqAaeGJayoV1d4XL6Sq+05GrdI3K/r9bkl6YQMdJtXLzb3q3VhWxjm+2?=
 =?us-ascii?Q?HLaa9aJv+PuN4xSa37XQMl5wfLqKfhIaJX2yd2SfMAXWTA+Ga3litOydXA1k?=
 =?us-ascii?Q?MvWKXp191gCZqKMH+WvUg9R+fNr/DMZ1xtxXBbh/JBVdz/hoOUJ6Wyw0zQ3A?=
 =?us-ascii?Q?LcXS1OjcPH/QV+YDbky3qCeR6zlFi75G4FvbwotnhNxKDzKi+BSZ/uvGUpQS?=
 =?us-ascii?Q?/UxZnECO11SpMwMHTQyeqTpK/o3+aHm/OqatQWF5cLQOrUlYGvuqNRBlS6Gz?=
 =?us-ascii?Q?HZAA6ABV9w0svwkieq+jEhBoFXRUMHsEtIS6XFgMBz/AfH43fwlmkXyb8iEs?=
 =?us-ascii?Q?7lftx7f6g7D8f32hhOSfsiGH7HGBAtycy4iRhF4xGx7AbvDN75mVowmCbx8A?=
 =?us-ascii?Q?bxxESoWRRoNjtBnwLPJSCeYY7x3H1nNcOhRNyzgYfX7MXnsp4LzA1dBUCppD?=
 =?us-ascii?Q?4AbTxgQFaRo52ZikmfVbe6Yg9VzRM/6WPz+wge58jYJ1WZr/eFcS7jh4OKEm?=
 =?us-ascii?Q?ipbTgTUmFxM+c/RpBRj0PBOmmckREHSG2/iM6bIcZmGiSFJBYlihyQ4EAVOb?=
 =?us-ascii?Q?sAuHp3GfDuFZ3Az4zQEkQz8gXNTllZG/n4TrgdTlSzqrXmjcsFMqeNidYOQu?=
 =?us-ascii?Q?f4IAYuRbr7EIaJW71I6mN1qCiopTDS5XGvA8TwJq94nVrPdLltd93LI0oQeF?=
 =?us-ascii?Q?U3utgasSlpFIPM071jQJg7FQIb4tZgh+4jIjW0ZWkB45wsKGG8N4Nv9yK+4k?=
 =?us-ascii?Q?AaXMpwtSng=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7485a2-9d1a-4bfa-b769-08dede5e1094
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:34:31.9429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NU04QBcjCsT7A5OJXTI1+iUyZWKjHasjCLZbh0m9igNGDN0ZWCnrAn3ngWRkXxIIy20S5QUEPvhSjnC8raqqGLq+VwhnRND5OF/3102vylo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35010-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9743B738911


Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 03/12] mmc: renesas_sdhi: Add clk_mask field to suppo=
rt flexible clock divider widths
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The clock divider on the RZ/G3L SoC features an 11-bit width, requiring a=
 wider clock mask (0x200000200)
> in renesas_sdhi_set_clock() than the historically hardcoded 32-bit value =
(0x80000080).
>=20
> To accommodate SoC variants with wider clock divider masks, expand the in=
ternal clock control variables
> (clk and clock) from u32 to u64. Introduce a clk_mask field to both struc=
t renesas_sdhi_of_data and
> struct tmio_mmc_data to allow platform configuration data to supply SoC-s=
pecific mask properties.
>=20
> Update renesas_sdhi_set_clock() to read the dynamic mask from platform da=
ta. During the probe phase,
> assign a default mask fallback of SDHI_CLK_MASK_DEFAULT (0x80000080) if n=
o specific mask is specified,
> ensuring backward compatibility with existing hardware variants.
>=20
> Finally, explicitly populate clk_mask with the default value across all c=
urrent internal and system DMAC
> configuration profiles, in preparation for the upcoming RZ/G3L clock cust=
omization.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Fixed the clk_mask for non-DT platforms.
> v18:
>  * New patch dropping struct renesas_sdhi_hw_info instead using
>    renesas_sdhi_of_data and tmio_mmc_data.
> ---
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++++
>  include/linux/platform_data/tmio.h            | 1 +
>  5 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 09bf9b24a8c3..f926a36f213c 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -22,6 +22,7 @@ struct renesas_sdhi_scc {  };
>=20
>  #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
> +#define SDHI_CLK_MASK_DEFAULT		0x80000080
>=20
>  struct renesas_sdhi_of_data {
>  	unsigned long tmio_flags;
> @@ -37,6 +38,7 @@ struct renesas_sdhi_of_data {
>  	unsigned int max_blk_count;
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
> +	u64 clk_mask;
>  };
>=20
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index f9ec78d699f4..1787f91d1ff2 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -194,7 +194,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  				   unsigned int new_clock)
>  {
>  	unsigned int clk_margin;
> -	u32 clk =3D 0, clock;
> +	u64 clk =3D 0, clock;
>=20
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>  		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL)); @@ -213,7 +213,7 @@ static=
 void
> renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>  	 * provided for actual_clock in renesas_sdhi_clk_update().
>  	 */
>  	clk_margin =3D new_clock >> 10;
> -	for (clk =3D 0x80000080; new_clock + clk_margin >=3D (clock << 1); clk =
>>=3D 1)
> +	for (clk =3D host->pdata->clk_mask; new_clock + clk_margin >=3D (clock =
<<
> +1); clk >>=3D 1)
>  		clock <<=3D 1;
>=20
>  	/* 1/1 clock is option */
> @@ -1136,6 +1136,7 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  		mmc_data->dma_rx_offset =3D of_data->dma_rx_offset;
>  		mmc_data->max_blk_count =3D of_data->max_blk_count;
>  		mmc_data->max_segs =3D of_data->max_segs;
> +		mmc_data->clk_mask =3D of_data->clk_mask;
>  		dma_priv->dma_buswidth =3D of_data->dma_buswidth;
>  		host->bus_shift =3D of_data->bus_shift;
>  		/* Fallback for old DTs */
> @@ -1144,6 +1145,9 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>=20
>  	}
>=20
> +	if (mmd && !mmd->clk_mask)
> +		mmd->clk_mask =3D SDHI_CLK_MASK_DEFAULT;


As shashiko pointed out [1]], 	renesas,sdhi-shmobile does not have of_data

The below changes will take care both cases OF with no device data
and non-DT in the next version

	if (mmd)
		*mmc_data =3D *mmd;

	if (!mmc_data->clk_mask)
		mmc_data->clk_mask =3D SDHI_CLK_MASK_DEFAULT;

[1]
https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp.ren=
esas.com

Cheers,
Biju


> +
>  	host->write16_hook =3D renesas_sdhi_write16_hook;
>  	host->clk_enable =3D renesas_sdhi_clk_enable;
>  	host->clk_disable =3D renesas_sdhi_clk_disable; diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index b3f4a5f8dec0..c6db0418de15 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -101,6 +101,7 @@ static const struct renesas_sdhi_of_data of_data_rza2=
 =3D {
>  	/* DMAC can handle 32bit blk count but only 1 segment */
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3 =3D { @@ -118=
,6 +119,7 @@ static const struct
> renesas_sdhi_of_data of_data_rcar_gen3 =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallba=
ck =3D { @@ -134,6 +136,7 @@
> static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallbac=
k =3D {
>  	/* DMAC can handle 32bit blk count but only 1 segment */
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D { =
diff --git
> a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdh=
i_sys_dmac.c
> index 7ae488e5c1e0..fcd2edfa69db 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -28,6 +28,7 @@
>=20
>  static const struct renesas_sdhi_of_data of_default_cfg =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rz_compatible =3D { @@ -36,6=
 +37,7 @@ static const struct
> renesas_sdhi_of_data of_rz_compatible =3D {
>  	.tmio_ocr_mask	=3D MMC_VDD_32_33,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D { @=
@ -43,6 +45,7 @@ static const
> struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D {
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  /* Definitions for sampling clocks */
> @@ -70,6 +73,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_c=
ompatible =3D {
>  	.taps		=3D rcar_gen2_scc_taps,
>  	.taps_num	=3D ARRAY_SIZE(rcar_gen2_scc_taps),
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] =3D { =
diff --git
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 426291713b83..76056d49f5e0 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -61,5 +61,6 @@ struct tmio_mmc_data {
>  	dma_addr_t			dma_rx_offset;
>  	unsigned int			max_blk_count;
>  	unsigned short			max_segs;
> +	u64				clk_mask;
>  };
>  #endif
> --
> 2.43.0


