Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D826945A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 13:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjBMMS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 07:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjBMMS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 07:18:26 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582E1CDE0;
        Mon, 13 Feb 2023 04:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNbj4mkY00WK33SmMRGUbT+nAcDDu3meGzGMLsWZ7fEk2lf0zH8vvbzruZpq+uiSiX0Me1L1/WaRaZUZFBfaIg6vFrhtzenJog+03YE7s2Lqddg/oHKcxwgvxblD5JC8I2hXFy3bT/zv6PurxJkMp0aL4WvcK1+4oC5D5MhkSnq11w4GMWmCz0gcR0fh67Fma9Vzc/hYxX6JO9xY/U9x9i65CrJGzOzXG6nt47BPY8kqwRqEWkhoq4Gqz8e4XC6nbOMI318RKyAMxy76InByeNcfhBG9ZYXMG6LsNiRcL6r7sgShy5HfVEZshdQCmByPUG7RHFHtrCXXKqjzWTz6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7gVF5KF56DyUCNWesdCTKJrvf+B+zOFOTXEPdttrNM=;
 b=MUNLbfSeW+BVipn1QTwwwMzhaTrzHiPvxeV/G5s/aTDXzYqPlDk1QbWVQsA4A/ClCi4Dwat8OCrYBTmTWyWBSn4AY8MjtY18fF0bAOtSHJFmkygyvQA5i3YRqjGp+tIxCXnhaJKIkav4AFFjCPijs7d05s9Kq1bb6D0A1+d9VAtLAZSmuRGRXS437aAFxqFcbzgxW98qTlTCspkkzmEVvupCWkqdGp3ln+UZ+jf0jfQJq6uiZE3hyjCAqeATGqalx2o8vfGlO19TI2Vz7kIhDHvkuEA9CuOVDo6HLSbtH56UY2WVNW7XUeL0UFbP05BHsy8WO+vTDlvVYVaqJhOm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7gVF5KF56DyUCNWesdCTKJrvf+B+zOFOTXEPdttrNM=;
 b=Ifg4qAqPbwS/zzXOs4MP1dqp8SIYeZ1gGb5+A94u4mwlY50z+E1bh2L7dXEeMEzmL/fyJmyAs+jfSj3RLclJ3AOzbBZupKVtg1CPlKviWHvFWAQtHqy7xrYdaNo/Vc+9jxdJcgpFssuLRtQ4BcxG5mnGfGfvCtHURoQ5DPyCEjA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10346.jpnprd01.prod.outlook.com (2603:1096:400:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 12:18:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 12:18:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAABLMAgAAbYICAAAWmAIAAAMYwgAAIzICAAAK3kA==
Date:   Mon, 13 Feb 2023 12:18:18 +0000
Message-ID: <OS0PR01MB59228E1C6038C8609BBABF5286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org>
 <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <4cfed9ad-bf89-7b1-40cd-7def4c64f1@linux.intel.com>
 <OS0PR01MB59227AE1C2A89B75DFBF8F8286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <c2e6e9c4-9342-45df-401e-8dffa881e8@linux.intel.com>
In-Reply-To: <c2e6e9c4-9342-45df-401e-8dffa881e8@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10346:EE_
x-ms-office365-filtering-correlation-id: 5a8671f8-701d-44e1-dcfa-08db0dbc6405
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jpjGkFx1A+3ZhA4hdbr+TIM5oKKP6GLB92PVhiDufxxci/q2UgitAYIslixnWVBzvzyhhmUMEELtW3qy14bjunkKh2YRevT18iyxD0XvA5C3pls627kw+JOJCe2cDBtLv3BpIhFL7jO4xFOSAjhva148VWERAD4sIM3hgXNg7FZZzQNGfuLQ7JSGh3Q0hyoXujUisjcm8fMxeMzUOkOWFpZ3L1dpticIfm2qvGsAtf5dGqKutWDlx+T147FPE+pR1cdAM+wM52QEhcN7b3ZkNEnnch5uECcnDT6SH9Cin8vwP98wbni1H1OwkZOiMog2oMvqmEaeuAedEEzKEfydOgCwocKDgATfPntNJbhxCDiyKtxwck7SDzBgzvDryZbBjnxOqg/V01cXKIre2/RnNokBFDdtdkCxWVDrIv0mzJCYICbsH67ZpeARPMsWqn+m+wtP7gNyHazSkxqVpbTRVQmlxajrxZNGiDP+Ejj7eXE5pF0UbUSWkddu/YnNf6Oe1W5An43nVHyUzMySVU6OtY/IxfOsAhL1m0vf1/XaDnm20P87oUK/W4AAE09SQR8NfdIxFi1wcc+bWBkpMpYuXNoVrRRGO3+3gXrHKafIbhMc3kxnonZRmsAXOb3pHRuiMMg+m4ur3jvbrR+7IqedvBKQTqIj7IpQqFrYZkJiALE/vsvfp/pPFJvhLfBxjyDEyYhbguKcd6t4os5ahZv2Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(5660300002)(52536014)(41300700001)(71200400001)(8936002)(53546011)(26005)(186003)(6506007)(9686003)(2906002)(55016003)(38100700002)(38070700005)(478600001)(4326008)(8676002)(7696005)(54906003)(6916009)(66446008)(76116006)(86362001)(316002)(66556008)(66946007)(64756008)(66476007)(83380400001)(33656002)(66574015)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6OFZVWZ3CVcEZ1QxNCztWWiVggBcL5tCM5JbGHXphdBRwFW/3Sy5+DGA9H?=
 =?iso-8859-1?Q?M4Yw3/a2s5KPfoCGYJHNTtmEPiYSW+jed7mmf0H3yOGR2717pfOxE88tkU?=
 =?iso-8859-1?Q?3hSdjYl/Z+IsAvhFiJNtsABqyqsc1BBxoCbG3hFsESAccEAWb5/1eGyd2v?=
 =?iso-8859-1?Q?1lJkB8RQZsnVNqtDGoUzxhS2rspuf12DGwOLJ18Mg3YYLw4MWRe4zML0Sx?=
 =?iso-8859-1?Q?h8Slq5HesggUQ76St452mgzdmKytMEC8ABft9aWLNzQpwEAWXE9P0KFxVZ?=
 =?iso-8859-1?Q?bpLjhL/DHV8BbRnkAOv30Iy03kKgMxnQh3Sxuy/2Fig2ev97VFPFuELPlP?=
 =?iso-8859-1?Q?/cqzAq66k4FJCrA4LaecDH3bbKH0uyE1GGpKtOen5FZe77q3eLsTp5Z2xk?=
 =?iso-8859-1?Q?nVgwwlKOfmh26/DiOZZ0LzBeMH7a9XpfV+N+4jy9JdVGUQgjp/oMzHtFJR?=
 =?iso-8859-1?Q?97AJYZJPw4ucu5WgRvqIpvJh27qZH1jHUfjnr/Ei6dvc/2C7NAwQFS9gG1?=
 =?iso-8859-1?Q?A71kHBHJqWwo1uiapcAL5Dpg1tGTL+o0iMi8ySzvVa+Zb0dbXiG/JuFAZc?=
 =?iso-8859-1?Q?msN7FKB85GFAHNVabypMILNjv76W3ZukgMgQ+5Gf6V9hCZ7Kv8T/r74Mfo?=
 =?iso-8859-1?Q?VDJoacmpNygLDIndf5JeFvXPb86C+XXU4/B72JVv/fGXqNGMRhMTb+ZdTj?=
 =?iso-8859-1?Q?AA9U60Msre8/cXqrFXPF/k0gQfDijx6GQ91Ub4ONz7CIc8LHFlLUi3efOb?=
 =?iso-8859-1?Q?e2N0GSsbzAwnWTD6dpm9QDCMpE42R/t+EoElc/BS1gQsF7aRz26rRWnTH9?=
 =?iso-8859-1?Q?cTKZgzAYrRaIPCupx6lpSOULeC/vojrXK06wAB+RnutScLFDQMV2PsngoY?=
 =?iso-8859-1?Q?Agz0vh/53qfrCLUIU6qQgkGDfaxzPnq3w/lcnHxaG1OQ9mFJWbPtR8or1P?=
 =?iso-8859-1?Q?OjM5a7FPtRwZRH7yHq1Dki4B9QodWJwzfspkdkfhfrQYyzMS61hVClMncE?=
 =?iso-8859-1?Q?UQqfLMteKHJWPQwcEY8aHVmmY4AU6tF3p26oMCeCESrFSl8cXnvQFyvb3x?=
 =?iso-8859-1?Q?6JTkAOxtxQ1iQJPIK7dyqFZhYe8g24JOMUe7RJA6pSldL6zilZ39rYCcsH?=
 =?iso-8859-1?Q?s2utZBPB4gKGhqlCgxq9rrIhYzFNHIludeeEyXnqhNC1CJoKt+5R6WDudl?=
 =?iso-8859-1?Q?zNZ3XF9edRjQhMOfd8S781LpFFHi/RtMy7xo2T3nfxrkTvz1EJ1Ozfqx2L?=
 =?iso-8859-1?Q?fEKTrQx4KiRTZX2Uwn0uAt+SX7rBNVHjFXnY9LxTpdxTkrk5U0QUBevBsm?=
 =?iso-8859-1?Q?itNeehWoni3F8VaKGRuLvRx03yYPSRQcwOYw8tn98RQ9nbZKxmw37yFav5?=
 =?iso-8859-1?Q?a+c3ZkANRJfkH0YDe/c8mWSjmEtGQjWd6j/dTjOp4t7qVaM+8uunInuC2z?=
 =?iso-8859-1?Q?LjFL8zNMrQszN+0GizkWvdUisBkCwrOcQZFBcRq90zifPaJzJWsAuJa5M+?=
 =?iso-8859-1?Q?eGXWpMZ3fs+4NeRRIQSw8lJmF9bBlfECbqcjO7Nnn0OLBbt3bs0uzDyNOO?=
 =?iso-8859-1?Q?uWrzOwyg5d7k3hGNJS1cgzQdq/0HQyrXDkd72HyAbyHBrt1Q+dCQIQuqJO?=
 =?iso-8859-1?Q?BSHGJ8eLIcIVrseflFB4GTKXtxLKXZtwBv48UBX2qVzYJtuSuY5ABKJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8671f8-701d-44e1-dcfa-08db0dbc6405
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 12:18:18.5550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfTeXlLTyd5JbPvxnJn0EuzFB4rjE59AsplnhKPRpCDiv+lC/Zp/ZpImpDPSbLn0ANpdGSqfnxyMM1JHW88uJWYO9QKa9BG/cE40qrrdd7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10346
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo J=E4rvinen,

Thanks for feedback.

> -----Original Message-----
> From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Sent: Monday, February 13, 2023 12:05 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Niklas
> S=F6derlund <niklas.soderlund@ragnatech.se>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; linux-serial <linux-serial@vger.kernel.org>=
;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> On Mon, 13 Feb 2023, Biju Das wrote:
>=20
> > Hi Ilpo,
> >
> > Thanks for the feedback.
> >
> > > Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > struct serial8250_em_hw_info
> > >
> > > On Mon, 13 Feb 2023, Biju Das wrote:
> > >
> > > > Hi Jiri Slaby,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > > > struct serial8250_em_hw_info
> > > > >
> > > > > On 13. 02. 23, 10:31, Biju Das wrote:
> > > > > > So looks like similar to other macros, UART_FCR_EM (0x3) is
> > > > > > sensible
> > > one.
> > > > > >
> > > > > > UART_FCR_RO_OFFSET (9)
> > > > > > UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> > > > > >
> > > > > >
> > > > > > static unsigned int serial8250_em_serial_in(struct uart_port
> > > > > > *p, int
> > > > > > offset) case UART_FCR_RO_EM:
> > > > > > 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET <<
> > > > > > 2));
> > > > >
> > > > >
> > > > > Please send a complete patch as a reply. I am completely lost now=
.
> > > >
> > > > Please find the complete patc.
> > > >
> > > >
> > > > From e597ae60eb170c1f1b650e1e533bf4e12c09f822 Mon Sep 17 00:00:00
> > > > 2001
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Date: Tue, 7 Feb 2023 15:07:13 +0000
> > > > Subject: [PATCH] serial: 8250_em: Add serial_out() to struct
> > > > serial8250_em_hw_info
> > > >
> > > > As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> > > > restriction as mentioned below.
> > > >
> > > > 40.6.1 Point for Caution when Changing the Register Settings:
> > > >
> > > > When changing the settings of the following registers, a PRESETn
> > > > master reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7])
> > > > must be input to re-initialize them.
> > > >
> > > > Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> > > >
> > > > This patch adds serial_out() to struct serial8250_em_hw_info to
> > > > handle this difference between emma mobile and rz/v2m.
> > > >
> > > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/tty/serial/8250/8250_em.c | 70
> > > > ++++++++++++++++++++++++++++++-
> > > >  1 file changed, 69 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > > b/drivers/tty/serial/8250/8250_em.c
> > > > index 69cd3b611501..c1c64f48ee7e 100644
> > > > --- a/drivers/tty/serial/8250/8250_em.c
> > > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > > @@ -17,12 +17,23 @@
> > > >
> > > >  #include "8250.h"
> > > >
> > > > +#define UART_FCR_EM 3
> > > >  #define UART_DLL_EM 9
> > > >  #define UART_DLM_EM 10
> > > > +#define UART_HCR0_EM 11
> > > > +
> > > > +#define UART_FCR_R_EM	(UART_FCR_EM + UART_HCR0_EM)
> > >
> > > It's easy to lose track of all this, IMHO this would be simple:
> > >
> > > /*
> > >  * A high value for UART_FCR_EM avoids overlapping with existing
> > > UART_*
> > >  * register defines. UART_FCR_EM_HW is the real HW register offset.
> > >  */
> > > #define UART_FCR_EM 12
> >
> > I will change it to #define UART_FCR_EM 14
> >
> > And will add the below unused HW status registers in the driver.
> >
> > #define UART_HCR2_EM 12 (@30)
> > #define UART_HCR3_EM 13 (@34)
> >
> > Is it ok?
>=20
> It's okay, that number is pseudo one anyway so the actual number doesn't
> matter. One could just as well pick some large number such as 0x10003 or =
so
> if the collision with real regs is a concern.

OK will use 0x10003, as pseudo offset.

Cheers,
Biju
