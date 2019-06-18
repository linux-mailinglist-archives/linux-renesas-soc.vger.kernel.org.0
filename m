Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4889349C37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 10:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbfFRImw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 04:42:52 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:50151
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728818AbfFRImw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 04:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+eSwdlkIC7qpFQOyFMKx7Dq0w6waEtEf9LSe9mmCU4=;
 b=D3lvbeA6AfMaMPIa51HBNHL/jmWoZAvzAiAPbGEYrjoVXEALW4/o3YexDXQcy6HjksIyewQVNXMLEFnxt8FLqvzUsBfVhze9/czhkmYT4TrRUTqIt1H0E/lHwsyS/0hkpMpfL6Io4HhK3diBqLN02AhXGH6OHL/996K5uNMFQpM=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2360.jpnprd01.prod.outlook.com (52.134.252.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 08:42:49 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 08:42:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Use struct assignment instead of
 memcpy()
Thread-Topic: [PATCH] usb: renesas_usbhs: Use struct assignment instead of
 memcpy()
Thread-Index: AQHVIdnT8ONsFM173E+3xy7i02MyXaag8jeAgAAlcrA=
Date:   Tue, 18 Jun 2019 08:42:48 +0000
Message-ID: <OSBPR01MB3590AB7F4A5F1C68DE7B0C93D8EA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190618055915.GA5904@kroah.com>
In-Reply-To: <20190618055915.GA5904@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75541089-69d4-4437-7596-08d6f3c8f186
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2360;
x-ms-traffictypediagnostic: OSBPR01MB2360:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB2360DBF258753CF7AE9B0564D8EA0@OSBPR01MB2360.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(99286004)(446003)(26005)(305945005)(229853002)(7696005)(3846002)(486006)(102836004)(68736007)(478600001)(14454004)(6506007)(966005)(6246003)(8936002)(6116002)(66066001)(53936002)(256004)(25786009)(4326008)(6306002)(6916009)(9686003)(74316002)(71200400001)(71190400001)(66946007)(11346002)(76176011)(186003)(81156014)(8676002)(55016002)(73956011)(52536014)(66476007)(66446008)(316002)(6436002)(54906003)(76116006)(64756008)(33656002)(5660300002)(81166006)(7736002)(86362001)(2906002)(66556008)(476003)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2360;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vfc65yqczMpGsdfQtp84TA6j8MfvzDJfX8iu4blKfUVfmg1BOLAWyHMHwUQmlfJ3z9dcVeVHe4Yb1FypacJE5Q2Yk0AHH005HvTxBsA+kPWEbEjsDDBRdpjE9ZJ0dAdQAVW9Tmc1U80yxX7y07Cac5knej3MLapkgMygg2SThvwPfVwBx4mWfYB/vEpic0p2WP/8IMIjxMcY1HLkw3oGwHdFTsGCp+LgLRMOfusYyPYLup9oqh4aqEj6bgtrxSKeccaO23zt6jPSx6XmRPmZqg+vd7K64Zms4rHiXsuV6vwUrD9v34tvpyzlT9WYNSNLuukziiJVN6wuM5Tb4xyn7E1PfhJYuQ5+kjyTYNgWx6YUXzxqT+kWCg5F+O4XM0PkbpGtXxfzW8JhGE8B+Po1ltQv9aoBJAjE3bWqawRSqKk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75541089-69d4-4437-7596-08d6f3c8f186
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 08:42:48.8854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2360
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg KH, Sent: Tuesday, June 18, 2019 2:59 PM
>=20
> On Thu, Jun 13, 2019 at 08:18:48PM +0900, Yoshihiro Shimoda wrote:
> > To avoid the error-proneness of calls to sizeof() in the memcpy,
> > this patch uses struct assignment instead of memcpy.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on Greg's linux-usb.git / usb-next branch.
> >  Note that mod_host.c also has memcpy but we cannot use struct assignme=
nt
> >  for it because the type of urb->setup_patcket is just "unsigned char *=
".
> >
> >  drivers/usb/renesas_usbhs/common.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_u=
sbhs/common.c
> > index a501ea6..ebbe322 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
> > @@ -651,9 +651,8 @@ static struct renesas_usbhs_platform_info *usbhs_pa=
rse_dt(struct device *dev)
> >  		return NULL;
> >
> >  	dparam =3D &info->driver_param;
> > -	memcpy(dparam, &data->param, sizeof(data->param));
> > -	memcpy(&info->platform_callback, data->platform_callback,
> > -	       sizeof(*data->platform_callback));
> > +	*dparam =3D data->param;
> > +	info->platform_callback =3D *data->platform_callback;
>=20
> How are the original calls here "error-prone"?

When I was developing the patch above [1], I had actually confused
about these arguments of memcpy...

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/drive=
rs/usb/renesas_usbhs?h=3Dusb-next&id=3Dbe21a02a5a5ec88b12ce535ead715d4bbb17=
3a55

I think this is because object and pointer members are mixed in these struc=
tures.
So, as I mentioned on the following email [2], I should try to simplify the=
 code
instead of this patch.

[2]
https://marc.info/?l=3Dlinux-usb&m=3D155748940717665&w=3D2

> So are you _sure_ you want this change?

I'm sorry, I would like to drop this patch.

Best regards,
Yoshihiro Shimoda

> thanks,
>=20
> greg k-h
