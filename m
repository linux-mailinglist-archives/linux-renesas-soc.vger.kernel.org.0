Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E707DE68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 10:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfD2IxK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 04:53:10 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:6073
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727525AbfD2IxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 04:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWf25qS5sIMQxcS2Y1rNk5DL5VNT5JQoL7u1RNT7RtE=;
 b=N26u611UTExDwVVgfpLxo8NdZzULCYbJJOp+dvrMgF2HlA/sL1AwtOvCxbpEa+VBOEJLMVR1E5y8Jn4FowFyUGirI1b7yRqxAjy+JdIHvhyZb2z/0X4Sq48CQeAVZrmwMFjS/F5KEQSgLsOqnyimqAewk4WI4jRqemIpnNywFQU=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1722.jpnprd01.prod.outlook.com (52.133.160.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 08:53:00 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901%2]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 08:53:00 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Simon Horman <horms@verge.net.au>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: RE: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Thread-Topic: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Thread-Index: AQHUkyFpi/45UrthxEeTw5QuFUj6AaX3HGuggABRjACAAAQ+0IBTOpfggAYeGACAAuB4IA==
Date:   Mon, 29 Apr 2019 08:53:00 +0000
Message-ID: <TY1PR01MB177019CA89AC165803270945C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190301161624.GA19937@kroah.com>
 <TYXPR01MB17756DBAF2FD7A1F2A9B82B0C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770DB45DCD263C6933B9210C0230@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190427125606.GA25493@kroah.com>
In-Reply-To: <20190427125606.GA25493@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2010adf1-20bf-4311-80be-08d6cc801590
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1722;
x-ms-traffictypediagnostic: TY1PR01MB1722:
x-microsoft-antispam-prvs: <TY1PR01MB1722AC7E674DB3385F33B2A9C0390@TY1PR01MB1722.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(136003)(346002)(376002)(366004)(199004)(189003)(7416002)(305945005)(8936002)(316002)(26005)(66066001)(7696005)(229853002)(486006)(81156014)(81166006)(4744005)(76176011)(93886005)(14454004)(8676002)(7736002)(33656002)(6506007)(53546011)(54906003)(102836004)(4326008)(446003)(11346002)(9686003)(476003)(6116002)(3846002)(97736004)(25786009)(6916009)(68736007)(53936002)(5660300002)(478600001)(86362001)(52536014)(71200400001)(99286004)(2906002)(6246003)(71190400001)(6436002)(186003)(256004)(55016002)(66446008)(64756008)(66476007)(66556008)(74316002)(44832011)(66946007)(76116006)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1722;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9FygqFRgUD7y7lwCd43MaWVPzzKrIPUeNQShsPrsXIS+tBYitEIaXe2u1/Kr9GgO9MZs7lzPowqlaYJY4wFxktQZGsUuYrGotG1O0615pTZnfYpjFN3Oj592H2AtwkIh8ye2xXwJEJq84oDA0GEmtVZ6+NXFQIWzzkTEMofoVA9KyR5ohkmk+j8uPIrBWUUBQ7jfzR+CQRiC6/4bDXe0JTLQ2PKNnrLLPg3wMpmQgmjT9G4eoVDnwdoVWc4JMEcN373DbH0m9CPBABJ6IKV1Uk0jB+l+8QpYYvuiB+sD4bJMTlGMy/LB9SrEgjJ1K2oLnQ49ugeXV43kepBmrsogRs+EPHBmHcDTl6y7wb5DTbyNrRIk31NhSdiqLejPHd2xv9MLSEyHzpyh0IfBHBLlK7byYR0KFhFGwSbmSXyb9OI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2010adf1-20bf-4311-80be-08d6cc801590
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 08:53:00.8135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1722
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: 27 April 2019 13:56
> Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
>=20
> On Tue, Apr 23, 2019 at 03:32:59PM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> >
> > I know you don't normally take this type of patches, but this one has
> > been around for more than 4 months now, and I am losing hope here...
> >
> > Do you think you can this patch?
>=20
> I think this got dropped somehow, sorry about that.
>=20
> Can you resend it, with the acks that have been given to it, and I will
> be glad to queue it up.

Thank you Greg, I have sent it now.

BR,
Fab

>=20
> thanks,
>=20
> greg k-h
