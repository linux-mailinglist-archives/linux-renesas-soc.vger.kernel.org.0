Return-Path: <linux-renesas-soc+bounces-581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAC8023F0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 13:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64E4DB209C0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFEBDF51;
	Sun,  3 Dec 2023 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SoPU3wdS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CB0FC;
	Sun,  3 Dec 2023 04:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsOOHtzCblk/9etivzyR79o8FwOFvsenfGnUwJN32ZJsD/NsIkc9QTzmBm6bbXu4Q52luv/pxwqwKkmb0EgTmuIXm6qTtjCIzNvERlgBULNgVBh1n9SQphFcBsSka+k1ZJ4juZjyA2fQlQwL5Iu/PCgos3Q4H5YxNpfiEQqggIbhDyLmLYaeJCrsb0AlhBVGiO03hFhf6NzD9WlE90g9MwG99Pe8Y14TAg9sIAsKcHLGcnPXevbhCg7CYnjo/ijhbxX3mjaQxDiE2rC7iH5IlkoT+ZvkMXeRv11zeZZMgL/VGdFlnhtRZ/lr1E/yyz255VfwXdiLFJLfVeuKz7WjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1krH4DsDC4a+CS581Go3GY3f529jBN6fEr6Ni1ex0Q=;
 b=UQqYyMdZ+fnL7UDmR52vEKU1ZgkMIugq/Io9KmUAY9hqgwu4N4QPe457zwa71W7g45ShlQKkRyMwGJJghrxVO6JFM/D5KtpuUsa7crg9Mx6CWwDYKH4Bjk6AtLVU9Y3UcWQ+UsL17CbZGoaGOv7EU1ffR7E0D7M+nO3K+5aF//9oxrjrfJ+YbRS/hyEqo/isD+aqF19Yh63Iua29rDznSJyqGKy8AcJilz+sTrrIIwVAPZdzLBKw8aK/ZvMsbVTF3Pel3YCCfGfdcNtgpyirRABf8vG0w3LR6v5APK22b8H5CKAutGIJesSHXlArte8YRS4uuMPtv1gUirS/vit7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1krH4DsDC4a+CS581Go3GY3f529jBN6fEr6Ni1ex0Q=;
 b=SoPU3wdSOH1tQr1CHVpfLMVIywN3trd+np/W3QT1zAVB+t8zOreSwrQgUF3bRlCvn4irQt1UKtf+kn3IYJi0jy2czPgsye/eBW3hXC0mX7I8EQAXQMRv1VDw0TZNE+G+7Ua+1BR5K4FhnUkLdpJOAZtG9hEyhj7vtQprKVTueP8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB6280.jpnprd01.prod.outlook.com
 (2603:1096:604:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 12:56:22 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 12:56:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
 description
Thread-Topic: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
 description
Thread-Index: AQHaJVV1j9EwvOOFn0iYN0xeL8oGL7CXcIWAgAAUh7A=
Date: Sun, 3 Dec 2023 12:56:22 +0000
Message-ID:
 <TYCPR01MB11269ACE25217769333DFA0EC8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-9-biju.das.jz@bp.renesas.com>
 <20231203-unblock-xerox-cdc5dd68230b@spud>
In-Reply-To: <20231203-unblock-xerox-cdc5dd68230b@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB6280:EE_
x-ms-office365-filtering-correlation-id: e23281a2-89dd-4097-2470-08dbf3ff406f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oI0VP2fCimw6k0zE2PiQS2JrlbwjbZA3eCroJKBidJfLA/hq2AwR21CLf5OK+74LtYrVyf/ej6yERQlQ0IwZQZxgRaagl0QveMu2s1crsCzL/1DkHdo6cBI0ou33jZYA2tgdgjfdBSa0YZtOcbj1cQU3sosIsVeKmoC6LylJEKo7j4EQxZZpGeEWYWN66idcYkMR4xOAStQHRqSLz30XltMHOs2xccRQtEs/Y4QnVAtmRywKXf2JFz7jcjFiJC+j+g/GDLensJheSFACsl9vFJdP9851HHwQq8bp8q1yYFKANwXC5AGFHrYwfKSTheil4CEddXJWGislOEC79lQYyIKdpM3gtqfooDTJis0vvvaxd8nOxg10RrHfZApxMcv9Zzeatb3X2/fXBzkBIkdo+VfFkqVZyaMmSCoiQl8HePxkLoMqK6y+yktHMpCx+5uAFhSxUlKHcr0xi4Pysuxp1iEcQ+M4qtyeb0MhJFmsnEX08Re7Gy/lmmpR9Bp/9EtBO55LVm0Zgpj6WqtprCnIdi/d01VvVU6T3GNc4gW3ELeZ9tZKikOJkrTy1Qd3zG22K1nVqq3NEFPDbmJnWIJblaLu53eMMAe7JNb2ogjqXFTWjd0//5EebJjpbZqRQBBW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(33656002)(38100700002)(55016003)(122000001)(38070700009)(52536014)(2906002)(83380400001)(15650500001)(5660300002)(7416002)(26005)(53546011)(6506007)(7696005)(9686003)(478600001)(71200400001)(86362001)(4326008)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(316002)(6916009)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A8Slxc7aH0akcM1Whb/BQ+5HRSn4LZ4h0hX+LByaBHcKJX85Di5nhB+5y2Rf?=
 =?us-ascii?Q?vRemfu64bosqdeXa7wkXYzl3yczFUeoWHSexsafamWm/Omues+er1lIlOdWf?=
 =?us-ascii?Q?OjQHD2Qafpk/lVa59OI5Wm+kCVrLznFUKQbhBY3ON9GiblJnkSTFr+5YcK4/?=
 =?us-ascii?Q?DQdhaH21NNyt0OJ/pF07MfA9OChOUJfmCb8GcDtCZUBBuHIBxqS6VFtzbFAD?=
 =?us-ascii?Q?cOdiWTgye5L3pkXXTzHC9qV/vCaYWmi02GwBFZD/+m7Jq11T0yBaIzC8yMYk?=
 =?us-ascii?Q?Zr9QzRkIh6k1qiY6icIZQV1JKsaWgD4wWJH9uK0z0CyVoior4vj7ldROFGoi?=
 =?us-ascii?Q?ozpFCOixQDgW2XYp7H8RSJIttzXLNhn/4bz8l45Ik82XdJrDN2pqRXZhQpXx?=
 =?us-ascii?Q?1SMwzEmeAxaCZeNf/1ZymkV6dW3MnuUl360giFHtto+CPBSo8oAvzxUevLRG?=
 =?us-ascii?Q?ltNCEpnK3uKEnk+lidwWZSoM5xwEbZTd/27Qo775BtsYJOLasZw9g2ox+GjX?=
 =?us-ascii?Q?z/kw17lpl/LgEBrGeKu/p1eKkIGPGBUYjD69LoYjQMToU4d2PxDJWmXIgUNQ?=
 =?us-ascii?Q?cwpT89QMmJmz2PCOq0HQrhtVZsz33JLt1HEUBv8xkJBZFvfgDOaL4Nqpcjfq?=
 =?us-ascii?Q?kkG/KzpUVXKpK4qaf6u5RyRB1Y0osxyfX+ckzqbA5a4cwwCM21VZrlnc9N1Z?=
 =?us-ascii?Q?gINnDxQLOKrfxZQVBGEPPZT2KlObjB+jY0boWDcg3KQNMzSICvo2n9DZjjlH?=
 =?us-ascii?Q?jKIv04ZGH3C4e1b4b1ps4lrXaFRsBPehaYvF3YMf3MGW4OtPx8IBGjm6Gfa5?=
 =?us-ascii?Q?zIVrHECfqrtUj1OcJRQYUW+EPzRcUlRHKKIlst4V8LZgyBC32NbUkdBkvCQn?=
 =?us-ascii?Q?9mZ4PzBgW0NqIh70GQpL3+o/YifuP9RRDCrGyBhVnRjCDo5zzKbh/o4hVHAG?=
 =?us-ascii?Q?me7aaY/bcT0TJbxeFceV1AQbZnHpyV6sptyCSu7sUJrAqNUDFM1iCR8M1Nbf?=
 =?us-ascii?Q?wfO4MCZprfdN5LhbnxQU8lezyKaO19Md94aaheCA7igbo2db81GYK35A0oRT?=
 =?us-ascii?Q?zQwkaQp/S1awiaIzfOxwl1Jz1c+pvHFOmhugCfNN88ZUHdw271VSyIFIDX8h?=
 =?us-ascii?Q?msmRtbbu3dmgb6SGoTonfZe7bKQtRL6HvMR90orQ7bKZw/Qmjq5Fte1itWnO?=
 =?us-ascii?Q?vGKPY6rzWpzQ0bFwUOqJs38LoXjGxLZW8ovKTJdlsQRPPYBHhQKacLkHXPiC?=
 =?us-ascii?Q?2aXwFGaBOGxDRoysyyELKa1FQ1obi8UO6DRJlQB9pZoHQxFwep4kcuB9KOyQ?=
 =?us-ascii?Q?PkKBdeF4OYpx8ZD0n1FO5w1xFppusY/wEen5n3irb5TRtjZZCGe6tx3PVq0z?=
 =?us-ascii?Q?U2GyMfYFwDfPDEwcpqrb3zdEa90RMiW1CF9PqxB3RH3vPs3/I2mREEB9bavY?=
 =?us-ascii?Q?eYVgcDs9rfim+FwEO9DOXFvWsCjK0er8T9NvmYk8IQYqoHx91/y5dePjkRZX?=
 =?us-ascii?Q?yd4myhFGOsGceJ7bYVVPtbRpREhoZS8kK7E++gGxW35G8PJ7K2wEJKFDDF94?=
 =?us-ascii?Q?cxXyE2IZbGL4ABTOuim2+tlYqgLxpNOKJUcCOkoNEBtdueaTtZQV9ovFb5TD?=
 =?us-ascii?Q?Bg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e23281a2-89dd-4097-2470-08dbf3ff406f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 12:56:22.6207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uz/BNttQU/v+WfsTEbhg7VCBryn/O9Sqv9vLb/vDnC39RSDoRjKAgJyskf3H3kXpStBJb3ANBioV6YX7xL1Kk6mFJAEM53BXJ/XzaRfcEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6280


Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Sunday, December 3, 2023 11:41 AM
> Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
> description
>=20
> On Sat, Dec 02, 2023 at 07:25:32PM +0000, Biju Das wrote:
> > Update watchdog description by referring to dlg,da9062-watchdog
> > binding file.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > index e4eedd3bd233..020106322b08 100644
> > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > @@ -86,7 +86,7 @@ Sub-nodes:
> >
> >  - onkey : See ../input/da9062-onkey.txt
> >
> > -- watchdog: See ../watchdog/da9062-wdt.txt
> > +- watchdog: See ../watchdog/da9062-watchdog.yaml
>=20
> Should this not be squashed with the conversion of that binding?

Yes I can squash these patches.

I am not sure how this is going to applied as it involves
Mfd and watchdog changes, who is going to apply this patch?

Cheers,
Biju


>=20
> >
> >  - thermal : See ../thermal/da9062-thermal.txt
> >
> > --
> > 2.39.2
> >

