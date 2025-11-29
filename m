Return-Path: <linux-renesas-soc+bounces-25396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3FC946CE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 19:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15AD3A4460
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ACE258CDA;
	Sat, 29 Nov 2025 18:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IWP+C0BC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC2220F3E;
	Sat, 29 Nov 2025 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764442424; cv=fail; b=Lk9VHU/SVmleEx77dRtgzh+QTS870i1ioFUuZYPy79UPqG4FxovPXkRdCG1pPc28EokZ7yoidmQRljAIQrDHtqG6nOr8nsypQqA2QjdKoR62PWOei9dR4EuMdTjoSD4MmKzIDmzHCq+VeQtI1ammKzR4yypbixv5EN8UkyhsNi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764442424; c=relaxed/simple;
	bh=Ir4MLG4BT3pTS+IwmzOv7YSf017chmI/neF/mMMxwrk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jQYh/rqdhqaTbgMEltt9wIBIyOZdz29a5wrDU7qQKDWx45fAwRrgUw78z6vNohXuCRveHeaODROsM1G3546atTZA8YtO0IDJrzXa+jOGBgnqICzy8FJIv2feT1oaVo/Nx+E7txEatZQlDzVIfCoWMAIH40HIGUEYFjZ4tNTnbNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IWP+C0BC; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5YyJ3hra4SToYPJSHyDg2wIiACMACjdWqpFjUzw1AtIPToX7mIZKSpjSCruJ0+j/0dGcOuXFFPgK7/YKQWWhYvjnWp4ZUZZ8RNR9mwVcpG9vBjzQ/64qQOyME3Cu3uKJdO+nAGoUcrlVDhHKRc8C8wjv2a5w3m/CHpNyvLQSLVMn/UPSyQgpQ3TQTZbqCfnvz7n60kBatbiy92rN0jqmZqolcsDAvSvCGq0X9eNp2PMHVquBvrIQfTdKah7VqwGjKOajJqhPbkVzIjFO/Rbw8l1NKbWsnAveSbVdkBKOzdBE+hIbAKDsB3J+9d9y1rN9IEYzww0jTg0g1OZbNpsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRXR25fZTl2Zfuu/duSZj56F9tsEyclDuivjSRjpFg0=;
 b=GWcAvzeUH7ue0h2KZrD4nv/PHRDQ3AYmgtDf8rJPJUO2uLo+Ei1rvCy4rv7BUN1ln0W64CH/FT7YuFKYNZ5vr7q/KizZSlqgy+n/AdFC8UP9rlHW1wQ116T7PQY/mPKkhHtDVuZqpLtwfNFl4d+BeekxiAaaIF8N1+EpcZFgNIHmq9tEJK/0UeXlieMjWfa0Ze6i6NqTiqxFK2Dv08cSY//3UZyyOTi5wl/Er4Dcf23Qo2ko+hWJxmgNeWJxFaogSKEdT42QNwm3waCMckpnvKohwxWmDw8XDPWwO+SDoyIgJ9BSt19oMub53n+xwJ2RrxZyHm3c7BkPPoJBlvxNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRXR25fZTl2Zfuu/duSZj56F9tsEyclDuivjSRjpFg0=;
 b=IWP+C0BCP0Aai84MXOPyBkrwRuwW/DRnrBBguM+Q9H4VLL/TCC6wUcpBtW3YZUV+NGNMCRuOIW3sC0evKW4OyV5eim9+Zc7qGpgN829Oa+NnCKMZBcmebD3wKFkQmUrWUeTU2VT4sEFTBGVvj8EZdZauM42tm9nyh9jHScShQ+0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11060.jpnprd01.prod.outlook.com (2603:1096:400:398::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.8; Sat, 29 Nov
 2025 18:53:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Sat, 29 Nov 2025
 18:53:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add
 support for WIFI + BT test
Thread-Topic: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add
 support for WIFI + BT test
Thread-Index: AQHcYWFGIkGa/4oRsEOyQV4avsZfZLUJ/+Ow
Date: Sat, 29 Nov 2025 18:53:33 +0000
Message-ID:
 <TY3PR01MB11346098C68AF3DC9147F0E5C86DDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
 <20251129185203.380002-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129185203.380002-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11060:EE_
x-ms-office365-filtering-correlation-id: ea825211-f338-4e19-6cfa-08de2f7898df
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nsB9Qmmazb9zyyLF1zxslfAJQFpURjiFs8uW5MVSKSEx0L7F6cYtFuamyoda?=
 =?us-ascii?Q?YWAgBPh4ky8NuP+aTKcIx8SnACt21jHAD901kBDEQ4rV3Vk9326XOTW8dS0L?=
 =?us-ascii?Q?ObuvG3fJpE202N3NFh32Ja39FPSQ59Jba/CNU1p3hrA4EFH788UdTf8SCcR6?=
 =?us-ascii?Q?BnZXQJ3NXXLF3m1wBNmOQCcW4NaLymK7xHBzg+OUbzCimJRs8L8hr+xuQC83?=
 =?us-ascii?Q?BjS+X5D2GYNgmlAsI7TMvEbvHudFejq1bpeNU5XCXlu1l5c1EwzsK7e2/gsI?=
 =?us-ascii?Q?GemRi7AlNJG5UudRwAEma8e+nbcrXBBZtUMUo4NafP+QNv6JwCIMF8DtAnzm?=
 =?us-ascii?Q?1H8yNIHJc6D/DBz/D7r9MjjiqJfxH3ZOT2/3rzKUFggproa5FBtEQc/4ma2j?=
 =?us-ascii?Q?MXVvJ4kPDOk3DXH1mt4j9RcdHq0nwuTSWwWBFkS85HSLaZqhE83/Zv7UWbLU?=
 =?us-ascii?Q?M3Khr/LJezJlIufsk2SkkLkpcDZ83NG7QBvoc9ICinJlwH9DnNxKEKkIbjd0?=
 =?us-ascii?Q?Cpd+rLzrlorCdwFoezZocL3+qRPCwIAu78dUDg/AZTrFN6Ut0us+2V6JIobc?=
 =?us-ascii?Q?vdGLzm9+k0O1d4sAcWLRE1BA+dS/fumOFyvl/a55pv0nWRaVLWXfyO4Xx93O?=
 =?us-ascii?Q?MNqH4ZKOJ6+JPL/zYbJwNbf+UMFtTReHtt8fVE/U5iqX33FsTRb/V1EBfKTS?=
 =?us-ascii?Q?F6IWrTfG1EbU5fV+CqYZj9w0O0pVoAiENKhPbOliZb3XpTEHGLs3VJsW8zoN?=
 =?us-ascii?Q?Zg8IBQA6eH28BLz8wcbJmfT2pN09MPdqLKpH5D1hvouKZQaujvKtb6a+XKKY?=
 =?us-ascii?Q?eXzoC7CO3nHojj7rtSYtoxruUGEvyg7Gkrq+GDBTeckinKeRNQPz+ukQ1DWf?=
 =?us-ascii?Q?fFiG6zSRT9WuN2R04C+PEJax6hISQE2oC/zO2XozeFDo1EB/lf8poStXCk7z?=
 =?us-ascii?Q?2no90Cm1XUxLb9TpI4dk7DVYO844wM6buf/S/hopN0RpUhzwtI08ZXx9shBE?=
 =?us-ascii?Q?rNz7xt2avs48DYaopDr+Z7g2IsTf1M/lnWICO+t9ZXYYggOALINhpsEr1nQ+?=
 =?us-ascii?Q?c6LMjFD6UteC/ciT2xXqwWP0BG5qlF4XtWoOFN7ZGGoyUEJNn4K6Lyo+K5O8?=
 =?us-ascii?Q?w3Vj6UGBW1SYV/e2J1K0cr8KIHrHX6kjY8gsF4otXvCy1UVAV/lSa6zKMEfo?=
 =?us-ascii?Q?AuLEwlgCTCX5R0hxSoHjmQnOVN0gV9dJmVIZulaP6UMO3Nqhq7NZLc/dBcJ3?=
 =?us-ascii?Q?GrRuP1Ihphl/umZseDksACKR5yctyYOeuw7iPb4iI64mopCmdjqiYQ3zWcAg?=
 =?us-ascii?Q?gTGwsFd8Aa1gWx29TRtSC0ctQmEon3wSOTAYT8D6T7VqjD3bkx7MJO4O+hSx?=
 =?us-ascii?Q?BXLbe1pctviwkI74HMHJPR7Eftp+aIEuJiCvzRBZFGvNqOp+CWg3ceD70GDJ?=
 =?us-ascii?Q?9FxeKUCyUxVyOlnjLoEDwuKe1fo7mwZxMzxSODSCIWbU+Eqfr1dlgYYeKc+k?=
 =?us-ascii?Q?KZ0pW8ABkVZBCBXdn2jYVI44PuhE4LBbEvpI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?05GOydy4iQIz/1O8+PVGH62QUrSAA7uuzO3YcRSOyPkqP58PENykZCY7EWOI?=
 =?us-ascii?Q?+S+QDtXCPXO/9f4wtz6/rgGW568F0r9U1/ut8o8XgwEHSo3ARvNmjOKyx0Rm?=
 =?us-ascii?Q?SesZipBms22wKvrUgbPwDZGkG8kyrFoJTh6GxUJDWSYI4URA9YcN808qS6z6?=
 =?us-ascii?Q?ZteEDonWC+/EC+Lznj9re7X4QajFrlfWtzqhSxXYb/zIyRGhzqEM+nXWe6qQ?=
 =?us-ascii?Q?BDCf5tWd6O1+Iprh2wjQrEnTxRALEraRMZSaVihEuV8CiPCIQyC8dB5pppDi?=
 =?us-ascii?Q?QrilNPwfMDC+LuWfqC4hEpzZnrkJN6nz2n6lAJF9z+MfIcxbXC374J1IAeBa?=
 =?us-ascii?Q?2KrSIYIrLZhGi3xI3XNU5MyCoYLoWrCtuTdfokfonQp0aBgxrZvviDpEPJMA?=
 =?us-ascii?Q?MKPA7WFpYmBK9mTnIgqTYEuH2T0b9CSGqWCm01hlwPsUTBLcuroT0Hr3SVDj?=
 =?us-ascii?Q?0tZOwwzanYaPCVZ7X87n0gljQkDP2BKFFv81ltIrS8kZ936ngEDDsTn2iEhn?=
 =?us-ascii?Q?wxTsk+GvXTE2CCBTOdalitJ3BH2XyzJ64JOh3f4qqEhyOpx84xa8w4m18NPJ?=
 =?us-ascii?Q?U0sKWcQflQHyAvAdtmnx+lKy3yD3txbTDPLlyVTr3zBUamT1MWrNwaCA/R6i?=
 =?us-ascii?Q?nQVB8LDEuPky6M8uHQv32FJ7Pvknr3AoWMSO7CBvXR48IbWjuV3XIsL4+R8/?=
 =?us-ascii?Q?rlUshm1GGfsCM32yVgnQy8sd0N+6O7BiZqnuONiOQ94vCXA5q7Dm+AYKG7d5?=
 =?us-ascii?Q?KWWbRqtFKzr+HWCpXQMBilUt8HpYB/UQqG44CCUxPWLu6vaatj5j8nmfabE6?=
 =?us-ascii?Q?iblgkBqkTyOWmnp9FExBi+5lVWAdoTmchTNqoQ5sBGyGvNDhRLZePLNPt4L5?=
 =?us-ascii?Q?6bLBg4YYWeoRQCPRlpsE8mNpvAerdjJFGHy7oGcUUkq2muluBNDHZxROcBUN?=
 =?us-ascii?Q?wLx9Zh5e7Ludx+/xv6MIGFyJq4Zncg9okBlhtcZWlwfownrcQ3GDgpmoSBbg?=
 =?us-ascii?Q?ddEfmbc+b+RyAjxupOvmM7K/g831l0nDIGado/83ajCY/Vo9IYYsSZ11K/4Q?=
 =?us-ascii?Q?epKpKkHZ2x2LLc1Gth+YrlNcDw9NenbiWc8294iCtlMJ9dgnNpMvzMe8By94?=
 =?us-ascii?Q?79nuz1TGBhJTM2Q9xR5mMrrXTSI2avxpkWTiXtRoMRfZKUh5KPvhJu45VrGo?=
 =?us-ascii?Q?NcWd9rgb8HxKS2zlWyr1DrMZaCeO6i3Qsg3V9rAfaIzfDYAInUwx3ZfsTeHr?=
 =?us-ascii?Q?4VVOJi9sMSveiBcJplPQkypHam0f0b3cyfwFw0ETpaLnxv5o8SnboBkuX6CX?=
 =?us-ascii?Q?Bdx8OhU/mIEJzMoaAf8bFFpFRxe7KXyNBieAkk8tsDXDOJBW+IB/czm+3Lht?=
 =?us-ascii?Q?mZJ9mrWafvmjhsDZcfI6szjCAhuwLx1dIzlsLBfr95CXPiAsXMD0sLGhydrK?=
 =?us-ascii?Q?PT9IO/DMc7JGpAnEeyf2ck2Y4SpRD/VkVOJKwO9OsIcFyD6/opByMMzQz1Cm?=
 =?us-ascii?Q?hE9XQJTwPROdNU+vHrVg1emogfb01LwXqnEm5BaqqeJh5IrUYTmfKTfPZTjn?=
 =?us-ascii?Q?I4jmpPnt9jFqNseABcj8ifMahwjKWoYaZXzZPDEEiF9Nw0RzJDb0/c2avSN1?=
 =?us-ascii?Q?QA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ea825211-f338-4e19-6cfa-08de2f7898df
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 18:53:33.9941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2oCHZASZ2OOfIn5SSX6I0VqaBFFCnzvwY5uSjn1tht5dWLIUyWwKUc+EoLulolYSCxZCyzRFOPPW/Fd1zOe4Mbmxjq5oXHuJSZ+QD000r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11060

Hi Geert,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 29 November 2025 18:52
> Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add supp=
ort for WIFI + BT test
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add support for WIFI + BT test M.2 board [1] [1] https://www.embeddedarti=
sts.com/wp-
> content/uploads/2021/05/2AE_2BC_M2_Datasheet.pdf
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch
> ---
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 43 ++++++++++++++++++-
>  arch/arm64/configs/defconfig                  | 26 +++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 696903dc7a63..76f43c098123 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -15,7 +15,7 @@
>  #define SW_SER0_PMOD		1
>  #define SW_SER2_EN		1
>  #define SW_SD0_DEV_SEL		0
> -#define SW_SDIO_M2E		0
> +#define SW_SDIO_M2E		1
>=20
>  #define PMOD_GPIO4		0
>  #define PMOD_GPIO6		0
> @@ -46,6 +46,7 @@ aliases {
>  		mmc1 =3D &sdhi1;
>  	};
>=20
> +#if (!SW_SDIO_M2E)
>  	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>  		compatible =3D "regulator-gpio";
>  		regulator-name =3D "SD1_PVDD";
> @@ -55,6 +56,7 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>  		gpios-states =3D <0>;
>  		states =3D <3300000 0>, <1800000 1>;
>  	};
> +#endif
>  };
>=20
>  &canfd {
> @@ -201,6 +203,15 @@ usb3_pins: usb3 {
>  		pinmux =3D <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
>  			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
>  	};
> +
> +#if (SW_SDIO_M2E)
> +	wifi18-hog {
> +		gpio-hog;
> +		gpios =3D <RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "wifi1.8";
> +	};
> +#endif
>  };
>=20
>  #if SW_SER0_PMOD && SW_SER2_EN
> @@ -211,6 +222,11 @@ &rsci2 {
>  	uart-has-rtscts;
>=20
>  	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		max-speed =3D <2000000>;
> +	};
>  };
>  #endif
>=20
> @@ -239,6 +255,7 @@ &scif0 {
>  	pinctrl-names =3D "default";
>  };
>=20
> +#if (!SW_SDIO_M2E)
>  &sdhi1 {
>  	pinctrl-0 =3D <&sdhi1_pins>;
>  	pinctrl-1 =3D <&sdhi1_pins>;
> @@ -247,6 +264,30 @@ &sdhi1 {
>  	vmmc-supply =3D <&reg_3p3v>;
>  	vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
>  };
> +#else
> +&sdhi1 {
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-1 =3D <&sdhi1_pins>;
> +	pinctrl-names =3D "default", "state_uhs";
> +	status =3D "okay";
> +
> +	vmmc-supply =3D <&reg_3p3v>;
> +	vqmmc-supply =3D <&reg_1p8v>;
> +	bus-width =3D <4>;
> +
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +
> +	non-removable;
> +	cap-power-off-card;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	brcmf: wifi@1 {
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> +	};
> +};
> +#endif
>=20
>  &xhci {
>  	pinctrl-0 =3D <&usb3_pins>;
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
index
> 370211c50d12..fc684cf56a6c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1910,3 +1910,29 @@ CONFIG_CORESIGHT_STM=3Dm  CONFIG_CORESIGHT_CPU_DEB=
UG=3Dm  CONFIG_CORESIGHT_CTI=3Dm
> CONFIG_MEMTEST=3Dy
> +CONFIG_BRCMUTIL=3Dm
> +CONFIG_BRCMFMAC_PROTO_BCDC=3Dy
> +CONFIG_BRCMFMAC_SDIO=3Dy
> +CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> +CONFIG_BT_BREDR=3Dy
> +CONFIG_BT_RFCOMM=3Dy
> +CONFIG_BT_RFCOMM_TTY=3Dy
> +CONFIG_BT_BNEP=3Dy
> +CONFIG_BT_BNEP_MC_FILTER=3Dy
> +CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> +CONFIG_BT_HS=3Dy
> +CONFIG_BT_HCIUART_NOKIA=3Dm
> +CONFIG_BT_HCIUART_BCSP=3Dy
> +CONFIG_BT_HCIUART_ATH3K=3Dy
> +CONFIG_BT_HCIUART_3WIRE=3Dy
> +CONFIG_BT_HCIUART_INTEL=3Dy
> +CONFIG_SND_SOC_MTK_BTCVSD=3Dy
> +CONFIG_SND_SOC_BT_SCO=3Dy
> +CONFIG_CRYPTO_RSA=3Dy
> +CONFIG_CRYPTO_HASH_INFO=3Dy
> +CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> +CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> +CONFIG_X509_CERTIFICATE_PARSER=3Dy
> +CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> +CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> +CONFIG_SYSTEM_TRUSTED_KEYS=3Dy

Please don't apply this patch. Added here for testing purpose.

Cheers,
Biju

