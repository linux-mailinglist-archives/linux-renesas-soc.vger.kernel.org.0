Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F013B26A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 07:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhFXFKl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 01:10:41 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:65455
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229508AbhFXFKk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 01:10:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6OcXM13ZozCN0Vw/x5dPpZyXkEhTgy0y8t9X9wq7WEhbOYzDK3n8klQWq9wOCsugWkZUc4SgAA8RtsPXfOzwJuU7bnJEQvZv6JmqCtnVGX11snkICil47T1QYDOTwg/5ttBMXwryqC/M9HLODaGvrLcPLfL27W1fOaoeuhTbVSzPWtnF1Ub8jlFBZnKe/my5m0yAtKsKrf6IgVs76Y7d90tjU6Fc4kJ2QaFK29s/l6/hN2kSQ/dUXyJ9ltwfC4firkETDuU/U6cMhSOPqj0LMKFfZbFp3Ci+88cbioBydVwkC8aiBoL6Ap5hJqv0q6oelYLZHgfb/10Ye1uAChSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwyOfrszhtohzvPvoXyyZmanDrDbNXJHZlzalMgcyts=;
 b=McgZVmAzKr3HyniAOP/ykoTJizmeMhCF4Pmpe+t9omCPb+e3ZjixX3E4uNvgPe5ddLvizfqhqEyfNcwzhIGJZlDNB4kwof0/pcrLNmmR0rWiVAN1aFUW1gxuXJwwUx8AjZAf/olv7HjkB4MbFcPi86nwJe9Qyg3Sn/nQN6JlhtaL/0YMmX1yvU7J9xqkaNBssAaHljpyihVAFGSKwsmUq5WIxgdhvWJ8ay3pq2MzXv+TzlDoxxiJhz18qSdBeCnMzgFY8GzSx+5fVoSia0/j+4aU62zQTT7z7w+Rza49yRVGhm+Nx+wOVcnzLwmkh1efjNUmnSx3OeJYXpExWurj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwyOfrszhtohzvPvoXyyZmanDrDbNXJHZlzalMgcyts=;
 b=MdackwmilXfc+ranqiYjMsNTWI2PnfakrDyvNyixzPRDNYXPAGo47Ec1BErlsnOziwCAhwsShx7RsJ07lt07CK3WuRpOL6vfkc69doaCxw7FYBxEcE73GispQlcXcDhpzgKahCFTLbZU/UCGtM2rT+hVmHwJkd3PBEIegs8XhZU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6431.jpnprd01.prod.outlook.com (2603:1096:400:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 05:08:19 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 05:08:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 06/14] arm64: dts: renesas: Add Renesas R8A779M3 SoC
 support
Thread-Topic: [PATCH 06/14] arm64: dts: renesas: Add Renesas R8A779M3 SoC
 support
Thread-Index: AQHXXdxGfoZyBScRM0KzPnWwpz3P2asisgIA
Date:   Thu, 24 Jun 2021 05:08:19 +0000
Message-ID: <TY2PR01MB369260ADD6B6D5AA07365849D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <2d20f62935bd675f97da2b028b328779c952c94e.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <2d20f62935bd675f97da2b028b328779c952c94e.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4cbf1e8-c05a-4564-d07f-08d936ce154e
x-ms-traffictypediagnostic: TYCPR01MB6431:
x-microsoft-antispam-prvs: <TYCPR01MB6431035B77A2CE91F3D14CCAD8079@TYCPR01MB6431.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /sFKj6hTqZoHQI4Vkx14PDr9gEUBn5FGCthSIpmuIi5cCKFUPG0Z4zuot/vta9XCsHrmRfEhcPt0n50zdOBxQmxpau5zSHmtbYBGALjOGbNqlaftJCsXbp5GDX/YkbFqM0z5fR6IFgxnPRxuBEcpChZeqRA/qZm4FKozCo6imdtbDomTyJxjGUVHYNEM0IU0UUCniyj//FcvzJEKnjP9pOoJeM0D6OzWhNKidHuRqoNTw7h32H9HgVAC/8AoREcvTIeNwFAc9wAYcqpKln44d/L43qS7EkfpDAHSOPSjNoNffWspTNW9LSyhF7hdb7Scyq9ozXYuceHfL1mJZt74M1i0qkYkhWkE3r7Cyi4rYaIEcbe3uz/s/XN+/hJ8CzNm0XO+2B2/cdbysGPN5xv3VYnMm884KNn26LOaDq6GakWcuyNaQT/JyvCDRQfYC6ODhVnTbYIXH2htogtcruwGpFh3bm3tgndA/FDnGWBtypgER8OyXvC4reIZchF8rWSLTOmNUBUDUeNhKKdJu8kw5Fzs/kh2uy6gq6P8p0YLmLpC0T9JPKpLy8F+oj7i4t0Q1EsO290N6GS4ClsUhIs5hFAc8wbtpWGCeaeXIio2SrKLG/cRI+msC4yxOwh3b6uGeDUhrZ+Et6RH8v6JBwZoFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(38100700002)(64756008)(4326008)(122000001)(76116006)(66446008)(66556008)(66476007)(2906002)(478600001)(66946007)(71200400001)(8676002)(55016002)(9686003)(86362001)(6506007)(55236004)(8936002)(52536014)(316002)(33656002)(110136005)(54906003)(7696005)(26005)(5660300002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6FfYehrvI2zxcxTmkvLA9u5CgI3ZdHxkFw4CVoiiE2MnMT7MmZ/MxHDwRtms?=
 =?us-ascii?Q?0pyiDrIRsbMFdY/WU+TytSFQf8DvBarKtEwuCpIhkAvUvMgwVmU+q8vdlo5q?=
 =?us-ascii?Q?jMSURkhWCa8ae21LiPy6uU8BOlIbBJOO3bGy9wCuCyYXppugnhtJxJ+6Dcs7?=
 =?us-ascii?Q?MZ9FGhXY5LdCTUGj7wMxVMWBvXeR+vubNR2VVyJo0mfBT8UBJfmwigQf2NYv?=
 =?us-ascii?Q?7PDt14T4DwmSgVi5MbCBaUWEK1kbNlC1rBX6yVYRJdWpgnzA+1PE284n8oVh?=
 =?us-ascii?Q?WovCG4HGWMdusAyJ7rmvh0GrWS1arwXoIXNweQNokp1kEqTeRdP+BLpuJITC?=
 =?us-ascii?Q?6ZDu2Pp87AfhM4sSYNGC2r+VMCVn3KYDcE+6zyxPfTThejMot506qmEaTFW6?=
 =?us-ascii?Q?IFbtc/aNPlLxV5+vF5Dg1uE4c/UfzAUfEflqtwtosBPXcqXf4RyTusPxPN0i?=
 =?us-ascii?Q?5UeAUJ6bDxOgX3Rh9XH/C3BNOZiJfkbL0CyfniMhU6Dot0Bz7QZNaUrnsk8r?=
 =?us-ascii?Q?4x3oKJCStYkIG1OWLANldoB6lfTgGevKND3VtYTakWSSlHspI2rZBcfnym6G?=
 =?us-ascii?Q?upJ5+qcnQGZK5xRyFT6tUrGJT0uSpUEFRVbvuyVy4Kxp+AuiKvJ1+j35Iepg?=
 =?us-ascii?Q?P/7829y4YDUlt+TsazdSd8xRjQhfxjyf6+Kl3W7IrlDmNCUgp/Gs4TCBe0rn?=
 =?us-ascii?Q?j/wx8jodogvRWMEaMhVHfsKxe0Z3ZtVsImxOdNow0Rk/Vk7fsYxMlENcTMsR?=
 =?us-ascii?Q?vDLOK2MlvUCuiqJLb038JIOmpWtRy5c0H38Wx5fkuvO3uaqMDvHnBpfk8p4Y?=
 =?us-ascii?Q?0TD9oJImQmPfJP3v4M02McvhrPwmP+LTPiqrf0R0HljI5S+GgkxPIbSeqi4J?=
 =?us-ascii?Q?670AiOkWsc69bigPCr7VZVCCy7WFC6K++U4EH6c54TIES2HQwryEGhSPZd3Y?=
 =?us-ascii?Q?wlz2i3AJ2kVJn7vIwfmjBB8S4Jo6niZghj/B3iecE9dU9Ne9ujDAuqZtIJUA?=
 =?us-ascii?Q?2TsC7a98yFDit1dUk27xWW4qmzPXATZNoMVoxa4TY32bAsnyH7ikuQhV4zry?=
 =?us-ascii?Q?096eXFT9IkbEHtmhOtzFG+pxgZNuQX7ZtZrmkjAbYAK5bSa6MQwKvR4vpcOu?=
 =?us-ascii?Q?tDATg6QPv8R03ybx7j5cA5b2cGfMzzWYnevKtQz85u0usgmmfFS1yxyJ8S+G?=
 =?us-ascii?Q?2WfyYQKARPA04FX9/tDBGVzQEZZrSlRWMz2vkwfaRhNJ3aLCSLYAznC5jqPx?=
 =?us-ascii?Q?/nYcE0ZVQxVYsXZXxVabvDegocyTfMC2e1FJX2AMjemIEi49FvXACc7+ztVE?=
 =?us-ascii?Q?XKEONEYkEUhkWZYxFj6wCbzj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cbf1e8-c05a-4564-d07f-08d936ce154e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:08:19.6976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiYL0PMAo4JMt06Ua0l/SfiyxKilwkQih/gegqJmfwiXPOdd8NwsmV2bgRiDIQ/1LDl/+a+e7HQKeRoskRSheW9HuCNskH/cBI6GFKNB09QdW53l3uDhGSCa9r8YXxVm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6431
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> Add support for the Renesas R-Car M3e-2G (R8A779M3) SoC, which is a
> different grading of the R-Car M3-W+ (R8A77961) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  arch/arm64/boot/dts/renesas/r8a779m3.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779m3.dtsi
> new file mode 100644
> index 0000000000000000..65bb6188ccf5470a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the R-Car M3e-2G (R8A779M3) SoC
> + *
> + * Copyright (C) 2021 Glider bv
> + */
> +
> +#include "r8a77961.dtsi"
> +
> +/ {
> +	compatible =3D "renesas,r8a779m3", "renesas,r8a77961";
> +};
> --
> 2.25.1

