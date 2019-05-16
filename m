Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEB3206FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 14:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfEPMcM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 08:32:12 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:44592
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726723AbfEPMcM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 08:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv3aB7Vxbo+uBbOTKlvsYv84AUk4fH26ubOnhiVq2ms=;
 b=GTbTmxqjmeoqNs6VyPYPBMCPfCrvrj64H7PNPsxeFTXeP77nObnGGzk2pdmmy27/HCCPSoXIT+BTKsrRGgrHp3CMnmggz92cDbu08ybaajyVAeFWgshIDiKvCTnFkznvHd0C5lb/HaygKc+sTffe37UtvVgGV5aA7MnHf3aSIfs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3478.jpnprd01.prod.outlook.com (20.178.97.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 12:32:08 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 12:32:08 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Topic: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Index: AQHVCyUpvBbBPGrYP0S5NxoVhRdkraZtrDqAgAADQeA=
Date:   Thu, 16 May 2019 12:32:08 +0000
Message-ID: <OSBPR01MB21031BCDA0AEBD7A6EE6E9A9B80A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
 <20190516121659.GA2832@kunai>
In-Reply-To: <20190516121659.GA2832@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a125d46a-8ae2-49ba-1145-08d6d9fa8333
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3478;
x-ms-traffictypediagnostic: OSBPR01MB3478:
x-microsoft-antispam-prvs: <OSBPR01MB347880B9709543020FE3FF4AB80A0@OSBPR01MB3478.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(51914003)(478600001)(76116006)(66066001)(81166006)(7736002)(81156014)(8676002)(74316002)(86362001)(102836004)(6436002)(14444005)(71190400001)(256004)(54906003)(71200400001)(76176011)(305945005)(8936002)(7696005)(186003)(99286004)(66946007)(9686003)(66556008)(66476007)(73956011)(64756008)(6506007)(55016002)(14454004)(66446008)(26005)(5660300002)(446003)(53936002)(33656002)(486006)(2906002)(68736007)(25786009)(44832011)(6916009)(6116002)(476003)(3846002)(4326008)(11346002)(52536014)(6246003)(229853002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3478;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: If1z1IyLsbXUu/YukPAUZOidcMkDOyzejoEHPApLm3HCh1B3gNZDPKVol/Q97QPi6XexVzaSXRjPbsId4CbYP18GsQn9lx+JDb9wwHLjis18vAgvCenYp7iCvunNMvHS950zTIZg+bfBNfbF4nMpy4YoJmv8jacEzSbukaVpl2tkKXIMr0ffr2yj/rbdqU/WgA7Jn1LhTzJwEY1PuuO/RQENj/1fVXEgmVIOdrrrxNbXQD+PSwo/YXV8FSsx5jYj716CWTVXyZXJ7KsMNwW3poBesQEVjcdoTLeEN2YvoABdod7rqVPILw6n+avnmdnaO8ZC8HuVXBz8yQPA+/ORFnNJQZN7NHvpVcrD0dA2m+8TH8DTWclHTSxOUWD45UZ+syq328+lZhQVtkCrDTWd2+mJxzUL2f1WMYV6BE7R5Fo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a125d46a-8ae2-49ba-1145-08d6d9fa8333
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 12:32:08.4428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3478
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by on=
e
> warning
>=20
> >  		error =3D of_property_read_u32(np, "reg", &channel_num);
> > -		if (error || channel_num > 2) {
> > +		if (error || channel_num > data->last_channel) {
>=20
> Just an idea, I haven't tested it: Couldn't we use
> ARRAY_SIZE(data->select_value) to avoid the extra member in the struct?

I checked this now. It is giving the below build errors

In file included from ./include/linux/kernel.h:16:0,
                 from ./include/linux/clk.h:16,
                 from drivers/phy/renesas/phy-rcar-gen2.c:10:
drivers/phy/renesas/phy-rcar-gen2.c: In function 'rcar_gen2_phy_probe':
./include/linux/build_bug.h:16:45: error: negative width in bit-field '<ano=
nymous>'
 #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                             ^
./include/linux/compiler.h:351:28: note: in expansion of macro 'BUILD_BUG_O=
N_ZERO'
 #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                            ^
./include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_arra=
y'
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(=
arr))
                                                           ^
drivers/phy/renesas/phy-rcar-gen2.c:398:30: note: in expansion of macro 'AR=
RAY_SIZE'
   if (error || channel_num > ARRAY_SIZE(data->select_value)) {
                              ^
scripts/Makefile.build:278: recipe for target 'drivers/phy/renesas/phy-rcar=
-gen2.o' failed

regards,
Biju


