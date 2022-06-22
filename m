Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F8C554361
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 09:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349948AbiFVGc1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 02:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiFVGc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 02:32:26 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0722B2F64A;
        Tue, 21 Jun 2022 23:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655879543; x=1687415543;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZDPlFOi/tTfN5lGFpUD5z3ZN/w2Vsbz0sFcmScE2tsc=;
  b=JOfkqckiLQkj0+sAeebEp2mnEOVezqGhe3k8eu5usguhrnWrSu9Myr45
   Ku4XAjaM4QssHZ3B6HXbwskWcEAXzs13JDUhJNVFwBZw1QTtK1RGjda5/
   GkML2vXyYRrpTBVYOPtnEiDod/TLuSf94/iaUNZTZ245kmCUC8eSoCSBS
   q0SAAnOh+Z19DN6JZqQ/zpHqYau422wDHs6Ae8uO7x6ohFzZrKNew/0ox
   87UNz4Y1a1gTfV2+X9TsgyM8Z7a7ClcKXh01NfIqpvATSCtCdzqizi7yd
   mbl4zML/Ju6r/8wzLk9vWzhbYh86dymc1OPSDjiM1y3c6YMI7ucsPhlco
   w==;
X-IronPort-AV: E=Sophos;i="5.92,211,1650902400"; 
   d="scan'208";a="203794113"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2022 14:32:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgqqmyuBo+Dl3NAhYjmkYZXEMxWEyVz1/x/OiHuX3cZ+pX5PMdilh1BSuL9hBy+3I+cQ7QB7CzWb01QRhnhEAXOd79JzxPToZUI6+UNkaWn9OQjJn3aMKGRlABh4oBmVe07dfhBFrY+p+aa4jESxhpLB026ncd5wV/YjnT12s70bs563y7ZZjvBUzVF/ZdsL3KO1RZUuDQGJogVkNO/ocAws0VmkkXIgICxVoeYfQeRnCpkN0Fl+0XUC3TACWGzeLCYRw1jXkpeNAcvgCJjeqgD8BkQXsFUmS/LjSQOaaDGFoezWwINhAAwep0WC/bOtQHMYgewl6j2/oWXl1Jmu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7MwqTt4Yr7tY6GobCAi5VbVxvsCgMd7D/TjzOiOYqc=;
 b=FYVe55C2R0Dna2EegSVHAsor03xSGfOYuQbQDIyY5/mVZeEP26UzaHmyHlVTFQGSA+ASRKnRg4P1brf+E7NOGnbtb4NvuEbTI4TQREdD9jtb/ChDDxTXqj6wImrZ/ZwoumT7LB6M1v+I3SyNOSkP0zFcaIRUMU4XcZKXsKDOscyDmt+Dzvsg5OyhR3Goo8PoUuwJBo8+6G43YK496ZkPInIdz4+oKS/Z/tebbiehrTsNiapapepBnFccDuJGlfrhwmgsEDTJyq9jDTUE0MAMRrcfSRn391FUBr8aKq4gDEDV2Xl9qnFVoGOEpR0FVj0HDpFZEDwG0FPovPCYV5kk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7MwqTt4Yr7tY6GobCAi5VbVxvsCgMd7D/TjzOiOYqc=;
 b=vbj1TqMvIZ62p2tyTJdk/MeTXB2/G/oh03wT40SHlp75K+QqKDT04aZ0d8ZeHagJ9qSZEPxki/fOEgnOYlj6EZZF9ppqSMVEC/+qD2KBBX+llmg6cbpdVcYXG54Ppo+eKWRnfitVhDet+zNNZwKDwSBH4+XcFw6xJv5YBvPQgbg=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 SN6PR04MB5071.namprd04.prod.outlook.com (2603:10b6:805:9c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.18; Wed, 22 Jun 2022 06:32:21 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31%7]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 06:32:21 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Topic: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Index: AQHYhYGQfGepPuvwykC+XkcnFWdRYa1a+Apg
Date:   Wed, 22 Jun 2022 06:32:20 +0000
Message-ID: <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
In-Reply-To: <YrHgOptQ56woMAeO@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9110e48-a78f-4716-24d4-08da5418f608
x-ms-traffictypediagnostic: SN6PR04MB5071:EE_
x-microsoft-antispam-prvs: <SN6PR04MB50712E3EE19AD2EB1AEA69D8FCB29@SN6PR04MB5071.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaBroImoLY/Jmes5Z1ZR9tT+C71LviAKiA5WJJVFn9PdQjpiJWJWMUByRkD9IuIggnVig/22BUYGLLY+7ajSrJ5kMLqjGy9hvgXZIb2RHhGeftHKaO1KS13cjtqTUXk+0xlPbB+3TMtz2yo7yHCEUSl53xi1fQGDHkXCgRwA47z0LdtO8tn8vc2zdmeWy8BoVXbOBTY6U1bPF+UsSesfkL6IUmxFMdh4exlClvB9gC0HnN43uASK0KBeMiFxDyvdm5IViYovZEX2V7SlyZ/Z8jIwjza7bY6BkytUocq+ToJs7xiZyS63IM+ngYf9XJ08W/9Pft6OGvKn1W7g9xpSS+37XfTSZL0D51tkc46wUl589n5bVOrSAtxmxj6aElKlAeQ9YpydODmc9EamDhcgK7pBNK0L5qiKHgw9F/8TOQYLBUfVJYb2mM0vcZKNnDK1/HNqtq6eAjUjiifGPWNbSOv4Uowbwn7TtuKwZxVPDzh3yHpUMuqe1b27Bj3ta/3lm4dgGOtr6XQGo0yWbqMPCR0Dor9YAJra1trh7KwNkwoJoEBVxuzv5hEwh/90KLGkcAznWVgcoXarmpIaYwHkSTsHMAj/CFF49Ld5AF+gZe3wP4T9AunSCFr+KgkisqgZT4Y1WHpcycobpaT6ZtCeJHmT2TKSymMv6ccC1DxtYSqRYABHmRTJd5sxSwF0WrNUpys5DSH9fUTImrRnxzjcjXk4wzp6IKP4ZFokV++5BXBE32chYTZOFCmaRpHCCLKDVAV07Wj+bqbFqy07qYUmWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(316002)(38100700002)(33656002)(86362001)(5660300002)(478600001)(26005)(52536014)(38070700005)(7416002)(2906002)(82960400001)(122000001)(55016003)(6506007)(4326008)(54906003)(8936002)(66556008)(71200400001)(66476007)(186003)(8676002)(7696005)(83380400001)(66946007)(66446008)(41300700001)(64756008)(76116006)(9686003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I++P+/k5ddofaRdcbIs8OEPQKJWrMfS84JU7PPUY+oFpwfQCI55MeqyRZWbS?=
 =?us-ascii?Q?DUjm0YbRyW4AxW6+GO2cGJcZRzYhnVQk2cwz4TExhfJX8SC44TctXMKt2nPg?=
 =?us-ascii?Q?Yv3RZIPNQwyXhEQiCsOppsVtJGzJBPkFA3XOZJ0jS9SbCULMdydamNwMxo02?=
 =?us-ascii?Q?oQTfqfbhNshYWAIw9FyU3nG0FcrMDwiF12TZdc4p55ehX8172NYN2N4Q/xsj?=
 =?us-ascii?Q?o4vTDg3fSk97wC8gckX6svLAXaTyPjKSqeTqQfITW4yOcAtmCBfXnipaBwib?=
 =?us-ascii?Q?3k/7tz8kNCPnX+Hcpts2ZrPDnCwVy6qDrwvczFbTOv0MxSDOBgv2gorbAzo7?=
 =?us-ascii?Q?O1/QHd8fB9U+kxXesXb3+gi6AZXMx8zT4Nw+B2N+OMnkWkt+OZmmO1g3WxEB?=
 =?us-ascii?Q?6L/DOaxKE8ypRm137gHRa7pODPSzK9jvEFm+PutrHKUzJS1shOyKPAR0u3zH?=
 =?us-ascii?Q?avs3IHH5QyrjxBReRqpOS3EzOajJKC7yGr3o3+eWldVb5dlS1q9v5mK529ZZ?=
 =?us-ascii?Q?UAskiWq/xWMisQg6ZECWl2A3+T87o3GcgQxHCWmjjH8Lx1mA6ObEC4IOP8ii?=
 =?us-ascii?Q?nlGGTdzXpYwUgwOyqXfqYwrOSNTCReVmupejr1cNwuzrM0zt9f66Lultr7rr?=
 =?us-ascii?Q?PI5Q9t6ZsYGqMn36O+QBQH4uZiPdo3S0s3O6XUzroz9FvtGCRt6LzdQIREw7?=
 =?us-ascii?Q?iF8SYltvj70zDQLklbtsFUdBJOzA13GCNviH8T3YDiItFEarzxNS2Yft5/5U?=
 =?us-ascii?Q?oGsJJOXneAhu8L/34I/yGJl2fCqDXDtJ8fE1wY8MM1jX8rUczuhrWZRiOktv?=
 =?us-ascii?Q?F/Qliz9nbdUQFx0Ovr1WftJx3I3zbYSFV9HdVzgGAbT/efl4lFZDMpzz4EDP?=
 =?us-ascii?Q?JRuhMsuTL8unTEwP0H5ixEGw94OPXDq000rzhZ6tXU4XUHVVCr5v5Jx6Q6pc?=
 =?us-ascii?Q?9wrgRbqhj0+cvVYEfvs6JwR3l5OMrWK+rSTdsnu+pxF27T5eHiOjEpPF3+XY?=
 =?us-ascii?Q?wABon9I2qFEHxJnbUE7sF1ne7BOYbV6xJYcI2vFXCqKsYprdJa47zNdjsv4i?=
 =?us-ascii?Q?QnEDQqx8x2ExeqeJhPDDuw/aAC/4/uWBriKJAaBrGcuydWy138GgY8NhC6+E?=
 =?us-ascii?Q?IsKLg9WhpbgT4UlBVqsDNVRx7WUYOqHali5tMyny9RlOPqsAC/L2dmBkR7eS?=
 =?us-ascii?Q?sJJo2m/zp0X2AbPRkeHUu7A4VRhlwYcONuQXKEUFY0sVPuFBI84eq0Pmxl5m?=
 =?us-ascii?Q?vJCDE2ez641aGJEdhgukkPyenwUC+RzCJ4Zmafjnzc0YTCblZybG0pKW+Ln2?=
 =?us-ascii?Q?WGZoR33HJmkyZnjadCC5mgaJxbf0ZdeqIiQeXlX9PbOKpsDLX2MPZNLpu+V3?=
 =?us-ascii?Q?uBXZ2YO5qZh3WPa8o+mJzEwAJoAsKFtgi62NcgHqUK6qCzZf/ttaeIGMjVaL?=
 =?us-ascii?Q?NZqLN0+OumBOy1SUfpUHT1KtTM6GlgN4RAzeZfS88FcAawXgwXZL5OpNGvGS?=
 =?us-ascii?Q?9RYwYiYloErd8DJM+WakoKG6MceQ9qGKUjWD3hzQ9zOclOVL4d2hYh+SaYm7?=
 =?us-ascii?Q?q7xE4qkkSsX6Pe2cyea5vzcbj3A4nRVlub/BUjMHjbHQntuRvxNzNywMqRJ5?=
 =?us-ascii?Q?EtXG3FVYffyWZN2y+4ZGJGgkDLKsc0/oRqIJxEaAei6XhqdEIysTHGsf1kdf?=
 =?us-ascii?Q?38hC4H9Felv9qJsVbtOyStadZ1kE6ScjO6vvnTszzD0fYrsjEfo44FJMc6XD?=
 =?us-ascii?Q?Qpv0CPay1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9110e48-a78f-4716-24d4-08da5418f608
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 06:32:20.9554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jc4OBpc03/sq7gubYEpOKhZgy4nCEMlfvcdd1GFT/Yw84lK3G+FwIWMudwzy1QVsURGtcOu0C7pBVtiuqDj+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5071
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Hi Shimoda-san, Geert,
>=20
> On Fri, Jun 03, 2022 at 08:05:24PM +0900, Yoshihiro Shimoda wrote:
> > Enable UFS device for R-Car S4-8 Spider CPU board.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> With my firmware, the manual setup of the clock in the bootloader is stil=
l
> needed. So, yes, I agree we should wait with this patch until we have a b=
etter
> way to deal with the clock.
>=20
> Other than that, the patches give me SCSI disks I can work with (partitio=
n,
> read, write). There are a few initial errors, though:
>=20
> [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3
> for idn 1 failed, index 0, err =3D 253
> [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3
> for idn 1 failed, index 0, err =3D 253
> [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3
> for idn 1 failed, index 0, err =3D 253
> [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry: quer=
y
> attribute, idn 1, failed with error 253 after 3 retires
Should be interesting to find out who is trying to read an undefined (reser=
ved) attribute in your system.

Thanks,
Avri
>=20
> (A patch for the typo in the last line has already been sent)
>=20
> But after that, everything looks fine on first testing. So, for the
> patches:
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Happy hacking!

