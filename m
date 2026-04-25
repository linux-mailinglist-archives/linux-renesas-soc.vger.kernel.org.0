Return-Path: <linux-renesas-soc+bounces-31654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C92LLXV7GnlcwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 16:54:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99859466A5B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 16:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C4273001054
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 14:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964A9318B83;
	Sat, 25 Apr 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IxRjSA45"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49FB313E01;
	Sat, 25 Apr 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777128877; cv=fail; b=KRPHvDjiNsa2okl1IcGRWFo07NxhBgZaC24ZPlNXCITPmSGxXIIAOkkjeuwzgi9t0yzk9QzhwSodGeABmdyBBj0F3hqaU7Z80o8zH2H4WNpG51wuDvNN0U4DTKcmoMxFYh7wuwdPVa7Ahi/+Hs2O5rQZn3+blnQvKDmCncHt+Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777128877; c=relaxed/simple;
	bh=ounevYkUJB2recSlmtPzoTGPtMSNJvesm2MOZw+X6jE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RUHvkoid5NxfJ2CvsDMTNhJ/RJbPTTNXA/hoCxa2gKXXeQ1ukjrHf+NQzY4X7aTS2KD4ggl58Wib/UpNerrZRQ0PZtbO7HaGxDXpRdPndcpH0Xrsq56Nm1Wn3A+/AaZ5Swbgc2+jEM5R2g8/LfvZWCTz+7y0HzzN6pI+Q0B4Wyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IxRjSA45; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEcMBkyps3b7zBwZM6osPDFib34g5GzEtCOc+BPG/FM/ghY5wPcWdj+dBYUNPXTJIFL78aeHMtvsgMwHbM6dtWnCooxZjHWVn0ORH+QVW7yh+NNyTR7rSTVZPWn1OzsSvegXLvCavMlYxn2skqNQai8UWAoheRJIoL+/QfoNVL5tedW5sldFLCLJ2MIVtTMIOOXaJ2C8GtO9IiPhi/XDq5EONt0E9Qpy4PhI/G1OnUHEn5VdpTjl5SfsaGSXsEHV77f8eeDG9+EpqyGx0MScqN/rIFq79Few9ZFQc7sM4+mHZh6JtWJMCOMnreT6G9ueOuHL95Awf2V88ECunQIqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TUrEaluxHMmn5MmUH98gOTjmxmkSwv8msStVhbBEXU=;
 b=C4j8Tpf82rFVBagsLAMcwiJ2FGUfgv7eYSN/bD5ojhHqy63OprWWg9t9Eg+ZwuoZpSuVY9mdVDH9qWX2te0H7onPxzoeOXcuSNsdQrYoJaouUcHAM0VethnmzL7zlXDFFkKfd1mUcMoZCNSWX1wUkBJrLoH+/Lb2XXKw+RILiZUqtqcIjPj5Vn5wSsoMyJQGDTvJ/N/UejUTcJ5Vpl6E5KCfltlH1RjWXyVrVHXvZxMduV4UgOti2lNWmXrPxAtg200PvBs34ku/gghwQ5p1nOZ0P3rlB5jD1zfZSnZbUD4ndsfbmyw/wGw9ek+RSni90/BKsR/yRSkNGdQI7CCZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TUrEaluxHMmn5MmUH98gOTjmxmkSwv8msStVhbBEXU=;
 b=IxRjSA45MgFFQke0F/jx/twGcxUlopj++D6SyZPfpPN9otHFQelo6nXcR+bCvCqJMazGCjNCdbDhune80rqm7LqJqSV/X3e0iHPBHk1+VpfQsLoeyZVBLk1MByK6SX9OkTQPs43F44riPJyuDSHPPDd1uHgVohtJIlzRbympu8I=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYTPR01MB10921.jpnprd01.prod.outlook.com
 (2603:1096:400:39b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 14:54:31 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%5]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 14:54:25 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error
 path
Thread-Topic: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error
 path
Thread-Index: AQHc1F3qCbw5ObNhlEWAwgwX4QXPPrXv3eaA
Date: Sat, 25 Apr 2026 14:54:25 +0000
Message-ID:
 <TYRPR01MB15619368E6DC3FFDC7E20410E85282@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYTPR01MB10921:EE_
x-ms-office365-filtering-correlation-id: e07ee439-088b-4fba-b49d-08dea2da8b4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 YmmYXtd8bbnGrk3vPYpwwzt1zwZdBx6LBRgug2P1n7K1qBc41oOAC2d4n4n/zuew+QgyfJp60toQ5IbzKSZ6gIjiVl3NQYsmu6gtEdmOo/ASOi35mxjL6X3d+jv1oaAZ4hrbBhLf4eveDXgukwvNsWHGDkNJPx4/LS6U3HGrmHXVvWLlMkSy/FqWJPK4BE9jONKIQd33IT024wde7uTNMPhRK+bhLwqdnzYRX8rRXIZqP0+45ltMFIT4Kn7Rr5vcGeRvi47yEIAjuEZAm0lLjhDBC/cmaemgPFLoUDW+dT0KLos1TaS1fP/iaIdKkPJUG7Rxga0ja9rl5vNP55GGsnI7woe06nZYCLQGJEKhuY9Nvuh3XwSJPSyf9/6tKt6hUSSou3DsVBUCAQMuR4ncpa1InVxP4lEWiE+t+RvxC2zplGS2Uq0nlG9pXo1/onKaI9YkFUaRzApAjlDJKjrDkVz36wFM1LwFgEBfTWfVxoH0xNl5HhmIQuSaa6wtM3LMWfAu/LzWqB5AQSrq3N+05DGPuYTtl8wRGlqBEHkw3ewi/d4boct9OAkL3C7GXNZ7VKxsjI+MpRTx3kyLZN/M2TJrjuqTfiJsrxlX76wjoe0WpSHM4GOi4ZzzeBcxhl11/JDJya12dmUaY4zbmJSoERb5222/SyLsK/BDrTHkAvsltmZnqgDRpFfPb/J3PlrB6eAtWuzqH7MSyC6io+AdwR0FxE8hoQtFeVziHj1GG4f+DT/gNWBDEpt7CO9Vw+29IvQPGTrNcs+3O+7E8Oo+V0pvR5pprNJVN5DuYqbu7oo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gRP0qTdtjHZcXeCnJXUJM0jk+JE1RZOm6SQgSupA09qYgFlKa+9Yvh5hw4hY?=
 =?us-ascii?Q?fD/eAmRHinBDHRPWLM9ncGW3oGD1Qk6n9cOqCRMuIZ8JuzrTMO8qxB+WlDtY?=
 =?us-ascii?Q?l1O4xTwB2oGLOUwxClHGA8p2nyHMYU7/ji6zr3DTw13bSnWkLqryIJZZMPac?=
 =?us-ascii?Q?m8xsGzCnl39i/bpBthuPnhxHv2SOaWec3ODs2gQd6dwqY/g9iubtKAyuh3X+?=
 =?us-ascii?Q?E3falcl7Z/yg/yDNnryiuRQT3KVGmT4hLbqKI0hFFRwGCeL+B/lDq3ZG2mjA?=
 =?us-ascii?Q?t4QMSr5UooTpF7Lbh9HNxXY6+iJirNCHC9nBzIEMToSbEl9qlXLtmigE0BpD?=
 =?us-ascii?Q?aQJsTiErzqn1/QPiTH1XU2K8QnbSe3J+zhp5NJ+w3ZwfIgHCxOOSx8WqbLJG?=
 =?us-ascii?Q?wQkWzk/tqVPoxb0NckxWf5xMOIJg0mi4N8e8rgYmM8RpBCoZ27v7xTD/OwQc?=
 =?us-ascii?Q?cJm2PJNEalnRrzH4SpzrB/cxftZL/T/IM1MecccJSAGCgoHiryWcG9JpmaFX?=
 =?us-ascii?Q?+09H3jsQN5WSacknrGRtM3BcSHuxt1wiTTx4nFnaZ9VkA9DIoEBUNN2ufwVH?=
 =?us-ascii?Q?aTNrS4Qkb66ei2fGc9R6bLTsTUuRT94JPkS95eFfoVgOSCVnyLzRbo6NlZBf?=
 =?us-ascii?Q?iO+TmcABB7ioNUusAcEoaUQi2SU7ybEzZqCVr+AvuHVOR4YipK0IRKQOMr4L?=
 =?us-ascii?Q?USLfzJqO30nO6K58x+8A8mZD7kS2jtHKEHhs6YYxQUoy1zGNbe/DuSFfGQ1z?=
 =?us-ascii?Q?U9X9+Dnmj2G/wX7Cx6EHYBRwGoAl0hAHGw8ozZsKKjhSNiCGpSbYaD36quvT?=
 =?us-ascii?Q?dB3ig+i0cMMRBzBfckd22FpwtjS9rvk9Bp2g5+E3MRPyonSgJ7NgGIlsE40U?=
 =?us-ascii?Q?zPdx5XzzdUAgAvTHTcegsIuZA2HdATKTn61ReKYYQgFK+s3wqnqK+ITApSG/?=
 =?us-ascii?Q?UuSQgwJ6cOKQEg4zMjajmHr5iojU5oz8xjERzq649um17tipePRXZot6iLuh?=
 =?us-ascii?Q?pBtc9j2U9cSH9dNB/7ghWNAG4Q0kCP8r0lkpYyal92FsBCY9PCRuoKzgmfi6?=
 =?us-ascii?Q?KrY7Lg1Qo+qvJXN5I3yHx6siW0kSOwWvnDfDCjpiXW9vjqioIGjMpj16ecwY?=
 =?us-ascii?Q?QCu+BTnr/bVepRsASHZKfB48WQgxvJoZSe/h6bdMmpaQvVYA1AEs1hV3OkFb?=
 =?us-ascii?Q?y+D9MF3Z4zi2qQ49BPF8TdTpI3dTMFjKIsE6mWaz3sHvUHxlinnmSGGnj/hx?=
 =?us-ascii?Q?XHO9ozRcKtSrmfA+opL+Fqp9PrJ3A3Z7pc+vbh65lmrRZ4JOT//NM+AS8w6N?=
 =?us-ascii?Q?w5jMly7R0+Mda0st72qrSQwi2PtLoaBq1kltH2oZSH/6XJdW6QkBgx8KLMK1?=
 =?us-ascii?Q?gHdBZmUaZAkc3FWbc/KkYWXYM8A8My0iCoWXyOG76VdBqCOMGqDa4xjSVn/m?=
 =?us-ascii?Q?fZUBCijLWkWzMZtfNW9DKbSNyeZz6JspUR5ocXfwTPNvC+YgCyKZTl0+8zDQ?=
 =?us-ascii?Q?0wDn/daPGs7v1GU1pTbYPhFNOM8e+Bpkh69KIvp+WGL4CPJSfFJ4jFJNDI37?=
 =?us-ascii?Q?dTzKKD5+op2+K8Qr3eW6eemXLKqk3f9It/i/RbNeZVruK8SCKEbChxU/zu8N?=
 =?us-ascii?Q?0C6Fwi4e2NNxpXvcsOg+AHWcCMo30Ca0bqdRsrC/rwAREpfJ8r88iCoK+uGk?=
 =?us-ascii?Q?VlhY9PcxW6THjKVRuum87Pnc+jY5yQyLOze/jSL4s9rykk5o5aHbaC9y6W5C?=
 =?us-ascii?Q?DCP3gt3jC1y76l3MpZWyQUtjzRA8VinU7pHW36Itx9PnZlAvSaxo?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07ee439-088b-4fba-b49d-08dea2da8b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 14:54:25.6360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhVkK9I0u94obm9GE8zrvrLQD70BKR1jx0Kd9Lp2yCQ9VcTSmOVIaJwFniaEALQU/GNBr0Zwj5rgF7cUOlUyO3aJNTuX08E++HmhRV0Ei4DFvEbWo2GQdWYVxYs/an/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10921
X-Rspamd-Queue-Id: 99859466A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31654-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TYRPR01MB15619.jpnprd01.prod.outlook.com:mid]

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: Saturday, April 25, 2026 5:47 AM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; broonie@kernel.org
> Cc: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>; lin=
ux-spi@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; john.mad=
ieu@gmail.com; Biju Das
> <biju.das.jz@bp.renesas.com>; John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error=
 path
>=20
> rzv2h_rspi_setup_clock() is declared to return u32 but returns -EINVAL
> when no valid clock parameters are found. Cast to u32, -EINVAL becomes
> 0xffffffea, which is a non-zero value. The caller in
> rzv2h_rspi_prepare_message() guards against failure with:
>=20
> 	rspi->freq =3D rzv2h_rspi_setup_clock(rspi, speed_hz);
> 	if (!rspi->freq)
> 		return -EINVAL;
>=20
> Because 0xffffffea is non-zero, the check is bypassed and the controller
> proceeds to program SPBR/SPCMD with stale values, leading to an unknown
> bit rate.
>=20
> Return 0 on the failed-search path, consistent with the existing
> clk_set_rate() failure path which already returns 0.
>=20
> Fixes: 77d931584dd3 ("spi: rzv2h-rspi: make transfer clock rate finding c=
hip-specific")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> ---
>  drivers/spi/spi-rzv2h-rspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
> index f45af5884638..1655efda7d20 100644
> --- a/drivers/spi/spi-rzv2h-rspi.c
> +++ b/drivers/spi/spi-rzv2h-rspi.c
> @@ -579,7 +579,7 @@ static u32 rzv2h_rspi_setup_clock(struct rzv2h_rspi_p=
riv *rspi, u32 hz)
>  		rspi->info->find_pclk_rate(rspi->pclk, hz, &best_clock);
>=20
>  	if (!best_clock.clk_rate)
> -		return -EINVAL;
> +		return 0;
>=20
>  	ret =3D clk_set_rate(best_clock.clk, best_clock.clk_rate);
>  	if (ret)
> --
> 2.25.1


