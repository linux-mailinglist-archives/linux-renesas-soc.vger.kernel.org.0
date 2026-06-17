Return-Path: <linux-renesas-soc+bounces-34173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NNlHMrOkMmp93AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:44:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23369A38D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:44:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Qar7WhBp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB3B831DE068
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 13:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A093F6606;
	Wed, 17 Jun 2026 13:39:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A742BD022;
	Wed, 17 Jun 2026 13:39:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703587; cv=fail; b=bUUWfMZ/ILewv1r7GnEcKiDS+VCRfyh5whFc/kAE3tolrNgKUAxwb6ZwY2o4LWJlG/4YuTQ9lnxWvR0YPYYSt85d4sCXFf9Y0wIsbhBMESu+yLOA5eTMMLulwkz5sREQ4JK1KXSzoqFvMI9xe7qsXI1i8GFG7HFnL6yQS+RJu/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703587; c=relaxed/simple;
	bh=gUgti2ehYBnIvQRPM3+dPZpEYMdNewDuhOPj0S2yk3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BxdndgKuoqBO35FqWM63MH8YP5H8D6ajHKC1KHIhnKqTXMCN5PFsGtbT/81zW8F96kkFTaAn2swcBWchdlcoiuSBx8r1Xf/4S6iWCa9CxbEndh5Gi9801XmRo2V+yEOGVI74UY9Ncs0AunlDbLmJGN7Wq+thS/PJBXaN6yWPop8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Qar7WhBp; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl40F0QznWeNfdFd1E1mcNxEa7Ry/BA+XqAC6oT61ul0xX1j6fm5K3hI+8ReVnPMQQGYHgjuqHUun3J5VH/Zhy0W4pc18UDiW1eIKAa8WnRWMpP90f6MaTrhbBAaaUltVTgetbEJ4Eb5Kj1Eo1CebAKh6F/SvcRDlFFQikuBXfEO1E4/shMB/aKj2/nDuaG6GAAk5j/4aymah1p3TmbbQ4SE8CLreZPAypRegn3Sq9GQk96ZPDTL582MyZ/wb28pyqrS1WkrXQ/Z52HjOAq+/ST2IlUSCSpkH+vmBArHBr+3SKZvZ3rVKO/xIzzVPtefZ/QQnnVrsl3FwwjZ/VirAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC+PdENBDaDeo+oJ/yTfkZmo4Kx3xnRItr9AbZN6G28=;
 b=VPF5kj4UcRkcse/CqtgrkbsOFDv+WN3umYqzzQ6dj+RxZBLDfQ5opoK0USquhyqaXlXZsqeyvE9sHctJ3TsdIO/I2JxW3e+ud6bKw/ZBTR4hBnIy2kXEuJzFHbujMWU+Its53QP6en19chuliIfslpFkJfzqMh6/o/c5XsblK1iE11pKjWK4Kpivs5oIpO4sN87vgletQKoj5jI04I8o9VpmfELdCOh/0eXLaNsUJ62NrcMdkpdRDNYrC5mmZwjcneWIs3Yef5bvaIwuGKRTLS2Q5bR44uftDrXZ/UDAmvMQaNN88Oqbfg/Y1hyVqX7qz+2Dh8oOzYfRN2OtSopXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC+PdENBDaDeo+oJ/yTfkZmo4Kx3xnRItr9AbZN6G28=;
 b=Qar7WhBpFj2gO4+9oipk1hhk2J9GN6yxXT2yAUD8YTO66ef6WQV/DycU/Ac7MUlHaat9Ys2oVb6thw/Rh09TKLBVfBeSTk2IX8FGGPaWF30Ib70mfV1pQmP527Rf8qI7rrjWcA9btTd5a11dYkC1FXY3ZlDn5zATO6oqEaqel18=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15916.jpnprd01.prod.outlook.com (2603:1096:405:2ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 13:39:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:39:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info
 flag
Thread-Topic: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info
 flag
Thread-Index: AQHc8yZKNPHKJBU9R0+0UrxxtgA5g7ZCxrMAgAAJf2A=
Date: Wed, 17 Jun 2026 13:39:43 +0000
Message-ID:
 <TY3PR01MB1134670687D54134ED8479CBC86E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-9-biju.das.jz@bp.renesas.com>
 <ajKVxixgTHaavVfi@shikoro>
In-Reply-To: <ajKVxixgTHaavVfi@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15916:EE_
x-ms-office365-filtering-correlation-id: d4101a38-6361-4cc2-84a2-08decc75e394
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|4143699003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 rrWn/AZKPleEANRZ/mHVOrzyttXZp0nEutcNZN6VlsFd8cDJD7iH+3otsgHdGiQUvtvP/As5iPmzrn/7bCAY2CpgxxbPxboNAS7EYjOinEk9edA9UcwpOZ/3ZvAwppexTlgGck2z1S0k7exPKv03vUnHhq8rDeA9tCMZ5IsmZZM2tlmb0+o54dsd5Ty4pVOjNhD8f1uO8UCl7Y0HazeCqgNWF4ykEEXEkw5Ry8JqJ+Qok9eq4UUulSjaQq7jvAQBVYIxRPWjqrOr1okxE8hW8cj4P4OfFwPTwqhXRgDyFS8DIiEeKOygDCgH2IC8HNJJSp0/gRD6nCMdkM/oHZ2EQVewkb2LMAcllbgwMbC0MwED1yjkMQ9bAW7C2sW7TSaa/LiLseJRISnR2KKrhQAL5f6abKSSDc3yHSpPzAu8NooqdaTaBI63hDdcMK4nhP62xIKJYaV+a5A5Kk9N8f7mdSuXWcsWuhDqwvSKcdlbac9uEdO3nI0+TBFxfZTYOvKAxhxCyO25Z9ynCafHd4P03pVrDhxhHIJznMRy970wu/T+vc7kaREwyk6fAubOjc+7AzELqt/lD+AzUomnaABxQE29R/RenjvOur6Jw4WIbhOUn1F7kEWZO+/M47Mj4yr1zejchpgfUYSDwCjugSX6vncKks4XzAm8FaI2OGDk09dQQlfKF8JIdsBz5C33cAX657BiNwv8/eFVcIxlJ/vDZtaIzSxb0UcIXT03KH+Xt7V9LH9FcMjyHO/kE0k0g+PL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fFCyB5HrulfDG3+5w4x1aEv5Wtds4yKd+Sw10ifmkx17+ukC5TPHG371crcf?=
 =?us-ascii?Q?roMXHnv1siVI07DTNLiZEwdtd7gRDZkHsNzwhtnRDwgaEw56fxAcAlMAgt1C?=
 =?us-ascii?Q?u6U8FcX2qhAKPVuL6dkhQJslyYk+TFlKVQS2PdFZH38NR3iRr9sz9627tTOD?=
 =?us-ascii?Q?PMNcLFEweMeSpcpc7XtfZsX19Hs5POW8R900ZW6j7VoRkkQF7weMhrh3emga?=
 =?us-ascii?Q?hm6JCCzsh36Oa25mrpt8/EPoQsZEwXHgyQcovMq7UBidHhj1KwRqQWast7qy?=
 =?us-ascii?Q?bCZnuJO8Dj52CXJpZnNIxwr3nWt/nt/gnjL0j2VuPr+qur3KDO4KqY4HGc3i?=
 =?us-ascii?Q?M5ia6vNJcfRhdkIcZ5dOAaxok0+UuJSkzhJuBuZfD5VyyqNhHf2wC5bATHAk?=
 =?us-ascii?Q?AXAz2Vme84+lXocvCS6skVPtlGjXwMNjYJ0B+IUVOaJTkcO83gW+yOZmojWq?=
 =?us-ascii?Q?BFLoxN/RnIrI3Nox/LAYgHeRfeVquvJTOBnZVCwzYu4iS8u0AvKTGB7dod6b?=
 =?us-ascii?Q?y4UTplWl3xkFM6dlwQBe5cNs5YIB9nWbKB5JyqoWpk7aMNXUkqnb1fOjR5h3?=
 =?us-ascii?Q?Y/krFas/zwJdOazRKEGCt3ltP1B3ugFAbAs+iSKAboVhkwpJ1WEsxFp869of?=
 =?us-ascii?Q?oWb90hE6jMlL3AHPqKP4tzo/xvjUrWtS8Jwjhl0L2tHKGWUryEtUaUHe/RJF?=
 =?us-ascii?Q?/uFxPbXRuJYgn8XnIm+q+uKRTNclppDddVVVj3RoB3pdIUk6ysq2rnQ2M9fC?=
 =?us-ascii?Q?agfD9YRJd1YDArlCMmGOel47hkA6X95gg+UPU6cr5uZjYLXOva8xcDHB30pB?=
 =?us-ascii?Q?Q0hmvNWJeeYj/0zOCVNh5oyJGkzrkrQxuQp4CZom7bl8YBFgZgaWivJ4HXtH?=
 =?us-ascii?Q?Jkj5JcfjpDjPl5Jaj08AnGQTRGsWQ5F2cUZAJcz0+laMvaiNmvze/e1l1yK7?=
 =?us-ascii?Q?4uFkaNrk3rNT8URmPIysuSIJR78JdzlbJ9EfuDSp699pajQh/fVP7sWhINHP?=
 =?us-ascii?Q?moLrumKoiJd0JdZIBpy0CJrxhrEEOsdGxe44kKUcM0R+SrxRr5VIyl5abrf/?=
 =?us-ascii?Q?KJzdyDdLRlANciinFHNIiiPMyTXt7B4qpeUayQl/fEPQSM/f/xeMZSEvn290?=
 =?us-ascii?Q?PKrpx/mnT3ZgozIOjdKdhSV+ezXZUS5b0UVD3xKJ5Lzq4q58w5crEci0paJL?=
 =?us-ascii?Q?8FGJey/eQLOAAG9J0X1eZnVtJn051WWmvcif3VRvPeeZvXteq3VNrMgIwBIg?=
 =?us-ascii?Q?P4i0z/QzqLC//5xY18YIW8QCNUQjQvkBqtpuVJ4yegqmNMNAowcQMWNUkWy0?=
 =?us-ascii?Q?eRCrBQfw82s6Ngcuuo2AHQmoTqrBjz1s/tl0HLsSAVKttT6uaPtUSHCq2XFw?=
 =?us-ascii?Q?tcA6sOlrlDyifCi7adXTKs7F4IngY8OfeVnS7zxwIOWc5J0g3BCqL7kb3rgc?=
 =?us-ascii?Q?hpRkBgEPJOvI+yVlHCy7no36AZyQR5s4JamR1+S0QBb3N/caBWjislJwtCkj?=
 =?us-ascii?Q?wuDMkRJnKR5oWIqDYlUF0irlMc5Kj01Sz/DVTts4t3qT4OM2LyoJBQSKqazw?=
 =?us-ascii?Q?IWzbQ8xNgr5z/0+v5DWpY0l3QYHq6+BUJ/6/uLwwbPz0sqtwps2zeQT9vbT4?=
 =?us-ascii?Q?s3S4clBA+ld52mdjCr9QaWGYg7hMtIdaEoI6466nWl9wtqaPCJ+0dZUZ+pnq?=
 =?us-ascii?Q?5N44Z8IH8S2w0dPRtZ3Shrcy3YAdIUgm8G4OGQ6Bq5ZL6Jcfj91L9dOksoEQ?=
 =?us-ascii?Q?VK1tE6DNAQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4101a38-6361-4cc2-84a2-08decc75e394
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 13:39:43.4313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwU7jir5+DT/nIohpQdrzq1GFl6yxzCn7yFcNwm3l9rmVUKjSwjMg3LwV35foT/bugIb/aXHpGDizAZ1aFAOptOOrmzIMN8mddwTile72LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15916
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34173-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A23369A38D

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 June 2026 13:41
> Subject: Re: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_inf=
o flag
>=20
> On Wed, Jun 03, 2026 at 07:57:08AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > As per the RZ/G2L hardware manual, the TMPOUT bit field in the
> > SCC_TMPPORT register needs to be set to 0 when transferring at 3.3V,
> > and to 1 when transferring at 1.8V.
> >
> > Add a tuning_delay bitfield to renesas_sdhi_hw_info to indicate
> > hardware that requires an adjustment when the signal voltage changes.
> >
> > Add sdhi_hw_info_rzg2l with tuning_delay =3D 1 and assign it to
> > of_rzg2l_compatible, enabling the adjustment for RZ/G2L. All other
> > platforms retain sdhi_hw_info_generic with tuning_delay =3D 0 and are
> > unaffected.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * No change.
> > ---
> >  drivers/mmc/host/renesas_sdhi.h               |  2 +
> >  drivers/mmc/host/renesas_sdhi_core.c          | 83 +++++++++++--------
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 +-
> >  3 files changed, 58 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi.h
> > b/drivers/mmc/host/renesas_sdhi.h index a42934e6d49d..a3c5fa368242
> > 100644
> > --- a/drivers/mmc/host/renesas_sdhi.h
> > +++ b/drivers/mmc/host/renesas_sdhi.h
> > @@ -44,6 +44,8 @@ struct renesas_sdhi_of_data {  struct
> > renesas_sdhi_hw_info {
> >  	u64 clk_mask;
> >  	unsigned int max_divider;
> > +	/* hardware features */
> > +	unsigned tuning_delay:1;	/* Has tuning delay */
> >  };
> >
> >  struct renesas_sdhi_of_data_with_info { diff --git
> > a/drivers/mmc/host/renesas_sdhi_core.c
> > b/drivers/mmc/host/renesas_sdhi_core.c
> > index 16ed6fd8470d..868ba6a6919e 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -257,40 +257,6 @@ static int renesas_sdhi_card_busy(struct mmc_host =
*mmc)
> >  		 TMIO_STAT_DAT0);
> >  }
> >
> > -static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *m=
mc,
> > -						    struct mmc_ios *ios)
> > -{
> > -	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> > -	struct renesas_sdhi *priv =3D host_to_priv(host);
> > -	struct pinctrl_state *pin_state;
> > -	int ret;
> > -
> > -	switch (ios->signal_voltage) {
> > -	case MMC_SIGNAL_VOLTAGE_330:
> > -		pin_state =3D priv->pins_default;
> > -		break;
> > -	case MMC_SIGNAL_VOLTAGE_180:
> > -		pin_state =3D priv->pins_uhs;
> > -		break;
> > -	default:
> > -		return -EINVAL;
> > -	}
> > -
> > -	/*
> > -	 * If anything is missing, assume signal voltage is fixed at
> > -	 * 3.3V and succeed/fail accordingly.
> > -	 */
> > -	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
> > -		return ios->signal_voltage =3D=3D
> > -			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
> > -
> > -	ret =3D mmc_regulator_set_vqmmc(host->mmc, ios);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	return pinctrl_select_state(priv->pinctrl, pin_state);
> > -}
> > -
>=20
> I don't think this function needs to be moved downwards?

OK.

>=20
>=20
> >  /* SCC registers */
> >  #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
> >  #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
> > @@ -351,6 +317,55 @@ static inline void sd_scc_write32(struct tmio_mmc_=
host *host,
> >  	writel(val, priv->scc_ctl + (addr << host->bus_shift));  }
> >
> > +static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host
> > +*host) {
> > +	struct renesas_sdhi *priv =3D host_to_priv(host);
> > +
> > +	if (!priv->info->tuning_delay)
> > +		return;
> > +
> > +	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330)
> > +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
> > +	else
> > +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1); }
>=20
> Isn't it enough to move this upwards? I don't see anything requiring this=
 function to be so late. Am I
> overlooking something?

OK, you mean this function along with SH_MOBILE_SDHI_SCC_* macro upwards?

Cheers,
Biju


