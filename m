Return-Path: <linux-renesas-soc+bounces-8306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1FD95F4DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 17:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AECE1C20401
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51940158DD9;
	Mon, 26 Aug 2024 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OcObNd/X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E2A1E521;
	Mon, 26 Aug 2024 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685589; cv=fail; b=CEVGJl0RI4vt50x4mY9DOdh1v+bDD6QhDtRRzIRJlGbfmxyKiHpO0UKN21rSC3620OgDwX1syn+/ti71uYTgDE3C/bLcW2iM94xbjiB1xs27Feruv4BmdkACGv5CvT+X2tjeltnId2ZuPHjulsTB+ikVGXfns3IkRFTuUBtLYfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685589; c=relaxed/simple;
	bh=FAy1PkyMEKn8qkzzAGdeSHPvO7TRy1PuFfiODVrA4MY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GIscQAHe6BLCVnQq2rOycLXlN0xPO767mhpyFIi6yzJf/0G1zk59XdfRkPd9Q2cUcYNkuGmiV81KJVEkkHh5qJfhGeKE0R5AXWYH/x4O1ASp3jxpOPBA5PGbZLx/sI6COswD71d9XSV+d7DGlDwPoU8CKSUhugL/SG/EQggfwvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OcObNd/X; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLIVZ8v6kylojX5rNmiWUQYa/UP6byWqWF/a7JlzVK/DIZ2UOjf63/vrM2RtO2BNyaxYI7fLMmN4tpsT9diAQy4rWjhlg4j2GWBU3smOuerd+bpyPnyouUmE2BSiQDVBY/bcnTmJ0X4Y0EI4ZpmjJ0npJKYDZMHPORSDEeQUfC4qEVjo0lx1VojvKNlh22kXdA0Z2nCuCopI3g7vKYeGD7W+1bmRpOujfRrWv8YofhKsUvxio5+qTqCsM6IZ1/8CLMNtG+ncEPAyNKjkIkhzvO0xwNbM8h5JkJXb9f/Z/kRyyKDEnUE1T6OiuxJWp3F8B+hQ6yhY/XzO2WLTG/q0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDM0cPtBxZIeoKycdElD87XagEgYgHaAUNB7jNQ/Wbo=;
 b=S/zRjLsj1vVdOSkzUmjTKAPjiUG3/MVv5Ni/zbnjy6QJ/ai3wbF9qkKR2pi6DfUHp3qxEdaSqM+TcjN0l6BFl2I76wGVmN2RY7KWn4m4Ga358eJu9ED9Qze6rugxVZfK28zbq0Xz6eEtV2Jzf36THqvKrcLv2PucWJqqwgLvCWPQDFwaUJIinqlGGsfcaRu9dse/T8M6FxOVsNBs4aLt7tLXeWBhiz5gcqXrmsAu/0vBaz/OAoUryO6TqEiE8r2lmAgkUkTB+yso1ymWUUtq05d4LE2vGRdlrf4A8bP4Fml2x+6F1sgI1YyLNXsMEWimUt24mvqITgtXO5Rn6UtagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDM0cPtBxZIeoKycdElD87XagEgYgHaAUNB7jNQ/Wbo=;
 b=OcObNd/XYTF/rjlrq8Y7F4YXDjCSRnF9ssK1R1bRKwAClavtT8SKF6LTlGfdB1GDM96PfwATMzm0mDDtaC3PXSgxK42HMcpMD384DAj3MLJGcSoflyiFs7VsfyasECzaIIyU+4UyxgjQGJHh/U0kJfeo4lqtMiDkF3rfbKqJY+g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11266.jpnprd01.prod.outlook.com (2603:1096:400:3f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 15:19:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 15:19:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Thread-Topic: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Thread-Index: AQHa96EVks8gXgWqqUaSRcZnhpp0+LI5ptmA
Date: Mon, 26 Aug 2024 15:19:37 +0000
Message-ID:
 <TY3PR01MB1134634E725C4E0EDCBCF3F90868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11266:EE_
x-ms-office365-filtering-correlation-id: d58eeff8-f3e8-4f5d-6999-08dcc5e27fff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PKTd1VCbIkGthOSBb5kQivgZyFtFJ7twvNeXSCJxTUEfKcpS8bMW6DuP4Kno?=
 =?us-ascii?Q?hfJ28bhJulbgFeGnquWQuixdv1X27L9NVIv4hAOfQE9DlRtW+bsaKv6hsbrz?=
 =?us-ascii?Q?w3fKV8596tFVxpS+82kUoCwWKmEdw/j/xieGLlqTDLzCt0oYxUaINntA/8pB?=
 =?us-ascii?Q?HPJ96ApHhebgdTbkqcO9Q+AI3sHdXFUrcqCYZpitxRbQsQMvg1ieTiSK3Kbg?=
 =?us-ascii?Q?8kmop8uP1Yf/dFL/OEH2cnLQpFvJ3oBSSllCSE0Mx8zwfxKLDqLECJ3BBV8O?=
 =?us-ascii?Q?rcLrQsaZeWKvN8I3TxftUy4Z189sDjfWIZD/hyzizTMSF83HrF0CNxLyQqo1?=
 =?us-ascii?Q?GEKHFpAlEAeOiKgf9rlGbK5V7TMh2G6Ezl4TKpFAOqek5bOkx2MCU8B4Ya0s?=
 =?us-ascii?Q?FYr5HPfgasqLkMqEquC5uDXc6HoyORGrpwR0HlUSS4SvX9CYEZ5hUAgnQzt7?=
 =?us-ascii?Q?QSU+P/MLzj/EpPBWWGK4oJ0G/iLpC2uZI2dwo1slmRqnmmUeU2bItPKN3k/T?=
 =?us-ascii?Q?XK6nWJ0PCxsdaXDe3O5lq9N3oNoczHXCE26xLweiM4Dx6V4bkSEZ6QJKkPIr?=
 =?us-ascii?Q?Uh0DkiCMnfatEkF1u9mpehjjgTPNc8ra5pQFHIxbTciySVjuVFSiBRmQNHHl?=
 =?us-ascii?Q?m8B3Y5OfMKn17vDpbqq4Y8zsjRBsx1e/kxR/MdmwLZSbpzmoZYpq6136vvwu?=
 =?us-ascii?Q?7WJLzy3btSzGZvS+oVEb8UbP1WvpSwmZGzjBKY8rh/2aRvt2WUataoYo5gWb?=
 =?us-ascii?Q?zDFRh7VPG7UNI/lNInjCChSCnr28FhC31Xn2mWpGpHN0ja0c2dUDiIUobIVf?=
 =?us-ascii?Q?zJvhvGbl6aShShn8jJQl6gf2OhDdKzHOE/+AQFBn6HaptKVpulXntffMe2hZ?=
 =?us-ascii?Q?PWIUxbUeZynfN+y4L9xbVLY8SDi5UFJz2VzxT3zyonVwT7Zk2L9bzXQwYaiO?=
 =?us-ascii?Q?67K6GQop5TGnfy+mQv10ww/l9a7xgHQRp5FEG1y2BQ5ZGeaYFLtQq+focjMR?=
 =?us-ascii?Q?cCfRSOjrbRRXH8NfNAp8XxKQALQB3jm8+W3NW+s+J76xDeg2H84xyAKGz7+t?=
 =?us-ascii?Q?chQ3MAeBWTirh3A2+T9U6hyVfNktqG+5TjftFLnDo3MNMr4wJNgHlNsA60wF?=
 =?us-ascii?Q?O2u2r8t8FUJ1wuFejsVl6GqBFFqQqKTvrJHKAa1a1yWlZ4nZovf7YszDJMbk?=
 =?us-ascii?Q?Ht6uuPHyqZ0ZqL6b3Ev0lwGb1SncFr4YvUNv4oZYY81JGKoS97a8Aki6MQJ7?=
 =?us-ascii?Q?8zwiB7MO4FjjostW0BMpyhYNPI8vGIiF5NgRal9Skj6SaTzJYIorf2lkItpd?=
 =?us-ascii?Q?2JmNZXU7l4oL/0qpjQvb94XGEernH+i184sROgiRkQKLQ5tG4bi81C/w7N44?=
 =?us-ascii?Q?6CXsRpyYNy/h8Z/aN959wDM9CpkjeX0veTmoKmPznjsU/hgxEg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rGybHTKem+48zqoZLC9ZRp7Bc3nMqEPA7wkotHBLA0DjkcdFmHywmw3xe7Ht?=
 =?us-ascii?Q?PbKM47VWyQ5SRXa0RznnKiAkrAi/FcJaN0vBf6hfDcjpvwCqospuC61z/Wbv?=
 =?us-ascii?Q?p7EAC3vBd9TbJYnl8fYKBvMii/OSplpjA3G4dvTDI/1y4Lfv1MXeKcgb2xJR?=
 =?us-ascii?Q?sePN+Frsg/EYgjjRgD9NgkVzN6+JmULW2vLShEJ4nnqbw1MviSJFkNtU/cs3?=
 =?us-ascii?Q?yz3PuW2DUPm/sB0ywZOqkmsQE38J9QDYfMEAQvCzmB/SX8FtBesdqRtul1Ei?=
 =?us-ascii?Q?Quhdtx9JL8LCEqWG3lnOnEOCv+EQwYMoJTxYw3AlBqI0dJerDkayaO0I6QmS?=
 =?us-ascii?Q?Z9UcxfpRdJU+0F0A0mjLbUyV1ZGHYZjGRhcZt4rlMgqdmwXK4RnBgdBEqfr9?=
 =?us-ascii?Q?Kh7mSiEHYW2vidRQ5U8DgSSsHFCf4N1msHESwGtVqAonVd9T7+v+uy2RICpo?=
 =?us-ascii?Q?PqksiooJqA3zo/FiOx7g9A9uaAyZ7eBSSDk6wmI8Z1CH7V/FBHAnK8IhydjZ?=
 =?us-ascii?Q?BEP7OieYqzsmB1vB3Mo/bZ8pkhhEjzDh9TflPRhhfI/WIsE186TKf62DKhie?=
 =?us-ascii?Q?GewiKsu6kKLYLiQ/hZe3JNJqGzwt385KuLiycunRMSOl+9OoyamZgbnCPM8/?=
 =?us-ascii?Q?ae7MoC0AwPbXhCoJT6yLeFvd1a/ANNuwL1tnjXM3P/xvExqlBGpfOHpZigEK?=
 =?us-ascii?Q?z86ZGdDc1yRvnqUMwwKwKeA+dCgmHoR31JaUfYDFql4/iJUDbYJA215wyqhn?=
 =?us-ascii?Q?FuJbc4PuLUF4Lm3zW8tV7A9gbRqNkenYobG5sDbpMxNYcMupHNE/PKbhvtAC?=
 =?us-ascii?Q?1Jlzfr/KAAp33eU37JRiUy5mh7Ien1I2vGeIVmWEHoHTrLUqdfPseifhojtH?=
 =?us-ascii?Q?s3nudViBCEO7pcKbYPOZBXfZ7YO29JjBVwDXZlwBMIZMnUp0IgsLNXemIu19?=
 =?us-ascii?Q?InipM3gMyjdwLbxd/NA1/qdIQ1hVxl0/bRsR5XiGcA9SWeAxRizWG2QpxftB?=
 =?us-ascii?Q?QjST0KZ1MLVLy2C6rG/sMmLMBao68eT2MxO17vE7t39gFfsCCq0lANLd4w7r?=
 =?us-ascii?Q?OouqkKBzSHu8pl3vze0M2eLWrRvagwvzY3ixdw5IhItS7bOh31ZQUpEoScYz?=
 =?us-ascii?Q?Le7O10FmSFnF/DSMcS+c6btMWRpiaIpzCGlohBHcWmCPU4/1xvqzYAHnA1jk?=
 =?us-ascii?Q?aAxjKD2VzS8JUiV4kjEiGFXAm1BOvMojKhL5AY2c73sqcF/55FP4da46o7jY?=
 =?us-ascii?Q?L+psjRLeBwnyukTs4PS9JtKSGQnTGkmBTj2nHRqPzSMI7vyYUKpMsKQWAum4?=
 =?us-ascii?Q?XR2we4JfGuvm2ScBYvZ34tdkgtZzmVweIdWwc3/VQAGgBpMbgfAankshO5vW?=
 =?us-ascii?Q?Fl3cwuWskRm6Hc9FCT+lKPyKSk83ONLp4g7CpBBLJCcHPNinz1JVhXHgEWGz?=
 =?us-ascii?Q?cyPpf3g3b6et/oMzvgqPArOoG74vurbocP/WofCJSN2XVW+hMBBj9K1vMD4k?=
 =?us-ascii?Q?iNAAYPFptSUVymMb4lRB4GY9LJRnQzCCCiGfNncD4I1Zvm2VJekxpdkecJ9K?=
 =?us-ascii?Q?tGutzJciLaYju95zUNu1d8Vx0bnNrS2CszFp8MXHiApefoju00UMgYyhsq9d?=
 =?us-ascii?Q?Bw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d58eeff8-f3e8-4f5d-6999-08dcc5e27fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 15:19:38.0032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9t0n3o9sEsJOa+WtzUHJmeQ61MXbrICJuZ/zgO68vMIw1N0hFytKKpHMGZQgwmCb/0d0hA1RplJ1zk+6aNtgrUqWsjn/pdrADkHPsy15rKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11266

Hi Geert,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, August 26, 2024 11:17 AM
> Subject: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
>=20
> Enable DU and link with the HDMI add-on board connected with the parallel=
 connector on RZ/G2UL SMARC
> EV by using Device Tree overlay.

Oops Typo EV->EVK. Shall I resend the patch, please let me know.

Cheers,
Biju

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Created Overlay for ADV 7513 transmiiter connected to DU
> v3->v4:
>  * Restored ports property in du node and port@0 for DPI interface.
> v2->v3:
>  * Replaced ports->port in du node as it support only DPI output.
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  3 +
>  .../r9a07g043u11-smarc-du-adv7513.dtso        | 62 +++++++++++++++
>  .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 75 +++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv=
7513.dtso
>  create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index fbd214a1a638..fdf597e019d7 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -112,9 +112,12 @@ dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a779m5-salvator-x=
s-panel-aa104xd12.dtb
>=20
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-cru-csi-ov5645.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-du-adv7513.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043-smarc-pmod.dtbo  r9a07g043u1=
1-smarc-cru-csi-ov5645-dtbs :=3D
> r9a07g043u11-smarc.dtb r9a07g043u11-smarc-cru-csi-ov5645.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-cru-csi-ov5645.dtb
> +r9a07g043u11-smarc-du-adv7513-dtbs :=3D r9a07g043u11-smarc.dtb
> +r9a07g043u11-smarc-du-adv7513.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-du-adv7513.dtb
>  r9a07g043u11-smarc-pmod-dtbs :=3D r9a07g043u11-smarc.dtb r9a07g043-smarc=
-pmod.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-pmod.dtb
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dt=
so
> b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
> new file mode 100644
> index 000000000000..ecd43a671000
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree overlay for the RZ/G2UL SMARC EVK with ADV7513
> +transmitter
> + * connected to DU enabled.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +#define ADV7513_PARENT_I2C i2c1
> +#include "rz-smarc-du-adv7513.dtsi"
> +
> +&pinctrl {
> +	du_pins: du {
> +		data {
> +			pinmux =3D <RZG2L_PORT_PINMUX(11, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(13, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(13, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(13, 4, 6)>,
> +				 <RZG2L_PORT_PINMUX(13, 3, 6)>,
> +				 <RZG2L_PORT_PINMUX(12, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(13, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(14, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(14, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(14, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(16, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(15, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(16, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(15, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(15, 3, 6)>,
> +				 <RZG2L_PORT_PINMUX(18, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(15, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(17, 0, 6)>,
> +				 <RZG2L_PORT_PINMUX(17, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(17, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(18, 1, 6)>,
> +				 <RZG2L_PORT_PINMUX(18, 2, 6)>,
> +				 <RZG2L_PORT_PINMUX(17, 3, 6)>,
> +				 <RZG2L_PORT_PINMUX(18, 3, 6)>;
> +			drive-strength =3D <2>;
> +		};
> +
> +		sync {
> +			pinmux =3D <RZG2L_PORT_PINMUX(11, 0, 6)>, /* HSYNC */
> +				 <RZG2L_PORT_PINMUX(12, 0, 6)>; /* VSYNC */
> +			drive-strength =3D <2>;
> +		};
> +
> +		de {
> +			pinmux =3D <RZG2L_PORT_PINMUX(11, 1, 6)>; /* DE */
> +			drive-strength =3D <2>;
> +		};
> +
> +		clk {
> +			pinmux =3D <RZG2L_PORT_PINMUX(11, 3, 6)>; /* CLK */
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/=
arm64/boot/dts/renesas/rz-
> smarc-du-adv7513.dtsi
> new file mode 100644
> index 000000000000..a10314c77f54
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Common Device Tree for the RZ/G2UL SMARC EVK (and alike EVKs) with
> + * ADV7513 transmitter connected to DU enabled.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +&{/} {
> +	hdmi-out {
> +		compatible =3D "hdmi-connector";
> +		type =3D "d";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint =3D <&adv7513_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	pinctrl-0 =3D <&du_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			du_out_rgb: endpoint {
> +				remote-endpoint =3D <&adv7513_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&ADV7513_PARENT_I2C {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	adv7513: adv7513@39 {
> +		compatible =3D "adi,adv7513";
> +		reg =3D <0x39>;
> +
> +		adi,input-depth =3D <8>;
> +		adi,input-colorspace =3D "rgb";
> +		adi,input-clock =3D "1x";
> +
> +		avdd-supply =3D <&reg_1p8v>;
> +		dvdd-supply =3D <&reg_1p8v>;
> +		pvdd-supply =3D <&reg_1p8v>;
> +		dvdd-3v-supply =3D <&reg_3p3v>;
> +		bgvdd-supply =3D <&reg_1p8v>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				adv7513_in: endpoint {
> +					remote-endpoint =3D <&du_out_rgb>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				adv7513_out: endpoint {
> +					remote-endpoint =3D <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> --
> 2.43.0


