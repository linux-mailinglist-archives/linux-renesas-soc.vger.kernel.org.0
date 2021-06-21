Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ABE3AE352
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 08:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhFUGm6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 02:42:58 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:6429
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229576AbhFUGm6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 02:42:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPBZ9GPew/BKpTN9f+nCUsCwb2S+MKf6XVTxxLRcRoGuP4GvYUD4eCJGL0YJVoNFNZURJnmMOlL9xT0/ZFbnsaI+04F3llCkxTwPzL/k0KTKHu8ANssDUwgUJU8YXT1yZHHU9AjHs+X9S/0uW0HUoIB0ZtNuD/nKPwcvFJTLYwSkFtu8kCqFpPygOOQJ47xDE32cyC1MkdMxwCdY9VaPKGRL02dJd70LEJCrzhWuzIEuMetqkUA8vKfbORE9Xr0HhzeneP7ptvU0ofQl/s/++u9LbCMrYdSdmyPfiXZzcsyydxJeXYV7rh+Pvatxl3aSvDZaY90wYUELD+KvLoKH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYcvnq7MyaZrRrwU6Ozsaudtz9QMeSSJ75XJTgM16so=;
 b=ADXxWyJ0a+zcFnAMN8TckDhft5eQsefczAUtc6tePh2F8U26ZFcoeeJhNzKMxGrKc9HPW5hkb81ppZ3nmTmli3UAyaD9kVDun4QBPX393CnmhuLOXLCrra9e8D0Vp0bQ+hT8A+HIam+FJo1WfXuif7JPQ+FheN4qto5x2KRO9JW3yZB7BP15suMrzEF405ubLyu9z6Uq6ncEHVC5VbklvjfUnyLOBZ0zJ9Tjitl0Ou02jhhE6iSnmPUeNEFlMsHQmygDOYXQNfDxo3LYPr6EyQDt+4lgBjUNOHGPDhd3yY3wkrEa4M2GZABXb0nSNGivzGT7N7hEMfaMZenvkSAeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYcvnq7MyaZrRrwU6Ozsaudtz9QMeSSJ75XJTgM16so=;
 b=HFRJzywTcY+CoP9SFfkRXkFqs4QVWC/xyyuj6dIGV18Y6jBnjNZznrr2Krh2OoAEeLenYLacKGlTm7s8T+cqioBqyx7iTyjvSQW1/tPmbamOSs8AxnIH5ESczQsA7QIQm9D3OEdQRqiCEqRuxnndRKa+EVVjGn7YZZiko3HChYk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6568.jpnprd01.prod.outlook.com (2603:1096:604:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 06:40:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:40:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/6] dt-bindings: phy: renesas: Document RZ/G2L USB PHY
 Control bindings
Thread-Topic: [PATCH 1/6] dt-bindings: phy: renesas: Document RZ/G2L USB PHY
 Control bindings
Thread-Index: AQHXXsg7tImGIb1+Yke9hQX9PiwSuKsd5reAgAAr+/A=
Date:   Mon, 21 Jun 2021 06:40:41 +0000
Message-ID: <OS0PR01MB59220D650A09B6E6CBF36350860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-2-biju.das.jz@bp.renesas.com>
 <YNAPJZ2nUB7rp0FU@vkoul-mobl>
In-Reply-To: <YNAPJZ2nUB7rp0FU@vkoul-mobl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7489958-b7d8-4e3d-16b4-08d9347f7d46
x-ms-traffictypediagnostic: OSZPR01MB6568:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB6568CDAFDF70A17DA4E579B0860A9@OSZPR01MB6568.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iw53+fOfJU8YyvmzI9QbtWmQ0AVeJYBDnLPskZhRCRcMrsTF6MLgWwv094HkSXMvDkoYnRNnVblp918ZexhfhPNldbxSsQSA7rfJC2T1VHuX15kEbyiBwa4KeKn6JUjXnDvFohxdoDQE48G8zCDBAS08h97Bgp2qyEbEfhT580Dm9WdBJe1NcO1GUPrQ4EE0RmeQpGFDCn6qUHdU6yLa+y0WWpLYo7nDEdqutXQhdX8XjjeSJ0B7keghO5TtcB6Ns0o9YEeh0hHNPfAcmZT2BltbtefiPejay9c2c3QQPpRmuIQSFa5lIF+qYzdTi550BW833gY7e9bvxUy05ALeYmWUduujNKQNfxtPXQ3GhWPyJBbv3s3B65H31mNfX3ZafBCNJh0t/hpktm+XJ61obqMjJ9gxvwNAg+YuwI/n2redDsD5M+rdPA5QcH4eeITaUoJESQ6T4lTtBYz1XvDwzmdd4TLTM2bo3wOck9fQx6g0yx5UuDG3ynoIYWvjRj9Qsv7A/ZTCuk8EtHNN6b9bX2pU6wTRudEFVqg2jqqS6fPk5EciCEkHZJdMgBorHk3slJpj5EW4tkuIEUIV7B0eAjwbIqucQ1opEZVn+qSXH5SNNOe4evpN4nzwFu1Nd0eSKnWzkMPXpIhfOOuDbA51gqnBEySa+rUsNhIHzw+1Re2shy8DOcOZxqOIXnvqIUgmz6UO8yIGqmwZ9LL5V3UjtRwTLH/qjm2tX2u9TPXIm1c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(86362001)(4326008)(122000001)(54906003)(76116006)(110136005)(186003)(71200400001)(7696005)(8676002)(478600001)(38100700002)(45080400002)(26005)(316002)(9686003)(53546011)(83380400001)(33656002)(64756008)(2906002)(55016002)(8936002)(66556008)(66476007)(66446008)(66946007)(52536014)(5660300002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?opc0hViWT2FYQT6d/Dp123EseatqTjXWyenY3IvR0vGMKom40OedbtZ4zVti?=
 =?us-ascii?Q?5rhD6Ll2yMiaNVcoahSScSaQo2imtrUmpc/FALPUPYgnGMWrYXw+9wBC3PJl?=
 =?us-ascii?Q?oeBoXpV4Z+zcGXOTvLWHTGR3v9S6VQ9q2rl3etE2gxxZzHmU8ctztwWgGPm8?=
 =?us-ascii?Q?6QlQRkafQRZOxngDhp0qYPJGFIb+t6VQS7Q1bm3MO8zr0ZUG4mErbnftUiCk?=
 =?us-ascii?Q?IuxOoZ87+GaEgPfKa4Y8zJ/GpDFeJeGFdmeo0pLmmtdq7blgjhm/z4BWpMn8?=
 =?us-ascii?Q?XXIeMXQOqSlvitq5h8xCmfjzZ4aYFyoBlsnD894l+x8dSnsinHpf1gm5ybwd?=
 =?us-ascii?Q?gUPjWQSiBiR1HAl8Lon7iHNqwwQPZg49UPRTTEmFUR6dcI89eXrat2utWPH9?=
 =?us-ascii?Q?GZEpYEOGII1cZKjdZOyqX5/riHDtVbLbfK47VUKim6wiuCSUiqct58KccN1F?=
 =?us-ascii?Q?braJ1+af6VZCPk9vQnyQpoyPUNReutTBQpoRhAt0YBz1n+v9LV+fjrFd+U8B?=
 =?us-ascii?Q?XP0JwEd+Y907rnsq+hUMTPfYodi8AVp/gQ2xl42nZlAZ5vIuusoipfmEx4q3?=
 =?us-ascii?Q?yMu9rhvX9+vpIfNbU4Fa6yiiC2iQq338drLQOMhRATSvPGhJO/0/hZYbTRGG?=
 =?us-ascii?Q?3yurw1JQG8M1cr0pxHU9EASPJjK2im3lJXPEeS0cFMhRfqj1ELPIDfStuMsV?=
 =?us-ascii?Q?f98kCl35IqbCb7DecDe/kiNy5JDhnIh9WG22QVdA9PwDCZ21hcDt9RqpI65b?=
 =?us-ascii?Q?ZxzVWfV3oG6x/BqT22v8PfZJ7XJNjxE2SKLzn1eKr3qA7KBX3QB7SYqTSu7N?=
 =?us-ascii?Q?KqPRJ/vBNUpCOrAwSH24BxV62VnmL2iAPFBdMMlz5Ua3zyQ5P5Po0k/+1xv2?=
 =?us-ascii?Q?NzmZ+DL2TWyRyredTqdgKrMolXMTaGE3L2aPAKNn4cQdqkq8/OnCDBSDAs/8?=
 =?us-ascii?Q?ttRRMIfEYqtwNcC4UPdvbkWHYDlwQ4dBTuQ5LMG6XzyjT6TEzU/QOCgcFlST?=
 =?us-ascii?Q?F8TgECeyNxUTf/tuwfFGOpuKX1QNOV0COduTQ6sA/CtMq4Kz0OuGpg21vwcn?=
 =?us-ascii?Q?LARSEDzxkpP4ps86p1da45HJOlRsUiKPrWmyfgI4RyffpodiqFep5/WjM1l5?=
 =?us-ascii?Q?oukdBKea1OC0CNX0PxxGy0+nCmHS2D2gKT4Hd1pp79D7VVQVf6pGQUb+ICBe?=
 =?us-ascii?Q?dFtXWWLuctcsFNrv9abHGPstL9u23CM70tbKgmzRyxgAQdLlr3lH6bU3qyvn?=
 =?us-ascii?Q?DyDnXZo6lepVNcwTXOUAGG5LxIxIbP7xA07VFD5waX2/0fDlNXRr82y5LFfU?=
 =?us-ascii?Q?9j76VJu1vqd5UcipZtcq2IFr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7489958-b7d8-4e3d-16b4-08d9347f7d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 06:40:41.5577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tbr+kSFNanxYqq57R4pAB1BFXohmYC72TZMvEIcUWan8OtRetn1+xr1CmNFZOfPWDg0hqyO3i4CwrefNbZgN79hSEkeKvIePfhz4ibWhnc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6568
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

As per the clock list document, I need to update the bindings.

I will send V2 this changes.

Regards,
Biju

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 21 June 2021 05:02
> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring
> <robh+dt@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>; linux-phy@lists.infradead.org=
;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Biju Das
> <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH 1/6] dt-bindings: phy: renesas: Document RZ/G2L USB
> PHY Control bindings
>=20
> On 11-06-21, 14:46, Biju Das wrote:
> > Add device tree binding document for RZ/G2L USB PHY control driver.
>=20
> Rob ?
>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > new file mode 100644
> > index 000000000000..5fd316a2e79e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > +++ aml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fschemas%2Fphy%2Frenesas%2Crzg2l-usbphyctrl.yaml%23&amp;d
> > +ata=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C28c0b4be786244eaef1008d=
9
> > +346949a2%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637598449085051
> > +587%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DWtOl%2BWHTYN4TuB21rTKdJjd=
x
> > +bKLK96N7NkiSiRT65U0%3D&amp;reserved=3D0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das=
.
> > +jz%40bp.renesas.com%7C28c0b4be786244eaef1008d9346949a2%7C53d82571da19
> > +47e49cb4625a166a4a2a%7C0%7C0%7C637598449085051587%7CUnknown%7CTWFpbGZ
> > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > +3D%7C1000&amp;sdata=3DY%2FVo3raj5AqUIv%2BaN0Vavdph6cHdWf1a7Imq6chC2KQ%=
3
> > +D&amp;reserved=3D0
> > +
> > +title: Renesas RZ/G2L USB2.0 PHY Control
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down
> > +of the
> > +  USB/PHY.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> > +      - const: renesas,rzg2l-usbphyctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#phy-cells':
> > +    # see phy-bindings.txt in the same directory
> > +    const: 1
> > +    description: |
> > +      The phandle's argument in the PHY specifier is the phy reset
> control bit
> > +      of usb phy control.
> > +      0 =3D Port 1 Phy reset
> > +      1 =3D Port 2 Phy reset
> > +    enum: [ 0, 1 ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    usbphyctrl@11c40000 {
> > +        compatible =3D "renesas,r9a07g044-usbphyctrl",
> > +                     "renesas,rzg2l-usbphyctrl";
> > +        reg =3D <0x11c40000 0x10000>;
> > +        #phy-cells =3D <1>;
> > +    };
> > --
> > 2.17.1
>=20
> --
> ~Vinod
