Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2302236C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgGQIRN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:17:13 -0400
Received: from mail-eopbgr1320131.outbound.protection.outlook.com ([40.107.132.131]:39520
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726113AbgGQIRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:17:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKawKwPLRgc0VcMdN7xP7EZxu93CZJ+j6FPS6NMOwUzCnwCXVHLR4nOgt3veqV1A/Du+3iEyYfKAaGUpjUe8OxbTa6kc1vBXyeXIYUR4FKEm4tjUBB8053QaNuCFquCBXpvb5IWVbcMjo/Tyz34E/I5D4O86I754zySBNFVrO+PeIvNk1ZY/1sbbBHULX9zrNi6FOem1kkNqSBOj2Bjhm8hKkNltAoP82OnOiDADxVmK9houIhRes/ZQyL0g2srjhRntROPWYYGoYye21dWQTEKzqIb1AQ6ulWWvcpbyG5hJLGMNHyZXxm/3TaNE+UAotLVLg3XX8eQm1pIzsDUCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxKnUdS11KO50qExARLZzyc2eWRKJvikdYHYspMAEhg=;
 b=Ze5UlERNk7JJ5pqWjLCbAk2Xi14lniDNk9gwYP2Ju1RF8mGa9cTD1odKsPoAY7pz6/Z729ZPiBDwRsK2zpgOSbCBZnkSch5l3s2ZATKH+Lc8dsv86W4FkLje3qV0WJUSsq4QtSDSnUsrE3SfiUAB/fL3EqCFiNIC/uYh4btqlSrtEYRY0Xs67t/N1uTlzGUvViFIIkuzHjxPE4jp19vB76UsZeRDR7yJ/7/Y4JiU2+UlpxziP5ufNs9DjWFuWDpPhX5uFc2pZU29WHfp0tP92LlNWgcfC3lm5ksK1ZHc2SwDxh7Vt18nbnJ0kboXMlon/EMO2Y8afIVUx7IH21GILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxKnUdS11KO50qExARLZzyc2eWRKJvikdYHYspMAEhg=;
 b=S1zFrmQY/+WK++XU6oNHdI+PIvIrK1TiwkBLhrPV5isxTVwWQLDazi/6Bb1ApXlQZ8WUsO7QCkLK0SncNjvUuinBosmUeD7qdQwWan6QoyZrrWoIq1XHvshkGrvP6Y4tr3TMMFHLki1AhCRepB5fmLOPiImez/oHriBqhtR3EVE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3515.jpnprd01.prod.outlook.com (2603:1096:404:d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 08:17:08 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 08:17:08 +0000
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
Thread-Index: AQHWWQ7GOkHjdBkHXUKqmcxt6gxgg6kLV8YAgAAQtGA=
Date:   Fri, 17 Jul 2020 08:16:47 +0000
Message-ID: <TY2PR01MB3692ED71A574F16848CD48ECD87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594642288-9986-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200717063856.GH82923@vkoul-mobl>
In-Reply-To: <20200717063856.GH82923@vkoul-mobl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 071cfc3d-47a6-42c7-be18-08d82a29cc8c
x-ms-traffictypediagnostic: TY2PR01MB3515:
x-microsoft-antispam-prvs: <TY2PR01MB3515523EF3F99CEEF746EE1AD87C0@TY2PR01MB3515.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PspqvqtpZx9ZsNrXZpFMIBPzT4Bnc0/jHpOr+i6pIYCHMmB2mCwzKJ5gEzv5IjOc1te43jpvGgLOn2GGA2X7ZEKyEPMadA3ehvYUztiK8orzK8o3v5B0lqr+FGYZzG1VLQvmc9VG35j/xxuzOsKV80lKBBVwrA1R8rKvdgxSDTumqnjSEIY8YsRxlAL9+tyZG0Oj/X6pVvki8vcQIopmA6pemk6V9IhCtyDe9rddVl3vRZPvPhp0nsAbrqGXU/U+Z8WDOYcdozCGWc2bCSCI7u6nQVrqiak/eYbJqx+43UpIvFFM7a/PbCe6yXmVBx2ankzZmYU1Fk+ME8UxKN1eeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(54906003)(6506007)(71200400001)(53546011)(186003)(55236004)(26005)(7696005)(66556008)(55016002)(66946007)(66446008)(64756008)(6916009)(66476007)(86362001)(52536014)(9686003)(76116006)(33656002)(478600001)(5660300002)(2906002)(6666004)(8676002)(8936002)(4326008)(83380400001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: d92N1XtgHvqWS+5JZni+wtU5tm2EkRiUXJJ1Ogl2JPIrCdwo8FWKIE6AkHhEtClgIW2t+OtzAZ5ry6RTf/Yc9ypvIFMqTZDPKS85pA3ppcyfudmEot6PFim3t6I3dHURnd/jpe6/DQnsRbXC0UXtWI9UBpMzfHOYCxzZWhUoxLEgIVhnXVVeUHQ5WgyUVL/CdS3+CMyqQimBUfihg580R1zUvujnT0BnlnmQBu8EIzo0BzC8Hl6uQxZVrChBqIxygXDoQRGs+gsiu3LG9454PS/BaiX/VyRZmnIQwWGoUxuwD49qj8aCoEPFdLULy1D9q/YcHCrxnpOowxN00GkNI1daIwp6gZRQ3nSCNIGSL9tM0CZI2eqhPaSXGhDatvSZKP+jtN6oHRB6Z5xahkyx3GtwwaL0FhchQ1+YfN0OZuiUb+p7mLkJxn+Ay8Is/a96pemNmlAUHlw50pRd5HK6Bw1FUUrVne13rGHMFLYJZ/KNBkirIGYLBomFTr+KWtbA
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071cfc3d-47a6-42c7-be18-08d82a29cc8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:16:47.4567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kb4Y0+Rh8bmo50iZkSWJJ/VobPYukwvJ3sNAjKm911oFNrIDk6thFD63ejgtGOdXJg/p+g2lT3Sxj3HblYbJ8sFBV680BfN9Pdtg51YCGtozJ5oSqxnEZSzC5cKl7M88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3515
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Vinod,

> From: Vinod Koul, Sent: Friday, July 17, 2020 3:39 PM
>=20
> hello Yoshihiro,
>=20
> On 13-07-20, 21:11, Yoshihiro Shimoda wrote:
>=20
> Please consider revising patch subject. It tell me you are fixing an
> error but it doesnt tell me what this patch is about :)
>=20
> Perhpas :move irq registration to init" maybe a better title which
> describes the changes this patch brings in

Thank you for your suggestion! I also think your suggestion is better.
So, I will fix it.

<snip>
> > @@ -389,12 +390,39 @@ static void rcar_gen3_init_otg(struct rcar_gen3_c=
han *ch)
> >  	rcar_gen3_device_recognition(ch);
> >  }
> >
> > +static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
> > +{
> > +	struct rcar_gen3_chan *ch =3D _ch;
> > +	void __iomem *usb2_base =3D ch->base;
> > +	u32 status =3D readl(usb2_base + USB2_OBINTSTA);
> > +	irqreturn_t ret =3D IRQ_NONE;
> > +
> > +	if (status & USB2_OBINT_BITS) {
> > +		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
> > +		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
> > +		rcar_gen3_device_recognition(ch);
> > +		ret =3D IRQ_HANDLED;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  static int rcar_gen3_phy_usb2_init(struct phy *p)
> >  {
> >  	struct rcar_gen3_phy *rphy =3D phy_get_drvdata(p);
> >  	struct rcar_gen3_chan *channel =3D rphy->ch;
> >  	void __iomem *usb2_base =3D channel->base;
> >  	u32 val;
> > +	int ret;
> > +
> > +	if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >=3D =
0) {
> > +		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> > +		ret =3D request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
> > +				  IRQF_SHARED, dev_name(channel->dev), channel);
> > +		if (ret < 0)
> > +			dev_err(channel->dev, "No irq handler (%d)\n",
> > +				channel->irq);
>=20
> This could be in a single line :)

Yes. We could be 80 over characters in a line now :)
I'll fix it.

> Should we continue on error here?

Hmm, maybe it's better if the request_irq() failed because
it can avoid unexpected behaviors. But, original code continued on error.
In this case, should I make a separated incremental patch to exit on error?

Best regards,
Yoshihiro Shimoda

