Return-Path: <linux-renesas-soc+bounces-2925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B10859202
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Feb 2024 20:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170EE2814A6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Feb 2024 19:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F22C7CF1A;
	Sat, 17 Feb 2024 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qz4VdOTD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2065.outbound.protection.outlook.com [40.107.114.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C231E863
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Feb 2024 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708197567; cv=fail; b=kM1KBrJJkF4dxLlJUrTZJP75Fe/bMspOl4sqQsyqdWH5fjg+q9aXdf4BWSEznHd2xThB33coZhgQ3xd4Lj4IQPbv/NxI93EuKFcdYqLzpqN6cDbVpL7aG1f+l2DL+H+f4tOrM9aed2EbSmxSG8uS8eRakvK3maXYyXLtRJ3ejNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708197567; c=relaxed/simple;
	bh=/0VcSqI/EU21HYyHYcvBZ3smfthMwrDz+zlZkth8WNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n+8yaizGt9J10pdV34VCx3IFnrKWT+Cb8dqituUUdOvXUAzYklwOJpsYtyJKDYsXtUqLdJuIizMtSgoiDqdUpVCZIvaeGsYJjwevx9DC6qsdpNXS9Uc+Iw6TF7+HFOQv16k2CH1wn5+kVh3pSHNc0ZsdxN31JtVD22oUOsGLcCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qz4VdOTD; arc=fail smtp.client-ip=40.107.114.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHoonU2+Io/2stpTsDWa3V9SBJyZLnf9iT6Wcl7qt5x3Q49Ft8PEcwQDj/Q2KDwpCrnH0dlbAq0HdYyCKBv+Rztn86xnJUn3PnNrgkynkZfjxH6WfRSHtPhCbSWU0YVvlRDvDxTiGgMpdKfWEmND6UZp42fGoiU7ndeuPDjJpbpHv4G0EBZz1AJrUyM4k8s7tpRQc1YJbbgKQ67d6eEWfcn/F8VC3z3qkF7zmnH7TWWcUSC+8GDrWoM23kRaFfR30N0enNh8DgHsHCp80n8ClFB/fXyyVvZgRZiBs2FXgcblJ1uhu9PCh2GYpnMM8qdjeb1C5+yY1sox/ohPE4oxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL4EBajyycmipeMgTe2iCcTbOo/erv7ky1/kINRMgyA=;
 b=KcQLBpj4tk5pF89JpSj6kNbfzBHNJVEDFWEMvav81zzpppc8FX1PRXP/5RxQtV3D8iF/zkOO6TjdYW/QukBKi0Ph1V3UxQQqFzKlKQ34ttKXcSQrbcnImAO2TuVg+lZhTYh6JnoL5j9ogLnHnGW6ikmBiYEuGcNzYARy+NKVuy0qPJn0tFP+84tlG73PMo5JUGaeAA3rSn48DPn//AAAoVeSM/89eb7RB3Ysi63Ylg+nClk0TBsor3Cjgiom+W6kX2DL9n+2sl56Zdd+BVvU073CEO3lHLG0TcO4lW0lYUd2JEWDZmOb48YnSC8N+GKgY7B8N8cjzJQ4BWWHzPdlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL4EBajyycmipeMgTe2iCcTbOo/erv7ky1/kINRMgyA=;
 b=qz4VdOTDTN4+pPmwYp1FTuBWjtZWgk9aoOsR2cgnhpcFKN4pb/fgUjVLBwAueQl5an/mj1BW6t47CSH9PDDHZ7vNfuWU7zUPJ4Gj1XRHqZk9q0UI6iKYyk6UjDUIim7ysOwtXHc4kh0jSg9K2IoY2XbZ6TMnVVgl2o8VWcrOTrY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSYPR01MB5302.jpnprd01.prod.outlook.com
 (2603:1096:604:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Sat, 17 Feb
 2024 19:19:19 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Sat, 17 Feb 2024
 19:19:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v16 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v16 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaTVIgJURFg8KuAEuP5V47ga7MJ7ECOK8AgAzYqaA=
Date: Sat, 17 Feb 2024 19:19:19 +0000
Message-ID:
 <TYCPR01MB11269DD08084D820CFDFD6C7286532@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
 <20240122164257.56326-4-biju.das.jz@bp.renesas.com>
 <ksm44nhkamq3gdbykn3o3d7xobvhepm44gnwjhtw3xaygvgsn4@5tq7hatvbrd4>
In-Reply-To: <ksm44nhkamq3gdbykn3o3d7xobvhepm44gnwjhtw3xaygvgsn4@5tq7hatvbrd4>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSYPR01MB5302:EE_
x-ms-office365-filtering-correlation-id: 871bbc4d-58f2-490b-0213-08dc2fed5729
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 80f3t+PbwjRrmEuRgn/3op0/1TQleZbeZESlpcHuhroaQG1/6Ba4GEb7SwPqA1UDZZneyyfOiQPOpFFjSzAEbR3uY8bzt83BqNU3QkF1IoSlyk245NkFJAOpYrRQe6AQRNQObStOoUOQK3JDb6rFc+wfY8NWXxiZ9cxBTBtjV6vr83BAMBMegrnNmXJBgiqWZELR3ft8HdT9QfX5DA8Ue4ixzFhb0DAAEgv+IG80pylGvHKAlmxpX9MAOOY2ykWMMuGaPbiBLo/AYQgNP2OhBBk5njf/7YUDOm6Ui3PEmcIEycWNJFyKcW0p4w/ezCbs5IHSYcISZYI0wLTIoFpIEBcvV8pJRqZNpruwnQcUa2usXxKdrTSNhX9D1apEbmrsf3e4Wlv4R3GRypur4ir/aIMhmJP0nmUWHzEYEgGYgGBKJDWD0WQfuxG3/mhvj+MqyODWih4SHfl8aEgfurk+CdOVkVkbHwVGouFVd2Ph3myHzNVDfma8cfG+1fgr9O8Zsk5U+Z7j6uf+/wB4xYoGAxFb3Xe1hapHQvyso4T2RPI91p4KjQtZAQzPLOi8KGVmPIn2EM2OrvRP2hoXsDGwZv984L2uVp2zxsZA8s5zciGz83RK3bC33LoSWBYsPkHc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(26005)(41300700001)(83380400001)(66946007)(8936002)(52536014)(8676002)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(316002)(478600001)(53546011)(55236004)(9686003)(71200400001)(54906003)(6506007)(7696005)(33656002)(122000001)(38100700002)(86362001)(2906002)(7416002)(5660300002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Efg1QGXpxyzFLbrFuN05X3KrGZPmGD957zcldi903KRW9D2b+Fvv3OnyHSih?=
 =?us-ascii?Q?ztop0Y/hivvM0n9hbtxElRHVNzAyXKY+z7RAPsoL/lXwNqvU64NKeUfO7lVX?=
 =?us-ascii?Q?Lh0u1jqphy8GyK9kW/GtrkC6gOvggxZPUsCzS1BsO6/atkHh2iPoldQK66l6?=
 =?us-ascii?Q?6RRkAj38cWJQ9qsOj4pCjNmBP9U6PxvTU14Rt7UDYWODnYJYYt/wxJARr9EA?=
 =?us-ascii?Q?eFAqXrqfLlRP+GTIBsSWHNvZAUs/8xyVsVgSmU4gj4LG7XUpVEJB67vYhbdZ?=
 =?us-ascii?Q?Ctk9oqEOzr0j9xOPw/QSbcCFS1EVL/ugrS2Tjnw0fMqxlihaRf44pliFKAq1?=
 =?us-ascii?Q?YL4tLER//OlT9IjbCFmpkuSi1FQFPX5VU766UcwlMLMvvgvD4CKCqdz0HRpe?=
 =?us-ascii?Q?+TP0zjVLlF6F/cdX8bN/uqRWpqA5JwALoVfU42z1yONLww/bZmdq5sGfxXcg?=
 =?us-ascii?Q?q4inMGyjfbUA6mZ7WtFqu3LYs8Zu5pfG81crxmjAvYCRS3b1gpRwo4+7N8EI?=
 =?us-ascii?Q?BtpWoixImP7H/TkNL09d2KirSt4mTyaqbPzd5Kd0YaVt8qtnIB9R7R4qjQdb?=
 =?us-ascii?Q?tBcAAG7iBoGmol64HsoWR/iGeObMpm4E2nRrYtg3//irNwzQZlg7K/bUY+Xh?=
 =?us-ascii?Q?T0X86oVuY7P2TBKA7Dx7HMLbJM3Ats/2dPlzexYkbmzAnhr/R2KW6NRtSNqp?=
 =?us-ascii?Q?OeKGOFIHWP7jbhU+6GjecBdW1I8GrxnmHIC9glTnihrq0AJ/zSsCXA0WFi1s?=
 =?us-ascii?Q?fZ7RLHIGiWtErT23hp4An4X9+YL3J1LprQPPnIsNZs0UxVITswNTZIiMlp0r?=
 =?us-ascii?Q?q5f3fJFzLKxSYxeMxV2OQeIXi6k2rf29h+OKhZ/+JcREhUReptnyA9SjZeby?=
 =?us-ascii?Q?Bjqxy00D/WwLBbTYs3D+ouG0HLGKdsCO2z+l2bNU/ctSs9zf1HxD1Wk0n8QJ?=
 =?us-ascii?Q?xCno85uxoyYyRP0vbb2R2UoB7pqZzSlxzxX2kBPe1RKAE5GK3r9a6ijjAF1N?=
 =?us-ascii?Q?bVPBq8iqvRXfIddkfwTzH1ev6x1iiimue3KTMOLpH1ZlEj/GsKDE7ulKdH0B?=
 =?us-ascii?Q?OFyLqAk2vXEBl1GdqvTbXvKvRIriJ8jOlCoX8xF7QUADkssNuLXKmmg6u24T?=
 =?us-ascii?Q?jQhnwi2c8QVAIxU/pHqmi8eeooO7rxLRYjFNDSeETCxNdvxlYpJgnSVikB85?=
 =?us-ascii?Q?xWnI2msoc7gqnFITAFuKPcgLlwOyqSHS68hIXG9+BTMgBjbrrJRp8VdtxoRh?=
 =?us-ascii?Q?YnvuDauwK7c4JF+Z785FuX++oiIlvk6/wQXwZN9OrmEPTNuJWtM8lrkHufI2?=
 =?us-ascii?Q?l0iHiZ/WE3jwlBEfeG7yNUjJFNdVYhqrJAiKJyhNuXxn9NZzoSr0kC3vDoTb?=
 =?us-ascii?Q?XO/CQVte1KKdT3AmaXkxmu+myj0CARMD+wUTL6rgTC5zvj+jsn9f+BJ4Sm3m?=
 =?us-ascii?Q?PbQhoKznZ3VMMJ8s/NydZsJTgzZloxeH8xXXB50s3r/Qmssppwv1+EoAwfs9?=
 =?us-ascii?Q?84ai4Zx8TfbOGnCVHuhUDVj5ucTISMfmUbKDNIGG7K/wSo7qXpbWsrAf84r2?=
 =?us-ascii?Q?m4EPmpt1CU0TO2XYGXjH04Nt+SVMWklcrYJxZNlGiLC+FCqqfQ6kNVZfoVDT?=
 =?us-ascii?Q?Tg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871bbc4d-58f2-490b-0213-08dc2fed5729
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2024 19:19:19.5720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEwkJA0pZm40z1fC1PI2crp6pqYE6BTaHGbJdpTcbBxr0zNGgGSJC2afWQuYfP9dnCi2Khycj9VDHKgxEYuliVE/IILv0ej8h9seYUJrgJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5302

Hi Maxime Ripard,

Thanks for the feedback.

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Friday, February 9, 2024 3:07 PM
> Subject: Re: [PATCH v16 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Mon, Jan 22, 2024 at 04:42:55PM +0000, Biju Das wrote:
> > +static const struct drm_gem_object_funcs rzg2l_du_gem_funcs =3D {
> > +	.free =3D drm_gem_dma_object_free,
> > +	.print_info =3D drm_gem_dma_object_print_info,
> > +	.get_sg_table =3D drm_gem_dma_object_get_sg_table,
> > +	.vmap =3D drm_gem_dma_object_vmap,
> > +	.mmap =3D drm_gem_dma_object_mmap,
> > +	.vm_ops =3D &drm_gem_dma_vm_ops,
> > +};
> > +
> > +struct drm_gem_object *
> > +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> > +				   struct dma_buf_attachment *attach,
> > +				   struct sg_table *sgt)
> > +{
> > +	struct drm_gem_dma_object *dma_obj;
> > +	struct drm_gem_object *gem_obj;
> > +	int ret;
> > +
> > +	/* Create a DMA GEM buffer. */
> > +	dma_obj =3D kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> > +	if (!dma_obj)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	gem_obj =3D &dma_obj->base;
> > +	gem_obj->funcs =3D &rzg2l_du_gem_funcs;
> > +
> > +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> > +	dma_obj->map_noncoherent =3D false;
> > +
> > +	ret =3D drm_gem_create_mmap_offset(gem_obj);
> > +	if (ret) {
> > +		drm_gem_object_release(gem_obj);
> > +		kfree(dma_obj);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	dma_obj->dma_addr =3D 0;
> > +	dma_obj->sgt =3D sgt;
> > +
> > +	return gem_obj;
> > +}
>=20
> It looks like you're just reusing the helpers there, why do you need to
> declare a new import_sg_table implementation?

It is not needed. I will remove it in the next version.

Cheers,
Biju

