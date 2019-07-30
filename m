Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1897A59D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 12:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbfG3KIi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 06:08:38 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:60838
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725209AbfG3KIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 06:08:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvSo+FIkhfgAuj5FdJPaK0V+C14n+t2+97rE8KJjZWp7LlbMZfwTYEBKN9rMnhO3sqjPGVNW7QWHehYtv+zk2Epx1Bnu2HySsLMFIdA7WzYR8EL0ZNu0qfvDIocHgOTO30N5cGmq2QKYOufdfprZxKIz+PV5ZYJ/HC2SUL7N/s8Raf/oimHpvmQ1Pj8wp1XXACOOqIbrTbKgVYB9EaWDeS5a/o15yyEhp2sQQUNvA4fiOrL3GaGTAGtk5VZHRGLb7x8U1Wa4af76tjaTyO/In7mqc40l9eIOMP6szvsaYdQhqcduYZPKfVBZs5E2XfMKES3rljApL51zI7N3j+OBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbgu0PI91ltAo6HxUBuE97qC3e0MpxVX79ORQ3Rb3+M=;
 b=jmRxNXEyQPUtuyS3Fkb+GJzGaa0g2i368HVsbec3lE360R45LHT9f1q+do+fLJ6+Oqsp/O87z7b9T4JeF4fY4liHugExzjq1kq5nxFOQeDR3dK/CSfXdNBO54a2novboD4C/6NrbuohjgxxoY5tjkRWJ3Gi5lwyBTuT/jQogwq/htZWJQ68t9Xf0IyvMZsU5CjxmsFsjaoQ2OjXnOgKlCfx+iqwkwKnvh6vaIRLWoAAPWf1YsEeNONKWwaiqRmjFobLGrvxjCbaZ2O0DGNCkIywb+lW95r4E6t2ufeK5RXd3XMIMQlDp96HbYmkfKR7nN4omSDAVDNK9R/dbRbH3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbgu0PI91ltAo6HxUBuE97qC3e0MpxVX79ORQ3Rb3+M=;
 b=e/H1HxdwVo6xLH39MSDdukdBdJqbBmVTrnE9BoOnavv8fLKdi02mfd8jlWaAlW0KX2JdLYblje8I9CMYl6RiE7dIrJ1BFkQlExYScZSun6uDzEqxVCJGj9I2hg4aC+o5KfMPSkSuijRa2+lrv3FyyyUPOjFRrXIAkxRm/SBUgUc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB3005.jpnprd01.prod.outlook.com (20.177.104.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 10:08:33 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9%5]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 10:08:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Pavel Machek <pavel@denx.de>, "kishon@ti.com" <kishon@ti.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>
Subject: RE: phy-rcar-gen3-usb2: wrong parsing of role in role_store?
Thread-Topic: phy-rcar-gen3-usb2: wrong parsing of role in role_store?
Thread-Index: AQHVRrxnhCIU7kKBPE63JOTOwtV/Qqbi73Kw
Date:   Tue, 30 Jul 2019 10:08:33 +0000
Message-ID: <TYAPR01MB4544F1EE39C3A9F36B13D49AD8DC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190730095140.GA29609@amd>
In-Reply-To: <20190730095140.GA29609@amd>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d67491a7-553a-46c5-c9d8-08d714d5e153
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3005;
x-ms-traffictypediagnostic: TYAPR01MB3005:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TYAPR01MB30058CEA3EEA12CBC537CF8FD8DC0@TYAPR01MB3005.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(33656002)(52536014)(486006)(256004)(11346002)(446003)(6246003)(5660300002)(4326008)(110136005)(71200400001)(66946007)(476003)(71190400001)(76116006)(316002)(14454004)(966005)(25786009)(64756008)(478600001)(66446008)(66476007)(66556008)(6436002)(55016002)(6306002)(3846002)(6116002)(2906002)(2501003)(9686003)(229853002)(68736007)(81166006)(66066001)(7736002)(86362001)(102836004)(74316002)(6506007)(305945005)(8676002)(76176011)(53936002)(81156014)(186003)(8936002)(2201001)(26005)(7696005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3005;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e67/J/XFtw/iNqinxggdRoKkf6fbQYa/VQLi8fZM7MGpGD3fDFFMP61AdnGcKvGdLx9UyTykU/8+x5PrPhEtaofSmC6luY3+SUp1NsgZvi0J8bVR1fVtNGXEyKgzdsQeQPYC72zGIfqxafWI/ceZzV2PKzDiXoruiF1OilM2uCMtx93d4yXdrVhYeBFmpoEzFWUTXK9PMJkH1FD4FVZhcb0q/1tO5/v0SORAEeneG08nNEYLYZjy6gQ8ORaPviUiA9ETi7Gtf6rq9pI2QT9RoOE8aL2Ibcpe7rjl29AJHfmEvLQIPSJMsYKgWhKC/4Bk7H1qFuxQanveA7sbuuS/+Phi2ubNkwSKoBdgZXqy4c8Pxkw54m8pgRAKmK4n16n9pNJRyuKg4FNAtpaxr4SLrduRbZwS/1L+wHOMbGojzYI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67491a7-553a-46c5-c9d8-08d714d5e153
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 10:08:33.5509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3005
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

> From: Pavel Machek, Sent: Tuesday, July 30, 2019 6:52 PM
>=20
> Hi!
>=20
> Code does strcmps, but does not actually check count. So AFAICT
> writing "host-I-don't-want-I-need-peripheral" into the file will
> succeed and turn it into host mode.
>=20
> Also data beyond count in buf are going to be accessed.

Thank you for the report. I think the driver should use sysfs_streq() helpe=
r
instead of strncmp() on the sysfs function. So, I'll submit such a patch la=
ter.

Best regards,
Yoshihiro Shimoda

> Best regards,
> 								Pavel
>=20
> static ssize_t role_store(struct device *dev, struct device_attribute *at=
tr,
>                           const char *buf, size_t count)
> {
>         struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
>         bool is_b_device;
>         enum phy_mode cur_mode, new_mode;
>=20
>         if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch)=
)
>                 return -EIO;
>=20
>         /* FIXME, this is wrong */
>         if (!strncmp(buf, "host", strlen("host")))
>                 new_mode =3D PHY_MODE_USB_HOST;
>         else if (!strncmp(buf, "peripheral", strlen("peripheral")))
>                 new_mode =3D PHY_MODE_USB_DEVICE;
>         else
>                 return -EINVAL;
>=20
>=20
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
