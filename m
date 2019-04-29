Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F00DFBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfD2JqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:46:11 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:53408
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727239AbfD2JqL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrDh917m/TYFerhng11Ihd7Y2iXtl8o56W3VCYUARVU=;
 b=uZR3QN/opNq30anUVhmNhGtT1516OrIoWLbV09qS2dNxTXwpgpV4FISt3xmeslC8o5SsvBDzxHwY4v95Tq36uA7F1CxQ+922D4qEv6sMhKBs8M9DfIzz1V3BxfU3ojfsQ9zwEfGVYV9ns1CR6DSPQdCmQKrIwaQRtwfbtf6JW0c=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1960.jpnprd01.prod.outlook.com (52.134.242.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 09:46:03 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 09:46:03 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support for
 r8a77470
Thread-Topic: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support
 for r8a77470
Thread-Index: AQHU7615caZNSqlYBUuAi+F7WtSCZKZS991ggAAFRgCAAALpAA==
Date:   Mon, 29 Apr 2019 09:46:03 +0000
Message-ID: <OSBPR01MB210319DD9A80693FA9179EC8B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB2103DD45B93A448E2C8C6911B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190429093056.GA11049@kroah.com>
In-Reply-To: <20190429093056.GA11049@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0870cab-e077-4cd4-0610-08d6cc877e95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1960;
x-ms-traffictypediagnostic: OSBPR01MB1960:
x-microsoft-antispam-prvs: <OSBPR01MB196085C05EBC540A5B92A90AB8390@OSBPR01MB1960.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39860400002)(136003)(366004)(396003)(51914003)(199004)(189003)(93886005)(6506007)(305945005)(74316002)(5660300002)(186003)(26005)(33656002)(54906003)(102836004)(7416002)(6916009)(2906002)(7736002)(316002)(6246003)(25786009)(52536014)(4326008)(66066001)(55016002)(256004)(68736007)(99286004)(7696005)(71190400001)(8936002)(478600001)(53936002)(8676002)(6116002)(3846002)(81166006)(81156014)(9686003)(44832011)(76176011)(66446008)(76116006)(86362001)(6436002)(4744005)(71200400001)(73956011)(476003)(486006)(66556008)(11346002)(97736004)(446003)(66476007)(64756008)(66946007)(229853002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1960;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tq3HW9MwZbj8J1GjwrhL4H6cS7V5hkP2xOAoy/NY+LX/hXS3Jimw741806n8LRp88Csj+AlRrgzb3lTXuwIaTIYD1+o3A04BFPGqO1zqyDQ5YkeXvajfRseZ+WpZs2aXL8vofrzUuG9KBeT1dOU6oga9nuKsB5KSlltBgRNRziob4S4v/lSzs5XFqvVIhtbh6WjiZNFYZ9IExaWzBNrUdTyEAIIlHFqtBg0YcmNioRZmhHTTf89aQc1glgYkKQGxVs10beFwkszeKZcudELzGFUlqd228T/kWRKSxI3rLMG0La/L7B4yiN0vgYGV3DTqnWBPNgF00eLxrYurv8R48DJ3YeBz3JQV06NIkoIOs+hBP2Nfh304DGxboKuNO9YC41pkQC6+1W76Pvig03QIzmmASk74q3smAkalzn+SC3c=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0870cab-e077-4cd4-0610-08d6cc877e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 09:46:03.3719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1960
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add suppor=
t
> for r8a77470
>=20
> On Mon, Apr 29, 2019 at 09:16:01AM +0000, Biju Das wrote:
> > Hi Greg,
> >
> > Does this patch looks ok to you?
>=20
> Sure, but as it was never sent to me, why would you ask me?  :)

It was my script's problem. I used a script to get maintainer's name. someh=
ow it didn't pick up your name.
Now I manually ran and found that I need to send this patch to you as well.

Regards,
Biju

