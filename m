Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7574C255A02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 14:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgH1MZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 08:25:36 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:29843
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729123AbgH1MZd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 08:25:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSqPOHIXcBP6mwrGWj5Ovqq2SgTFO+C2w0Se8oVmarYzj9LJ5m00BiL7b9qP50WvecUfcBYqhaztiq7ZRHsRg3hEvewVhP36AH48xS8BNQX5OoGADLJuyvADNVRjIxwr9UEjocr8ZV3wDDhSsA7jL2gh8TuNj9BelJOBgRqv8DkS2289pijR8T90t6XNeK5jn+uAjyqCtJq3nFXeB/UQmRxx5DIKFFIDoPn3Oxgh1C3cD1y5DoD+pFfHfOSe1/q623kR2QFuqUSO9HOSWtlUpdsB1OsHF4dNlMSyI5liWhIBMC2SmDVcmLr3MAczNp1E+xd4IO9JWRDtqYKbVvIEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNWk5KD4eCK1klmT/qFj4DuDuVSK8cHoZjxFsZS2UsE=;
 b=T3CB41N6kIPkgasddXyEtyu3btU/8GDXHt7hX2tKwv/jSIIPjIwY9YaiZX6Yy642UzIbwXluYzFbhxVUy+BL/QeOrDs/Cegl5rjHZRuRplA/IfG3qw4q2w/kDNT3KTT9MNn+c7bg9O1PFxMiUH/sqp0H0+//nMd579Obd/TpiwNuiogKDjrggGp+/3Nzuu/ZTkMPjjltq2l8GBSABdlMr9FVQyp+FCDfdVvhCTTM5OgAXskSZ//1e6iKWLkIW/XMxDaSRG75dkJHoZrfM+GZt8Ke0HjzyDgBwPIr/hkqoSFxMYDBgI5t3xq3PP9FHkZCH+GJGQ3hAac6+F8y5Cec3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNWk5KD4eCK1klmT/qFj4DuDuVSK8cHoZjxFsZS2UsE=;
 b=EQQ0CFjAu5D0UG6iQDyPcSD8072Vla2l0dJ7PNjjEADLPKtXm+FYrIuN71lTbnO49b5Ze2cjomAWYIXkRCP+J5GS4QM/43rCYEc/dVOFNhICKOjt6qs1SZAvbVEGPU9aBx5WVo7Zne9Zb88ygUPJROb+uyJImT0FTND38Uwbimg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1817.jpnprd01.prod.outlook.com (2603:1096:403:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Fri, 28 Aug
 2020 12:25:30 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 12:25:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2] dt-bindings: usb: renesas,usb-xhci: Document r8a774e1
 support
Thread-Topic: [PATCH v2] dt-bindings: usb: renesas,usb-xhci: Document r8a774e1
 support
Thread-Index: AQHWfQ/lJJAKTkDaH0mjhAANDn85G6lNckyw
Date:   Fri, 28 Aug 2020 12:25:30 +0000
Message-ID: <TY2PR01MB36920FE551287FC3611F5D1DD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200828075019.541-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200828075019.541-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a8fb611c-aa5d-434d-1b7d-08d84b4d73f0
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB181765F7233E11773569D4DDD8520@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k3kTauDZafaMv7NA2KZVUTgTSa05LesfRJ29EmZbLmvhLyurbS4QarjgbAFOm3QlKuG0Rd+k9UFGpWsOm3wX4MvyIh5zY3gsqvfzhTaPylLQ68KtRv5pBETxcHTXmCOQDZKP8URHP8bYTstYhYtDj0qU4nL2E8WzCjOqWS6zNy9IEsjNZjKaUfSS6FV8eFqPHdJmIOtEdB9xMWDvKQLOSLW9M2Wiod09L1jk/VZqN3QxZrfhZ8X63NdWEjFhHRmqFhpRpAFpr7kScBJc+FaLsJu5Hc/Oa6g1vcKkMjFKmfZ6idbWXhItfVzBStOGpYJg4j1tdgDcET8xMO7CLZL5n+M1+NwqxI4dWnUOCiqZol20/RjHqFGeanUrCxGimKyQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(54906003)(110136005)(478600001)(6506007)(55236004)(316002)(7696005)(2906002)(4744005)(66556008)(186003)(8676002)(26005)(4326008)(9686003)(55016002)(8936002)(66446008)(5660300002)(66946007)(76116006)(86362001)(71200400001)(33656002)(64756008)(66476007)(52536014)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 22Pnfsrf3gQpWEhcYMWnX/FtAdbAptKD8RqCmI/dz8wErvcbmjNvoihk2Hk/pVrzep7DZrgrQipl6yYkH3UxI/zkoUSDKJKFIaa7Ct3DkWXC6KfLi2bpZ85rJLNWIhXn0cn+6WZ5TxW7VJV2moLZ4uVdNMGR8TGzFHR8ZDBMylvzSHAea8lr6+hGsJTpCNQ37tbA3PABVIcG132lU1I5GGeVLrcPlVvoBYZucNd2yN00JffHDLslUF7YnU0s4KzqlT03u2iIz+QurXpEV/eFsziE/UjeA1jk6x8ELUha9ASc7dioU372mCN6LOVsumx4Neb2XiGlif2RzGAIiWBBX+65MUZ0vEbgagMpXt2fPxjSfP/boOK4YWSxTO87nZ2bdXocNDn7ONqKDgvwutuaGbEtfnNzDV8fDkZcKSwunazbyI7bJNj0oGZUEZlx8gxI7/7L/wGTlNsCjct6G1yCJtSukD7hJvymH6tTCYzq+vpBLgHJ7UEcB2XBYv6G8vbDA7rqijdQtu7Ydirq3HkylRVWl5ssM1250XrWULAlR8fkt+/TKEjlr4C3AjzU/dhnDLjli60rVMivIakWGfOmJAC5UR116Wy9DoGiI2qECCCRFGeidR5UvSNAOn3BpkkUX5+3F66TzpYwObEA6+Xvsg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fb611c-aa5d-434d-1b7d-08d84b4d73f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 12:25:30.1476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONKQH2t89GRvPg4sY6UBbDdwN2cATGyrbQqdK8FxgwTnN0ArnYHQ7D3Z3feyxNYjRLzr6SHDho0o2C1yNU+wNtl2sp0iyqfthZX3LQ/88HkSaAjtUItFiMUVT/RX/yj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad-san,

> From: Lad Prabhakar, Sent: Friday, August 28, 2020 4:50 PM
>=20
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renes=
as.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

