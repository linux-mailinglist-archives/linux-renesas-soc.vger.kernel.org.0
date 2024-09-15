Return-Path: <linux-renesas-soc+bounces-8966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525197977F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Sep 2024 17:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8990D1C20E35
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Sep 2024 15:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066BB1C9DC9;
	Sun, 15 Sep 2024 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="reucKC6o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C61C6F72;
	Sun, 15 Sep 2024 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726413807; cv=fail; b=ogzPu4Yjzbw7yHiC0GXm1qOBWp2ZZZQtEWWx5L9+izqG/9GTiEznFJscg+i1mcOynOfcaKH+D/gVhW+2S8Ph8I9JmHEltOCyWNmdjUNTWRS5XjAdLYJxv3OnW2FiQSeRFoIDQJQUnhvj1J+hA0QTK03ax7quTCijpNKQ0staskk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726413807; c=relaxed/simple;
	bh=yhTQCOZFus50tpVS5Kbx84aE+Gawxj1sd/j4pYlDKIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oc6WyjHQQj2oFDJ+5SRcoad1o24xfngEwJGWzOWbaJBbMPP8x5tgYOBApIwAxJTh+k30q8Hlx8HGQo/ZO7gpPVbHSYiVJSHqyuh/M41amTqrlUUiNdM/hJIjPrlXBAoiSJmfHh4MT6SDI2XqtibanM6GqF70C2kgUISzGm50y0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=reucKC6o; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InOZaY7WqGfi+Yid2z9RhgbQoZ6dah5qKrA4eNFMaxgPnfiKt/1csQkvVNNOmSwdvfJxCQbB6SkaquVvSirJdd4FjSbA0QmombNL0g+gHWz+aGUrC4Z0Mj7BRv2UiNt+nrZMzupTsJB1wv3STw8BrEYHsL9OjiYX0We2ROhdemKJrsJ9B+LoxGbEEi7h9UzftaVNaeWuwtEppy3onNyMgRY8vmeUeXsVJb32xdpBMg3B9JcFiIU2b2mrd7rqEs6rSNPSJBZ0/xmuRnk7AzntYmrX5NezjvIm8pl5njARXdZ5ODW7TA/4BX6NQfA1dkQfwNGJvIaFVJsBXJFwzL4C7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pykqabakN+32JBK0RzCGgjH+ppZmHmOcZJQeieCBiAQ=;
 b=Q5I3kvzd9ISoKpmHH1gUKi+dnX5ZLe955koo6gbVdv99cMpmNL7zX7x/phoKwqvg7+9gvfqoSO/Pfl6BipSNFAefdWNuy44SEC58cCsF2RQgToZ41nCkeka/YKlc9dLwg/aSriRxQ310uduVluk98UbRCRbhHijbKPD+CZnFX8JaL6RnzAhMb5Dd0ox1wjnuDxBYoyj2kQNLst03SLi84TqTn9ooeJ+Iaq2UqrXeOqK6Z/jOg4PHekPw/JQLDGcvCMc8EFgg3GHKWI1oYJ06AnEWdcJ6oX3+KAEzrHxc8CSiUrK8brqar7kDHcUAiDrWYJng2BpuFBtJnB2ADc9Lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pykqabakN+32JBK0RzCGgjH+ppZmHmOcZJQeieCBiAQ=;
 b=reucKC6o4w/uHFsRaR82vFtcS5MdlS6E7nxpoHf6y8bwurOcujohqfj9xkQqvtMq2Tc3iR8nBnvis+YbZu9QuUnnnUAbWSNBO/GBN9iZlTVVcPNaFZWURt5jffxt2Gs6zfxIC7AVIWzT8uU1nAuJbZr6qePqoJm/O3SUeji3WUo=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB12384.jpnprd01.prod.outlook.com (2603:1096:405:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sun, 15 Sep
 2024 15:23:20 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 15:23:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: RE: [PATCH v4] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
Thread-Topic: [PATCH v4] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
Thread-Index: AQHbBsfz128caUDzj0SIVSM3vZqq2bJY96uA
Date: Sun, 15 Sep 2024 15:23:13 +0000
Message-ID:
 <TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <1457c401e3cdf792c5170f5c703cb24de137c19a.1726333335.git.christophe.jaillet@wanadoo.fr>
In-Reply-To:
 <1457c401e3cdf792c5170f5c703cb24de137c19a.1726333335.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB12384:EE_
x-ms-office365-filtering-correlation-id: 2e82242a-7188-4891-ae31-08dcd59a50d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Wn2qUDAW3CnNQtqWVimva1PqOsy71Khhjmvi7qcQecn53mSMZoQW3gh56Dvm?=
 =?us-ascii?Q?iwSXZ1lG7rbs+dEFH4evjpNCnCQMvCg8yScsoRNqoR9F3HuawRKYUbRqVTEu?=
 =?us-ascii?Q?DNCZZrlV4FTojMfsOUUmxyX5FkX5Ny2NLU9e+P75fYjbyIf3yKloIrhbiZns?=
 =?us-ascii?Q?KWKfQYUOAUG4VxNnxDAV7pe4CbGF/vStBf0OxyZWIr/316JztNwOYefNjwW7?=
 =?us-ascii?Q?ochumc/LqHDcE+qf/uuqc84WY/Ila+TPiTK603Q3RseReHwmDdAEcPn+kHRD?=
 =?us-ascii?Q?6+CBOFCIcBd6SA94AcrvyyJRgXtu/slG9qPQfwT4HAU1x+IaJoMBVTtVbBlG?=
 =?us-ascii?Q?w6fn1ZhJKk9gWONNNGcjAjToOjSpeNdNM4pq81vVq41TLQWRVdMASfLSiQJ2?=
 =?us-ascii?Q?0vmWPuB8v8VZb1gFfzpkKgFqQ/Ob3FH7pdziLp5lzU7jXEubYVwhthK8/lAm?=
 =?us-ascii?Q?xKqtePu+fXaUNvrftzNxoqYZuDFU6KK0dtZSDtjCOgjQCA4SGLgpMj4ZwIZa?=
 =?us-ascii?Q?q5gG/pQKAMwhOr/SsTiIxFKwLHkVRqkXlpFOKbt4z8A1qFaHAmD/5vIs8Ff5?=
 =?us-ascii?Q?HfsZ+daQsEl5KYEzreQJt+hHiSObTN848l753leOOs4MQYTMuFzk22Ks8a6/?=
 =?us-ascii?Q?LV/6w5IUTOi2GLJSHVyGlBHuaa8L4LZZhXisO8B6yDHFk5W0bL0z6Djc6DxE?=
 =?us-ascii?Q?EjJPPB305fIqKbxwdzBfvNfIX6M0+yTmzJvg2n9M0Ll4X4M+QMmCn+g0kiTS?=
 =?us-ascii?Q?BOQoBS25TnfqtMLj8pmFFuyfvPMHrg6+F2xKbhkISFn3EyD+qGPL82dTikEX?=
 =?us-ascii?Q?hX68Kvzv/ct1BR/uftDygXEBqWziPuClqjBm4llg7ev5WKp0X/T9g4CBrhPJ?=
 =?us-ascii?Q?7oBGlxQT8QahfdEbbwh7Tfe5pb3uj9DXBunCZHuZ/+YCNORZmedQorTsK0Qn?=
 =?us-ascii?Q?gmVaUY8JZQKjPk39oTsoA5nQxPCGLaghSEGBQqkbieOVnO8NWn6KvKBlKEpE?=
 =?us-ascii?Q?eCKVpV0ndBQW0D2Y9jTv1Ztp6X91dy61wBQ44EqPJ8feqGhOxnFu7JsIp+6u?=
 =?us-ascii?Q?Cgg+rWM9Ml3BDkIIok7clKoKrmAA6fo8CxlNqNzRDbRA4Ls749Ucs8M46lXg?=
 =?us-ascii?Q?DZ2WbvE0k1Kgw/5WlUxmb0G1+ULo5XM1urPBpN1Zysxrx/N1aOPeCECAG58C?=
 =?us-ascii?Q?2UYbpKBJyJfv0jOP3YhmZ0M1Gr/jEf8uctf54bepNDHZI13Lz/XNMIqXsAT8?=
 =?us-ascii?Q?W/FA1uc+m3Q7w/uBCIvjfwcVPgh4/uUczH8CwfHTeZSi83wWMgEDzKnqM0+N?=
 =?us-ascii?Q?cz911gNIK/3K1k4WXPkorhv8np+JGF8JXdIRrvTRja10zpMVghSKX5lGkied?=
 =?us-ascii?Q?1gVpzpQDOugI0ovNvri2B69IiYhqBrvWPmIEhqz8wkryQv5EBOP6BVNJqya6?=
 =?us-ascii?Q?wrJwl1LwiLs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rfEbY2oPR1h4GZnzJjGZwrq05itei9zpP45ut4Lw4LMlhV2DKze4cXviDhh0?=
 =?us-ascii?Q?OIa7gB8lh6ALcdErHcw1ALQmuwNwkpu54natQev4SOgc9qgbmMmWyDezd/sW?=
 =?us-ascii?Q?mGSkXTfsUetcqgm/ySIkHcZQjMevVkDBJhUoduF34Ev2tjsVBYXDTBuu0uWv?=
 =?us-ascii?Q?4OjLawT+k5JMwWvOjLO3MB6OiIXSBHziLxd9bnSjEmC+OQQn4ttqzBLBakj0?=
 =?us-ascii?Q?zK+aRTTYDYVOSo8UaUvWJcqxi5bMI/V+amO4CHJRdQeP2ilU8Es9LCpHQWzk?=
 =?us-ascii?Q?BKHMZ/1XnyHwamnKvbVibeEL6IWyoX18KZTH4lewi2/hBn7NpK6Kry9iP+Rc?=
 =?us-ascii?Q?yBhcQIdVtajll05E6RAa3zQssNdYPwj8Y1w3zYmiXh1gD4kSayd9UwTAEp/v?=
 =?us-ascii?Q?tgGew7pHAC7KZqU8J2vb64O4Ll//cXook3CP6FQ9+QxbK3zyY59xfXLi1UTL?=
 =?us-ascii?Q?nVUBtKBLUonlOSGYm1ffQ4fIIieURn+Sz77KAvKCIJfKL+I1T4R8v3YATTYP?=
 =?us-ascii?Q?F4tuF4feS5KQ7TyyCkllNJOiAJNsvW4OPnWuoyQpa2jd0hIyK0o/FTT4OdaZ?=
 =?us-ascii?Q?iMm/Yo3i+eV1zKUGZdHHDiXROhDy+l2sDaQyNKfF9D4bc5Wd75iKRQfM107D?=
 =?us-ascii?Q?JYW/SpAWoIsQWISvxWeHk+RCSMr+svu98Qd69eZ2ZgvAACoNPpgIHCNNx6f9?=
 =?us-ascii?Q?7qaDTPauc3VG1p7WOMkpbgoiNPM612QIEgTOe4xMN7qParzMRM8aauaEln3h?=
 =?us-ascii?Q?q6QdBpHC6Q9fYxuqfRq7CoblowUrEh1CZ5koiSz6NDRytWxVGFsWMBgOYhWR?=
 =?us-ascii?Q?WpMsQ7FiThk08yjHV5H9WBdLzd8sKjoZTrSo3PMcsD4qsJh7U/graN4KN2d5?=
 =?us-ascii?Q?uRfBhzDD08yOmPFA2KlK1zoqnWo6r9YdctJKtJMu9gV2vuOq0QYDUM3OTgj+?=
 =?us-ascii?Q?ArKbmO/16k6/nwuYkQMkjKOYU7Rfbl13SFdLiiYhTFVVM+kjC54yK1ENR7Bu?=
 =?us-ascii?Q?9lU7dwSopWYfPGW4slKa6UDgD81hwkxYO6lgTpGa4l7WEAGlF7d2Y4/pDQVP?=
 =?us-ascii?Q?FZG/OmQhKGlyc4lLWg131v7yhSQJWJmU1X3CKeFwWa1y509eQsRoVGKTQNg3?=
 =?us-ascii?Q?F23lgWjZCVByaQCQdvz+fLbmdsm95U6Pq5V0BAJJAx5RXeJlvDtZwZdywTe7?=
 =?us-ascii?Q?04zAz3aqWXtNeWzApb4MEVrihjnusOfoyaMvA24+qmFoOtdxi48y6ETJL3my?=
 =?us-ascii?Q?IZtfb1XNe2Zi8dYQqTQw+DKLjue64IVTmYu00GTzgAIC+Gp2sEuV3GAiZ+GW?=
 =?us-ascii?Q?4Btv6gfB9IPYqBFiAxbX0asFGhCLLMKwiWs2BkrWZnkMXoWgA35fEdGpWAqy?=
 =?us-ascii?Q?57rjRCuXKOfG5mySK96NoLf9YZgZ4tJpnD9w6O4jOOzJK20vDeQbzVWUxzFx?=
 =?us-ascii?Q?nJ9niIfFUsPNAWNMKZWLdPScNSnWk1QVWqnP5CGPj4XTTGE+2j3yMYe+vJkV?=
 =?us-ascii?Q?1TOQzvSewOubQi3N+p0+Ma3VnufSzVhMYexErMh/P8o9RSwVvQcdUuM4cuGp?=
 =?us-ascii?Q?s6bBEZ6sBCU5wxF0F89fEM7elo24w/gbc1hpPokS?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e82242a-7188-4891-ae31-08dcd59a50d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2024 15:23:13.6918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JobpqxFcMpzrXzrBkbIwghSE0vYalKaNnWo1tiyN4CKtlrj90tudKrPPhcuni5cjTm48bEgSj8tYA8HCbFuKeXPAtaVBqUn/9PEFlliHomQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12384

Hi,

> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Saturday, September 14, 2024 6:03 PM
> Subject: [PATCH v4] phy: renesas: rcar-gen3-usb2: Fix an error handling p=
ath in
> rcar_gen3_phy_usb2_probe()
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
> ---
> This patch changes the order of function calls when releasing the resourc=
es in the .remove function().
> Looks fine to me, but pm_ functions are sometimes tricky.
>=20
> Changes in v4:
>   - Use the error handling path in rcar_gen3_phy_usb2_init_bus()
>=20
> Changes in v3:
>   - Use devm_add_action_or_reset()   [Biju Das]
> v3:
> https://lore.kernel.org/all/290b25827e3f0742808940719455ff0c5cb9d01d.1726=
329925.git.christophe.jaillet
> @wanadoo.fr/
>=20
> Changes in v2: (broken proposal)
>   - Re-use 'error' to simplify the patch   [claudiu beznea]
>   - Update the commit description to explain why it is safe.
> v2:
> https://lore.kernel.org/all/4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725=
717505.git.christophe.jaillet
> @wanadoo.fr/
>=20
> v1:
> https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725=
652654.git.christophe.jaillet
> @wanadoo.fr/
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 58e123305152..f900fe42c311 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -668,6 +668,13 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct=
 device_node *np)
>  	return candidate;
>  }
>=20
> +static void rcar_gen3_reset_assert(void *data) {
> +	struct reset_control *rstc =3D data;

nit:
Maybe since it is void*, you could avoid this assignment and use data inste=
ad??

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> +
> +	reset_control_assert(rstc);
> +}
> +
>  static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)  =
{
>  	struct device *dev =3D channel->dev;
> @@ -686,6 +693,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_g=
en3_chan *channel)
>  	if (ret)
>  		goto rpm_put;
>=20
> +	ret =3D devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
> +				       channel->rstc);
> +	if (ret)
> +		goto rpm_put;
> +
>  	val =3D readl(channel->base + USB2_AHB_BUS_CTR);
>  	val &=3D ~USB2_AHB_BUS_CTR_MBL_MASK;
>  	val |=3D USB2_AHB_BUS_CTR_MBL_INCR4;
> @@ -815,7 +827,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform=
_device *pdev)
>  	if (channel->is_otg_channel)
>  		device_remove_file(&pdev->dev, &dev_attr_role);
>=20
> -	reset_control_assert(channel->rstc);
>  	pm_runtime_disable(&pdev->dev);
>  };
>=20
> --
> 2.46.0


