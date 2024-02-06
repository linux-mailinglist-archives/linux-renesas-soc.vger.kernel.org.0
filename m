Return-Path: <linux-renesas-soc+bounces-2339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B584AB8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 02:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF9C286C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 01:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A99C1392;
	Tue,  6 Feb 2024 01:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nP/q2HN7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD711361
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 01:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182773; cv=fail; b=OWbnzapfsoeaFAjP+hzHcOAn0SRCHex1BLI7xaCGfvmImHRCS3m2J3xQM3SYANLQ/u7ttEEo9QBIdLuBj5SIw4agoI1yCwmK/JfR7iSxaJE6YpTSRHmOFQk0rRV/QBaLK49gA4PjlfF6Hgv2SZvINuKl2sQWjFTf8ZN3WUJmB5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182773; c=relaxed/simple;
	bh=4iCBikps6xQq1x9m9bdZpj7AOCRyslqo2gVth3BtgqA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C2jvW4xoiOkB5EYIRMLBXVNQTu836hOTH6O+ptSIhjb7HJZ6ycaM0lx8l6xdkG+VlAmBoHeolYd9PMd6WW9pXAaquYsXyfDEdB6kDCe4h5q4cPZUBxpfCN2IahceOkHN0F19qPtftCqZj2inRKrnK1dn+p0189KaEq+rCoKTyQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nP/q2HN7; arc=fail smtp.client-ip=40.107.114.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv6zAJNzpP7JCjO7dChzXWTAPulEpwy+jRiHill2SCS9EI9Sgvh1rGBDPpU4dyc4b2anIe0naEeiG8pZVb0PVft/Bazu/yjjTmezfarbHGNbmNAwuSBSha43j/z65CeNbs96BCCdztEFngu7HL5reaqqbpxjlsSqEMeXE7vVGeWnf1msXS/qkj3QMfbekxKakD7937lty9swWtt7+Hwv3M1RHXS8UEKYMJlG5pUwF4CPNpmwvxHMXJ9rZh01uyTc12zm+h8PVVxEKqvcArIBHfwURtuYdv7QnkPJW+TVyf+EuzdSkk8/DRBxueinrSaNHRa3MPQ0eIO7maZe3Kq5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2px/n+lBmvKLdoc+UfgQOq6KX3KiAQXC+rh9ArYN/o=;
 b=jAEI/xnwHA7mzQTsE8LfrknSGCUqiztO8xkA143yttrNKe0lZWa1Ts83vQcntJgX0M6GJKFim8FvIUS8vC4vYFjkEM9fyfgNiq0jxz/q3ACDzXyec8DjafqyoAo6jXgH+ncKZ5YMcVcgArXji2TSfIMRwcFzULyLwf4O7nr3F8WdS55ZoPRFdT3jkHO0vGcKEE19Z/LRwnhdqKPxuIcgSYQ6wyMA+L9DMlLzENZKxWCRVWGt+qGGIQoHf7AJbzA2qU/EB+QIMbF0/dfXjm0ZEdcWHX27Asx1T8s9nB77KwOhrE5teFcpYWze7Hd6E7TG+4j/KbS41opdcYTYK8+rLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2px/n+lBmvKLdoc+UfgQOq6KX3KiAQXC+rh9ArYN/o=;
 b=nP/q2HN7SwA2jBbQaVcV3+ltLigip8Srzi+1i2RrJLqgd0516oiArOGF//RJ9p1tNvJ4wu7Q7xjSsqzK/rXrxlMykH6Qng2gYB0HKNFXbQDaRa+GSwwFx8RfboGcM6AkBmwlXo1XoV+zIku4svRDfvME/rzylhUiUO24Gs2MjsQ=
Received: from OSZPR01MB8611.jpnprd01.prod.outlook.com (2603:1096:604:18e::7)
 by TYCPR01MB10926.jpnprd01.prod.outlook.com (2603:1096:400:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 01:26:07 +0000
Received: from OSZPR01MB8611.jpnprd01.prod.outlook.com
 ([fe80::fc15:b39e:64d6:a1ea]) by OSZPR01MB8611.jpnprd01.prod.outlook.com
 ([fe80::fc15:b39e:64d6:a1ea%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 01:26:07 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Robin Murphy <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
CC: "will@kernel.org" <will@kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] iommu/ipmmu-vmsa: Minor cleanups
Thread-Topic: [PATCH] iommu/ipmmu-vmsa: Minor cleanups
Thread-Index: AQHaWFJ4gyLDVvgLfU25eJ82ANHcg7D8he5w
Date: Tue, 6 Feb 2024 01:26:07 +0000
Message-ID:
 <OSZPR01MB8611DFF66D172D3A8C480012D8462@OSZPR01MB8611.jpnprd01.prod.outlook.com>
References:
 <791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com>
In-Reply-To:
 <791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8611:EE_|TYCPR01MB10926:EE_
x-ms-office365-filtering-correlation-id: 351d9ecb-0ec4-4dfb-c6b1-08dc26b29810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ra+3J+ae5eDnpl32TuK5aaBz7YGL1yMYsx4oM6QTNcPRqyp8o5Wopr171kh3wwWRESqawu1RKq9TTS77AyjUQSSrIngm1ucqSFSzBJEdalHBku8bbjjqwdUp3KffZ7YyRMvqj1EQVbUVv3f25xDMWImM0HiZb7GBC7phg51TjA40pzSAA8EPW+VNj+pTEYDaqGYm7jP2rNwPm41jAnTjj36ny1jbyZ+81w997zsCZYpzqVQNqDBexQxy8aEXAMsEECLUB5BMzlTVJ3z6ZcpLWFxPyZREA/CdS9Vq7PPNOFJ4+t+9PgonBBVuUIHi98qUS3VHihzR7zJ7/VnZ4HU0tzVrZ59eF0RdFy1CYhiiSBVOzGK7PflY3whkMBMdynNa3aSYl02cUYQxLfkAk4BhrSqyXUdVLXxaIsYpB1D3sRlbUaItGCNQDKVmAnoc74aYimA099C8igizr/0mkTdAKJFMq2grGd+gz1otm75QYebzvjdcAxSNZbAK3fimo06VmNmrpvnCwCqOD1/DeTM2m1lS17e1A1a3BU84eHjWBs8lNvIBnkF19ER0C5ciJcG+AbyoMGT2DIteq7bd4Yw3ozxDvbxqjkBuBAZkHmr8Muc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8611.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(122000001)(55016003)(2906002)(52536014)(83380400001)(86362001)(966005)(6506007)(33656002)(71200400001)(478600001)(7696005)(9686003)(54906003)(66946007)(66556008)(66476007)(76116006)(66446008)(110136005)(64756008)(316002)(38070700009)(41300700001)(4326008)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6GG+7B0Zi9MoRR2RrfxOrrQgU+gNis+EGE6fXs+cBS2grh9jXxOwlhmTqRYm?=
 =?us-ascii?Q?OkAbQyE9ENMrFZ/DMv/OooDnGoC3hMw5E16ZJFmvS3TOckZTnZEKgernEDsG?=
 =?us-ascii?Q?6jPHfT4kK7AXNAx9Rkx1TE+OSg7zmVLtZ3OQRho2P+d75Ce13H8b8Y88demD?=
 =?us-ascii?Q?q6kc4IJJEGLa77hlmJAFvsOqYY75thU3WgY/gYX7TsXeF9mOfLLwL4TOK0qR?=
 =?us-ascii?Q?h804dxTX+2nPMtuXOvmlWi/ktT99tmub2RfHdth153AzF74mOFRQcXifJBBS?=
 =?us-ascii?Q?asqOl7IymzWBrg/7phETC7GTXr4ALl0ZTQ4Zg7hzCR2NAQnffb2oYgI24NFI?=
 =?us-ascii?Q?CZh4KtQeNHsAfgSCVgDTl19uDbwugyXw/l61FfjIJ78oeg60pJ6TCXNdt64R?=
 =?us-ascii?Q?FsBEbBjUDPTeUfXXjnvZmpHSOOzXHRgCTL/w7K71zPQJm7kUMgobvi2MCxGm?=
 =?us-ascii?Q?LhGki4v9LbKpdjKhClyT8enb/KAqW5ppmt89Z1awG5mJhkCCmKfxL9LTMDoZ?=
 =?us-ascii?Q?I16gBUT3yNKAQsgmQaR1hTlLeHBJjNTCK/C96/87ieVh/rTu6m3Mq5958h+D?=
 =?us-ascii?Q?snxc2B9wYTvt4z9D8eY40UQjweRZHPkibi1Co9ZBLhuubW6mw34mljX05AR3?=
 =?us-ascii?Q?6dwvz1mbwrMBkLgdss4ifsCqsVage+s8MuylsIXRB9svluK36EufqtxUtmSW?=
 =?us-ascii?Q?OZ9tkNYUo6nr7cliwx7zgjG9Dkzzm090Lt2yKPwo9GQ2Cf1HMAbFQFIJDkMW?=
 =?us-ascii?Q?DvVBp4oZ33Iif6+PHlgtSObzVHYC9QdtwUmidsFImkCcahMEiIm+mjxUj2xz?=
 =?us-ascii?Q?fgPj2nEklqV7fwlX3N7BSsO92bQsrRZPgt4yOIrliW7qU4w7rihlH33cqs2W?=
 =?us-ascii?Q?HROvo2J7xw/eXiKRsz9xIGZqfwUbquMBNQ6ou2hw6vCXeARkQdaaoQNcUsA9?=
 =?us-ascii?Q?b79djFPplhA14mcc2YGDeIThfAKNzbsX/TkzTALMXO7PBhDumezLf0EDqQku?=
 =?us-ascii?Q?K/tzG88uQ3s7Gb5fa8Hkblb5ADKhds8SBv2yYD+Kwq3kFSkZKl2W1tQofuXl?=
 =?us-ascii?Q?3eyOdG5ks4mb2H862i4Weq0+LmaiDkSUVJuwYXWin4nKka499RY2OtIHIJXR?=
 =?us-ascii?Q?W/pVl7Al/ZqJ68iz5a94nCY88/S1NkaQtIVniJJ1pHSfuU53lI4DZYIj7NtP?=
 =?us-ascii?Q?Ar9XPuQYnPDVf9JHXlsVlZ7vdUNFN7+Xwra9vOvCaZzADZAAxL2klHWMK1ph?=
 =?us-ascii?Q?iT8+f78o03Z6j7cwLtLErRCPLoiYH3zDpmiz/Ub5GwQr9OJ8wcduG9FOweGX?=
 =?us-ascii?Q?0H1xnrbLPsAIKIsJgcKViXT0QZf/XqlC9XLltpl13HmWgPRgUnMzBIPsA241?=
 =?us-ascii?Q?ir1KzpV81CX5Zbe2YKwpal2fKyILzvPidLJsbP15BKchAvJif2X271djpuod?=
 =?us-ascii?Q?/mPPsiFf02JFBCoNYrPIj4Oz4c5gU5GdQfcYGN8Z5msAEoJV9iMgQpLBerwV?=
 =?us-ascii?Q?Z66HanKaq/5DWcWyqTixOEIret3krgmBfdpYtSDDpN/ZQMfZ5acWJCJBhRiJ?=
 =?us-ascii?Q?wfoR2ZVtKTpNlE6AxCzUiGtipH4qe8EsQUTjJs1Grrr0TKaLCZ+gCQNfRCMF?=
 =?us-ascii?Q?+NLJ98CNqX3Ob0/A0lr1twO/8e1jkFtqCJn2HpYTAhlGxT3RxrXdmiHUJwVk?=
 =?us-ascii?Q?/uMrjw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8611.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351d9ecb-0ec4-4dfb-c6b1-08dc26b29810
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 01:26:07.6415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZmRcRmzH0uFkIVdaD0QZraCnCHpH1+UjQ9d+DgiyRxn/1y7KA9vU8d2C0SQ8Igks7/lvcEaBxO7C6MN+DLEQK7BcfIQ1RblJXlEwyjv8s4gHWgUnT1dhpCu7Uj7JeGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10926

> From: Robin Murphy, Sent: Tuesday, February 6, 2024 1:43 AM
>=20
> Remove the of_match_ptr() which was supposed to have gone long ago, but
> managed to got lost in a fix-squashing mishap. On a similar theme, we
> may as well also modernise the PM ops to get rid of the clunky #ifdefs,
> and modernise the resource mapping to keep the checkpatch brigade happy.
>=20
> Link: https://lore.kernel.org/linux-iommu/Yxni3d6CdI3FZ5D+@8bytes.org/
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/iommu/ipmmu-vmsa.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index ace1fc4bd34b..90d3f03242db 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -1005,7 +1005,6 @@ static const struct of_device_id ipmmu_of_ids[] =3D=
 {
>  static int ipmmu_probe(struct platform_device *pdev)
>  {
>  	struct ipmmu_vmsa_device *mmu;
> -	struct resource *res;
>  	int irq;
>  	int ret;
>=20
> @@ -1025,8 +1024,7 @@ static int ipmmu_probe(struct platform_device *pdev=
)
>  		return ret;
>=20
>  	/* Map I/O memory and request IRQ. */
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mmu->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	mmu->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mmu->base))
>  		return PTR_ERR(mmu->base);
>=20
> @@ -1123,7 +1121,6 @@ static void ipmmu_remove(struct platform_device *pd=
ev)
>  	ipmmu_device_reset(mmu);
>  }
>=20
> -#ifdef CONFIG_PM_SLEEP
>  static int ipmmu_resume_noirq(struct device *dev)
>  {
>  	struct ipmmu_vmsa_device *mmu =3D dev_get_drvdata(dev);
> @@ -1153,18 +1150,14 @@ static int ipmmu_resume_noirq(struct device *dev)
>  }
>=20
>  static const struct dev_pm_ops ipmmu_pm  =3D {
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, ipmmu_resume_noirq)
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, ipmmu_resume_noirq)
>  };
> -#define DEV_PM_OPS	&ipmmu_pm
> -#else
> -#define DEV_PM_OPS	NULL
> -#endif /* CONFIG_PM_SLEEP */
>=20
>  static struct platform_driver ipmmu_driver =3D {
>  	.driver =3D {
>  		.name =3D "ipmmu-vmsa",
> -		.of_match_table =3D of_match_ptr(ipmmu_of_ids),
> -		.pm =3D DEV_PM_OPS,
> +		.of_match_table =3D ipmmu_of_ids,
> +		.pm =3D pm_sleep_ptr(&ipmmu_pm),
>  	},
>  	.probe =3D ipmmu_probe,
>  	.remove_new =3D ipmmu_remove,
> --
> 2.39.2.101.g768bb238c484.dirty


