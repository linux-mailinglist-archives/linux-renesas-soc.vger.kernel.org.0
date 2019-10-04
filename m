Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289A0CB5C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 10:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbfJDIJt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 04:09:49 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:28704
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731053AbfJDIJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 04:09:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+CfQ6x9RDRFlOzruGj66f6im701NQx9b9X8fdqtN5tKDdSpRbjONkPkUEHl2cgaHelAyrn+SMDdrzmxzisxuZ55AD7Z0x9ky1Hc0bL8IKHmRjq9f1YYj3NKTa6h0el3u0HZV4K5H8ruNHHX/WR7hN3Nmt25neVA3bTi+vK24vxcDbyWrySDVkjrGq7q/meJYs18YyqwrWv6S4CIEnYtoEwQB3Y/qLVMAgH3EBtGTOYPmcGAX3Fl6g+KHV5RGX9B4vkjlRHrSYwi9TLeEDZp36hqmIymczXukN4t8nrd4Lc1XE2eI4BrdKAyBOEJLiGBf2PYaIHyK5TZOCDUwAGrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH3Zh+d8cy1zcI+sJbcd+XsH/9gz9eT/1IWZXK3stxg=;
 b=K9ji8k5HJC4rExhpGEKzZKyHyAZMWB3MgcT6g2yWIR72Hv45csg6PtOLsa4Y1u2qwlb5l/Uz4v6fOraRwbngOl/2CtdHbiqhABlXOUdJydb/Pb+UfnvUdQNsQkGjdkRctA2rUVHGCbrPQHGYO81xQ2M/i3miZVsfnajZUFBg8Ccx+hyadTwohKf1DXmwnUCVD/BdIy4axbpZOj4W3cOm21YObknulw5By0JqZQ/vHoFmKH59AT7XJU1NB702hBAnDys8VtkmDoMh+IsHUMmznsSayBKKTcx7vKndKOuGtWNoCecl1c243WTeD+lfe0bsxZ9DQ669v7pFxMo7rMNLsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH3Zh+d8cy1zcI+sJbcd+XsH/9gz9eT/1IWZXK3stxg=;
 b=rga5FGG2S9tG2wexKcd6Qs8340hztIWVbZXqm0c5P6HrS/UYVdqE2rS7XttXCufyNRVKZJIudndgVfsG6aERHSgQUfaZUOQEvwzgF5SXqBPK8ZNriAGsg669K4B3+3M5mtonas7niamlx0+AwFNYaz3mVd66NevPH3KWiU5iJMM=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1461.jpnprd01.prod.outlook.com (52.134.226.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 08:09:43 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 08:09:43 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC
 device nodes
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC
 device nodes
Thread-Index: AQHVeoCd5RvZBVL9dk+0CbJYKptE7KdKE+iAgAAM9jA=
Date:   Fri, 4 Oct 2019 08:09:43 +0000
Message-ID: <OSBPR01MB210356670050A41F2C3AAF29B89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570172057-46159-1-git-send-email-biju.das@bp.renesas.com>
 <87muehgel1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muehgel1.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb17b04b-8c57-48bc-c22c-08d748a236c6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1461:|OSBPR01MB1461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB14610992472F7E9919231A8DB89E0@OSBPR01MB1461.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(51914003)(189003)(199004)(6116002)(3846002)(6246003)(4326008)(76176011)(478600001)(107886003)(6862004)(256004)(74316002)(7696005)(229853002)(71190400001)(9686003)(4744005)(5660300002)(71200400001)(54906003)(55016002)(2906002)(446003)(486006)(11346002)(6436002)(316002)(25786009)(8936002)(305945005)(66066001)(66476007)(76116006)(66556008)(64756008)(476003)(66446008)(66946007)(26005)(33656002)(99286004)(7736002)(14454004)(6506007)(102836004)(81166006)(86362001)(8676002)(81156014)(52536014)(186003)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1461;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IHtM2vB/VKxfUz0v0bt2FXSc1tRj62lT3tTi+wki2A+9V8+gYt9DFZu4ZBksUnwjfI1onYIzQS3+ED/WRr4JhcC9OAl9RsY93tM0Yufi6ocJBEPJAkTASQlogG/MCHjz1Hds1Lp7nr9HBsN78cAiCLuqujAcyp82fWNj2WltpjUoxXj9n0zk4A1Hq3dVL7Sl90n8+kgZRUSe8A8yR9dFhGDU0y/bZ72u2TZ3isAKmw2tAwO2as6R4Uqp+2Av3S4xYFZsChb/nozRx7LsV2wwp0Fz/OEqKED/uC4DrpcNoxmM4/+gPkMHoBF0mLvnxZHayjIBWn2fZRoPKZL0W9+i7ViTAQUT6mxxUuus4M8rUsE6cL7oTNJIrIn3OlObtbFRjqRee0Y2JH94sDU/jrDdiGJW6x9P2cOvAEj/KxN9UbU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb17b04b-8c57-48bc-c22c-08d748a236c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 08:09:43.4883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqv/KfNoa7tu2Fka75zC7YZ/b4ConN3zqntF4rD6BV4m1q9cfXVqOfZWE/2B/qe69cH3yNAi0clWLtQdGP9OLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1461
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-San,

Thanks for the feedback.

> Subject: Re: [PATCH] arm64: dts: renesas: r8a774b1: Add Sound and Audio
> DMAC device nodes
>=20
>=20
> Hi Biju
>=20
> Thank you for your patch
>=20
> > Based on a similar patch of the R8A7796 device tree by Kuninori
> > Morimoto <kuninori.morimoto.gx@renesas.com>.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> (snip)
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				port@0 {
> > +					reg =3D <0>;
> > +				};
> > +				port@1 {
> > +					reg =3D <1>;
> > +				};
> > +			};
>=20
> This is needed at platform side, not SoC side.

Ok. Will take this out and send V2.

Regards,
Biju
