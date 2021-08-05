Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027053E1797
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 17:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240771AbhHEPJe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Aug 2021 11:09:34 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:58488
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238005AbhHEPJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 11:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZja8DyzEkntESHr8ylUwosEmHBbz2N8vl3RNvVYNnTv+CL99JKChfvIJbgH39CruRII4QuLcny9v0YR0pD3E1tYf3Qjfofc26fxTsiDAKkPTBo9oQjUiS7VDnLjK0EocA7a093H1gNKoPLw5l74pTAajLjIbWrefQCpZ4sZHkIK0PH92fo6lLant81zysNv4N38V+eaiXgg8JQSwJFEVZPRLUO7/ASkGQjXkisGbtSnsFSFVvIlKo4WLSDFpTBTnbzBbd0lu/iaW+V8SjsOGO0ozhvt643+Pvji3PgAdYeK0YBxhsK+x5H5IJX++5SXgjVdt5wiyQyMzWRcSJgSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4rsH/CCP3BCQJ8LbWEvMBxd+qmpFk3j3eoZzPaNDjo=;
 b=JEkbwov+6y9dze11GoZGHRknR4ZfBJn1MUMQn+1e0s/1QRte2x/joWd1FyEKGpNbxOYNEkJo30dgetIVnqrXI7YCpg/Xx2ESMD0ZH5O4UA/iZzC1DCZCeXHTIIIclenQiGorElv/gx1gumbcTkMepqel9Httcu1LSmHymeQJXe8BlfG+Yug7Oi4p/AunXodJTgT21hx6zRUBzaD6WpnwolLBnxnwv1dnKOlbem5rhHn9eREmDANW+wU1BOE0gjU2lB50aI5d5bErevEv+2Xwt7eNAagNHlWcAlQmqp/0JNbcOJs8vJwB6z07USf2xlD70OdEmoeAbChFYBENjriogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4rsH/CCP3BCQJ8LbWEvMBxd+qmpFk3j3eoZzPaNDjo=;
 b=YQlcdPg6TYUHYQsM7re/AvPPYpOMR3MY1Z5za/I3JtDuebDjCWBlkUs4sCNc1XsyybJv0oZnZYXoLnrf8g1JaLj6kNr7snnYvtXjVvOkMZL+J1wBqgPdPMxtrIwUdM8t2tcLzwdUUtHQRjnS88D7yISPN4AJRx4YJJbiB3Rjqt8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1878.jpnprd01.prod.outlook.com (2603:1096:603:1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Thu, 5 Aug
 2021 15:09:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 15:09:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 0/3] Add RZ/G2L Sound support
Thread-Topic: [PATCH v3 0/3] Add RZ/G2L Sound support
Thread-Index: AQHXhJ5tx9En+BFs9UCZo12VfhqZ5KtlB6gAgAAGC3A=
Date:   Thu, 5 Aug 2021 15:09:17 +0000
Message-ID: <OS0PR01MB59220DF14ECF298FEC73DEFC86F29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
 <20210805144452.GP26252@sirena.org.uk>
In-Reply-To: <20210805144452.GP26252@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5493d03-b6ac-463f-cc5b-08d95822fed2
x-ms-traffictypediagnostic: OSBPR01MB1878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1878923E586DD178069F1C1986F29@OSBPR01MB1878.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nYzogUsFxyW0TLhfclQd3Vafwolqu0ranwqEIgP8CA1UorHwuQSh5nLtyVGnrfA0Uz0W8/QN9TJsW5ZqVWg7ESakXA9l3ZpyiJO7zpzfQpjXlTv95WvYFSZwjdMXgpTJQAD0f7dw7+tlaSdbKctwfTDxnITl3WyREs2c2QuFZktNtWNOcUWzCZ8QN8YNDtP0W+zxWvQ7ucZoOVMQofL/p/Ml2Yao54u9ijCJcMW/HfJYKV7DaQhNAEd9Ullo3UoS1Er1gK714jFBQtdjWFfAEQR0aB1BCtmYhHoZICessFu7APYFEkxhQq/kwu0oZDAUmEh4EdyLMi7mPQuz15OiV22OD49Wh2dPYbOuttBAf2zqX73xqbNq2q5yB8377EPMnKqPY4F7Z/dgNI+hTwg+zPmk70RF9Tf9Q9CcSiHnF/WrrOJtEF6YGwVQHKMxlqfkXswkGEbWNJlUQXPFmH+yUxEkgSbaLm6QCANul57NJdN06mceVB5WCGNIIMC2m2bcPpNe7vjCC0v67ubbAvKoqxbcAZVYeXTd0HExpHEnnMQNo3YrontIagbXmay47Jm7NhvQUN/NTIZLuvAP857vlljGDebluAUpsRQJ6M8nUQVQzI+40bU98Qke5ttHFGOtC87qZsBRVgEIFVFc+eMTv3E5vkoAWDm3HzJf+vyhkTyMlqeSHH0HB7CpE4TzVr5hHHCR7AIISfeOfUoVezUDiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(38070700005)(122000001)(66556008)(66446008)(316002)(64756008)(52536014)(66476007)(38100700002)(4326008)(4744005)(9686003)(7696005)(7416002)(33656002)(54906003)(76116006)(66946007)(6916009)(55016002)(2906002)(26005)(6506007)(86362001)(5660300002)(478600001)(8676002)(71200400001)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mKpSw0WAMy3fydw/OB/UrOIF0zvlC1pKi2hTLUlBxc6QzIj78E9gKWjiw6Ki?=
 =?us-ascii?Q?rTKNrHHZQQRzcuoHPZKtZNR/94iMGeu6PoavVPApVt7zcreFd/cVX0ONRrsL?=
 =?us-ascii?Q?Cyv8nxO8m00pXkOQ8ZdLhSuaKvNJAe7sLbZNpmNehb78pkfRSwUVF3vK52CS?=
 =?us-ascii?Q?L1LOoWZ+bRy6TAE+SodJDtG+kX3alyzOgJjWzloGIkfNdW4fHhmGeK+1i/OE?=
 =?us-ascii?Q?t24FGSXKgzwKQ1ULFUTGTfTIpUc0yRdZnPK9TTBW6ndkepQev//x/E9Bqvzg?=
 =?us-ascii?Q?4r8dK5ePMEKTlmJ7eG+uAaGPWfsqkMtnqD3BcKqzvyTBfZdaEVZM1lv1KnwR?=
 =?us-ascii?Q?MA4Ecne2RPUzIrPMvHyy9/zmtK4dlcfYqqPs3wVUmBRWWhbwRckuoe8/lZr6?=
 =?us-ascii?Q?fPE+5Lt9pgUPA4gzmBPsz/yYUB4HCr8C/IpBmRlsVNDcy76T+eUg33oTy6fW?=
 =?us-ascii?Q?N95SPWhx+OhixQLm2IvMhu1FW83f+WflGo2ATk0MG3LIaLTCRbod3bY8++LU?=
 =?us-ascii?Q?yqUc27Hhex2msfca6M86TUYpb7rdyMxmh7CLm//Hbr6TK37vVdDKSt8Z8CTH?=
 =?us-ascii?Q?vZDefGMwRmEHN6906nssJ01wc1KmE7VmhxK1QEd/N45CH7RI10TKiNuhAIGy?=
 =?us-ascii?Q?Pt/ndHOMhKDuXk1EzEFOxNlcZ+D+ZPeXUevFJp6iZGkMjaKeqM/uW1KkmPVf?=
 =?us-ascii?Q?4msQUFto05PfopHrGjVYYHF2VO/cFMS+NZd7s4btMoeApcukAVMFvQxYoKvc?=
 =?us-ascii?Q?3jfYR4wJDg4PsHEdQEyyZW2Lod5fJaEhjMfnIhcH3YLCzU0cBLUPLhn9gZyL?=
 =?us-ascii?Q?y+LcaZ9BRMuGu1xzzjXXMrXaBrE67HXbMmrtVItBtJHEeKIIx4ZwnN5M2J7H?=
 =?us-ascii?Q?Np/+lIl6wj+ZL7Ls8xW+6eC70d/wb8mxNPtLZ37psRZMmj7vw3frgHXzh0jK?=
 =?us-ascii?Q?Zeipa9AFWENrlDl/bTrw+Ik2NNq5WtXte9gbHksfsVTqFtwZ9yY+foSMW2fD?=
 =?us-ascii?Q?M8L0ko4zbNU3wyfAyZPcX9vq6IuIMGKCvBkDrEGG8em+YVKh4s1Q2W1A0dDy?=
 =?us-ascii?Q?QdQ++qvvJT28uFGdtmGQ6eKFXLMVozr+tCGmPKYeA8kGAX0nNaNfSrl2DtRz?=
 =?us-ascii?Q?xi6A395pD8H/1OeCnGpcrmj+JXHXRlPnMlF+5FcDpebFTMHHuK1002Zxxt7O?=
 =?us-ascii?Q?1sQuSr6wpKemZ+NvY7slpP3MLPPzYEaklQ7on/iI1isD2uHdhOS0P0c19Ol1?=
 =?us-ascii?Q?c27bRQkUn/WMCpJ0Li28CYTMd9Q6WwWTyFY+gwesakeHzX6cuZZziYiwpbGm?=
 =?us-ascii?Q?8qDEO5Vy+EJpfeWl+Me12xpF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5493d03-b6ac-463f-cc5b-08d95822fed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 15:09:17.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRcm2CrBcymFNiL5Zb32gJcJoFV+XnwMBOdIlugWlfMfLTYbzivbNr6cHPc93U3nHk36YoGfuxmwQK9gqcxJwvUwYZDOUz71TApX0xZxWvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1878
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> Subject: Re: [PATCH v3 0/3] Add RZ/G2L Sound support
>=20
> On Thu, Jul 29, 2021 at 06:23:08PM +0100, Biju Das wrote:
>=20
> > Biju Das (3):
> >   ASoC: dt-bindings: Document RZ/G2L bindings
> >   sound: soc: sh: Add RZ/G2L SSIF-2 driver
> >   sound: sh: rz-ssi: Add SSI DMAC support
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing out this issue, I am preparing a new patch set for fixi=
ng
the issue reported by bot. I will take care this in next version.

Regards,
Biju


