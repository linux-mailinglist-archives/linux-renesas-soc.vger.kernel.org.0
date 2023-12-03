Return-Path: <linux-renesas-soc+bounces-580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8E8023E4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 13:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726CB1F2100F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F47DDC9;
	Sun,  3 Dec 2023 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Dqm/JEsn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBE1FA;
	Sun,  3 Dec 2023 04:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fT4sQDuoeE/Zf4+VY4H/att8CmFUAhFRhKgwUgiJ8LhMpVH2z6ygBmTkN9ZfB5+mq3Tv+Q7iA68Qf8c9oIu4SUfb7Zs1rtLeUme/xyho0VL0eaVLiJZ8zaLli7X49TySvBiEArjW72F5IWq0RRDm1D6RH5Rtso4FNIPWKN4wD0e1kvgMD0yeQ32cMyyWRKUKD+15xQoYd+C06rrOJ+td14/MqaECOwrjqw5R5XAxleWKy2vWi62B4oncyC6SSscGI2Gcwdel4sYdrxzkJ1lIXFY8IBTL/Ul983atEoTnVt0c3a5quOn1nVpjeLO3nVPsL1PEOmFiAPg+15bfZNAFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zm2RwwDyUGsBboVJgOI4S4ifBqKvhX0aPKBM8+PKvkA=;
 b=Wi1gHZjWROJED/BafRkDPlWpQ/79XjnfP2v5S4U6h5lhIr+lgaAJf3CrMBFi3KZfAAutuCSVYtpZM2pojZPeQPnsfSuWv0ZWjwRaQK4ywqtlLRG4xOJQGyiBxbQL9BJlepi1Qi4HzR53ljtNzSpm2BWnlKcnq7Q7UB+UP5kZnNmdqyV487QpyRiKtgJhJKJzWArl+fnE06p0isIxoCympeCN4WWB/LLtjVhebCevpa4FQ+SdAUqX7Wg+XIBBCklDJDmhnbiF43Xmc419QFLp4NTYDlTYrJo4HSZgCEpa1/ZcFBvqoGsbvlaq2dbXDgtyhNLHe2bYgs+O+ILF9+LP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm2RwwDyUGsBboVJgOI4S4ifBqKvhX0aPKBM8+PKvkA=;
 b=Dqm/JEsn+9EUkHti2Kp0GVDN8a0+kIXXdKVMD3qJo/LdXz5AQAw5oC5UyE174uaCHDxNQwbWrZaiiyak2QoEz++1GRFl/a5sXBpMlGn5b0oaFC8/QyXrjDKvH8R47hYy8P1K4c50aHsZ3tvp1tgRxYpzgZrx0DbyzQszMfw2uRQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB6280.jpnprd01.prod.outlook.com
 (2603:1096:604:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 12:53:53 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 12:53:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 05/11] dt-bindings: mfd: dlg,da9063: Update watchdog
 property
Thread-Topic: [PATCH v2 05/11] dt-bindings: mfd: dlg,da9063: Update watchdog
 property
Thread-Index: AQHaJVVsxZ5ewyjFaUuHBHGkTQwaI7CXcBsAgAAUgFA=
Date: Sun, 3 Dec 2023 12:53:53 +0000
Message-ID:
 <TYCPR01MB11269B76E8ADF9E0BCA70FF5E8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-6-biju.das.jz@bp.renesas.com>
 <20231203-pond-thrash-82386f60d283@spud>
In-Reply-To: <20231203-pond-thrash-82386f60d283@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB6280:EE_
x-ms-office365-filtering-correlation-id: 1c94098e-3f9f-4a2e-5348-08dbf3fee76b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ebvx0shlEcR7nXOmSLcRR5a2BPhoZgf3nLwW7LgL2tAoxd3M0RVYD9rXCBamCI5lWgBpu/qKtqBHKe1NR2lrrMTb1s4YoiKmOfLNvsoMWbXBwvxN8QKAnpBARcnA53El5F6MIjz/rasVBEAibV7JA3YnkZIKvswoDqkfTU19LOwFMKMadnzYcSJhQEAhvofO0kGbK1XaF95pJgc2cdnsf4OmJlljsuGU1BkNnjMrcHiAkmdaq1IpN24fCcNwDlM4x1VInsp2cVPtgzREAd3cL6PftHz2JAB2nR81hLvkJSQl9RBRXaq9hbfk1hzTrDvVHTomIBAE2k+MycO8x1rnSd5CJtAW4w1ffRme8/Ol3FNwAnMzVAxRv2xbLfPhuNDK4eZXdi7v63Jmul+pgdczNrWQJBTkOZPKWW2UJH/wBhI5JNlFcApzZkFeuoNJ6tx19eAc5jT4iIIWLjFKy49sg/wenrf5AvQmZdjynLUG93k1CkXaIgFQ0DH+1PNwnGMY4M8F+dDG4dOhML2pOGHEIDQKmvtk4rDlIWp+9Qi5XNKczRZOhTrmK0IxFc/Qr5usoFl9m3BR90HXurm6tWOAzyJwEeTqzSr27CJ4xMhOVVg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(33656002)(38100700002)(55016003)(122000001)(38070700009)(52536014)(2906002)(83380400001)(15650500001)(5660300002)(7416002)(26005)(53546011)(6506007)(7696005)(9686003)(478600001)(966005)(71200400001)(86362001)(4326008)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(316002)(6916009)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jBmLP4Ubo5fyQuil8ha3tbWP+FI53Jm0n3IGoicweppbTeRl9xtMnxEpuKMO?=
 =?us-ascii?Q?1EKUFilLG25D1hEgM32pA21YHr0iTgQrzqW/7cdti2J0FG0PsxbcMD93L1A8?=
 =?us-ascii?Q?1jEnlKlt+YZ89mcvmPD26ArMgpxaK0hCMA7Zz9dTmzFhI5bAYcyvpCk+dpWp?=
 =?us-ascii?Q?AehFu7UILi93YZIJ9aNk1R85tiaPZpmrr910QrG7ds75Kt3liUQ5iQxHbDM2?=
 =?us-ascii?Q?kfU94yfdAz64FTA7ttdtlUtYlUompuuHtS5WB6et+YiJQwJ0xsLb7BAgSxrW?=
 =?us-ascii?Q?Ht1qudjjLNSf9cFU2qcsILkcd9CMfP+nXMpHBvBl9UFBMwDbOAyH+p434L7Z?=
 =?us-ascii?Q?l+sZ/GZ0BNF8hU+YPfqa0yULFQ1TgRbYShjuV9+SK8wGLzdl/BacDQNsEnZn?=
 =?us-ascii?Q?A44DTaIzeW0+AtVgsLpzLJhYyMFBxdrats+7pSEnwA0OjCwKGo7QJ1BPMwlU?=
 =?us-ascii?Q?iwV4FxvS74jXDeph2Dlr57yImRGM6kkRclRAWhbqYUThqN4++rot1e3QVr/T?=
 =?us-ascii?Q?g3MhruE4zs5hRyry67mNfew07qZQP5dch5ZGals0d3i0fxn9ci9b99E+VRyI?=
 =?us-ascii?Q?vpckJwo/Cfsl9eVv9F4a0jKRQfv+T2dhRdWapcv6Ul/ZJp1ZJIbh64eqcQKy?=
 =?us-ascii?Q?BJ3aQXQgcm84K/u7MuAZk0sBXX03yxu2VqQBsHkjnbWemMWteA775aicl5Sz?=
 =?us-ascii?Q?EWR9aZzM0dWn2CnjQ/BRnd6837ol8GKwYPQiDxLEqFpYIv6xT6td43sKs9SW?=
 =?us-ascii?Q?FQMH3CAIaVuXkdfrisHdd4FQCetDAo6i14HvLiqwkI7EY/u3T1wtVhGjAnM3?=
 =?us-ascii?Q?53lz3YFygMeyGbnEcnLl/VqH7f4klXQqNiAOO75WmRmhEnROs9szkbUyIqeu?=
 =?us-ascii?Q?tsfDRFjfNTYpIvvrg4xJUjp+AUPrP0c92rE5OrCZ3Ub62eTJPNlwsDFK9Kkq?=
 =?us-ascii?Q?7x/CRGOI6iLDHFST+1ooqv0CzpjDW0g2jHYSHOnJxCMn2APw9Z9CDdeytegr?=
 =?us-ascii?Q?bBG3oLN9RR5b1Gg/mVYMm9pQKH1IFKwhvficvvhM1hWuczjfkMdcjML4RS5P?=
 =?us-ascii?Q?OJ1xvWEhevRiQCmPAp5Kd6yk1L8Xk8CZZ4/PdfGxxu5cb4xE2U/Qwsv+wZQS?=
 =?us-ascii?Q?0GT2e47+mHYqy/DIOdPP3zBIXUQlhLVbXr6oCI+8xjPKYYrptu07SHaLzl2Y?=
 =?us-ascii?Q?3szOP+yJrlDysnmcoDoyhFCyCHG+CPiZnxYDxZy9d9Mrv9OZPB9SjVJjy4KS?=
 =?us-ascii?Q?77ch0RCRRc2ttwApTnkIsRh0BzZu/Qsp65YmfHQSNU0cTIcBR+B5s99SRDaI?=
 =?us-ascii?Q?a2Gm7a2Wtd+AQk0bwYS5wItHdE8icSdNHCILufF4YJPtJ9mW4JDyCBdQXg/Z?=
 =?us-ascii?Q?7fh3d8RS6AHXvMhWmDz0NkBZ1jpzebCt1mJILwIJO4fRoL4QgkAdA2RkRYRu?=
 =?us-ascii?Q?D3P1jxlJ42KVFXgfvyAw1MlrGMNHQPa2bqTSEhmDJGc7KWKhfTZT9bAPpRTk?=
 =?us-ascii?Q?amXH1Z6Q9Nvmdf0/V4TX3OKUTo6MZL26AuwtSZo0CaW8JPp8Ec7Za0QLpJEj?=
 =?us-ascii?Q?rocinjFDMjDp6CZISxR26u8orK4sp8QbRmuCtfx7wVxoF4EJH7RQRh2/ovCC?=
 =?us-ascii?Q?Pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c94098e-3f9f-4a2e-5348-08dbf3fee76b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 12:53:53.2451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hK16KrGbAG+fofufSbFXegYsLRgi5p2G32oe7GE0FgPgIyfvSiVvp9NlNtmvOiIAbSyMAysAB09BZUUhRDurlC7ukmnH9dWNi5bYuDjbsYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6280

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Sunday, December 3, 2023 11:40 AM
> Subject: Re: [PATCH v2 05/11] dt-bindings: mfd: dlg,da9063: Update
> watchdog property
>=20
> On Sat, Dec 02, 2023 at 07:25:29PM +0000, Biju Das wrote:
> > Update watchdog property by referring to dlg,da9062-watchdog binding
> > file and drop its definition from this file.
> >
>=20
> > While at, update description with link to product information.
>=20
> This is unrelated IMO.

OK will move this to patch#11.

Cheers,
Biju

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/mfd/dlg,da9063.yaml   | 21 ++++++-------------
> >  1 file changed, 6 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > index c5a7e10d7d80..1bdfb2be2e17 100644
> > --- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > @@ -17,6 +17,9 @@ description: |
> >    moment where all voltage monitors are disabled. Next, as da9063 only
> supports
> >    UV *and* OV monitoring, both must be set to the same severity and
> value
> >    (0: disable, 1: enable).
> > +  Product information for the DA906{3L,3} devices can be found here:
> > +  - https://www.dialog-semiconductor.com/products/da9063l
> > +  - https://www.dialog-semiconductor.com/products/da9063
> >
> >  properties:
> >    compatible:
> > @@ -35,21 +38,6 @@ properties:
> >    "#interrupt-cells":
> >      const: 2
> >
> > -  dlg,use-sw-pm:
> > -    type: boolean
> > -    description:
> > -      Disable the watchdog during suspend.
> > -      Only use this option if you can't use the watchdog automatic
> suspend
> > -      function during a suspend (see register CONTROL_B).
> > -
> > -  watchdog:
> > -    type: object
> > -    $ref: /schemas/watchdog/watchdog.yaml#
> > -    unevaluatedProperties: false
> > -    properties:
> > -      compatible:
> > -        const: dlg,da9063-watchdog
> > -
> >    rtc:
> >      type: object
> >      $ref: /schemas/rtc/rtc.yaml#
> > @@ -82,6 +70,9 @@ properties:
> >          $ref: /schemas/regulator/regulator.yaml
> >          unevaluatedProperties: false
> >
> > +  watchdog:
> > +    $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.39.2
> >

