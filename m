Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866881E902
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfEOHcL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:32:11 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:30420
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725929AbfEOHcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wseJNiSFw+2UsN4gIq6FNfAtVDQxbo9tUVaOiGB0htA=;
 b=iSsFhyCQ6odf7a4Xor5XZcEc0GWYUd6iKc1v/j5opQvv0izdCeTX92aaGUNvnAU3sRf1PQ9moLbKpJ45NGL6R4HdJ37tRzL9ojFONWZUyMpnlJX1zDhIPYKUlezT1tJWeADNviUYlrcMy3Q3ldFxqV1dIFp8hbxFI51tGz66BjU=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB4934.jpnprd01.prod.outlook.com (20.179.180.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 07:32:04 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:32:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
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
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Topic: [PATCH v3 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Index: AQHVCmVMxbiW+OgpNUCzYvtYChDVdKZry5Zg
Date:   Wed, 15 May 2019 07:32:04 +0000
Message-ID: <OSBPR01MB3174601B890703A6BF1A080AD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-4-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-4-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64c40346-65f3-45c2-4ec2-08d6d9076d85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4934;
x-ms-traffictypediagnostic: OSBPR01MB4934:
x-microsoft-antispam-prvs: <OSBPR01MB49343CB7E38C0045699FD77ED8090@OSBPR01MB4934.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(366004)(346002)(136003)(199004)(189003)(7696005)(486006)(33656002)(81166006)(81156014)(4744005)(6116002)(3846002)(86362001)(8676002)(6506007)(71190400001)(229853002)(52536014)(6436002)(54906003)(11346002)(102836004)(55016002)(8936002)(68736007)(7736002)(9686003)(256004)(305945005)(71200400001)(76176011)(99286004)(446003)(5660300002)(26005)(476003)(110136005)(66946007)(66446008)(53936002)(66066001)(66556008)(7416002)(76116006)(2906002)(186003)(25786009)(4326008)(107886003)(6246003)(74316002)(478600001)(64756008)(66476007)(14454004)(73956011)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4934;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xsrk7KvGGrkvqlFkAHlMQU07z765jMRm4/qIzpbbewWcX1j7+rYATi/XBQPtdinvxHBKzpGZV2/xQRqnhMaFMaqUTwRKWMdRmm41O8NtTYWO0Sd7fudaa454dETXHzGHi5XHf7p4plLemIF0443uBwgu6sHe+MkMxlvBm1kSQCwcEJTsr9NNzWgbd3Q1ziqZ4CVYfRjKdh1uJ0MhJoizgmbQth7gCIO7xFizFiTEualUm+IhPydB764vIvnqOobybn/72xXUl/s6CNkdsVowA8VqvxcvRnSqjTmXhEtK9wAfbL4uZwAEFaC6UoHBYRZAwh6sgyv81cD/TpwrFK0YLqgYZyo/d4+Yvf64DYzGxya7AEx/5YZrxr/a/H9R8nmRjn5C8PkEE0LaavPH1dqQihEGmpyKvRXB9c1brmmW0/Y=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c40346-65f3-45c2-4ec2-08d6d9076d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:32:04.3776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4934
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> If a clock node named 'usb_x1' exists and set to non-zero, then we can
> assume we want it use it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

