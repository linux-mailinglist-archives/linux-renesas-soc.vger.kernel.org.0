Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6561E97B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfEOHyE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:54:04 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:15254
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725902AbfEOHyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c2AIa0kqy7nHovF+CQ4QBfYS+nx+MryCn6+vI3NFQM=;
 b=DSSTDk/MjEO2ks3Angy43ae2NkX7vNc7pBCSwqDo1z7eRJavsXm5YaYq/poHTVesJw5yWoyQFSmLF37s+nhTe7A1miM3atPQ5Bp5m5lCw+xopAZHft0J5aPUJKq3zIxE/MODz8ebOgvK7mYFQC6qRG9abqeS9BRvKmyABqPobgg=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2392.jpnprd01.prod.outlook.com (52.134.255.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 07:53:59 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:53:59 +0000
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
Subject: RE: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support for
 r7s9210
Thread-Topic: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support
 for r7s9210
Thread-Index: AQHVCmV0IRA9QMEYq0GcoyjZiO/XmKZr0bvg
Date:   Wed, 15 May 2019 07:53:59 +0000
Message-ID: <OSBPR01MB3174646B4DCCE09D82E20473D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-13-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-13-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5a35786-df7b-43b6-7283-08d6d90a7d59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2392;
x-ms-traffictypediagnostic: OSBPR01MB2392:
x-microsoft-antispam-prvs: <OSBPR01MB239217D854B2BAF5A79A6BF8D8090@OSBPR01MB2392.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(376002)(366004)(39860400002)(199004)(189003)(33656002)(54906003)(26005)(74316002)(6436002)(110136005)(9686003)(55016002)(14454004)(229853002)(53936002)(6116002)(5660300002)(186003)(478600001)(316002)(86362001)(25786009)(4326008)(52536014)(66066001)(68736007)(107886003)(2906002)(6246003)(558084003)(71190400001)(66946007)(64756008)(256004)(8676002)(8936002)(81156014)(7736002)(305945005)(71200400001)(76116006)(81166006)(102836004)(66556008)(3846002)(73956011)(7416002)(476003)(446003)(486006)(66476007)(76176011)(99286004)(7696005)(66446008)(11346002)(6506007)(138113003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2392;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eHeDP1rD1a6LrRCcV7CNCkjz2BrQM8aqMY/W8SL3VQE1NA4Tu3s3obmpZC3OCjB3NN4EbesvPCx1Y2HOOdDHq/7NJmVi4z+LRdrQ1XxG7zJpge4CpcVbqN5H2n90v7iqcaeJW/jGUVkYZ0QmBA31AT0Oo2yl6n8rWTiLMkvQNZt1PfMfmfpnSmr0DeVEBKwaEaScivzQkfEN/y8VhwjBdCHNRKZbvynyDTSvkqKHjEdzbHaGa/J4RMsIgIel37+9PhFv+cqYHmd2/Ms1R8VBK9zTL+3l+a8f5brRkXTMG8SAf0yYuPS1OPUwjwkthDf7lGaKfzn1HoQSHozFGu8Q5tFb3zf1epoMUHIiwq294ZnyipPC8rdU4k5nHVG1NhDuaAYv0L1JHb0vUSDlmccMMR+kh0sEC+mM4p8pR8zskUg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a35786-df7b-43b6-7283-08d6d90a7d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:53:59.3499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2392
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> Add support for r7s9210 (RZ/A2M) SoC
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

