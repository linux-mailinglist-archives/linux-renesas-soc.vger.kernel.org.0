Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85551DA33D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 03:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732343AbfJQBgp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 21:36:45 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:18066
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727399AbfJQBgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 21:36:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9kxKmwNny3l4g4iqE4KIRYayJR5OsWVoc1uL2d7rlIFAodpeP8zEOon1CxEQJQHrPf73d7YVj4+3ZAOqJUR+w4kTKwIPYsaQMR1dPcpaS17d+d+HkJnGOc3VCdBFVVCwBu9h3B/xlbA63xR/GLtrrwVAdX8U/de05HaAG6et4dzzi9SRU4fdvQHZMLH1bkETp527QHVk+xkvPDnixlbxbd6jNVHmRTOYmMMcyklwv1DXOqG9m0cC+J9O8GUovwBFcBHK7mjwXMIN3tL0yEWzQyqJSqeH6gpH7Rhle2phU+I/wDdOzWklDupKkTfLYQVIqJdCCVCjLDLO2eiNADj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgrTaNYtL1FM/njzT0jHC5JPCOpaNdp84x/QTUizyj8=;
 b=IggnyanX8sbZMBJWwcHFABYFzTyxQVsLHB+JA+EK+dtd7XlqNy/gDu+/uFv2SBANHwh4A31Kji4XVvoSlmPQnwyAREvSzK7Grpc69bmJvxU4iBWmqNHoUcOrDl5uBewzxGUrYttX001goc6/WmRrg+w+pzW4RJYSezssyXabi5SZV3dcxr6+FBBICRmbJ9rQtnmVU7yzAtFHNnM7Rc4kZgFDegJTsmKRY5MlSs542kWGsLZ2kxbxCO0UTTg8xeEj7rtfq0Pu5A9ROLuAUsoofXuPY0SNPzBsdNpIZD4HHybKSrIUVfuNApRUjpIeOlKWppLIooUii4n6F4KhdJExnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgrTaNYtL1FM/njzT0jHC5JPCOpaNdp84x/QTUizyj8=;
 b=oIYVrs1LR6GSZWPGlxI4SMfGvVssJS15Z9A1t2g8ZOjvGNplp5VjFwFHFD8vf10QB1H3imEjOXqMzq9sbydC/q3+ehi5kaiN/Y0DipY0pakE0siv4Nu05+A7vJoDXhUitm1afvydLFecme978HJcK3GOTILrtTWDfPDmKjxjPRI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4927.jpnprd01.prod.outlook.com (20.179.186.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 01:36:42 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 01:36:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 typo in example
Thread-Topic: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 typo in example
Thread-Index: AQHVhDH0LiSMAtwg40O0VWQu+Et40KdeCNsw
Date:   Thu, 17 Oct 2019 01:36:42 +0000
Message-ID: <TYAPR01MB4544C86494D9D468897532C8D86D0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191016145650.30003-1-geert+renesas@glider.be>
In-Reply-To: <20191016145650.30003-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f89c90c-2fae-48bc-d308-08d752a27699
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4927:
x-microsoft-antispam-prvs: <TYAPR01MB4927C691BA6476B4D6AC577DD86D0@TYAPR01MB4927.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(4744005)(86362001)(229853002)(8676002)(4326008)(64756008)(74316002)(8936002)(66946007)(76116006)(33656002)(81166006)(81156014)(305945005)(7736002)(6436002)(66556008)(55016002)(66446008)(66476007)(6246003)(9686003)(316002)(25786009)(478600001)(256004)(476003)(110136005)(26005)(6116002)(66066001)(52536014)(186003)(99286004)(76176011)(11346002)(7696005)(102836004)(6506007)(54906003)(2906002)(446003)(5660300002)(3846002)(486006)(71190400001)(71200400001)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4927;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTKTvZ/B2deQDM8bm4k9Rtl5r85RbTVTw/s4sDnkeM3VUCB/PgVAuImSIyIpu4mUmgXpjqF5NBHGsvJGqhNTPELdco+HFigVoAiFrxy3/FMVN4qaDFsd1jGuxqse9GCDtcUwfoiXdq2GKtrmNOMNFaQKsu8w5S9aBkK73IBCQIV1ed0AmnBkwJFSxS/ErzK0CdF6wAc/mIWApw48KtaX7kj8/5LZeXKlfdWAi4jLmjNX8hq2a7QQdkrGsfQza+K+/BoKFBm2dxIUz3bzY9Q3sdgZZwXq5a8ZrQNqJzNOYs3kQCc3Itu+FYcDg5PFTQLCTNGxRGyyXJAUY4rt/KRO+/+cR+ejn/eBIu2WW5/zBusa461viS3ImeqsHZPCusGQYiRv93HkEegA1u3pouBnKgtMVCF+Bh30ySstqgBWBes=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f89c90c-2fae-48bc-d308-08d752a27699
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 01:36:42.2457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvi6rIfASKztGfo2dwkGVLRSpUoBcOomT37WRDRtMavvdJqTwoVWwfs3JrPeJBXUEmNNea5fiSCJE/xwe60v1T7UDLsM13/FSmthu1L3OZzuMohAQavMGV9HxFMJ1RPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4927
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Of Geert Uytterhoeven, Sent: Wednesday, October 16, 2019 11:57 PM
>=20
> The documented compatible value for R-Car H3 is
> "renesas,r8a7795-rcar-usb2-clock-sel", not
> "renesas,r8a77950-rcar-usb2-clock-sel".
>=20
> Fixes: 311accb64570db45 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car US=
B 2.0 clock selector PHY")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> ---
> This binding has no DTS users in upstream, nor in the BSP?

That's correct for now.
So, I'll add this node into each .dtsi after I added the r8a77965 (also r8a=
77961?) compatible.
# I'll not enable the node though...

Best regards,
Yoshihiro Shimoda

