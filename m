Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC92D538CE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 May 2022 10:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244862AbiEaIaq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 May 2022 04:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244855AbiEaIap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 May 2022 04:30:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A108612B0;
        Tue, 31 May 2022 01:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLyxR46Nt1tjql9L4QjyEpqxq3Uj2yR8RtNZkjgbcTQ8fpai/ika8+3Et3ybiFqvzYZkOlIA8Axt/gipGT4vNIf0A+zCsjKV8SQ+GEGSSiWs5+mmtEdVO0nF9HxdmmTrC5Gc3wY76OBNSvg1Qaqk64rwap/JMkgv0nUgKDij1xXvD7LzLMMNdIjysCXWxorRVsZwsOPy/FGHLzyDrp+ONmY7KwygU95dU6NhGYKUJGI/g3bdcNKHcS/dtfWQ6/zQVqZY/PS0RGoD/2uXPapKtl5XMF/KzjWoIwk7BmtH5XfHBTfP/u0UO0N7SA2rDd2H3Zep9U/xGBRxW+9bVsVPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNOaQU7Pmn/J3ZaReG8jo+DUhL0Urrs85/sL+YYUCTE=;
 b=WOMOhpA3IOmf5bL5OxM+bIC7aqbLlFKdMCpvzeual9L2ILCGr4Nv/KuqXobK8ii+VMOenz2V5KkCxHPEZrPL+jWri0X9+42mNVaufIXlZWEa7/hiZpKo4lhGebzUe5URXysoCOAfXJYhlqLuRTGM9Z4knl/fDe86MXFRl1ViQOFJQcmdFC3BXtBsjE2S5jxRYsaBvQf8i470JgSrWCF7Gt5uAfE660in1hFAVU8NpQL+GQnvp2uYQ5y4i46jPpqpDqwBF1xr+lR80lq5kYbKxpV4VSNwGRGHDDWpjBnDAFhnBfwrZngVSEjiZ9zCsVtS1Fk8Wx0dpF0DHU0ZQFIkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNOaQU7Pmn/J3ZaReG8jo+DUhL0Urrs85/sL+YYUCTE=;
 b=P6SoVv2UDqrsnIfP+1HIfGZiPGfGcY/4PkntddWxWMANfAlMGgkNdpCX6JPucZxw1dUZhEq/M9OQ/8Y3DxzXeNVGIaBxS16R0J6FZlH312klrsAnfz0h+2YE3fakeq92i4p9cjS0YOY/nvvLO46ErkD7dpok6Ss4YJNLvQ27Jng=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB4091.jpnprd01.prod.outlook.com (2603:1096:404:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 08:30:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:30:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l: Fix reset status function
Thread-Topic: [PATCH] clk: renesas: rzg2l: Fix reset status function
Thread-Index: AQHYdL5uBo73FtK7wkCDUzoPMpthKq04mSWAgAAD+sCAAAftgIAAAeUg
Date:   Tue, 31 May 2022 08:30:41 +0000
Message-ID: <OS0PR01MB59225CCE040687D43530EA1686DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com>
 <OS0PR01MB592258FC31B22925E8D5D24F86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU63CmmB1MTjbbLNRyOQC8jEGrGth7M9nkrpmH3eUCSpg@mail.gmail.com>
In-Reply-To: <CAMuHMdU63CmmB1MTjbbLNRyOQC8jEGrGth7M9nkrpmH3eUCSpg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 082001ea-298b-4f2b-5c69-08da42dfd91c
x-ms-traffictypediagnostic: TY2PR01MB4091:EE_
x-microsoft-antispam-prvs: <TY2PR01MB409122CEE7905EDCBA14BBE786DC9@TY2PR01MB4091.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U2wwXy3F/oe9uHMsfwVtcigwWozK83881v4gtM1IGGoQWG0/ORLZrSVSKM8T7iebwA5D+cXwf93cTz5s4mDC0BDKpcUHAjZwbOLXoYLEPbotzdmXjhP2rreZm1eXhVWeYvKTofbsbx1dGhD9VFGGo3dUr1yHNow+LgcPMXKUk1SljFOWfFhlUcUHkpqNBd6qcYvsKMtVCmgO2vnsFMyspX+QW6lbMI0OIlgY+xLqAI7oTTP3HF47L1l9l+HwRJad6b95VtlnYoYKIQTPZtAGgG9moDng3988O26inGLeYpNR6p7Cu/4R/z9LjWPJL1R8HphqLkcAUuRZftUFGO3d0NMhm0Ma0MN8lf+uDxqX0PNWjbyCp6ZI9rE3UO8A7sOtmcYuqpXvhhoKMhJYCRhMb8Gv3l47FEvZR+ioyrMgj7rXDhEKhm0fSfX+ZHKo8JWqBIBCN3g0qOXsK73L6ZcSIJ66+vXOqaC8mulX/IMIxrGq25HRwxntW05oHKzjF2T0qDB6g4dRQWVZH9ATBzO5N92grQcffNDbIFqsQctCjKHj//d8DVyXbIzzmlNL6pLeQeyYcPuAYqo/Wt97p6N0C86kBIMiSJGQtYyGWGWCvz0qyOgouSmv3+3WZwPO6DiwcTwih9+sQurIj2l352n03SHfXCFEjY3rFVvQmjzKpMEP/65u9vwuiR0iYnt0H2n0qQhJpALrflYFw7pEHn7/Jg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(66446008)(66556008)(64756008)(316002)(66476007)(53546011)(76116006)(66946007)(6916009)(122000001)(8676002)(4326008)(71200400001)(54906003)(38070700005)(55016003)(6506007)(5660300002)(8936002)(86362001)(26005)(52536014)(2906002)(33656002)(186003)(7696005)(38100700002)(83380400001)(9686003)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NYEHI8QXT32z0Q3lrGqzHEcJt1ZOgya3zx8/dfoczFBPTQySA7aD44uTMB0s?=
 =?us-ascii?Q?eOT4vTEzD/TaN/vpx9CGec0LH9pZBi+u5lnsRN4hUrDqi+NTgkShoR+fYq39?=
 =?us-ascii?Q?lZoHcXTCxD/eTh9AnPbapglgSCll8PGg9lv1uSfllDbwI9jvCGTYV2bJncJU?=
 =?us-ascii?Q?qhwN/GndAedV2J2JCXxnskE2+9yWRRSDOH90KAu+E/mINF/qpTXVHhICVbDt?=
 =?us-ascii?Q?CtGi8jhL8btnl6hTt/3w1en1fla8oDBCBw+Ik2CftzMXCc0PjqqxfWZhhBYY?=
 =?us-ascii?Q?xTOoYgc1V+Seo1OfxrfhJtpB2KY2B9wnBJvSO8iwbe5bi7jMiblqsc+9aH77?=
 =?us-ascii?Q?Y66cG5CZjk6S/w0oSsZovNB1yCp8McyJVmq371LMl5PPFGW/L+DijUc1REpd?=
 =?us-ascii?Q?VAXZv7Jcmx2/2qlZWJcZHEXDiVgouk3GIQczeOMpkuMakdO+ZuSIDmPJRAQh?=
 =?us-ascii?Q?ULTsXYrw+j1r0If48M03/uStqBMEeqt9jmA35R7Ah/ZfTJwiC7QTTSKTeZzq?=
 =?us-ascii?Q?1by3vplU2h7b9k5kNTKzO/JG5sWLELd8xQGwe7/SuX2uITxszhIJXK7z17gA?=
 =?us-ascii?Q?7s8kAKpxHN56RM1lavsUd1LCiEx7apJeP/azgks95M95XT9VnRww5r8xWJJ4?=
 =?us-ascii?Q?GxuN8rDWw7sak0V4M6NTAlE7RAshGt+B3SFEZhJJ2E+koEAP3UOtottyLf7S?=
 =?us-ascii?Q?qLSV5CdLorUYK9OHqMZHbjBHZk3Olwstuzu3/TXCx/srHsHjmSBwaic48giG?=
 =?us-ascii?Q?mp71LSWN+Bmo4Wy0SBhEAWLb6eZU3tPgpxU0D8m/WJkqVm4GcYmjawRnQzLi?=
 =?us-ascii?Q?+zQFpfgoC8qckf4pq7sIx3G7coCFTm2TjHMEhMRREJRz8w4C+h5ZKUfEoPFj?=
 =?us-ascii?Q?HvzK8pvssOc1WumEdwC9xaRqO1yBTV7FAOYsSIXyYuvFgBjiNztqLAnQfKkz?=
 =?us-ascii?Q?FQgQUpH35xoRAgIdsulIjD+8UTFxw+U0KlIcwbl+OE1BYq4GbZlH9tebUyLb?=
 =?us-ascii?Q?X9YgImXG4BllRh+CqF7INeI95mZwtyGp5P2RjiG29tKKx0CXK0Sq8XkXOflH?=
 =?us-ascii?Q?Pi8QM9EXxb1f1v5dWJMvVWXzFj7tkQPzAam1NvhU7Lf5RZrfwj3j2dGjVLwB?=
 =?us-ascii?Q?VQJV38rbXuAcnJ04X36RQjY0igevGoSfsrZZ+qvVUz9V1qMX8Xetsji8vr9b?=
 =?us-ascii?Q?B4XZqTdaUqQvbHJ1DixinEXPBTlaN7HTSVUAlepQ46oJocAw22agewJkMHBW?=
 =?us-ascii?Q?wWjlQiy87MGDQAOYbgS+aaD1Zfrbj+q++EUANny8lInZV65dmvutiI2SdK8T?=
 =?us-ascii?Q?k2pK2RkdRaWeZpQxlNIUmQjJrdEtkrk3CWnePslpy5qAkQJoVoHxusNSqT5l?=
 =?us-ascii?Q?oK8MtbTb4FddRsHBjxW8XcXzsqDGO6+n4/opDXUGEujqYGWAFZR6DaA+o9Rz?=
 =?us-ascii?Q?gR+63VaT9dE+/75icYfmVtzhjo/hHTWyF/lYhNgC6zkv74yRTUWvpiwAXJkE?=
 =?us-ascii?Q?faCvQLK6M3TS6BN1v/PxtLxwxfDAypBBY9BH4SwQiCNabyBvTv+M+hkbOpHA?=
 =?us-ascii?Q?AGjLsAqKtvqphKB0EMtB6vMKF8jLLcHwQoBjZYuGMUPGbLZ13QrE7vUPaWKf?=
 =?us-ascii?Q?dMASlAyeiXWuSaV3TK/uj4jfEIA86cPTV6uN2mB16fZ3g3ihJ2Yfi55zHWSt?=
 =?us-ascii?Q?8yqaww1jzEIlDM7lWb+ZNL+zX0n0Rz8+RH+/A35AYz8UcSN90O/gVXSvZayQ?=
 =?us-ascii?Q?CoeXbsGvwfWz0BP3MEq2VAwdI+ocUm0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082001ea-298b-4f2b-5c69-08da42dfd91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 08:30:41.3845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFSNrVf41zaUljoZxi+Qn84nKy1VoXhuUyXTksJu6WkEoJ+XnCyvi0US7H+Ryom90CTtqhOlm1siAxsPS30nfTUxNhxevwK0dzN3Z4GnU5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4091
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH] clk: renesas: rzg2l: Fix reset status function
>=20
> Hi Biju,
>=20
> On Tue, May 31, 2022 at 9:58 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Subject: Re: [PATCH] clk: renesas: rzg2l: Fix reset status function
> > > On Tue, May 31, 2022 at 9:17 AM Biju Das
> > > <biju.das.jz@bp.renesas.com>
> > > wrote:
> > > > As per RZ/G2L HW(Rev.1.10) manual, reset monitor register value 0
> > > > means reset signal is not applied (deassert state) and 1 means
> > > > reset signal is applied (assert state).
> > > >
> > > > reset_control_status() expects a positive value if the reset line
> > > > is asserted. But rzg2l_cpg_status function returns zero for
> > > > asserted state.
> > > >
> > > > This patch fixes the issue by adding double inverted logic, so
> > > > that reset_control_status returns a positive value if the reset
> > > > line is asserted.
> > > >
> > > > Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for
> > > > RZ/G2L
> > > > SoC")
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > This bug has been present since v5.14, and went unnoticed so far.
> > > Is it OK for you to queue this in renesas-clk-for-v5.20, or do you
> > > see a reason to fast-track this fix to v5.19?
> >
> > renesas-clk-for-v5.20 should be fine. This issue found while adding
> > reset support
>=20
> OK.
>=20
> > for VSPD. There is 1 user prior to this[1]
> >
=20
> Oh, and that one works by accident, as it ignores the return value of
> read_poll_timeout()...

Yes, I agree.

Cheers,
Biju
