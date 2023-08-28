Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4ED78AF4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjH1Ls7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjH1Lse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:48:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C702EA6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMCoXq5LfST+kdnTsfxMOXFpt/IgzWob98Vw8Uok/SKOS9lsJI8mSqHwj6BR6TmQlw0h4MdG0ZNzQ0pGgLHaKif14ms1vOQ0iN846TKZt0cA2ek9G+ITbrpTD9pE+srtuYuG269b2WPFRMFyLRTJ8QSWu6Np00puRI1uqzxIf5b8r4Ixv8YAS7eOKsLDxDTm4AWq+RJj05MRyuMe75GxEPtOdcqD+XBJ7I3ONrOau1WfiM6Rs2+mr9YNSwbtf1S6V0yS7nLZACNzytWLUDXJVzfovssyOLLNuL77Z5+i1LlGXvOrRg4YIa++l2Mz7qLvFiaR8ZXyYU53RCgaOhn+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FheHegs9U6NHDmB17JjX2iKRuS2qvP1CYgNj7ENdapQ=;
 b=Y275nG0LfXlnYPtx6vUO19XpdmbCJVAFc8IUxzeuKfPWhe3gvgGLjWmJgixmeuuJclg4T0afDY6ftEW4X4tAM4AdnzJfaj9q9rEkTs65W/+RpPatOQGolIO4w0qFB5n4a0kpex7jx5EhxoN4hPkeWVF7EvH1jl2QEHebxfwgY9EnowPDJjWQJBO1ntP5a3+DJ4uZ9/wwOMX/USVwIQM4NBMg/X3vbNdHA2Q8haKV5KYDrNws+ORJC0dn3dZncsn3KuUfoYxJdnqbaFxo2WlKwPdA3dI1jSY1GVxEAhlC2EJym+sCO/BSa3igEy77xlJVWr+a/ear11PQpjeWzdtI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FheHegs9U6NHDmB17JjX2iKRuS2qvP1CYgNj7ENdapQ=;
 b=ER9aVJo0wXwjkqBm3mjtnGxXAyw6NVZZo28oNpSFQlBnQuiWP71hYdPbamG4YgBwj11Meeb7GISWCXdNOGL4ngTNotiZVTsov0rqVuaS6X/3relTYUvbnk0kKinPuTHXWWmtL3A1Cj8mWPHi9/2fRJmt2KnVT6Xk9K7z0R4lBOk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10812.jpnprd01.prod.outlook.com (2603:1096:400:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:48:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:48:29 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Thread-Topic: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Thread-Index: AQHZ2MtAv7WVQfeUAE6cG+NpfA8UZa//j82AgAAJLzA=
Date:   Mon, 28 Aug 2023 11:48:28 +0000
Message-ID: <OS0PR01MB5922E9E9F406EF8F60C2A8C486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
 <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
In-Reply-To: <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10812:EE_
x-ms-office365-filtering-correlation-id: 7b6bcac5-980d-4003-e8a9-08dba7bcb246
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m4Fr020tkD3AC8swSUlhFfqlMuwTfgi+UT7l9thBfbN1vcQ4XygynMFRJRhPuO7/82q68I7/b9f/QK1L6MHLiO4BzeE2yf3hGjgw8wd6ag297ONxQqTY6Q+rF+EhS4HNz9ybZIZoZSZdtH6VZgfP5thyJIb8nONexvVIUwIzWWSUW8N6tPNQoDGKhrsKrSnQWViB6Zwo9/xqlkOxR1rR7X4irXW6/fDVEltjrupZiesDBLw6Td2OIJ6M/h8ESVpEOWnjA+KZgwx6xERFo3jAWc6w/YrUrtBf7qRoiyKZP8nQ7hA6De+19QqneGnRLcFupzsMh2K5NFTFe3GDqm9RRsawtXi+L7dYdQOASDQqwVA9wYNGhqoY+8F0R0QDBSVrgPipoqWdu3Oi8n/3w9uMugvKBNoVFw5xu45iV1pIXm4X459D9jpZDOjh8WbeFj2zYdSj/o07VxuOcwAImQ4dZhH1B8NGQJhRVp5QN8/NezbY5VJiuTq4Ev7ZQxghQvqZWunDkgtdGFE9hvr4vqQsE/oTbIvQmhDOCXUZJ8dSBpcd0HIiz972pM+aYXeHnuxAsRbWHRApZcVnBuULV0VIb6vLc2OwdPZB4NFWsyOOMZEOz72j9GnKZqtKbBxo2TnZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(2906002)(6916009)(54906003)(66946007)(64756008)(66446008)(33656002)(66476007)(66556008)(316002)(76116006)(5660300002)(52536014)(7416002)(41300700001)(26005)(6506007)(7696005)(9686003)(4744005)(55016003)(38070700005)(122000001)(38100700002)(478600001)(71200400001)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rqPVF4Gdg6Nf6dopomj+eRYPLR2UvcF0ArvtlmyYfHZTudqzdnaOuG8OUU2w?=
 =?us-ascii?Q?hrI8aWo0HodzRtFpEIuZarjKf5bEUYvHXlIbUP+R+RIB5GbTNf5ySaQABMbF?=
 =?us-ascii?Q?M/zG6ML7yllerJNPgeHEhn5f2Xut1+LgSECU8JWKfMy6OeV2xX9mNx/SBXo1?=
 =?us-ascii?Q?MIakbyXAbN4T4gG0GzYvqw43CCtFFoVx1/ZgPz+IDD8bYGpXX6+XlBJeSrW9?=
 =?us-ascii?Q?sychmp89lzAvVjfIIH/LQ6DrTgN+Q3Sk7GR1+VUtuvqXi/8/tJ/CsSp7hyHZ?=
 =?us-ascii?Q?nTcADo5J5auVro6qcgVfVZKElNAXjTtjbPcFLFSxokCt4nvbqemhEPEZSHXN?=
 =?us-ascii?Q?Q+hfK0KdLaLokEq9JQoUFwvdgw/qEGcZSbgMOrCmOB/N17XKHpjJZtRYDFYv?=
 =?us-ascii?Q?VLf3ShbcYiyUFI8oUJ79MdPVNu8PvbHXDFpNymX77+5y14+66xMn766o2j+g?=
 =?us-ascii?Q?KDmFXDL0SCy8WYxtOfeooqiYgZeljcopodeEjwPkzDbA9qs9R1M7jm1k88VX?=
 =?us-ascii?Q?DyIni6OHEWTYXXMIPRh6bTaFa54EmLWyhzOgRzWt1JSAMaonjntiXgHjz3ro?=
 =?us-ascii?Q?kCru2mWqSh9tjH+1MIv3pg8O+kBg0w92+lXL4eKblTourOVGXen3Spsg6wKy?=
 =?us-ascii?Q?Ip3pYPEfGdIX6QClhJQ++1bVEGQXGSJfvVupCJU0tofynGH5vQ0U3oC5TANw?=
 =?us-ascii?Q?aOdHF5V8p8eoRCwR7U4U8kThZtq6Xfmc2am6jDB3D1HotKMy6bxYqH31R0cM?=
 =?us-ascii?Q?XdKLnvWSMhzM4TxtgaISQzVts+eYGrEBfDQ2YRT6IJeZPZxl60FJdNN+dXwC?=
 =?us-ascii?Q?UYxhY2S0L5Xp0vMD8gUspfXnOjWzHB8Z1OGwjL6IW1UCQlAdjHb7voZIh0O5?=
 =?us-ascii?Q?40JYODwhLthlemcImK/iO407IDUrp6GLz8JthvFykZ2C3KXkRbx1oI1WY1j+?=
 =?us-ascii?Q?q9mC0OXMC9kHiy33Qcs7qgQ9RyWrwZ1+2i+izAdl9KQ5MidYkydDpdI60CV0?=
 =?us-ascii?Q?bveI8JL6WO71CTmYMO5KXXxbszbOcSRClG3q54NRGva+ulGv/T/+brV+IJdc?=
 =?us-ascii?Q?ICTQPEN7Us/mtqt/lmbEE3nCroFCch+LNitUlEtIzFj/f6PSWYbw26sHSDlO?=
 =?us-ascii?Q?gGxiMFRVcFOFxJDk2V8D3v3slqtBF1aFFBzhqSfbxjUdVyG3r14qfmJpwyNW?=
 =?us-ascii?Q?FSbnNxQ3p/vuApFwnqEC8QJn4amvvIN7wl7bb23aPY4opb8yHDpKlh/AoMN9?=
 =?us-ascii?Q?hQhPDdzEPYhufp7NwatGqINfVzb11QtnRnbmxlFkcrdTLnNb1mIi6Evta0x+?=
 =?us-ascii?Q?980QIuSBCBWxqYfovKq/kB3M0MtOBt7aFVCMOTRu46z4IC1U2b08KWIfBJq3?=
 =?us-ascii?Q?Yht/0qsSNB+ew42o6iPcHvgWdqN42+TK9l1n2+M7SXn5Fh7rEp12cPgK+oIj?=
 =?us-ascii?Q?n7CYjRmpIzvYmAWj83kZi2T6uK9Zq8yH+MK0g3rorAjjI8S7FjhxCYtgO+Rk?=
 =?us-ascii?Q?5bweKoyARsKwsYUb0Hl63v3dNjWH/5Z7wWli/m9iT7HAulJCRaZ2lu/UjOQc?=
 =?us-ascii?Q?Rcy6narHVIHEmMjqVSsU5KBgn/LKJP0YPESi6pSabEysA1h14MhQJIfBLeD6?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6bcac5-980d-4003-e8a9-08dba7bcb246
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:48:28.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYNIhAUib2HA4zZZyrkMBrX/mKHx+9ymkJ7V4NVXv+PWSNG7FJ129f5r3g3cHiw4itg4ZSRb95E79AfYxuvGzoIXGbmhjcBKw+jRf0IN2OQ=
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


> Subject: Re: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
>=20
> On Sun, Aug 27, 2023 at 10:45:36AM +0100, Biju Das wrote:
> > Simplify probe() by replacing of_match_node() and i2c_match_id() with
> > i2c_get_match_data().
>=20
> ...
>=20
> > +	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));
>=20
> You (potentially) drop const qualifier here. It's not good and it's not
> explained in the commit message why.

dev_set_drvdata() needs non-const void*, otherwise I get warning.
The original code also use this cast. That is the reason it is not
explained in commit message.

Cheers,
Biju

