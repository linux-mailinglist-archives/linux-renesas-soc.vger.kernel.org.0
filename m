Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C021B6E079E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Apr 2023 09:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjDMHWw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Apr 2023 03:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDMHWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Apr 2023 03:22:50 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B22059FF;
        Thu, 13 Apr 2023 00:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEv4I1pNmAOKV2rwCdZJlwayKUJaOPLe2Mqg9cH3sMMDxCM8A3F04bV1X1Z3dW+D83z9mgW2MDhGaUrmWMv9UnJOlq1o5VckaFs3YLy4mUnbkjgpOMNGc4JaZ1dkP//KYP9qY3TXo1cb9cmMscfFZvVQLBtMWqeml02id+NQzNxWr6tcaRfBj/wfl46d43ryLGuSzQdoGpnrpX57fwJevAqsGzEKDPUGAt2/sxlQFy/Sp1uWVDqjwCMuZ0EYpYRt+45Kw1n2XeYkdj2RX6gupbHOzGg4PVUCxx8uHjIoKF+9fuAVCcYb3lHj9pxTskozPZdmU4+LYdBIuIXh67iqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJB+WJNY+4iKrT6dS0jnYNH4vH1Yy+LimSo06+nY5q8=;
 b=KfOKznWZYGn0/IpsbfGUe7D+fsJ29wnWBtCgGKiW0CZ9Ld958hMzdASkmio8xBIMCdwQp5+SBUnMCLGYX7CcfSuZkNRTDMqX9zaxEcz0tPvMn5AUu9IPCU795ei0UbBzHKEUj9KRczr1rjYxGT0E4sEaCahYVjTb234GyjFplja7mJPqU9cIDwhK85re/eI40Dzyk6UfeFFiCCaaOECWU2a7szEQ9kRMXMGfknKjBKZIQuNXHn4Bt6x9N65+co/Y3bJ0bEhWiTNDcFHmQngB4eVetGlL9LVY2aXcR7eTnwntiz7f8njGmJSsJLJK//N6f3N0O2BsFWBNhQL0eEBJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJB+WJNY+4iKrT6dS0jnYNH4vH1Yy+LimSo06+nY5q8=;
 b=IU/uK5L+vYayFevIUaehhl56mflcsx1l3YmFd8JyMWgU16Kl5Mb6Dhz9U7OZ48V4LiO4BfEbzyGqsAIO9oGdBBkkuj6d8mdcEnTJPdY1I95xgJTbSI+9sMvJR8EpHxPYaW1fy1YPi38o4WsW7gNx4ZCnw8i6rSTYY13E9JalUVw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11483.jpnprd01.prod.outlook.com (2603:1096:400:3dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Thu, 13 Apr
 2023 07:22:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 07:22:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dan Carpenter <error27@gmail.com>
CC:     "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZZtUKenNCkns3JkyXtPHgRXRPcK8lz4CAgABvYgCAAnnzAIAAKVDA
Date:   Thu, 13 Apr 2023 07:22:39 +0000
Message-ID: <OS0PR01MB5922C0F4AD089E6E015B34AB86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
 <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
 <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <dcae7c28-89b5-4f3f-b13b-1a1dc5779d1c@kili.mountain>
In-Reply-To: <dcae7c28-89b5-4f3f-b13b-1a1dc5779d1c@kili.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11483:EE_
x-ms-office365-filtering-correlation-id: fcee6d30-ab09-4919-fc0d-08db3befdcf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BC9Lmx4kbtk7ecXzEL2CfuMHn2x6M/pHNa/zMsUVfz6jkhiLf2KJU+22oBGmrRG3yPYlljQjq+sdb/XOxhSCrXdZAMcRyd2AO8L9wrgKwf5KiW+oFEcHOX6Ff3P0UJwYlMyveK9G3VuNT3cPzusJYDpzYK+QqaQIE2053gEQ8QlyBJNdc7yeyPcSwsZRJTgGE53MwgYp8x8GP2/gfDzf/pFzHTC0RGljdalmYg3sk0lw99vbJpaIl2W5P4Io7bi+OJP8kvzGnOReY2+cY1u/vcw0g8Gd+779BWqWIz8MHxSCpuWeTLMtBswK4xP9s7c0o7PVgOgT3hLU6UOsM8WgzwAf3l9tml87UJH/ofrs6jKC/a+PMW++ZZcWbF4DbumCwW2KSoi+S3J7du2QCaUsUPOSbHjKeocIQpzPRrjzuFApjwHxTTGAmgDkBDSWEHjQbrSn0MxyzItKzCxbcin73LvS35NhKLXtBUTPiQbWElrYS4zAWjVvotYjQwilqnzFNzEDT/VHWh2nI3JqV9SxpDCyjTkE4kySS/hVQlYpxVSPaulQSAXrAkJf2Fklb/vsSRrgH/2ODcL0grGkj2MghBmGcRaYhr8+Nr66v3cOUkk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(5660300002)(38100700002)(2906002)(38070700005)(52536014)(316002)(55016003)(86362001)(8676002)(8936002)(4326008)(66476007)(66446008)(122000001)(66556008)(41300700001)(6916009)(64756008)(33656002)(66946007)(966005)(76116006)(83380400001)(54906003)(186003)(26005)(6506007)(53546011)(9686003)(478600001)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yrHSj8yjPmJWcBumtjjgKEtfi5Z0VBsWpWrVEYeHS7E8yN6gzABiL/MSScrQ?=
 =?us-ascii?Q?ppdFkS+X64BIKEg0PhaInedI/62l3sfvOxk+mhsnF4VeW47QWq1bQzOK1Yva?=
 =?us-ascii?Q?otGv8LQeQuElm0teWbT6fOCGBMccWTD+OFaBdaPblL3k60W7rRZr49iQfr9J?=
 =?us-ascii?Q?txWsIr0ZKMVTNmk4rCiJNRMaIJTRfg4k7LWMyBzHxRTRn7/96L8xZwuOjKUX?=
 =?us-ascii?Q?sXlGa3nUH47bl/q5jJFX03StxAtXYEZUcA48UVBNCWSXuYvDPFW9yH11CapP?=
 =?us-ascii?Q?47WCVu3Mt2B+eq9Iw0dNLrPw6RPoGTXO8DAr5pPY8zoCF98NzdJSZ0jtdNwg?=
 =?us-ascii?Q?Cw3VNX7LHtc/rNNNg4t1vy6SUzc+uuz8E4/crP4DEyavlUGSYgDVM+Y5qKqv?=
 =?us-ascii?Q?R7Fng9wfgIZXM3rVrof9EMNsKxJkU2g7IsyQincWiwJKiOQW9bY5J1thKiYd?=
 =?us-ascii?Q?kxbLNung/tmSBSp1QxXQGRif3SuYrogYDOM2antzHQI50DrkR59kByz1GNg8?=
 =?us-ascii?Q?sTBrJYCxwKUtIjzcGxOKim0amutdLcMwQMjsPy4u9Ptp1UD85yHPjQ0Z64XG?=
 =?us-ascii?Q?bbEbmAA8gBPCnxEMfXRRimR/fOuCi0TLDyWHdnFCzPrB/QX2RvqXnXbbQQrS?=
 =?us-ascii?Q?Mv4qR9n6qxQFUlAifBFp5NGxN0kcLO3oYjtqzLeCiZeM/vd/rE+FwskmHweZ?=
 =?us-ascii?Q?No6xnEWnmlsae5G9k4ito4basdjleAD67OrKDb+I/Oon3vepcZzfgwAlZ6eJ?=
 =?us-ascii?Q?r4ZRQAGGXxTmiC66JkI098quHM/iPtQXsYv8G4n3GIJCAoGS2SUbYik1m2TQ?=
 =?us-ascii?Q?jcb4HY9kmPhHVkgVDF/rRUag3QHuhEscYJq+pxvroP3/xH4ji7q0CX9WOspA?=
 =?us-ascii?Q?wuNCbXxYIebOkzC+Z+FEq0+bo+bJrxMG+LhU43J6v/1B6uq76FdP+e1qbdfr?=
 =?us-ascii?Q?QcPYZOzlLcIYoDoP3gZmBo3BvyhOgcILu2gQyYoPUNydzXO33dx0v2rWhR5y?=
 =?us-ascii?Q?TR58GPOeazydAc4hO//EktVua4JY6F9wcPyvXvr2AOG1LbuGrGICtDPOJXpq?=
 =?us-ascii?Q?OwxC9CYt+05ZwLRKAEF2teIgSWBCN9ScC9auNM0Xy5B+u6E4spqd6IP8R2AY?=
 =?us-ascii?Q?v5tIzfK8XDhZbG9Pom67dK9JeX7la+BlhYl5xhAbQcSazlD2DKCz38vM5fg0?=
 =?us-ascii?Q?MFmFCNQSST9WS1PSrItkh3i2Zrz/nxmwfQNbQlhI60Emf9+0AIlM2PJSIZW+?=
 =?us-ascii?Q?UkyjAidw5TqtNnVTLq/L6VjWc+t+w0MAkGSH5IfxQ21kndtRhEq59l6ap/4N?=
 =?us-ascii?Q?8OIyPSek/f7b8jP52WTA25GxhF+Lsff54SBc8huTBq8FPJ3AD6/CwXIul/rx?=
 =?us-ascii?Q?8AusfouxIk+CroM05Mt+0jrnjTy5j2OCzmYEa+fhRYAPmj25aoXwAFPX/5Rl?=
 =?us-ascii?Q?1pZZWRRblFL8uBsXpre71TSkttFo05ubIcTk4tlFtsz1wbwJaf9ZBLPVXuV+?=
 =?us-ascii?Q?ncP7DcMTH/b8s3wiX+nR0jPLBnddju7dG7Mp1CUkj1ia2DIY0TNy4lmMvOGp?=
 =?us-ascii?Q?Ab4U8VIm581bFb/AeO0PxKjhHcEGsfYSxJhTEeJx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcee6d30-ab09-4919-fc0d-08db3befdcf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 07:22:39.2678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nP0u3BAILgO0AVeM4nHcFMaPlzm98dlZQrXmeDCjk/9QTnixf6ierbjvwTDU0SFSfMkt13NMwQ/jhFYzu4DF417aV10t1Xb2eaVjqQHKPrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11483
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan Carpenter,

Thanks for the feedback.

> -----Original Message-----
> From: Dan Carpenter <error27@gmail.com>
> Sent: Thursday, April 13, 2023 5:49 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild@lists.linux.dev; Michael Turquette <mturquette@baylibre.com=
>;
> Stephen Boyd <sboyd@kernel.org>; lkp@intel.com; oe-kbuild-
> all@lists.linux.dev; linux-clk@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock
> driver
>=20
> The divide makes sense in context then...  Thanks for the explanation.
>=20
> This check seemed like a useful thing and found a couple bugs but it turn=
s
> out that condition divides can be the most readable thing in context.  So=
 it
> maybe has a too high false positive rate.

From the execution point of view the code suggested by you is faster.
So I would like to use that.

For readability point. I will put a comment like below in next version.

/* The below check is equivalent to req->best_parent_rate / req->rate */
if (req->best_parent_rate >=3D req->rate)

Apart from this I need to send some change in next version based on [1],
as some of mux missing determine_rate.

[1] https://lore.kernel.org/linux-renesas-soc/20221018-clk-range-checks-fix=
es-v3-0-9a1358472d52@cerno.tech/T/#t

Cheers,
Biju
