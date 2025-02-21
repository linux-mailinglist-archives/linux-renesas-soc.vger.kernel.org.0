Return-Path: <linux-renesas-soc+bounces-13447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E5A3EA99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 03:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F64166137
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 02:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926A719D087;
	Fri, 21 Feb 2025 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nY/9LeI1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96B157A72;
	Fri, 21 Feb 2025 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103942; cv=fail; b=N7mEPFF9DxGlNoaM9mggotVkdnKwgzcugnaeJtI4SHXkL5NhAHNCYAnPn0vzxI8lsu451Rnq8zYXlY+r7IqRoZyGMzVkfSQkDTgmN7kz57bXhv3iwFfyA8qV1Y8EJ3Dm3TrkC4vnMyc4dmAJOH2Oq58ooeufs3tIPP4FmqyNyZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103942; c=relaxed/simple;
	bh=NLpxJcpGjYcWxUHWD4dQk9LXdruwP6/My/Q+PxHRBko=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YpedEWSW6ybE/CV0O//r6i2YRUYATFjQ18FwfNE1U4nt6zxN2jeHs+nVU5K1EgPWxZf12XzklgbTCxi7gZYapBCJ7D+E0dAkWRZ0eZ5fwDbbtgpuctKkalMfIvVicb/UBfw4zRstAj2q3bfSXpoEBn1hKF8CRZOlfkFR/Gy7fdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nY/9LeI1; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcSkduANjoVqhEZhr0mqDmGZNTANWcBi5LOOR96Mtmc0MbaR72Yx3AGfYiFGaIJuSJXhZLY4zXrdLS0QEn/ySTFOFZ3WMl2JTHBIIfgIvIqewBud3+wFM2tDHOE3GwrmtaEimqaCSRFxvxEyumYVIiV1Y7hvdLCqTKumqvB4e6w1pg3D2QGYFHD0qpmdh+WPDBPzlgca8L4O0nY502+T1CEJ8Hu8b69LrJz5ST2OoX9DX4jA2FFroyzj0b4ZfiRCp9WkoVXpX7tGIn3v1l/D76uUcPLUwoFLAIV6+jDxcBJKm+kVWzm1/rZmZ8MLOddN0O1uEJAed6BKsV0nAjkj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+/DHt3FXBRZcHrqFb9BvQ7RdLTagkTMh+T00bZHkKE=;
 b=brgytKD6ZKCSPweP9hynLOC0mLIA0V8ABYKQZkLQI3He5QFgQrbI1IAaglPnoZFZJ7ItQKP1DUClSg32jDtDeWBthX040w6jH82YiwEUy3vrAMHEcL61vneOqqbVFURY1gLN8lus0QilQim4Pm5KNcbI+j8oOep7l1LTj4gSflKLYGotjomsDdRRQeGz6NkfnzqLUCJxlUCxeONurBBiCIcz6GdxrRsTbzzDpktYtF2gJIaXnaFsUiLnqd/ZkdFcxPEKTHCJ3DxV3/vXcCA/QA3hgHM0u7uazxO8lvwfc32Bnly3RYGMTth3sokOicIYQjwZ8tMwwp2CuJAOORGcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+/DHt3FXBRZcHrqFb9BvQ7RdLTagkTMh+T00bZHkKE=;
 b=nY/9LeI1m2XX/ZGdJtvcSg/jSTCgiAO1aVsYtzs1CpAzHME+gBC7a9uTaqUFfWumD1IinfDstJ+MFFLylC09EAynYcw+VVRuP6csCdYzRd8Ri5LJXjfjyB23nOtOo6on+Y/ql2W23T6HEEoJNjKWLwxLmfxcRZ9/tRlqbyh3iCQ=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OSZPR01MB8482.jpnprd01.prod.outlook.com (2603:1096:604:183::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 02:12:18 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 02:12:17 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
	"fabrizio.castro@bp.renesas.com" <fabrizio.castro@bp.renesas.com>,
	"robh@kernel.org" <robh@kernel.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH RFT 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on
 PHY power off
Thread-Topic: [PATCH RFT 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset
 on PHY power off
Thread-Index: AQHbguh3iph+7ikui0eUIhpJurctA7NRBeMw
Date: Fri, 21 Feb 2025 02:12:17 +0000
Message-ID:
 <TYCPR01MB11040FFBFD60526158DFAE2D5D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
 <20250219160749.1750797-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250219160749.1750797-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OSZPR01MB8482:EE_
x-ms-office365-filtering-correlation-id: d1ca267e-1da0-4ccc-8f87-08dd521d2a59
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ieMl5hfWdCq0oy2lzUjigLYvFNsHFUO0oEnKInxfoFRraQDcBJ7mpm2DOKT0?=
 =?us-ascii?Q?VSKt9MFtWwkaVZESGkslZSfFcNzzN/QQbdlm7rDN7rRbNem53z0etDHfw8ph?=
 =?us-ascii?Q?JVkNW7mmVJKFVro9cnkjaGo4gbHYrMIAbSxoLCO9K2JTE8jOoTD8gJ+Hw8aT?=
 =?us-ascii?Q?KArY48Op7VMUaFylSgHJYPPI6tY53hFbEegZd5TEEem1HLuOpK7glsLvAbOW?=
 =?us-ascii?Q?3S5yj46I9CSBj9DLZ/4sELsleXdSh1OImb2xnPEUtm/o0VnaX8uIdMnhdsYw?=
 =?us-ascii?Q?3vmSFkdzUkNmeX3BkCnBx0wcDKIeRIdBeQ8HhPuNOxQL37CEDqIdDKNQ3Pu5?=
 =?us-ascii?Q?RSKwXZuKUCVDNKunV5XwInEE+a7HH40WfrOqa2TGKZjr8xC4ZytP5wlLqHK3?=
 =?us-ascii?Q?Jm64886Zy0+Hj35zVizKRdqyrs4NA3oycxKEQMMSv8gUpoFdcFkR6VPNHbIt?=
 =?us-ascii?Q?kw0+9yu8rk3/n7fGC+gCgj9ALgY+iwpq0ertMtMtEI4TPAihWo4LZ/3pxwbW?=
 =?us-ascii?Q?XFZvbQtptZkH/TmBiEwGeNVxhZ3TNQgGwrqBRvuo0cF3HXr1+brinIfjysme?=
 =?us-ascii?Q?UAwDKySeD7+hGEQECR/6txNt6Ho8zICL4CQnReJOB0x3BvYCw8QKhW4GFQUk?=
 =?us-ascii?Q?FhlpHdT84AaRS82ohwI/jBK72mdtLU8bGmxWt3cMpEKfKqNfKBBOT0DXKb2+?=
 =?us-ascii?Q?o7oQDIW6pcLcka1YFtuNjBl8rHrNvlMMk6/yPxbFZpnoRk7GJoM4jZ9NmJxQ?=
 =?us-ascii?Q?FuqxYkBd6YsTQSzKN3nHHOCEIFSId4WuFn74MXpmBRiuoDa6u8Oryruyr0El?=
 =?us-ascii?Q?sz34gUwMHbPmPI95BwAoQaGahl+o8P2OQgbJX6Hvykn7ZRCp4lR6GBw6RJKz?=
 =?us-ascii?Q?fGSSpM+iW2iIsfDv9B79ObpvC15qRhpOFkJFOsXstKs/mXDtd0KY0W11/qrb?=
 =?us-ascii?Q?6zha0IMNyr3zU99D9qcYX5wVVeA/WcsbKwfTy8ZQDPLCVNt+hdSJbJwNZchj?=
 =?us-ascii?Q?PxdU6n8bHf42zbZA0vzfdTVQzeLkahF0Iz7Mb3dhL9V+mo8ukWlAnJ6Gcjpb?=
 =?us-ascii?Q?EUTYONphQwtz8MYmGSdoRCe90joRVpTcM9rco7QBvA8BbaARr9DquSmuxpj5?=
 =?us-ascii?Q?zntYKACGYEDIcpNnuXOazfb5PzqE5qRBfxnIh7CPZaEbIBdODaNIfURHIts1?=
 =?us-ascii?Q?rcMZHyxooMvGrP3n5Y8uTNnq93MrbvML5w4eOzEfLEHmyTpLjjHLT7Rdr3KS?=
 =?us-ascii?Q?83BbqhCl4M608ykS8XOe/eeMVfzPmLU0ytNdWKW3DyEhus55qn9kcLrUFrnX?=
 =?us-ascii?Q?ZSmBTRRmhthy7ZiJZuBCb6MeahIFgr2B4zwb3SO0Nk15jCZKR8FyfCXZFhHn?=
 =?us-ascii?Q?4NqZaCTjfiNPa8NlCWSQHqRUq5Qn2zBmlYoLmORsI+gWnnz0jds6kZtiiWF/?=
 =?us-ascii?Q?/82UBnMTdRRLlWnNOpgPXijTXufoVEMz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S/UWNhA5EGtmBoFHMDLvAE+4Gwt3gLBtO6h9EMXEIw9CACxS4aOUpT8+zPM3?=
 =?us-ascii?Q?K53uPqUa6QmDMEMMcQvfxlXJqD+IAQ8qVhCHNyWuFjnl4MFSKSuZ+FFKapyb?=
 =?us-ascii?Q?5Rbf4svRZp9NK1bQPflZ8uf8tZNC/Ad4k4x5Jc11SoFCASOWQHPcn7c5yXau?=
 =?us-ascii?Q?YRIf3tuR96F6p8q0AXSJ98AytJhZ4kzXKyn8zfcipcc1WE0hILTjdRA6URT6?=
 =?us-ascii?Q?EJxwRhaa4vTBrizqZuEY1oZEHyhOMV3/WhFMw6fcdKmAZXTAYNxUsOAWAs1S?=
 =?us-ascii?Q?gpbdOy/ld16tubSq9sHL109zfqvBZudSsLRbyT3rQFPKWTl3N3+RdZOsG+JX?=
 =?us-ascii?Q?Hbz2GsHlCxt7r49OuWmG2WXo4kvHjRhSETcy85nJLmncIz6WvesnJK2Ke4Vt?=
 =?us-ascii?Q?as3W52MaQG8EnAXjtb0b7mhzSlKloB2zfCkTqyN88pxEM2x269F7YbDT7wk6?=
 =?us-ascii?Q?zXGjeLTOZOCvU2owPfgxEwQUbReE2+yXVX7DKmlg1NCQxCLO43hZWlt+jO6a?=
 =?us-ascii?Q?GWqmjX6MMgJR7TAL/jyBwphVIllIGTmd0/gk3z2xfePnci4cNwXvlp3q3S4C?=
 =?us-ascii?Q?vV2sR+HFFPPT75HEPQ9x7cuXy4KcfB4U/zBnvTAbmxvm24zy5fJfTnTbTdw2?=
 =?us-ascii?Q?m3XZBauq+aCB4wmljUWa6Vhgr5UlU0R7aSFDNYicx2U/TExQrw32/q9dMT1I?=
 =?us-ascii?Q?0EFV8CjI++8II0xgfgMb905qT23s8lvzoZhr2AaIuf2y3pr3LAarLqoLekQS?=
 =?us-ascii?Q?lMAClYIN+BPrfdds657TnbYLMv0htgrBlr0/5iTn7L08D0FIakWvHaCdQOdz?=
 =?us-ascii?Q?4A4bvBhlLTQMdryr5IhnIpKUtr9EQsFxlNgV9lmVqdAKxXSjmgIbrgDPpXhB?=
 =?us-ascii?Q?PsEIWuCksB1MD+YZxidnNqAvppfJX04vz/EiQGVKQ5Vryyt2W7Sq7drLPwL5?=
 =?us-ascii?Q?JxhIe1dJsZXjclU6La0huleaXg993ARjOg+ptT+RQyH0xmFtMK9QzBt0I95n?=
 =?us-ascii?Q?3WF47Kz370LCVGHQXubRt91MAcUwQZ6gtsuuOVJPcfeQp7wushVaXmCdunmK?=
 =?us-ascii?Q?n9m+WN+odyYZ9C5GPzCV6E/UBL9YCgoI7l6/UlG7+iUBhK8+KKwEEfrxwAvi?=
 =?us-ascii?Q?eB+omIKbBsXtV4aQq+1T5kGThsTYjls4VzFsQQQSHHKfMHG6Way0dy82wiOu?=
 =?us-ascii?Q?lOEDHD66wbpfPNDNk1FDBKrZljaEdXPEKrJPGn1FtvyqhLx/Spo0369QjDFw?=
 =?us-ascii?Q?LYbfp8UD93S1sL/yqNDcqRxKgDoguZm15woJ3xtOCqBgtRU+tm2G587aPfgn?=
 =?us-ascii?Q?DC5WxaryISJFKYX49cCEEePie9tfz7UoRKvXivgYCveZXlfYejrxlY1fAXoE?=
 =?us-ascii?Q?yLwojrWTswsPxn888KH8ryB7sWBJDEP32ZU0x4nWzj2WW3CatcT7RsRUW+LL?=
 =?us-ascii?Q?ZUwZ8luf+Y1Lcts1vjBOs0YMgC2fKfUIIj1TO6TwFwl+Ya+OhtGZL0n1T+NG?=
 =?us-ascii?Q?mDMpzBmQVhw6ZRYUJe4woiB2f1b9O3U0fWFIpI64PK6hbtlAz9E3QYh05qtO?=
 =?us-ascii?Q?SvsrLRviOnQoRePIAA45mIOPyMQuR5WPgXlj66eDpls+J1LBJwV1lD/1Y1qt?=
 =?us-ascii?Q?LCVVabLE0513Vei5cqVd76Cw0vvMsGMncB3Cz8dYAKWiHVSP7X1hOwy3nlMa?=
 =?us-ascii?Q?iVNQQA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ca267e-1da0-4ccc-8f87-08dd521d2a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 02:12:17.4479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1z5v5DvkHrj+NxRtriO25xFD2+Nnr0tBWp0LUOp7wJRdpsmU6wWYr++NyY6lKWred+DqsIbvyeYbZtJoHqzuUcl/pjCxtYq2DFy+MpGpBDt1SuBDJZgLEB1I0yPDBV+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8482

Hello Claudiu-san,

> From: Claudiu, Sent: Thursday, February 20, 2025 1:08 AM
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Assert PLL reset on PHY power off. This saves power.
>=20
> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 5c0ceba09b67..087937407b0b 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -537,9 +537,16 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *=
p)
>  	struct rcar_gen3_chan *channel =3D rphy->ch;
>  	int ret =3D 0;
>=20
> -	scoped_guard(spinlock_irqsave, &channel->lock)
> +	scoped_guard(spinlock_irqsave, &channel->lock) {
>  		rphy->powered =3D false;
>=20
> +		if (rcar_gen3_are_all_rphys_power_off(channel)) {
> +			u32 val =3D readl(channel->base + USB2_USBCTR);
> +			val |=3D USB2_USBCTR_PLL_RST;

nit: According to the checkpatch.pl:
---
WARNING: Missing a blank line after declarations
#30: FILE: drivers/phy/renesas/phy-rcar-gen3-usb2.c:545:
+                       u32 val =3D readl(channel->base + USB2_USBCTR);
+                       val |=3D USB2_USBCTR_PLL_RST;
---

Best regards,
Yoshihiro Shimoda

> +			writel(val, channel->base + USB2_USBCTR);
> +		}
> +	}
> +
>  	if (channel->vbus)
>  		ret =3D regulator_disable(channel->vbus);
>=20
> --
> 2.43.0


