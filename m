Return-Path: <linux-renesas-soc+bounces-17184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85FABB550
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 08:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F19953AA68D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 06:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451842459CD;
	Mon, 19 May 2025 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gbWHZfZl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA58433A6;
	Mon, 19 May 2025 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637010; cv=fail; b=LDaGJ9i7yzNVo/RojBTCRFQs6VjnmLSiqoJx8u1j+zjV1FU8G9d3B7ig1bhAwH7mGnxV2DjTnDnmMpTRkC9TERusa7UuOURrz06is3faSxqHtVGdvhoVCjhcJ1QAmmPs1E/m53IJGo0OgIcBNjpZ1tZy1oaVaipKlCEG4/5ertk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637010; c=relaxed/simple;
	bh=Kjgr+pXjpiLz7L6H95FbAiwl7sgEXCFvCT+Ifqp7BR4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AJfqXUJqy7vU2bSNSKTfhHvKjZQ3CJr6amwM1/z+ggLKgTIAmGjJhW5b69vA9YsAO22aT+DkWzS80KNOotBXx0II+5Vds6G9yMJ9jxlr8iQBH84rj84BdwapKSrqqUrbxXjHllkC66Pwl19wNw2enfhaSnvd/d+hC8GT5jYtnLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gbWHZfZl; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcGpzc0NYTRwWLIK9h0C7ijUvL+BcWBR9A35y5gWwUFik70G9JgwBufSM+Z9roaBEkfkgmxOKXp12r7VahvIOK7TDO6rLmjAGm/IVZxtMxfmjuZ7veanJyDQlfAavyw7Xxfr+aPpbVrXmNX9Mu/r6KqCj9Arm3vBISvvqx0di5GYo81sNNJNuett5tc+1a7spLFCVl54T/kx0kad4tELSB7GxkSAt4SHYHFWa3cOGlK1dhAjx0Q307xVsEF1A1zuQVGiMoFZ+uPV2LrwMVpJKlk8CQ/OX4wmm1Y0vufPIFY5xYaJBbzm9c6sRI3hHTKyyGsgAlEoOHzkK0Hj0ozf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1vgDgALg/oXAi/kIx8rRVWeaoBg7I+ot1xg2WTN2w8=;
 b=lN7mzx2jWwkYjhoQXgt1n5mH7M370PQkQm6auaF9vD/e8wz/EZt3rpdvSU3VyREbvrjN6vQyfCRnCF+YlR2FRiI4DoNsdZvA2CbAKs9KI0Rjcj0YRMpLACgbqfYUES5KIEFKlGcOMGOnJYB7KKc7l9wc9pNw1+GdsRjG6Bdo2mPZjmH38ZoUQYAqUQlSL4qmSOrLoidGPNiGo2/adKc9n2ZHU9hJQ0hLV716RViwJ5T41tFWQZHX5atp8oW3dNGAwczcKtaWP5Q7qa/gkkStbHeSw5mp0RVCxCcXuT/7v3I94zamEvapGaOTASqwhW6SnHu6/gHkkBWroFRI16EEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1vgDgALg/oXAi/kIx8rRVWeaoBg7I+ot1xg2WTN2w8=;
 b=gbWHZfZl5yfFN5PNifs+oJP6CviibYJU0Sp+57AfFuiAs0qjffPiJO7AehEG9yNmNqY3rPlSQ0ogkQLqIwHdZWjNEhGaAuSjagvAIbNk/vine9VsLvm9eQY5eiahe3r/MWDH+EXb1jCny1tamsbv7Ht9pKeS+5xJMJnhu/3AwbU=
Received: from TYCPR01MB8740.jpnprd01.prod.outlook.com (2603:1096:400:18d::6)
 by TY3PR01MB12050.jpnprd01.prod.outlook.com (2603:1096:400:405::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 06:43:24 +0000
Received: from TYCPR01MB8740.jpnprd01.prod.outlook.com
 ([fe80::3a95:cdfa:d6c9:be27]) by TYCPR01MB8740.jpnprd01.prod.outlook.com
 ([fe80::3a95:cdfa:d6c9:be27%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 06:43:24 +0000
From: Duy Nguyen <duy.nguyen.rh@renesas.com>
To: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Nguyen Hong Thuan
	<thuan.nguyen-hong@banvien.com.vn>
Subject: [PATCH] arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
Thread-Topic: [PATCH] arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0
 groups
Thread-Index: AdvIiIJ8QBNUX2EfQzSQSg3fyDLxFg==
Date: Mon, 19 May 2025 06:43:24 +0000
Message-ID:
 <TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8740:EE_|TY3PR01MB12050:EE_
x-ms-office365-filtering-correlation-id: 9d8e59e4-2bce-49ed-02db-08dd96a073fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Y/tE58EzxH0HTS3WbfCj9QPqdLKKpxakl1zihiHqEr3Z+0PB64E1Tv+p6/Zl?=
 =?us-ascii?Q?fyVEdWWku7o2o7BVOQ1khCsaPODtqJ37OZ2FA3W1aJZj6mkrRsVJA0zFKZYY?=
 =?us-ascii?Q?Jpq3+CosgHMATcwZZpWVYgJk1q6EUCM7DV/ou3MhpkP2I19OGkzPgxdEaYH0?=
 =?us-ascii?Q?dtMSlZ9AbwlK/wBvRnE62LiSIaHXogRZ9ZfEgSdzirS6EQfFMbueY4jF5qri?=
 =?us-ascii?Q?pA9Hn+Thh/6WidAOApQJ/LhXI6y1/+KrafH8TWChivyi718c8h8HmlFMKkNi?=
 =?us-ascii?Q?VV4X4PzbwDQa3/TN1zf9ZDc1Rfea0boANB9zX8p+soiZ6r63u1IZ8PHWS5yW?=
 =?us-ascii?Q?CYLJP50R8UrJFuXMOMGaflevKE6D1zqQEYEmjsfpfwWND1f0eQOQ9n8cea6P?=
 =?us-ascii?Q?KO82CAMf6NWRVKYjAaU7AVs/vWdT9L5lsTL4m283YWJZin/SejJUZAbsT94C?=
 =?us-ascii?Q?INrQnV3oYd2eEHKBeMS3tO8ltR7Xvl5ZYtJxMqf8sTuCYjVETDJGZmKzBvq8?=
 =?us-ascii?Q?eSAR8ulEdbMlnMBXT0y6Zd5GEGYniyRCW6ijVWrchaaawR1GCkYzX88wugeM?=
 =?us-ascii?Q?gXw9HowNpQTvJzavajqWvOT1sEvPwdrQeWauuWBukJgo6KjaBMqoS+5OxSw9?=
 =?us-ascii?Q?4G3QsMXv4d1eoq+HZOkTJczNEyP971fE7Svwz0ScSNGSVlSBC9yR+XCLmfeO?=
 =?us-ascii?Q?HZ09d/Wxfz7Q+4arAIX7PaTMaL0T/664I/GPcbi3Rw049FbqcXJoQwBzyEVL?=
 =?us-ascii?Q?CNzxB3yJvIWjNNUYaVT50fL/tVJuKWnNxIFf6WXnfDqCbw1TNY4JIEk7uSkM?=
 =?us-ascii?Q?hdrX+MRN4sZOFquKAKUZFPEzsPmJA1M44CWP5Ml8KPhrudaAzQsmhjVhO3XF?=
 =?us-ascii?Q?NPwo8q2pLRExV1EdqAcBVqBNgEc4Go2hJivzT9iSDwM8HU8UmvnsKP3jyk2q?=
 =?us-ascii?Q?xH/WHBMtx/IAOHA5yfWPKVf0h60Qzlv+8esCNE6ewwjhxyaF3yqwJ/vehnW2?=
 =?us-ascii?Q?Wg97L07pgUuhNKApoUZh0VzwX0Xo2vSSeMAyNyQILNnNOAxubhSTODm/vuFr?=
 =?us-ascii?Q?TS5/VZHHqshIVlum2gI33PgQQTNnrYYTZEu0t3Mj3x0dCy6s/5t+HCEtjI00?=
 =?us-ascii?Q?/nQLOW4O2HdtMzMgAvTchYVKj9Is49W4Pi8b+kZAlAMQilJePEcrfm+xQiN8?=
 =?us-ascii?Q?8Qv1HTXmqqyD7n/8bup4z1i2geqWGqekOA63q1NYvYatJ4St1rv17cJ181Pt?=
 =?us-ascii?Q?e+0xQCLZ4ZURsIqhcRJ7/z6/cEKx4ifb8SM+voVaCGaG4kZ83jIwEOSnURDK?=
 =?us-ascii?Q?6URZpU4EPko/g4NzYdVw66564d49ni1KmdgTmFLAvcaDqJFJhZ4VvHnMesDD?=
 =?us-ascii?Q?Y+umJKnD/ql9qXHylIfxJA25ES7slH1uV/zbBLqNpoaZEpbQ6ppi9xvRzofh?=
 =?us-ascii?Q?I2RvT3WPMftnQmMll3cPvYY10Uh2x2y9U79QTbXN7xVKSg+p+qtOFX9WCB1D?=
 =?us-ascii?Q?YvP0+KlAo+3F7IU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ho0FErbTeneUCHjpYyPnGqwNz2vYFRqrVBgpcXP6r5mVlg9GMydlVbWeeJHL?=
 =?us-ascii?Q?nQ4OOwPKYluZe18Rj0e9xzdpDcbrGK54xsG32IExaZJtQI4gplrn8OQPfaIv?=
 =?us-ascii?Q?vU90FPEATg3V7Ha4y+q7uEvlWtJAZpAKcN1Nvn8ibOPU07iQnS5FqxBk7Rmu?=
 =?us-ascii?Q?MkdJkKvr+nio1l8+/Q0JcXr/ZFvRbCMRnLAGDov4eOxqpPDS4lKU7+mKjfFA?=
 =?us-ascii?Q?W0MpD43W09WocP6tSbBcj+TjDtR+W8iCzRRsBudrMEOerFnNuaAKVHsFnTy3?=
 =?us-ascii?Q?wNDLeQEp4xJda1agd7hbwafbEniMHYtOf7HJTPVohvuvyaDyPtcqomIax3+D?=
 =?us-ascii?Q?GqbAVeRtjKdfW87vuwtPps3dAQhz/1ln53pKu4cJj/hW6BVs1HMWf0ESMTyC?=
 =?us-ascii?Q?CNNhT92x5GfkiqehaMZ7GJcwgBufu9JrsdEcnHvnxD++0/GDpdE5bVwJ4V2W?=
 =?us-ascii?Q?cBFMW8B5qXcFPYdS4LXutjIr2bQN/WEDOt+F4+W7DKqivuAI676085L/US5m?=
 =?us-ascii?Q?rPOHSWfSvoJjS9k7y3GJ98D4D5RDEjRHQDlOtyTtfVrFD5BBsWhBhzOAoWb3?=
 =?us-ascii?Q?GE5coibUJO5vRZOrr3UDCX7bzonJQIGR60a6Ms3/dSIb/zKM0O/jvBd57APf?=
 =?us-ascii?Q?BJXS8SeGSK3SJ704HvMoeE+qAXCN5qhsneZCAn5XpBxH2Zw2IehrhmT6eWbM?=
 =?us-ascii?Q?ZUbHlxqUvotgkmML2tqMIm0cv6ebGunhjgGc/vyj+JJlQP0x3RGNDbVagmqI?=
 =?us-ascii?Q?/GtgrMPHBV0vaC/jHBhPnvTmB5O9Gsym6/H098Wkt/nVTswvq4rfWnWafIxS?=
 =?us-ascii?Q?/DEPaE3n+9urNMuSRSLsq1gqbp39rETjqam+xwKbsLapkfnn7ZNifbz4KkXT?=
 =?us-ascii?Q?uH9CcEBOUkHrzVHfHqS6MIBF1WFJnuPijShZ3Y6zjpiFODIUzvH2xNgi8kmA?=
 =?us-ascii?Q?sRST13QBDHMTI9oZQWNLiREkD4fY+Jph/susqIfvBrYgJ5TOo+xf3Tefrowd?=
 =?us-ascii?Q?FYXifLembItPIENY2nQydA8VBvRF4Hrat5RFCcM7kgxaCTZ2ZCdHkN35iR1J?=
 =?us-ascii?Q?El1hFGSLKZiUZ5BAnGyvYdmKs8KjtT2bqtrrXv4F22X5DyB2I3l4Wwsehnq3?=
 =?us-ascii?Q?w+kecgMSoUb+CqTAxvf2aKSpciNmbhtm5nui8Gqs2g5mvDZnVqTGK9qcLIma?=
 =?us-ascii?Q?KCsXouGovntLn9uqZcvGY0SRk5m8DuM+S6NCN41LYEHXNg96XMnGtxFIJQom?=
 =?us-ascii?Q?6Ks/1ajMVXw7SFZXzGcT8UbQ98Wj8zIpp79yAmcY1a/UbFGRSezroocEjNzO?=
 =?us-ascii?Q?e3QGfgHuKby//0JVnLNkzzFHWGC4Ma7/SC6ghmDU4ojb6F527Per958gM3s6?=
 =?us-ascii?Q?h62ZhAos37zKNDvv55L/y9NDjp1wfILelpUOHVDjYGRAVVALeNZWtptIwJhr?=
 =?us-ascii?Q?k7mWnTg713gQjvcTpXas5ExMP/bHUFiIAmterHFZZG9B6GUFLEqzN0u0Q/mj?=
 =?us-ascii?Q?TGKXs+UcJMRTknHlacqNLCqENv+ONHMEvPcNrlHW6G3+RGiqkD4t89WcxAJ9?=
 =?us-ascii?Q?/emScrVI0GBssQwjtkqYy8xp4LqH9ImffP4Grz+YrejUZe6l5Q8k7UPIKwBg?=
 =?us-ascii?Q?zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8e59e4-2bce-49ed-02db-08dd96a073fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 06:43:24.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yr9nS24NnCQjPHpHuSl46BRaN4ZsaTC9zCqqG2Xd5fD5DU29xr4wue/8ByiN6irog8exrf3N6enWAkaaYdIdtewXvYw3nfGwX+jvZjiZlsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050

From: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>

The White Hawk's sound uses a clock from the TPU, but
commit 3d144ef10a44 ("pinctrl: renesas: r8a779g0: Fix TPU suffixes")
has renamed tpu_to0_a to tpu_to0_b. We must change accordingly
otherwise the sound driver will not receive a clock signal.

Signed-off-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
---
 arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso b=
/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
index c27b9b3d4e5f..f2d53e958da1 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
@@ -108,7 +108,7 @@ sound_clk_pins: sound-clk {
 	};
=20
 	tpu0_pins: tpu0 {
-		groups =3D "tpu_to0_a";
+		groups =3D "tpu_to0_b";
 		function =3D "tpu";
 	};
 };
--=20
2.34.1

