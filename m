Return-Path: <linux-renesas-soc+bounces-15564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B7A809B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFB58C3EF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483BE26B94F;
	Tue,  8 Apr 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="myc6RWd1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516F26B94D;
	Tue,  8 Apr 2025 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115858; cv=fail; b=UpWKf/EQLlFW20xIcXdlwBelMAeDySzNTPG28XQ57svow1x6sl3L/o8TDR5kGisdaBNT9pYNkznI9s9oWFIwlHK+0geSBQet0M3W2VdMK8944PQtP4ojUKjDztfhEls2hviviQG7TPaOEOxgN5kEaE+bbCK+y76D+EGg63L/kE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115858; c=relaxed/simple;
	bh=rgK7VI4dJY9ijVQYm7qUUWJUzpAh4PCDWwZFK3j6fdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MnIiM8/JvxIRPMmxhhPth04sB6mDDToepbbIiGGsgmSxOfeodmgfsq5FfxrWvpR6/HbY5gcoibONi1XiwC4CU99VD5G2b+bi/BIBtyetEBkanDscL+dEkMWlXeB7xwqyXcFTck/Z2+4hXsR1SPqgAorQ6qZ+uFzMe8fOXWAwq0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=myc6RWd1; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jov+1Za97LfEAXI0Fye6Mc9PJl5F+nTCryh60Rvlgy4tLOmnkC8W5HV+MJxOLXdOLi0USS/cp6DHQr5hlIkvsrc+ILOH9+dhE/wgto2Yr1ufYnOV7DyVMHOzyRAUzn4PNx8S0IBCUMZCPUWEEH6NNEFy5HL7nAGdUthaIMeH5u05y7LdPxOvaeVRrRuEv9LKFf4uRQezxk0ublICBC/Fy4iIekHt6Xh3lvs0gXJA2uEB9jAnQUrAzHeljNRhBV1MC0tp98MQPdlO7o2penrysy8cUTUQE16Te7QwAIqEP3mpFiy+UHH91sw0drmPMReDCDpDdYH3rgUpNnAtIVslZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QCQAfEolTeJxPsALHWmSPGzCvgLG3ugMGOuXCRXXb4=;
 b=Vg19RzmFOeBdO433QQfvuUjR1l3h22xO1B/JGaYtjjFwhvY7eh0EBoqUDeoXn+ErJ+Xs2sKCuV/zh7MjafEeL+1J0/OjGfPzgnXME+XqtBgzKkj51dYFOFyHxnpfh0p0OW5fEIx965DkPhqZgiJejwFa4QUjiYdfYwFy26GyT+W+XmWI/hyD27lkn4uozbhLoot6a4mtzNzP2BBEQv5lSgIUyoH9tliVwyWKKxZKM0fxINfdDId68o0Q7XVly7VKevibd8u9RLVcDL0OCihPTf2M22yoXqcNekkF69cEBOF4jBMavPzRNX0XESlGd8jQ0sMXCw9PauWzJNyxs3ff7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QCQAfEolTeJxPsALHWmSPGzCvgLG3ugMGOuXCRXXb4=;
 b=myc6RWd1vMGgZ3C7mydPDiVjgtynR9IaNZ38NVBeD3L5j1oFqFGzPslGxGFGYwIRTYx5CmkGeqEP5YqHdUR5aJnv3TDgo81ek7c7qJrHSj8aqCMiEBqRqktmnUEiZ13Ge/7MSLWNnatGsys5KBWagd3UuFC+Z2N88ZkGsShjPF4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS0PR01MB5460.jpnprd01.prod.outlook.com (2603:1096:604:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Tue, 8 Apr
 2025 12:37:28 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 12:37:28 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Topic: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Index: AQHbp6raLCyMPN3kxkGUjRK8DG3KN7OZk3vAgAAiW+A=
Date: Tue, 8 Apr 2025 12:37:28 +0000
Message-ID:
 <TYCPR01MB110400F8DCB038CC28BC5C04BD8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS0PR01MB5460:EE_
x-ms-office365-filtering-correlation-id: b9acfb0d-4fc4-40a8-42be-08dd769a1fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8OXqrydffdoUoEsiY9h79lSPTw7qDxIJ1HUOzq6Ixq72sDh4xhHlCdRUgU1+?=
 =?us-ascii?Q?YRcOTodur3pf251ijVfCQ+SQ1/NAMgvFeOe3rX8pzYl2oYZFlbGxGg/jdcOm?=
 =?us-ascii?Q?hhsEuPDniWHZMuO7AK5pbZJjgwFLIxxZRQ68pW8hTzwV7BtYPwIS/2cViXLC?=
 =?us-ascii?Q?WeLv6jgIE6HQtLztEuGmdaAO0tfWNg7OoGAlaHtJ9VrYlN90G0gVgdi8r1ey?=
 =?us-ascii?Q?K4QsHnhktY1BVbYTatf/tOYUnmZjGGitAZi/muKuXFrkYZJT6xIlkMO8F7GQ?=
 =?us-ascii?Q?wfp1eHchXb0A6BJtsl8CQvGA30vNxBf1iKuTWDayv8gTQhG9TpFgXIPKRhQL?=
 =?us-ascii?Q?jwWYi57PEk2gXWj9QKnM8SZ3kUEZtxeyZ6dMlvZMxR62OH2hU8vCEv4LtfQM?=
 =?us-ascii?Q?tqYLXxHvd5uqhwRkqfGl+UlcLP6IGhswwsB3CsYWrhRAAPTjFBd+DpeGW5f9?=
 =?us-ascii?Q?ym4xp++X31/LMZJV+v0yKL0EM/3klMQ2aazfOCaPl6UKPrSYx5naLBO/YTM5?=
 =?us-ascii?Q?1/3zJleMDQRqaWWMYr1v/+Y0EhLxIUaZN7LmwH2VUSEW54GJ6QX+i5+5k/7O?=
 =?us-ascii?Q?DRfq84ByecY6UY4WJCcu2osQGwwdIodHSvV/4i+ViuPcWtgqUJvi/7p3R0HR?=
 =?us-ascii?Q?pVM4mkEH7jzZgqC1PB2+DNwrg9oJSmFR6vzSl54RLqogkEHNgnmL7Q9XFDFk?=
 =?us-ascii?Q?+2IhCIXhHCFNVHgEwrzyzsZsf5Zrtmf+kmxYinQTG9H/lKvtSLWXX7Pg9ob0?=
 =?us-ascii?Q?JfhLC3XqTNpwtQ5nnFXUuiyq3likVPRSAr78karXX9fmtOoq/uQWClSPFpj5?=
 =?us-ascii?Q?eZLohii2YIailYyKF9AUh+0WAdRpxuRKpB/xloBFIAgGQx4mzDhaZD05ZcWG?=
 =?us-ascii?Q?8XjLqXw4CV+tu4gBtNOJ68gNsaGKeN+hr+Gc0z7cB08zDo8KzU14eC9/uFoU?=
 =?us-ascii?Q?DvaP5bT/rpRCbm3QdaX3f6ykUiAXViJ5gmRulxMd3akVOVMXolb2Mu4d/5kP?=
 =?us-ascii?Q?PI4vgxX3PCXw825FQK62TcmF3UdRCfWSMl5ksRXqor+/BvU/bvYn13wLCeG5?=
 =?us-ascii?Q?h4Y2JGs4mOzVpObY5TH3yHjx6ozd1fucjH/Cf6sTAViOwdV5HABuKD7VHw6x?=
 =?us-ascii?Q?s7z61fu5GFd7syUanXqqXRKypJ9aR15Wol4VqmfNxg7onb/cV2YkRY3zgTgB?=
 =?us-ascii?Q?c2z8SVcw9NCYwFjNEHlM4ZbrJvS/XkRNvJR139Esa+VYEsSTsOYHSjal7SPq?=
 =?us-ascii?Q?Y5NJVs+CVK5rBdpU3wlhOimSJSWSTfantDIFdQtSKAa1FM5UhXrGOd9WB8Wh?=
 =?us-ascii?Q?v1V9Gnsvr+zc482/E18Nibb2gde0TyREYkcx+pcxgxNhuDKWyJ6w6RJmeXP8?=
 =?us-ascii?Q?WRXoA0aYinj3ckveSDrJe5eQLNgjcEk9Dn7OIbHO3tRWN4VQ0mWKIOgDe/iT?=
 =?us-ascii?Q?7B2nhZ8PptYuDbN0nSqVz8otDDdz2OqB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?o/lu0+Eoqn1dk7xzVtFUexhid/EKSo8AFtAwO3/A6WjOa4me3OCtV0ucsuoY?=
 =?us-ascii?Q?UGaOtPF6RMOrflEZgGtGcfRDR6hJB0ACkjR2wFleeaq992Nu4YqkeC3/3Xx7?=
 =?us-ascii?Q?ypmu1Y9NVHH810OEzF78hnJBfSP5C1aLiRDLCQNy9sWX7LYn9qh4FFH5E1sS?=
 =?us-ascii?Q?Rda+FXZswjCP8YgXOSswWP3CBtKYmrGS0K/tSsIyBmzf8fcCAXPZfNhGsduP?=
 =?us-ascii?Q?EbNHAmDLk8Lj29oChALcT10HpwJhR3Encbc/Jbgw0fckLx71ScmlKYGxKJj/?=
 =?us-ascii?Q?HHD+fN7bfDD7Kt9G+8UsRJJF5yhV78Bao346bng4qJqi7Uolyd6B6WQRovC/?=
 =?us-ascii?Q?/vcMBTfe0KqARtRwbcKwsrHnrt5BGBCFKEhr9EPuzvign9b0+Me+RQO+hpbN?=
 =?us-ascii?Q?DYAMxlnQ+kb94da+JSqbrzga+VjvTja5tsRSsjbgLEdgSzC4Sjoy5TXLxn0p?=
 =?us-ascii?Q?zUQzbAkGCrREsyEDI9GlJM12xeF1vIPJjdTuW2du0IxOBW5oFnYcrLlIBDk3?=
 =?us-ascii?Q?zk95hNRDYQYzQt226XEicUtHkUzjtqG0g3Fc1OX++/z7gLIW0xPyWyZujgLt?=
 =?us-ascii?Q?vf33bNs/ESflAzzijONJpzr9528n2rOGbJ7/X9l4GCFe/H0PTGA8OTsOsRxm?=
 =?us-ascii?Q?hmTn6ZRbIek2sSQhD5Ozka77FzY2Qmh1772+/KiZZ5+DFqqKLQG6baLKRdlo?=
 =?us-ascii?Q?pL0i4yp7tubnsJRP97AWpyuer1YbuzTws6FXfPIqPNJTTZ9ptZ9eeEKckLf2?=
 =?us-ascii?Q?gamUy8hhpsjF13S/cE3cWaZH95/1R0KDepAJRtKxZqSxVoDJAQsh+tN5ntyN?=
 =?us-ascii?Q?CfeTT/7zjxzTr5V87TPMH0pKTDBuUaxPmSKqdzI9rNrMmcwUZ5F7hLLRkB1H?=
 =?us-ascii?Q?9SLtS7FsP3z6kAJflv3pZe1Lh6dW84zEPfU6LUpU43MH0+lJ2M5pQhm0WKu2?=
 =?us-ascii?Q?2ymPNy8t5vaEedeZ3rCWIJ+05eU7Slr2iqotF4kL459FHV3CiuCK7GgA8Jvn?=
 =?us-ascii?Q?pEezYyogsuflJklBrrnZxV79PTTtWssIlG0HooS/8cJo3Nw9MEmh/5Vlk9cP?=
 =?us-ascii?Q?7iVzexGQgNyZ/G1+UMX/aHPqqjtUfOyh0pbhmq+e7C4Xbk9bjnLdoD2WCn1l?=
 =?us-ascii?Q?zDUupu64mDg+3ECt/oElwbCgPYes4wmV3ymLzpVxYpD2t3qMG3NMaMcPCNgu?=
 =?us-ascii?Q?HswX2m/WSzkVZhUObcfCz7vTLXfyXN7F8SNtXtTlLCkV3Bzp/bmr252DPWLm?=
 =?us-ascii?Q?4uaVm20RawrCT4NTrcFZDXoSKq1CtYrQAjv9uS2EMTz2AxPKgIyXm8JDTFf8?=
 =?us-ascii?Q?iFt63id0ZsMICwnHe3+uQKpJlPqUBGXL2JjeEOEbTYGaO8D+f5KDVLS0Oj3j?=
 =?us-ascii?Q?TkVcPiyC3/jIhM6NnDr23JAPNFnKXLavremlWqlOG1lF+GRiif9xQ++URFkg?=
 =?us-ascii?Q?knnO4KzOVvpIl75XjYH9a98TVmnONlaK4X7NlVjXxxRRmsQeI202ZoPnk/yj?=
 =?us-ascii?Q?HABCRRXXd3fEt2KV3gMQlP9FEObtUCs3wlTWj8novgUnQfkqgUIE0K5CvlxD?=
 =?us-ascii?Q?9u+oVyikmkSM72z5r6GWwTw+48lS2tm2J5dBu5VjmR9LBp5qw8tB/I63gT6B?=
 =?us-ascii?Q?njJ/0+1OHvii/rDdD+snbBWoyq1fmkMVKjCjCOy3miaP6OpUHfvORiPsUoIT?=
 =?us-ascii?Q?E2dyBw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b9acfb0d-4fc4-40a8-42be-08dd769a1fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 12:37:28.5983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8f2wpzS8wVaBkLs3LI98d8KLXuIQo22ypupRbPDrK8ojJ9LxGq6Alu4uRODn/AzAng+94OFmvsx7FPafLqf2yvIEekQq+IdW/DXd0uZjMIi1l/zxARlnwGKaht8jBuPm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5460

Hello Prabhakar-san,

> From: Yoshihiro Shimoda, Sent: Tuesday, April 8, 2025 7:40 PM
<snip>
> > @@ -721,7 +736,7 @@ static int usbhs_probe(struct platform_device *pdev=
)
> >  		if (ret) {
> >  			dev_warn(dev, "USB function not selected (GPIO)\n");
> >  			ret =3D -ENOTSUPP;
> > -			goto probe_end_mod_exit;
> > +			goto probe_assert_rest;

nit:
I think that the label name " probe_assert_reset" or " probe_assert_rst" is=
 better.

Anyway, I think that this patch seems good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested this patch on my environment (R-Car H3) and it doesn't have =
any regression.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> >  		}
> >  	}
> >
> > @@ -735,14 +750,19 @@ static int usbhs_probe(struct platform_device *pd=
ev)
> >  	ret =3D usbhs_platform_call(priv, hardware_init, pdev);
> >  	if (ret < 0) {
> >  		dev_err(dev, "platform init failed.\n");
> > -		goto probe_end_mod_exit;
> > +		goto probe_assert_rest;
> >  	}
> >
> >  	/* reset phy for connection */
> >  	usbhs_platform_call(priv, phy_reset, pdev);
> >
> > -	/* power control */
> > -	pm_runtime_enable(dev);
> > +	/*
> > +	 * Disable the clocks that were enabled earlier in the probe path,
> > +	 * and let the driver handle the clocks beyond this point.
> > +	 */
> > +	usbhsc_clk_disable_unprepare(priv);
> > +	pm_runtime_put(dev);
> > +
> >  	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
> >  		usbhsc_power_ctrl(priv, 1);
> >  		usbhs_mod_autonomy_mode(priv);
> > @@ -759,9 +779,7 @@ static int usbhs_probe(struct platform_device *pdev=
)
> >
> >  	return ret;
> >
> > -probe_end_mod_exit:
> > -	usbhsc_clk_put(priv);
> > -probe_fail_clks:
> > +probe_assert_rest:
> >  	reset_control_assert(priv->rsts);
> >  probe_fail_rst:
> >  	usbhs_mod_remove(priv);
> > @@ -769,6 +787,14 @@ static int usbhs_probe(struct platform_device *pde=
v)
> >  	usbhs_fifo_remove(priv);
> >  probe_end_pipe_exit:
> >  	usbhs_pipe_remove(priv);
> > +probe_clk_dis_unprepare:
> > +	usbhsc_clk_disable_unprepare(priv);
> > +probe_pm_put:
> > +	pm_runtime_put(dev);
> > +probe_clk_put:
> > +	usbhsc_clk_put(priv);
> > +probe_pm_disable:
> > +	pm_runtime_disable(dev);
> >
> >  	dev_info(dev, "probe failed (%d)\n", ret);
> >
> > --
> > 2.49.0


