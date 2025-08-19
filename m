Return-Path: <linux-renesas-soc+bounces-20671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6660B2B8F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43485280A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 05:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951AC221FA0;
	Tue, 19 Aug 2025 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Kg12po8/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286F19F135;
	Tue, 19 Aug 2025 05:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582579; cv=fail; b=fPA7YBiPAwqCPu/5MWPBXOk8wtm4ClHo43/hQC3r1A33LWkIddiWKO+QN2ENGHzA0mxl9sBnGKSw1h96oJLx727I3pLjLDhPBa89E6q/L14rUFz8ti8LVZdk6C9RdVF6qU4CpZlZxGfKO4bv4XDOQR3ydPEv3lNzmsLGg/MSMME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582579; c=relaxed/simple;
	bh=E+xA1JivWGO1GLdRQ4aA7NZKfRGfECs0C44lVU4VVJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XAYUOT3MERKBZrKQAa9wpryf+i9gFKEyEAdsH7vOc86mknXq9/GMBQHiMQFTvN8hk1NEA2bLJ520G8Ob1rtCemqJW83CWX84RXOTc3Hvd8d3NHZM2E+kmjtkd8OyE7Drnp0L9bGedqgQLaY2Rcdtzjy70r8SIJ2tpKRRPrSWqlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Kg12po8/; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdRVGvCfChiuenOF2ahiRu4k4w0EprbWSEdl//758qRCa4e5EdKvdZL3vgOTg93NmhFrsiCZaknT1oJgDZ/a9o8HnWsJvKkTB2XRRGuTb6sHy9DFk0UWaFB/Rk0hj0aPcJBkeWK1ETg7UNqBu917HRAgvAFo2mRF3QJERD9aFNzMQG47wCypY6zbNy7g3Wors+oMm/GA/USRoboNzAKxWogCvOY147aHGM2tLQUtJoq2FeMHYPD4KRETW1NQE2QKYr1kMJr1B5sOU7WPar+XlzanAckNOrzdxbh7w5QQbpjel5G/+mCGTVs472SFU5+dbTE8pyCPzHN6fxppzJpUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFq6pkG4sSCcUvxmY8yVUQW6i7Yu13Cn7sHjv2k1vgQ=;
 b=N/7bmu1uk3z32q8TIB0ExJIwSO+lJ8BJFPIDviNGgMKKmYhoL4dBDfB2BDCsCtBUKfZHzpKYLedlzm6QNvGxyOUlY3EOap6P4zcbXXZuHtlHow98Vnz1Aj2wug47PP+x6+UT9qeTOfKnFXVrbY3rmQis4fzOn9GgYXzTQOYOYWrDUxMpiHlPMMN683Gnd1ccC3hWFnokMzYS42efI4GLEKmrW597EmhdTgPduuHH4IMjwT2lD2M/TGBO5w38uTgLUdJZgX0AVyDLyCV4AGrnwZuT8xOp6EMVzGhTqZsHh8Dgq8gv7yQZHhnJoZ8Nw8jPmCtcvt4SX7w/Nya7PrVW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFq6pkG4sSCcUvxmY8yVUQW6i7Yu13Cn7sHjv2k1vgQ=;
 b=Kg12po8/0EGlnqemPP0lLgdwuHC+amznIUO5mZ1bwCVbWQDhpLCeB38JjEubv1UNesr28/WXprTd3uau/Wj0hDZdpkU3ue1FlIi3Ak8DnSdOoF6C5KMAw72p0Bi7HZJwoPzQwa84nvXLQVL+QALgaeD01PpI36+pJng0Uf+tYdM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14998.jpnprd01.prod.outlook.com (2603:1096:604:3ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 05:49:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 05:49:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
Thread-Topic: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
Thread-Index: AQHcEMwKkF0KDbGXOUaBwniJyvjIFbRpd2yA
Date: Tue, 19 Aug 2025 05:49:32 +0000
Message-ID:
 <TY3PR01MB1134647BC6436CA61E0A200F98630A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250819054212.486426-3-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14998:EE_
x-ms-office365-filtering-correlation-id: 77016d4a-df36-4d00-6b28-08dddee42bb3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pbN3bEDcEFGNqSscneYdHWVvDER9OYjJcO41YPyNYRklqtZZD00g+Bpbj1Wn?=
 =?us-ascii?Q?OKLpCn3dA04NUjCnT8MOBp27RyOZt02rV8/14jKsU63rhC3WRRDr/w2e9SPO?=
 =?us-ascii?Q?P/bHFl06S5nsvdm3x10m6pdRjkNcdFytE+hB60RGLEzsCZ97d4EX0R30P0R9?=
 =?us-ascii?Q?lA/U8IPstywThycfEUpbOQDuDgX6QqlAs9gnu54cdpoUYbF7gr+vnmyLDrfq?=
 =?us-ascii?Q?d6v43pUMSrfbbVDJ9RP3619aChB3gCmdEuOhx+dhuTFEflqXbr3c0CjT+LTO?=
 =?us-ascii?Q?Z5tvuSZ+SXr/spk8pnQ6RchSxYGwbgy5448E5sIZyKf8O8nj5d70LPObg2fg?=
 =?us-ascii?Q?cBujCs0aWqO4NChS/Z9a0rTPITcoF4k9ForrsO8130aN7W74l220L42XWM2z?=
 =?us-ascii?Q?Ho9SioCus6KRVDOi5tRj/09VXdMygv8SHLjXN+Bq4FAEhAFrxbsG99FrPgSb?=
 =?us-ascii?Q?n54ncXj2ILFl6T1odUvmuuNm24VLeAZFAwLRTXy2Gf8WE9FuMgDQn5wZA3g6?=
 =?us-ascii?Q?8t7Rw5/pvNOGsDMBrTcZ7jHfTgMLIQVYQyRdIrRiyuJt+7D/kjobpbLlh5b1?=
 =?us-ascii?Q?sIyN2ARqteSVi/CE5mEF8wE52I9kLyG4KCqhfwQwJ7dPwkTuRDz0SQD0LCbz?=
 =?us-ascii?Q?DUM5jddxKfDnp8ZkI3MqNFJVlGs7FSV+mAWT1jxwvDc2UKudxBp8eij7sSif?=
 =?us-ascii?Q?EYRR/uXmCZhboZmueNwBg7W89V/dtA9hqi4MXOygVlGUHg+AQUhNvWnwrBgv?=
 =?us-ascii?Q?PkjJAezg8dAehejgtWAxjO1keCnqF+3jXygjzYy6qZ71y2f9GluegoGxSXR3?=
 =?us-ascii?Q?BB2PAk4BlSKE+mXux8tB07m9xRsLo0tC2h34o9F01Ngy7FwkuOj3lvw2bW5g?=
 =?us-ascii?Q?ozJjxi3lbxpB1OEWVpRqxJi26d+gNOhE+6FqbnSWiROQpSa08xIlwHAekvDB?=
 =?us-ascii?Q?t74xDVUGqDA5ob1bgdbOl2neqhKH+rMeQk2DtTUhfDhWeTmQYwVk4oyW+F8g?=
 =?us-ascii?Q?AL8ZEwg/fV7emW2lOa0DasYy5gu0GaBs5dEBkk+TQ3s+1s7jUatPdKr+6Jn2?=
 =?us-ascii?Q?ZBaP7RufXlTzWGDo++HWjUUD4yZnkDS2LjVbOdEE9YyEfq25JOBpH+6HetKB?=
 =?us-ascii?Q?zNjUn2qCl1RWmLe4XJlV4UTVzDDom9n7OZ/zHU0sQsYn49GVJ7w8gu32/QEZ?=
 =?us-ascii?Q?ASu8DUd6qsBC+R8dvsJQ6O5Fit8ugtz4OWZ9Eg7RpB77daB/CymchPBEjzj3?=
 =?us-ascii?Q?hMEifeMzGEcNt4YzLl6rLgCz+ZVuZUaZ/fXn7OPmorXaCOTGX9BjdH8XGQ9g?=
 =?us-ascii?Q?ghis0W1boiQgqMenRw+4FFluFpu8EMOi1sat9uWH8PZKGrkzGAjHKLe3IMto?=
 =?us-ascii?Q?2IsC0HNqqXZ6CS+FQAAT6rUeZKXnzjyuZkLkRVxCxS7F4wISWXJ9pPG4hY1O?=
 =?us-ascii?Q?FNsZGMldtUHFtCg1dZvOzUaj/9J9pTx1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ayIjYjS8zgF6t0Xbo55+IXtBsP7uTRyUTfiviFUr3e9qB+KXBUkr+7DNGff4?=
 =?us-ascii?Q?gBHKMshGxZC6joL2B7fziuvaWUDwj9PtiI0kuohbMcPJXMSp9mkpgfWxz2vS?=
 =?us-ascii?Q?dsgPg+y5HkSnm6vK9CY91UB5x+6Hhg8kNSKR/Iyh7Oe/7rT8blv//AoEy3GD?=
 =?us-ascii?Q?iU0WWT8wnV4k4VvjzSniJN0hIr927sMT7ucXIsTw/xdI+V8j8mi5M7Gvq/zf?=
 =?us-ascii?Q?wVn6KH9DzfXR5JLcaYzhHXjyFa2bFW3M8srI725zqejvbj2r9/lZJB6et8W9?=
 =?us-ascii?Q?PAYjXmwDTjwnfJKkZkIRDS/NYC1a1H/lP7q96axgRljv0fW1gf0TzWGDyKSM?=
 =?us-ascii?Q?70cnq1kkOSrRi+5+CuZW/2G2sS2smrpGHG4BJSO6gZHo3zIQvHTlGoQGwZN0?=
 =?us-ascii?Q?nUVqXbJlQ6G+R7O/zlMUEaZAX04PKwSUbD5y63PZfVznhNrGQir1HDDKd7GX?=
 =?us-ascii?Q?nqTTSdlNdOcOz9I2Woc9C3Lqg22RSSGp5H7iQm8leTHONqjkWtyzdYTyOsUz?=
 =?us-ascii?Q?lcy/hMLOKQg4j5rUXcYCz79nbu7nahB4lkvjGHjGXloagIZ0jJw6td/PCqsg?=
 =?us-ascii?Q?2DjvU9M1FR9xeytyGDAPrcbn92mkPjAI7MfDzlMUBbXdQwOddn6W/DFuXuEI?=
 =?us-ascii?Q?x71dNn39GEFpOXTsZwkk7E/TeKcuQXNc5Qz/Dj43oIo975jjQd+70YRxwuFs?=
 =?us-ascii?Q?CIx5zfVEmtcrbEjLfETJdTTR+xPTQeKR/0PdIkCTpCgC2CDMEUN6IXu6XMyV?=
 =?us-ascii?Q?YMRJx+0gEdRCFHKSsb+Vt2DdnoYgjqVnbuhLibWiPCuwapF2W5CKkTJGFSxN?=
 =?us-ascii?Q?lY4+ma1REMqb92a8AUcHJrfrjv8tkrE3JFDJqnnGlTETeJgBYoTXFRtC2TOf?=
 =?us-ascii?Q?yXvpvoSJ4LTZeWbaQlUtVl3KQm9f0Feno7l/21XhM4Ky4WhLScNBwUzVTr0k?=
 =?us-ascii?Q?luKQcyCjqYcyBnCNGifhg/YMlUJc9DiXGqWPWx3zpSaJOFq/KsdZ8wcV4tyy?=
 =?us-ascii?Q?U9oPE/CYAB2/gVxD9YzG90N/Pa0ZMey47g6QnDvK3WbPMoL8aSZT82JIhRHQ?=
 =?us-ascii?Q?uGWpCDmDCv5IkxA258iFbT25u5ahWknqx4IV4An8LX/tIxITsEmYKv41xP7r?=
 =?us-ascii?Q?wJ9H36lUCt/1OBU6ORZw93nhyZOkrbCiUs8x6DrIHzDcoGXKhgPOj5l1tWf0?=
 =?us-ascii?Q?/K6HJCjLnPQAb3pPE3z05P3Z+Hr/3DNPVNsQ18iDTJhzyjP1tyNydcduEOV2?=
 =?us-ascii?Q?Br42ZyUS5TgFNgYkMlWqLXxU3LIKjfDOs+PQCvLKuYaCorHpzEt4w3kj2G2Y?=
 =?us-ascii?Q?qiFp+m09d6AdW+awe+XHJdGLv4QbKPUgql5X4/5DIy8JpfRLQTQPClMSpo8A?=
 =?us-ascii?Q?UJLJ62gieMZx2MhmaMP3SJEwj1EdXxJ+rDZiV091EoCxgJZCRCdDOtQpXgRK?=
 =?us-ascii?Q?I9R5bvp8VJRHrwSj+jseGusHCdToThmUUso5plS0A21tLdHWNpp9Tf4wfO3T?=
 =?us-ascii?Q?RS3jS295qEsFir79DmVg6ohFb6PBfwZ6ulb0lmmktTxfyskjJzrztrFaUSSP?=
 =?us-ascii?Q?JDg9j3468XXCPAdKuuO8bZ7wFKYlmHYrl5DZHWBOuqQhfv0McgMKw0VxHs1T?=
 =?us-ascii?Q?jg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77016d4a-df36-4d00-6b28-08dddee42bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 05:49:32.3525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvHvthHK5pYqqfGLe+HQJDeJe77mdhq6zjGzDLD22fAr0ePmJqYl107LOxPrnqZz85n5Hg67mXSr3STJyH/so+4Gaix+Ksynn3j+tB7e1Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14998

Hi Claudiu, Christophe,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 19 August 2025 06:42
> Subject: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error handli=
ng path in
> rcar_gen3_phy_usb2_probe()
>=20
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>=20
> If an error occurs after the reset_control_deassert(),
> reset_control_assert() must be called, as already done in the remove func=
tion.
>=20
> Use devm_add_action_or_reset() to add the missing call and simplify the
> .remove() function accordingly.
>=20
> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initia=
lize the bus")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [claudiu.beznea: removed "struct reset_control *rstc =3D data;" from  rca=
r_gen3_reset_assert()]
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v5:
> - none
>=20
> Changes in v4:
> - none
>=20
> Changes in v3:
> - collected tags
>=20
> Changes in v2:
> - none; this patch is new; re-spinned the Christophe's work at
>=20
> https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR=
01MB11332.jpnprd01.prod.outloo
> k.com/
>=20
>=20
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 47beb94cd424..d61c171d454f 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -699,6 +699,11 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct=
 device_node *np)
>  	return candidate;
>  }
>=20
> +static void rcar_gen3_reset_assert(void *data) {
> +	reset_control_assert(data);
> +}
> +
>  static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)  =
{
>  	struct device *dev =3D channel->dev;
> @@ -717,6 +722,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_g=
en3_chan *channel)
>  	if (ret)
>  		goto rpm_put;
>=20
> +	ret =3D devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
> +				       channel->rstc);

Now 'rstc' can be removed from struct rcar_gen3_chan and use the local rstc=
 pointer
as context variable here.

Cheers,
Biju

> +	if (ret)
> +		goto rpm_put;
> +
>  	val =3D readl(channel->base + USB2_AHB_BUS_CTR);
>  	val &=3D ~USB2_AHB_BUS_CTR_MBL_MASK;
>  	val |=3D USB2_AHB_BUS_CTR_MBL_INCR4;
> @@ -860,7 +870,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform=
_device *pdev)
>  	if (channel->is_otg_channel)
>  		device_remove_file(&pdev->dev, &dev_attr_role);
>=20
> -	reset_control_assert(channel->rstc);
>  	pm_runtime_disable(&pdev->dev);
>  };
>=20
> --
> 2.43.0


