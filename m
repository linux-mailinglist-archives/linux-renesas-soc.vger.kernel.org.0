Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7FBA764FC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 11:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjG0J3g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 05:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbjG0J27 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 05:28:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BC8900C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 02:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEJuUIaU10XFG5ci5o93rVvn4ZaGAag06QeR6JodmZBWqrjQSkYgWvoLl7TS6d5mICU7QemK4O8BltFqtTIeOQTRrELSAF6hIBa8JX/t8yFzvkMj2VgADTvz3FpFWb2rlq+6w1Ns1ZKZGZSkU74l7NCIgknfx4v/eaev1KVee+vss+MRCLCmAgRV1NfYh297KijPopV+HA0TtktzCmaU3gxLBgzH1RqCYSYKLR7ip9cnpk+h93MU4eW0VLteqrDfxOb7spqWMMyFwCU7pTmMXoY06QMg4JGebFLeXY2z7EF6mZcONU39hiSysY6qLhbL1/wQrpY7mzUpbjFzmuMFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3GV14DiDreu6NcWDv3i/YWklhuHuxXy1zuLrw5CDQ8=;
 b=PBYcWPF4/l7PSpqi6Whvquy+1zxwvOntXHKHNRnuSvkPa/ZLT1E9KC5N/1EQ74M9wXO2wzmw5PIoWxBP0oyy+WM0KuwxBYC8Jq4+8Jd+U6sLkjZvcRYQytlh9rCy4TM9k+t/T1asS9ZXxHwRSeuzAMfJA3bzw4oPI+IoMseC7WjJJplfx2cokio1hbHrTc23+jkJ+BxazNOumHRUvRhJxruMgZ8moy05D4TfQjCCGNn4pU1zLEimPPL+ye6f1pSU7/uI0KpPsKNvsYS7nMNUBXg9lEb/AzSSLdRJ4nFXjv5rZ6tYtNcdLVbq7BaZnTOoWdoQv15gmk//aRkeG+pJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3GV14DiDreu6NcWDv3i/YWklhuHuxXy1zuLrw5CDQ8=;
 b=qk2I3VE/9sbhg5IxuVFOMa+//sABOw090isAUeqJOwOsNoInjbs+c4hNTxQHVQYE6R2c7BWmNR+Lqq0s4tIdV/1kAxMYVTgbbBmhHlf0zul9HYMnGbu4cMJpgJKZfwFu6vmzUZvQzXSPkc3Wmm/msY49axo6tF0/ulHMYJ7ErdU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8094.jpnprd01.prod.outlook.com (2603:1096:400:fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 09:19:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 09:19:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Julia Lawall <julia.lawall@inria.fr>
CC:     Linux Memory Management List <linux-mm@kvack.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Topic: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Index: AQHZwEiu5bV74iVB8UuLI4yLfkRI3a/NSKAggAADsACAAAilUA==
Date:   Thu, 27 Jul 2023 09:19:24 +0000
Message-ID: <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
 <OS0PR01MB59227764417EB66A9CBDE69F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bf5c77ec-fc9f-419a-d0e8-15ad54df2fb@inria.fr>
In-Reply-To: <bf5c77ec-fc9f-419a-d0e8-15ad54df2fb@inria.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8094:EE_
x-ms-office365-filtering-correlation-id: eac9abf4-2225-41b8-db84-08db8e8291a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15iaPx6FIL3CKhfeD6yWRtHk73+cWXN1PLf3oXry2qn2b4Bq8PONBPYIOedvexYiaIb2jsFAQ3hr/UVzPu0uo0K0alTmFOcnp3i+iispCyPWIUQOnOcajeQd5aCCf+xBj2BLDIpxQbP4fPvtEOsrQlSoWVf6MGH+bqEa6wr+9z8t8y0C4Y4PviodQUcqY3AbvQ9P1xWNyBtE0aSjvO8vna3SXWIQJBngLnFMlH1/jAfORawqFoDAy/ot1tBbeovuRJ212NV+HPvxcC7zzcbAktNC1s2ySMpH6f1Hqh9yihHyRuj+5fAx0VN3tzl4n7gOBNH80YgWImKxHYDnranUCvrJJIEQxsdW+IdnS16jWF1Bucy//ti2lxXs4v0EIGo8KC1ZriW0mggKUaUlFcDVQZ4ShAa1P5dR/5E3ThAVFTlHMJu2VRvvHzZVVS+8mv+87h95CK+LPGhs9TiUkZn560PAa+0/Yl7gzZz6SY22o0PIZ8piAR3hR1QI+2jnPuHejEYml2xjCQat75T11NT6kBz6iSfY52I8lVWRnue022qisotQREr9T3wT4ulkRb/3u4AYjFEQuerAgFSS7b+wq5FArhkp/mGzEVqEw6y7GM34j62hXoUAh30ke/RmscNa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(86362001)(186003)(6506007)(38070700005)(6916009)(66946007)(4326008)(76116006)(66476007)(64756008)(66446008)(66556008)(33656002)(9686003)(83380400001)(2906002)(122000001)(7696005)(478600001)(54906003)(71200400001)(41300700001)(38100700002)(55016003)(316002)(8676002)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y4iI6/maawvUUR/BPBspzcrFlobIwk2OL5dqrln11BHH4ZRxRFdzf19crAMh?=
 =?us-ascii?Q?d4LPvtgGw/GLsWNBrALnSc6LyRD81ekajEYyfoc2W27mB+aJbTumK7pV2grP?=
 =?us-ascii?Q?fSW4n2gNdUOaDGJ2f71aGRas5+x2VqsUYZUmR/NJerOD8hR/xR6tXZ5GOsVY?=
 =?us-ascii?Q?T7ZswzUwQasa8PZIdCrgIdKJdtsOQOTmeLh5JUAL1aNrj9lxHyty023oR6q3?=
 =?us-ascii?Q?H5vQFwiW6NATNONNT75BXg0grTV1ijefSDZoKhXL+gGLEvnYXoQiBsHEGmQx?=
 =?us-ascii?Q?x+EJiBPVuolMIuuB5cbhJRJmSsVccIciaSuo3vBVXBOTmxXz5lug+Fz4y/kp?=
 =?us-ascii?Q?NJu4RKiRmwhFOzxWARvPm0PCeQINl/DUBsjR8Lum7CiunCnE1ANe+ch8NtHj?=
 =?us-ascii?Q?t4FYizIsY+/R2Id0fhXhPcZ6wvDhVqkvYW1cB2hDl7TwfITrWBN9J8VqZOXT?=
 =?us-ascii?Q?YfAFQsJWfZgrxq+wZhKvjCXfafxOw3JKI+sLt21WLO3si6yqkGELD1t97RcE?=
 =?us-ascii?Q?79xr8JOWg65qLi4lQNjF/dph+GAsZKHMjfFrMGPGRyFvWY0r0yiP55JiscKm?=
 =?us-ascii?Q?2Zed4zdfT7T+Av/5rBUjsqZg/DG0W/4Hp1Yiuyla/y+EfWbp6m7RH1n3WOdV?=
 =?us-ascii?Q?1eOfyEB9Jt+ToFjH27Wy05cD+VsqvQYiyoq1Vy37cxrEzCJjNohm7kkUV5bi?=
 =?us-ascii?Q?wEeEmtVRvPi1ObZkjFehkeXsidedpUaVmb3HCJgjKkm7Mc4cQdPa67up+cPE?=
 =?us-ascii?Q?z4XclcXEcnmqczN0YZ8oOwz1S79h2Y/WBzFM+mclS/TZXnL7TVtBdHTw3zoy?=
 =?us-ascii?Q?mxOhXNtYgXBYiamw9wxY3y0wvuKBEmr2c+5MZaNCUGPZ5fmSzZn3MHiN9G8C?=
 =?us-ascii?Q?O4kAQxllK6HDsvxIzhPkqS/Rm4fyuf47PlaR1BLR6K+zEBSvu9enUZUA0hfQ?=
 =?us-ascii?Q?ArpKgfigLgV0sB+a5/xNBZMI/TPRTibYv9v6dnjz4MN1KrLRyKtOj8riba3R?=
 =?us-ascii?Q?Eqa+YRRbUzZWjrj2Rioab3cIH5K3FG6FXkrxqjqvVlMNv3XfGvlYDBLf/Ozt?=
 =?us-ascii?Q?oy7hEyMu2xyMlVm0j4lLOT33DY3j/8FAeAtv7CFZ3Rzu+HB/ZdxoGu0ZBXSR?=
 =?us-ascii?Q?aN0u+/e491n1CNEI9fAXaG/6aeNMhQ/bkyNsyqwd5KSMj6xCULABu8uNjx+4?=
 =?us-ascii?Q?h96vHDMxJhjlBUEXBbBbIi3njZ5MOl39ZQqlPFwN6sS/OsaEDKxO8NamL3y9?=
 =?us-ascii?Q?T6OmLAbHjAxEFHbTWg6e9I53XGNgtsNUCjH0L/NT9j3+U0EHtFhskFEUCmzp?=
 =?us-ascii?Q?Ni9Md0NW4Zzd1yqfhMgM6oI0gKi7f9BmpS4Z60Q4viDBQgcLn6qwvp466YwE?=
 =?us-ascii?Q?WGNHy0VZ6W1VcnwqLI0berxtOTAwtxt+WglIdGih0VfMIrw60Z13o0+l1kvS?=
 =?us-ascii?Q?DztdeEzTM3o8qP2WSFvCkfWjqXPTVTu2S63oWNAq1+BvXz7kc8PPJlaGykX2?=
 =?us-ascii?Q?suGC/qvVpowU9cs47XXV6q/36D7AyW2DzDjr14Cf3zr8xKjsgfvDLRmPVyLG?=
 =?us-ascii?Q?ko+/PaeUA2n4Ad9n5J0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac9abf4-2225-41b8-db84-08db8e8291a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 09:19:24.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYvj4eo63CLYCjda1kHgBJtny+5GiUoHwxI2mYLxmmedAjM6fPKjRz4XhcxuYaU9dViYyRGbUW9fUBMph15xZCIkkztoxa8oUtwml+upIy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8094
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julia,

> versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division, please
> consider using div64_ul instead. (fwd)
>=20
>=20
>=20
> On Thu, 27 Jul 2023, Biju Das wrote:
>=20
> > Hi,
> >
> > The reproduce link is not working for me.
> >
> >
> > Can you please provide instruction to reproduce this issue?
>=20
> I don't think it's intended to be reproduced.  The issue is just that a
> long value is being passed to an integer that is 32 bit.  If the long
> value will never be very big, then you can just ignore the warning.

The rate values are well below max 32 bit, 4294967296. So I guess, it is ok=
.

xtal                                 0        0        0    24000000       =
   0     0  50000         Y
    ref                               0        0        0    24000000      =
    0     0  50000         Y
    pfd1                              0        0        0    24000000      =
    0     0  50000         Y
       pll1                           0        0        0   600000000      =
    0     0  50000         Y
          div2                        0        0        0    12000000      =
    0     0  50000         Y
             se3_mux                  0        0        0    12000000      =
    0     0  50000         Y
                se3                   0        0        0    12000000      =
    0     0  50000         Y
          div1_mux                    0        0        0   600000000      =
    0     0  50000         Y
             div1                     0        0        0    25000000      =
    0     0  50000         Y
                diff1_mux             0        0        0    25000000      =
    0     0  50000         Y
                   diff1              0        0        0    25000000      =
    0     0  50000         Y
    pfd3_mux                          0        0        0    24000000      =
    0     0  50000         Y
       pfd3                           0        0        0      960000      =
    0     0  50000         Y
          pll3                        0        0        0   564480000      =
    0     0  50000         Y
             div5                     0        0        0    11289600      =
    0     0  50000         Y
                se1_mux               0        0        0    11289600      =
    0     0  50000         Y
                   se1                0        0        0    11289600      =
    0     0  50000         Y
                se2_mux               0        0        0    11289600      =
    0     0  50000         Y
                   se2                0        0        0    11289600      =
    0     0  50000         Y
    pfd2_mux                          0        0        0    24000000      =
    0     0  50000         Y
       pfd2                           0        0        0    24000000      =
    0     0  50000         Y
          pll2                        0        0        0   491519897      =
    0     0  50000         Y
             div4_mux                 0        0        0   491519897      =
    0     0  50000         Y
                div4                  0        0        0    12287998      =
    0     0  50000         Y
             div3_mux                 0        0        0   491519897      =
    0     0  50000         Y
                div3                  0        0        0    12287998      =
    0     0  50000         Y
                   diff2_mux          0        0        0    12287998      =
    0     0  50000         Y
                      diff2           0        0        0    12287998      =
    0     0  50000         Y


Cheers,
Biju

> >
> > > versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division,
> > > please consider using div64_ul instead. (fwd)
> > >
> > >
> > >
> > > ---------- Forwarded message ----------
> > > Date: Thu, 27 Jul 2023 08:50:37 +0800
> > > From: kernel test robot <lkp@intel.com>
> > > To: oe-kbuild@lists.linux.dev
> > > Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> > > Subject: [linux-next:master 2742/4710] drivers/clk/clk-
> > > versaclock3.c:404:2-8:
> > >     WARNING: do_div() does a 64-by-32 division,
> > >     please consider using div64_ul instead.
> > >
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > CC: Linux Memory Management List <linux-mm@kvack.org>
> > > TO: Biju Das <biju.das.jz@bp.renesas.com>
> > > CC: Stephen Boyd <sboyd@kernel.org>
> > >
> > > tree:
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > | Closes:
> > %2BsY49B78%3D&reserved=3D0
> > >
> > > cocci warnings: (new ones prefixed by >>)
> > > >> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> > > >> 64-
> > > by-32 division, please consider using div64_ul instead.
> > >
> > > vim +404 drivers/clk/clk-versaclock3.c
> > >
> > > 6e9aff555db7b6 Biju Das 2023-07-05  382
> > > 6e9aff555db7b6 Biju Das 2023-07-05  383  static long
> > > vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > > 6e9aff555db7b6 Biju Das 2023-07-05  384
> unsigned
> > > long *parent_rate)
> > > 6e9aff555db7b6 Biju Das 2023-07-05  385  {
> > > 6e9aff555db7b6 Biju Das 2023-07-05  386  	struct vc3_hw_data *vc3 =3D
> > > container_of(hw, struct vc3_hw_data, hw);
> > > 6e9aff555db7b6 Biju Das 2023-07-05  387  	const struct vc3_pll_data
> *pll
> > > =3D vc3->data;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  388  	u64 div_frc;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  389
> > > 6e9aff555db7b6 Biju Das 2023-07-05  390  	if (rate < pll->vco_min)
> > > 6e9aff555db7b6 Biju Das 2023-07-05  391  		rate =3D pll->vco_min;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  392  	if (rate > pll->vco_max)
> > > 6e9aff555db7b6 Biju Das 2023-07-05  393  		rate =3D pll->vco_max;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  394
> > > 6e9aff555db7b6 Biju Das 2023-07-05  395  	vc3->div_int =3D rate /
> > > *parent_rate;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  396
> > > 6e9aff555db7b6 Biju Das 2023-07-05  397  	if (pll->num =3D=3D VC3_PLL=
2)
> {
> > > 6e9aff555db7b6 Biju Das 2023-07-05  398  		if (vc3->div_int >
> 0x7ff)
> > > 6e9aff555db7b6 Biju Das 2023-07-05  399  			rate =3D
> *parent_rate
> > > * 0x7ff;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  400
> > > 6e9aff555db7b6 Biju Das 2023-07-05  401  		/* Determine best
> > > fractional part, which is 16 bit wide */
> > > 6e9aff555db7b6 Biju Das 2023-07-05  402  		div_frc =3D rate %
> > > *parent_rate;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  403  		div_frc *=3D BIT(16) -
> 1;
> > > 6e9aff555db7b6 Biju Das 2023-07-05 @404  		do_div(div_frc,
> > > *parent_rate);
> > > 6e9aff555db7b6 Biju Das 2023-07-05  405
> > > 6e9aff555db7b6 Biju Das 2023-07-05  406  		vc3->div_frc =3D
> > > (u32)div_frc;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  407  		rate =3D (*parent_rate
> *
> > > 6e9aff555db7b6 Biju Das 2023-07-05  408  			(vc3->div_int
> *
> > > VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> > > 6e9aff555db7b6 Biju Das 2023-07-05  409  	} else {
> > > 6e9aff555db7b6 Biju Das 2023-07-05  410  		rate =3D *parent_rate
> *
> > > vc3->div_int;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  411  	}
> > > 6e9aff555db7b6 Biju Das 2023-07-05  412
> > > 6e9aff555db7b6 Biju Das 2023-07-05  413  	return rate;
> > > 6e9aff555db7b6 Biju Das 2023-07-05  414  }
> > > 6e9aff555db7b6 Biju Das 2023-07-05  415
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> >
