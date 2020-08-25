Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21639250CCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 02:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgHYAQw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 20:16:52 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:13773
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726041AbgHYAQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 20:16:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRLJNdPNku23xZ9zuaQFKjoUBEElsZGNPfWGrggo/L/0qgIkbS0xHajcAbGvL9cUszxSrBm7i4tMXNBEVyLjPWFb02e/GEHMNPyG3pFlo1I9OATsnvJ32Y10opDPUHlKfsYoCacFlRdPNbMqhq/2SEh0nyNfpzpiO/qsWpqiyEn/SCU2ryS95Z7bM+TME4Wli9ndFAN0T59EQo+iY0yV95m8FWhBSHJWw/oAc6ppY/rmcxjQWLvInUM5nzt/Doj0xPockomM/m1KRfbx7AfQ413GLwfUo75j5ewZT0kKAtoD9WiASJPSfmoygMYHQeuIiZ58rLXZYrgIoEA/g3bUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlCIj7OkiX8LN+67nDunhm9vuCWu+1buWzSU1N/aWgo=;
 b=T/fjOy0Y2d5ubrk4vfMKMBN0MlnGZshMkWWGenXk6BGydBhtrrEfo5O6jam6jLWyOxHfDjq74YpBcuU+aFtAQeVfpSCqf1GYhAeQV+kBj4LAnc4Fv7x1i0PGZzjAlGkuNUFIripEVTN+Nz3QNUbIh0okKtmBuc6p6iKdLyUQRUR9Ko+VmymcoimM20YI82F+H9l8x1gmhn4y3S4s/RdtnOj+b+XXrZDH0mZqks960kWnXteyQ1EFdyueBY3pCgAhFNUKIpmKRxSohDhSzNXHLdrykCP5pldEMlqpzvwIA5vPJBpWMa83Gz91dyQmLPN6IQ/5zYF8vRDbnCD8tqagAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlCIj7OkiX8LN+67nDunhm9vuCWu+1buWzSU1N/aWgo=;
 b=V8rSyQt8xJxLEUhvazOOpxgTm0OKdw+oRaG10UfcxoKNsd/gBhDD3LTnSQAQ1fBZV7QBU4Rt1nC0FsYO8Y9aXaJBLlGtmer0vFxUSlZ/1w+pWa/BuFkanfcqQ58s80CnIMwl0wiJJ44IqKvUn2mdCwovAz3pKTZcVZ5ehIUX+kE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1725.jpnprd01.prod.outlook.com (2603:1096:403:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 00:16:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 00:16:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Topic: [PATCH v3 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Index: AQHWeiBo2jykZjtF8E6SC/8275D2TqlH9WrQ
Date:   Tue, 25 Aug 2020 00:16:44 +0000
Message-ID: <TY2PR01MB3692850B48F2B27E8BE9A7A2D8570@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200824141053.5062-3-biju.das.jz@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:212f:de6f:5c90:bd07]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a28bd48a-29af-45f1-1c1f-08d8488c2656
x-ms-traffictypediagnostic: TYXPR01MB1725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1725E88378E5D08B245F4004D8570@TYXPR01MB1725.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0+hI1wuou2hbgDfEGDqOoRKC6NcIkdbj2mKMeaEU0wkN/VJ5j2mJwmzB+gybkhUaz2IaGA8aEPj5VkooQKwQ25NWGeW5IWOyWgwA8U9qCFluua/Dzpkcw2EbkuFuv7EHh3FTnGuOA7Ced4uR4SDHeA8aWyzj+mxy849N62nRBnbxajFxBh9XzonzKZyvVqB89F0WbjPK5rcOlk+7jzGRXlyBlquWRbSFsM68vhSTlKHcuJk37DLWLdNJmP6TesXMhTNDserBEWEqAiT5JxAM4cLjvfptiMmoThRO3n6gbpg8OpTDeEZpi5l40FiPzMWCC5f6lVoJNrKiEF5I2XoDFmNrXzuS8ZnC2adPWAiLbHum9G7H5mRd83nJ9W6j8hT+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(86362001)(8676002)(52536014)(2906002)(71200400001)(33656002)(110136005)(558084003)(64756008)(316002)(54906003)(66446008)(76116006)(66946007)(66476007)(66556008)(5660300002)(186003)(8936002)(7696005)(4326008)(9686003)(55016002)(478600001)(6506007)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: B4dqMGyJW/gOi4frh98lGrr+nYFvWsH8zVfBuBzjbMEFNp8Bk1Io8C/qCzXA/hwPlMjzsoGf8YTFeSCD4Z6e/yXrkrX+C/ywa9XW7pCvnLbaCmYInAJizHBgtJ55a9X9HZYmlI5RE74R58kNBXwo7l+qSPPBG5hyqR9vFY1mH+jRoyav+1M8pV8HEnVaQ/mSi+dv6CHm2UzdnrX237TI3z3J79cqOhr7TLK1752OPFyrCN2vJOh6o5Yi8XzKqaAaLG+2qOFO1ZBLpXF1yv1yXkM1U8TfYsUUcvbrnajpYv2E4/Zi/IfzMBASgm1tiIQmyMwrMGsuFBxMIT9gp9oZpuvca+5wlCGmpMD0YfA/aTMIx81kFuihoOyKfoB8HeHFzOUclxe9nY78P22tJ4j4+Qur0E8zmNQPAXswq7jnFgC5KJSFgBoxiDOVeR3gxnNaVs7gLHN08on2Ca7GtHcueQ7yij1Ok49QcIbp/xJQ8jUQQYk4HTw5zPPyAR5sx956sQpiSqpbiRerlh08dCSgSfYNRecVd73TghQEECW30ZCSil1W2Uag6Y/kKOckq67u7TNHZeWifEBfy035xl5lZeFkLFw79B+pKDocuXJzGJoEQGPOntIwa7jOCfkRAaJaaO7MFStXAOdEJDZsQ7DSEuZawUxQDDdyuEhzJCJflPdT9YeKEJbkn0ce4nwObqDJ/EMWr3O19YjpkTqUraLasA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28bd48a-29af-45f1-1c1f-08d8488c2656
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 00:16:44.7394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPYam3ylx6tafAVTUIyrdN16fIvozixnm/6yjdlmSDtu6YCqnizeC/0cRVgvInEbiIq1WelAYtR/qVcVjSiWiFA8WUOtCyWK/hxKlVZ4SfnX8Fpp3ztP/Ydi+/6ytGNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1725
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Monday, August 24, 2020 11:11 PM
>=20
> Document HS and SS data bus for the "usb-role-switch" enabled case.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

