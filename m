Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D82E226
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 14:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfD2MVz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 08:21:55 -0400
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:6073
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727956AbfD2MVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 08:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju9TECRAVBKK2ILhSj3cwBNS7xPBvY1zH31utTFbUfY=;
 b=Mm5rM8ilivDnGbAv5GUgNa9/sdb4QGYse2qsce8oVqklDPxHEABfRe3qufP6rv9a6fd5JKPLvudeNIFEXzxrZ5wkCXG3IhR9pjz1TBDnYt+yV9by4iL2tHSYlHEAJaNGUIAiLD+LMOcHu49nrF3q32rgAE/++//ZlgvYOH7rKpM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1628.jpnprd01.prod.outlook.com (52.133.161.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.16; Mon, 29 Apr 2019 12:21:51 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 12:21:51 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Thread-Topic: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Thread-Index: AQHU/m8QhsbWkw/8AEW0pGxxlBRO8aZTCh5g
Date:   Mon, 29 Apr 2019 12:21:50 +0000
Message-ID: <TY1PR01MB15620A5958E5A9211518E0C48A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190429093631.10799-1-geert+renesas@glider.be>
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e03789ae-3df5-4320-31f8-08d6cc9d421f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1628;
x-ms-traffictypediagnostic: TY1PR01MB1628:
x-microsoft-antispam-prvs: <TY1PR01MB16282CD60ED6F3D2DDFBBAD58A390@TY1PR01MB1628.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(396003)(39850400004)(136003)(199004)(189003)(26005)(102836004)(99286004)(33656002)(2906002)(68736007)(97736004)(6506007)(9686003)(55016002)(229853002)(256004)(53936002)(52536014)(6246003)(5660300002)(8676002)(71200400001)(81156014)(81166006)(66556008)(66446008)(64756008)(305945005)(73956011)(74316002)(66946007)(76116006)(7736002)(4744005)(7416002)(76176011)(11346002)(25786009)(54906003)(186003)(110136005)(4326008)(6436002)(6116002)(86362001)(3846002)(478600001)(316002)(66066001)(14454004)(486006)(476003)(7696005)(71190400001)(8936002)(72206003)(446003)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1628;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ThJ7lBOX+TJs9IMBV/eI5WZtHjw4hmuj3ANJPVKQ297/0z4CFOY8154bHkq+EAQo212nMJOCDvCVSu5f3W1EhVNZoEGbIquPJVDPwHdc2PUFQ4ML+eguYbKey83FMLpbSVD2dd+HbXj4ldTMmSAsL+kYggn3zpcGoFmhPUtWHoKQaKAmPrnRU5m+mu6hktB0t6uXhWF5t8k1gb2nMBRDY4F5B4bpPBlIiC4O6FFSqzE9KuUbK95fgQ+BnehM4Cs7iKNC7yXgmiXt+IE7zRf8eMduSxIDdOUK2ZbbEvJqPDH5zA7rVrr0WI6Yt4Eo8eJyQf6k/IKSSGOCbIGnr+9mivBSs7ZvoBcwoF1xaCtZNdq/SJHekaXk5Lv0ELpzA3rAS3X6x3w1mq7hgG7th9LCvawSWr7zLZUsXBxihF0s59g=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03789ae-3df5-4320-31f8-08d6cc9d421f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 12:21:50.8454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1628
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for this patch!

I've been hacking this support into the standard GIC driver in our BSPs=20
for years now. :o

On Mon, Apr 29, 2019, Geert Uytterhoeven wrote:
> I expect this driver to be reusable for RZ/A2, after adding a match
> entry with .gic_spi_base =3D 4.

Yes, the same IP block is in RZ/A2.

So with that said, should we call this driver irq-renesas-rza1.c or just
irq-renesas-rza.c?
It doesn't really matter to me.
For an RZ/A3, we might just use the same IP again.

Side note, I've seen this interrupt pin HW in some older SH4A devices=20
(like SH7724 and SH7757). So it's been around for a while.


Chris

