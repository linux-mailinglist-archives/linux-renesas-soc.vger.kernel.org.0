Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5B63D792F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 16:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236956AbhG0O6a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 10:58:30 -0400
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:52349
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231825AbhG0O63 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 10:58:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBJVi1s2N9IQ9IrTr+B29RLrPViEbyjWWgv8VzOjO2HpSiuVnulO+DA+Y1nQVk7yf1W1h0AKZq9PsvNWUwPASO/A0wdv0dqZTdvzOUJb6PyispccVK615N3vKfbqc1gLkW+I8fXahheSwdQlk82pxpOeV1m6ehLvkognOW5CuNsRiuCrqBLT1MyJWQO9tItoPGNPqL6Lv0Nca77a8chvaCK/auVoA8rSsjzSzNGYYDxOfJXwdXGWlA79iCb+/yxzgU98Q3fCfDQ47ry4nboy1Q2J+wQr4E74VCyTGLzWZzSuNnOkxn05Ri2QFDZooPUr5htMvj+lzCQcSaNgvTyLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXVzC5Erey2pv70HaGoDoPGAzjPpMnpZd4DTmxcC+qQ=;
 b=OcPK0roC2DYlxDY/da6NYoEudlVD2e6iM+o90DoJxS+AmlKCnN2t4MXyztaxfKPImWq/jyNYEwP6mNxicOGnd+3yfBW2MyErWFKGZsbRthhs2M1XaE1N88XAH3A3xmaBeWmwc6tjGAe0VkCg8By6+rXwTZlA+pRDNlOduz8emHW9iWgIPpzjR9KHEIxv0hgbh7vfg5ceeRe+TR1arL0PIUXeTSyCLHIpL/Sb0ELL1jn+3N2hu1Nu1EjcN/KRezCoZ/n5HE5eICjMfP7w+a8dUXweNgOEtoLg8+FR+HEgHWIczmX6He/V66LnUNulYw+GbE9RN3RNd/KHZ9rAqCnyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXVzC5Erey2pv70HaGoDoPGAzjPpMnpZd4DTmxcC+qQ=;
 b=lVxiemBao4zvWMSTqWvsiAAhzDtgcDgRjYEa858UWaNfGhIz/Htuaiqe/0tUIOqBD2nxK8kKFETB7PiqS3LikdTB+E4JN8+OL9dY+I735e+lu8wPydb4GqJld1J9ZLtEPlnNvAvVva2viBDiq/LtIxOz430bnMfWXTgNED9YrCk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4694.jpnprd01.prod.outlook.com (2603:1096:604:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 14:58:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 14:58:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 06/10] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Topic: [PATCH v4 06/10] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Index: AQHXfJhldyVeRRVeIkeYXPxYeURoE6tV4e4AgAEURqA=
Date:   Tue, 27 Jul 2021 14:58:26 +0000
Message-ID: <OS0PR01MB5922CBEC636344FB4521006F86E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-7-biju.das.jz@bp.renesas.com>
 <20210726222830.GB981051@robh.at.kernel.org>
In-Reply-To: <20210726222830.GB981051@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da14c781-7003-41aa-6885-08d9510efd36
x-ms-traffictypediagnostic: OSBPR01MB4694:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB4694B7B2DC9735873E95D89386E99@OSBPR01MB4694.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d/sry+X8DUEzJygmLZnaBRp2OihKW6cAcx5Y7OyuUBw/TLTEVtaqt9eg7Mr1x2AYmqRQ7p7Q9iQu+b8GEUCemGqnwkkSLaomDLdJH5qD65O6joL8wlBYjR8F5YjsqJmgU5YjoFp09hZpz54iLc0MeOCCeVfwWGOL3D6wiE+LxTGR1Y3Uv17kWrj7eJ685DVlsPkw1xbc+cPd1bvzbuEgpZMADB+NTvAMrpfoptNZpne+iH/0jEgiHJHLpUjKry82pF8+tpJOVUCwGPECoSkWZHxm6/oFJtG+jDz6nN9NShvUvUYqAqLLzjTvZTCqTlWoZNAkzf1G8J1uchMDLEeHfsMUkas6xUZ6z/PhUrGlecgc7glNeRmtMWhAVurTOQIwDG2gLvT/nFET1ng5h+BJNhKEYx3xBaiAMkgqAvFc0DOkQdO61wDMV6NCe+TWA8HXWz88VZAzLNzY7K7gT3drAMkZBYqo2+PjN1TOupKlYmNB35Yomf6WdnKABEK89+6Qxi9b+w0TF9Gs2tZK6qjIlprDGRlewJQyiJq6bEhguITabliLWoY7LTJOxGJ1NSAH8Z9Pna8P/HUSbAEH5tonP/0M/ChaeZMVYHYWYS35xd8ty9DjYgqDIWXwzEo1zkhNz5mTY1YSv1WLc+pF3/yD2v3pJDeUAfpW1OYaoax0eu9eLRt6ok4iYcdLpcpDluslV7h3AE6WXE9TEUT1KIlzHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(76116006)(66946007)(8936002)(2906002)(52536014)(33656002)(83380400001)(55016002)(7696005)(26005)(186003)(9686003)(4326008)(6506007)(64756008)(66446008)(66476007)(66556008)(71200400001)(86362001)(54906003)(122000001)(478600001)(316002)(6916009)(8676002)(5660300002)(38100700002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P0Ilp8ExlPZAcug3R0PV6PZsXpBMQGi/ix6vftsTU4W+YiPRC/9xQcaPLoNW?=
 =?us-ascii?Q?ms76KZBqBLSIRhfEmsQukDhCWAv+N53VbDuc6UNo9KdW5r7ebRdHKURR93TC?=
 =?us-ascii?Q?gC3Tp8SlhP8aWpxX3+km6sRurDmKCVHJFXan3MLEdfKYhF6plBDG2qIacCJ9?=
 =?us-ascii?Q?tcYkmznTXKV0pNQd5KlpxmeAyp7JeGt+YvsMQw8EANODliPTXsMWkRX/TMUi?=
 =?us-ascii?Q?0P716rORqiU2gO++s6OWfqcVtZcOLUEw+TVYqHw6yvOuaRnNu/nSiJBaURud?=
 =?us-ascii?Q?Mn37dExSk7O46aE5yy9n91pWjU820hW4pARy25bAJ73pCSUDhABGgl+HgBOT?=
 =?us-ascii?Q?0bHM7VbJrXxy1UZFhZslN60jGKihLJZq8iGq9dyMKnPah2nyGCXgTKw1TQT6?=
 =?us-ascii?Q?vlrKVzaCZgIea8cDS5zu57Xl++Hh1Mjoy7Or/QOP74odb/HXXR2YBL5Qc2rv?=
 =?us-ascii?Q?RrXWnsNAvKQhBwTqAmerxIET+XdNwPDGQJmmgM2SvtqA98Bkmnw5tfmBKXan?=
 =?us-ascii?Q?h6qKOUbxV2m3s9TEvQFVchskPcyEyT4i2g5rBxBGWJavv37Bjb+ncAId+gbT?=
 =?us-ascii?Q?HmXQd5BAILvJdyKAqAT+uucKcv0RP7RPtoVZGEhzNpppN/CgvDc39nnHfvtt?=
 =?us-ascii?Q?bdfJ6jF79Vx+QA77s1kUq0Y2mi5BvzQ57CqKWu0bhee6VHI/pZEWgZHF2yHP?=
 =?us-ascii?Q?WYgUQimnq+7OqsUkdUIAffww4jres83p6yQCWeZmglHri5EXcifUz/rjUKZM?=
 =?us-ascii?Q?ZD8BOO+qbEoaoeuozS2FROtYPlFPUmGAoX2syutER3BoBFwGHFBhqQ1I1myO?=
 =?us-ascii?Q?C15BCG02YYoCyn8e6ddFyK8z6Pcd42V3pn0OWAak05HkNxf5NuaeaOKz698L?=
 =?us-ascii?Q?aj9pstqoHXDoJroKEag0zs/xDkCJakdHpDM/awpD+jT3PFgx7vG9F6+VuVcG?=
 =?us-ascii?Q?HpGrK2cDftz5jno1SM8ntA6bq7kFVf2dZPluu/Srtj7X++htcrlT7t7FYWKk?=
 =?us-ascii?Q?NdxWNTk1Oi/EVt7vWNmNUFXodWiOnVypnQKwzhT8Z1yRuKIs2aJW5/ej/Q7P?=
 =?us-ascii?Q?Bhj44egoJWm+V3prSKQ7YfC68AWoAxOH5xp5remMGOs8YCtS4tIItH4naWFV?=
 =?us-ascii?Q?Eer/Jx3/P6lBJBw7rmiJyhACzpC5ZNE/mTeOjupPr4zdQMZ8trlHu6BIVDpN?=
 =?us-ascii?Q?KaTgXCiDHsmxnT1b7YWcdTkwJci4RXl8NwdoZER2b02rpzprbxoSS1ALs0WO?=
 =?us-ascii?Q?G9HWycJSOvqqlSr0xB3Jso1lVPSgNssjAt1RsUtv7aFW1iaPq5B5WOdRSZlF?=
 =?us-ascii?Q?RkS0jDMyo8gvY/UTg3sHymJV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da14c781-7003-41aa-6885-08d9510efd36
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 14:58:26.8084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9wrhGoh6xDBxvzDF4vNZnexP6VDJ4uno4Lep5XmVVU7AsLTUDRcpqKFFldB2rtEotHEAUValVbZI8gawDMOHaKU0C5L/tsC4C4txP2ES3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4694
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v4 06/10] dt-bindings: phy: renesas,usb2-phy: Documen=
t
> RZ/G2L phy bindings
>=20
> On Mon, Jul 19, 2021 at 01:19:34PM +0100, Biju Das wrote:
> > Document USB phy bindings for RZ/G2L SoC.
> >
> > RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It
> > uses a different OTG-BC interrupt bit for device recognition. Apart
> > from this, the PHY reset is controlled by USBPHY control IP and
> > Document reset is a required property.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> >  * Removed second reset
> >  * Added family specific compatible string.
> > v2->v3
> >  * Created a new compatible for RZ/G2L as per Geert's suggestion.
> >  * Added resets required properties for RZ/G2L SoC.
> > ---
> >  .../bindings/phy/renesas,usb2-phy.yaml        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > index d5dc5a3cdceb..151158d7a224 100644
> > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > @@ -30,6 +30,11 @@ properties:
> >                - renesas,usb2-phy-r8a77995 # R-Car D3
> >            - const: renesas,rcar-gen3-usb2-phy
> >
> > +      - items:
> > +          - enum:
> > +              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
> > +          - const: renesas,rzg2l-usb2-phy  # RZ/G2L family
> > +
> >    reg:
> >      maxItems: 1
> >
> > @@ -91,6 +96,20 @@ required:
> >    - clocks
> >    - '#phy-cells'
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,rzg2l-usb2-phy
> > +    then:
> > +      properties:
> > +        resets:
> > +          description: |
> > +            USB/PHY reset associated with the port.
>=20
> You don't need 'properties' part here. Just 'required'.

OK. Will fix this in next version.

Regards,
Biju

>=20
> > +      required:
> > +        - resets
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.17.1
> >
> >
