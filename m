Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCCA20CBD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 04:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgF2Cma (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 22:42:30 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:14781
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725983AbgF2Cma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 22:42:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4IyAQhN+wpqGVEnXYeXS6qdjihhvDPdO/tySoxgmw7xjfe8MwjghNt/MNHZC9Tj/9YR0lRiKE5DMt08TCU3Ypg9Ug3OJV+CgZIA6cjMcNhvCNd2fFGChtOPW4xyhiu1tylkFF1Hw9CcGaAg74AA9WXtlbXedpZt2cVIJ25aJzSKOU2yeLIaaOuooe7NYwPGITifPa+AnZHvtnym5+Xd/g15qSHPiyW+ZEwok5fJhGf/aOrtkh7ug5lr9u13d4+dwe/8V4YqKDtww8p+UXNO420A3+4s43cPPz3CGrdDvwbT4/SZogwoROGl8gFNyXStGTgf61ukI3cOExerkAnOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxjrRQ/Xm60AUljb+ncHyTxJ18InEZucF+dgDcncihs=;
 b=ZPgTdC4aGPMEhJVObqIINQber1DShw5AL0+JpIrJVdWsQLrWwk/uMDSJdJdtd1plLchzz+uXYRJJ8z9Yq0Fi2btegqcfVoO3LOj5NVLcXCwKvwE3Gnmzv4brZEq9+t/hmW37VPrZqN4myJsPZUOlw+ni83AD7EA72r1BMqKSFEo7wjqZKcEQOOIFMeB1cfHp1Q53/lSLfIO7aYWntIngbfI2yy98Kn6pYTmev4ZzOBSUugQYKdKVr0AiBMI5qHrtmdGxLx49g8epJ2k+zmj05wCp2JOphcc0PkuBBwmu8ehs8kpzelQbvgPgI6tAwr16khAQOPxeuAPRYhqUJ+5MWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxjrRQ/Xm60AUljb+ncHyTxJ18InEZucF+dgDcncihs=;
 b=qM33i6scZNKsrIC4+H6VNZ5BodIdn7iD67hQs/zB4dS5qP9+5n8hnQFb1DYqHKXlQHXSnkMPfqCJQ3VKfT1AFkxuYh0NYoquSnjZJ7nBBOzbHMobwuaZuM3NpmTLwLJGzTuIpghNgEqOuI+jnr49rVPCaBw+af40jdKIuA/XUQo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3645.jpnprd01.prod.outlook.com (2603:1096:404:c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 02:42:26 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 02:42:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
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
Thread-Index: AQHWS5y220V49G6mUUOIhQjj9iWCYajq9+eAgAPnVSA=
Date:   Mon, 29 Jun 2020 02:42:26 +0000
Message-ID: <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
In-Reply-To: <20200626143914.GE5289@sirena.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 24f1ac22-98a8-4c64-db0d-08d81bd60f67
x-ms-traffictypediagnostic: TYAPR01MB3645:
x-microsoft-antispam-prvs: <TYAPR01MB364508DD5850606C1D5B6FF8D86E0@TYAPR01MB3645.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wFvbADm7E9DXAZRNjVLbdT3w3bBTRH7SMbE9QWcBDD9AsEkZhLUYnsg/uXYkH0EHr/Q/8QUYWhb28TwJ+YIFsal8oNhwps1S0vjKtkJGQGH06pLaDh0752bp+wdWiVI26iXQ16pYjgUga26JDNZiG9pjT6phZfd7askaVB7etxp1e1qb8D2zktFdSAWVf9dL9JESWvCv302AvyUHkTKD39Cb95YkSAsruA+1AnCkva2XPseyh9UDY7vn2Yg48GcCxZpsfi2XhekqWdX+YAcrFoE/HpNCqREp1c+62pqhSYFQCahuPU5TfabE3clAe35mRlMIGd17xxAUXqBwddLSMhoyOv3okUG8k0QBmQq/IBsG4cyL9/31i+w346DD+gGQhmy6d4klaMtcYT9ljvkWzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(966005)(316002)(54906003)(66476007)(26005)(6506007)(33656002)(66946007)(6916009)(2906002)(9686003)(55236004)(66556008)(76116006)(66446008)(55016002)(478600001)(64756008)(15650500001)(186003)(7696005)(86362001)(8676002)(52536014)(8936002)(4326008)(71200400001)(83380400001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Mdceu0boJZ7ajwIjuSRaV4LlfmM+5CmFumsDz7poFwP2rITsdpseCI/JY/cgJGUW+ZaHyFnwNMhOyDOv3jdHcSI2EJ/agy+BpdbieYeXAhRbMaMHIc0VHopMH1jTsKPTeF3PcVDpf/0/xXbNOug5nIBhcRxeiOCc/LMqcrVFBTjC6iGXR9RHBg0u0+eb5o6Y4PIIhHpn0sVsc598/DG2tqxGKOaegxWJzzkXirZKFPsR3AUj8wJ0mWXVAvJOHRbXopJDdKyvsJ6v3CVir08SeUGbvz+bUb8Gd0cwBnyOUQgt4gMYyXsrc0j5JWnkw8SZO3XJAOhXh4pnaPYGw1X53JaXJFR2fFbPoykCrHRHx2zZm+q34AYSSXubbqY4Zjn55AAUSN3QUbNcuIGQbj2m/I8zGrIPusBJe0rOoba60ioYw4CWjq7I9zWyUJczhZCcOJQs6pxKh+ufV/5Ckn0ryAj2L7F+ea5LT3IYkoB2mG9D3d+1oiHStxPlaoyV/FgB
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f1ac22-98a8-4c64-db0d-08d81bd60f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 02:42:26.7241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0YuvJaDWUIKOB4/uw8AZlh2TW27np0WUqjR9hbx/yJbyqpUcZ3spJKkgh9G4vh+1Um/iRs3XPywiEv53YzSROQZFOF5qeuc9S3XScingldcINYnoMHkeW/MaeCUof0r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3645
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM
>=20
> On Fri, Jun 26, 2020 at 06:32:20PM +0900, Yoshihiro Shimoda wrote:
>=20
> > +static int reg_is_enabled(struct regulator_dev *rdev)
> > +{
> > +	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
> > +
> > +	return !priv->disabled_in_suspend;
> > +}
>=20
> This is broken, the state of the regualtor during system runtime need
> have no connection with the state of the regulator during system
> suspend.
>=20
> > +static int reg_prepare_disable(struct regulator_dev *rdev)
> > +{
> > +	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
> > +
> > +	priv->disabled_in_suspend =3D true;
> > +
> > +	return 0;
> > +}
>=20
> According to the changelog this is all about reflecting changes in the
> system state done by firmware but there's no interaction with firmware
> here which means this will be at best fragile.  If we need to reflect
> changes in firmware configuration I'd expect there to be some
> interaction with firmware about how it is configured, or at least that
> the configuration would come from the same source.

I should have described background of previous patch series though,
according to previous discussion [1] the firmware side (like PSCI) is
also fragile unfortunately... So, I thought using regulator-off-in-suspend
in a regulator was better.

On other hand, Ulf is talking about either adding a property (perhaps like
regulator-off-in-suspend) into a regulator or just adding a new property
into MMC [2]. What do you think about Ulf' comment? I'm thinking
adding a new property "full-pwr-cycle-in-suspend" is the best solution.
This is because using a regulator property and reflecting a state of regula=
tor without
firmware is fragile, as you said.

[1]
https://lore.kernel.org/linux-renesas-soc/CAMuHMdXjU7N4oG89YsozGijMpjgKGN6e=
zw2qm6FeGX=3DJyRhsvg@mail.gmail.com/

[2]
https://lore.kernel.org/linux-renesas-soc/CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=3D=
LXJZ5MPytXtT=3DuBEdjPA@mail.gmail.com/

Best regards,
Yoshihiro Shimoda

