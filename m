Return-Path: <linux-renesas-soc+bounces-31650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8m62Nthk7GmjYQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:53:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9E46539C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566BA300DF5F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 06:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD73A1B6D1A;
	Sat, 25 Apr 2026 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LeZm311D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577F91C3BF7;
	Sat, 25 Apr 2026 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777099989; cv=fail; b=gwCYX88R/zkIsKrOljENZxshyYc1vN9mi1TIL1uqDDnMfeTybvGQNEDIGYlgCM+r5XZoRUc6V7jjYL/15JLhi1A6xXi9VfysA5yZMy3m07Ir1LfPEbUhdkm8NxT3UPRxrUqB/Z+wh+rQmSiGB8SvrFa+mDsL8xIaIC2wA5KeEew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777099989; c=relaxed/simple;
	bh=reK+tR1STyw3IFETJ830mOkWycczTxBVbeHTeSNjBBY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ek0YMHfM/KD3w2XxCv3eoBxsZ9LvRjFx9ckNZa9wEfq1PgP13hn/HyrdbnIcN6CetMPfAqFVNISjj9RFUx9ePm4WEzR/e/1p8fRtdZYe/fuUQunnNQsQ9suV3k9I+v+/PjfBVio+yjKE82oxDfcZAenQrIxnf2S2XhNMm+n/+9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LeZm311D; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyXL7En2+IcDRNaqIRdW9IwFbnHI+riGevGxRJTRtxSZ21cHLPx8F2fBIkLxj7g7fzhcGVFoj4KaidYxirX9e6MxbrhmH7a7cn9F0cidyRYdeHwiZh2nqHU6zy2dc66iDcIou2P0B+0XKyvRhuMffhKKG3tjKf6AaPoAOaLD/fbF63ys1DnbB//3M7B1wcpWazgWpOnwF3TCI2ukhGqQtkwwFnDm3KYLgXw8aekjy5//HAYs7lWK77Cgir7rr8Rk+w171fTVJQc8YTBJokMVoFHFcxcH3KmFsoKR0PGCAAcVtnpYnE54lJLmx6YkGSF+u3Ory3JBO2//7sIoyPmxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBla7XxbRaUvyliPbBFn9BICXmnVb7EdPTIP40PS+iA=;
 b=b1CgqXef0HgD2KiKqmJ1mvdfhiU6NbUJ08BGfiCcXgqY9D2p9799QkIv117bJfj6+iEXvwaYPEaij6W7J0QWqnMy88bFB4v7blWoOM+oBoHW0olj+zbbvz5ohnq+emu2VFe8bAr776E1Z75YF6pvrUVuvdfrmOqqkyRynQcxZkQZ71ZinLz9vOe64QEFR/0UN1foJGu9mLRe2Uu7UOKsqKd0dyR4yFrIi7A0h4jGuca5emHswcpM5+ZWApyGjwuRMW26C03HF1msvnjatEOSPO7XCjp85L7HdoEJQBx55eZn2s0QCMxALxN/Wmz+cFUHypELaD2eBx9wCiqb2HOczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBla7XxbRaUvyliPbBFn9BICXmnVb7EdPTIP40PS+iA=;
 b=LeZm311DaK55A6bQ0DUOwBL0Lcc+O0B4OBuPxQ960q7jRTJt6p2/flrOv6KY8AWy3aH/icHzE/55zLiwop9ryBgNYs/cHPsyekCs/BG+652BC4PgIntnFcBkwsWB+YCbHjtNib+4UQqgXAF1xMLfvbnk/5CvPDWVng0LDVKwzBI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11632.jpnprd01.prod.outlook.com (2603:1096:604:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.23; Sat, 25 Apr
 2026 06:53:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.023; Sat, 25 Apr 2026
 06:53:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error
 path
Thread-Topic: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error
 path
Thread-Index: AQHc1F3qmPAX2PfN8kSommC34KWovbXvVyiw
Date: Sat, 25 Apr 2026 06:53:03 +0000
Message-ID:
 <TY3PR01MB1134681BA16B917E7B9D9FB3B86282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11632:EE_
x-ms-office365-filtering-correlation-id: 7f53ed14-19bd-4f2d-a5c7-08dea2974c5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 1R0fuSPagSwXRnRw/I3n/AUhGk/SOnsw8KV5Foy7B5H/aPuxijFCc5HzWZIezMz9RY6mjgin4bHdO5I7oV4nF19ofscFcxjRfoMVisZt2qeFSOlNoPyq8j7DLHwrnLDRZLFNZHNMn/7iFJ1BrU5WRO6/vihOVZcmUjZOm6bZ3e7gS60BT4fhVHrcRoLgGMckG6IEN+6bh3ilXoPzhTeNI+1dyYukjydA4yWgD5gNevJav5wlt7Oq49bi4jWG8ozndt66NJ1ZSD8zCzwVRbatTcztR2BzsLvwbKCUncuzzq83dBK86sX3tW93DTKIZRN1BqSKvMxQ8dM8oEihC00sQOxEZXd/8JCv4Yr44kSgh+RJWbZ6Wm6Sy3tKKEpu58MSiy4ooJhn9kqgIFeU443W5AmXe/dlLR7nTD12yzPG89kWkOIytxkPbED1rewBZHUxmbAzGQkJL9iBOL6mjE/lE+CJjWG0CrwMETr6ViY5tMsiWOtg2t2AaDfFycsAdW9nBfcfkht1TE4HYMmAA//5p25PHQE4W8brY9eYsuFpVG9WOTmk1hPUWooPrQVan8YY070JLF1pWGqZ21QbuD3D5iytuI5d9MxQyqFtCJQ8gRp+aRO6bs8xBmtlk/mcV7k2J8eJCJLMzsNwpLfFi/84N3da8t+g6/1JuMihaPJcgMlsMXy77hUJ5uy44w3qsB3VbiDgamJJldhhhDRE6NFsq4JbSRVNRaX8G7SyAiMju45fHi4jJc72yxg17Xw53DJ6LJK9s16vslr4KrBq5wcGQwDB/smYT+UM5SCY3KNQF7Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y07Zd7ok+YOhsvbYh9boGLjTLudOmQcA5jSSX+6m+4EG3798y1ZtBxtXzQ0u?=
 =?us-ascii?Q?atcAYv+mvthfM9bQUyVtpSUQK2c2pYltm49AlvWhiBnk2AhJ4Rrc/y2YJXE0?=
 =?us-ascii?Q?fA32OV4A0vyXLoj0/ZaXdHl3yPfqSJAJvR2aXdWKiEtZMUeUQUao1FlBa9mK?=
 =?us-ascii?Q?rumSHYSrkOdMPZDZQhYnS0qHGqPjwAgFahDf/fnJFgJHrvjv887YoLBwewFI?=
 =?us-ascii?Q?Aimo7nsd7Ostt3q5DYZQs1N3iahuRNEmKLfnb68xrb/W9NI36ta93l1euD0L?=
 =?us-ascii?Q?MKs9yzPop449ObZYGBFRrlh09A4xsQA5tT5Ek81J7rajB6+fUHgqbPmR9l5O?=
 =?us-ascii?Q?OWN8pMDR//yYqRDpMMaR1qVhlajEs+LNw0/9C6tG/ktnyxv9kjmgkh3gSgFQ?=
 =?us-ascii?Q?D9vmIr4nl0sFh2ax2DF8QP6oSq6RaYCDfyIUhcc53oxKm9io+Q1jUjIIlU6u?=
 =?us-ascii?Q?M0bOaXdeAr8hf9r2UnK8R3VhY/FXpYjGz38jH4yN3mu7cUTJVVb6/R6sqs3T?=
 =?us-ascii?Q?trX8ljHTU7ItqE/wsfxjur2Pbjw7Zne1KaY+zJDuw6iT/MZJJlo+7ePwS6JD?=
 =?us-ascii?Q?OLVUvRWmTGNw9SQxmvMui+HQ45SQ8rCl6aR3JLAk4L3X+PIflkQwtWmBD4HV?=
 =?us-ascii?Q?TXZPXDryzmOAZC9miuBCRVZ8GO27L548GrTLTe7tOf9VsX72xVV9TnrKglUA?=
 =?us-ascii?Q?ehLNmupyNFeZ2Ts83rUKRF53qUa9LJrs6EqQfrtjlzbvse3JfTVDg9OPKGWo?=
 =?us-ascii?Q?HvGTOlu/I87VcYB398eeflKSirJir521xrevbk/0CEkJ8GdkX/3hJZl8zBMv?=
 =?us-ascii?Q?BfBYP2VsLJQBAQsS/vwQdWFXEFWElrs8yrMwO6p/ZV+Bn6n3ILR31kCKhTTg?=
 =?us-ascii?Q?pQi9UqQvoIu2jkGdxAXXFzcGu2um1VVCXBMrPwfSBVpVkZ775dWvtkLFPB2s?=
 =?us-ascii?Q?wagY2pqB5r1HPevaEd+zF5ZIY60hlxinY2ce7pnIvrsZlkdoZBP4vI8Ryj6G?=
 =?us-ascii?Q?JFZr0SBeCX/edwPG7wFoqR4zkSHa40Faz+l25e8PFV8yNJaLyHFJDuZGVkGD?=
 =?us-ascii?Q?/xAqb5xCVExyI3pWnrDCeBiTgjQIWWN5u/rLW5U8Kco7bMX3tziJiCAJtG0P?=
 =?us-ascii?Q?p+oGHLSdoYH3yZl/Dng5hQmyHsDdu2GYB9Dknc70rolOL01Ywp+vfOrtRWOY?=
 =?us-ascii?Q?T7Vm7kAS04mV8lQq139gxWLAyUms5argxrrEoUqEGt2hQ3bU+IpQ3GkGwgvy?=
 =?us-ascii?Q?Ugf67685zZFX6Y9cZM6OgxUtLdNFfBJrbc7USU6gN7e7+CcT3bVWMtV3hD7V?=
 =?us-ascii?Q?4/msEr6TPrW9nlAp5DSyZ8ByEY/xTeZowyREYwlptBh0TyqTh20cVG+/vtvT?=
 =?us-ascii?Q?VjOPuqJpNCWBYjJhsQbTf2EIQwdnWhWfBmxqzJ89SHtX8kdNVlgtPlg8EK5A?=
 =?us-ascii?Q?9IcINBtymVGUBexqZv/fRIReWrvIeRJDBLPIxGDKhShmdJBIX5S6a5yYkKvQ?=
 =?us-ascii?Q?BthzQSdkdlXkXEPEXuoeP12A+V6uND0iDu5F5V+hSLZNU2mijL9Pr4zn9GVo?=
 =?us-ascii?Q?PNqiQXfaRF5eK7vxgQ9T84c7fzBObTnIZy90UwMveFWtNt/phidu13b8xhuP?=
 =?us-ascii?Q?JXbVe8yUyzd7/wItMSKUT7ONM4SGAMYsGMVXNl5QgbCnwIr9o2+89+ZjCVdQ?=
 =?us-ascii?Q?ByEt8Hp48GzPVZLDGCUWHYtsjQ80NXxkJRpZXb4J2PZ2jaw1vcW/176VbpG7?=
 =?us-ascii?Q?zmd7e8xC1Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f53ed14-19bd-4f2d-a5c7-08dea2974c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 06:53:03.7717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8adxsWxTZ8C9EoKko4tlmYI+1uFwFG+Z0c5cBf+ZhazHe7i2UZE7MYJ7Fpm2WRwUuNQKmTzgKjnEPxGjQjtbKJBajZ5aPfGKWYgaT8Q1S1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11632
X-Rspamd-Queue-Id: 2CB9E46539C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31650-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 25 April 2026 03:47
> Subject: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error=
 path
>=20
> rzv2h_rspi_setup_clock() is declared to return u32 but returns -EINVAL wh=
en no valid clock parameters
> are found. Cast to u32, -EINVAL becomes 0xffffffea, which is a non-zero v=
alue. The caller in
> rzv2h_rspi_prepare_message() guards against failure with:
>=20
> 	rspi->freq =3D rzv2h_rspi_setup_clock(rspi, speed_hz);
> 	if (!rspi->freq)
> 		return -EINVAL;
>=20
> Because 0xffffffea is non-zero, the check is bypassed and the controller =
proceeds to program SPBR/SPCMD
> with stale values, leading to an unknown bit rate.
>=20
> Return 0 on the failed-search path, consistent with the existing
> clk_set_rate() failure path which already returns 0.
>=20
> Fixes: 77d931584dd3 ("spi: rzv2h-rspi: make transfer clock rate finding c=
hip-specific")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/spi/spi-rzv2h-rspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c =
index
> f45af5884638..1655efda7d20 100644
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


