Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8440B3AFB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 09:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388133AbfFJHbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 03:31:43 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:44785
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387967AbfFJHbn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 03:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGJt1VTaUTvffEvomtyhnuZs9ShL45sUIb2uOhTpNTs=;
 b=BRar77VKdFfOZ7koT4DykJ1aaOcVOpk4+ANC/ggq6gZ+NbjkQd61W6eOI19hCoQVUd4MAOKi3L5dcp3eqV283TsoTfKgsMjLqH2VfgXfvwB79wqKvIJzQ1ZKquqL3v+PaIQ+BYe5zhaFkGNZPx/ZKcHBBwk3aUZyRswK2wK9G38=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4741.jpnprd01.prod.outlook.com (20.179.184.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 07:31:34 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 07:31:34 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christoph Hellwig <hch@lst.de>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5AAI1coZA=
Date:   Mon, 10 Jun 2019 07:31:34 +0000
Message-ID: <OSBPR01MB21038C8C8186797D9EC18489B8130@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f541200-8109-4679-d021-08d6ed75aa92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4741;
x-ms-traffictypediagnostic: OSBPR01MB4741:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB4741C7413819C05B152D7B0DB8130@OSBPR01MB4741.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:369;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(346002)(136003)(366004)(39860400002)(53754006)(189003)(199004)(6506007)(102836004)(14454004)(478600001)(64756008)(99286004)(45080400002)(76176011)(2906002)(186003)(66556008)(66476007)(73956011)(66946007)(76116006)(26005)(54906003)(74316002)(316002)(7696005)(7736002)(66446008)(966005)(110136005)(256004)(5024004)(14444005)(305945005)(66066001)(6246003)(486006)(86362001)(229853002)(3846002)(446003)(6436002)(6116002)(71190400001)(71200400001)(44832011)(11346002)(25786009)(4326008)(476003)(8676002)(68736007)(81156014)(6306002)(53936002)(52536014)(33656002)(8936002)(55016002)(81166006)(9686003)(5660300002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4741;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /H0xkQu6fUQPN3Pr8bE5mU0hpmQosctQDfHb/R01EIbW7dE0SVKZY2YHbEcvA/XjTYGJzmmMpAIScHysHkgBe+IPRoKTvUvGK0UupQ5MRtpodto+TR1g/uzDPyV/tDBSu5/YSQHSumKGVwChL4OEZM7nObhtB8jNyr/KiM4ZtWr77PVWSkHlr9Xe6qyo/DGJSPNeixFGpEKpdMZYoqVROkAsYUqP0WNbzrb/xD5IfkXQ2+zsFZ2hT7DS1hidRMx1Q2vag4nfr4eGW4qbqP9meMr3U9XgOjUJ+6U2pZPj+HCoUjoOIeH6+1CFfakjoayyYXAx0R6jZXJp+ETbdh6bQ5jXzDRDyPWgXb0i/yhKym7367advWsMcVjXEFuS7i51XMf1Ty0wAaq2QLAcZelPr3l9I5yGWfBYD98ED+fxKqQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f541200-8109-4679-d021-08d6ed75aa92
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 07:31:34.6439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4741
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Any update on the below issue. I am seeing similar issue on RZ/G2M board wi=
th Linux version 5.2.0-rc3.

root@hihope-rz-g2m:~# [   35.414177] usb 2-1: new SuperSpeed Gen 1 USB devi=
ce number 2 using xhci-hcd
[   35.449402] usb-storage 2-1:1.0: USB Mass Storage device detected
[   35.455915] scsi host0: usb-storage 2-1:1.0
[   36.482585] scsi 0:0:0:0: Direct-Access     SanDisk  Extreme          00=
01 PQ: 0 ANSI: 6
[   36.491260] sd 0:0:0:0: [sda] 125045424 512-byte logical blocks: (64.0 G=
B/59.6 GiB)
[   36.499823] sd 0:0:0:0: [sda] Write Protect is off
[   36.505474] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[   36.518074]  sda: sda1
[   36.523163] sd 0:0:0:0: [sda] Attached SCSI disk

root@hihope-rz-g2m:~# mkdir -p /tmp/rmnt/sda1
root@hihope-rz-g2m:~# mount -t auto /dev/sda1 /tmp/rmnt/sda1
root@hihope-rz-g2m:~# dd if=3D/dev/urandom of=3D/tmp/sda1-random bs=3D1024 =
count=3D10240
10240+0 records in
10240+0 records out
10485760 bytes (10 MB, 10 MiB) copied, 0.187696 s, 55.9 MB/s
root@hihope-rz-g2m:~# cp /tmp/sda1-random /tmp/rmnt/sda1/sda1-random
root@hihope-rz-g2m:~# [  218.861212] xhci-hcd ee000000.usb: swiotlb buffer =
is full (sz: 1003520 bytes), total 32768 (slots), used 1088 (slots)
[  218.871885] xhci-hcd ee000000.usb: overflow 0x000000067430b000+1003520 o=
f DMA mask ffffffff bus mask 0
[  218.881233] WARNING: CPU: 0 PID: 258 at kernel/dma/direct.c:43 report_ad=
dr+0x38/0xa8
[  218.888974] Modules linked in: renesas_usb3 usb_dmac phy_rcar_gen3_usb3
[  218.895594] CPU: 0 PID: 258 Comm: usb-storage Not tainted 5.2.0-rc3-0001=
7-gc80b083-dirty #5
[  218.903940] Hardware name: HopeRun HiHope RZ/G2M with sub board (DT)
[  218.910291] pstate: 40000005 (nZcv daif -PAN -UAO)
[  218.915078] pc : report_addr+0x38/0xa8
[  218.918821] lr : report_addr+0xa0/0xa8
[  218.922564] sp : ffff0000125fb970
[  218.925872] x29: ffff0000125fb970 x28: 0000000000000000
[  218.931180] x27: 0000000000000000 x26: 000000001f020280
[  218.936487] x25: ffff8006394a82a8 x24: 0000000000000000
[  218.941794] x23: 0000000000000001 x22: 0000000000000000
[  218.947101] x21: 00000000000f5000 x20: ffff000011309000
[  218.952408] x19: ffff80063a600010 x18: ffffffffffffffff
[  218.957714] x17: 0000000000000000 x16: 0000000000000000
[  218.963023] x15: ffff0000113096c8 x14: 4d4420666f203032
[  218.968331] x13: 35333030312b3030 x12: 3062303334373630
[  218.973638] x11: 3030303030307830 x10: ffff000011309f20
[  218.978945] x9 : ffff0000112e3018 x8 : 0000000000000123
[  218.984252] x7 : 0000000000000005 x6 : ffff80063b578180
[  218.989559] x5 : ffff80063b578180 x4 : 0000000000000000
[  218.994865] x3 : ffff80063b57ef10 x2 : eed25f279b69f300
[  219.000172] x1 : eed25f279b69f300 x0 : 0000000000000000
[  219.005481] Call trace:
[  219.007923]  report_addr+0x38/0xa8
[  219.011321]  dma_direct_map_page+0x148/0x158
[  219.015586]  dma_direct_map_sg+0x78/0xe0
[  219.019510]  usb_hcd_map_urb_for_dma+0x2fc/0x468
[  219.024124]  xhci_map_urb_for_dma+0x54/0x68
[  219.028303]  usb_hcd_submit_urb+0x88/0x968
[  219.032394]  usb_submit_urb+0x3b0/0x570
[  219.036226]  usb_sg_wait+0x98/0x158
[  219.039711]  usb_stor_bulk_transfer_sglist.part.3+0x94/0x128
[  219.045366]  usb_stor_bulk_srb+0x48/0x88
[  219.049283]  usb_stor_Bulk_transport+0x10c/0x390
[  219.053896]  usb_stor_invoke_transport+0x3c/0x500
[  219.058595]  usb_stor_transparent_scsi_command+0xc/0x18
[  219.063816]  usb_stor_control_thread+0x1c4/0x260
[  219.068431]  kthread+0x124/0x128
[  219.071660]  ret_from_fork+0x10/0x18
[  219.075229] ---[ end trace dd9ef2a6b7fef860 ]---
[  219.080087] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.090810] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.101510] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.112209] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.122901] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.133591] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.144283] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.154973] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  219.165674] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.861717] swiotlb_tbl_map_single: 67451 callbacks suppressed
[  223.861721] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.878249] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.888940] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.899630] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.910318] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.921005] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.931695] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.942387] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.953077] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  223.963765] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.865664] swiotlb_tbl_map_single: 70409 callbacks suppressed
[  228.865668] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.882188] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.892878] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.903567] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.914256] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.924944] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.935636] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.946326] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.957015] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)
[  228.967705] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 1003520 b=
ytes), total 32768 (slots), used 1088 (slots)

Regards,
Biju

> Subject: RE: How to resolve an issue in swiotlb environment?
>=20
> Hi Christoph,
>=20
> I think we should continue to discuss on this email thread instead of the=
 fixed
> DMA-API.txt patch [1]
>=20
> [1]
> https://marc.info/?t=3D155989412200001&r=3D1&w=3D2
>=20
> > From: Yoshihiro Shimoda, Sent: Monday, June 3, 2019 3:42 PM
> >
> > Hi linux-block and iommu mailing lists,
> >
> > I have an issue that a USB SSD with xHCI on R-Car H3 causes "swiotlb is=
 full"
> like below.
> >
> >     [   36.745286] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 5=
24288
> bytes), total 32768 (slots), used 1338 (slots)
> >
> > I have investigated this issue by using git bisect, and then I found th=
e
> following commit:
> >
> > ---
> > commit 09324d32d2a0843e66652a087da6f77924358e62
> > Author: Christoph Hellwig <hch@lst.de>
> > Date:   Tue May 21 09:01:41 2019 +0200
> >
> >     block: force an unlimited segment size on queues with a virt
> > boundary
> > ---
>=20
> Thank you for your comment on other email thread [2] like below:
> ---
> Turns out it isn't as simple as I thought, as there doesn't seem to be an=
 easy
> way to get to the struct device used for DMA mapping from USB drivers.  I=
'll
> need to think a bit more how to handle that best.
> ---
>=20
> [2]
> https://marc.info/?l=3Dlinux-doc&m=3D155989651620473&w=3D2
>=20
> I'm not sure this is a correct way, but the issue disappears if I applied=
 a patch
> below to USB storage driver. Especially, WARNING happened on
> blk_queue_max_segment_size().
> Maybe we need to expand the argument "struct device *" of
> blk_queue_virt_boundary() to call dma_max_mapping_size()?
> ---
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglu=
e.c
> index 59190d8..fa37b39 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -28,6 +28,7 @@
>   * status of a command.
>   */
>=20
> +#include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>=20
> @@ -83,6 +84,15 @@ static int slave_alloc (struct scsi_device *sdev)
>  	maxp =3D usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
>  	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
>=20
> +{
> +	struct device *dev =3D us->pusb_dev->bus->controller;
> +
> +	dev_info(dev, "%s: size =3D %zu\n", __func__,
> dma_max_mapping_size(dev));
> +	blk_queue_max_segment_size(sdev->request_queue,
> +				   dma_max_mapping_size(dev));
> +}
> +
> +
>  	/*
>  	 * Some host controllers may have alignment requirements.
>  	 * We'll play it safe by requiring 512-byte alignment always.
> ---
>=20
> Best regards,
> Yoshihiro Shimoda

