Return-Path: <linux-renesas-soc+bounces-17863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B0ACEC22
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 10:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF8D3AB103
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 08:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471EC20469E;
	Thu,  5 Jun 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XewS9bi/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E471DC07D;
	Thu,  5 Jun 2025 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112923; cv=fail; b=V54CMU6GyY09yopyImA8LHbxmsDChYvLBMWbfSRzp5YXSPYsVaTAVGBhMmCn81xV4J+ZXHfaoAARSZewj7OhGk3Sh8uQmnbMjNi2B3GeUYv/KrMesXNlQXHB0GS0S6LsCuV8nyY2OI5SWu0zwcRKeQQz7bRMmJthyIsYv7KNs2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112923; c=relaxed/simple;
	bh=jagR42o2NPHEN8pYhq6DgBkjY0sCEdDzlEWisVgGxOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C5gb2iVWHirbsBHNLBMR3lGX7/i9Riv+osj5MdAp/hs0JaJr86eIBM7mT2jir9DAJR6CE4roWd34q/EmWyOIOPY2ALSquwv+UikuslItjfrje/s4+OBRbvQctxgiCijzbfZ3r+6hKJFgjQg2kRNj7MmliumnFGWFDeXvuEjFWCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XewS9bi/; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgRk4kVKKfNoCVOKkm9yph64n4vaqiXL0+bYUTXZtcxdE7DdQ3S83oo1cVgvjOQ2A+MMuVIn3BVE/rf75ohaeFn3G2cXZpocPZAKc6Xmt/hPLj0iK66mrVC3w3TZ+Y01Yu+zZomMvKA6AqxLoWsV2zF18qurVjSXrJ/PGIrohEztpBx7XXcX+9v+Vm3uA186PCFZqkijChzIsaIsmhNKMf7acueTIjTMPmWUMSNcHkofFpPP3/NTR3jEElC3RUxY0js8uHJPZwinjCjkz5fY5SnAclFjwGg5iea7dzbM7EISz0j4OiFYVRuhTuLlom1KdOrUAkSnMH5qxpm+FPpkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIb2uhvoCELWtk8S1XC9N+X26vOjEvziJjGucZ4jgu0=;
 b=j3/wWvT7h8v3FnxHxi/eaELDQKgAiftkwdtXd0ad2Zy/sKiSVC/Ae+80L2yIQhbCLY/P+phoH8sUcLZM1d7Prb3ebl7jXEesGAKwIucIz3B7tG2/6ipcOiN/4A3j0LElnLdlCVxmF+sOG9MCp90AelN8p4btaUsuAk6w7m7xGHMnvnWOwNXm2YOLnpm3qvIQxiX284ZYNAyCJaYyM/mLaxR3NRrb8F1iOk8KekiktMFHcidPHCMJYjNdfUZvzzGZsdVW7JCNI6m0G9iZ+L+6M8MWRFH9xHq5zF8bB+WxoZ0/hMx5Zdo+BUBajAj3xmi5nwk3tG3mvUcyw0ehIYhwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIb2uhvoCELWtk8S1XC9N+X26vOjEvziJjGucZ4jgu0=;
 b=XewS9bi/wpBF5GTJurS/2u1k5+8fJlWtgm8MClmDWiL8db8qFdcjFoL8bmArx6D1fq/ZLuwePSk/PaW3UIGG7K7W7/Q3Gh49f54imy1IVMe4rtIKEGRaShQYNy4noa7sSqeOS2IGaceHfXTKx0MyQ0TViwI649axtJlAeSaFSvE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10173.jpnprd01.prod.outlook.com (2603:1096:400:1da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:41:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 08:41:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH 1/4] clk: renesas: r9a09g047: Add clock and reset signals
 for the GBETH IPs
Thread-Topic: [PATCH 1/4] clk: renesas: r9a09g047: Add clock and reset signals
 for the GBETH IPs
Thread-Index: AQHb1R0+KvxYoXNmw0Cw72mERG8BR7P0QOvw
Date: Thu, 5 Jun 2025 08:41:56 +0000
Message-ID:
 <TY3PR01MB11346E2AA632FD1EF08051BF7866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
 <20250604065200.163778-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250604065200.163778-2-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10173:EE_
x-ms-office365-filtering-correlation-id: 4182e484-1881-4a38-9bf4-08dda40cd44d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8vKYfVfcLD/YmdjaK9J1WjB9ppbdgWCfMkYbyt1eRDgF+dAJuf2g+GtHuPAo?=
 =?us-ascii?Q?Trxdi2zsURGZVhIXZx6CJYyn25C7JdL7EiIFVJMVL0azoEkSgFJjJaxDV3xj?=
 =?us-ascii?Q?5GGbpUic/dSOihKl9KkgJ7L1fQ/cl6HYgoqdJRzMQFS1yxiBeG+CylTsW0Pa?=
 =?us-ascii?Q?rsQ7v59MebzXt9XC723VF2ZdajmH9ynuRUzdNvYi3/fZYFCkyFBQRQDmO5za?=
 =?us-ascii?Q?cjr7BqkGMLGYN1CR0WdNO2uFfFZmNF1dKjYb5irBQS3GhDsnqlufjckQ4eZd?=
 =?us-ascii?Q?iQAkBNJwVD3NY6swNZ2Yh2c0pHZ/Oj8LB4IRcrHkx873T3N6T6v5fUnFG1JA?=
 =?us-ascii?Q?pBGxnVptsLYI+kcSVghoOUJ8kz+CY2M6xe7oxEjUoha620qw3nL9Jn5XV+uZ?=
 =?us-ascii?Q?iHTjuOeBfNiMXlGhSzc78HRrgTolqZkG8+gsOiuEBHe2v9xBSwip3oD15BXQ?=
 =?us-ascii?Q?ew+ZFUbaYpjQLcIvsW3mNOHeW++SuglWni8Shw5Z2qo3TLrFSpG1Z4cvLeuW?=
 =?us-ascii?Q?tGp1EVSwkqlfAeUcTRS9576vS7BxNTrlFggcaKYIrdzlWhuPQto0TiG1eTHk?=
 =?us-ascii?Q?vSOOjDJADJU6e1Wm2r2DPOnRR0y1ImC37StGavh0Ta/j8WF3fdges7XXICJb?=
 =?us-ascii?Q?m+JWoy8eAoHZc6rTpJlkMJHvZHSboce7fnv+D1anffxFF061jmos5aA/bc2L?=
 =?us-ascii?Q?PcaJk2iaKMJu7ZbF18aPMVAFUYFl5M8X/DgVDd8dx5rOUU96bUyd5WF5j2xa?=
 =?us-ascii?Q?zwUY4EyQ65fOIJaeCdSeOWhyIKFg7XmMhajuYP0Bg42/guqSinx/EbdotFEU?=
 =?us-ascii?Q?DRHGf+r+3W88oJbIkwbFg7WAGnNHsRFGW/HreDIOGkQE4ib8mu7ZbJ/t1uBk?=
 =?us-ascii?Q?K1qFcrhjkcfvzV/5ERuDh+Zkegt+qFupeueRWiNj5QWLZOFYqlW63TGqlKZ8?=
 =?us-ascii?Q?4uETiTEp4OscXQFAHX1YsDX/wJrlYMA77cOMqbjGPeTP3XTK3w3RXJTfw3Ia?=
 =?us-ascii?Q?gXNRQ2CNuSkV/HUh/KcIgmyOe92Fkoy6fCI5hw+C8c7dU7Ly6xJRl6Ix10wC?=
 =?us-ascii?Q?tX4ulngOqFrRmHA3QoEKlW1oTWX3tOvMbhOPbr1at1N28GGRUy3ocXEDzHud?=
 =?us-ascii?Q?kFWuLIS1geH1rf35Aim1fFWRKQWaBasI5oJaUsKRokZU6/yLg/zO2S/Mh4ZJ?=
 =?us-ascii?Q?4N2rbE34v1GUorUR5KImOMxDcCO/qspYZ9yt5I5KqLsAziceGXY4lscI4a3z?=
 =?us-ascii?Q?BxLbCWSpVBwJlgLEhz1AbnTnkrczwZEAPfYBk+WJZLugqGmLnkqglwBdnnqR?=
 =?us-ascii?Q?IpXabh7B/eR34bWwGc1ejztS/mwJweNu7bflmDoNy6YG4BLx5xrreF+9gqlN?=
 =?us-ascii?Q?JjUsJ9TH7pKcUuedK2VTL7GPcz9ZOu+i2oFBq7OIHgQZZEwjQ2Z+sEwI3GoV?=
 =?us-ascii?Q?ddMP2aOsOj1jqn4Uq9yxzasJUqLeaVC7RQ0T0a8xhhbuDpfMaHOzbHiHObY+?=
 =?us-ascii?Q?RsZ2RWZM/ZOfnGU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?k9r9MGC84oMCZVpHtNttz57VKta3VtE60nTIC/hZOEtBKa4B56YzhVYoKe/P?=
 =?us-ascii?Q?NNFOJnJs9i611FLCpOE+6tIzZglIwOZtbiZkJJr5VfauToqUdibhRXUV60qO?=
 =?us-ascii?Q?EXoNvkzWYcnfIaMBBVTNRBGJeHkbXeYkn523OtzzbQUsXLewdW8UZtggE70Y?=
 =?us-ascii?Q?17RhipXxSYh/v/AI2/Cw28534S8CjvaNU6suR26VzFYRfoy+0s7MXRqZxaQU?=
 =?us-ascii?Q?uW9aULcxUki6tDhXwvvRhlvn1IK47Y473AIBoZEyh8twKR93t62J8O76dYMJ?=
 =?us-ascii?Q?Y5ayExFUQz4eAdu26PaeqEVSlhujQPwRw2mmUc0W3nU3tBht/eXp322IRI9C?=
 =?us-ascii?Q?/2WLkbE5/VBrbfckDBMOqp1tBFUGV04Dal+DzZmfipAkUJwKNnll8WezsGQv?=
 =?us-ascii?Q?Hv8dwYSNtbu7RGFhyBLnsLBVkImou/ZMLyTPQhICFJWvoly9Gs7f5Sy0uvK+?=
 =?us-ascii?Q?AEBA/uQSHGHIWymtas1UcMFACySfvIWJLMKxljdR5MEXMIM76Mh0FIjrDg2x?=
 =?us-ascii?Q?1Y8xeZ3JXvL7gJZWMoHiLFFPr/WSIzm4NPhvs6kyCJVHKMhBJEkIeq+7libT?=
 =?us-ascii?Q?qiyjOaK8wbloliAltNn2hhosRsfzCMWaTnIzU6KOqMGuPsiLWJNC/EBjkFEV?=
 =?us-ascii?Q?wqFDRS7E4nNKNaAnYMR63WxH8gNdOr7BxhPgdNdKfQpj+38zQn/3AjPDI5Ew?=
 =?us-ascii?Q?voh44mYslzrdLah13v4Jv6LfjEgUSQGstAY17HcJjVYTojPXod7D/6m/Id9T?=
 =?us-ascii?Q?ZX/HUioqStkwXTa9YK8OH26iFkg0QhYUigzEtVBPpnWWnF9XzZj2GQJOyDtT?=
 =?us-ascii?Q?6EITxvkJyP35HWHrtLeKtSpDMa8WT/ZXHG0QvEhRugUbvDCji/hGJ6iBWHrV?=
 =?us-ascii?Q?iiVYOUxF5ETC+4ByNrE/OAamxBt9inthoO49ZJ5YofiS08oW6Lz3lOZ7cuYJ?=
 =?us-ascii?Q?BrGYt6PjZrIDrYGRKZAO/6hQM3nYjffiCW+NNomejo1urgewt5CfxRi5CJLa?=
 =?us-ascii?Q?VcFexBLs3BFxTV42zAmuK1AhWEhkY3QJUnvokgCjbtHNXpSTN/iv/ccdD6La?=
 =?us-ascii?Q?glfBD/h+iG/waseREUw/SvmQo470/qjcz3d25nQY9jIhWAb4H8eu6lwsM1vO?=
 =?us-ascii?Q?gzTVeOwwAOgNzvkrGbHtN+20s58REXrF+43VOjiVqx7J4jzxxwUKoTTo4+wg?=
 =?us-ascii?Q?gERrQk14/IIB87ZUHaxHEyV3CF/8axEkGFdVf15M5/5nuhTb4XIm3EgQckQx?=
 =?us-ascii?Q?C0Zom+1gmHLHkDT/YZ4+jprRi0+yJbFd04FkGIYHfo3oqbDeCLwn4NKQePk6?=
 =?us-ascii?Q?n1kZqquegHHiVYkcDT3Ar9YcgIzuYAhv/b/+GIlyAUpJvPpstJnYOZNBU6+N?=
 =?us-ascii?Q?2QmPd3PlErAlXb3DEYkUaMB8vdPZDBXVYyEv0XwxkaguTi33aA0o7KzY4LVx?=
 =?us-ascii?Q?BB7kH8A1AqZhUD2m/a0GPQ1Z/KzlPbnwFr92PvHCTpozKbbSBFdpNAFr3KiD?=
 =?us-ascii?Q?HNmGAeyfot6xNUIexb8yzU+H5U7bAsfxo0OvobZ/YNCzf+rmXZxSkgPMlJNI?=
 =?us-ascii?Q?meiDJlLejWOC2xhd5D0s5PNltQqyN9vUsvWvZdGX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4182e484-1881-4a38-9bf4-08dda40cd44d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 08:41:56.4659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkfuqP/O6VdjFABqN9+fuDS6S62Fqr/2Bbc/JzRNeHDtH6mpZXwOHHqAfyol59S56VeqtS9rPoaPEbI9FWTJtfUUXcFik+el8oIqsxOhCqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10173

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 04 June 2025 07:52
> Subject: [PATCH 1/4] clk: renesas: r9a09g047: Add clock and reset signals=
 for the GBETH IPs
>=20
> Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-=
1) IPs found on the RZ/G3E
> SoC. This includes various PLLs, dividers, and mux clocks needed by these=
 two GBETH IPs.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
biju

> ---
>  drivers/clk/renesas/r9a09g047-cpg.c | 64 +++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9=
a09g047-cpg.c
> index 21699999cedd..21352beed3a6 100644
> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -29,6 +29,7 @@ enum clk_ids {
>  	CLK_PLLDTY,
>  	CLK_PLLCA55,
>  	CLK_PLLVDO,
> +	CLK_PLLETH,
>=20
>  	/* Internal Core Clocks */
>  	CLK_PLLCM33_DIV3,
> @@ -46,6 +47,15 @@ enum clk_ids {
>  	CLK_PLLDTY_ACPU,
>  	CLK_PLLDTY_ACPU_DIV2,
>  	CLK_PLLDTY_ACPU_DIV4,
> +	CLK_PLLDTY_DIV8,
> +	CLK_PLLETH_DIV_250_FIX,
> +	CLK_PLLETH_DIV_125_FIX,
> +	CLK_CSDIV_PLLETH_GBE0,
> +	CLK_CSDIV_PLLETH_GBE1,
> +	CLK_SMUX2_GBE0_TXCLK,
> +	CLK_SMUX2_GBE0_RXCLK,
> +	CLK_SMUX2_GBE1_TXCLK,
> +	CLK_SMUX2_GBE1_RXCLK,
>  	CLK_PLLDTY_DIV16,
>  	CLK_PLLVDO_CRU0,
>  	CLK_PLLVDO_GPU,
> @@ -85,7 +95,18 @@ static const struct clk_div_table dtable_2_64[] =3D {
>  	{0, 0},
>  };
>=20
> +static const struct clk_div_table dtable_2_100[] =3D {
> +	{0, 2},
> +	{1, 10},
> +	{2, 100},
> +	{0, 0},
> +};
> +
>  /* Mux clock tables */
> +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0",
> +"et0_rxc_rx_clk" }; static const char * const smux2_gbe0_txclk[] =3D {
> +".plleth_gbe0", "et0_txc_tx_clk" }; static const char * const
> +smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "et1-rxc-rx_clk" }; static cons=
t
> +char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "et1-txc-tx_clk" }=
;
>  static const char * const smux2_xspi_clk0[] =3D { ".pllcm33_div3", ".pll=
cm33_div4" };  static const
> char * const smux2_xspi_clk1[] =3D { ".smux2_xspi_clk0", ".pllcm33_div5" =
};
>=20
> @@ -100,6 +121,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[=
] __initconst =3D {
>  	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
>  	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
>  	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
> +	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
>  	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
>=20
>  	/* Internal Core Clocks */
> @@ -122,6 +144,18 @@ static const struct cpg_core_clk r9a09g047_core_clks=
[] __initconst =3D {
>  	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, d=
table_2_64),
>  	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1=
, 2),
>  	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1=
, 4),
> +	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
> +
> +	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
> +	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250=
_FIX, 1, 2),
> +	DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0, CLK_PLLETH_DIV_250_FIX=
,
> +		  CSDIV0_DIVCTL0, dtable_2_100),
> +	DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1, CLK_PLLETH_DIV_250_FIX=
,
> +		  CSDIV0_DIVCTL1, dtable_2_100),
> +	DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux=
2_gbe0_txclk),
> +	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux=
2_gbe0_rxclk),
> +	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux=
2_gbe1_txclk),
> +	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1,
> +smux2_gbe1_rxclk),
>  	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
>=20
>  	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, d=
table_2_4), @@ -139,6
> +173,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initc=
onst =3D {
>  		 CDDIV1_DIVCTL3, dtable_1_8),
>  	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, =
1, 1),
>  	DEF_FIXED("spi_clk_spi", R9A09G047_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2)=
,
> +	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G047_GBETH_0_CLK_PTP_REF_I,
> +		  CLK_PLLETH_DIV_125_FIX, 1, 1),
> +	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
> +		  CLK_PLLETH_DIV_125_FIX, 1, 1),
>  };
>=20
>  static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst =3D {=
 @@ -214,6 +252,30 @@ static
> const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst =3D {
>  						BUS_MSTOP(8, BIT(4))),
>  	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
>  						BUS_MSTOP(8, BIT(4))),
> +	DEF_MOD("gbeth_0_clk_tx_i",		CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_0_clk_rx_i",		CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_0_clk_tx_180_i",		CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_0_clk_rx_180_i",		CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_0_aclk_csr_i",		CLK_PLLDTY_DIV8, 11, 12, 5, 28,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_0_aclk_i",		CLK_PLLDTY_DIV8, 11, 13, 5, 29,
> +						BUS_MSTOP(8, BIT(5))),
> +	DEF_MOD("gbeth_1_clk_tx_i",		CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
> +						BUS_MSTOP(8, BIT(6))),
> +	DEF_MOD("gbeth_1_clk_rx_i",		CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
> +						BUS_MSTOP(8, BIT(6))),
> +	DEF_MOD("gbeth_1_clk_tx_180_i", 	CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
> +						BUS_MSTOP(8, BIT(6))),
> +	DEF_MOD("gbeth_1_clk_rx_180_i",		CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
> +						BUS_MSTOP(8, BIT(6))),
> +	DEF_MOD("gbeth_1_aclk_csr_i",		CLK_PLLDTY_DIV8, 12, 2, 6, 2,
> +						BUS_MSTOP(8, BIT(6))),
> +	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
> +						BUS_MSTOP(8, BIT(6))),
>  	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
>  						BUS_MSTOP(9, BIT(4))),
>  	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
> @@ -255,6 +317,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __=
initconst =3D {
>  	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
>  	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
>  	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
> +	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
> +	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
>  	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
>  	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
>  	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
> --
> 2.25.1


