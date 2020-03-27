Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1940195041
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 06:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgC0FHu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 01:07:50 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:65280
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725857AbgC0FHt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 01:07:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2EoXeSzTDPUmdfok449rzLvTmX3nrB8YU/DwQdxu6bSXbFgQF50pHj/f7jYkH5Pufe2XUQ4tlwu03R7DUuicWfCbio9ihNx5rEBkAflEIi6O9mxaJU265k/samtiz/IsXjacg0tuIsweK+Bazc80VnDoE4uc5zRyyFpBA8IjFPKudb40gf0TlZZOTUmhhv624vlJ5UPaHm2VGosIMtGBncwpwCOvN5C2c/Tz2GtI74GfgL3/05PGfUU9oB8e3Cnp+uhPjso72gUTM2ji+FdrMKT8YDkSsZuH1EyEnaGDWLXyxdUd3tKRv5w1bYwz1X6zo506YzOD20aGJlz8nsIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQYdIgGroBz4xTBQ5kqAHfAV7KNZojVRQjbYBg8b0JM=;
 b=SCxqn6FKCTvIgEh7mjlFIrqvOo4KQnnF6EYGv6G0iGp0IO+4WZ7TwTWQl1/Ca8+Oc7GfmyPvVv9L+TxO4Hp0OqgB/Ws8bpgWxfrBpTxsTPguwEGniuVZ2FyylSyGod4Dpfbj2q2M8ytL29dGnZ+iTFOP/9wDLUivosecnStIAHxwKhK8dP89pNQsdy16fKrnNq/R/xrkopTij0R1dJ+MJmzVQ+JXCiHy8h0cvRmYW7BO36vbuV8GlTESpEx5RE4P0Fg+UgSLemuMqbjdX/6xzoBsgaG9hmmvSyJCp16juk1CO81ZaqxGa6XUDtWXA1RXf0aGh+HLcZXN3auPGjTu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQYdIgGroBz4xTBQ5kqAHfAV7KNZojVRQjbYBg8b0JM=;
 b=DTsT9tZcxKh8HSpasysOLOJua+ftdIGS+CEeClJM7kS+ByfzSCb2udZ9Y7hRF4Qic/tY+H7+VSmD8heqNtnh3l6zf5FvQuB9TzCjQThN83eF/6XF/zpoym0p5ozzDNxyMFDGqdFapB8CdHYuxN7xF/hs2EIjDVsiJaU/dIrRVkc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4496.jpnprd01.prod.outlook.com (20.179.187.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 05:07:45 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 05:07:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/2] dt-bindings: usb: generic-ehci/ohci: Document
 power-domains property
Thread-Topic: [PATCH 0/2] dt-bindings: usb: generic-ehci/ohci: Document
 power-domains property
Thread-Index: AQHWA4z554OB0l2bAUaJVd29DMFcUqhb4/DA
Date:   Fri, 27 Mar 2020 05:07:43 +0000
Message-ID: <TYAPR01MB4544C0AD1F363CD0B5D8F43AD8CC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200326163807.23216-1-geert+renesas@glider.be>
In-Reply-To: <20200326163807.23216-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5918fa8c-4746-411e-4b16-08d7d20cc903
x-ms-traffictypediagnostic: TYAPR01MB4496:
x-microsoft-antispam-prvs: <TYAPR01MB449616195A4F745D1CE6DCBFD8CC0@TYAPR01MB4496.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(33656002)(86362001)(5660300002)(55016002)(7696005)(71200400001)(110136005)(8676002)(8936002)(81166006)(81156014)(66476007)(26005)(186003)(6506007)(66946007)(76116006)(66446008)(66556008)(4326008)(52536014)(64756008)(478600001)(9686003)(316002)(2906002)(54906003)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4496;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuXiDEX6KdGXBDyVRlD4r/xb1fdQiaUGOEyzOl/2mwiPMDtBVt76XhGOznW1k7f5wJXr7wyB4GnX2lxfoOeh6mbnyDrDX+GvaANagC3w0o20IxbLoGaaFYtDD5uucmW1QCQBNQJx9IgPQZ9eHv6qdYEVmleRGkkfZvD4zJLSl9reIlyOYMK7Tt6dLAvtrxHC3jL5tOBUcF5g+6/WBAo8Bf8MK3iRATsk7lDphBe9sjFw1WouWpTe06jkB/Od5aZw4oX2ofTOD+lb+jeaD9yQkDUTKQO/ynsPmu2o+yQpuNiMPqJnMyf23hzWTlsMCS0PihjhEGrwkKb/vCOzzlM6Pske4+w8dGP2iMnUMR/v52UIGyzuWRxyt3VegQveXHDYJIkDQegvdAc8UX1oVEOa9Ij6dwOLw3nN3Mc4Jt8ShzpepsoPSFKP3GMJg7n8+oegkmrQsVwNhxiZO+J1M7ppyBOm0EH2l6hKOPF1EovTsF07E87CNo+IDxnd9YVGMot+
x-ms-exchange-antispam-messagedata: k4SjqomiKjmtclIK2FAEMM9Or03vLtRpL/WVJsmFiCTVq9f49mAS92JlV5rDYWOre2GTOQvt6SJNvfhsMAc5Uqgh7AzZ7teoH8ctEi8t6XPxOljdf7ejhGhqGY9bWd0s8KHlrn79J3e1FlPVxvwUOA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5918fa8c-4746-411e-4b16-08d7d20cc903
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 05:07:44.6483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1wCuIXlRyJl/uor2wwRHj7iTtttPQiPpwvcqU2IYdnrgNphNRo5oXZjlFKbA0w7ahBAyEDK3U72Cq2f8lzC5jVGT+ABrvFjdqN4u5WotXDhr35ppC0zN3iAh1coJf9sb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4496
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Friday, March 27, 2020 1:38 AM
>=20
> 	Hi Greg, Rob,
>=20
> It is quite common for a generic EHCI or OHCI block to be embedded in an
> SoC in its own power domain.  However, the current DT bindings do not
> cover this yet, leading to "make dtbs_check" warnings like:
>=20
>     arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee0800=
00: 'power-domains' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee0801=
00: 'power-domains' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>=20
> This patch series documents the optional presence of "power-domains"
> properties in the EHCI and OHCI devices nodes, allowing the DTS writer
> to describe the controllers' positions in the power hierarchy.
>=20
> Thanks!
>=20
> Geert Uytterhoeven (2):
>   dt-bindings: usb: generic-ehci: Document power-domains property
>   dt-bindings: usb: generic-ohci: Document power-domains property

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

