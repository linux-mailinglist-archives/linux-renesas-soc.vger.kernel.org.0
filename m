Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52BDA78AF00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjH1Ljm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjH1Ljh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:39:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52512C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gctcVXYuArB/mJnJHZhICmZLQZXqww1WZUBA/7OhWuBb6gx0Bg1rigfVbR1XSLrZoU+v6HswNqPh9CNSGJZS5Z+fPrWD9ZuAfyeWA1kTZeERbcGoE5/sjNjyuesbfYDx4rQOjD8DhZfI2Oe+vooaQ0xcFR1MOt/MyRYTqdcKIAPZ59r/Ic+9wmDjXCb0xAcZb2hc3mzshCGNjepR31EGKi5/XOFOfUr2F0DYIALtIMvTmMRKClpsY248ixVz+ZKGplkgci7Jr6+qZ6sIUEPeSqlpCbWrMaGrQUZqygFWYRQdAQ6F7ijCDiRrt8gHToSFCC4wkOUGD62eBGphKr1Qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFltBI8qO8x2wfIKC6wshbqYIjQL78V7n5Jt1SascCk=;
 b=YqHsrmvE8f4Yu2ciU8lYy0MOB7rYFdmMouv/dXKZMG3xZ+d5Uzi/zJ0UHxNCiuL/6XKDWCHEGKftwe1tUh5BIhWSeNCr8z6wX1xMUNhb02Hvzj8jqBxVVl49lREkXT2dcszUs8R3JdvRYwQx+v0c6JLo0q/4eoolE7pDkFkq2XD9BEn3VXy9WTk8tDQr8gqDzPYXv6Zt2X4geMVYrtq/FBp4y8dfBr3I2uJmnshleqnP/fNZPDMgxOlnUYJPtwdAAWr4BWRJORohke2pn0ZLzgOi3t1EZ9LrdzeQHKugFuo8SJ8M2opOg9N+istUzgDP5Qzb4R0KVOa+Vk8Q1g8UGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFltBI8qO8x2wfIKC6wshbqYIjQL78V7n5Jt1SascCk=;
 b=rpYZlTuy0iTvq5yMvi6JNWQHt66cyUXA4r9wzsT2M9j99hLXflGqD+Touy/EsGkyZCEhP2LVVzHBIjHcNGoBeDbAE6gtEr/G2eJKWUAgs1D5ZqivlAbPEfWeI4jENRWxG8KCaGY5t/ibB5yrJgKDTZaNOhs9HO6bTwpIt4sjgVk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10812.jpnprd01.prod.outlook.com (2603:1096:400:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:39:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:39:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: max8997: Simplify probe() and drop
 max8997_i2c_get_driver_data()
Thread-Topic: [PATCH] mfd: max8997: Simplify probe() and drop
 max8997_i2c_get_driver_data()
Thread-Index: AQHZ2AKRN15AzwMMVkeQG7eELnJkBq//k4qAgAAEctA=
Date:   Mon, 28 Aug 2023 11:39:30 +0000
Message-ID: <OS0PR01MB59229DF2CCA3AB2ED92B6BE686E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826094905.64430-1-biju.das.jz@bp.renesas.com>
 <ZOyDNfH7JE3wFa8C@smile.fi.intel.com>
In-Reply-To: <ZOyDNfH7JE3wFa8C@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10812:EE_
x-ms-office365-filtering-correlation-id: ede54fa4-c0dd-4e07-d1c2-08dba7bb7121
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ecuMpcPt8aVoapJr6MMApzA8qFtOJvx5nANAq0W8Kf6q6iUESfVmYgF7ejb47u1qY2sLeBw9oDurVy8/AATyDqpnI01u3a10u4/xfVuaNrj07eUjvGVYJrUCVCCtjfRUxQgSerMUEgb7Y1yhn8zXK29EaehfPQcTdld1mPB0rQLg4vX7jRQcEWaVuAW3COYFoR5mUdrSFr2zf+mpNPYfmv2jv0xU9dbhpUoiADLpeMxkpibr42CfGkIzHKIrbmF71uEHj+DnqeU+glNVdeB8+ZU0yFT4o/cZ0MX4NLY/RHzyd0iLrd7dxRyZeMSOgt//Tadw4syhxq/KYbCoNiSEjGkBi/kVm7i0np4s7QTAkLDCul5hXD8xSdN9Aw4wdUsYyxA6txLIor2CHNrzn/BYWAFXb6iz26FQ/0DjF1z++Vbv7k1BuQG1UGfMf3+GfrWnCsTvPASwoqgFQKV87RWGzCbU6c5hNHJ5xdLD5s8NG7Q/9fFJufKbfX0E/cTktUQX/Kn4je6GZaErh8jibrLTOXmY0PksygA6cl9I+oouKdNkx8x67Lvpw8Hj13tEoHaEIFUBJQxb8PWkq8i6g4Oz7TM4xrrsUrorSZ0cD3DYshP8FLs3C4yD4diU04VyKtWI43bZWTWsDboVwJfsk/zgw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(2906002)(6916009)(54906003)(66946007)(64756008)(66446008)(33656002)(66476007)(66556008)(316002)(76116006)(5660300002)(52536014)(41300700001)(26005)(6506007)(7696005)(9686003)(4744005)(55016003)(38070700005)(122000001)(38100700002)(478600001)(71200400001)(86362001)(70780200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wjqSmeh7FKL1+kLrznLmL1Vg/Z0HJo7nxNR+VMqynnh8lAyBNkMM7pzDeCMU?=
 =?us-ascii?Q?NLpJSDR/74E9KDzqDC2Netm7dKhdJXZXh/sPpgRq72sIlvpLTfypSPbMtjp8?=
 =?us-ascii?Q?d3J2DATaM7ncwd3/zUj358TVN6+DPpnFPUvoux9lES9vH09etFhvRNXah4dJ?=
 =?us-ascii?Q?AaU0ZGv5jyOjROCn07YD+KfdZ0kcQ6rY29xUk9qxKWQQeL/urdtBiGFJ64Y3?=
 =?us-ascii?Q?PeOaYXxZmoUT+JPCDx2iJnyI+eflVaLyf4F0SIu6Xk9qYQWKAuBxZhA1zvej?=
 =?us-ascii?Q?MpO6B8Uq+56i4WkJ7OmBTDscuCx/BFDgtwZ7qOg+1CVPrFvFTMeP7kiXfAnF?=
 =?us-ascii?Q?dsFMACc72UqfiEDELzjHzb3qdK0fvS4kcf/D8XST1HYLkx0gv2RwGGLfBh/S?=
 =?us-ascii?Q?GhZsDUz9hPTEncpFgAda59jYLAuom3HdyZ3+HLfiVUbICZSKnH5+JMVuypkH?=
 =?us-ascii?Q?0rSf6AP1Pv4Vz728F1FYgnyZpOSB8k6JFzlvJgCRazxfT5Xap1iwdNyrkqiU?=
 =?us-ascii?Q?AZj9bClKeiGw2XguLXesf1UZdb9wwhinlfGDEm4G9f36XM6DShJBcuyVFKvz?=
 =?us-ascii?Q?X28QifY17PEtoK3EIjQ+ydCy1F+3kkUFwXBWtNbuZYuRLS0wpksjg/0PFjLo?=
 =?us-ascii?Q?63t8u6byceS1xOYNlalwhWxjAxWysi69/lJ3MSRky5HM8oVonGcsbf9ifaO2?=
 =?us-ascii?Q?VAFcAZ2Rk5aqgXU+0ZwNf2FwqQNsJdbqXUxZ5B2B+MuFItBzybJZ7YsxCwxs?=
 =?us-ascii?Q?08NdAPXpshQXunAIgb7i1Hec0FWbljF7y+yLDkUSMJ4W7Qu54VQkZyN7ZVIb?=
 =?us-ascii?Q?PZ9lu+WZrbmfBO0EPMOj8pxtnME1FPhGMWcYh4KoVQMwJxmPW46X35vdJ13Z?=
 =?us-ascii?Q?p6selbz8L2oe4AoPO911lWcZx8m3Wf5IQECg0Y0fJyMjUCEqFpdsnESgCiY9?=
 =?us-ascii?Q?u0Mv08w6ixiW2+hwBoKSX+TOWPw26UBS9/ONP/8RHNXjdDLz0kdBB7U5qjzO?=
 =?us-ascii?Q?Urh/C6bmp7mJec/8UmMBGQPF8t9E0QzDA1qnZkelBWJFHbY2GJD4KhNfoC+1?=
 =?us-ascii?Q?Zxxbe+FndilpTqtAufzhx4nXpG9IpY1z98DTPF6yWE4YSw/WsR7xAnduWBsY?=
 =?us-ascii?Q?57XHJZsEIB39KBzvDhCuagrAvoYQzIYi+rq4njiAQx25jq/a/RisTv8Drhsy?=
 =?us-ascii?Q?HKRJOUZjipvB4Pa+4n4EUVX+g3qSH8jBJN1X/DsmJom+oh7ll0oaU/rPq1sE?=
 =?us-ascii?Q?mwxVrunCMJaJ8T5i1VotqlxnULQtIAE+kFzJ0nNCdTME+MC0gRyOdWDRtex2?=
 =?us-ascii?Q?UA6DbO6zWFLl48Yj+s8kul0avX0POgLGfZVQnPMViBDAgrX0DSNYPd6EhWZN?=
 =?us-ascii?Q?NvI8kM+Qlum90URZ8ffFRWYy8q1E56Co8zl1x9JjyC0jLxgfLDVoXdn/pgYG?=
 =?us-ascii?Q?I/sOYkXN49Dg6NFchCWDt3EkySbwKPscrsHmqrlnCEiz4TmxjYXmOSxcQZBN?=
 =?us-ascii?Q?QVVzRcYPTRk0BAbTUpebDBzCY2Z/GDpqsXU67hCgrI5nTkl3KKr29JnA90/E?=
 =?us-ascii?Q?j5+A7d3UYKdsrl72WQfSEDGPtNMf7TLlr3wQKswO219J2M/j0aM4NLIlJiGI?=
 =?us-ascii?Q?xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede54fa4-c0dd-4e07-d1c2-08dba7bb7121
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:39:30.1609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8ZNScD08mZh51VRwr8HefBWZS6I934fn5jF/j6DgbltqyV4MrA1I/WSuhN924We1KN/H2n5DIgG8utiHZOgoaHLcr214uVBe/Pvi1oTCJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10812
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

> Subject: Re: [PATCH] mfd: max8997: Simplify probe() and drop
> max8997_i2c_get_driver_data()
>=20
> On Sat, Aug 26, 2023 at 10:49:05AM +0100, Biju Das wrote:
> > Simplify probe() by using i2c_get_match_data() instead of
> > max8997_i2c_get_driver_data() for retrieving match data from OF/ID
> > tables.
>=20
> ...
>=20
> > -	max8997->type =3D max8997_i2c_get_driver_data(i2c, id);
> > +	max8997->type =3D (unsigned long)i2c_get_match_data(i2c);
>=20
> You need to be consistent inside your patches with the casting...

OK, will use uintptr_t for enum casting.

Cheers,
Biju
