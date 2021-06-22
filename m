Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5E63B00E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 12:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhFVKGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 06:06:13 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:1729
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229490AbhFVKGM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 06:06:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw2/DzEzlPwFFy0uuYd34HLgOsGYoZvUV2pKSxn+cb06gP6tbWXc4cnkZee1vfqZqT/Xz+2ipDRrvAKqi7Se4SdYf7h6qoGg2/aJF2iaLvgST38cXDn1ZMFXUCqcOxwd4xBJquiqDdlLqAUefxWR/kp8B81QKwdyOpta7CZ1Hxq2alEd0ksQnCTtJTw7lcj05UkwrFis8jnSDgKmgxtno9SlY//Xp/jEZOFnS3obuH8iPA/aMYlwTwct7lBUlk7VRXBNK7N5Xn/yqQVAFrXv1Jbu2IkHRsdDQ2H4gsO1LzoL2GCo2RscqtJXxgJBC7flVgwdJ8VBHzVXSMPV8y+xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2SY94QI8NQuX/WinrbVrLCggdYDYLB18Kq6I2hp0FY=;
 b=NMaNixPvOB+EbPfBdE7k8Gzp9t0CDCj03CUfa2fEYF/xrhBDBt2K5Ajrl1YsjdcEY3Jm/xb2128e/iOdOn7mNj4+4GtGzaiv1g9FzGWtfgYqtKW6M0TAceABnJH5DQtJsEge1saWlp0ofPP7bNwdS3lq+K4JuSBQLjczq7UOoLz5U0UAxt/I1Hjf+ZBEfBIT4R3hsrCC6jJAjY8yT9+52uYxFadbK6wnIiw1uWEUQIpF7fL/ip7fNDN6GXCgyARhuId4vyb0NoG8j7KxZU0zQF+9IEtDFW7sYyjWTf/QhsAbhAYk0/or+l8DjDsPAOBRlUQSWw5ExgsBbQJJvNu9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2SY94QI8NQuX/WinrbVrLCggdYDYLB18Kq6I2hp0FY=;
 b=YW6NeClStdtsRcojf4ULmlL4q5tTEsFMbWTFSubMyh6PskZcQMQ3hA2l3ZeqBctSNas4SRIyrS7r18hAZDuj/5mueSIjkwvBBFfX4iIpbLDrzY0ohnh/g21pHUek6Olbxv0KSM+3+Uk+tgF58rcaunQOIob0VXzZYLKmfolxg68=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 10:03:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:03:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L
 SoC bindings
Thread-Topic: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L
 SoC bindings
Thread-Index: AQHXZoFtyAkoi2PHe0KRV4IWK/6abqseu+oAgAESezA=
Date:   Tue, 22 Jun 2021 10:03:53 +0000
Message-ID: <OS0PR01MB59221801737722E9BF85DCD686099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
 <1624297202.383434.1161640.nullmailer@robh.at.kernel.org>
In-Reply-To: <1624297202.383434.1161640.nullmailer@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00aaf86a-fea1-4d2b-7a60-08d935650aba
x-ms-traffictypediagnostic: OS0PR01MB5409:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5409709FA395F7F2D6ED9E4886099@OS0PR01MB5409.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uWRlXdiPdX0SPR1Mu4ck6HR9iKG6OWzq3X4mNG5pH0J6V7wMS7mFlzJToDEwAdpn1qf58O/0YOsVgc8L1ZWOjbhot/gS7te1kgdl9QjkjWdNPinhQDmOhpopFq1rTKJBwyWOrpx2G6ZS8467B2Pty98cekmuKND0NYyKYS/X62tmV471rHHOkc2zX1brjLBZJkhB1skAPfKLZfd9Onr4bWFQiCBbWgnajtgLG4/QywX4b1f8KUPTlV2rJBRUi0eC3+XLK2SOovlFPugErQXK6hP7ejnrBowUzZpTsvd9+errBn0015qD8fWf3PDaqxx/rZCn7TDEvUT45/InpLdNIBHxzewZSfrlui1iDJIIDqTL5md+JJqspeUzbTTDwyI0IQG6MDPOVAT0gY3riAIH/1EorOgtpTIhVAeviwZDRmjXFjRPprT8kq7nLMmiFjTVM/9RU8buCMTyXWOsrZdO480YuMyrLJUK9Gbs23IAkBuR9ZDs2iW5LvZ41U3Hxo+P2OUD+tJ3Nxf5gSICbtIEoEz5LNbB6KKjYOUIEnUrl2TGwho7Acd6VIh0+T62lXgc0HpT/UeNJLDoLJWvTaOOAKVWZ6ZO5wnYGNYMTHqZSZHhMZZg/Nb014HoRAR5VlPb9iGhJzR0kVR45nLjgeYxt/MlFtobPIJeBB8orRHPK4AHHwytzeWlLzWDIFaXZyg4E/4E0Iwx0ejXEf3jT5unrzr7pnJatkuTmuxRUHtJrsRh6YQ9cmUynoa0sCm9CM4dMgoGobM0ZqTXMxuXb75q5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(396003)(376002)(5660300002)(45080400002)(76116006)(4326008)(478600001)(66476007)(66446008)(53546011)(64756008)(6506007)(86362001)(52536014)(66946007)(316002)(55016002)(9686003)(54906003)(6916009)(966005)(7696005)(38100700002)(186003)(33656002)(66556008)(26005)(71200400001)(8936002)(2906002)(83380400001)(122000001)(8676002)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wvg7+zWcGpWBMSrBM9eZV1o2dEzAlqCxW5cXENUqZ0N6Nq3FwWxsC42Ew1ho?=
 =?us-ascii?Q?pvO6yO4ih/XE1vlLDRvt0N4yQoSnB7iXnY3qW4lT3vwFsy/molhsEhjB0+KT?=
 =?us-ascii?Q?b3/EaXCzpznlVLy/woSd+MjYmKPAznwOKLSNJ9AolNFDa54TdqyUAiiLP0LC?=
 =?us-ascii?Q?MyMrdFPPiMj/RX8qN5RTiwer3Nj0Xo89i5+ovErndOVLrbwQochR9IlFv9nI?=
 =?us-ascii?Q?Xz7TS5oCnWX/c0ahb49Tlgxhm5e14FARNzmXj3YT6N6iqQZ8Vojq49/rbMJn?=
 =?us-ascii?Q?MDlViyis+Ruba3FSKYZ38xQbh6bKLNBXRvZnugfCW3istoWgUhCB7wrBdCW7?=
 =?us-ascii?Q?w0PxB/VgSB3IJyNiLiCDRW3yzGAfXS3Tvwwfsvxw8jutXR3C7tefLFvtn3QH?=
 =?us-ascii?Q?IkJXWNP50ATUr0Lx+IwxDMHzVpNvge7RRNaTCa+8qbJYrqDTPmgoa2q/SJeV?=
 =?us-ascii?Q?+yowLsxa90ICvb6r7EpI87fDbmGVeQHFzRCHgsu0vvO5WsMyQlQ53K5Gatlm?=
 =?us-ascii?Q?dBL7auvs9kcfXdvCeHm1aIcF1KKLCbOl2+mUFxzP+qsmCCFTlJ80N9sOsc9Q?=
 =?us-ascii?Q?P0lScR9CaObvnU69XLoAfT4KRZDljS1S2VSejF58ME0Rademh+P2NQdKFNbj?=
 =?us-ascii?Q?lKnr3d6X4usisC+/dyZKt6NwT9DrkceGTvrxl58kKP8rfF2gb7NHrdwkst+u?=
 =?us-ascii?Q?+UAOIT67UADetH88vsUV7QLOpoOSJndb2sunrlxQ2AkwhavF9yQYWR3keGXe?=
 =?us-ascii?Q?Webf8W854mjQrjZJFe9V/AO5v2OsvlKgCPyi1Vv8MdcIr8vx7t/uoL8UpWNk?=
 =?us-ascii?Q?Ew0t3fuKaYE4IQzFT/gI99d5K3PDlaoXVlIYaunT9dn5fZI25f+OUezkvv71?=
 =?us-ascii?Q?WCVDkwouW6VX9pN4fMdHQREo8Or2LWJeBr48Y0GZ/oDUe6fQSVjEOY7JPy0m?=
 =?us-ascii?Q?EKKZhUSrYfPj3pyul6Mt2oLNYb4sECLQ1WlQ/M0uPhHPJhxSLpz21cHH+3v3?=
 =?us-ascii?Q?FwubMFCVqkqx7IaTq3dn9MQURMRU30ceS+bRicj0iBAqeSCaTJixqyaNBA/x?=
 =?us-ascii?Q?9ycw8BPWR9knGfZz1sgy1g9D1iS714B53tC1AdhW4K4+OhhkEbShlHZmpRsu?=
 =?us-ascii?Q?e5kC03cxQ3PBTpsb52x61FF7iUEkTEERA1KmafGesLcZHPUXOcRPYxN6fgrT?=
 =?us-ascii?Q?cptzC8WJyia01yugvG4IxifPJUvUwK4v/bJ0bNsB7bWeE/9Sx4YGJWcthuDy?=
 =?us-ascii?Q?OwoMw/s9XqcFBiJGTJCTQMiKc7tDQkP0TuGIwG99MSAzgnQV1XXfSIpp3OEb?=
 =?us-ascii?Q?QrFFreWDZwtC6xjeZsm9kwL0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aaf86a-fea1-4d2b-7a60-08d935650aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 10:03:53.6781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIiq3ggdrwHpqt0MK0U7o2jc5TTVinDp2kXhvUJJvfJJeDNp0Q/iop+4TpXhMrQ3VcuKEoS1gvKTiOtR5g37PuKoEAkB35Kp9oNwYGZieHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

I can reproduce the issue now, after installing 'yamllint' and  using "DT_C=
HECKER_FLAGS=3D-m dt_binding_check".

I will fix this and send v3.


Regards,
Biju

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 21 June 2021 18:40
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; linux-usb@vger.kernel.org; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Biju Das <biju.das@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document
> RZ/G2L SoC bindings
>=20
> On Mon, 21 Jun 2021 10:39:38 +0100, Biju Das wrote:
> > Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need
> > to turn on both these phy modules before accessing host registers.
> >
> > Apart from this, document the optional property dr_mode present on
> > both
> > RZ/G2 and R-Car Gen3 SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/usb/generic-ohci.yaml | 32
> > +++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/usb/generic-ohci.yaml:14:13: [warning=
]
> wrong indentation: expected 10 but found 12 (indentation)
>=20
> dtschema/dtc warnings/errors:
> \ndoc reference errors (make refcheckdocs):
>=20
> See
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fpatch%2F1494981&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.rene=
sas
> .com%7C948f485a377b4f12c7ea08d934dba3ba%7C53d82571da1947e49cb4625a166a4a2=
a
> %7C0%7C0%7C637598940229461664%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
i
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D4rFbOwm=
thR
> BAmn7MNMAHqQD8hm2lgLSKhUNg9i95A5M%3D&amp;reserved=3D0
>=20
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

