Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB9D179B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 14:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfEHMsk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 08:48:40 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:29568
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726444AbfEHMsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 08:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OOqSGnnYTF3iY5GuKym2WzLYHUoAxLbuRfA7pFfLqg=;
 b=eg/90kF/6717ygiX93sbUMaAOmWvxqNxJy+h9qH6B4CRfuMx28JDYMAEE1mm93ogCTeli3b5mBeHOEgdOsqDwQkXBRQdMh7V/yyAR1/ARsjltozauHWbBSsr3dNCr0vEUhLmnWYgChNUXayIqwROKIxLm+h2p3UuTg0KfJknuxY=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1787.jpnprd01.prod.outlook.com (52.133.164.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 12:48:36 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 12:48:36 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 10/10] ARM: dts: r7s9210-rza2mevb: Add USB host support
Thread-Topic: [PATCH 10/10] ARM: dts: r7s9210-rza2mevb: Add USB host support
Thread-Index: AQHVBGY/mP4xZNO/3kWcH4UIHFLGMKZg++mAgAAyy1A=
Date:   Wed, 8 May 2019 12:48:36 +0000
Message-ID: <TY1PR01MB15624892AE0A749A63053DA98A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-11-chris.brandt@renesas.com>
 <20190508094230.5j2skmmlkzlmy2ls@verge.net.au>
In-Reply-To: <20190508094230.5j2skmmlkzlmy2ls@verge.net.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67433bd4-d960-4df0-752e-08d6d3b37ca3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1787;
x-ms-traffictypediagnostic: TY1PR01MB1787:
x-microsoft-antispam-prvs: <TY1PR01MB17878523225A394FEEF328328A320@TY1PR01MB1787.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(6246003)(4744005)(66946007)(66446008)(76116006)(26005)(74316002)(14454004)(66476007)(33656002)(2906002)(66556008)(64756008)(4326008)(73956011)(72206003)(99286004)(478600001)(7736002)(25786009)(9686003)(55016002)(53936002)(7696005)(76176011)(54906003)(71200400001)(71190400001)(316002)(229853002)(6916009)(52536014)(186003)(102836004)(6506007)(68736007)(3846002)(305945005)(486006)(8936002)(6116002)(256004)(81166006)(66066001)(81156014)(86362001)(6436002)(8676002)(446003)(476003)(5660300002)(11346002)(21314003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1787;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GzuBOPrUwT0x7jVZwnMYOxmnaA7P/TMYDLdRrghMkXw3zSp7ZQQTeqTJxsE8Lr8XqETKqMF++jfgBWOHE3NL7FzrLGq0qAWiUYPkbO9tSWffHDe0Wu2OM3m+umDVedF8t9GSfTGn9mYQ20uGT4+ox7UuF41Y2Wcob/eHo47FjEzCDWFyVw4nBuJkagY63ZwT3k6yu3zILdFDou4QDXWugxffCg91uzdoVuangFQVH3UFs2czqcaibMIa/rUkQ8OjEDihvzzx3xjwVg2RgJzcqpbfGs9kK05wTBEjBNnhk9rgtbwI2tJ0ST7o7CTIvuzmQyV21P3ygqdGTucCXimVCRFr9Skgl7NY5qK7vUVDIta93jcLKbY0hfu9TK6n+fa8ilerpH8vQAjbNUAwKf837JwuUw8/v4BS594hcZybfz8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67433bd4-d960-4df0-752e-08d6d3b37ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 12:48:36.1896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1787
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, May 08, 2019, Simon Horman wrote:
> Please add a space between the usb2_phy0 and ehci0 nodes.
> Likewise below between the usb2_phy1 and ehci1 nodes.
>=20
> Otherwise this patch looks good to me.

I also see that you renamed some patch titles from
  "ARM: dts: r7s9210-rza2mevb: xxx"=20
to
  "ARM: dts: rza2mevb: xxx"

when you applied them.
So I will make that change as well.

Chris
