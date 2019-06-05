Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3BD35699
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFEGHo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:07:44 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:47403
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726086AbfFEGHo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjOcv5/zvt9mq2ETRuOKLF07VLH5j1bXumYv0ZJUrpI=;
 b=q9P9YyeaKPNMRv2Xf9sb47X1rPVFWYmJSSGSJ7BcojmLOaxiAPlyElerriH6XAY9Dfeiw1GlqI95idrNAmas8H/57Hjbc2Vrsa80QJyDKZYWaG4VV+8HVJsruxZLMf8jSUOr3g9UbDeB3SX+hhItLLGWdIUaVrT/ZlKzIf1ujvs=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB4945.jpnprd01.prod.outlook.com (20.179.178.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 06:07:38 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 06:07:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Thread-Topic: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Thread-Index: AQHVGowEtJizqdLgRESljRAXIeVX4KaLPLQAgAFX6HA=
Date:   Wed, 5 Jun 2019 06:07:38 +0000
Message-ID: <OSAPR01MB3089DB1C76EF1EAB36BC6DD8D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190604093551.szxmo4xsqqkq4ixz@verge.net.au>
In-Reply-To: <20190604093551.szxmo4xsqqkq4ixz@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00540e0d-7a4b-4467-57ce-08d6e97c1cc1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSAPR01MB4945;
x-ms-traffictypediagnostic: OSAPR01MB4945:
x-microsoft-antispam-prvs: <OSAPR01MB49451318432580251268D4BAD8160@OSAPR01MB4945.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(66556008)(305945005)(6436002)(76176011)(7696005)(54906003)(66446008)(66946007)(99286004)(76116006)(229853002)(102836004)(14454004)(26005)(8936002)(86362001)(68736007)(446003)(7736002)(256004)(11346002)(81156014)(66066001)(8676002)(71200400001)(71190400001)(81166006)(6506007)(476003)(6916009)(64756008)(33656002)(66476007)(73956011)(55016002)(186003)(486006)(6116002)(3846002)(53936002)(25786009)(5660300002)(2906002)(316002)(478600001)(6246003)(9686003)(52536014)(4326008)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4945;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6un9fRhW5Sqzdmb2PWI9P/dSgrtZTcmaMrWdhdks2XxRWuxYGQLfztyNOJBkTdkMNuolg4v20RANBpdAsVD4ZBR4KDvz08OFQScxTnledvtsPBVR89rIUMVsevc0IazaNCTbPwb2q1fPaxTtFf+z0YAeWbAVobufV8/sV7bxJvC7ELZygh4Nb5eU7NuZhSDo5La+fWQtk594EzKQAQUlEFYdbvH7ydVOWi9oiojF4RFbiWjaSXk0Oz5c344DwKMUqtjV9gKk94tYOB5nnsttt8wlOny4UNaPXdzET04QoF3YINWg4LSu0WnpXBBuiPmSfWRKv/gUngQJKfRUxqsGEd5du24ThcNLluAXTQ9nohY6mpIn4BPxIh4TkWrnRchG5kD+zDYhYpwDnNWfz+fQc7Nn1EzChRpxeQySdTxiyPU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00540e0d-7a4b-4467-57ce-08d6e97c1cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 06:07:38.4954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4945
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Tuesday, June 4, 2019 6:36 PM
>=20
> Hi Shimoda-san,
>=20
> On Tue, Jun 04, 2019 at 01:09:34PM +0900, Yoshihiro Shimoda wrote:
> > SUDMAC featurer was supported in v3.10, but was never used by
> > any platform. So, this patch removes it.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/usb/renesas_usbhs/fifo.c  | 5 +----
> >  include/linux/usb/renesas_usbhs.h | 1 -
> >  2 files changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usb=
hs/fifo.c
> > index 452b456..53f8e2f 100644
> > --- a/drivers/usb/renesas_usbhs/fifo.c
> > +++ b/drivers/usb/renesas_usbhs/fifo.c
> > @@ -325,10 +325,7 @@ static int usbhsf_fifo_select(struct usbhs_pipe *p=
ipe,
> >  	}
> >
> >  	/* "base" will be used below  */
> > -	if (usbhs_get_dparam(priv, has_sudmac) && !usbhsf_is_cfifo(priv, fifo=
))
>=20
> I believe usbhsf_is_cfifo() will now be unused and should be removed.

Good catch! I'll remove the macro on v2.

> With that change feel free to add:
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for your review!

Best regards,
Yoshihiro Shimoda

