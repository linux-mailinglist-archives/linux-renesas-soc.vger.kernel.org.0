Return-Path: <linux-renesas-soc+bounces-15105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FFA76041
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 09:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55EBD7A4DFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 07:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C2E1BD9DD;
	Mon, 31 Mar 2025 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SYr0xDMV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3D11C3308;
	Mon, 31 Mar 2025 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406732; cv=fail; b=K1ibpkZcGhpEpczd/MrD0vxeR8Mb0zOfPSPEGtmMfF35Jka9yWuVqLeiogvUpli6Dkm0RU79QgmL1A1eTjGIUtlAgzut2mZeYdBX84WU1wSRxoU786xDBSoZGCxUbQAZ2KOmRwPeeWZnoZoDzCu4u7qaPb4qcOqwxSBgD440HUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406732; c=relaxed/simple;
	bh=tn75gzFL2kzWNQL2WbspV4mZCeu8WeZqeyW5KfypdxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IDKIwAzgqmulkB78G3vE2zFhS0ZQDMeifonPt/zPRyoXnCwRsZG1M3DhTSm/FutLkl6WnDCIh0v65beUCTQ2+iLAFEmeo6hadym9yR1wfhKW4br7HSylipsf9T9qAw/utpxEVcpP0eNP2ZweVp50yTaVDHN7cN0rDZVUcZhSV/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SYr0xDMV; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsuE+Q1tdrcIOMyIU2BN9cAo9sBTKzNNWModoZ9mAT5ZUqdknkGhU7ZwgNzOF77w+lCZgFP1ilU+nGDh8Lh/NXzPM8KCKD00QnYWNLOjhsBvqrE9sjmPSx3IDafsplNq2sbHpk4VzlkOBP8UxXaIkRM7D8OF2xVZRfWoDpYO7RlFQWSRcr/NEf6wHHznRZPG2DtKdAfxY/8pedsDHnAQ+kb71egouOlhSJQqKbRlc7dJquQU69+tVifsHeHK1cBTquqhBqzcca4GZHR+ZXj4skVyawCLkpCdoGUt09h0xughH7G0SPUcg7dIoer1ewHzwWvCBvgpvG3PnGw6qkxkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c/NDrfaKBaSKpulCLS+4glnNohxdXdQVMiPWp4YUrI=;
 b=RFcv4UxcQGDj+OQz9lhQAPOxRJ6Xs9hcXF+DS25vk1Wq/qHIeARJ0/icce9K7KiDIwszhQSW5snSKz79lXDMy2dEy9WmJLOHRlkXFxBxfONpXDsUo0K0G/V3OoS+EK8fxjs91XO0mjZllwZqTpjIkLw26U8vQJeJQqpdXp3A5V99DhHNK/MQuTv7agz4uM16jl1/HUx74uN5kanc2DbzJK5DAMXxzWx1Z9/uJAAMoDvL6JiWaym2QD8yzBSNhd+UjxRsnU4OlkH1bR4oSYWTV2eQ0KGVfb+Y5y0iwxvCmx2VKtUez+UI8Mes0RLzr4yWqPyonryE9RKKG/hXf4+Xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c/NDrfaKBaSKpulCLS+4glnNohxdXdQVMiPWp4YUrI=;
 b=SYr0xDMVu5xGTf+QN7vhsQHiEJS4eJ7M9uLFb0KL78xiR3xdiKs5TGtpLwd2XQGmJ06DTrwbvGwiGAJE7gEzvebwUDZrPQxoVpm28uogOyPxqjhQbhgmMTUTqW372x066zK4ne3YKiQNRxZTnUL6hg40oV2JzjAtISTD+v4DD2U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6896.jpnprd01.prod.outlook.com (2603:1096:400:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Mon, 31 Mar
 2025 07:38:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 07:38:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: disable clocks if registering
 regulator failed
Thread-Topic: [PATCH] mmc: renesas_sdhi: disable clocks if registering
 regulator failed
Thread-Index: AQHbocGym87Hm9Ug/UaYs2Y2lGC5zLOM3C5g
Date: Mon, 31 Mar 2025 07:38:46 +0000
Message-ID:
 <TY3PR01MB113466CA742BEA3F9725F4D1086AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6896:EE_
x-ms-office365-filtering-correlation-id: 9d5a513d-a72e-4f88-58f3-08dd70271213
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MEJI4NzkVn5/XFZwodVY4l+uapxkhT4W/X8CH40ogQ/d34l9qZ58ozUs2059?=
 =?us-ascii?Q?bzUJKtZl+csw4CMeMQmqoUm7lxmZENUaH24zTpxszzm+OW14xIrWWJzRHWK0?=
 =?us-ascii?Q?qj569bhcuy3sgEAV+LetiPjCY1kmFa2zWQMpV9JWh2SqBHjcDl+++7tnETFf?=
 =?us-ascii?Q?BWsBZUDeXoeYbshmvBAJrWKzuOkhyCJ+MT84yMYCHNMxdaBvc25nJr5Rmq31?=
 =?us-ascii?Q?JQEav81yaFwauHGc5IaBg+K/vcCRD37j+z/u1/19Q9lCc6Oj/DPo6ihYCMVx?=
 =?us-ascii?Q?b5yQouTq/XBit7e+EPeYTB3NEgsVx0LvAPPj6dRiK1IFr7lo5OEGAnJxBL1H?=
 =?us-ascii?Q?dsBTt2XNG0vqw+955vonTAY7JYo1KVeZ2jwtKyZ1H9HICRhKwgX+gbMZLDWE?=
 =?us-ascii?Q?7LMJRbllHefueLNcIGhJZ8QnPjTQDCxK9+RTeQl9KIrC9/xslt71YIIdo3f8?=
 =?us-ascii?Q?E5AoHTiq6xVEdWobC4B4V9Y/hbSKJ7mjNhWjWd1n89iKUb7wfVQ5hjG+uKb9?=
 =?us-ascii?Q?6uHE7SMGh2Z16GiiOLAs3zei41lEE0/ZHJK/6TUhY/EUE6cC5nyhIYpy7NNl?=
 =?us-ascii?Q?tVIQJD8UkrdzSKJ7d/iaaEaZMyqBvo9JZLlY7uPOlIGpiodC2qnKAOlnrPJE?=
 =?us-ascii?Q?PSiICZ4lMN7zWjeXUG8odtaI9zj3svpWIorPP/PYGc5epOCw3+oGZOXcJsR4?=
 =?us-ascii?Q?cb2NjuS+zrrWufIVD4pR1CCN30VpczgbA+tknmINiay6WryEiLhuoW7T/bpW?=
 =?us-ascii?Q?9J1t6EUNJDq4mLsjWkpfacP+Z6CCScIlBroFEQevAT62C6ZxDsq3408kNVPB?=
 =?us-ascii?Q?W1gvISkY2uGVvmsG/kLxeQVhLNZJqeiM17ExFtMNx7sYLUJv69NU/3Bbs5j8?=
 =?us-ascii?Q?fJja9rEvsM2yPLBgqD87w/PuEqfAZGFLCe6QN9kCMa989JOR5GA+AOy3bo0M?=
 =?us-ascii?Q?58oFJMEzcYTZ5OMwQQvxT35XVdp7FR0R1OM6ac/4+YlOOu4n5eSxm9rYlnQP?=
 =?us-ascii?Q?hq1AsLe26aWKgKykJaaZyCCHvO4j1Nz5WCt/EVs1/D/dGuMRwTnbm5quBF2h?=
 =?us-ascii?Q?siaSVDnEmfLWYsWVbg6rQxcMf3C32eRk31nQljFhBc34vYxFi45Ia9OPXtr3?=
 =?us-ascii?Q?pulWBZscIXYUGA+obNc4ubQVLtdFNDTM/5KqYRa6ka0DAzUFHNZxKfVGfeRD?=
 =?us-ascii?Q?+oEyLDoBqW1A+Si10ExR5WWVK1it52QQncQWKq1JtDi6LLUnXZDxcliQz0Tf?=
 =?us-ascii?Q?LtQ4oKvn+HUtPVD9CRH/VmSJ14891TIHtLP226hCDpmAipvsGkVXS31wKcLm?=
 =?us-ascii?Q?YIOonsq0Sroi8AbbEBCL35D+wAvAmy9Iqs+jLZZcEh5hS78noC5JUGcy16x5?=
 =?us-ascii?Q?0YKzKwTVnfn/T+WXVswZ48dfy2pXsfphwVQtKHUZQMsA1jUDvw7Ahyt4vN7z?=
 =?us-ascii?Q?uoNQ5pOjFMsr5vX4ZM6iEgVw0Qsav5ld7I3sGm6h7HxxTMC+y9F0+A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ahxfh2TFN9xt3L3LGRsZuFyRZFX6eZz/jWE07AnbAw9TqsvPnV9nlQR8iKoA?=
 =?us-ascii?Q?AlzmeICZFaCdSKDNyPFY6N/l+SK/ENj9tvUU3v3/dA420amabV7l6ej6gNWr?=
 =?us-ascii?Q?hl9ilsPp74bIbjoNSnOPEVvzhv0UxdNkMfNw18j9AmQvcTX3LFIg42qgrUcG?=
 =?us-ascii?Q?3Tdy6zOwXC9nT9s9qQTtm1VJ7uZ+40X3oN/UNhsHpeml9Gp1Y7SfmiTHJDIp?=
 =?us-ascii?Q?DTubtE+fDjHdWOZPnNwkxbMU+MNFnpLTkNLfulVm0oZc7QoXfImTTdbVpMyK?=
 =?us-ascii?Q?pIC9IscVCvPSuM/Wtn47rmkHg4rHXly7sSedb57s4pm48eMaTC0R2SNQLHOE?=
 =?us-ascii?Q?g5+kDlm7mkbci4IMOdHVx6TzCeveQXrolr2dR7qosfxED3Emdx0r2lYf2oX1?=
 =?us-ascii?Q?EnfYxxmkwD6KZzPT6LfYbOShCZiFPiFz9qm1HZuUH2tVEODAGmUTAFcC8oG7?=
 =?us-ascii?Q?+6n9yhlSgVId4jYhR4jIVlzIpPDP1NZRwPu9ysCq1JEzuKWLIla9A+c7vc1N?=
 =?us-ascii?Q?Vp0it/8MY9rEZPJG8q8Benmu1utWYE5DWqWkLg4DVQaym9bv8D4IblkIRVtj?=
 =?us-ascii?Q?LkiEujFg2HFfteSSI94tpVA7pPAuocEgq2JSG1CJgNgn0idL+p09jX5fbHPc?=
 =?us-ascii?Q?CadU9O5htZolW4jlEtSdRK3XRZu4nkvQxJKWGg8PIXXrZaq24/GDSQgOdB42?=
 =?us-ascii?Q?YKWWTAX9MWMi65lWp99s2zFHiQtNMkMdMOQDVX+ZaJ+Ir/6vqDdLu6YnQGY2?=
 =?us-ascii?Q?DmIecOh4hOs390zBZcZ8NmwU57t/JGw9zNGyTrFaS1TtIUvFZhgBo2sPMo8h?=
 =?us-ascii?Q?wTk31UJmncgOXa+79BF4vnUb3b4tnAjTdNF0FWnpnRc2MXKYfcZXxyGn04ek?=
 =?us-ascii?Q?GQvI/x27A8JR8jTNLJsApYIgo891qOroeInzjFZK7Guja5xRjkH4wspJS7Ov?=
 =?us-ascii?Q?4owj6aBJVGtmLsSug2E9ypWi5olorHGg8TI35HbHTRdczK4Jarz2+/6bc0VV?=
 =?us-ascii?Q?2vomzZdozjrkSjqSKszQwMzQjzekN8chM9Vkr7lI/b6D3Kcc1Ny4jaVlA8Fj?=
 =?us-ascii?Q?tR71iL6WFT01LTBwmk/AsnL+gsKTQfbpVcan3Zh5NPWnubu6Mi0xF10bt+uW?=
 =?us-ascii?Q?XWy2ZjvnXK7bJdVoPxlsrRH2E7eKYW4DD2KpeqXetT3DgdqpadSuyEHZFyU7?=
 =?us-ascii?Q?Vshe9hMxNDS4bztsQ/XvdkJFAS2DbzkeadVKkYtfyJbmsTSSvU3bPN0EOqkJ?=
 =?us-ascii?Q?QQ7G1liynMBLlYLigpe1OCJZBsxLtd5LfzSwjvAn8rv6RDRe1JKH+LPzqPOz?=
 =?us-ascii?Q?kR3oDMUEHiBpxUYcWl5pInZsvy2sbeStO1WyyRa9ujmTaJzC6osU8NXQbrRg?=
 =?us-ascii?Q?CzeYmmsCoGbvzEPqOvt+idp4BIzPJAzCO9rJegVFFbbzlKLghsquy6C9zjNr?=
 =?us-ascii?Q?HLdgUesYLA/1zt2O0jpa8bfSPLVqgxXKEu1jvdooXXyC6gdg3WiX/JW9yaUT?=
 =?us-ascii?Q?M/+nHjP7TLyblotfbpEWzcTkE8rbEIzcIyThuA083oq8SEfldTEe/u1x6CwP?=
 =?us-ascii?Q?2goz3F5GGwHRqkXy6Ik9JAixJIbRu08k1gzs8zAtKJK/yU7k0w/IL68MSrxA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5a513d-a72e-4f88-58f3-08dd70271213
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 07:38:46.5702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BMDKYK0w6eZaQ61Ynx2f9Dd9CYVSWb0sWilp88109m7cQ6c5PPhiRKb7pGs5yj91GxpAndKHlu503nsgACm/rq+QVpcD0aj/eZGxlFJ9Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6896

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 30 March 2025 23:18
> Subject: [PATCH] mmc: renesas_sdhi: disable clocks if registering regulat=
or failed
>=20
> Because the clocks were just enabled, bail out to the proper target if th=
ere are problems with the
> regulator.
>=20
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index cea6af5daf99..8c83e203c516 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1179,7 +1179,7 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  		if (IS_ERR(rdev)) {
>  			dev_err(dev, "regulator register failed err=3D%ld", PTR_ERR(rdev));
>  			ret =3D PTR_ERR(rdev);
> -			goto efree;
> +			goto edisclk;
>  		}
>  		priv->rdev =3D rdev;
>  	}
> --
> 2.47.2


