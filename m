Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6711164B000
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 07:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbiLMGne (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 01:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbiLMGnd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 01:43:33 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6006302;
        Mon, 12 Dec 2022 22:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irlYwQx+6jSqgfas/ynbV28P4Ew+ZKxeNpG0hI720wRMWZVuAJxMehjKzNI499J86hzAimL5FiS8oPUW59xyFP7R4F2P4tRbL/QI46VDkehjMFEnfQNAa8shGcfvDkke34wnDk8wqxbF1+Cl/bsou4VzaaVA5yanPgwYU9WMm5FcaBjI5IkpL+4xeVPUR5E8n7YRykIsOwbKNXhuFGfFDOiFrqk03XaQ95lQh47Sd9/FSue9nmrAgAuhffbtl7gIT9OpI/XjqiAPGOVmyQmtoyGfiCWGl0TX1NC1l5xdrSiGLFOmtq2xmL5ean8nleYORlnOSoGTKOBjcYo+qIXCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXb8FgMtw4OlELVeZAHbCuNu83XrOkSe4YpQr/ohDL0=;
 b=bGgkvweDj+Tn44Lu0eZnZjhhX9PajK7Ha1HfiaHdJqK18Jwe4yPkXSukaXazMU+EXo0ekrG8iRrP6DRTVKeJxzZzagJTW33qGHCYqHfBWy4rJl5DanhBz7B+nRtkM/nvaoSYM8EiyJfvBgPFYKTtRpKDQW4fgUUr1Mol3MBaoJREAVROt5PGIv5sHQTgaaWy+TVvlKXQXMEGVc61RQl1oLs4ychYbI83RBaPcnXQnte0R7jPMtVuhiuv1R/0EBab0j058PN1HBXyIEEjqXlfyQkeG8c2CswQdFUgqw6mRgZZwGAqSvpRoT3puh89AT5THh9NYBEfun+nxD6cL6CYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXb8FgMtw4OlELVeZAHbCuNu83XrOkSe4YpQr/ohDL0=;
 b=EM/Va9YRCRBzVMYUEwmgWAlgA3+aWwHZReH+eNw4QXOO0rMgrrU9QkYrAP6MNhsEubdfhcsUG2XF0KhJyhIxMr2cXrY0sHTM+5V7A9GzV74payrwjM/0L0CeBOz0SXqEDx9Axpy1BjjlT8VVvmhRMM9EKm0P47jq+1PphbJUgTY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9778.jpnprd01.prod.outlook.com (2603:1096:400:22f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 06:43:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 06:43:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Thread-Topic: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Thread-Index: AQHZDk8gBgnbtRuyh02a6fh4PZaBEq5qwbeAgACcI/A=
Date:   Tue, 13 Dec 2022 06:43:28 +0000
Message-ID: <OS0PR01MB59224D6C68D9A0FA986622B786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
 <167087981089.1543932.15032317950577945818.robh@kernel.org>
In-Reply-To: <167087981089.1543932.15032317950577945818.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9778:EE_
x-ms-office365-filtering-correlation-id: 632ad567-2983-4fea-fd10-08dadcd557a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kfzSGoWKOFTjSJkLSP64d3mUBrH5OpO3fhUCWJQuze+iOhXyhDo+dvlSdLYk+bWCVbfqnZnIf2USN5d8dqBtYGrqR+vX8fOAunoBoES+iIVHyyiPIPuxjO5hoSD4IHG8qWMfyPE3C0DPe1pSU4vr1nj+zv+yj00kvv8wLrOvtFIRH4n7QfRsGZMpnICMf4Ceiit5J/0FWKOhWqDJg0rfz1UqpN+pL/oX0NVl8pvjcjLfyu/uDlJg69Ise9PXYm3wBv/jjgnMeRlPicj/T8aSXzTzg6IRaH1Htvebu2L3ZBQbH1BXmp16U0jy1eA305b4AyGsrsEdducHqBcOmz/RLmiXiGCBNj950bRHzV9e02tOh6h+/sWtslvgigeCBtZVWI4iUFjOBF2xE9O2hdr74G4Uquzety069+fgmCnO1Lv9dgKOvEGJBi3ZqvGk6tnOCiiQqYGdvQpl7K3lzh72hJNKw6OtCbunCc7XlMaemCiP1TEmzVb40gI45zb9M4gibdWbg2oxXBArMBDYLn348gBDybuG0lx0NXbkekIoxOy1If0m70HfTeFFaJn69yrS5fmAl5kmk6HEZy35akT2FFTwQM9Fg7u4tipYRWig5616kPZuHwnZxYhi9ZvAxRzhw7d3qCOoABfiRR0Ya5yJAisNEbjPeron8BnG10Pq0Df0jZiId9CcDzmlMIh9vzlFceZb3mN1oOAlC2I22wsMJjZ0HE4NLPg4t0ajZZsANLXDYO3NpgFOnV9YYhev7OEruAyshcsmamV5mq6Wmwj6zoybKUPZOz6c+1TJREpLUlw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(316002)(6916009)(54906003)(5660300002)(52536014)(8936002)(8676002)(66446008)(66476007)(66946007)(66556008)(64756008)(7696005)(76116006)(41300700001)(38070700005)(4326008)(86362001)(9686003)(6506007)(83380400001)(186003)(45080400002)(33656002)(478600001)(966005)(71200400001)(2906002)(122000001)(26005)(38100700002)(55016003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9iVnSWPyUn/K4k6VNEfuaASrNwDz3x6bhpMMRET4oK819FY7GR/mKW05XUso?=
 =?us-ascii?Q?Fx0dmHkHxunEqTKQ2Y8a0auVJdzSOOIwt8A+O4NSPf1nih7BchjKoCRNhjAH?=
 =?us-ascii?Q?HKwNiZzdzU7QmdQlsxWBMDEU9jxVquUIsjAeBU2wL7vEW2p4a7ZVhdkS4s7w?=
 =?us-ascii?Q?5JN6pL+CG6JbNwELIF+bPVES7KQquH0x+bvSjVlORaCfYWHdbEgiLIh2nDks?=
 =?us-ascii?Q?d19drIz6lTOYRo4hFifIkjoHZ+oNtKvCWWpDr15KGi0jEYGl9H1IHc9wF5m3?=
 =?us-ascii?Q?JqNtSxJDpkgDhjSeZwGvaaipKYumy7mBrdQE1fE6nyA6YvmwSU+grMtXtPzD?=
 =?us-ascii?Q?GKNos40lgPwI7D+YhMNLZP8qtKJm8Njp9S/08B4aEqwRHLihGGTTkLIN15VG?=
 =?us-ascii?Q?l8xslCjpASexLFE0yjPjNhbruOkV3zMUCgb6IfNUZel/SlSl2ywTjDi9B6xs?=
 =?us-ascii?Q?t1LAoz08+/DK6FMTXOMyoZY9+XJU5+8YToOxBH1qMfbxd+CrkcRr7KR2GjQ1?=
 =?us-ascii?Q?O9FDv2P5tuM+X5b6KU0RU9G4CnwpRNwxaU2u046ewKMxDCSmJ89BeCIzOOjQ?=
 =?us-ascii?Q?yVGviupW5cNPrJi7yD7+MhBuYEO9rqzQpvWJ+aBbmy7vV2E+6r+lYEu/jvBL?=
 =?us-ascii?Q?3AqHoWQQIweqG2OGXvRRFZzWtucYQM55H8V/MATKvJqCSSpbsj6u4mpxzkBj?=
 =?us-ascii?Q?ensViF7bNVt8pQAf3LVV4KZAzW81vAJb3kdO12HynGodKLOMCFqd23I5D2/V?=
 =?us-ascii?Q?ALNopLiIMumYajiuJrGI64gnGTgsEnIRXxRBRBo/BIeTtYMfCVTa0PhMHafN?=
 =?us-ascii?Q?f5jgTLXI3eW59hjL0qmhC5NN4SkuskrkkZ/sYhRpwVDATErcbBhNLPL096LJ?=
 =?us-ascii?Q?ZPa0utuqg86ym9dmjz0/LO176RIU2yOendVIh0oDWvHS31G3/o6pxH0BbGFN?=
 =?us-ascii?Q?4EwPCSWS7WLHwciwbNXo+pVyX5oOmxuCYXSSai1Xxz5r8jMu9joyrKVtKRj9?=
 =?us-ascii?Q?72+J1QfeqMGBTZ3q960Hmk1UbXb96y+mpH/sB3jH/0PfIY3qVTSiqO0TGaVx?=
 =?us-ascii?Q?nFC+pRI0S2gPrGjFtBv8fl+p39hnIylx+0H9dqSSeOterYXKbIcfwb9oxAGs?=
 =?us-ascii?Q?zO5gIFlhm+AtcrJMU5LN7/J+Gdpwn/TiH5vGKIfzfZKO/Q+FNNSx/TTDnzOv?=
 =?us-ascii?Q?Wg203UIFNvElDM+s/UGLbE+J4Ybtu2XXoH6IJx/Ln5eaR9FmgJuUAfw93kxA?=
 =?us-ascii?Q?HWhCy7+qLXMJJivkFs8BrVOX83keYZb7gwDmYv3NCxBVo/t++t4XgJ6+2Vh4?=
 =?us-ascii?Q?F/r/xoJ7E5BeF2qSpsNBuM767bzymxIx6d2wX8CYeU80inkl6tjCzdjAY+4/?=
 =?us-ascii?Q?vVndHZmAh+24przy9+W94GpBf/dgWuo3XIickIGPaoCOBvqUBuWBSQCSXiUt?=
 =?us-ascii?Q?PiYy6dTIJKtyCtjmMgupqVLXZ/+IVeOfXYQWaCMgTCWK7dd5um6gDAxLUq3l?=
 =?us-ascii?Q?5Re4yUyQM57zL1bWpe8XMpIWwJCp+O56N7gYbiKZ1C4ZzE4weiILk7aHyJLR?=
 =?us-ascii?Q?fZu6eP78tMSVukamEHzzKRY9oiFUEofGrUUCfNOb7+wjXShxEtHfYcZjFs9V?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632ad567-2983-4fea-fd10-08dadcd557a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 06:43:28.3027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLMRdxDb+bSiAIRhH0+xR3O/cSBPAPBh2Mcqvw4FgNksjhi1nw4Lse/5fLtWPjIicdCazFJYYCZstYoSrlCchB8qThPkmUxXgnMEkcxwAec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9778
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Looks like I missed to add dependency on later patch[1] on the same series =
for the below bot errors.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221212172804=
.1277751-9-biju.das.jz@bp.renesas.com/

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221212172804=
.1277751-5-biju.das.jz@bp.renesas.com/

I will send next version by arranging [1] and [2] before this patch.

Cheers,
Biju

> Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
>=20
>=20
> On Mon, 12 Dec 2022 17:27:50 +0000, Biju Das wrote:
> > Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb@85070000: usb3peri:resets: [[4294967295, 29]] is
> too short
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb@85070000: usb3peri: 'reset-names' is a required
> property
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb@85070000: usb@85060000:compatible: 'oneOf'
> conditional failed, one must be fixed:
> 	'renesas,r9a09g011-xhci' is not one of ['renesas,xhci-r8a7742',
> 'renesas,xhci-r8a7743', 'renesas,xhci-r8a7744', 'renesas,xhci-r8a7790',
> 'renesas,xhci-r8a7791', 'renesas,xhci-r8a7793']
> 	'renesas,r9a09g011-xhci' is not one of ['renesas,xhci-r8a774a1',
> 'renesas,xhci-r8a774b1', 'renesas,xhci-r8a774c0', 'renesas,xhci-r8a774e1'=
,
> 'renesas,xhci-r8a7795', 'renesas,xhci-r8a7796', 'renesas,xhci-r8a77961',
> 'renesas,xhci-r8a77965', 'renesas,xhci-r8a77990']
> 	'renesas,rcar-gen2-xhci' was expected
> 	'renesas,rcar-gen3-xhci' was expected
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb@85070000: usb@85060000:clocks: [[4294967295, 1,
> 34], [4294967295, 1, 36]] is too long
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb@85070000: usb@85060000: Unevaluated properties
> are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb:0:0: /example-0/usb@85070000/usb@85060000: failed to
> match any schema with compatible: ['renesas,r9a09g011-xhci',
> 'renesas,rzv2m-xhci']
> Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb:0:0: /example-0/usb@85070000/usb@85060000: failed to
> match any schema with compatible: ['renesas,r9a09g011-xhci',
> 'renesas,rzv2m-xhci']
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb3peri: resets: [[4294967295, 29]] is too short
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-
> usb3drd.example.dtb: usb3peri: 'reset-names' is a required property
> 	From schema: /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fproject%2Fdevicetree-
> bindings%2Fpatch%2F20221212172804.1277751-3-
> biju.das.jz%40bp.renesas.com&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.renesa=
s.c
> om%7C847aa4858e704c2d03a708dadc864f81%7C53d82571da1947e49cb4625a166a4a2a%=
7
> C0%7C0%7C638064766653956032%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
C
> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
%2F
> uKtm48%2Bzxnx0ha2ddRFLUNiYFXtesrXOIPt46UhJ7c%3D&amp;reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different
> dependency should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.

