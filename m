Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDE6255203
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 02:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgH1Avy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 20:51:54 -0400
Received: from mail-eopbgr1310093.outbound.protection.outlook.com ([40.107.131.93]:45472
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1Avw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 20:51:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNYoob9PzjJJt72BZgZhUMOilg6Ue31UFAggqXQGgJeNFbSZniJW3XgUdnbTy32H24Nm+XYdBZ0gnBXCD+3rAfDq0zju6vI/2xdgC8B9Fd5SNXz2UQbnOW/fOHNFr2t663ZFjkV5lBPb3QHpHMk3DJD6dJCzuZW+QJ0OuKWedsoUkoFKcvPuQtQeQvN1TyF4vS4eIfrHYtxwlrVKW9tCtKWk1gn6AnWB6G/igRG3JNcJBR5MAIBTI6jc+XtdHgLSHoaxA58p3KltmHE/fjuruW+Ltd2AUOg/0gAVZ1XM2Eofgku3R6UmI6T3HVx214Oby+QCQGaGHWP1KFPNebI2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83rRVaFeplPP73XSSbstVRHVQX+2C4Hud1FPPn+dXs=;
 b=h5WvQsnJtgj/tEhcM6guU7+BzOsNKRgf+OnfraQDpC/zbPkJh26xjxU7gyNYj92Ii5bYoC4XEz5+KvaDXrrsu73qimZ6RZDbNzWt9VgpUK9uTzr8mA+WUpm+Z/WPyvCJASM/N4OgRBz72bM5Q+46ci7gQJijRGoCMmZWoNKQcvTICIm4Q8TfYLBWCE0CWORC09UwhODZdm0QXp1RenGdq57g143Y+62dugYHvjm83MqQkzcIsb/DSQVRZDOOHzFGlSr/5Tcv9YHezytfwroL7Qhlwg3Tbg8vvNfS0W95FtbKRR/1ZOGCpsvvRu32u5NjGQwN6vKw/js3NWzLHkS4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83rRVaFeplPP73XSSbstVRHVQX+2C4Hud1FPPn+dXs=;
 b=RbgJDyMVAiVDM9JeSdJ/wgHaBNh88E70G+nRnd10NyjEJKpUVUkYYzS3NBamfSWFX6riYthrS8kvlEtm5YFmDQbLWP6hHBVz419+P9wRE8YvlU6JWCSp/Y4LEOuv0Ilt/6EKbsI4pkMv+ZdmPeImU9TrjPtUVYKVDCRcGbMkzu0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 00:51:45 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 00:51:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Index: AQHWOmI34Rq2naXnyEWINhVI/t25BKjORxnQgAD7OwCAANxGQIBngd8AgBWPxKA=
Date:   Fri, 28 Aug 2020 00:51:45 +0000
Message-ID: <TY2PR01MB3692C46B1A21109E7CC03478D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36923A1D7091431CE3F73195D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200608212702.GD917@ninjato>
 <TY2PR01MB3692310754A6B4D6A05DADF0D8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200814071500.GA9410@ninjato>
In-Reply-To: <20200814071500.GA9410@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 12571868-2cd7-4fd0-3366-08d84aec89d0
x-ms-traffictypediagnostic: TY2PR01MB4218:
x-microsoft-antispam-prvs: <TY2PR01MB4218F73459CFF49D8EC831EBD8520@TY2PR01MB4218.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSbsLibdL6w9QtugDlrCwR5W6RCZJdxX4Wv+20pjAOg0cLychQpWqvqQxyr3KJHp15v6vrs6C2o4/ZSiD9xnzca8YnwYDwPsvpxi00O/I9xb4idjp1Qt6FHl7jQFXXawgp4pMyYjITw4Mi3RlR/hv/w4wLljdEwa+ckz59ID4DC1/a+839HfOwSma+sMKUUKA+9SzaIJqcCHDITjb6lqodFV8HgDL2LEdAn8CLmloHycLrpocsLwMa7WU/LMZlwZYDhJ8wmKb6I9d549RaKtF7rcifI+CYWxBC5MnCPKOQM4FbuvPcEPZhtoENJ9oOJMJE1XSnh+2HypabEI0aXlQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(2906002)(9686003)(33656002)(316002)(66946007)(8936002)(83380400001)(71200400001)(7696005)(76116006)(6506007)(54906003)(55016002)(8676002)(4326008)(52536014)(66446008)(66476007)(478600001)(186003)(66556008)(86362001)(5660300002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ADyW+WT1pL+i9oDeP9iF/tIqeizdkONh4Lp2XC0rAAXmv8VHIrpzFwMjhpZ2rUMV8FVyogqn59sPwm/pscFQWWZwk0iSAp8U2S7e/ywVhOOGp+xaPcJWujajZji7szktKJecKvEzBMWvCiSPLTw11IWFrkWYXVC71ttQ8RqOMlFJck9C6rclG4HIsqQyG7s6Le1/S10LY+GYTgJX8rRexOUnpQup4TWdfN7yraPNti74ghCGVroI5iQe6HeYohhEDCwRMy94PwxqjJGVn9vn6RDPpjYwZxoiAIrKpb9CmHQWASugxwhr9xACW82LhFNHBLFwYx7rWvuHOQYGk1PrN4kMrLAvJhbIhkGeaRsOW2Md30aZCam3BoDikzDkMwAPgNorYyDFfThzwU980j+gpNJjx8NESxC4LmfBpjQme4R0/IcuDm3nF6G5P46i5oBYIgi6fFmscbkkZZb/CSFFcc1KNX0u5bMkjNR1V7EUJS5MMRxJ3TSXo0QkJXT3O+e4mBBbjb93UTWP060kmY800CaOto26z+PgyFp18lsNYUbXd0guiCnRBe73KpWbx0Me9kQcQt//z7gQruqaOx3pE4Mzwt6lELEoLUJw6DXv9JyWDbb+6scPMUfW1a5tuAkssyJC0UrMn74CfiXwzXmuky14bDFLVMmxxqOeGZ63yknUreb7y1gha28GCC5E96R93J3ce3f7foas1Q9k6M1xHQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12571868-2cd7-4fd0-3366-08d84aec89d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 00:51:45.6816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht7P36KdSLp58Cv148GpPNRVi0wfKKG9ruSi3BNl7drzmHtSoKyurq7h7SbzXxWRH0P6PqQPq4kG4pcFmkaPnm9dhLemyqZx8IWv88WxeleleBaKH5gFb332pWUFttzu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, August 14, 2020 4:15 PM
>=20
> > > > > +	/* Tuning done, no special handling for SCC clock needed anymor=
e */
> > > > > +	priv->keep_scc_freq =3D false;
> > > > > +
> > > >
> > > > Setting keep_scc_freq to false is only here. But, I'm thinking
> > > > we should set it in some error paths like below somehow too:
> > > >  - error paths before hs400_complete() in mmc_select_hs400().
> > > >  - error path of mmc_execute_tuning() in mmc_retune().
> > >
> > > Hmm, I guess you are right. That would kind of spoil my approach take=
n
> > > here. Maybe we need another flag in the core like 'doing_tune' to
> > > supplement 'doing_retune', so or driver knows when any kind of tuning=
 is
> > > going on?
> >
> > Adding such a new flag is better, I think.
>=20
> So, I added a flag to the MMC core and I think it should work. However,
> I can't test it currently because, sadly, the issue disappeared again :(

I got a report from a colleague about this issue. According to the report,
this issue is related to retuning. When retuning happens, the mmc core
calls mmc_hs400_to_hs200() and then mmc_hs400_to_hs200() will set the clock
as 52MHz at first. So, it's possible to cause the issue.

It's difficult to cause retuning in normal situation. But, according to
the report, if we add a code which the sdhi driver reports an error
at the first CMD18 once, we can cause retuning and then the issue happens.

Best regards,
Yoshihiro Shimoda

