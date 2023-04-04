Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC5F6D5877
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 08:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbjDDGMi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 02:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjDDGMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 02:12:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E760319B2;
        Mon,  3 Apr 2023 23:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUeeabXhqtQDqWhyMuoCvBLoeSNhIECBPqugbB+BoYveUdr0u1fW8Iq5XJOtkw6rxv3ES5k9Z1YPLDTAqO4pFVhu3dbYy7LmElteoPhk9cHaDyprQ2SJPCvL/90acF8T7P0Jb/4Z6qtsowgTeaIeJyWfu9qQfXs91p2HSOhUOv1Pkr2nIK0XGMARThjgEimGwxySwYzEGG0+1vXnhEW7zvQxjI+DGzUkaZGC1dGe/XTZM5XUhz+RkwP93XMXfQ8yhTJce3a530rFwVGr/FV43trbZh0SBeF8x+jCIryJiVYra0jgR3IXLAm35icKUrZ4Qew9LEgks4vNM5qDmYZ6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbDfnZAyxe6Rh0ZmZa1s6x2HFgR0OvbTwUaXTx60Rls=;
 b=TejLJ9IRkLeOuNn1ouvfUn5zXzS99OySIpVcbucMdDmwJg9Z+uYs9okFYlQSkMomPQox/2ixfiYBQM2XS86G2rz5AE45TAbMxAGYLl/Id3N0ybVF01H/f6j/7potUSa6jfnCMIyBFW35Jmxsio7wrybz8iVyDRdHtDqcIgC5uhY6QmpQa+wY/CxSHqSVk5uT29S/jNKa8VJhrlN07N+YyoipXAwacTsSlG60DcOn1k/2bgWiAJ2/LDZl7AM7x/3ayK4sX519U7O+5zD/y1mcT1g+K1Ggb32mj7fuuJ0SKPsZyJwVB3unRSmqrPQUtm6Kemvz6TNCcBIEANhHtVTlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbDfnZAyxe6Rh0ZmZa1s6x2HFgR0OvbTwUaXTx60Rls=;
 b=n5tNA7N2hBqvVJvW6Tt44Ap9Xgg/FqUWIy1ismDIPP1TVJlRMMYwFBO4j3LrxOqkjfwx0Mu98o0lc8NeDo49INQ6JDwEr/0HdXIUT5XbldzabMhoXOPlV20xR2jC6NLzMK9IwuM2uDa1qVHibY79spfkr5rS41y3n9uSALB0TuA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5437.jpnprd01.prod.outlook.com (2603:1096:404:802c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:12:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:12:29 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZZhewe6BIP2rGt02XrsnePlj1Xq8aUeqAgABaVNA=
Date:   Tue, 4 Apr 2023 06:12:28 +0000
Message-ID: <OS0PR01MB5922CD6C932312CEB7D7378286939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230403103257.328954-3-biju.das.jz@bp.renesas.com>
 <202304040800.ncpvZq1s-lkp@intel.com>
In-Reply-To: <202304040800.ncpvZq1s-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5437:EE_
x-ms-office365-filtering-correlation-id: bd0b68b2-52bb-47b2-1560-08db34d391b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /OUpV9H02vXt+aA45LEAW8olReHHN9aPPQ2v5WUKb+hNTkGMm9nvPBuJAEiHo+KcCfdh1I7gFAReR49UwQTHeIJwVqVik+WGpMGexvLdepPasZotWq6ml/3drPzNZN5EkxXG2jo8RFqdzkpvLfP/DyolfulD4lci2I9Nav6Z4XvqPq8q64TB4YMUcSY/zF6SdJk2dLqkQuc7CHPrc4Ga4g/cVv7MJ67PDC91vrCJftf6tMw8QCpj6AzszSyq/JVDNgrPJtWqD8My7pi7Ch0yc5dJ5TLr4aHfCV8ehT09ud9+7BI+GtyCH+uw7qb6Wme+e4sbFNa6skiQg/wZe6J4mnR1FMmBxABT0vJ2CJH3bY+4aTqdF98Bic6YsIGvcb9tUgQYACQ52+ppqdre1W6hPMYy/PsdzrA466UnmglZSW6x6cVSlbDepo50ykzG+XsHCq+vTLIxQqfScihzk4K3/2Y4aDqP7yOxhPNN3qiXYp7RN1Zauwfz21A3K3ss/5ofCG/wXH01ZU4bhhgNl0GE12MzORc40nMpN/4JoAm3I+cJKQ6q8Wn8OLA5YjGJfRxxl8KTF5na8d33amNFfnGOA0aFbY57uVIWfNF4VbtANzs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(9686003)(6506007)(26005)(53546011)(966005)(83380400001)(122000001)(66556008)(66446008)(38100700002)(41300700001)(7696005)(71200400001)(66476007)(186003)(45080400002)(54906003)(110136005)(316002)(66946007)(478600001)(2906002)(33656002)(64756008)(76116006)(8676002)(4326008)(55016003)(86362001)(5660300002)(38070700005)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KWTSx0E00KoLQxuHUePuk3iEXiluogTu1b4GnRgJRrIPChNu1h/jcrvkoKyV?=
 =?us-ascii?Q?jNCzDik57xP9+cynvoT0zXmaglpOpNKI/YM/ydJt/TlJoxrYVF8ZTmkMc1eU?=
 =?us-ascii?Q?zxiElWx0jnFfHvnMZrzpP5xuwGGuuLYPyp2ovnQlMJT4NAVFnIARr+vacyDr?=
 =?us-ascii?Q?b9eicWO8Gqg5gLHzWXm3fqu8diu5lLu+5V/wIulPmuusXvXzHWLPmMM7Ehf7?=
 =?us-ascii?Q?0cO5G7xt0WH80AiyeIg1/YUhEdfJm3+eVEoTyWfzgLthYFWJ7YPBaSpQWzKj?=
 =?us-ascii?Q?ENTxVUT3AHthAx8L3kzwlDvd4vSFl9UNNEG6WkMZQx1dlkpQLUGzzMArjSIE?=
 =?us-ascii?Q?45PzTv7DORypgrUNMgaH3di/JSWdmkbcbHkdOBudidv3osclnDmGjkCHYIOv?=
 =?us-ascii?Q?Vp2SfF6yjupB/z35iuDB32MoO/VtDjGqzEE7oNohk92fAG9RMPby0fk9Tcux?=
 =?us-ascii?Q?gR3yDdPjbEakql0BmD86kyCxH9iLPlWNaSubBXtFyLzsh4rVu/hr+sPUJIqO?=
 =?us-ascii?Q?WHP5khFDMk5ZMlrGSlcj/U97mX55HtXA+GnIAri/jGrIQzyqjN9tMOlia7WH?=
 =?us-ascii?Q?w7swvhlA0OWkv7LQiSTR9VxDu6N0MXpg8rbaeRBfvQyBho1zzBTBea04dHff?=
 =?us-ascii?Q?3XxTeVRwZQ/ip+RxmFE9IH/ug3yCmsm1wnqqQpPsilkbzej6RsBb9dJrOdJN?=
 =?us-ascii?Q?dn+7rXHji/HYQ3NgyqQPxmh/juz3SS3CaZBIss1vWm3ASDGs+zLLIikNl4nK?=
 =?us-ascii?Q?fw79Rnru3L9gVOexlV2jXDOjc9zCu5e+5QLMoP4e4lxIZNOhBytBOO/1Sn1l?=
 =?us-ascii?Q?3x0SDEuLbg1XxB6NhjcGuNsUHI36tCJShNCh8+bNZHwWYACvSapacoHsqLNO?=
 =?us-ascii?Q?NAVVENiYAm42HvM3SQt7de+bxC0YSsC1Ss0N/v2favonnpmMXqcFU00jE6s6?=
 =?us-ascii?Q?UK1XZGeg2bmzrjk0PthX2u1LPW6SMfY70rNzhEQNxxojE3LyxRXTmfrHfgIw?=
 =?us-ascii?Q?byLg3o6TN0jwJO16pLKDCiLNzGMkxi2asbOV+hj/4+RNJ4BAL80v2Diu9+8m?=
 =?us-ascii?Q?0n+T5/Pj4+8R+pNPBDUOeUFAky2JsPB/Bbx9PBKm8T/NrgD7+Qu47+J4v436?=
 =?us-ascii?Q?L5W3rj5MryNaAmQEemTnhRr+MUHYTqo6RuPuR9FpJEtrEFYstZaCLUg7w9zE?=
 =?us-ascii?Q?CPaUlRgjsKllTn8PTWQbyJT8OZV46h/mdxn5ZK1aZ1yVSz9+0xphXmTNIxjf?=
 =?us-ascii?Q?UNkh1hm3+9WfFPMmXZUrhf0EWXc+rj0WOaAOoMW3yrXhp+7aTjVtTyuY1r5L?=
 =?us-ascii?Q?L2pKt9iDcjA8xOXw0/ME3ohYOIRxNWc4+Brol2hbeS+hizp1/rcEodTABURC?=
 =?us-ascii?Q?NIik/kd6HsTj7CW7NtxJQulfAYOn8jc0EPjKmhLl2W7cq4r1HTo9XchLspt3?=
 =?us-ascii?Q?zR2OWaeJWHOVhIy6KxUDIzkxYJHByWTO/hK+lt6rUlT4BrYINN9vNfCh4YJu?=
 =?us-ascii?Q?lMZ+289CSwjii4L/l6IMtQ6fIK/FKceKvK0Xd5tOkT60KxAI5/xubZx4cSon?=
 =?us-ascii?Q?a41VQRtTP5WGyaDozfvuaVDqz/xWuHIwy0+QHh2j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0b68b2-52bb-47b2-1560-08db34d391b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 06:12:28.9986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGSVva1VW8Pi/A+1Ik3BlPaAJMTRKN/pIoLqZ0rjmlRgM3FdpC2vG6c147alvFQ8jszZbzWnEVifIVXLCFmYvKUVTcZV4bEZVofDgErlgGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5437
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel test robot,

Thanks for the feedback.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Tuesday, April 4, 2023 1:48 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>
> Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; Biju Das
> <biju.das.jz@bp.renesas.com>; linux-clk@vger.kernel.org; Geert Uytterhoev=
en
> <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock
> driver
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on clk/clk-next] [also build test WARNING on nex=
t-
> 20230403] [cannot apply to geert-renesas-devel/next robh/for-next
> linus/master v6.3-rc5] [If your patch is applied to the wrong git tree,
> kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
>=20
> url:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com
> %2Fintel-lab-lkp%2Flinux%2Fcommits%2FBiju-Das%2Fdt-bindings-clock-Add-
> Renesas-versa3-clock-generator-bindings%2F20230403-
> 183501&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C58183605a92243fe44=
db08d
> b34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638161660780169608=
%7C
> Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLC
> JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2FlQd5k6qitRjbT3FFrwsiiFRxsPc0bPR9s=
sY2U%
> 2BTvmI%3D&reserved=3D0
> base:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel
> .org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fclk%2Flinux.git&data=3D05%7C01%=
7Cbij
> u.das.jz%40bp.renesas.com%7C58183605a92243fe44db08db34a63aba%7C53d82571da=
194
> 7e49cb4625a166a4a2a%7C0%7C0%7C638161660780169608%7CUnknown%7CTWFpbGZsb3d8=
eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C
> %7C&sdata=3Dn65lwFazrJlBTaePPOypLBT6NbnGpoePrA%2BALALQlD0%3D&reserved=3D0=
 clk-
> next
> patch link:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kerne
> l.org%2Fr%2F20230403103257.328954-3-
> biju.das.jz%2540bp.renesas.com&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.=
com%7
> C58183605a92243fe44db08db34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%=
7C0
> %7C638161660780169608%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2
> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D2vmd29m6ifdZ=
dZMD%
> 2FC0F9L9nX0rBUv%2BgTV0tKLn%2Bkb0%3D&reserved=3D0
> patch subject: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock
> driver
> config: i386-allmodconfig
> (https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdown=
load.
> 01.org%2F0day-ci%2Farchive%2F20230404%2F202304040800.ncpvZq1s-
> lkp%40intel.com%2Fconfig&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C=
58183
> 605a92243fe44db08db34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C=
638
> 161660780169608%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJMiZ588SYVvNqlMaOt=
1qh6h
> iN9%2BOcVqbUMkjtV842MQ%3D&reserved=3D0)
> compiler: clang version 14.0.6
> (https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.co
> m%2Fllvm%2Fllvm-
> project&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C58183605a92243fe4=
4db08
> db34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63816166078016960=
8%7
> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DPR98XaFLqi%2BNzWnn9FDX3lU6vS1PChtzE=
elYqv
> t077Y%3D&reserved=3D0 f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=3D1 build):
>         wget
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.g=
ithub
> usercontent.com%2Fintel%2Flkp-
> tests%2Fmaster%2Fsbin%2Fmake.cross&data=3D05%7C01%7Cbiju.das.jz%40bp.rene=
sas.c
> om%7C58183605a92243fe44db08db34a63aba%7C53d82571da1947e49cb4625a166a4a2a%=
7C0
> %7C0%7C638161660780169608%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DfF7xxF2v=
iUDJj
> LVZQXq8Vgk9QsZOgiI3ffa9oPVGzfo%3D&reserved=3D0 -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com
> %2Fintel-lab-
> lkp%2Flinux%2Fcommit%2Fbd1f4d06603f7dc65276411a65078a8ffaf5b844&data=3D05=
%7C01
> %7Cbiju.das.jz%40bp.renesas.com%7C58183605a92243fe44db08db34a63aba%7C53d8=
257
> 1da1947e49cb4625a166a4a2a%7C0%7C0%7C638161660780169608%7CUnknown%7CTWFpbG=
Zsb
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000
> %7C%7C%7C&sdata=3DseeuNQwOMRNcZEb6iBQsenX3J1ABOFlqiXcPGBnMPHA%3D&reserved=
=3D0
>         git remote add linux-review
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com
> %2Fintel-lab-
> lkp%2Flinux&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C58183605a9224=
3fe44
> db08db34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6381616607801=
696
> 08%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dfbe%2BNELrfZ%2B6ovAfKfPAugDF2oy=
iacAL
> 2g%2BnKunFD%2BE%3D&reserved=3D0
>         git fetch --no-tags linux-review Biju-Das/dt-bindings-clock-Add-
> Renesas-versa3-clock-generator-bindings/20230403-183501
>         git checkout bd1f4d06603f7dc65276411a65078a8ffaf5b844
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/clk/ drivers/gpio/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link:
> | https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> | .kernel.org%2Foe-kbuild-all%2F202304040800.ncpvZq1s-lkp%40intel.com%2F
> | &data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C58183605a92243fe44db08=
d
> | b34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638161660780169
> | 608%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> | I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DIi1JCf7g5RtSpgCR%2FMkl=
Y
> | EM5m12V%2BgrH401aJUZZVSg%3D&reserved=3D0
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/clk/clk-versaclock3.c:263:8: warning: variable 'premul' is
> >> uninitialized when used here [-Wuninitialized]
>                            if (premul & VC3_PLL2_MDIV_DOUBLER)
>                                ^~~~~~
>    drivers/clk/clk-versaclock3.c:244:29: note: initialize the variable
> 'premul' to silence this warning
>            unsigned int prediv, premul;
>                                       ^
>                                        =3D 0
>    1 warning generated.
>=20
>=20
> vim +/premul +263 drivers/clk/clk-versaclock3.c

OK, will fix this warning in the next version.

Cheers,
Biju

>=20
>    238
>    239	static unsigned long vc3_pfd_recalc_rate(struct clk_hw *hw,
>    240						 unsigned long parent_rate)
>    241	{
>    242		struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data,
> hw);
>    243		const struct vc3_pfd_data *pfd =3D vc3->data;
>    244		unsigned int prediv, premul;
>    245		unsigned long rate;
>    246		u8 mdiv;
>    247
>    248		regmap_read(vc3->regmap, pfd->offs, &prediv);
>    249		if (pfd->num =3D=3D VC3_PFD1) {
>    250			/* The bypass_prediv is set, PLL fed from Ref_in
> directly. */
>    251			if (prediv & pfd->mdiv1_bitmsk) {
>    252				/* check doubler is set or not */
>    253				regmap_read(vc3->regmap, VC3_PLL1_CTRL_OUTDIV5,
> &premul);
>    254				if (premul &
> VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER)
>    255					parent_rate *=3D 2;
>    256				return parent_rate;
>    257			}
>    258			mdiv =3D VC3_PLL1_M_DIV(prediv);
>    259		} else if (pfd->num =3D=3D VC3_PFD2) {
>    260			/* The bypass_prediv is set, PLL fed from Ref_in
> directly. */
>    261			if (prediv & pfd->mdiv1_bitmsk) {
>    262				/* check doubler is set or not */
>  > 263				if (premul & VC3_PLL2_MDIV_DOUBLER)
>    264					parent_rate *=3D 2;
>    265				return parent_rate;
>    266			}
>    267
>    268			mdiv =3D VC3_PLL2_M_DIV(prediv);
>    269		} else {
>    270			/* The bypass_prediv is set, PLL fed from Ref_in
> directly. */
>    271			if (prediv & pfd->mdiv1_bitmsk)
>    272				return parent_rate;
>    273
>    274			mdiv =3D VC3_PLL3_M_DIV(prediv);
>    275		}
>    276
>    277		if (prediv & pfd->mdiv2_bitmsk)
>    278			rate =3D parent_rate / 2;
>    279		else
>    280			rate =3D parent_rate / mdiv;
>    281
>    282		return rate;
>    283	}
>    284
>=20
> --
> 0-DAY CI Kernel Test Service
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com
> %2Fintel%2Flkp-
> tests&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C58183605a92243fe44d=
b08db
> 34a63aba%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638161660780169608%=
7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJ
> XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DYKqKrtq1gai%2FVmXX36nxTuU4kWNIMoWXr0Q=
%2Flc
> YIaZE%3D&reserved=3D0
