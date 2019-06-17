Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4002247A5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 09:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfFQHCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 03:02:51 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:6116
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbfFQHCv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 03:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVHS4yiT2U6go1UBNQaZ+k5VklIwGp5aS1wuP54lQfA=;
 b=gbtumdy6N7BscWpm9/Q6+E4yYH0DlPcDC9Ljroj/VPp+9FHn2GdsGqHO92b+zjnz6X+begYDB6djhfolUVBuvlGc1UdW3hbOGr1LUhg26PnWBf4FQycFQHf63M3fBSn9aab6IkL1WK+I3n4z1JUxjd6Dfq7GGekO5u1rIqEQayU=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3416.jpnprd01.prod.outlook.com (20.178.99.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Mon, 17 Jun 2019 07:02:47 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 07:02:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
 merge the segments
Thread-Topic: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
 merge the segments
Thread-Index: AQHVIdGmGPEUTZUzykuLpLo4YRSl9aaawOiAgASqhHCAAAOwgIAAAZyA
Date:   Mon, 17 Jun 2019 07:02:47 +0000
Message-ID: <OSBPR01MB3590289F07A53A33296BC9D6D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190614072459.GD8420@lst.de>
 <OSBPR01MB3590FA5DB10D9EF34F551335D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20190617065331.GA5456@lst.de>
In-Reply-To: <20190617065331.GA5456@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd3dfd7e-a31b-4ca6-e01f-08d6f2f1ce10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3416;
x-ms-traffictypediagnostic: OSBPR01MB3416:
x-microsoft-antispam-prvs: <OSBPR01MB34160D1EC798A007E26E5A7BD8EB0@OSBPR01MB3416.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(71190400001)(6916009)(256004)(6506007)(14444005)(99286004)(6246003)(446003)(11346002)(486006)(6116002)(3846002)(229853002)(8676002)(26005)(186003)(5660300002)(4326008)(14454004)(478600001)(7696005)(66446008)(76116006)(8936002)(66476007)(64756008)(86362001)(81166006)(476003)(52536014)(102836004)(81156014)(76176011)(33656002)(305945005)(74316002)(66946007)(66556008)(73956011)(7736002)(66066001)(6436002)(68736007)(54906003)(2906002)(55016002)(53936002)(9686003)(316002)(25786009)(71200400001)(135533001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3416;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hZEeNn0r82K2/sq1Qepz97jORcVmvfnYVJIDZoD3sAObh1lJf9ZAV0tWQfktnOKJbBApY4g1B0EdRTI6G6BXvXkfIGObWdbRq/qiDvf9fbMmpsCRuL7+kjgJ+bEuqHTjh083K53jMRyEjRtFwGr6AxmSIPXTzuFZIOK5ddNXUPr42ndDfxKNlIVXbQ75AsZDMakfZvOK3zyfInbxqkuLZB7kawhdFE9mrmEBFi9gr0d4jcm3xy92Z1Imkw1pzvSeJIRHY8mHZWmTxDPD6QI/hkCRnXLei09zlKMQXBB+V0eIpAEuO/giTWXgQi0/O1VtWg9k5JfyetBxfJgIyXtQ3Ik5+ozSwTqD3a8HYDgOtDAzhpuEMHb2vUThXu8uM5iMx/amI8Mi6Yldmbn6CjUr5I3IO4X76ZEWRvtlgLCAjdI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3dfd7e-a31b-4ca6-e01f-08d6f2f1ce10
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 07:02:47.6107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3416
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:54 PM
>=20
> On Mon, Jun 17, 2019 at 06:46:33AM +0000, Yoshihiro Shimoda wrote:
> > > can_merge seems a little too generic a name to me.  Maybe can_iommu_m=
erge?
> >
> > I'll fix the name. Also, only the device_iommu_mapped() condition wiil =
cause
> > a problem on iommu=3Dpt [1]. So, I'll add another condition here.
>=20
> Instead of adding another condition here I think we need to properly
> abstract it out in the DMA layer.  E.g. have a

Thank you for your comment and sample code! I'll add such functions
on next patch series.

Best regards,
Yoshihiro Shimoda

> unsigned long dma_get_merge_boundary(struct device *dev)
> {
> 	const struct dma_map_ops *ops =3D get_dma_ops(dev);
>=20
> 	if (!ops || !ops->get_merge_boundary)
> 		return 0; /* can't merge */
> 	return ops->get_merge_boundary(dev);
> }
>=20
> and then implement the method in dma-iommu.c.
>=20
> blk_queue_can_use_iommu_merging then comes:
>=20
> bool blk_queue_enable_iommu_merging(struct request_queue *q,
> 		struct device *dev)
> {
> 	unsigned long boundary =3D dma_get_merge_boundary(dev);
>=20
> 	if (!boundary)
> 		return false;
> 	blk_queue_virt_boundary(q, boundary);
> 	return true;
> }
