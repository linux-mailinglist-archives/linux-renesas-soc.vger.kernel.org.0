Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A8D3B00E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 12:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFVKGb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 06:06:31 -0400
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:1472
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229490AbhFVKGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 06:06:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH8ZqDNRdE9HuiI//bJcazkfM6rhdZdogwUuBUtldaMxll54169QGKdPVAbmACxOuT8qdvMsc/Tmftku7u4ftIhP0sY0QHbHiZvV8XuweQrq0fRfHF4AX8zs0vD249EXb4VlwmUtzJefgFIn4NIOeRHIy9YemUEHe1J/ZEeJVbb1vBTvqLtNizEkRyyojBiQZb6lTxG6IlwU0TxMQjU6ivgTLwzPdmG6Wp0IgJwHRJwCFqJ3AJBeirakd2Jj2LEVu3Nzazi/icPk8TiPiaFXoBXKksKI0bV9fwk34C89zLjv61ifb2Qd96J92GnLctlqKh2vbi6dOb4eV6G75tjGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYuIMu8doN+ZkVUipTbiXK7IxgRLb6PMGXbjDyJOG5A=;
 b=iF/YQTofuREORA3POnBTLb/Z9F3JGKo5G9XPOXBBprmfKSSVfRejC7af1mDr/aUcvUQm9cm/hBgL1SbheuP+EpDanzlR2NURCIs/5nuQ9lbxURI27h16iY/BIup5vpm8do0vBqiKGZPiCUlRZJpscOg52QOi+xj7CNgej+0bkdhurfj49I+iPZIJJkofyP7AUPgiXdl8xKV92Qd784ehVLZ77J30IuZ9A3OmleidDL0m77PIN4GeodopQpaFCzRCnOmnAWOikycoWYVUxsSHllgUeZeRUWbz4aIcKVyaS2mWzgFyKTPiI7OBN3PcXGi9akmUWdAGHBx4NOSxaa485Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYuIMu8doN+ZkVUipTbiXK7IxgRLb6PMGXbjDyJOG5A=;
 b=Jcxhx8Breprd8WT7KSjZiPTSKSV3vqbHKafAZGfJVYguWiHs9HfIG3TfEqxrd0b8aepXuKx8wREYryjwXVlkYsko1PXgNAb1xrn20A9W8AFMyB4uTYqFLVcrIKVfKdlkCuhYT1Iv/YhSj/2th0hCPAYMvwK4BlU7R0KqSGFch28=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 10:04:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:04:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 07/11] dt-bindings: usb: generic-ehci: Document RZ/G2L
 SoC bindings
Thread-Topic: [PATCH v2 07/11] dt-bindings: usb: generic-ehci: Document RZ/G2L
 SoC bindings
Thread-Index: AQHXZoFvvDGr/d/5nE6HyVcKiynWU6seu+oAgAES66A=
Date:   Tue, 22 Jun 2021 10:04:12 +0000
Message-ID: <OS0PR01MB59224AA7BCD9CF5033BE0E7C86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-8-biju.das.jz@bp.renesas.com>
 <1624297202.390358.1161642.nullmailer@robh.at.kernel.org>
In-Reply-To: <1624297202.390358.1161642.nullmailer@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1034db12-7a0e-48de-4d5d-08d935651632
x-ms-traffictypediagnostic: OS0PR01MB5409:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB540966ECEECFB897B10FEC1F86099@OS0PR01MB5409.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42UsJr0DTgv48JoBpfB64r+2p2K8RXZ6el+Xk2rjsT3VkqsZCPO5dcwFUQHfpwBPYCQse8bkZiapDDkfYbOlG4nvwd1d6uKXNQxZCzJV1Kv1ADk6z5zGSXEmN+xHquc7Qy77ACwbG6hXuuSIL/FtnbMvuo8ZXRMbZcmadWVhsGh4jU4C4RmMPNeuOwRd3wtOjR/ji3OyVsW3Kf9zNhUetgXS0GpaLtIcAd1MvyDzARP+5yogvnJE45yismtdZpHZrUQ3C6lWWfuYcFGgmCoNG59JjgXI5zt7ReAESYchVvoEpiZHeNaiLacujLp3uo1GDgY+4r0yxnIgK51QaqPiOnDYwrrYFgfrGS+lswwTGu7NpsztwarT3K8jNSUuoci6DnLvy8ob4AQLIDzIVycRDIJygxY/lEPcExHtRcSDPbuIFA/sR5CU8dPx6fKLMPm6IXfeLh2HhjuRhxXA/Urz8k8QV40x7exDbOc+pgJXux1ry6dmVOGHDvROZeP1vQdokdIcHxlAA6mdJRW6oTZtVJVDRWj8Quod01gratFUZRpOO4Gc9CB8Plqigk0Qw/k5h5BIHVxnQFLvZuMn8t7DQIlBYDLudsigWZGXmDnhFZhuuFiTyIlZtb2y6HmkyHxIZcKOj9xdOSzLvzVCIaCoGqulWPakR0A8A1eLDAmZXXuo+E/TXCDFjotIFZd87ckKG+j6Sgy/jWODbfqAAluw+oCvD80ZCiwGaEzXGWZRRJXg6HZweRLBWL8bVpMkBGb1PrLxc8fPgU9DcqSZAeQuIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(396003)(376002)(5660300002)(45080400002)(76116006)(107886003)(4326008)(478600001)(66476007)(66446008)(53546011)(64756008)(6506007)(86362001)(52536014)(66946007)(316002)(55016002)(9686003)(54906003)(6916009)(966005)(7696005)(38100700002)(186003)(33656002)(66556008)(26005)(71200400001)(8936002)(2906002)(83380400001)(122000001)(8676002)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h/Sc9V50VomQLqtQLPEFYggJHT/VR56P1PY848YZDHz6QXr8fRPonYqtbmNJ?=
 =?us-ascii?Q?x26m7exaxD74dQk9y+/dIrRxDTtz4qpTmmJ8NeLw3fxm5EliSUlBZj4kW8uS?=
 =?us-ascii?Q?mR8rRKA1K7qfAKcGwqhIms2FJ06qVPUI6suC/jBuZpsVvXnoOZJzcF5TPdEZ?=
 =?us-ascii?Q?N5HfXPCYJMgp4joRK0pJDtnCHi3CB6aY9daXN2JLBDvwbZhQhPRHk3ti/TMo?=
 =?us-ascii?Q?Ea+sX5qt7ykp25Q39u+wJnLhZq/lrDlxUS4MCL2+8mWP46ThlCcWjMuX50dl?=
 =?us-ascii?Q?OLq6yvwJk0BhZR1r/J6Vec6KIQ9KEoY4PSmrt0/0OYRa1bdm2v5poMboqfEE?=
 =?us-ascii?Q?K0vk78Pk1cH0k4aRswAGeyo/esIyM7HMjVh0JrKokflIpxxguFxW/mvrAEDo?=
 =?us-ascii?Q?cHmG2h4qYJ+6U9vnO79OnPEM90JP7BacbpLhIOkqiUfjZ8bms5weQVcuTaxL?=
 =?us-ascii?Q?yA0rgcFwuWOV08SNcLeahqqvgFV8FF2xX4extnYfvj+svnRT2LTtSVgI5lDL?=
 =?us-ascii?Q?B26WutxtFA9W+5IpQY9tRUxwsVb6Gm7K98MMn3blZ7gdVg2pcxKhG+9uENV3?=
 =?us-ascii?Q?16n53kGAr26WdVNSnL5kf8B5hUh8iH88LLcc59+J5rGWesQ+Kk6QaPsHgsad?=
 =?us-ascii?Q?EzlKmMKhx/LYJ7kmA31jmL6TAt7mb6070iDUtBHXV5jr4tVJN5mVRQIK57pe?=
 =?us-ascii?Q?Sfn5TklWykgDxXgKYmWij4jpvdeKgjlB8w6z02yquwaqLZnnU1+EC5Ofdqzr?=
 =?us-ascii?Q?HM1iwcUoqtow2pw14AzY/9SNTuzcfrVT8FFTbBjsUe7sKx05XBLE4E7jYaiA?=
 =?us-ascii?Q?PsBONjoW4yQmolpQ6tiBfqecgDS45uUbVMQIUD+0G6iv4ibhtet0GbA5ThVc?=
 =?us-ascii?Q?u04wTsIPFKpxvGkXd25TdEDfe8YFWxSfunZG1ZpqCuNQD5F1JsGjPyD1N/Qy?=
 =?us-ascii?Q?fhnXfORTCITrJVz13KOoqUwP8HXELpwxDIviVw53nAQ3f/vX1apK5S/NF/Y+?=
 =?us-ascii?Q?VlIuYEjGI5xpjeI3O1tVthrBp9JTlgugCfjs7ZsW/LgvJ4WNJK+aec0Xg7xH?=
 =?us-ascii?Q?8qyZ6OXWM1B8rohJgBr3DhaBfRyR9vSZmsOvuuyxbxktipoY2C+mO7Ph49xD?=
 =?us-ascii?Q?7NgPBPPjBAkynhfQv0HtYjM19WQXOTkOrJ4Z2sxcnJ+pFISm1zDvG/QPH1Xo?=
 =?us-ascii?Q?2fpm9NS+dcoxESirglGgHtoX+tUKV+RIe1+uF9z6mMWf/7HqEja1NfEYcdkE?=
 =?us-ascii?Q?jH+Dnt0gPCMOxE9808x+KpSMs/vciXIQLYzgcErB/oTKLuEEeR5z0U9Zy1WO?=
 =?us-ascii?Q?/PIevopsfeikTZQzbWx8PPeO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1034db12-7a0e-48de-4d5d-08d935651632
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 10:04:12.8765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Im1GTG0cC3UBs17Mszf5V+cy+LjsMW2SbBJd0C0YiyWRSrlNhe7+jc0cZZ3+ksumZhdGf9cmHRGJZbXN212ECSusei/FCYcGhAqu5iFtSf4=
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
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; linux-renesas-
> soc@vger.kernel.org; devicetree@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Rob Herring <robh+dt@kernel.org>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org; Chris
> Paterson <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com=
>
> Subject: Re: [PATCH v2 07/11] dt-bindings: usb: generic-ehci: Document
> RZ/G2L SoC bindings
>=20
> On Mon, 21 Jun 2021 10:39:39 +0100, Biju Das wrote:
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
> >  .../devicetree/bindings/usb/generic-ehci.yaml | 33
> > +++++++++++++++++--
> >  1 file changed, 31 insertions(+), 2 deletions(-)
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/usb/generic-ehci.yaml:28:13: [warning=
]
> wrong indentation: expected 10 but found 12 (indentation)
>=20
> dtschema/dtc warnings/errors:
> \ndoc reference errors (make refcheckdocs):
>=20
> See
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fpatch%2F1494982&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.rene=
sas
> .com%7Ca5c6e52f8fdc4596558e08d934dba5e6%7C53d82571da1947e49cb4625a166a4a2=
a
> %7C0%7C0%7C637598940251415158%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
i
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DA1oNbFJ=
tcy
> uOHvpE5IDBptxNhyoc5zlCVbPGpgnldIU%3D&amp;reserved=3D0
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

