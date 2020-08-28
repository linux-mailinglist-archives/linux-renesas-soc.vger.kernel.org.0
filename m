Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F6425529F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 03:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgH1Bjq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 21:39:46 -0400
Received: from mail-eopbgr1320112.outbound.protection.outlook.com ([40.107.132.112]:26201
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726197AbgH1Bjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 21:39:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOe2INbAELdLLDzLjPrBylOBIoXZODEREHQtXkJIOP7p7xOpRjjJxrhzAoVqsNnKjl+Ruiy9VY9r465zl63nMbrWofSDTMhZPWu/3SrZMlSVd2hOZj+khPom2vx1w5qU8a3hJs9uR7i//TYbfZ8RxIlc8hj6veqj8xQJYYZ2kP0JRffHv1Fspr6CuoX0hYB8lsnJUxp/jos8DAAKvW7S7kp0nxBhsVhC35BsdJWHAqAxQcymrPl3Wscu7vYkIRyxeHQ7qz8lvCLN52xZ4ntdjGAcKHxXCKBL/qu7/GK3HIL/1M326Uc9fx5MZq/3qNbqwcBKcwOCDX/T9uwv3EVLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgooAZH/x6JmuAUo1d1P2zvBfAAaOQA/ahrE5+5syP4=;
 b=bKAF8S70pvWQLheGVQkzv6+23b3mmwnx4VipKeyGsCJzsKgzs+o7vgkHNxklY2nHbCkPMlHNhF1hxMU4st5FVK3mlMHPGbKtpdOTWycrAZ8eJ3zm6mUknjh37iWICx/XSg8lWQdtrS6CZ9ocQuaYtY1VqEBqv0LlJlfuf86poAKGV94w4mJaxKzk9fyo+DVncc4RpaBY305QMw9gGAlWdDrJlBqmELAjcUYn0OnrGekMlLyfbX4WdPJDkN3yVXZZ9vYKMtDxOocFip0GCgVaG6wCHZDRPKt5YHw7xaiEjgG7AAJMCQgSB1il9yp6rmWhFHLTzfjBQDha3M2ly5BfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgooAZH/x6JmuAUo1d1P2zvBfAAaOQA/ahrE5+5syP4=;
 b=m9c177sQLQZV80j6CnK5sUJVJF/YCBLZzFSpKZ7XexxItCEOtErzrPaMhkHmbXJOJlnC3U48a5hP6h2m2iWdfa9IXoV03S0rGs62t0pKXkRdZMx645gAnscVyTqb6dbstMGYVIy3LhWGr+G+d9aDxW1J/TaqiaeSOxbh77V2nS0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB1977.jpnprd01.prod.outlook.com (2603:1096:404:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 28 Aug
 2020 01:39:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 01:39:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: Add r8a7742
 support
Thread-Topic: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: Add r8a7742
 support
Thread-Index: AQHWeuqxUasJXAzIakucV8XtlZyI+KlMwiKA
Date:   Fri, 28 Aug 2020 01:39:40 +0000
Message-ID: <TY2PR01MB369270F4F0F5753A9A7D4919D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46368cc6-7a78-4a9a-b0d3-08d84af33b7b
x-ms-traffictypediagnostic: TY2PR01MB1977:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB19770D7EDB631C888C791599D8520@TY2PR01MB1977.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFpJFfI4xudFciGKler4JxrJwvSz0wyuZmyOjV22Qg3bbwcgQUQu8NaFkYBiWuptJmFke8KcMH1IsuHzIKm0S4xdh5FvZ9J8vfNMsJAUVzK1oc9iCT+XyL+3bT6XW/LYQCJR5TN83LhRL1EWp/vGXICj09vLapPB8UXXvfl7cQqk8ldS1xjV5vV6OIJvO/pK+1ytdg7rnEgSHuDW406V105sg3eF8tpNU418VkBvM4+Tj5WIoGcA/Np6imS6HfauvAQ9TyGu69cC4vGXHB0EnTWD8UcNvj3v6eCXf+fn0yGe+JwTh/Od6Qx3OLx1Xoq2lA5imbp7Mt6VnHHOAsQW+6eBnk1OQHFsz0h2/uNljjaogbCouQcngaZFTMFQ0Aa1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(86362001)(4326008)(110136005)(8936002)(8676002)(54906003)(316002)(9686003)(52536014)(71200400001)(2906002)(4744005)(55016002)(66946007)(33656002)(6506007)(66556008)(64756008)(478600001)(7696005)(76116006)(66476007)(66446008)(5660300002)(186003)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: aA3VKCNUqCcF1WRqEcCbAXjDPd/S5afUjhaB2T7oWVuXOMpeG7t/EYHmaNa38SI/l50nZQG4Zs28RO68MYVOuVcQjOAQmIiIxLApJazMxZrztQFicNKvSBH182U55N7I0z6cR4iGeGwR1ygFn6aSyCDZLstQPiwiRXMF+6oSF8XcfI2Eqb0Ne7XaytfTyixSXrNgStwq/1/CgLk6/Cyl5oZd/67W905Rmc+6lV1XrB269D0UkOZ1sZqWv+ck5AeTgVCzY0fN5CbpmOWR8n0FpF82Wlmbpiudogeg61LANeVRdMK4QGYXyZuY+OsiiS3qd6TT6aMqtKDDg/9xw7PxIvAFhVQahf3SKp35aBZQf/dwnA2XNpXxxKuxm8wB1HkmqCP3CtOdGCdvubdhrpP4546AbeQquYdfFcYMfuBhViaNyjg+YIZ6APQSXwVUZUuGbUPaKOWYIZha45Y3AEYQ5KFCbHTA/4Rsluy2J8Tt60Yx7FuwcMJw7UwdA8FKEXydUl6/H3JCCgodLiFzUrwj2y1yzWuN0/rctFMO/1l08ZgXc/kSDbbIHJRZm3UyeYviITH59/4grOs1p1ZIpdfyKPVD9dobGjkDVcUZveNT6AU6qcle/u0F0bFj3OxRC+YWcTsFJuHN77l87YaRhJp+mXOVCfgxNuO1mZnlqnFQl1DI2AgV+0Ts9tJfPOWx3fgVrBw1JePrpT/vviTFOxUrqw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46368cc6-7a78-4a9a-b0d3-08d84af33b7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:39:40.6656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUS5sT7zF/db6ov42my904PiInMl4KJNSrSkpDStc1j46Yythlurn1swNHJVVdGBtuVKqYAbaCZoEjf5k9v+GUUcnlcAxX2+ZWePSVdhF6SeSDuN62bSCtvixPGupfXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1977
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad-san,

> From: Lad Prabhakar, Sent: Tuesday, August 25, 2020 11:18 PM
>=20
> Document RZ/G1H (R8A7742) SoC bindings.
>=20
> No driver change is needed due to the fallback compatible value
> "renesas,ipmmu-vmsa".
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

