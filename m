Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0340E20F07E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 10:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbgF3I3Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 04:29:16 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:29315
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731227AbgF3I3O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 04:29:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SU+RQHxKRfRSeja0XhbSkG+3uJ18yZPIHj1OCDEoZqy40j4w0XtzBPBuWsQulRyhiVUJN/mLQv/9d8fPQCp2PQ7++tta0+3zlDoDc7WNPwgxFV9oS54xQcrJcMXR2I0PtvJjELOr0PMh8ZmPjULau6HiPvYkaKEPGzzhDWRcfqHJlcGb6oe61JztlXD1R7d/ye6AOxZ8TGbyj+o/LaKvICFar5tKaiJv9TOiCXft+PVZzx4n4zFVgMPIuM9B33tpNL8a83GVPaGhP1EoWJI0ZQUoH0R40lpjFrdnNGwoBM53OHVDFw6YdyhML6kScJ1PyH8glJJXZzTs9DpVmAb4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quotAp71mqfyvjE91Fn8oJMvXmO6OmLe8zlyJNYJ/aU=;
 b=Yb1ao9TNaq4WsDQsNPIFRQmdgh6Y0wF0llu88Q010mSgitCmC1++0b3+gUWNpU3sSygHSaEtycGiCI+0aCirP0MrZbxh/NdMWYp5C/5qv3iC4C98WSZ0GEzSMlvg9KWHItOSRrVs4Ij2NP4PQ/cu9ios89VUZkO1gpGHkeVstwlN3IbijkvcZpj/cQrRezFPdUo4MqASmI0I/SO+OQzBFZ6skhjcm7ck1QiwGBXMc6elkJlxpx7drT4pbvYALbWue1KheO5TYatmdcfrxPCyKeFy50er+TN0WN4DUX7Il48UQ+hiT2F2L0Zbbza3n5eJcTaKf/N901BF5+lSIppsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quotAp71mqfyvjE91Fn8oJMvXmO6OmLe8zlyJNYJ/aU=;
 b=jzGXp411a8IP8ABnBP+k0HJwyd5/vnVfQocLx9ML/oxapG5XreBNVdYtFQAGjjXnBQHCkRTNVNVaiDb2wg0asL9E4q4AK+/2kAxnS+tSVt08SkMlxGAe2BeJkGEIwK11Ig5ru4sUzgQ/yCQo8KCGj6dD27t9IDLnuVkg+aSlC/8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3936.jpnprd01.prod.outlook.com (2603:1096:404:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 08:29:10 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Tue, 30 Jun 2020
 08:29:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Thread-Topic: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Thread-Index: AQHWS5y220V49G6mUUOIhQjj9iWCYajq9+eAgAPnVSCAALNbAIABQbjA
Date:   Tue, 30 Jun 2020 08:29:09 +0000
Message-ID: <TY2PR01MB3692F64AB29BD83203CFC802D86F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
In-Reply-To: <20200629125756.GC5499@sirena.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:6993:87cc:5ed8:ca72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4319976c-0ba1-41ec-a6e2-08d81ccfa9b5
x-ms-traffictypediagnostic: TYAPR01MB3936:
x-microsoft-antispam-prvs: <TYAPR01MB3936C7DFC6D66956E5836A94D86F0@TYAPR01MB3936.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: arZmvLfbeTBNS4B9j2SQ8hOrIyqd3ZUQ/kx0NzIM7XR6ALd5GGjJl7/1q+ckgBoqbjUiB8mzFalgHrFy8cQjzVuwm1b4gPVyIru1SCITyglTny/i53UkxpP+cZ7KZlQbC3QSQc2DTSaLloLVB2w96Xwe1rkKMIHe0wxKCtdiUBDItKKTlwT11OK+MVFl1pAHdgPQNRNbdN6p9WYnXFfdQ4AwtPTkB0OqpasU/dIZK4xWfqUGgiu2CmNMe6rV4Q3VV20Ldi6NdMuuCURay4D6iSCS4DegKSZJsSR1afytMHs0k+WZ2u9l+RhzmUAh03tBSgguUi72ROkNzYvfeTZR3n0Ow6gwB4HMZZ/SsW+tAh9+TRBJy22wIK6JkWnVgh1SdfqHQf+z41Trt366e+JHWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(2906002)(33656002)(52536014)(5660300002)(86362001)(83380400001)(6506007)(8936002)(8676002)(966005)(6916009)(478600001)(71200400001)(7696005)(186003)(66946007)(4326008)(66446008)(66556008)(54906003)(15650500001)(316002)(66476007)(9686003)(55016002)(64756008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: glyAAUBJr0Tu52qfFnR0ss2o47VrE0UifZ211c7YCBQOABQJhj4F3xFNRjalTZa4OLH2QD1s2mS+Why97xgT1fftucBlmBYjtFgrecwQl5s8wrfilWdCu/Vh45GFbzKf9jEaE1eIm3u7ojFPJITDky7dmvO0m20j88kprolKMyj3UWLWyB3gwEsYOOlsE07n+jcvftRCq6g+2UaFoiBmF4P1gcAVkbmqGW9JBYnC6mmox6YmPSDLINcx+VBVxwIF9F0T547QCB3g0FtBWjF/eNB5HdStEYC0rDTQH+PKDNWzTQBpIAYFkrjlT5BUe/qj0/s2BXd2dsK3Bj2sXnhgoalnByad8dpen5d3Eu7ahOkv6ZRptAhiVbovaRibEi70LutmTQhuYXkuhEW/xwrQzMplM1Tjm0LbVnIf8iYv6i/fZ2F8bWhdMJhckoe1Ddd5mRvEJqYEch4zQE8IWl1+M7Ik2KfXleP0o46aha+shncNI8KTZ14r/1K2toJtJx06iF9RANiwAfPQGmIfF5lKTshq9lNMa7TgKDy8UBeOCnE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4319976c-0ba1-41ec-a6e2-08d81ccfa9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 08:29:09.8600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWmMucArLtofnGhvjrU+YJUugIps0rE38MKwuuno25G+AgwYqF5VLHh0frDf1ErYYUT0GvxVtQnWJcjBrFN/cu9WpP9s7SYYFX9WPro2kCTHGeabnEW7visIGVOzPTwo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3936
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> From: Mark Brown, Sent: Monday, June 29, 2020 9:58 PM
>=20
> On Mon, Jun 29, 2020 at 02:42:26AM +0000, Yoshihiro Shimoda wrote:
> > > From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM
>=20
> Copying in Sudeep for the feedback on firmware interfaces.

Thank you very much for the discussion about the firmware.

> > > According to the changelog this is all about reflecting changes in th=
e
> > > system state done by firmware but there's no interaction with firmwar=
e
> > > here which means this will be at best fragile.  If we need to reflect
> > > changes in firmware configuration I'd expect there to be some
> > > interaction with firmware about how it is configured, or at least tha=
t
> > > the configuration would come from the same source.
>=20
> > I should have described background of previous patch series though,
> > according to previous discussion [1] the firmware side (like PSCI) is
> > also fragile unfortunately... So, I thought using regulator-off-in-susp=
end
> > in a regulator was better.
>=20
> > On other hand, Ulf is talking about either adding a property (perhaps l=
ike
> > regulator-off-in-suspend) into a regulator or just adding a new propert=
y
> > into MMC [2]. What do you think about Ulf' comment? I'm thinking
> > adding a new property "full-pwr-cycle-in-suspend" is the best solution.
> > This is because using a regulator property and reflecting a state of re=
gulator without
> > firmware is fragile, as you said.
>=20
> TBH I worry about a property drifting out of sync with the firmware on
> systems where the firmware can be updated.

I understood it.

>  Personally my default
> assumption would always be that we're going to loose power for anything
> except the RAM and whatever is needed for wake sources during suspend so
> I find the discussion a bit surprising but in any case that seems like a
> better option than trying to shoehorn things in the way the series here
> did.

Thank you for your comment! So, I'll make such a patch series later.

>  Like I said in my earlier replies if this is done through the
> regulator API I'd expect it to be via the suspend interface.

I don't intend to use any regulator API for this issue for now.

Best regards,
Yoshihiro Shimoda

> > [1]
> > https://lore.kernel.org/linux-renesas-soc/CAMuHMdXjU7N4oG89YsozGijMpjgK=
GN6ezw2qm6FeGX=3DJyRhsvg@mail.gmail.com/
> >
> > [2]
> > https://lore.kernel.org/linux-renesas-soc/CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR=
4=3DLXJZ5MPytXtT=3DuBEdjPA@mail.gmail.com/
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
