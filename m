Return-Path: <linux-renesas-soc+bounces-4752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6D8AC240
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 02:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5537A1C20400
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 00:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CD5367;
	Mon, 22 Apr 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VKFB4m0e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91921163;
	Mon, 22 Apr 2024 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713745219; cv=fail; b=SYFly0YVGLCWt9QwRN94HrOYJmXvsMBoV6BSXh4ZWReY0LZcilWgQLw5ZCFxrvjCu2MYmsdZ8mxub2AfQhSQMVtJUETniwElvr85vuRAJ0xp4rEktuqGn0I89OGiJO76HD/BWwxI21ETReW4D61tOkmZutFUQpcoAoleHeDB+Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713745219; c=relaxed/simple;
	bh=AvaSHYvUH5m2bZ7uCLMNmFbPDQeGA23d6iYQrD/XU0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XrNsxbaREI7nkf320jiXyHxYPJZrMPpVwWwYiVu4ajDY/+6H+IVo0tirLSgidnFp06J/Vs21NfOFSj0qPe1axf6p4heBYt3mzmdONDF+MPmussc1hk254+ZobTcLR0JxzNkWaJo+Cs1Bu4E/+u/WhMwh3cHsv8oYSxUYYUwYNz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VKFB4m0e; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWBBG2qUoLxeLw9ukYCzrzrVDdbUtKh6as7fzZpqldXyyVXgiyFkLWD2RwRI4LKVp15CZIAB2l0UUmMB1CaR9aNeMsVlyMkuM4BFe4mofkYAWhtnedb2KG/lGUXDPkt9nBXXUaWKvT/zKhRXjZCMqETlJ/OLcDV7kPeeSIrIpqz3cg927H1VkClUoVLlXe6BtdoVziWjHxaLkmp4METj43kHziGu+luN4wP6XKFOunRedlvqbb2d0uJ65bvMkBa6apQWmq/bzjw21W6SswM2fVykm8GGvE2ufMCMViusq3P+kMxi1N/oVkW1CmztZv/5fKRB3upazgjJ86wXxtguow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpQpkklIz+BNjkK2lX0p+S3wOTbRg490CgrY60lEDTE=;
 b=WQGPQGss/KgkaTMFFffhFajXk8SAY32AIVSxo+pGFauRIB5Q0AZcqFVfZ1qywemTMrFJeTSBvhXxi5LXspyF/c/3+JijkbOJcI+kINVHqDtu7WJl21NvCBibThlHSFR5Z3R+Z7J2lMEnN+fmRyP+302fT6b0ND8A1va6htg6ntxtAZXi/Vl0KeQqA51hRq3JvHcz0tdMVMncvltlliWkzotA9lJMzcH5rh0t8P37RSZi0Q8gbb4QPrqfyyy8Tsh+/GhEust9sg2JJYgTMl5RkWU60/onjqshJceWNttRatq1HlTgPuhrbO6qxn3lJTZ18gRJUViraWzvTY5Sa/Ppsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpQpkklIz+BNjkK2lX0p+S3wOTbRg490CgrY60lEDTE=;
 b=VKFB4m0eZ0qxw+EYgXcvoyt6PdRCppIhT2Bv3FDlwEkZIrYp8haMBVMM291OBrV2E5i/i/wcqMtuna2wb/owLAPw/RyUWF4lT3SivLuerCsArO1YMc1vCaAUOItdPudzb3G+txD+KfvCxeF0qblNILZlqwvEkeqKunyG8NVsaMk=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB6291.jpnprd01.prod.outlook.com (2603:1096:604:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 00:20:12 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774%5]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 00:20:12 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Joerg Roedel
	<joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
CC: "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Thanh Le <thanh.le.xv@renesas.com>
Subject: RE: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779h0
 support
Thread-Topic: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779h0
 support
Thread-Index: AQHakk6lS39WMl4860m/x2TZkcavCLFzcMGg
Date: Mon, 22 Apr 2024 00:20:12 +0000
Message-ID:
 <TYCPR01MB11040E81CAF01FA444D6D331AD8122@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References:
 <13643259be4e8a8e30632de622ad7c685dbb7c61.1713526852.git.geert+renesas@glider.be>
In-Reply-To:
 <13643259be4e8a8e30632de622ad7c685dbb7c61.1713526852.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB6291:EE_
x-ms-office365-filtering-correlation-id: 8890ac35-dd76-4364-8deb-08dc6261fa27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?e9XnRn89hyT8US77VgxEYNQORYR6CNf5/lTeFMy6gSQGZ9+5sEL51UQ0J/Nb?=
 =?us-ascii?Q?WCilZb9zRTUMBelqtvgg/edfaxgDWyLfHM9i2f9E3wvC8GtMveOEm3I8XoBC?=
 =?us-ascii?Q?bPvpynp0iB5TZjL2CaCWjaZt8Cul2+DuEgScD6F0z7Jz2EqiuNzzN88H88B7?=
 =?us-ascii?Q?uDz3cvASIeFytCBHeOZ0DQJdWw2c4zXDtZBXy97Ao/Sk9cpIWXquSAUzxgf0?=
 =?us-ascii?Q?zdvSLVAW0vTjI6nbySQrrtTJkoFsEbj7vrn7CvuHXzJEK1ldYANidwuXmAqh?=
 =?us-ascii?Q?hK9n9HZZTMuinCOFNrIcE0ybNEF9DSgihtpeNUjPfDFM7ewLcK5RP2/7aZYm?=
 =?us-ascii?Q?Lqr/2Yq6IXkbADkUzUueJTm2JaHuw9dKibtlYQC3DEQs8n3GMKrTQKc2dN7q?=
 =?us-ascii?Q?vAcW0jjhWWpwdJNbrWT0V70YmWhvvCgGldGoI/vH3NYP3QHaHIToBQ5cfB3V?=
 =?us-ascii?Q?5q7A6ffuqLPSz0MllIznPIysxKn4YAp0RxVucJ38hS7D9ZBdE12lSAlurSAo?=
 =?us-ascii?Q?+rYSw+XVt92mlwsbcLUg4p/I9mdDymJ6oqcPGYOoadw39OQwM/epH3DNW+O/?=
 =?us-ascii?Q?lYupEqGao/urCWnqN0cNl1kGFMFborCKpePft16gaWJTJXJ71WewEdpNi07Y?=
 =?us-ascii?Q?Rqw8+ALmuTReqz7v2AyeB6AsCE5y9PWwPjYWKF7LKCzxB+RvNM73aw4RtIYD?=
 =?us-ascii?Q?Ai9CDmJAT6QcMeWX6YCOycruQ2XcM5LWlXGjkb3LXbEVTFvkMFNuxDF0bVc4?=
 =?us-ascii?Q?EKmo+y9fjnNflSWkxxn7fSbY7LSfG9dBeG6+tCS/u/yCq5gdGJrDu/Sd7+6u?=
 =?us-ascii?Q?Z/Oai9BxWNK0W+0Mkd+v8KcCpcd9RmryGdQJ5jgk4sbv13zLGnRE61Tp+aHX?=
 =?us-ascii?Q?yROJ4cEy1/8ZNHGmZMRmno9jl//lTImK6+kmoi/Sk8gVadHVpk1dDD74GoGO?=
 =?us-ascii?Q?gVO/e0/c4nJ2zxjHroQAjzBkOdHZgxg9ShIGBEu/hrxwUhdDtIp4rLyMMyTf?=
 =?us-ascii?Q?7IpHhwoTYUKx8oWgFXIF8xIn5F/geqndWQE9v61BFfO+yv9wku11UU32Y0ki?=
 =?us-ascii?Q?byXknYKIkajLtXAFVyOOnkr01P3u5SouC2Z9whhfVn83ali2wofjUKxVvWeC?=
 =?us-ascii?Q?XMStRpjRSeno/6gfP/vsiizhgUV9sf2z7e37I4WM/kJikAwVnNuPfDQZWbHo?=
 =?us-ascii?Q?pyZXbcOHckZZ1jLkM7Vr7odzexyWl/7dkKKxhvlhmxuRAb3U1Jboe7R23JsS?=
 =?us-ascii?Q?25Xk0ubf2QWA8jyNP1m2Taqc8WklGGlOSgGDeHU2eRFz82A+z95PqR9Cepw3?=
 =?us-ascii?Q?WbEY91Lv4LvL7zc4STzq34mc3TjtMLsFJZCbObFPzkkGmw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tdObhHUP32hbt2w+rf2MzGwSQlFG0ZSWiq2r4j/0WiPYGCWE7nwqALqy0IjC?=
 =?us-ascii?Q?7Y53xoWv2Gtib+VyY9vvI1QTeL0HjrGlywaueL/aiMJYg7zZo1jyYJr6Y4XJ?=
 =?us-ascii?Q?o4sXZ/3ZaD3p58XxCvQ7ugGrF7o6Je4WzA5MuiQuPyowBfQ9H2Njwn84Md1s?=
 =?us-ascii?Q?WEYlh8IJHgMRRl9HpAS2JIJMBiBsLhHwoTIzPTdFyUBM12G6h2RZUyCzLfv7?=
 =?us-ascii?Q?5EyQ+DbYUSGk/Da9GmkOHzEFoaOu2s+fFudhvI9Ix041MEChYAH1L96DcARn?=
 =?us-ascii?Q?kPWULDWhIAKjGQVBhsmrc7iDeHd5sBykw9v9AyKmB5v3gQHFKMYkRS+iz80+?=
 =?us-ascii?Q?xwpPm9Tg1kcz4Qp6r5KuBJ9qS7++RMDkQJWioaXBG16NAeC25xLSfdMLZOJD?=
 =?us-ascii?Q?KfwRrguMcXJiZuGW3rx1yAKBbLTbdsmf5l0iFr65sXpwk04qOCirxn5s7u39?=
 =?us-ascii?Q?EAEES6/K6ctaBDhYrHjLTM9frPmdzZoXUUydOsJ1fyZ5G7CiVkkydFppI2KJ?=
 =?us-ascii?Q?Q1TaIf3KAL+QbIZm2PbDZQL2wn7bGOvKwnIN1pnGwDV88Vh0noLGJyDq00Ug?=
 =?us-ascii?Q?r2ARSashc8eq6L2QgMBPC1+as65IXr/1HIit89GcZaV0Z3HhKz1YIQkapnO1?=
 =?us-ascii?Q?NTUdyZxdbL1VENEN7lT8zrV3o2iOn93igISRj3B40OKa/X+A5+cSxrdCvxGC?=
 =?us-ascii?Q?vWaW5UD2mDF0hmh2J72rcezMaXVWoRh0eubTLuJJM+POChs7cwaWPyPCWtLs?=
 =?us-ascii?Q?I2BsB/ONUAGNnNHQp8AKuUcVXDo4iBZP1FnhR4obKVbXFh6RryNssXDWlzHS?=
 =?us-ascii?Q?otuuMgJkEqHCl9MGqquFhsS0t81xGr2nqsmY+f0NamYI7rnLUg1GAN76sVZa?=
 =?us-ascii?Q?xI8DzCYqXg8OGMZnrApEBBdDE6D7+juBtH+9Gn5KzLv2uuXdcgyt6LtAmhvy?=
 =?us-ascii?Q?P9N5iiCAHndu++953KBImbXFUsZJnVyQZNEUhF7oqQqSk87iR2WXOU3PWW9V?=
 =?us-ascii?Q?PNsLVJ0pjwZYEguVQgOoyWCNSczBEaHbZsxOgJDzqLnSo30agiuGPQT+a9Dv?=
 =?us-ascii?Q?HrtJ477B0Hnr1RYlZqTxDMciYfo27ubZTo5MdSZDoH0P2Bqeq5RGpUev2EYS?=
 =?us-ascii?Q?yExdgLm9l2+88/BduyeBLFsK/KEVYseSKg7qBsLV78CQOi3OBrJaPbmOTdaC?=
 =?us-ascii?Q?bnDszwhQ0VWfBDwOqx5f4dd596VcwbksHZYCV1EaEkIWpUQF28VuBFhGvCB7?=
 =?us-ascii?Q?xBup1hxDlDBwwCEbIFPAvlxo6s57UcL6uN1e7Eh/4szWJw0df/WPN+OVzxgB?=
 =?us-ascii?Q?sqnUajjHHiZDnDEbmHS6QJSRM5QfYEKr5ubxEj4xk3G70tQ1sDQ4fVCEOJXZ?=
 =?us-ascii?Q?hrzJ0jgTNwz7RjdM1BOx2I11IUxz0SiYvg04NWHeL84wwxutyJky+ztjFX3b?=
 =?us-ascii?Q?/RHKqOHWCfWZemV9UXcwyIRb2AcInObOZQJdR9Tz/WrQTYdF1zWmH1pLp9nR?=
 =?us-ascii?Q?q9uoHBCO0xlODVirfj40MZnNiVKVtJWUxvybsHlV2Fe2jDOn3Dyp4aBHjujL?=
 =?us-ascii?Q?nI/qvekTv84dbOVJ/BuVu9HTeyx/aDvy31WjuHN9wnEaVLyZUqGsRhuMDCgy?=
 =?us-ascii?Q?kt4UefoMVzie/tmzXoKwxHJC2uhgkddXzRo4/wmFkEc9aHYB6mTVFuvR/TR0?=
 =?us-ascii?Q?l//0QQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8890ac35-dd76-4364-8deb-08dc6261fa27
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 00:20:12.7810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWPIUyliDjH5A6GAqj9FrWaPCVuYNpMmlByBJoe2Au8Sm45MxJAqVa/y+r234NUqqqLESzcpu6vVBX27ZLEExil1I3rSWhTbjJYslqsqTogrXv1rIz9OAbVZ/PcJT7OJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6291

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Friday, April 19, 2024 8:42 PM
>=20
> From: Thanh Le <thanh.le.xv@renesas.com>
>=20
> Document support for the I/O Memory Management Unit (IPMMU) on the
> Renesas R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Thanh Le <thanh.le.xv@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Interestingly, the IMSSTR register is documented for R-Car V4M, unlike
> for R-Car S4 and R-Car V4H, so the second cell of the renesas,ipmmu-main
> property could be added again.
> As nothing really uses this register and the associated bit numbers,
> I think it is better to keep it simple, and not partially revert commit
> b67ab6fb63bbbe6d ("dt-bindings: iommu: renesas, ipmmu-vmsa: Update for
> R-Car Gen4").

Thank you for the patch! I think so. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.y=
aml
> b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> index be90f68c11d18b03..0acaa2bcec0898b2 100644
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -50,6 +50,7 @@ properties:
>                - renesas,ipmmu-r8a779a0           # R-Car V3U
>                - renesas,ipmmu-r8a779f0           # R-Car S4-8
>                - renesas,ipmmu-r8a779g0           # R-Car V4H
> +              - renesas,ipmmu-r8a779h0           # R-Car V4M
>            - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
>=20
>    reg:
> --
> 2.34.1


