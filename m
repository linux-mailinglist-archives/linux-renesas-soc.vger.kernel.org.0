Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80601F514
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 15:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfEONJ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 09:09:57 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:50688
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbfEONJ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 09:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfwLiYWA/7CCCiObYzOJDmhSuESedn2k4NgfPWGHE+A=;
 b=s4iIPAPDf6yHcY6M7yiHnw2wo8G+CokoCe6m+lKwqv5SNwkseW3ER1RlCtumy5GvnQoS5SWD8vNZdy5ys0fQnVM1IONM/bmkcB39nKLxjIU4XIlCIGnOIpcKVZnFYl0LYjO7cJ7WdwO1dm/Qnmd7pNnRVsZqbCUmt1Q3oOBiAOs=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1885.jpnprd01.prod.outlook.com (52.133.169.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 13:09:50 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 13:09:50 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVCmVwqsbIgol6iEKvZrJ46ECCEKZr0ZoAgABYGxA=
Date:   Wed, 15 May 2019 13:09:49 +0000
Message-ID: <TYXPR01MB15682FBA8398D5D65065EEEB8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-12-chris.brandt@renesas.com>
 <OSBPR01MB3174F7F91A11317D353BCE9AD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174F7F91A11317D353BCE9AD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0412e659-68e2-40ef-6b03-08d6d9369cc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1885;
x-ms-traffictypediagnostic: TYXPR01MB1885:
x-microsoft-antispam-prvs: <TYXPR01MB1885BCBAB6318DFA376E97468A090@TYXPR01MB1885.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(305945005)(7696005)(7736002)(6506007)(76176011)(110136005)(71190400001)(54906003)(186003)(26005)(71200400001)(229853002)(74316002)(6436002)(6246003)(102836004)(7416002)(66446008)(33656002)(64756008)(66556008)(66476007)(558084003)(53936002)(99286004)(66946007)(73956011)(76116006)(52536014)(86362001)(55016002)(9686003)(476003)(11346002)(446003)(8936002)(316002)(4326008)(25786009)(81156014)(81166006)(8676002)(68736007)(256004)(72206003)(5660300002)(14454004)(478600001)(2906002)(486006)(3846002)(66066001)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1885;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nmK7bLg228+FH+lu2skYe47PdAl5yniMqXxhiT77rUGyV4A+klmdzRAbfy9nPz8EsxDTQUCiVovWzxYPs2g//MmW0NqYYKBsiE1WXX9vafVM7zbJVEfgwu8e1KGFRGE07yz6uHwE6F/AukZ7hLtYc584wAfCH7IWJQDapke540/2rNxXXKII7fBwyi41xBeNeF0rPCYEtLlqlC9bSmmy9HQw6cvVvc4CC0UsxQGVNTIryYtudvPzkgH7P15taVtE3lO5J6TPJCGdCLU195tMCk2iGVXcxaVF1JMdvX2qY+wQViY4J65olbtnNCbnOme2dGXSUfknawAXbn9kh6+35n8qQmVCRmn7oXRxP57jzIJKTjCRl77VgLhVE4TP8EW0cQ3cbaoMkfoy4wEzhybLsBhkiH81/daol2tZKoUJKxI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0412e659-68e2-40ef-6b03-08d6d9369cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 13:09:49.9642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1885
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

> From: Yoshihiro Shimoda
> Sent: Wednesday, May 15, 2019 3:53 AM
> > +#include "rza.h"
> > +
> > +
>=20
> I should have realized this on v2 patch though, this double blank lines
> should be a line. After fixed it,

OK, I will remove it and resend.

Chris
