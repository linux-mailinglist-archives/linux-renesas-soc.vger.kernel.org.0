Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33835F6B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2019 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfGDKhW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jul 2019 06:37:22 -0400
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:33616
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727385AbfGDKhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jul 2019 06:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW/XrGflnLpiE+GcowS+8JkARY0qQ0lkKnPqgJfgc1s=;
 b=Skn/kjQ/DWrAsQUfbWJShvJAlzdTuAADf0UAJfGFsrWsQqBdWEg6mltHlRw3bpJAPMzjNieje65B2KGVYz9yB9acFT7yq7JrDqOFCBu2nvsYXdYYPXwhPmr7L4QGgh5BAhFBCTQGLaFKgZfCrnYbQ9kUXnC0fcoE+lgQS/msev4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB3072.jpnprd01.prod.outlook.com (20.177.105.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 10:37:19 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6999:a5c2:83ef:18bb]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6999:a5c2:83ef:18bb%6]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 10:37:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
CC:     shuah <shuah@kernel.org>, Suwan Kim <suwan.kim027@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Topic: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Index: AQHVIcuW138W6xs/SU+mBATKJYat56aZ0SQAgAABRQCAAAL1gIAFZkqggAAqzACAF8/kEIAASseAgADLi2CAAMSFAIABU2HA
Date:   Thu, 4 Jul 2019 10:37:19 +0000
Message-ID: <TYAPR01MB4544D30CE40795E07BB44CC0D8FA0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB454441748DB5CBCDFCF207D3D8FB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.1907031015140.1547-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1907031015140.1547-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47fb9a85-e26b-4b25-a94b-08d7006b9768
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3072;
x-ms-traffictypediagnostic: TYAPR01MB3072:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB3072BDC5789806CC5785FC5FD8FA0@TYAPR01MB3072.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(43544003)(199004)(189003)(53936002)(55016002)(66556008)(66946007)(6436002)(66476007)(64756008)(6246003)(86362001)(2171002)(9686003)(8936002)(73956011)(2906002)(476003)(11346002)(5660300002)(25786009)(76116006)(229853002)(186003)(316002)(33656002)(54906003)(446003)(102836004)(6306002)(71200400001)(66446008)(52536014)(26005)(486006)(110136005)(4326008)(81166006)(76176011)(66066001)(71190400001)(966005)(99286004)(478600001)(6506007)(256004)(7696005)(81156014)(14444005)(6116002)(3846002)(8676002)(14454004)(68736007)(74316002)(305945005)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3072;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MXqPfpaGXn9gQN82DiE/8RYmNOIh0CEx5mMHLTBDOAQwmIp0EeKjFnOQ0MXa+B8AuUaVwrK6kfw921eOYImbx8KlQb+R9+t8e4RpSKINdqpVwV/cYqg/pyj167teONFSl5VXqOFVfr3wNIiSYhwJ5HSSx9VRRYPbXRo9xHBlb6+zgfbaRLZlvqxacDBR19poSBmecJL38dYen68Bz5NEqHfkR/JMKQVkTfPg2Ae55j53NQDYvR14s/x/4NBOUFpVq+4PKI2JYyr8RjnI3xaYOgkCqp1sGxD4xTDQZxO+kiBGJxgU+9MqxcAXCOvSYff4F6sTj2z08gz5GfesaopQTPo6Rl4fJC3PZGp//ysnCKGsmrwY7yuddt33Jyz4CSeHPHLuPjEBOuvJ6BrptKZUq03HWALEIOdjMx/UqxHgrvc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fb9a85-e26b-4b25-a94b-08d7006b9768
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 10:37:19.6354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3072
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Wednesday, July 3, 2019 11:20 PM
>=20
> On Wed, 3 Jul 2019, Yoshihiro Shimoda wrote:
<snip>
> > IIUC, usb-storage driver should take care of calling blk_queue_ APIs an=
yway because:
> >
> >  - As Christoph mentioned before on the email [1], usb-storage has a sp=
ecial
> >    max_sectors quirk for tape and SuperSpeed devices.
> >  - Since blk_queue_* APIs don't take device structure pointer, the bloc=
k layer
> >    cannot call any DMA mapping APIs. So, even if any other DMA fields a=
re copied,
> >    the behavior is not changed.
>=20
> Although the blk_queue_* APIs don't take device structure pointers, the
> SCSI layer does know about devices.  And since it is the SCSI layer
> which creates the request queue, changing the DMA fields should change
> the behavior.
>=20
> However, you are correct that usb-storage has to call the blk_queue_*
> APIs anyway.  So I guess your patch is the right thing to do after all.
>=20
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Thank you very much for your Acked-by!

Greg, if possible, would you merge this patch into v5.2?

Best regards,
Yoshihiro Shimoda

> I still think that copying the DMA fields would be a good idea, though.
>=20
> Alan Stern
>=20
> > [1]
> > https://www.spinics.net/lists/linux-usb/msg181527.html
> >
> > What do you think?
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
> > > So what I would like to see is a new subroutine -- perhaps in the
> > > driver core -- that copies the DMA fields from one struct device to
> > > another.  Then we could call this subroutine in usb_alloc_dev() and
> > > usb_set_configuration() instead of copying the information manually.
> > >
> > > Greg and Christoph, does that make sense?
> > >
> > > Yoshihiro, would you like to write a patch that does this?
> > >
> > > Alan Stern

