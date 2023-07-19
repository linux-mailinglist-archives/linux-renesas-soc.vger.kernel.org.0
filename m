Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1172A75933B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 12:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjGSKiq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 06:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjGSKiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 06:38:46 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBADDE5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 03:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDWoifc4oQ4o264WMdPqgrakoEKYm+x+JDsnLbW77gUkNuszCGbbny2vYqbRAZ3D70uCMrsu/NJ+frWskrgnVID/JlpGrOAzZJ3gDGj/GsELtXZKKVman0Pezq4AO0i1BrShDUW0SmR67wQ+0Xkl/46jPsAeIDh86wsPktWUHjPgW5CfMunldiMRgZy67QEnqK1y5W8yyeK//+35uYnY2sPivcZ3AoggNgn2EI102MheYhp5ovo0RyO+3zTKtH3mzUzyoyPGaQcA6Gylpy/5ZustYa31QOi13U8eHpSbteoudq8VljN0ortjGC5/ZEHThqpgh9u5BilfLXLJb4+jVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF/kdwz/D9MQbMif4Bf6TUCfMQ61bGYo1Ygct+PxdXo=;
 b=isaYaQ293+hXYYTMzQhH2FV/xfJmxw2wEX2HTI4qQysIHVTejMlIpsazpu2CF+tfMi+0MhEnS3wfr8/7MR+xLRaQvaBOdtz74y7fU8W9jocKtnRvAzYJ9qgiA53QQahdAP9sZ0V0WGpbdMFdEHOycAu/Q6MNrbkQ9tYiURFqOZEGMj7TV7VwG9O16pCkuEBWRYLSRPmdvbzGjJayB8KZlYpCw5vSqi5vflstywWwv2vB9Lbbu9fQWATh1p2UoyoBEudIUqQ3cLatMjiBX8Fhts9c+Un63NbPtr6oHOhKJcRjiaFh8xUxyK5GP+ChNHIxzCdgFWG/PolbpUj8mq59JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF/kdwz/D9MQbMif4Bf6TUCfMQ61bGYo1Ygct+PxdXo=;
 b=mZUvEf97iKyryJnCKztGgT/kYrlbH+f9LbKe1Ahv4y0EmnnJz/WoQy3YTlGuk/aduDjUmdv0ksisMikQnIWeRDxgg5SHitcmHFYdOjWSsyN5Y7AnDl9+537SqovMd8yzfgCv0jXmCYoCquJAxGA6suY/yN8Y7q1DqkkY72Vc/gE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8380.jpnprd01.prod.outlook.com (2603:1096:400:177::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 10:38:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 10:38:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Pavel Machek <pavel@denx.de>
CC:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: rz-mtu3: Improve critical sections
Thread-Topic: [PATCH] mfd: rz-mtu3: Improve critical sections
Thread-Index: AQHZuKa5mAsUnF5WjkygZzlLZ+itWq/A46mAgAAE33A=
Date:   Wed, 19 Jul 2023 10:38:41 +0000
Message-ID: <OS0PR01MB5922A389B9C6ACE944B93D818639A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230717120333.165219-1-biju.das.jz@bp.renesas.com>
 <ZLe4qdQaRwwhnPKG@duo.ucw.cz>
In-Reply-To: <ZLe4qdQaRwwhnPKG@duo.ucw.cz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8380:EE_
x-ms-office365-filtering-correlation-id: cd5c7af3-1142-4d7b-dd99-08db884451bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u03D9cZ1AExX561p2pg1tqt5KH/U+3cX2Uy3PJWr+MWYUmQ2Ok3Inn1ybO/V7WZkpFfGQNOYSXBxH43dBHP/zJvPuF3QEYqa+5uoyOORHXpPJ5XEHr+OcRQJBT72GRtCyUTu1c9hE1gRRNofM9l7SwpdwvOHzJw5sOVcCnu9dj16n7JBz2A+da1FFNFQN9r3xAKxSl8YBcSy15wqw+1vM1Yfz8x/U1IuiuZ31hi7k1rx+4Xyfi15wSjXn5E6Au8RlxaophndhiacCkphBvSnSr74rRajDysuOpZ/e8EdOWpcB6tpEuoLH1CDnDLhRu3SxqcuAYmYCnWhwFQuhzlFDeObqYe/PWnIBejS1YBMpohxL1OcgZqIBklzoKhjCq8txEmBWjZ9o9pApVP9qvdIfPCyhZtj/Xy9zNWGU/OeRuNDfLsCDrArm+8rc9SZAMTVqpajtykfzA4gc5guTaItLwlnGw7lrRkqRH/yxul1D1T5ZdUHc3l1sY2Z+DkshK637deUaGanlf4xFtD8dBmA12SbIDQth2VVIehR80ydCEzukOmrzqK0HJHLEvJkq/7QenpZEQtxu6Rv6Y4moh6i3+d3yfd6ZU1NJ9jdJvTLlAhV1Pl5zk9kSl/dGlA88lUV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(41300700001)(6506007)(478600001)(52536014)(5660300002)(8676002)(4744005)(53546011)(8936002)(83380400001)(2906002)(9686003)(316002)(186003)(122000001)(38100700002)(66556008)(76116006)(66946007)(66476007)(64756008)(6916009)(38070700005)(66446008)(7696005)(4326008)(86362001)(71200400001)(33656002)(54906003)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g+xV7p7Zt5flfA1QTgYZ6eCJa4IjAXOp3CmZbUeq/fkYwEiKWywB0oEa+Ucd?=
 =?us-ascii?Q?PnLdZs+sIFQhDHagHLL6SWhI68jCMdTThRe9aJ198NOwrnUqIpeBrE7bW8Jl?=
 =?us-ascii?Q?M4Jc2KZKDyT2AXu3QZ+Kq/HIOZQdoNb92AnA37lOJHcd3aC1DPBT+a2xiuNU?=
 =?us-ascii?Q?SWEOgaFUUE/9q2p1cXCEUaA3oFaJPDKO1jZwzKuGOhn5D33AV51v4Z6tnoWy?=
 =?us-ascii?Q?kJj6o0gR2tV8F0VpDQHu/9bBvJ/9czyFv8i+D9CUg3cPGCmqRP7B/ZwFp1dp?=
 =?us-ascii?Q?Q7L89Gi5eW+EM6M9Zpm4ifzrpO/qACbbxywcWp04nb8MU3NR6MeVg6jy0QG1?=
 =?us-ascii?Q?mUtKv2cyDzPuJOjb+Rv8fRtS7I9rR9uU4T5t2zbBI00ycR8H1J8Aq50+fvun?=
 =?us-ascii?Q?YzAH+Z0ikK9zeOIJ2KHLml3Wu8NIEgd/VXdD2mQVYv607fZSb8uNM2s52k+5?=
 =?us-ascii?Q?KOkvDTOsCsYOycdbxy7rO6kGlZMS03j4LiE5nio3zhS8GmENrTMxt3igy3a6?=
 =?us-ascii?Q?sMnaPmSjSqh3m1lmJaG1pDdD2LX/WJRG8RPHh4K+pNWcGWmP1hSMU7BhKYh5?=
 =?us-ascii?Q?HwpReDI16zX36DSXhD5+Z2zmYeOHrSXd6rd+jnV9SeuDrw/+PGAgfwHlZ5DJ?=
 =?us-ascii?Q?jNuX717bVT8fqBURAk4hYkuulG6JsKWbX2Jwnd/IfhLX6vlE6ydifjCs3Ghb?=
 =?us-ascii?Q?+QFOartzrn+KnN6ertvQVqGamDEk68X8ITGjLcLyJUIxx0lo2GeZ7QrLhNQt?=
 =?us-ascii?Q?xhiI/t1pzenMUxaAMdlUlMBxUVRLxuf+CbpAVum7XRD2vRf6OYYDwKYxVDVm?=
 =?us-ascii?Q?UTgdqQW+q1AeB9ORYbY72Nn0Q3pFJzJRUkjhOMQJPIXcLtijVJ4E4icuVtVd?=
 =?us-ascii?Q?PDcQCbXpIZ4AOXiDfNFjz02qtjF1k9su5rfU045O9rDyeO2/Y6j43JkyjZ/V?=
 =?us-ascii?Q?5WCT7gxuVWOUPMVSOhM3oMKbzSTUrwPYP3HOm7G7Q4ceXjxnjQlxsz4tGQO+?=
 =?us-ascii?Q?Bd0k6JaedW9yF/yT82zKmloJqH1NHbdWOWPuU7piv6nfcJhc6VHvnyPeoFnA?=
 =?us-ascii?Q?A6NunbBuGeqToUBScuzeCF7Ps0iyFR9M/5uNchrBezfoV4Gjri+AvuzZQNuK?=
 =?us-ascii?Q?mzg8Dh/J3cueYxEUwNCp9V3WPMxl4ddiuCRpD1jy6modDDJhwO3Iz/k8vE/7?=
 =?us-ascii?Q?kJOwB+VF8AgL6KPV8P264NL5MELtZgScv45Zilo/Oouz2UuqrVQFYPSPiLfh?=
 =?us-ascii?Q?au1DLPpWKABWsnTLwqZaTXGQQMM8ZOVXyc4IxyMz9PMud1NLuXpzG+OH8wA1?=
 =?us-ascii?Q?FtKanH5ZRThx8YF17t0BhjsXdNTp6Vpa1LNbr1mGo7nIUMkwTowV4XZrGUXK?=
 =?us-ascii?Q?J6HYo2Wwb4pwFE6fHjvqM8o4eEyQBtkitkoIrhZWWpBdYnZSFdpGZljm8wWe?=
 =?us-ascii?Q?o99OyDgzS5NUCK/tX5ZyQE2lXvDsyftnlMWXjEMhonxbjAVAwqCKWyugT6LH?=
 =?us-ascii?Q?pq6/Vrd1tQV3/CPz9N1WAqvxSZZ4g5k3Wv5iyf1bPDvP/GXZgI4W45RHxfY5?=
 =?us-ascii?Q?9K5w5UFhP7dQ1JmVOf8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5c7af3-1142-4d7b-dd99-08db884451bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 10:38:41.3462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpzoxhUE5e1jeyQuql7M/t3TmnqDrnsNQDKghd73vvjlOBKYAVPmwvFzmNLf5XDSRiA1292EAiN0FA755RBi6VAWQTpfITmolfclRkNEhek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8380
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

Thanks for the feedback.

> -----Original Message-----
> From: Pavel Machek <pavel@denx.de>
> Sent: Wednesday, July 19, 2023 11:19 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Lee Jones <lee@kernel.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Pavel Machek <pavel@denx.de>; Prabhakar
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: Re: [PATCH] mfd: rz-mtu3: Improve critical sections
>=20
> Hi!
>=20
> > Improve critical sections on rz_mtu3_start_stop_ch() and
> > rz_mtu3_is_enabled() by moving offset and bitpos computation outside
> > the critical section and drop the 'ret' variable on
> > rz_mtu3_is_enabled() and return 'tstr & BIT(bitpos)' directly.
>=20
> Thanks for the patch.
>=20
> Reviewed-by: Pavel Machek <pavel@denx.de>
>=20
> This is an improvement, but we'll need to move away from raw_spin_lock
> code. I asked tglx, raw_spin_lock is not okay to use without very clear
> reason.

OK, will replace raw_spin_lock->spin_lock().

Cheers,
Biju
