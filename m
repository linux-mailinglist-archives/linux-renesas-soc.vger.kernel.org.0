Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C3F1E957
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEOHq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:46:28 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:2906
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbfEOHq2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1WE/KRx6L+PL91ag68SEBL9OWPIyWJMxycbq/SB4ec=;
 b=WsaQhTcQaZQcrnIWP/JVf2I+XLVwe6qJbH/t1ooDFagdCGc5tzZTjaYPohPR1AzqQO5Qzhouijw9g0Vjd5ZFrSzpU3UGtSrCriNIKOJHtZoecGorfxezawEosHvBfR4J1y6LzKJTFmdUrJ9aw1BH9E1tYAU/pB4yJKZWCDyTDI8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3224.jpnprd01.prod.outlook.com (52.134.252.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 07:46:23 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:46:22 +0000
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
Subject: RE: [PATCH v3 09/15] usb: renesas_usbhs: add support for CNEN bit
Thread-Topic: [PATCH v3 09/15] usb: renesas_usbhs: add support for CNEN bit
Thread-Index: AQHVCmVm/y5YpmlUuUy+t47eYaSNMaZrz6bg
Date:   Wed, 15 May 2019 07:46:22 +0000
Message-ID: <OSBPR01MB3174389B9F35DA90F093EC94D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-10-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-10-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71c844f1-c824-4f9a-f3f9-08d6d9096d38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3224;
x-ms-traffictypediagnostic: OSBPR01MB3224:
x-microsoft-antispam-prvs: <OSBPR01MB32242CE99A609734772917DFD8090@OSBPR01MB3224.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(6436002)(81156014)(33656002)(81166006)(6246003)(74316002)(107886003)(8936002)(7416002)(53936002)(229853002)(110136005)(54906003)(316002)(478600001)(2906002)(14454004)(7736002)(102836004)(6506007)(6116002)(3846002)(99286004)(68736007)(25786009)(4326008)(558084003)(7696005)(76176011)(5660300002)(55016002)(9686003)(476003)(486006)(305945005)(66476007)(66556008)(64756008)(66446008)(76116006)(71190400001)(66946007)(73956011)(71200400001)(256004)(86362001)(26005)(186003)(11346002)(8676002)(52536014)(66066001)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3224;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7s3ePt3SkdgvtxyvR6D4hBncWAy5Yp21RFJoGXVZRnV8aZ5jDdU/qwWBqG2ceE1em5EVWZkN3BXr0QiVxk8cEP34HQ+Hw/ZPz0y5ocF7L+7wLpfQFjVDPCTz6yprQ51QTDidLM1wKrSGr01XmgEL8OPUfNaYHy5OPAQrlMQ9QfIdVwBwg9zapuzulXC5s1AaBPgkgO16MWnahsLGWAFI+xvj6S7FP+5IFacimwlOOzd0WX/qJkPqleDehvV4xRLlay4fM6OWk8eYBI1ZKySGfU2uLr/vSziMnh6odnsVNXPZbnc5nMXmkUwdvoizOpFo8pB1w5LfSN5KjISjhMo8gwVMYclyGLqhlNi3NDgQAek+P4KN5/pDyc1CMVv/4+Cs98S1UbQht3e/dvkT1g6uqDP5pKxlPlL3hJZbu9YbltI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c844f1-c824-4f9a-f3f9-08d6d9096d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:46:22.8326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3224
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> For some SoC, CNEN must be set for USB Device mode operation.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

