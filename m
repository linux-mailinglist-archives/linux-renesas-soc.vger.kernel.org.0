Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9C76BE56B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjCQJV7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjCQJV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:21:58 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACD4B0485;
        Fri, 17 Mar 2023 02:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOaTuv+rKY9YKhGyJSibGE4iNOs5LsTbljwMZ3zCgr7m+VYURqRnWIPZ7Z9YZZsnmfV+9/vvQ2g+S0ijHLGCXEbzpS6SjsHMZnprnOQkBinm51eLTzOva4WysvcjP+jBwoYlQFECaZ614NkCNqa0HdcPloCBUc9orqVsbOypaYAks/1T2q63ICi00wCDNbtNGykQMEs16FSl/weCnG2y/D3Eq2QFEI7KmZK03x10Fm91bvBm5BcmDqjx5f6f6Nz39GuCIpvFpkOQlxMcnaOGToT1OG7Y2hVAI58WiGYLaS1VIufdDR+yT2SDO072Px5EFp26MTbfPwz362A+WKhIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF7DfYpqdaukMIPXpZViv5f9pgSXnbVNxehqfEK7PvI=;
 b=VnANk1bYDxc5/cMJ3fsTXDqhh2tQkUHKE4o6J89b4dFt8YZmyJiEkiqyNYPvGiPSEkMbsLb3kp5hsMN4IqZXcN980AjVXzKV+QC6seqYL3eWRzw1+55/vT+ONVP4/7EbEGOXSQ8pR0dBUc8lzw8VMGJbTPTcHZUq2S+VnFTMLPIM+CIZaAcexSIJZplG5efqe3M+rqPffgDbWlPc2+SwdufaFZ2ko3b6xpkh2gvxlkbu5dfGdAE1hJWFTQ+9qSAUgxkmtSAvjmjSvv2KS0J69k+tTl1TTP7k/KVw7oGCKo+oEpT3eeoJbd/qE/D6hUuryWampAiPRCb6fWzDVJ64nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF7DfYpqdaukMIPXpZViv5f9pgSXnbVNxehqfEK7PvI=;
 b=tAv+6Rr73KjpqaQ1ZeB6uWrpBw4oKB4DXtt5lxyl4RsrDpBC3upVoTxzpmLTwlBy7QGna5/MOGItozXvWjZ9G7mrluUWjns4XtaoFN6lgc/pZ1EbvGnQQUCYWLBFZnyV79zdeFw7yv/EYAocXcTmKNo+uTWdEejX9gbZG7p9bdw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11080.jpnprd01.prod.outlook.com (2603:1096:400:3b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 09:21:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 09:21:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkIAABoHQgAAKboCAAAJhkA==
Date:   Fri, 17 Mar 2023 09:21:53 +0000
Message-ID: <OS0PR01MB59229A67FC600779C7A7F7D886BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933865E5D673865B7C4A85586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <ZBQtzwCDDbIYM+yv@shikoro>
In-Reply-To: <ZBQtzwCDDbIYM+yv@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11080:EE_
x-ms-office365-filtering-correlation-id: 6752f9d4-187e-4e3b-0b0c-08db26c90c53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wqdjzj6AGhT8FT/MY/4JNFz+QEqlcC49qfhlyN0G8+g2fJ84nRYfsVpN2y7ibKoAdVZL7dWjZ0ElQFRWHhndWfsdG7i1khgNvOC6U5wDM7NCm9V9aeSQrye0sIuBiKG+GkvqqayTTobRM2ZbNoR5B+v+mzT7TpDOBqmMG5v9zg7a6FoOIkNmQ2dGWICinnRBv7f7oEk1tL5pds0YwzPT4WM2eJt9z671TvyWL+WU+Z3fGGrRdgK792pOXajZJ5nO3m+wDmQPbIbM9508kC+rXelQ0D/Rn8HV5HmH5MWbA4BU9aZCgM1Dn1X71utwIdHzMJfdGw70K8ShaKFOFKQbvc8829qp7Ec9vpLABq10zIn/mUMrhh5X8YLN4rmXjclrdAyTT90+I2ZLUSxYUqYm1WeHZZbJ85m/9oLk2En07ONMcqY6u/fYMf+H4UuY+OfF1oSQyoF/ZH1OhsRWgaZt6eI6ZuF23MRpvSIFN01zFYi9L8J442CjCSxcGvFCrf9HpROITGqVw1bQQpyQxVSnBr7AUT6HYT1USJer1v+iNMBQdvnJfh8e94NiMuQ7o4LpZT+rxocKvLi8ciBuSPqC9eLYH24pA6ISF4nx7xdsxgHH6+GdEedWEdBq5shaP5UJXoGzrFsXWzSAYttjLnfbvTGU+FD508ICefG/5hgqkZPJnhH4FsFmN+04MChWGB+I+ArFT+/g/c4fbWrQSlc5Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(41300700001)(52536014)(8936002)(66556008)(66476007)(64756008)(66446008)(76116006)(8676002)(66946007)(4326008)(55016003)(38100700002)(33656002)(86362001)(4744005)(38070700005)(122000001)(5660300002)(2906002)(9686003)(83380400001)(186003)(71200400001)(7696005)(6506007)(316002)(54906003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nWD6oN2wPhLU1/KeMwSxlba4DSTVhRrHC+lq2s5FFoGajaSak4w0bo1bvhzj?=
 =?us-ascii?Q?cx6/J9eIKv9oteM0lADoESFqy1Ii2Hc7qkGIIbJJxH3gtSDqVyKzln8WDyik?=
 =?us-ascii?Q?3UjNVsZJVVE1ot9sYB+qfWuwFgwKW+95S+vFKCQmnx+Q9kNXYKomvebGTzVq?=
 =?us-ascii?Q?rMnF1vU6ElwAczwcievU5TNj8mTxUahFiw5wDNq8w4UpLNsid5qy8kmMpXew?=
 =?us-ascii?Q?RnGA2DxCECB2SAf36g97HoSiFQyOuSjXWLbmIDvzWKNg/UFDfW/M25nK87+C?=
 =?us-ascii?Q?ImoY2YlW/QF73oGXGkokbifdl69YP0PUoppX6gn2gdjYGatQWr1RlgGtHwat?=
 =?us-ascii?Q?YE2Sr02406+SumQTqzed9NjQxgNSMA5zSn3m5FpD3BQoXpw3SEywFrCNvM/+?=
 =?us-ascii?Q?iGjgivHUDswyDVT62HioI7KLub/afpBnunygqkT9JEzUDgIUNSBYfnJhRxa+?=
 =?us-ascii?Q?qwxb0B1g6dOJS7F/DFcH7LKhUP5jaziDEtxsswYZuQgegf1f+cC9cppI7nY1?=
 =?us-ascii?Q?6/xJeMquwrna/bfY/wVOX2BT45iB/O7u3lGF1lYIN8R6QpfjppixGUOQxQRt?=
 =?us-ascii?Q?1JuVpjqjpoZIWYTBs0339+kao68I2k62Uhwac3Trsx3TI/WXuaOkFLJv+yo5?=
 =?us-ascii?Q?GICfTW2UYLMfpTmpEcQyQphUUjfKGSY7+xU3gBxOFrhOO20phgKN6p0E1L1Z?=
 =?us-ascii?Q?J9ZpHFyzV0sbo7MFjFODYI83hvbbXzD+t2WY6xUGp01SkwG7Ro3SKM+YrUgQ?=
 =?us-ascii?Q?Y46k6A4g48LM0tblV/WpC4SwANpGuz6YPzuISJdRyiKsuxlUabDG1Iz9Op9D?=
 =?us-ascii?Q?TfhLCH8vUBLxznaB+nDTD7tV04DZXW063YOZuCQJ40DfsItUgREWTGol0IJW?=
 =?us-ascii?Q?Rjo/UC24Raa8E/ZxbXkqB9CLSS7wHXBMH5zmVw6kttBD5gX9Nk0KH5047Ki9?=
 =?us-ascii?Q?QVUmFB99wQ/eNDNcFsoTRxavqY6uXQAtCkTDSzT0MVeJpykiucdfvdh//5QH?=
 =?us-ascii?Q?zSHUJFv0jUmNHXJh5KNqA2fJgQtSGBcOU9hidRGPxsQJ/47lz/hhxPG6bhNg?=
 =?us-ascii?Q?NN4CW0ZCutF3CsWLHHQMcPIVv4aQx0rdEgiEK9WqU5i0A74NmQpHAxPut6Io?=
 =?us-ascii?Q?ZosappfOF2xuO0F8GNn91WFH82o2RzUvOOw6a/dM1LXF8pMzNmb0tiMetydl?=
 =?us-ascii?Q?RpxJEZbmQsUsX815JEcnMnyUuGw66j/RJBPnL5JaC1z7K1TOS3hyBVJPHzpr?=
 =?us-ascii?Q?DcHL5P/kODcCu7tjz7L4rrtOb7K5iZmgllvirRp9n8Usvgj6XDb9rWgAFRZh?=
 =?us-ascii?Q?2bqUG7ZTTj+yaX9tJOoc53Q8wFCwEFmvp7vEef/SsD7m1OjXXJ6T3lJAm/kV?=
 =?us-ascii?Q?YoLuFPTuJuM0u+miBhRBmK/EbhuRztiBUxLuCTx6/KosdDfad9gn0JF6e0FP?=
 =?us-ascii?Q?9E5vx2/vqmm9MRoOhiscZMkh7+L7wsUHsFx7VtnRXY/bW6AWMKOeS0NsJB1m?=
 =?us-ascii?Q?K7lgraw8aeszSpFF4in9J2IdBKhpigF0YQ/+1rLTKrR2IRLOeTcJxFNmkWeP?=
 =?us-ascii?Q?std7rJW4uWU8vvA2PRE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6752f9d4-187e-4e3b-0b0c-08db26c90c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 09:21:53.9952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zucEXaPyOVSB/7ZYWEI3x5wS2PByJol8IcSmQz/QDvVJFQ68llHMP6SeRLskaRBlcA5fhAUWh3H9UUmcRgoXCXarHIiCxVCyLpeaT9Tg68s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11080
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt hand=
ler
>=20
> Hi Biju,
>=20
> > Wolfram, Can you please confirm transmit end interrupt handler worked
> > for you with the commit 4c84c1b3acca ("ARM: shmobile: r7s72100: add
> > scif nodes to dtsi")
>=20
> That was nearly 10 years ago :) I can't recall if a specific interrupt
> worked. But SCIF worked. So, if it was needed for proper operation, then =
it
> probably worked. If it was not needed, no idea.
>=20
> This is all for a Fixes: tag, or? Is it that important?

Yes, I guess for backporting to stable fixes tag is important.

Now RZ/A1 is ruled out, as it uses BRI.

So RZ/A2, RZ/G2L alike SoCs and SH has this broken feature.

If SH SCI support is broken, then we must backport up to 4.14 stable.

If it is after RZ/A2, then we must backport up to 4.19 stable.

Else RZ/G2L alike SoCs then we must backport up to 6.1 stable.


Cheers,
Biju
