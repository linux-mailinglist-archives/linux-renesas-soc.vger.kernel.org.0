Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8573B7DDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhF3HNK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:13:10 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:54912
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232760AbhF3HNJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:13:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfF9mCPabgFPKv3bKrZQ046cD2rTkhj65Jrl2VtZHqnWQ7/078uZ5//oh5IQkYd/S1EQam9oelSZR5ezlFUdxLLOxxHdq+hh2S5j8G7T4QTsHx2bYxguJ4l+qUGPhnJT7D5Vh03W8j3TiASo8k2a95RQqPbyw2ytL7mHYlzp4kJ9x2Q/QYPhdIQWHs8t8emK+d64EinCwnxWsOLUZkfpdap0FJI25hmabmw1C3TDYQaGusdVQWpe+0l0l5OnYPdHueu6+j4boyxMKEs5LcNpZJz4iaPLt5xomLAELWVMfHi5Kgq2QQkk9+eecIYK2eUlz8ImVKKHulvgs8VS1RCnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc3XyLkgL3YaslkUq90U1tnyFlOc1Q3aPu8w+oPj56k=;
 b=MNxxTWExOGY4WaAzIfJChK3QbRSBsc5L6TMCtseFJLD2VwgcGV+8kkTnCZ75BJootQuOGapQOCAMbO/NmPQ8EEMB1OlXpWZXf7/moPj1+pgiirBNJUHCPS801JuKvp11FdtcCrbLTbK9EBvKyF75clBNoxsDre+p+jUNBBfQOixcvEiRlahY37X7ZNPNMpkvpqXwIAJniXOK/iwloHsL2sXNCgfJAKL99A2zSkY9TCUUML48aItaXGxKB/otgOkrh5AZh+2/JPjbTpeyD4d/FJDOybWArzjCxFICWsH3XIH/GfELGVE3L618xqGmeiI5MMuP4vbQWSZyNFyl0YUoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc3XyLkgL3YaslkUq90U1tnyFlOc1Q3aPu8w+oPj56k=;
 b=Fi6ZD7CQy4Dfl2EettrylPGKHGmZiX6gExnasD+If70xeQzocCObA6lv8zvFtLsfNN4CE8M0MTeUKqp63h0MHjuVwFOfYRWGTepOKa61qtz79DNPe93rLooM2AF9z6B1SOmTZf6Fp16rNFr/36hzSCm1E0HIGbIlYFvljTb6aL8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.26; Wed, 30 Jun
 2021 07:10:39 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.029; Wed, 30 Jun 2021
 07:10:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH/RFC v2] mmc: host: renesas_sdhi: Refactor
 of_device_id.data
Thread-Topic: [PATCH/RFC v2] mmc: host: renesas_sdhi: Refactor
 of_device_id.data
Thread-Index: AQHXbNB8roqigpS4wki9fbt5x5FKdqsr+siAgAAnifA=
Date:   Wed, 30 Jun 2021 07:10:39 +0000
Message-ID: <TY2PR01MB369251254895EADB8CD6CC17D8019@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com>
 <YNv1/9WsdYu3ZwVv@ninjato>
In-Reply-To: <YNv1/9WsdYu3ZwVv@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc4c475f-0868-446f-bbbb-08d93b962acb
x-ms-traffictypediagnostic: TYBPR01MB5391:
x-microsoft-antispam-prvs: <TYBPR01MB5391147A2FC166825A7B2B24D8019@TYBPR01MB5391.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UrbFGWbKHeaahovGC+cQInosThUGGxyWixcF417JLT64u0m3aHZt7cumgXPEaL50LluNueAvhooUV4aM9DYvdyHFneBS80ZB0f99sh2Y7UgFvdOesQ5SImvAh08WPpSD4IlNc59dd8Hp6LOb2kHgXHtmoop2KLKoUq5nx1hkqLxq3P6nW3KCoI5KgyGIwUzmaDEts05RRjMO5HQAPsx2gaSXabX1qA74dhErupkFV1X00TocBFhb4FRr2O/IAmpXrwIe2+7Mefs5kGkxUeVq5aXM+uY4BYHXmXIdxWS67Yblu+IENjC35tajPc7K1XU8UKb585IN04EPSJFTQVi0d39MQSTNYXcuv719zYoZZWfKaVB0g6IvT5lcLusoQeFqaVnNU7VFZB7jueGGd8ijC/NY0xxfA2MzJFhYSzATQnO+ewVP50umfT1BuHvDj8NBqx1zb6Mm8Mbx3nk/xJ8A/0eeNoogmsG4IZMVaxO6uy2jpMr9wgCYYYuJetXcFEGThwxWuqmTl5K30WiHliO0Imw3mmLEYeHWvxB9auCF43JbZpfOsX1KVwz45WfEY6Zhqc10B4VlfNZ0RAmvA7dXrdaAskcT9B5bWdHOsDQqtLdGfrvO59pSybjt/ftBvDTApjygtDLO4vTwNmOl45KQ6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(64756008)(8676002)(7696005)(66556008)(66946007)(6506007)(66446008)(2906002)(55236004)(66476007)(76116006)(498600001)(8936002)(26005)(52536014)(55016002)(33656002)(54906003)(186003)(38100700002)(5660300002)(71200400001)(122000001)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6xe10lUC5nCkp0IeDQfJheWYFX4nkN0czZPuIGXnjs23HluqApq/QmVIM91+?=
 =?us-ascii?Q?ix0rIXTvl0PgglEFhfxW6N3umwhlZwy1OmdxwqP5QdYmXCQqPkmGFnSp1Ed9?=
 =?us-ascii?Q?XXb9GFTLJAlQIrxAu+bEdA92s5+7VKqgEBjE4G1X2HH7Kn+H1lRbxjMxW2p/?=
 =?us-ascii?Q?xNcF8c6cm5+wXk1nQvhSlQ8OZCovL49DSUzEX9RyYKi0sIWqg9vaDwpMhDyP?=
 =?us-ascii?Q?yT7qX/dHiI87l6i8L2ntmPrQBl5nJ+98w80PVzIPW5dDhzLGAMMW64mtFido?=
 =?us-ascii?Q?Mya2nXLfAEYh2sqKDY5ckU9PgReH5oY9nRg8xVAo8hLC0WiG6KSdYAOywJ+Q?=
 =?us-ascii?Q?hQezFnsvC2CZlb6AbUX+/j2eUVCEPpnDKRPWnNanUj9G+mxz2USYHNpRvyob?=
 =?us-ascii?Q?RASmDO7HbAh4WK3P1WiIJuolR3C0jXEHQxGDOzyAGe3ZIZBaUvk5Pu6mgR4H?=
 =?us-ascii?Q?TYl2qtDaScW0QPIJm1m0pLm8MUSo28RJV7Yk79/ha1MeSPMlrR6r0FcDGuwp?=
 =?us-ascii?Q?6Xnn46WyKY93u77+HgB2Uz2BHvioQk/xQWnLCjVZFpvW9UggZRQYlv0Y1iPa?=
 =?us-ascii?Q?qqe2ZP4DBNBeT7C5QfAZitKBAvnujhrsABjDhCC7XADab0iIZia7wfe5MY1r?=
 =?us-ascii?Q?VRgJR9w9FzGPulajaemXLeNkXpReHT+htBub7QlbocsUoWuN8E7boxCZsW8C?=
 =?us-ascii?Q?ypRTududQlzrfhdFrDqoOSJwb2aF2aE5VUYmh4YozEvNdOMejN+UrO8O5XRn?=
 =?us-ascii?Q?q/SWXR9QLSINnTTGk88z3lg3RoCYlQRzmB7iMVGQY50zaCBGYbsWJUcAzEaC?=
 =?us-ascii?Q?e9WjIPLxbPcjymHPoRxJOCzuTfCZYr+WXZiBkaSuYV9szgtP7QYUN9DvPKHu?=
 =?us-ascii?Q?tC8+5KGXm7ck4BVfUGXrCCJULJ26KUFchnaDj0rTsddcfCBWVOVhlcyls1S2?=
 =?us-ascii?Q?ohRYqZtt0gdjAVJFhA6G4fgogKhoi40COIwn/3FYvQ9B3s0Oz5JkaIeDJ0MO?=
 =?us-ascii?Q?SHa3aA8qHahXMQH3OGvjdZDTUWKx5lqQmSluyloj9jCpCqtqRbNIAHhJl3L9?=
 =?us-ascii?Q?qfv1Wp7vDQ9oPu5lv+NZrOyBzOYuhcH0m7IWpBzGFVXASL1UKNpocBge3npu?=
 =?us-ascii?Q?vM6qZJSps0nrN1gzhmE6C7O20KElDRR7U4l/1Cq2fA9BF7fkG8/4QK3rBRQ0?=
 =?us-ascii?Q?z9EsXOxyVJ1ChtyaVlpIiLz6uMnL2jivtnTgyXS/HZ8DgIK/JDUNrxZUClqX?=
 =?us-ascii?Q?IWkqmqnYof+ngeLp6fKWjsq9Ygx3Wo0UzjpRjcJHkEzk7JSFlDTcgf9eiRMf?=
 =?us-ascii?Q?aMORJmtaCiYJ7MAwhbS+evmW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4c475f-0868-446f-bbbb-08d93b962acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 07:10:39.7484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMA158MJAuN0Dl/JlSZzBtuhnDvALjGVnV8gCPvA2DWZKEdx90y2munK8byVMofQ7Di9ub/k1OIRY5882xcXp1H96gkl46K8Egs6hjPeZyib6xdLST448xPs6dvniQsf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 30, 2021 1:42 PM
>=20
> Hi Shimoda-san,
>=20
> thank you for taking care of this!

Thank you for your review!

> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>=20
> I think this Rep-by can go. Test bot mentioned one build error of v1,
> but it didn't report that we should refactor this code.

You're correct. Perhaps, adding "# build fix on RFC" is better?
I checked the commit history, and I found such tags.

> >  -- should I make step-by-step patches to ease review?
>=20
> I'd think this is good enough.

I got it.

> >  -- should I rename the current renesas_sdhi_of_data (e.g. renesas_sdhi=
_param)?
> >     (renesas_sdhi_of_data and renesas_sdhi_of_data_with_quirks seem str=
ange
> >      a little?)
>=20
> Yes, this may be a little better. I'd think the current naming is good
> enough, though.

I got it.

> >  - I tested this patch on r8a77951 (ES3.0), r8a77960 (ES1.0) and r8a779=
65.
>=20
> I also tested this on r8a77965.

Thanks!

> >  - Also I tested this patch on r8a7791 [2].
>=20
> I'll check r8a7790 later.

Thanks!

> >  static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 =3D {
> >  	.hs400_4taps =3D true,
> >  	.hs400_bad_taps =3D BIT(2) | BIT(3) | BIT(6) | BIT(7),
> >  	.hs400_calib_table =3D r8a7796_es13_calib_table,
> >  };
>=20
> You leave the quirk handling of different ES versions still in
> renesas_sdhi_core. I'd think this should also be moved to
> renesas_sdhi_internal_dmac? Then we have all the handling in one place.

I think so. So, I'll try this.

> > +static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compat=
ible =3D {
> > +	.of_data	=3D &of_data_rcar_gen3,
> > +	.quirks		=3D &sdhi_quirks_bad_taps2367,
> > +};
>=20
> I'd suggest only a single space (and not a tabulator) before the "=3D".

I got it.

> Rest looks good so far!

Thank you for your review!

Best regards,
Yoshihiro Shimoda

