Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD2B1F382E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 12:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgFIKfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 06:35:11 -0400
Received: from mail-eopbgr1320090.outbound.protection.outlook.com ([40.107.132.90]:19360
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727101AbgFIKfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 06:35:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ7ORQz0rRpYDBG5IHV6Ibu/LhmV7CX6GG6Sq9D7jHmzTkeV3PHrbjYd440uCVfYHbHvuZoMfzTTGAseCPS2n+aGB4TNgXTDem0/FYqPi8caLPLXvBJlAq/LuFEyUyeC4mRFmoxvl1Kr8WGNaO/ol3GLCD44x+K/sLhlB0qcUbde4EirkJh1YtJd2IumdB2Llek2ajU5om/9/DTzc3oE3RtZjFnt+d9UZ73gDNlE2zTnANQFYSxlIVBJbMwLCcGO88JAHcI7/w8se9/XxZxOmFtBMJRnkwCC059jnujzCjFU80ZXpG4rpHy4Tc5/rOrCtx15kW+tXW2kiJn2Ydqg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+qSrc58/oBhVNyhp9jXSXnN83qQCTCMKvRtoNOZflU=;
 b=HkwAa9Elo1iqBkm1tHm55iUVv4LNmC2wgNGbaSK2w5aERk9AvpVdFZES6qn0gVMinBxjYvMyKNFtBeJ4FwYgHr/KE/aexK4d5BNX9MmfLajzI8naQUHD37Vz8KH9h/50qgKUwXEqODS/mzvA0DnFNmpEUf4rK1VRUytfIbY53aq1QQlnESLa1o6AafvU2QLwc/O1QPBA3firlfUtMilAOAviuh47FKNc+zgARFU6QR/XR3vx+GLkhqANS4q9PecnDyFjIm7OJCKPiycLQzHJZCO+2qgjTw7OY4olWRcrnyuaQyI2MBAZAIqWQyQVuviCTM4/yA/Yh8EHvinjHx9ESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+qSrc58/oBhVNyhp9jXSXnN83qQCTCMKvRtoNOZflU=;
 b=ltVhNfEMpU570aBCIjskwAE5ECVYLJwUGHJNT00vbWH04ydCw5v9c1zxiDYr8x2dQJtRM57LDcKj3uiNaK7Ybl/QesIeeXUjfLAMeXB5bDvcOFlxpA14EINTXVn7PPiWNpZL65nwDtAv7GCBUKN7GKEXX4DfPr1KXMcuZkRhyaM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2555.jpnprd01.prod.outlook.com (2603:1096:404:74::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 10:35:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 10:35:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] mmc: core: when downgrading HS400, callback into
 drivers earlier
Thread-Topic: [PATCH 1/2] mmc: core: when downgrading HS400, callback into
 drivers earlier
Thread-Index: AQHWOmI3Nx6zJ2C2OUWQ6X8UubntrajOPffAgAD3kQCAAOiCkA==
Date:   Tue, 9 Jun 2020 10:35:02 +0000
Message-ID: <TY2PR01MB36925C5484B2EBD396AB029FD8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB369228A84C46D582D1219EFFD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200608204113.GC917@ninjato>
In-Reply-To: <20200608204113.GC917@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b48d4641-b39a-48a6-cec2-08d80c60c4c8
x-ms-traffictypediagnostic: TY2PR01MB2555:
x-microsoft-antispam-prvs: <TY2PR01MB2555EF3235967209224CE971D8820@TY2PR01MB2555.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4DRgz053kP5G0u7525bkbjP4cCbTcmLrt4zQzbSAtSalOZcqyeb9U63iB6ButiwYIOvmxcnGyykXzOjAflKIxHnMBgxfdrxLHjoSENu7broMtjxYCi8STFvo00VV2aoDdjfOTroqjt4wWCpvHjCgBjFhsJsbGZkByoZwK04HrqOU67hymGTVJIs9ABszPQrYO3QXrQ8uSDJ8d0IntpWZY+dbMbv7c5xprEawOCOFdietDlbMsG7Idyd1lsLcdqOfTxt60LEqa41NskThucMyjx2Q12rGeiZT8Ls6z4LBK3uhJNTUyBD1vSzciyyQoeVxmtFoJ/0TyNe4YcYYHN40Sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(4744005)(186003)(26005)(8676002)(52536014)(86362001)(4326008)(8936002)(478600001)(66446008)(66556008)(76116006)(9686003)(316002)(5660300002)(71200400001)(7696005)(66476007)(33656002)(55236004)(66946007)(55016002)(6506007)(2906002)(54906003)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: yQ99QRKpsbvXJpPC4jQH+SQaC98Pozvdh7wYncVDR6duwpHWDsMBSe36iYZ64/UVQziVbaMUHhDNkZW/Q9Xyfsasr77XYHzdzeciZA7BNWWxuwznLFowZJICyZ78176NYYsWihpkHja3xVoiyoitqnIBKpxFSGmR4lbofWay+tr409gi0GI9UkhdCRB8xhCNlppEUNreL0yzfuJMXTkKf5JYA+cXWOZ9LlDOjPlt8HAoD9p7FT3q7qPFBRCgpzHHM6j+qMAzuugGQZCIhkifRKqgG4AuTkLJNpYzaHiX1K2ohSjrc4WZ+RAUq24itfQRTcalH91GeJJfaEXnxAXs3T2TTKD11ayJU94ZZ2dArMqN8xQyhBdMcCz26laDRj0Xz6ES+uLn0iXiyW9kowiz4GMtCdzZsHhha7AmeLuj7TdrgoTRZF1vtWylZ0N4gPvutAvml/bIQSdrhXjTZ39vFNrzNhoNe50PrpMoUgQ+TmmXW/DyZGGzzOCkyR0GIJzC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48d4641-b39a-48a6-cec2-08d80c60c4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 10:35:02.9524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38X+kLzea/tdAgU52NG7Udwi/PPs4dUm+XC/jPVB5l0MPSlLc6JI0rf9FCWtSE7VBFZXFil9V0mPpaZJHfSR6/XvTmq2yJzSpoA8BkRnHWYZHSDoxbztYOduyIbNwiER
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2555
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, June 9, 2020 5:41 AM
>=20
> Hi Shimoda-san,
>=20
> thank you very much for the review!
>=20
> > > The driver specific downgrade function makes more sense if we run it
> > > before we switch anything, not after we already switched. Otherwise s=
ome
> > > non-HS400 communication has already happened.
> > >
> > > No need to convert users. There is only one currenty which needs this
> > > change in a later patchset.
> >
> > Perhaps, should we add Fixes tag like below?
> >
> > Fixes: ba6c7ac3a2f4 ("mmc: core: more fine-grained hooks for HS400 tuni=
ng")
>=20
> I am not sure. While it is more correct to move the call to
> hs400_downgrade upwards, it does not really fix a bug on its own.
> Without patch 2/2 of this series, there is not really a huge difference
> when we disable the SCC the old way. For the new way, this patch is a
> prerequisite.

I got it. So, we should not add this Fixes tag.

Best regards,
Yoshihiro Shimoda

