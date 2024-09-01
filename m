Return-Path: <linux-renesas-soc+bounces-8592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12D967BB3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Sep 2024 20:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6A91C213F2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Sep 2024 18:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A574183CBD;
	Sun,  1 Sep 2024 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CLFRZR9t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3A183CB7;
	Sun,  1 Sep 2024 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725214489; cv=fail; b=QA5BRUTFvnTAGQ3PwzicnNGVPhW/RzhVAr+8LTqk6U8Jb7RHJFg52mT0p9XxG1iOnkRifwzIPw384/WdPqtpC9i/k+A1zwLDUX9RHpDSoEZ2CtOXHuWL4bWoCnhq1cYXuVmWXUhuixDY/dT72tieN4bzOCSyrRDnCb8pa2FkMMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725214489; c=relaxed/simple;
	bh=J8o6LIPDhqVMxVk37IyPZAYRYtX+USCdyDovlyPlwMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q47plWdsz1rC6YLgLL54SUxCxv3ubjuZmd3/LFVohW9E9WE7bgpdETilW4SeXPIR6K2OiBwYl+7ksAvn840K2LkKGmgBlGXN4ZY6EXPUTotDtjrbfCyt70scvgkxlUBOZ6wzfg2hCW6uT/nGekkqDKcaeHYB1xD4+UJIDkgtkxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CLFRZR9t; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Str528nZRu8CtD2clKv7yJ9YuZcmSpUIOENa9UpYOn5FzhBsHTgAQP0FEc7KW7ilwUfBm+3b+k81EJ7Jgfra8R0T1/oi+CNmoBKtZE2Ud22Mlqkax2Gl9oxNy9Ghv3UgmeX4/NhKRQPux3UTR+Xj/BErSUBns2/hmtxvACPcCs8eY6QpcnBB+3XPZL5rVGiRVG34dpURTJp0YvjPbiHadLhboGzT3WG50oK4H4SRIpm2MNkvPEgv357WUmbm+55EsaPOSdVXShJ0F5yRPlyiovNVABCVNYGeZnvt2lwOfB5I9VDG6i2pcIsXh5aDs2U8pvyZz3PhPbqtH3xpuaEqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsAA8H5OJ0j+s6qI3SUzUoYkGU+h2iH4XFst0cBU2FA=;
 b=XBI7zBE8eJuy3rx4oMYK2KY7boBOt3mMjzNWyG5YWZgEmqv0cQCGj3rnXkywtahZguDynpsORlEmEhhwOknoB7Ju1FvrBBLLWujE0GyG2QgGO/KVb102s7ip87JssKaLG8z/v+wrzxNuTx02m/nRRxEs1HLeyk5hrib/EewfPrcLg8Qzte+M9fPWiZb7obpho8ffD7OCAR3EiT9umMUtCy1xaJYzfmKITTSPJFRmFS5Pv0acpxWUSgEbcy8vZVe8tD+8Kq1LhTLdaTIJTx+XAOb0D2350jLPu+fG4yUvWPMbWGgyNZ21YpZYSTwn+pO8qPgr1XFoQEj8z7nTdU2PZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsAA8H5OJ0j+s6qI3SUzUoYkGU+h2iH4XFst0cBU2FA=;
 b=CLFRZR9teSEDVC+8pDJhziubrZpDhnzgI1ult2pGInEmISF9VVh9J+kspIsSWGmgYvlTpNZRR7E/kdUxyuoVxgPp3vZiT6x0xE897/7o0P1G4L7g51wxYagPeN3JN0MBtesZLcyqohz5ppi796eSUYiPFhcbQSry/N2ZUfUzsAk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11326.jpnprd01.prod.outlook.com (2603:1096:400:3f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 18:14:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Sun, 1 Sep 2024
 18:14:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 RESEND 2/3] arm64: dts: renesas: rzg2ul-smarc-som:
 Enable serial NOR flash
Thread-Topic: [PATCH v2 RESEND 2/3] arm64: dts: renesas: rzg2ul-smarc-som:
 Enable serial NOR flash
Thread-Index: AQHa+xt1XruXdxQRSEKCxgcycKOek7JDPnqw
Date: Sun, 1 Sep 2024 18:14:33 +0000
Message-ID:
 <TY3PR01MB11346FB1F76E79083645B472986912@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
 <20240830203014.199326-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240830203014.199326-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11326:EE_
x-ms-office365-filtering-correlation-id: 6228f80b-53fe-404b-a71e-08dccab1ee04
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4HeCNSSOCXmoxxb6wjGcddUQ7PR86AyEAjoMu94GO/3/Xuik8M9lIvdG6vBD?=
 =?us-ascii?Q?EkgK5B57iHrjAuUNwLzyWO5EKpbjoOJgyX2B7LGTj22WNd40e986kGthYUHZ?=
 =?us-ascii?Q?aB+vksb6hF1lM7DdNbLjN8Pk0FA+3HdQT1gNkJXPSUug17zNvAAD4/JQzCOI?=
 =?us-ascii?Q?wZJzhyW2JYHLceGA6yqcrjWjAmWf9L6QbP5OH9kpGhyF7YnTaEylVyYOK0iW?=
 =?us-ascii?Q?6RPF+5VTXG4UszG//Oe7dUqLNiTfywFAEi0OXFeruq1kvVyWsnfEWjnSvXXS?=
 =?us-ascii?Q?hoBSO9rUFBaIPpu7JKgCf6XqQMxi6+NMmGUgkT7Tdjn2tmRRVM5VP3dYY56b?=
 =?us-ascii?Q?Fz+2VUm2911YKv/7qyi1oWkmWkK1vaLFUfEKMrkreIgGGGdboeWlG5oQSPXg?=
 =?us-ascii?Q?di6JkNSqE1yCD+vWbtKmJtGF5ModG2T33GGukMUAK28S3pN+bMTCfqbXdSWL?=
 =?us-ascii?Q?Rpcssrkk18PvJsHRGuWTP0rp7HrduIfqsvaBNqOu/qENYV/e8xtjLwEP8YsZ?=
 =?us-ascii?Q?UqH1wdz/uro5nU7XgQ+Q4oANKF/KkzMdfDgzejF/ol6tirmX/o4mh9652ekO?=
 =?us-ascii?Q?I5Mro4E/2IsGpNd1jOb/eReo5yCohl0HWKIqlJii3hnxfw53YoIuh4vypz7e?=
 =?us-ascii?Q?Gpy6CZpDb8KJOG+LrDAZM7FREnvGV39rY5xaWH3nvGf1fItZ+qZyDHbpXeYH?=
 =?us-ascii?Q?cZ3sgBZrDr8UsXF7dTOv3ixdvWYYoykSmEukNrCSFw8Rvg3c2I610aTz4pN/?=
 =?us-ascii?Q?3D12SAY6/4NS7isqKhbSHgKQGRL39WrTXs5kN2s7TAwmaZcNgH/z+sYlFICG?=
 =?us-ascii?Q?l4s/nEsUyP5KLQK3GixxzE9xXxAiuK/nrVt9Wntge5bnHCdRxoK0NjbOQcKt?=
 =?us-ascii?Q?LaAyRfOE3x5KvjHpODFxUP18039Zm1IcK1KAWc4F93y1wy1zuvC0eo0WmXVS?=
 =?us-ascii?Q?8Q58p4BD9/60M9SRLQGGDbXuJYe+mqHuZ/72vdGaGgC5rxJj2RokLUhKGM8d?=
 =?us-ascii?Q?2d9TQU9QaEFWn7DKvr9KneA1Xd54JyXdsI4yMo6YlW0DrOOb0O8FvK3iavlG?=
 =?us-ascii?Q?3DUXD8KBDoKQXgr41psbMdgt/EjJhIG4WTiUBrJ/qRoTOTXawwY3r024I+vJ?=
 =?us-ascii?Q?7V74xbXw30m8KSu7GypYC8Fuxb8WGmnr1Bw3Z39WeP4NBzPiKbICeMBMo740?=
 =?us-ascii?Q?l/hQaYAnjPujpxGDoTTV1pduiBXvAOyJNtMSoOgBYmSNPdZLXu+O/+uwCizE?=
 =?us-ascii?Q?kFWpjxgFUzpagCj/kvELAtY1pZYP4T5fdzIcv1q0U+62ViA6wMCBhaARS4C2?=
 =?us-ascii?Q?+Sp266uoDTsmbEZB86Ngzdxj2OPUsgiU48MPZXJQ3+Ebw9lZs4oszSKzwySc?=
 =?us-ascii?Q?Bj5bLa4zKCMQigtc0VqYoiUkedmQCr3es6iZJ8WH4mcBs/2IAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7hYqO4fTk9gpq6xJe5jIfT//FJhgn39NztK2ABLiJFWWfT59maXhvB5yxpfP?=
 =?us-ascii?Q?FplHTHFEho6TYTJwZZvRBTU/qXGEgT5lxJU7QcwTgmyKOYGnQVZ5L3FFNneS?=
 =?us-ascii?Q?51qfMzOeQ8yXP0I2pfBsvKayQT9vu1bFvTNziKr61QQad55w9RvaZoSaEZjA?=
 =?us-ascii?Q?HRk5DjsOeO4s3N95aTtoVphI86kC/Bq2LXT7fH+wOhXLJQNSiZWGyDPqRh8e?=
 =?us-ascii?Q?+4hYefXSt+3EqktyljKf9V2v9g7u5hocGKfIbOAOcd4mrDklHBRTmt2gz+1n?=
 =?us-ascii?Q?sDPGdmiIgXu4bCN5L8kTQpk9suOQN40H7bh3AxMwCjVVWyL1zBzjAaObBaQQ?=
 =?us-ascii?Q?Jj0Hf7SswlHL3aE/xVzRCjrhRcMKha9kfjb7wLGB9ibPQEnkvK4BJU0SpXT9?=
 =?us-ascii?Q?lfJvtnedYaGcHcnLkhliw8sfvA7AfiWM7vs3tqTxNhj7pjclbzwb3gAIQi0P?=
 =?us-ascii?Q?IfMRkfW8C7OD0RgCqiK1lw5N+0A0C9mUdyTvm+lvSiXwp8vmQYJGiNhPnIts?=
 =?us-ascii?Q?JoPaoFBea2fA6jnTABfGMiGkZ+W2SSTtTCqyTLlO9Y2b/LoVgXOIyksw3scC?=
 =?us-ascii?Q?GmmAoFc0VAVK/2YmdGfldU5eYWwYl3X6YPkriuw972QGtLytAb5c28dq17Oy?=
 =?us-ascii?Q?Jv/tQFKml+0v0vAWpRhWoGuHunMth86dR9Kx1cBfyj4hwW1IMKwWQg7v1Fel?=
 =?us-ascii?Q?sSLAxNA36qIWYBQbbSiItNbTOdvyUbnz5Qsu9f9lcy77H0qphXUyYgUBdwgF?=
 =?us-ascii?Q?sf4426ivWHS9ACeQiblqU3XQsagUHNzYDtpEgtIQHiSFQU2qtvarZYxghne2?=
 =?us-ascii?Q?dVBrlqobvptygHA/tfhMA7rfU+v9bW1m2n2HhpXetUKu7goN5/CSgSW6Hfwe?=
 =?us-ascii?Q?oO40eIflfUp1JpeJJLUuPPaa/AG5tXKQv+h9azKepn5HYbxt8REGjambo3LH?=
 =?us-ascii?Q?wNjC+dBHjEuQDBDTD5MA52NhpBoXDjoaI1mGnNTZ0F1MFum0MeAwBZbmcjyU?=
 =?us-ascii?Q?zdtTKjLPCIOPkpIzB85IDZYnsNMJOnByJAjIVZQzTPNdapldVMPGs5bWviSj?=
 =?us-ascii?Q?h/X9d6dx1RpiFrFFfunlQz7QUVdFRvgISrhfgKUupXNJlblPsKprb4wDBwZj?=
 =?us-ascii?Q?k04jXQUds75oqvxc3s9HNNsDEBMiiEyBoaHa5l0zEpZ6Hapv1HDGWC0ML4M5?=
 =?us-ascii?Q?XxdKE3odur9w/2UWSN77Y3BEZ75GngFWDOhdMdyuF2jOTC4chFVBxdkFWyPi?=
 =?us-ascii?Q?Md+tSOhnPmcVABhCOfogVVNWUc/oK+TkNn9Z+Oh3eIAg/HayISDgjUsul7Lf?=
 =?us-ascii?Q?tCqdqloyyyQRZD4zDOBu8wcYbSEH5cjI/uC8S5cj0H7odTII/VLdMS9Rkjvd?=
 =?us-ascii?Q?HQi1tJzZb8Ya/u9GALtq2LU1+70NBzuRCEzZH28nnxALQQw910P6FuD6dDU6?=
 =?us-ascii?Q?xnTEuYNlx++i26sGFjWX2FjdvUK30IXrBeR0uFryLqVUpc8h3ZANDY3ft0QV?=
 =?us-ascii?Q?R6rzbkatfeZR1Bihyy/vf1MbsuC5MJHS/AF57/aaklVyqIaVTXsCwmG6TT/l?=
 =?us-ascii?Q?na7ThR6/w/0ie4sI/ZfHiFSa+mycU1+mmGVnNi18?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6228f80b-53fe-404b-a71e-08dccab1ee04
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 18:14:33.0689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SYv/ugmjo0Z5SpK4QZdWThyC7x0Zj5h0RDlHbJGNGZZx8mkFE50p/g5gocw9iQGO2DR0GnndyVCSmopLJRAo1zNAImXEWcaXZvb2zVJYEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11326

Hi Geert,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, August 30, 2024 9:30 PM
> Subject: [PATCH v2 RESEND 2/3] arm64: dts: renesas: rzg2ul-smarc-som: Ena=
ble serial NOR flash
>=20
> Enable Renesas at25ql128a flash connected to QSPI0.
>=20
> Tested the flash by flashing bootloaders:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE} mtd_debug write=
 /dev/mtd1 512
> ${FIP_FILE_SIZE} ${FIP_IMAGE}
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v2 resend:
>  * Rebased to next
> v2:
>  * New patch.
> ---
>  .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm=
64/boot/dts/renesas/rzg2ul-
> smarc-som.dtsi
> index 79443fb3f581..2e458cdc8888 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -201,6 +201,18 @@ irq {
>  		};
>  	};
>=20
> +	qspi0_pins: qspi0 {
> +		qspi0-data {
> +			pins =3D "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> +			power-source =3D <1800>;
> +		};
> +
> +		qspi0-ctrl {
> +			pins =3D "QSPI0_SPCLK", "QSPI0_SSL";
> +			power-source =3D <1800>;
> +		};
> +	};
> +

The pinctrl defintion like [1] and flash partition  definitions like [2].
I will send V4 combining [1] and [2]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023090107=
5932.105822-2-biju.das.jz@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024083020=
3014.199326-3-biju.das.jz@bp.renesas.com/

Cheers,
Biju

>  	sdhi0_emmc_pins: sd0emmc {
>  		sd0_emmc_data {
>  			pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3", @@ -252,=
6 +264,42 @@
> sd0_mux_uhs {
>  	};
>  };
>=20
> +&sbc {
> +	pinctrl-0 =3D <&qspi0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		m25p,fast-read;
> +		spi-max-frequency =3D <50000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "bl2";
> +				reg =3D <0x00000000 0x0001c000>;
> +			};
> +
> +			partition@1d000 { /* fip is at offset 0x200 */
> +				label =3D "fip";
> +				reg =3D <0x0001d000 0x7e3000>;
> +			};
> +
> +			partition@800000 {
> +				label =3D "user";
> +				reg =3D <0x800000 0x800000>;
> +			};
> +		};
> +	};
> +};
> +
>  #if (SW_SW0_DEV_SEL)
>  &sdhi0 {
>  	pinctrl-0 =3D <&sdhi0_emmc_pins>;
> --
> 2.43.0


