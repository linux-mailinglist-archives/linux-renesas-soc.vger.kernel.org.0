Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1BA781F0D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 19:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjHTRlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 13:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjHTRlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 13:41:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDDC421B;
        Sun, 20 Aug 2023 10:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fub3Xa2P6LoKT5Sb3xlT9y1t29sjdlX1tPJfsffk0yFudbsgIfKIvGHcq2g+ad7yGGiJaFYGPgkydcBAT3Hg8a0rou+qLhPTsu2JWncj+A2IYD1ygEGlz2ehl6CLY7qM6A2NwVF2cQPkh1VirFMOXcAtPo19BjbhWVk7vGEuFGd4/b/vO/V4Ti7VOUiisAnk5dNGtbXAjzRCSA8yms8TCs4MEPq4zUI1qjDejizbYB8gmTduuy8R1rY4yaM2JUmeSd6KgV5kiKsv71nQk6Sqcx1j7XmvIlHRnX8vLyjc24bW1hlc9P85SI0A4C5UdsTpM3rBLjxxpxSZDRbYpC4Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP5KANZZVYHNZqvcy1AZrmkimKiEy2Zf+zUZJRSCL+I=;
 b=MEe20fweC83p0bqsI7X9nB7etYxRfx+wAvfZY9HFN6f7UkUhHNhYNnIgFfVr6h4G0UoDM2a1FyuHzV3Ym5EkZzrqdMhjih5alPp4W/CHy1O2oa/wSNw5L8ZPh5DY+n4vagke6sxq1wnhNitmxhybKblpolX1rDIlIUOkqrSy/vG3SzyVYmvG6SbVjs5+FqwJXNE1JMfcDcr4ICfAD+DI1EUoWx7uSbcUbuszf3Q/6mIlIOs45k1pN4Q6s6BWzHphWyUo7uitIYN01BHDfnQR0tpqCWL1/sTWY3Cw0GagzvG4EIoqnjxvgw31CvAA5R/QOxX0cZpSbjHYLHyXtJ4cvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP5KANZZVYHNZqvcy1AZrmkimKiEy2Zf+zUZJRSCL+I=;
 b=R4x0FMArM/BQojX7/WPlBb5MwSGk/HD053c255Yj6pJYtMZq8l2J8+WdLXYojO3PuYqXtElDbToZdJOGlt4Ljne54eVJyzhLht7O/xPgM5+1il/Aicm9SlcEpMGcMSn5fyqV5BUGW1ETyYmf7F43fKXTWPixBFyHcPPqmlEwZMk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5567.jpnprd01.prod.outlook.com (2603:1096:404:802c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 17:36:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 17:36:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: RE: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Topic: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Index: AQHZ02S7TE7/pX8dqUyN+2Y9gszHrq/zN4GAgAAK7oCAABQ2AIAAC5QggAAPnfA=
Date:   Sun, 20 Aug 2023 17:36:02 +0000
Message-ID: <OS0PR01MB5922A79C02FF9D934767307E8619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
 <OS0PR01MB5922C02D0984F36C8CDE98888619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922C02D0984F36C8CDE98888619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5567:EE_
x-ms-office365-filtering-correlation-id: 030c6c5b-de81-4dc2-7a2a-08dba1a3ec65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JWTI7rGb9kEubNgS1hN6RP7YDZEYZzaeNYCIQcg/ZrhmlJWKL/+kF9WuEgu5KkiKzZK6Ejiav9FR7uonqYl8hCMafqQ0bQaDCBRYcZU3hPPyFPVa071a0M8Hh8rwP1pfXvjMiVZD3KhJ+lcYdq78STO8NeKSl1eyQqoHAjPyKo6Af9EpFFBKFjoIToEJLJmVHBdaouwNyUK/CIbc0BVyIQiEqs+Fgllw53+uf3eLtoz8elIfOa6dtivOYanbajf70cAiEMouPOM53ULVld2UrAa3CPM0VBb1qN8jVPGQ7n4vkBl8vvmvYOFLNp1UnlAE2XKVz13fVPWUkHmTmlQbqgjXG+QGaBWN7Mrk0+x6Fk1LqjPYKjdNmDT6o9QauMTYL99+bZjvVPAMmAaCHD0oAoTMgf+M2KjfPLtLDdLP6wa4E+CkLPh6rx6T9ZaOnXPFmR5+vUtAQD90AvYe6QvT/IhgRr0xVF0/aDCPxuC/fHKFmOHYf4mc/5mL9BtCiOQId7BYX2HiWHbaVNDU10XRkk9ee58b+ut7tY2Ahv6OG7Y6yIw3KUq9/A3ClEjz+4w+mS/k4amcBv1Bue762XH4AAKfBml1WZhpoDYBwOYmC0ac54n0EWXewlVsQByRYE13
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(76116006)(64756008)(5660300002)(33656002)(41300700001)(316002)(2906002)(66946007)(6916009)(66556008)(54906003)(66446008)(66476007)(8936002)(4326008)(52536014)(8676002)(478600001)(71200400001)(9686003)(38100700002)(38070700005)(7696005)(6506007)(122000001)(26005)(2940100002)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nMWyixJ/qKKsYy8yhaHjGPcWHzoAUDtluJuD23b0ZCyQKWhIiM0Wum7iYWPy?=
 =?us-ascii?Q?FKIjCqkbuV0b8Xkq4Me4zY22M3f9FAP1mJHb7tzCBg6nqqDvSpfNGijupvcM?=
 =?us-ascii?Q?7MSNqagADtCLnqs5OBcJHGXxsSrM7c0NzPacqOs/MkpBN9oZmdC+jkupxW1H?=
 =?us-ascii?Q?6oyQf6B8qyz9a9mGTTi1hhMVuKARU82ytt3D1NWDWyM3doRmZK5LlcZOC8Ze?=
 =?us-ascii?Q?ylHqM8/sX5/nO8JrRHioc+p9aRGKzokurGPluvnO1DCg0/WBj1C+qZnXJpMf?=
 =?us-ascii?Q?lLakactHts7bQZR4lhpwMvF/aGbBnYJFpZa5JEg/bfLoNRca72bzybSXzu4d?=
 =?us-ascii?Q?RtdNTX7+v6+BvZzJfmFMiJ1Ipp4qlLwnAbYXdca2DU/kmqoTgukrI2TvHnTj?=
 =?us-ascii?Q?hsHxaglXyO+fsdNnI+Cipt96MkHzOz03P+JzifTr9TT2G718lVvYAt5WNc/B?=
 =?us-ascii?Q?PEFZrYXph9G8Li1dijrSqsKg3gDTHNjKqlWWtznpFZ34mzxLsLUtWcUydSKZ?=
 =?us-ascii?Q?i8xiWZIwDxuEYI3zDwIpi0TTQrJsWWrjljkrV+FX4Y51HHuwn5zONgcJCjNx?=
 =?us-ascii?Q?miFL5ThbcvoaQHi1QlOKMLWKsTlD4rwOu+V/3mNBcUiuhufWge86etCpZTFy?=
 =?us-ascii?Q?C7n2n5WlIp12BwpV5NLf6WlwToeNO9CoVk+kzWAJkdjKM3GT+R15YVUY4dBz?=
 =?us-ascii?Q?j+k4RbAoNwyI0xPB/j7bUCCf+Czws/8nL6MSlnfF7vqTUJY2VUA875CwRraQ?=
 =?us-ascii?Q?eQbE278eoPJI1nDLcFn2XN6i0UeHAlpglKEkiBAsX9oTEW998GU4CkB/5gYd?=
 =?us-ascii?Q?tWSmkbZ+9MMlxjLEl9HuUhO+juj978TvoQoPl8IsLtjFD45XWctPL5NFXxZi?=
 =?us-ascii?Q?YazZMsBuIm8xHLU0xxRRW+OGWq2sPvFb7Su9rjb0Bs+QQWA2fbYI87nmP8zl?=
 =?us-ascii?Q?/93Iru9sJY/Ugq0mDPePaIjr6xZc7eDQjjR59HQzktAXKnbHraxZxvAxbcLY?=
 =?us-ascii?Q?2Jq/NGaK3PYTn8xNA1tyd5br/NWxshmG9lKvsLAGK6TsrYFp9VODtEZAqHy3?=
 =?us-ascii?Q?kIdDS8cUpysafr5vGTYb1R+bvwP+bnxv4X3YOIuJ1TFzyNAKvpNF75yX4xkP?=
 =?us-ascii?Q?Np65KHqSN/GOiBPbew71Mv5an4Z6RRGemz53uYgYKYPuQzyi3R3BLg0kjWcK?=
 =?us-ascii?Q?D7tdF8qjITSLrhBHcQptMx025ODvTInOwFz77ex6W23WiKxfEc2maOlohjZ8?=
 =?us-ascii?Q?fsqPZ10k1/ZATUb2Z3EI1JrFRKUeiGivLrpGl6u/c70t4NsRuGy4fYFqFTKX?=
 =?us-ascii?Q?bUu7Uu3v5pZs6S7UyyAnhCfBGnGYpuTzjc1832/WlorJnSR830W16CtUOnxm?=
 =?us-ascii?Q?1RxVe0oulUn2VtMdiwnaFmzJE2cqjnxJrq78ZHnbA142HuCzhbtbd5zRFq7i?=
 =?us-ascii?Q?nrP8OdjcY3xtp+sq/GEWX+Ds3CWdPGKgF22L3pfsF145Wsm7MoOOGBomuYnr?=
 =?us-ascii?Q?Y2jB8TjiMPKPTprCC+iN5oIXlztd6nEo2wBY2WtR72n9P6oweRG1cyc4QeNx?=
 =?us-ascii?Q?+081Zbmzdgy7IgXkjPpqbhCeth38IlYEuclyGgfU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030c6c5b-de81-4dc2-7a2a-08dba1a3ec65
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2023 17:36:02.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVAB0TqFWNKnxmo8u8PuDdeUTGbDE0P1RnSmgCvWcl5LcNZXOLpsgEyn54r0XVAzrv5ZfNOd+mcAnCFddS/6qOBcdoM9rzsfBaZ8TqMcrQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5567
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Guenter Roeck,

> Subject: RE: [PATCH 0/2] Convert enum->pointer for data in the tmp51x mat=
ch
> tables
>=20
> Hi Guenter Roeck,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x
> > match tables
> >
> > Either case, I would want to keep temp_config and the number of
> > channels in struct tmp51x_data to avoid repeated double dereferences
> > and because temp_config could change (resistance correction
> > enabled/disabled should be a devicetree property, conversion rate as
> > well as channel enable should be sysfs attributes, and channel
> > enable/disable should also be devicetree properties). The value could
> > also be used to support suspend/resume in the driver if someone wants t=
o
> add that at some point.
> >
> > In this context,
> > 		if (data->id =3D=3D tmp512 && channel =3D=3D 4)
> > 			return 0;
> > is wrong because there are 3 or 4 channels, meaning the channel
> > numbers are
> > 0..3 and there is no channel 4. This should be "channel =3D=3D 3"
> > to disable the 4th channel on tmp512. Interesting that no one
> > (including me ;-) noticed this.
>=20
> If I am correct, as per above, only max number channels supported by the
> chip can go to device data. That is the only HW difference between these =
2
> chips and other chip specific data can be derived from this.

I guess, the below initial values for temp_config
is chip specific apart from the number of supported channels
as we won't be able to derive from number of channels??

#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80

Cheers,
Biju

