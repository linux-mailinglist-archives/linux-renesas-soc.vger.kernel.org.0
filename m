Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D55278AE9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjH1LSS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjH1LSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:18:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1ABCA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwJE5jsVxnWXBoXtdEFjsAmRMZj5wcoD0lUTqVtZTC5RAUIF515eeNj/P/UH2eldJ1+PSks4lvJMxiKbogFlCbAaBHfprw+MG3Wf9un3y0Lnyst4xiFMReg9fiCG6xazXUpD+V3u62W7RcULlOltAa3h+qnuv+SjZSIcnNm+qo9dgMHKKk7o7Aqe9Ec5x9aQ8UZTBs6ZdsllE1TxIsnUhhfwriq66i5eqiX02dOBgCcn5onCyVbkSaW4Uy0F6o0TbCDjFDy2c3c+QJIzYxibPQWIFX+ONR8UGPJ3vqqXg9SsIQnt7Rne5SAlXlhAyL3JOokYbvdd0yq2w+pN7c2ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCgfsLCpZwN1pSuKP5Bz4Dx6M9oK65PWBA29iqWy5XU=;
 b=S/SoCd1ojW794Zlg38e+rK0ILBX2vAOGc0XXSByEnIB0DM5HcXJtF1DacjtOuPAURDQkphJYf9iQLuOVksn0Wh84qGO24zN+WtVT7BSsmTy56xWRxV1tn1mBLIDoJhGo6bgy1nIazTqwsraeWV5IyhPvQF7NtfbrdvWLWQCT1CrtcYCWRG+8lQRmQewRc1pPTKpQCTMunYyk+5KohnpFXx/USfJSatiHSGZ2NB4DKzoJGexi6og2VFuaaZ1IWjke5zpaowEAyFhHAgPxVRnagsLtxpZgB7HNmkLsT6ZqGS4pQaGBwN1jniFFQUWEeD0j/JM00EqRsMVIMhN/zhS0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCgfsLCpZwN1pSuKP5Bz4Dx6M9oK65PWBA29iqWy5XU=;
 b=Kv+C7bSgfx7gV+HUfqUJiMCaOPipGcPtG/5ppDG5J3Zuuf4lddh8c9HWOUJYj+9lpDh3Zjk66uO1Q458DCzUVV5q+Wp7SE6632TeevamgETbgSkkwrthONrLhF8EVKMy3XGThHCNQ7P1ih5dkPNIrYLyaOD/IQA4AjLoVKi+eGg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8628.jpnprd01.prod.outlook.com (2603:1096:400:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:18:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:18:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] regulator: pv880x0: Simplify probe()
Thread-Topic: [PATCH] regulator: pv880x0: Simplify probe()
Thread-Index: AQHZ2BNd0w1iNDqfgka3+zX5KjDVZq//cUKAgAAgr+A=
Date:   Mon, 28 Aug 2023 11:18:02 +0000
Message-ID: <OS0PR01MB592224A36285D1E6B441E3BB86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826114919.73897-1-biju.das.jz@bp.renesas.com>
 <ZOxmj4A5gx2Vra3L@smile.fi.intel.com>
In-Reply-To: <ZOxmj4A5gx2Vra3L@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8628:EE_
x-ms-office365-filtering-correlation-id: c5617acd-8afb-4ac1-4372-08dba7b8716f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhRI3+LAsz+2SXzQncChCfmQjJICziUdGW6ithakkiqgRkJdz5647Rt/PEXUApYKVrzpml8Xm09coAmTdnfg1meZY71Hxv3Q6Hp2oVh2jkQ08GpFjf7L9ShCq3DG4jZ6A0PvSRBZ+XwklPSRxfLPNIgTsHQk62F0PyLpEpmH1H+BYQ3m5goA+vuSs0ZHA9k5u0YRA/2UcKqT2C6SscNOj4sOqFbijwphna+cN7fCoFYaJpeOJH86EuLFUTNKtC1ejN7tZ8VGPjw9d64Csh0qGUw5jNJ7belTMBQ3dYQ3a0CXCgkhPqEuf4jNf+QcnvgIpLFJaddgtLNyxQLkkfqqwyWPCnuMyhn+Ln6mO9UNqZuFndYI5trTP4fAytlUDeQULpCITa8vkTKG8Tt8KcoV/FccuiWpXB0mWy4FuLxbNmzu2yUUOiDT8oOqQqW/LYLHiTaUSDSTu+g81jYnjEFzdRpSSGQxOKB9OpYFAH1eBhVdnaEQp+sANAndiDvVLAUdiT8jzP5HEeP673CIcSuHUlSS87Ok/lHQ1gg9nzB5PgclDfB2iw3hBfRS1tk1yVw62WHzIvYXw2XM+G63z8yBYietUGvfxywgMPtPYVFtuCLJAfcbA/rHRzFZrb1lP9MN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(366004)(346002)(186009)(1800799009)(451199024)(2906002)(5660300002)(4326008)(52536014)(38100700002)(38070700005)(122000001)(86362001)(55016003)(478600001)(83380400001)(33656002)(71200400001)(26005)(6506007)(7696005)(76116006)(9686003)(66556008)(66476007)(64756008)(316002)(66446008)(54906003)(66946007)(6916009)(8936002)(41300700001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bfmBCI4UuHTrece/7thZE9V5wKOK5pl0LcJ7/ot48xh0Hfw5q/IYH+T3bVaU?=
 =?us-ascii?Q?2q91ZrUw2bCO+HZzTJv762yBuqpjvuLvMZnWTnDaAFr0N27jhNk6Rsxt3Ye0?=
 =?us-ascii?Q?3odteLtKN0qceZc2CvgYsbUVNoyohKF0cihW3mbx+NbiDaf7g6QW9pomTDOL?=
 =?us-ascii?Q?DYCaO3ZfHPLbw8EC65CMnTGrnDs1SOdWKOn1jb+5tQBK8I6pIgN+z/Gj7Eex?=
 =?us-ascii?Q?SuE0abM9Fiuh/7E9bCU5FMEU8cEQtxb98gFJaqvcHS0cRUKYR5g/Yu8lsc7a?=
 =?us-ascii?Q?5pTR0ZpK0TUoYy4HKtZDE+rBKoomEBZoR+Swo71DTEc18/9PmLA6QegqgmG1?=
 =?us-ascii?Q?BZLNA/REOSeGRA9Rqn2z4EFpNuJdCx9hi+EcwzSf4p7XimOOrJ1kfkWgKhk/?=
 =?us-ascii?Q?BSs82+qombdnXDIfoOobEVdtOn9Ck5Z+AEkdNNzB+bjMjlXsFE0MwKye5nP4?=
 =?us-ascii?Q?9xCMOqzI57UvxVs+eaPjAdEe/ZYBf0yZI+NRyeOgd1wPr3J6q1FazME6mAGy?=
 =?us-ascii?Q?9FuXNrmqVcLKYv3edpgTnXGuIzdBq55Doji+EhfbjfBIWlVQ3Nu5xKZzV6gV?=
 =?us-ascii?Q?hs3Cm6nkN8sJklDjVvEALXfN45fFY1X1XLdVE5Mso/iQydxoZC6GgoJ+Bo+f?=
 =?us-ascii?Q?OfjdHzF0itzFAXwArC/Rk64+8ucN8JgHNB6SWac1ANEXuTDSf6hxvXe9suER?=
 =?us-ascii?Q?uVtJIRI7hbi1WsN7j2AObJOq75EWBwuhLDGNcj9+SrLdFQ301xfsnDeIj7RW?=
 =?us-ascii?Q?up7XRbpVuaHfrDnPyVauNOvOm0TveTIqVl8SHidrzHqnd5wcJZkM8KNRSxvK?=
 =?us-ascii?Q?aCzR3wxm/B45icy5pgfw23/Zodi2xFWwRIAONZSiZlW9HitXvB61pXdWeDfY?=
 =?us-ascii?Q?73qgSQesv7nsKA8YQklXt2jbsHAbXCFeLqvdd1QdUVQRAUi76krRpVsTuvk3?=
 =?us-ascii?Q?f/VVRvcCtPbwiER6Asmpv5alhHmPDVMsr6aoJJJfLJEJ+cNixrQMF2bNmCOl?=
 =?us-ascii?Q?WxFo2aAucqEFx41rA2FmLUR9Wb2tmUmyc8vUDQV1QtRON17FhP5XXtSfHvYi?=
 =?us-ascii?Q?jJrCR/MyMrdvBCiIQMtHt4h1apFNMH8B5QJUzJL6VPysg7JuZQIp1xm+QGPR?=
 =?us-ascii?Q?oHQ1EoK2yainTwe5lvyOM/+9z0FojDtf4wD12nuJZMFk3JQhSLdNpjI3lSEP?=
 =?us-ascii?Q?Z9E+6v731SpPJSg17bJaCT70Kj14Kuf1ONWDZUbLsEyOzuSz0t22bK9jUo8f?=
 =?us-ascii?Q?MDvOixPuaFoDtYzNy5vCWydrJWtWzTBbdebUzegu4DEJv5YKkoHXWqDV9SGx?=
 =?us-ascii?Q?WVJMVbTMwDqgR4C8wFcPFuLhGoYOv0FDjT4Mp2DZqjYRfdvuZWLBrpiyCG+C?=
 =?us-ascii?Q?Y4o6cpWx8HheMAHjKGPA5L746RjomxvK6pXIVvKVNoH53pAkr8TD/AWPj/bL?=
 =?us-ascii?Q?17hKgjLDVwGRsXDKo2EnQTrp48hyXIc09HwU3RTvG0dE8rvLiTvCfg5bCKOi?=
 =?us-ascii?Q?TxH8SBMU1Sl1ZPnYgReZaPTnmxFurl6O9TDaJJuXtbdYuKq5d3tXcXA+J0GN?=
 =?us-ascii?Q?TXWLzBffdDNL7nXrnvX2czJXFQmodRLMjinCOGgnrebVRa7hwW1+OWXD0GB7?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5617acd-8afb-4ac1-4372-08dba7b8716f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:18:02.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybYs1lowYM8E1cMF2zO5nx49SOBMO90doR+E1g8eaqDzZzUK8Zl/SD6qgFNKMi2pLLjfCTzMMlpQjZKKLUYkNg3jqr86WCHkpfkjwexfmwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8628
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH] regulator: pv880x0: Simplify probe()
>=20
> On Sat, Aug 26, 2023 at 12:49:19PM +0100, Biju Das wrote:
> > Replace pv88080_types->pv88080_compatible_regmap in OF/ID tables and
> > simplify the probe() by replacing of_match_node() and ID lookup for
> > retrieving match data by i2c_get_match_data(). After this there is no
> > user of enum pv88080_types. So drop it.
>=20
> ...
>=20
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id pv88080_dt_ids[] =3D {
> > -	{ .compatible =3D "pvs,pv88080",    .data =3D (void *)TYPE_PV88080_AA=
 },
> > -	{ .compatible =3D "pvs,pv88080-aa", .data =3D (void *)TYPE_PV88080_AA=
 },
> > -	{ .compatible =3D "pvs,pv88080-ba", .data =3D (void *)TYPE_PV88080_BA=
 },
> > +	{ .compatible =3D "pvs,pv88080",    .data =3D &pv88080_aa_regs },
> > +	{ .compatible =3D "pvs,pv88080-aa", .data =3D &pv88080_aa_regs  },
> > +	{ .compatible =3D "pvs,pv88080-ba", .data =3D &pv88080_ba_regs },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, pv88080_dt_ids);  #endif
>=20
> With this patch it makes sense to get rid of ugly ifdeffery, correct head=
er
> inclusions (if needed) and Kconfig.
>=20
> See similar patches
> $ git log --no-merges --grep "Make use of device properties"

OK, I will have a look.

>=20
> > +static const struct i2c_device_id pv88080_i2c_id[] =3D {
> > +	{ "pv88080",    (kernel_ulong_t)&pv88080_aa_regs },
> > +	{ "pv88080-aa", (kernel_ulong_t)&pv88080_aa_regs },
> > +	{ "pv88080-ba", (kernel_ulong_t)&pv88080_ba_regs },
>=20
> > +	{},
>=20
> Please, remove trailing comma in the terminator entry. Same you can do fo=
r
> other ID tables and in other patches you prepared.
OK.

>=20
> > +};
>=20
> ...
>=20
> > -static const struct i2c_device_id pv88080_i2c_id[] =3D {
> > -	{ "pv88080",    TYPE_PV88080_AA },
> > -	{ "pv88080-aa", TYPE_PV88080_AA },
> > -	{ "pv88080-ba", TYPE_PV88080_BA },
> > -	{},
> > -};
> > -MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
> > -
>=20
> Why do you move this one up? Shouldn't it be other way around, i.e. movin=
g
> the other closer to its user, namely here?

Agreed.

Cheers,
Biju
>=20

