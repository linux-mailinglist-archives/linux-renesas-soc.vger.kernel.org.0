Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029F4104E86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 09:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUI5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 03:57:01 -0500
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:26943
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726165AbfKUI5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 03:57:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLxTSQMpCkrNLR90RAd/hEm54W5MaR9dHagvKqxk3KtvZPc108iSY4LDn7yhlb6m/CFoFCDyBwIQ9WImzJYZ8Aq1ekpoEMgx/l4tRa/emaMipc/VyKdTGh/ajTSjEO5S8fVqBFDurK5hpT2o44Q5LnUuJCjxTVZ5jeLCfUvbhgQfi+h4nIpfAjRszJ1yO/Ebrxkrl+XdDUuOPdyuy2wFJbV5BzArCcTcl+lDw0bl6ilvuOIz022e0X8zIEs4B9HvN1rR8sB+OwwFE9kzwrz6l6NpzG8y/CfkjDBAhoZl0UupxZ0Qy42vMH/0njUvi4zH+t2TAATikgziVUI/kzvG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8UHQDoSPn5O7jaq/d5AV/V7ZBIVy4AfUo+EreqzqtM=;
 b=Jq0acTOFhl+p49iUgD7C9zPn5Y+B/a9vpIds4evTQ9TbFiVVDo6MpyQxTkL09Bp/KMVdtKoI71/TRQjt9xL6cfde2ZjjEcxO9EqJKCEG67kYauoiiJkM+/BJ5LTEiQ38xrbutvErI7BudOj3iqkt2DczULkpUHV+5DERiLLqJ5Q5xpDQnR/9G3L3KlKjWbi53wpDXONvKips2FZ505WNNNt+xJTQosbPmCccSWKZgORFwUOA0WqgGEBm5gR3wE6CP0iM+MMVx0CgCsX8TCjXI9f2NY+GJOl3NOclV6LAr3GeKpFQZ5W0jeOyA4kkpNB6uJU68dSjwIUqmjWNnh0QFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8UHQDoSPn5O7jaq/d5AV/V7ZBIVy4AfUo+EreqzqtM=;
 b=fjuN63NO6nQitH7RYQjeaAFoYLXCE8aw5pSmoVD47eab0531tek/iH8PXZboBMLE2yO6fDId5+u3CYI7OiO3KZ/S1tvWuNXm/Q2DM/y4zhFLm1Tek+dhR3YR82Q12oCrWZHhvuPpkLR0bW79khH6Ju2rKxYOaQd6N26Zc+wYcvc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3830.jpnprd01.prod.outlook.com (20.178.99.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Thu, 21 Nov 2019 08:56:56 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3%3]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 08:56:56 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
Thread-Topic: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
Thread-Index: AQHVeeKz4e6naGbfXkibt3sMCaEg3KdVbgMAgEAxFnA=
Date:   Thu, 21 Nov 2019 08:56:56 +0000
Message-ID: <OSBPR01MB2103A566B540F87FA4493C05B84E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
 <20191011123916.GA13450@bogus>
In-Reply-To: <20191011123916.GA13450@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81622124-cc06-4921-5c75-08d76e60c2f3
x-ms-traffictypediagnostic: OSBPR01MB3830:|OSBPR01MB3830:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3830AF76BD0E88F0E966B9A9B84E0@OSBPR01MB3830.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(13464003)(189003)(199004)(33656002)(9686003)(55016002)(81156014)(81166006)(8676002)(6116002)(8936002)(6436002)(102836004)(44832011)(229853002)(6506007)(3846002)(11346002)(53546011)(26005)(66476007)(66556008)(76176011)(7696005)(5660300002)(66946007)(446003)(4744005)(186003)(76116006)(64756008)(66446008)(25786009)(256004)(2906002)(14454004)(71200400001)(478600001)(305945005)(52536014)(316002)(54906003)(7736002)(71190400001)(74316002)(4326008)(6916009)(86362001)(99286004)(66066001)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3830;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5lTnMy+Yl71RlX113VBNCKGOjznPz+iypqxyQSYT6ocWmfFLt1/HhnPH4dBFl49OcEWj0ThH7lZo4L+6Qi9B4WZLXda2rbU500FKXH7EvzmgMSidz5BjygpiHcfKwdUmJkedtamAzIEwC1Ik3QWG+72MGGXTHhnOjam2/ag0QWAtysmzBsutvJsiuVN0gE7FHnRqa6dnsUnoWVCZaf1wBuEaKMOwcCIwKBdepciYnKqXZA/tjGaxSRVxjmJKuhf7FV3syfzQr9j3WhFyUMKevjIZUwmdixdiN9wVDE4WnIzuA7E330ZpJ0/7s8j2TfZkwpt68mVfZfvZmfE4KsRTjLKBV3WN7Qgq6sbRfl7LKecgdqSLR3IITo6HUNzwtR0Hw/DkrnRSWHhWnNHwj8x32XjPPILQHICxuO4AlenHfu0CSitfwukWRcuYzjrWvshD
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81622124-cc06-4921-5c75-08d76e60c2f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:56:56.0670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UnbX43iP++Z0vsrnvZdQkWmOKtUTyuYjzAJ4NhtqI4G+N7ZFllfzF5zialDG+apSkoM9YcOApZLS2zM8Eco2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3830
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Are you happy with this patch? Please let me know.

Regards,
Biju

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, October 11, 2019 1:39 PM
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Mark Rutland <mark.rutland@arm.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>;
> devicetree@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Simon Horman <horms@verge.net.au>; Chris
> Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774=
b1
> CMT support
>=20
> On Thu, Oct 03, 2019 at 01:03:49PM +0100, Biju Das wrote:
> > Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >  * Rebased to tip/timers
> > ---
> >  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Acked-by: Rob Herring <robh@kernel.org>
