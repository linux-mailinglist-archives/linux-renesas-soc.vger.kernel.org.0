Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385463CF8C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 13:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237620AbhGTKoY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 06:44:24 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:6126
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237679AbhGTKoR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 06:44:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXgU4FP36Ise7itPqdk4MtTjhW++56RjUL2LFm16IAxPugtuQ6ASt3Zga1peOKkh7wgPX1ZbC1Euwi1Uc5GtyaCJuiQc8AMJUPThbFNNutGFHXzWZt6tFZDDAD2FEaqyVHk/0aGmJyYwB7dHz/ehD265BkQC2y/VLtjH09H8dU4qxKcu2mvcpaDG9Z9dVrONHWYtVCJQfEio2PpVe/6Hm1p/zwoal5MrIIi7pFhwDDGRIDyCast+kNyZrgQwYR+zE+sbDf4pA2KMaFAjs7I5YDcq2FxtZwKB4NfvNVsYMaSRkPYIl9hj2ENg5p4kbRbXWJZ0xlWXd4I6uCX5TGw6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx40Dk69pWFGkOSn1ni5CCBl6/B2rIM4Uvc5FMigTMk=;
 b=CWwATlyBSSgf5epydwQMNfEntcM98ack886nhvCjI3Hhn48jOdYsOf79gXJP+OuJGNqtU7ZtOFdwjUQYK41zMgB9GT2jh/X81mZ0VXMN+D5Eh8t/tSm38nsKviOff73/QEhCs+ZWOUUouLzM4RAaZo74vMrCegqjwvppGmeBBLPvNXsfPWbEqh9MLWArPTKO1gbuSdpN84GOyntPhDtuPmyi5FRB3+zvFoSw4IarbAoh3yNA6AhWjV3Nv1m1ehUM016IYquMtaW4doCjXmCxP5ytCZuMlpg/+76WWpGy1uYi96m1+199ZVdY9uOYiWeO1Gy4raUvLxyhKEZnxyJ/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx40Dk69pWFGkOSn1ni5CCBl6/B2rIM4Uvc5FMigTMk=;
 b=IpK/TKCMRSZrPt/zdpFsdZ/Wv8ndXWw49GKPsgWd6Ig8VNpcqoyJmiXfBMUXa1gsK00RWVmiBGAiLg9ozjUeCEvF6MlIgpwl2Q0TDYYNhRlte4IukV6lQuM7E5/phCemGxeugZl608vCD7kqbK0rw66/uC3hl57D4afX5uU4+/Y=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5844.jpnprd01.prod.outlook.com (2603:1096:604:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:24:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:24:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Thread-Topic: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Thread-Index: AQHXfKOxNqPJGSUS20elYyjHp4PYRatK3iEAgADbw2A=
Date:   Tue, 20 Jul 2021 11:24:52 +0000
Message-ID: <OS0PR01MB5922BDE7B11A51A980F682AE86E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
 <1626732982.918933.2698559.nullmailer@robh.at.kernel.org>
In-Reply-To: <1626732982.918933.2698559.nullmailer@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a33cd31-e6d7-4996-572a-08d94b70fea0
x-ms-traffictypediagnostic: OS0PR01MB5844:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5844BAAB92D0053DEC99301686E29@OS0PR01MB5844.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJaOm3x0o6lKhisAFe+ONA/M5BFM9lfHNDnxznMYxvQ4rTMyrXBRTnGgefm0W0jnTKq8ZSd81WGxCga6lp7IfgmxaKLt7ZSr0w66qhXECw3UrWojk4GHP5xzB4Du+QlZrT8XtPuYcufT13NFxnn/JgOpuvsTwlmCEvWhMpLuNhIkHzhR6lAlkrtrqkp2j7MLyS6bo912PFLAnJzOBNmVlUUMuYieWdFZoyETVOvvV6nq1G8yc0MpbQto71wFNf6W4dimvU3UiSYo83e3wLPTw97CEzylC3tgiW+l3LJSbeOz1Bx/WEk7wq0GkzOLtUSLICLQ9a8z2vyAJpQUnjlbMoOy+yp0vjz7o8+vJU6Hxg2nltcsWzA7zjV5eAjBrkMaII+9BRarQBKO010RXhnlE94XQTc5bjd+SOCZgW6NPqq/HYRDvV8eYuKFxff2GPcsOMCRY74ey4VjrNy1DUzldQkMXoCdK3ODAuA2G+X8+ijTC74e4QYmdSvxe4/mGLDkhiRuKU5cu/nsNWwbxP5AxjqmzMCMbe3PuQ8laEA6g4JrV5yX9bG7VxOO6J/hyGlYSZs+SF/019vhGd98t3ishHOxKXysBiaNwQiUkk5R91fiTkY31jE2AsjWdwX6rFwFAyvpu0ZNR/L8FSuoWUqNfps6R8r3U46vzmqpQhfVoBwS3DR7CBS0J2LOguruGHW31mexXNBf9z9L2+TWbvJAWCbhVKAXRNAIfWtGIWgPvNaVBiwj9w73LLvOKju7BtkTrCXryW5WjJITOC6q30uNqvb0wygwHEctw+rUPyW5Bi0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(45080400002)(9686003)(966005)(26005)(33656002)(2906002)(316002)(508600001)(8936002)(55016002)(86362001)(186003)(83380400001)(8676002)(53546011)(6506007)(76116006)(54906003)(6916009)(5660300002)(52536014)(66446008)(64756008)(7696005)(122000001)(66476007)(66946007)(66556008)(4326008)(38100700002)(71200400001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1abHQ303W4KAJX5WP/vIC/4VvmVZ466RxukHgwfB5TyFZmuA4fUcwes0HMya?=
 =?us-ascii?Q?gmJMaT+sKi7dj51sTOtxbuGohQP0hsHc5hEBVvn05K8bECb2eq4CWFusxSLi?=
 =?us-ascii?Q?kUnxlZvFcPqgYkKV1BDIO8tIQq7nqBKKqnL/bLHMy2SWFW0csQRlHNa9M1NO?=
 =?us-ascii?Q?Im3LJKTe+wAfxq8gs3y94+QZapg7oT3Fmn3U8Bm11ddhi99LD9lN2+EcZwP5?=
 =?us-ascii?Q?amvLWs84jzbkyoFhiaxfEJmsC9F8oOmmhDBS/CXBTgFtcgF4CaQXsVhyd8cB?=
 =?us-ascii?Q?apnCNbgB0Ma0FfhjHtwOvmKEZbGqidM5CP+4R6Yv/flgwTV8ki18xJ0NLwXA?=
 =?us-ascii?Q?/EOMfQx+N0+2RvE+Qd3POVRdMiWPSeWWr8iJ8zENcqi9TqUlsqcXL5yeI+ke?=
 =?us-ascii?Q?stiAX5uC68iCknEuvFoHZ9Q4IZbG+SxR+B76cxb+iSPvZXevpORMupjPRT8E?=
 =?us-ascii?Q?9XyyrIkA72vDxdaA2s+aH7/ByiXRcPfRNnWWs7h4SzfoZugSLZzO3yIvByPZ?=
 =?us-ascii?Q?j6wBIBMYHqRHNPUj0vxe8ZIp6C7kDxD9+Qtjaar/dI3HevKl57VuXhTgsyuL?=
 =?us-ascii?Q?f3SDCp0/jowfLvkrXd67ek8Aw0CfTmQmZa4aoOxHZWArYcGATPHwa3a4pudS?=
 =?us-ascii?Q?9pcpkArxKdo5e+gYIVARxnGRWTfPS+RLkC4m4K+YutCfduMmFpFOhpjXfhlx?=
 =?us-ascii?Q?hv27FtZuIS3PNn5I4jwIWj+kjm5lakP2qUZsggoU9LHqR3gEO+IgGpS8PkZy?=
 =?us-ascii?Q?zio76qVBSl/fphVav3dsP2JRnL8ry3YRKAinpKjSwwSHKL9qO+UftkhYUI9m?=
 =?us-ascii?Q?4rZsFDywpT34DtjhNKr2y0HTk+S20W1VlRea5GT1h14O8G0ICjV4B91+NJfj?=
 =?us-ascii?Q?eqmPZ+xvWehQqZPQ+wo6juPi4uaLxr9Gfe+NS+wNgISGqs8RJu09mFne0HHk?=
 =?us-ascii?Q?m46B3oDFN61e+omW7Ozo/5SzQuzmpKQblo+pz1KSWzOULprtJZKOw9Yf7WNP?=
 =?us-ascii?Q?/yMUQUsQVA4rybahZ4uETL8nEC4bO5iI76LR+McZF/EST+KioEmd23ZJ0RcP?=
 =?us-ascii?Q?virl2GlrSYDX7E9+UQMzeAOXWeC7LFQUbKLONuR94K+iUVROWoGTi32qTHrM?=
 =?us-ascii?Q?iMagQU5WdB2S/panpTWUkfqAAMIcG6qakKkjrgshDRq8HwGfv12MV092ih5n?=
 =?us-ascii?Q?UxSsJQ06hwFBLYtNhVQx+DYJ1zyuTq1p7xQ3ilkfYWTNhsw2MY6LJ0k9b+ze?=
 =?us-ascii?Q?mjr7RfJyZaTKwDNG7duiryyiPBWWnEz29DR8dGUdg+SHGAsuArJDFZ16Og5f?=
 =?us-ascii?Q?6iEUcN4J50L2JCcQmiGxc6VL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a33cd31-e6d7-4996-572a-08d94b70fea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 11:24:52.8045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9tyCv4OrHRHLg8dbNnEvcaEkJW6fonycadw1JUsB6x806IXbH3QzzJ9jYxaGNrGsQG2hUkbfZEhTMKyV0OLFPBieWDo9XEb/o20jrjXw1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5844
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

The dependency patch for the below bot error is present on 5.14-rc2 but not=
 on 5.14-rc1.

Regards,
Biju

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 19 July 2021 23:16
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> devicetree@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>; Prabhakar
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com>; Chris Brandt
> <Chris.Brandt@renesas.com>; alsa-devel@alsa-project.org; linux-renesas-
> soc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>; Rob
> Herring <robh+dt@kernel.org>
> Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
>=20
> On Mon, 19 Jul 2021 14:40:33 +0100, Biju Das wrote:
> > Document RZ/G2L ASoC serial sound interface bindings.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Rebased to latest mainline rc branch.
> > ---
> >  .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/renesas,rz-
> ssi.example.dts:31.34-35 syntax error FATAL ERROR: Unable to parse input
> tree
> make[1]: *** [scripts/Makefile.lib:380:
> Documentation/devicetree/bindings/sound/renesas,rz-ssi.example.dt.yaml]
> Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1418: dt_binding_check] Error 2 \ndoc reference error=
s
> (make refcheckdocs):
>=20
> See
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fpatch%2F1507078&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.rene=
sas
> .com%7C6f79c990c61146a9789c08d94b02da61%7C53d82571da1947e49cb4625a166a4a2=
a
> %7C0%7C0%7C637623297898953993%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
i
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcWgOhVR=
wpt
> e4WzvogZDDv1jq%2FfD3GZyJ4XuBafYI3R8%3D&amp;reserved=3D0
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

