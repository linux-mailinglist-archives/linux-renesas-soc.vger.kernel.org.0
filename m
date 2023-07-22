Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D33675DDEA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Jul 2023 19:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGVRf7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Jul 2023 13:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGVRf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Jul 2023 13:35:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D0F211E;
        Sat, 22 Jul 2023 10:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8/dq1Zihko3VmqViknbVpmbQdJMiUH4cHuxI5EqNO9YAOCbaIs3cwQtxK9Ea68to9/jJ/EfY5puof3CKQnhTB2K0jPvW3N5Gh2sF/v1z80WgGBes9jr/lj64O3Vfdiuho/yNif6P/DceyaGhJpHLxNGEvggOyvCOLPP288olsaDakTat5GsElFlKsF1pSeJdELgNePoHAoAwnlPUyCbKj6HAgAZ0xqjSBsve91BCWIWFnOKkwQ46QBLEv6osNtAfF4PptamvJZgE627HuoBQMDHhXS8ZuoDjvlzj9xqNliZ5vdkXUWsbK2PhCTePm8Zx/O0VUpSY7IK4uKrLRFJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INKMa/XVfSqGBKe9ag3fgqMXz3Mvo4NLz1cuP6S3ysw=;
 b=MenmiQNjmhoym9tu0XRh7xZGci286r1al5aQD7M6w3ub9FZaM1OeoOJPjqmxD1OJZyCSsasIzUYtwEkpNrat26jQ3kxPVJAxQ0v7LoTakjJD1eKZiTyBGXVJjxeJy84jJO8wETp6bYWAH9pv7quHXGi17fLel6NZlud0psI0z+TNzTErz/BXMmCw61230+nx29ke3LEN6FHBTatnUETsZ3/DNYEKrTcMnu150CyZ7LYOwpq9fhTOQbxRIKS/IIvEzx9jPCobnD7kQUH01Yy5X9hstMG2hzFusnS+9XFFjV3dNqzyoABFOtsBjZjeDHRbLGO4KuducR2cptL7vAZBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INKMa/XVfSqGBKe9ag3fgqMXz3Mvo4NLz1cuP6S3ysw=;
 b=LHkfwpUK8Qd7VvOPPs08MEQeYYC0xoG1bBSW8Kgxz128fSZfi+kOxcJuW5/fl6yZEmovIV4gd3z5cPd79De6ZSlbXtu0j4QSW021Kus0P2TgGCfgIndi3iuZFeTEc+EDHqwJq4bvD72e6kunrMlxeJWSiuT+x3Jz8jA5u2MK71U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6312.jpnprd01.prod.outlook.com (2603:1096:604:ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sat, 22 Jul
 2023 17:35:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 17:35:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Add MTU3a node
Thread-Topic: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Add MTU3a node
Thread-Index: AQHZuwuYERobsHjTh0axdSWkTVj5Ga/FQTAAgADN/NA=
Date:   Sat, 22 Jul 2023 17:35:51 +0000
Message-ID: <OS0PR01MB5922B1277FD69607A5D4EBFE863CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230720131016.331793-6-biju.das.jz@bp.renesas.com>
 <202307221318.jz5pDcvU-lkp@intel.com>
In-Reply-To: <202307221318.jz5pDcvU-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6312:EE_
x-ms-office365-filtering-correlation-id: 2c80d82e-0906-4d97-416f-08db8ada1862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0iSC1it4pUG0O1SSlnhLm0a8m5zaGDTCg5graN149HcKOTWAl+R1Iwb565kfb5LwX455QiZRlI1J0Uk00XEwJ8d456g53ETR0Y+el4cyujwQyo9ydCcVG0WWfBwPRwVzO949nj5lWvnVGAG0fnlaIoidvmCo1s4ZgqSgKkdzXqFMdA9vIOmZlyKoRnIAJn7Okkwe8zB2rz0bThOTitak8yv5BztacwCnz31rRHzEeBU2JmyVwsYW3FOGKvfPEiC7/O4M83CIxnBYlu8lNWT7GAK5W/CpdTFGeUOxBzIpBjr46dXK3YMQMu3cDbyV1UR2Lsov2WOJXPYmjKmWCx5b2qRuKHeUMelleuaQ6+dwxnb0u6x6aG+SS+8PDMZn5AaR6o5nE7homJrBEpYm4G+TN5UtTGUOxaY7w5IiazLO5rwmUQ3nwa2t9UkR6Xr4KRK2YWZH6lSDtCpcSeKo3jRP+th4lfCXo3PLGmgLgQsKjeHvBPr6cDDpf9X42G6kI/4U8OJJ00y23cYnWHSgbA45iIKszIcKQsC9Ut0qpqBsStxMo5/1e4zJpxODbrSasA8i89/gMzac7IgPDpGvR8XQzvaqZ+G6OPvQSSO2juz8D+9SkDNi7c3UXRfMMVSMn3W3u+WFTq/gUcNumSn5pEcCNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(55016003)(38100700002)(966005)(122000001)(9686003)(83380400001)(186003)(107886003)(26005)(6506007)(53546011)(5660300002)(52536014)(86362001)(8936002)(8676002)(38070700005)(33656002)(45080400002)(71200400001)(478600001)(7696005)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(41300700001)(316002)(54906003)(110136005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sISfaVJa/hdCEYxbA5TBrjst/Cd5+NT3wJApzB3Zh99Rcd/UDCS574iz6qhW?=
 =?us-ascii?Q?yXeicPDqm6371bFf/Nwbbn1AlNqCTCPAjWgfYBJifp3+6e9jRyUlFOfhvWg/?=
 =?us-ascii?Q?Zx427s7/WEvUx//lKTBXyfOUpCCQfxmckmOu3FnXdiqrj0lkQGzA/hqDdqZi?=
 =?us-ascii?Q?oLBLYKzX5N2qe5UuySs+XCCNMUkD2kH8D0z7qB7YXlZKKH5KXPz2iEST1DyP?=
 =?us-ascii?Q?tTMFdJvIygivbxm2vc1H1sIdIx9y2ZAeoYGaW210mpns34dIwcSyyz7MjfwV?=
 =?us-ascii?Q?812Y+zGQnoEIQ4pfuGXe6VGxXy0G+/IvZq+YqdL8bQ73Rcxt6WcMcxQFE2oX?=
 =?us-ascii?Q?K3bfHM7bv2IMkgYhsBsW8fbyB5oydEeIJ6nx6d9Mp0fnNUHtatR2oUDXJUiO?=
 =?us-ascii?Q?4xQhp/iMjVR/2ZIIVpuXEmKXI454sD9ouAJN5O0q/849BQ7AAGm2EpZVDj3X?=
 =?us-ascii?Q?nBvoV4vMTTDvJ149UA//twzBX4kfp+4O7nHUo1PhwJ3d41vnK2GtjIeQ+S3c?=
 =?us-ascii?Q?fAHuwXDSgdlufztDGOcetJgmLZsjfi76idI84gYUZVnDtDAehEHd4c9jXr2A?=
 =?us-ascii?Q?wXoIsIBFHlJlozoSARaQjIrXOmvV0PPD2Uq5ZJj4QeSNqmx4FVrMwnRnS1EX?=
 =?us-ascii?Q?K20O0b+F6ftkHSvZW4YRaNxBMo+MEujm+e3Pq5z0alTeqTgM/3ISv3AA8/rn?=
 =?us-ascii?Q?/h3Edit7vWQb/Bsr1atYlfosm1jhjWVoJ723zAyvmXcB5STeaOA7jPJ9WKrU?=
 =?us-ascii?Q?t25PVSBo0HG/laZ16LKiWhxC2dBambVEstB5yzzQLZH0ux3OoNsF6Dfvyz3w?=
 =?us-ascii?Q?tAsRpv135ZyJL+x8dBQMEUP9REV5VEfuiY60bWTfd2Qckukw9C+s2539gI91?=
 =?us-ascii?Q?eir18eWUwytsLiuFAnv4E4o4JfG6e02VfBBp1hGY7bnaSgOS5elNQWAISbxq?=
 =?us-ascii?Q?1JNc68U+wWBw+1wPQpwdkxDh7KtAEDNvZArEAoJE9kD5IBksy5fxtsmxJEJI?=
 =?us-ascii?Q?ZLoFK2niO1WnwR2cidUXRlS14cww0FkByGQYGWKP4p4qf4Nxj0Id3YX1IbSE?=
 =?us-ascii?Q?ieEPZo/oCpzIu5oG80zyR7juO5PxC//Ie9qPBB94GkbCZAP+UAuLInUnt7ug?=
 =?us-ascii?Q?4ZL+xTq/ZSwA9KFpvuLjCdNG4Dl8rNKFOEZf10DjMvNJHwyMiaDsniX6R9hM?=
 =?us-ascii?Q?IjQzpelYUtReq0cauTqiS0FLUao7Rvy4QXj8IiNa6p2b64og5H7R+lwISZCD?=
 =?us-ascii?Q?kflhPfprFnatcdp64hIDKO3FBW+w2YwG9h84vj1nSys/B37SV3X9O3F0nq9O?=
 =?us-ascii?Q?ABylrsncmmUu8rIf5DYjl1VeXWkvW4oRX6cEiDcru5Lbm4uArwRZzHmHBM8A?=
 =?us-ascii?Q?jPgdoSnkcVbhbcpgaSOUTeLGijh71pzT/7XZnQt+DvmP04552ESIbJpJs79/?=
 =?us-ascii?Q?cTk3eDoQuCT8mYatB7josJ4TZa4+p4vWjHGdXqTf+8UjUxmC6YXdJCqRFZPg?=
 =?us-ascii?Q?miIvBkvVvQOQl+m7NaVevVDMyL+Bg/r73DeeNwBOKHO7hBYc15zLkYzjICJI?=
 =?us-ascii?Q?yeWXg7rITjNZx6c39MUy0Qu3UybpR0krj/WRWnCn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c80d82e-0906-4d97-416f-08db8ada1862
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 17:35:51.9090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVP0AL/aw2RGr3v+zx9K/WBMYZS1ZTk5VxvPEtnc96ZH/qPPVUjiHiAm2DwtKL+TsMBkLz8iaBu2nRRbIIc1FRenqMU8BoKCNQDHSLHPao4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6312
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel test robot,

Thaks for the feedback.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Saturday, July 22, 2023 6:16 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski <krzk@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>
> Cc: oe-kbuild-all@lists.linux.dev; Biju Das
> <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Add MTU3a node
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on geert-renesas-devel/next] [also build test
> ERROR on robh/for-next linus/master v6.5-rc2 next-20230721] [cannot
> apply to tip/timers/core] [If your patch is applied to the wrong git
> tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in

Opps, Need to use <SOC_PERIPHERAL_IRQ> for interrupts
as there is difference between arm64 and risc-v.

Will send v2 after testing on both arm64 and risc-v.

Cheers,
Biju

=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
>=20
> All errors (new ones prefixed by >>):
>=20
> >> Error:
> >> scripts/dtc/include-prefixes/arm64/renesas/r9a07g043.dtsi:81.18-19
> >> syntax error
>    FATAL ERROR: Unable to parse input tree
>=20
> --
> 0-DAY CI Kernel Test Service
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Fintel%2Flkp-
> tests%2Fwiki&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0d92a2b8f778=
4
> 0058e3708db8a72d705%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6382559
> 98068843802%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DIddHS16rE6UW3JnsY1=
s
> mg6bJ%2BMFLDHIjIsA%2FWjaPO8w%3D&reserved=3D0
