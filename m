Return-Path: <linux-renesas-soc+bounces-643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246380392F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 16:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F9E280DAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 15:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53472CCB0;
	Mon,  4 Dec 2023 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hlIqo3CR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6822D2;
	Mon,  4 Dec 2023 07:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWNkFk738Gf+jOgWIRzM1ILXv8Erc9WgwUd+tQAic55Ucd96ruZczftHeSohEfG1hzd+DjjMABlAfeazygZ8V7RaFlpCjhQDjvelwpF0U8VfW4JwbXotiFx8MDWZFrOdK0GoBonwaC0779hoi4pJvxhFgG7Yr4PJKsfoDj1rrVux+V8Z60I/dFlmHNPG7SjV23ANUk41pK3/vwVk/8+ufnyrW3sjCGcl3Kq1SiLwWT4Ztu8wUCEhmn6dfftTImwfIAObiDiXQaaNdMvJ65Ico47NF/IJi7M49/Ki3qscDi3+PTZlyyKbNYACnXzm1+fXqdMyvS5Hl7bOjS0eQ7LRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeiVLa4jZ6o1jjq5gljOwyfXRHwuJciefKftrp/puEE=;
 b=SeYQVBQASGNTMop1LJhZDczLNMECCdZAJAMeZfmX4zJ42zVZ0w7RRYpQWAnZy2Luj0bPfd3JW1KrC+6yFGdkI9JcegQ4wVMx76aCnhTLY/GE7Upv3PJxGE846C807zygWs7xT7e92UbJ2Wi1hKgny0oBBGqlpVAccSaQ7JriM92YYGaCBNfXuGyV8PQbY47E0TTHmas9kWXAylrjbiM7ZW5iowEjtpnFjqgLjZtONgKSa92XAJ/4sGiBIEEWD6sO6RDb7H/tQ4LKIBWMtEDevpcRrhcag/7beUBb7tXLPUJuzW4vUg+4cePDskEsrPW7aoS1DdBR2KyB2LB22LQqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeiVLa4jZ6o1jjq5gljOwyfXRHwuJciefKftrp/puEE=;
 b=hlIqo3CR1viTXwb4BHtKomk9k2evxUqv54Fqilg4QxoakwdCUm6aLb8N84dS6fwpXKdXTJyvwGy3qTQ70vfgBbR+zTY+K943mhuJtT70g3UiMHsZDLiyosYY+cil6ykE/QQT+R1MsMx6ezsn1PPos+UYb8zaYpmk1hFUpwsySDw=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB6144.jpnprd01.prod.outlook.com
 (2603:1096:400:4c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 15:50:42 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 15:50:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof
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
Thread-Index: AQHaJVV1j9EwvOOFn0iYN0xeL8oGL7CXcIWAgAAUh7CAAbm/AIAACZMA
Date: Mon, 4 Dec 2023 15:50:41 +0000
Message-ID:
 <TYCPR01MB112694D03F303BD79F0B3DD838686A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-9-biju.das.jz@bp.renesas.com>
 <20231203-unblock-xerox-cdc5dd68230b@spud>
 <TYCPR01MB11269ACE25217769333DFA0EC8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20231204151536.GC1260709-robh@kernel.org>
In-Reply-To: <20231204151536.GC1260709-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB6144:EE_
x-ms-office365-filtering-correlation-id: 593594a6-7d40-4200-4be8-08dbf4e0c51b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5JLVdWw7ritmuYI8hp/3es+HVS/tXaOwMLdgC1BbiXjnsqivIC+/iIm959mJOXy9aZbTqdesEsMjZj24w5BZbuO43+Pjsm0WAp92X7Ggu0pnpWen09o3JyujTETpGfWsswLwFuqk0XRJugC/HF71Uv9h/jdyL8CVC8/VwWTtGs1LHwbH8r11Pxlh/njbC8V/5m2s5jtx8SKdJIylrZHOV8ZgCNJ4uChXnyXZqfXtW1/E8iu+cXuVwxcVB7yO6gpgK8mU+g0dLBpuCrJG9YhMGSRnZdhiQeUn52yKVbweNeg0g92t6X9md3bPk4MQ5aLsRmXvvjyJ6sPhFL7TNbC2iaSU6V5uoKwOYmY//oQZbyZcMahTfn6X5hs8CE1OvuN3VKXwVKJNHvNmAo1+jPmJv1vtR7DWeg/d73fROHwFgL3msXN34LLLNDf2M2kTe07SK02cnxAcY4v++PTfjYiXxXzQSZiCocr4gmRBMthCTy9aKhwNfJfafDiOsKfz7oAZ+3OvPRYI5uJOok44lJ9VV7aFn4ZIpBe4lfbMWtxcIzGeDNf4xYZkQCJCZXdao2L66oT6eTC7zRBk5YjamSm7RuuPFKWPV5BbPw+sI2dFBp/ulkK2BEUTEp4EiIC+BEyp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(52536014)(5660300002)(7416002)(2906002)(15650500001)(38070700009)(33656002)(86362001)(41300700001)(6506007)(7696005)(71200400001)(9686003)(53546011)(478600001)(55016003)(38100700002)(83380400001)(26005)(66446008)(76116006)(66946007)(66556008)(316002)(66476007)(6916009)(54906003)(64756008)(4326008)(8676002)(8936002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5YlFBfMkHPZF+PqopPxQdJc6DpDl8sPYHTJoG6iSLxTKwMl2Ax4MwED+2/hE?=
 =?us-ascii?Q?NhOK7Z7hMOt6gTVJlpcujBigAQ57iwR0x8djemdl9Hvf7MknhUstDTRyLMAU?=
 =?us-ascii?Q?LOCUb+uAoxCt6hUr0X/qrR9i90ECSW2PTdC7pUc8v2rz9gAyhcN3JwyBMZGU?=
 =?us-ascii?Q?NtjQU4TX3MPyPARYwzx4ILlTJ5hi9L6ZDWGg9nqLavHsZDYg9Mujzley5kY4?=
 =?us-ascii?Q?xGDSsUSaTOdqBxqDJZXiq0BjxVfn8seGpcyuFNZ5gfhJJY31sPYNeinN6HRc?=
 =?us-ascii?Q?smF0sj/jI0/1Yp2EJNJA0U0ChlAHCw4rSnY5IWBE6IUqJR6Fjk3+MuptgSh1?=
 =?us-ascii?Q?yS7iMNUJgz7chhzjEdwWVq0/4X0H5vc4pSMLEHUDhqOxSQcKJEr/LwtQYqk5?=
 =?us-ascii?Q?r/mT+qJvd7T9kMq/INIW8r4ieacx+EDfAGChVEMNFCqGA3Ecr1XpSxFfLoYX?=
 =?us-ascii?Q?mE9q50jbCc0WzgIUC3Z2F4gtlkQ2/c5ROqq93i1/IRiPSNxVL2sukBNP9Rkc?=
 =?us-ascii?Q?f48lD+jPtTUzR2kZWDKlojvuG3wjnhV8cgFgpgWlA3LIfCQeJBxKCN7SdQj5?=
 =?us-ascii?Q?2MDeTR4XZVo8gOGK49ap/MwnyEzS7qqHL1JhI4rcbYmNKUGNAVIzEl0o5Vz+?=
 =?us-ascii?Q?TKMHwN3YtmMpGDU7sb55uxSyLUVVHTw5MmXgA5Rc4ZGW94CYJKLVXwrkA8x5?=
 =?us-ascii?Q?mG43DOlW2BSWDajMBtLmJDWsumX3TZTEtDCQW/gIEtJOYkpyRJMuX1gH+fmN?=
 =?us-ascii?Q?t4BlUlOKEX/ppnIsggmIRTaPJLztp2nnKgkJZ85bzLeWc/p8xvOcG6zcTCNf?=
 =?us-ascii?Q?dg6S1orxc9Ngqml4XGdn+fwk7iEVnRkbvIDyoY7BXJRqqgxaRUe4qGigOd1s?=
 =?us-ascii?Q?8iKN32/Xczh94oJdTHJzJil0lZ/tZFPZsqWHwSK1366Jc0gggZKaofsIfoL4?=
 =?us-ascii?Q?b5d4FBVAS31wqnLpxxfSO+zx8f68NPykNFd+wnfeszO790FHe2U+Uu0ZUEWQ?=
 =?us-ascii?Q?085X/mQgiuFASkyvJVYWdd6ISUWucGDTBQWJDwUbN38jHjz3GrdxXDQMHo0R?=
 =?us-ascii?Q?wCgZhJfw/BsjW4DjxH06ykjEAhtulYzjAm5VQT39GtlkMaEzCJHsIHRH+n6K?=
 =?us-ascii?Q?TKPzgnLz6Etf1Mgqa7BkXH3D4djOL+i5FlN7GvWxI2XBxYv5LcSUxoC369DC?=
 =?us-ascii?Q?IFbRzGHibF8U6h4K/xtljPhj9pd4IJBTh92HYMwcJ07smuhXB0QFKU+FVswU?=
 =?us-ascii?Q?OteUnio5qUsplBxniLKWjCa52HRuWDjZrb5TKx/LYqfdlaNAEf21AYjJYZuG?=
 =?us-ascii?Q?8QegkSGlH2OPSI2HgI9cGzoZnSL51DqhwGVdaniCZaKiPox//e1b8+klPjKr?=
 =?us-ascii?Q?p7VXuGXFX3z81OyyIqpuA4Xi0eLWIOuffBLZ901WscN8oEP1qy82mSTC+W2i?=
 =?us-ascii?Q?xRnmKLiW8K4UJ596m4QRn0aOXa4aGY5a6n3y/jwJDohmYpbf7oANTk5kVmUj?=
 =?us-ascii?Q?KLcCrE2f3bfncSIzd70ZfSTUGssscSDgetkUGibHAo5H8yeC272E4UR6+Tif?=
 =?us-ascii?Q?0dZoo013HjqajWUHNLHwRB812LBW6trwVgg5UAQjKhhBdb9IHApxmgNGly+O?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 593594a6-7d40-4200-4be8-08dbf4e0c51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 15:50:41.9598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6y3UBGlahq1gqhucUFIJcwfimgvV2rlj6BTal1/PRSgTlUBjk00uC45G8A5laXKc0mK+cLdaOV9Y++yfAw28gJWyWchfN0wSmJ1AZ5rlfLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6144

Hi Rob Herring,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, December 4, 2023 3:16 PM
> Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
> description
>=20
> On Sun, Dec 03, 2023 at 12:56:22PM +0000, Biju Das wrote:
> >
> > Hi Conor Dooley,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Sunday, December 3, 2023 11:41 AM
> > > Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update
> > > watchdog description
> > >
> > > On Sat, Dec 02, 2023 at 07:25:32PM +0000, Biju Das wrote:
> > > > Update watchdog description by referring to dlg,da9062-watchdog
> > > > binding file.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > index e4eedd3bd233..020106322b08 100644
> > > > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > @@ -86,7 +86,7 @@ Sub-nodes:
> > > >
> > > >  - onkey : See ../input/da9062-onkey.txt
> > > >
> > > > -- watchdog: See ../watchdog/da9062-wdt.txt
> > > > +- watchdog: See ../watchdog/da9062-watchdog.yaml
> > >
> > > Should this not be squashed with the conversion of that binding?
> >
> > Yes I can squash these patches.
> >
> > I am not sure how this is going to applied as it involves Mfd and
> > watchdog changes, who is going to apply this patch?
>=20
> The series should all go thru the MFD tree.

OK, I will squash the patches as mentioned by Conor.

Cheers,
Biju

