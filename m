Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577F23CF8CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 13:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbhGTKqR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 06:46:17 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:46912
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237643AbhGTKqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 06:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zrmk5VxM4jV/1dNqr1QhmRbmjbYAQXNa9dBExf8Gpkx1MVAAtZHDqrdyDgus4uBlkTSWg+rVPMtAInFjcy9LiO6pt836HbE2aj7zMeS96vTh2YjdMx5Z5A0T3MdBll1Ozg4bSCCrM8kheqSfTxGAIszOnOscAd8eew6nBjRBkhoebno3kZBlzm+feDPHFIE5GPXBvYFLW/Y0NdVlbmYI1Ttj7cdq1aJHUeLtgUzZOtz93HdibftKz62HfDeBXQO4m0eepXNaVfzJ8wtnBLmrMQ3Frro1pMWtElpP6YuXJjsbMy8mExhPmvx3exUAcA6G1F/z3DrMyNeJqYLFW8jUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1qJLUpsbhliXHImjaxvNqViv2ZtrjMuyPuMQdbf2Ss=;
 b=Fm7H2yKqUnJahHuCSONUNqXhr8dAiFclzY9TquiLJxn87f4cvYWzdNXbco3o0rRAzbGZ333A9An6LCKr96e2RgnW9xNI9ku5bSvT/cdGihrFL0AVGSEZPvxQvMjNHZxFpihZKKl4Jik2cWCbErrIDaQ2MLrK/qO40G+l1cXT9Fa5RAEGSt4tBXLe9P1ksD210CPD1cWn4Gl5C75SSUb7iiqi1hWpdznXmSBa3J7Dtg6NDnS53a0QqmWpY7glwIXn4eurcSYMJIHGdacAC8o7tYgaCDEyQrQfBYJNZ4kbwOFUvsNQCd5yPKYHU/gToOFko+qEcS2OBkGdW3iTV/kPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1qJLUpsbhliXHImjaxvNqViv2ZtrjMuyPuMQdbf2Ss=;
 b=Dyv7jztqMxdzliOjbsTneVTKFj7FWfnO0MSv1vgmHD5pF9QKi7VI/WDojXM50o3UXK9cbYzONXqjZ5GNL/CCtOITUX60pM0CwefNAc41Z1BPTZvwNrLOqkzhT2wiCUOLB36H/TVPoLiDIliThmnrZ+UiHlwvKSo2g6iDmz4UPSg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3478.jpnprd01.prod.outlook.com (2603:1096:604:46::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Tue, 20 Jul
 2021 11:26:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:26:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Topic: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Index: AQHXfJhh/kDhqnmFpUiBOlWmBuVtv6tKbB6AgAFOejA=
Date:   Tue, 20 Jul 2021 11:26:52 +0000
Message-ID: <OS0PR01MB5922E245F143076435A9000186E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
 <1626708479.397199.1967264.nullmailer@robh.at.kernel.org>
In-Reply-To: <1626708479.397199.1967264.nullmailer@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af597ec7-5228-4ef5-eedf-08d94b7145b6
x-ms-traffictypediagnostic: OSBPR01MB3478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB347866305EA6136393D8155F86E29@OSBPR01MB3478.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qh8RiOTGTNO6fb2rdRwGAJm/ktzc8RSfruXKIM9tENpxqqkHK0JJVxyYyZ1LZn7rCD68KdGrjWapsvnP1MUvLBc/nq8pgYozwYEPERf28fcC3etxcsez+ARGxVkYmfAV425y79oQtWkjj4KKFMSQBAGka7tEOb3LOp/ptJv0XF1sdyH6cHyLDxNft8+YQK0Oi5dSY1enQkkqmRwiMyD3cl6grOd69XYcGoQSWId6RUuu6YWiPRSCQRU75AjhghrH5pcNH9GQyA/Q/VXqThejZqSSBxWZuc4nzv3LJRXTrmi97xWMDr6vxSDzU9V/ImPkp6oApeoV5f6W0Irm1u4jAmkNscEeYtfkXFLh1QELgLK3LyhRXAN8d/mLgcFznnZoMA5PufwxBOJxgFK9u5/hxSdoC8edNUqZb2UTqOZYEIFZr95Q8gTQgem4tze1Yfavpfprp+lT75hRuHze4LF7lO708c56pyfSoTO3kVdF3NkKT1zY+rVaQFPHvU3xgPkHwGWxFJfuuCfMfrW0LIDD3yueedT8D6zIopnkI1yMkPYpA0eLTN/4ERQ6FJaXvRn98hpSrgLCe9x3I3i1pnQLJTHIM5Y4dSkyXSMw7U5OmRsvtqUcNFtN+V46MPADFppU2l07uToxu22aKFcTgK0pWDsDmmiz8nwGyFx8Cqyd3EDzSnjmCVDGsEP1wMxDfohSmvLNeFiUZlWwSXnbYQn25Ua58S8i471/bC80Ok5lZEY0F9Tx+6NHCz0hxWowu+LMnajBeTRczurJk4PDwi78oKRlWFANZ07BqREzC7LJlgE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(966005)(66946007)(122000001)(66556008)(64756008)(66476007)(316002)(5660300002)(76116006)(38100700002)(9686003)(6506007)(66446008)(52536014)(2906002)(83380400001)(478600001)(45080400002)(6916009)(8936002)(54906003)(86362001)(71200400001)(8676002)(33656002)(7696005)(26005)(4326008)(186003)(55016002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i8sEPdlup9z/Pm1wGuaHAhry5yp1APg4Re4L6LygdHVm3x3nCQw2FwJB7UBy?=
 =?us-ascii?Q?V3Rd4PWfK3iUA3zKPyYuqNDb+jtvswVREiWcxgzM2szwecSaafkoURmqNsZG?=
 =?us-ascii?Q?mJg+THyhQrXjCwYTwaj0B5L7MiEVRdVqlyWbm6Zht3cqmqMTubpLsTDVmnYP?=
 =?us-ascii?Q?V4TBlT0Jpizlhq9WZuj9VSVZqxUJsIrOCjs1iwG4/JMBfemT3rNq1ztizEMb?=
 =?us-ascii?Q?VXK6uuWKqv5k6PFxaONWMij9bBEiJWBr8BiE4NZeQ9E8dLje27QTOolcyFj0?=
 =?us-ascii?Q?p/pQg8mpOI4BCAaqFbjaDr7YjrJ/G52yhNK4Lk7iw0sfyIbnueObo113gyu5?=
 =?us-ascii?Q?jKrR9+p6kcHYE29bJQGYm5WBWGxgFe9AHlLEymYmazhqKNQXd8d1/trcFTOU?=
 =?us-ascii?Q?BsWo7nccScPeHvwYsGaVhoNvpaj4M7wqCawHFpnyhZ4bEbEwVSMka6Al2Hv1?=
 =?us-ascii?Q?PTW2+DVTm0h2qiaEBfzVGl5bGM57yEh2ZdfKqAwr5iIgV0JjRwbvrXPimlYI?=
 =?us-ascii?Q?k5jyK319DMWd5rDIvOF6MzBD7f000bNlOv9HEPNNfxQyEpjgX0j10ieIRGSR?=
 =?us-ascii?Q?eXAjboVscYHjxgzH8Endt4sNbnpig7csIn8b0W9BICdUlUxEszTojKc5Wlz2?=
 =?us-ascii?Q?fbV8Xvag004AJgwb3vlJGu3Jp57lOnmzPaL1WSriEWCeDbXlisYNTUvyaSCX?=
 =?us-ascii?Q?TP/3VJx0JGqjYEpo/qcQucXqFYyuDXSq19vGiSV0vlbgSDoH0cNgOlR+8fDE?=
 =?us-ascii?Q?TneWrMSuLbA6g4GObnNiih+YYJ1/wq10AeliZ1m/V4mXrAyo9VXXP4RAPEVF?=
 =?us-ascii?Q?ZeipUqW5L8L6T8gXwzo1nq1FPrYXvnNW9H5O+dgTF8z6vtp9CjB603ZOVniR?=
 =?us-ascii?Q?jJ4CPUPJDsjW3/t6NhNqwJbBqIYNCHvqIkaBsU5ox9BdZ35ti5AiJFwjwP6G?=
 =?us-ascii?Q?OwAtQxIXq/Gcfb7wYqxmDcZC1/nsIaKLlbHfI9ZSl0SaImy9kyM35h/ztpEs?=
 =?us-ascii?Q?uXkkxbH8W9KLxG8PKAwPZmELpalitXftV3eGXIjaFnU03CAzFCAX1N0Xvvvu?=
 =?us-ascii?Q?T/bLAn/30EP9cTTN6pbSwxGZlZMk7FLFeoXexPoXaWcUqh3D7bknne2W7RBB?=
 =?us-ascii?Q?q9zmQ7UjkAdnI5GOgsHl6xjs5HRfkkEteJgCvCYO/WL3WCNU7OvjKSe7BCyA?=
 =?us-ascii?Q?XiE6zofMdkEwnXq/fW+oHvFf9GS9x6VXOT6qdip5sd6EUC7DVqHDIYVWkEh+?=
 =?us-ascii?Q?SZHnjw5eBVcZhejG6CNQjygeROWLOlfUJDWcagwFdmX5b/sL1cyEud+FYXAS?=
 =?us-ascii?Q?ErGOXUbsvsf5m2WQi5AtNjmv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af597ec7-5228-4ef5-eedf-08d94b7145b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 11:26:52.1445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1FBbW1H/gDgth2kSFe5DzmbAD85zv9CbbvEkeDWU4TIB4NHYX1BIrw27tN2zOpWvSBL89vAttDFBXZRoIqX2QxNdx0nXzbWW9Mbwr4vPh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3478
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
> Control bindings
>=20
> On Mon, 19 Jul 2021 13:19:31 +0100, Biju Das wrote:
> > Add device tree binding document for RZ/G2L USBPHY Control Device.
> > It mainly controls reset and power down of the USB/PHY.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > v3->v4:
> >   * Dropped reset reference.
> >   * Added Rb-tag from Rob.
> >  v3:
> >   * New patch.
> >   * Modelled USBPHY control from phy bindings to reset bindings, since
> the
> >     IP mainly contols the reset of USB PHY.
> > ---
> >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> ctrl.example.dts:25.30-31 syntax error FATAL ERROR: Unable to parse input
> tree
> make[1]: *** [scripts/Makefile.lib:380:
> Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> ctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1418: dt_binding_check] Error 2 \ndoc reference error=
s
> (make refcheckdocs):
>=20
> See
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fpatch%2F1506961&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.rene=
sas
> .com%7Cb02057306f9b4db2426008d94ac9ce37%7C53d82571da1947e49cb4625a166a4a2=
a
> %7C0%7C0%7C637623052878040806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
i
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DN4%2F9G=
ofL
> NWbtPDddI38ActeGRqtfxdNANC4T241Or1M%3D&amp;reserved=3D0
>=20
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.

The dependency patch for the bot error is present on 5.14-rc2 but not on 5.=
14-rc1.

Regards,
Biju

>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

