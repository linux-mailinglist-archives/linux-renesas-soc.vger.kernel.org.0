Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67281223766
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgGQIyX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:54:23 -0400
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:4128
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbgGQIyX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:54:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biXCCH3elnbABPFYmgxTlWK093VxWLKGgIu78WaSSNHaqSXwF0OpwD/ZXynbZo7Jw+EsYIOVYCfT+mRUoDrUqtPa/MZnsKWSnEjA3lJLKO8VfZgNXJocoGBZYM5SF5d8g+DGw7FIGZKLV5vpcP4CNEuHXMj64rrPu1b1Nbn8kPuZ7QNH8/jTaWjTCby0DDiKWnBF4c5SJ/rcYIkqS7+wxiV8JsJZRYU0uz5SlqXXC8s6/9OZmEG9TWFfbc4KgdJyTsit1Fp7EsgXQv5vTjxvBUYyN58lNt9eTkhrzN2rB747CMw5AZRObEAjukbxa//GWqJS8X+Dq7a3cF9hvwaFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeCxOxJG9HqeLgrMaGsP+sZ6F/0xgW8N0TGWplw1huE=;
 b=LuIMZe0af1S501kHxq7af6ucmMEv2YQhJ9/L8NuW6iRu/2ybufs3KeMRTsmUnZJgTrHx+jg3ukOKV+XhzucyFbzVZcg2tLaCz6ZrdZju+6tX7UzqsBWv80vSKfR21PTuzcCOUibfuPYa8it45W2XVGflMI9SD+Cs7HNAjDwNWuF3anzhjShNHkOL6ZVbadxLrtL6h1LJUlsNxhc5kFsWob16KVZPG5BCPPL5zejAscaB+Z9HsURmjHQWeDFJKDalo+sp2ZkOCzUwPIELCVBXSkFvMudCYwiabbVapfyipmIbXz+9NnNjbrxohTNgN9JR9PQKQTAnLgXWXf7sRnmgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeCxOxJG9HqeLgrMaGsP+sZ6F/0xgW8N0TGWplw1huE=;
 b=arbYDcjuzYAvF/uUyNrsuTlZqoZ5tTmLhxTNu+lg0uTnqCuNMc1Z6dIKXXz8GNP7g9C1limxVutTw027p4rZ1bjEgLihhLVhDkMncNsciFMuMt6Sn0XqpDLolxGMU1eWuekCKDDylihL98RF5QASQ3ESJDEdY9IGKjLeGXRvnlE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5280.jpnprd01.prod.outlook.com (2603:1096:404:cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 17 Jul
 2020 08:54:18 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 08:54:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix SError happen if
 DEBUG_SHIRQ is enabled
Thread-Topic: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix SError happen if
 DEBUG_SHIRQ is enabled
Thread-Index: AQHWWQ7GOkHjdBkHXUKqmcxt6gxgg6kLV8YAgAAQtGCAABLhAIAAAecA
Date:   Fri, 17 Jul 2020 08:54:18 +0000
Message-ID: <TY2PR01MB369248836774CB625EA833FFD87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594642288-9986-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200717063856.GH82923@vkoul-mobl>
 <TY2PR01MB3692ED71A574F16848CD48ECD87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200717084618.GM82923@vkoul-mobl>
In-Reply-To: <20200717084618.GM82923@vkoul-mobl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 52825702-abf5-4a17-8575-08d82a2efde8
x-ms-traffictypediagnostic: TYAPR01MB5280:
x-microsoft-antispam-prvs: <TYAPR01MB5280E9F96C8C533ECE913A34D87C0@TYAPR01MB5280.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ybsSSFy/GQDHGm/pVURR2BEYZBoJY5qMUda3rziqh/wBaNNDdDKr6XFflyh8ow4yBYd1YyHOq5VsG4/ZRYD2e9zKac7M6Z4clh97eCgf6fPB26d/7cPPG7ngYJEhe+9mQSvXYAQZBO1KJMmEnYw7YOuMsPk2OTddC3mdJQR1/1LclEC5DHSdD+xPdPK0MC5lrskh0wXjVDBamVF+8P8tNgyO1cfB+kCKpQ8cIdFYro+kEQV1pVTNRcLMpgZ9ma2DzgEmSiya9ptszaNTluprgQjvrtHKQ1bMWgLmQFLkoUExjTl86h1nEbVsTR5os3ASlPRyl+muVU0/LCv+MY+amA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(55236004)(4326008)(86362001)(64756008)(478600001)(6506007)(52536014)(55016002)(66946007)(83380400001)(66446008)(66556008)(186003)(66476007)(8936002)(7696005)(5660300002)(26005)(71200400001)(76116006)(6916009)(33656002)(54906003)(2906002)(9686003)(316002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WIR2aQ82ixFC9dHVJg4AZIKb4UiHshxfjc2hSi+pkXP0Eqd2GKy9xurvepLOKFKmGsegJV3+puogS1jYSSlg+29aBhzp2lmaVqUiX+mFYBE8kmhoTcUMDRJeckyxJbhf8QnMsdeeR3UavbLxjId0UzkLBPYD1KfvnnHkf+HULYcK5IWXvCnZfcV5jGAeNtGAGdJRHB+0k3RrTNsAxoHDELu2fN+ZP01BlVTxehIuP0SNvjBKuO/HR4ruWK7fyB1TEKOH06RCp5qoYHiDu3kfRd80npoy+j6gRY2OvZl14Q5H+VCaQTKccp9iB/2T55FEuaX0GtjJPhKu+8O0H8oygLfDkhd2/elhPjpWwLRzbr1zzg3JKGEiRraaengGYsQpyPpp8LRbhTiLUwSsHH6YDSnPLESU1JSbaJRFhjCnm58VgfG4stNzy6dyFHON7+0zqHbhbX5PZQP32ZRyaFgcrkbcnDw9QatJFyvDXauhc2kAYwd+lIJSDWD+eki8Iy89
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52825702-abf5-4a17-8575-08d82a2efde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:54:18.8732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYzGrPQJWChOMZDt44dl/AiiLhaQeO3+1ThT1DkIoU9YjTcy4vrxwWPskLeahKJHVqpfhFn1T1y8YiuAz5Jph91ZiRR+a1eQ8f/MWA7TuXHBlLSY5mu0pOqKChBCZeeL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5280
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Vinod Koul, Sent: Friday, July 17, 2020 5:46 PM
<snip>
> > > >  static int rcar_gen3_phy_usb2_init(struct phy *p)
> > > >  {
> > > >  	struct rcar_gen3_phy *rphy =3D phy_get_drvdata(p);
> > > >  	struct rcar_gen3_chan *channel =3D rphy->ch;
> > > >  	void __iomem *usb2_base =3D channel->base;
> > > >  	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >=
=3D 0) {
> > > > +		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> > > > +		ret =3D request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
> > > > +				  IRQF_SHARED, dev_name(channel->dev), channel);
> > > > +		if (ret < 0)
> > > > +			dev_err(channel->dev, "No irq handler (%d)\n",
> > > > +				channel->irq);
> > >
> > > This could be in a single line :)
> >
> > Yes. We could be 80 over characters in a line now :)
> > I'll fix it.
> >
> > > Should we continue on error here?
> >
> > Hmm, maybe it's better if the request_irq() failed because
> > it can avoid unexpected behaviors. But, original code continued on erro=
r.
> > In this case, should I make a separated incremental patch to exit on er=
ror?
>=20
> Yes that would be better :), Always, a patch per change

Thank you for the reply. I got it :)

Best regards,
Yoshihiro Shimoda

