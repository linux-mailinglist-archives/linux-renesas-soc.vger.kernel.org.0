Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D03076A8DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 08:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjHAGVB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 02:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjHAGVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 02:21:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E12172A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 23:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz9TDb7QGWdjfTEOIjvq4t5Eo5n9+/HQ+4j5zaGceOfvnmEllDrIc+X0Xpx09Twn9p2wnXoH/1l2S8qjpi11iApus+p/MpoVhwOMFUPsiB/X+HyDkrI3r6RV6gcVvIgLNIlSiE3WS5oUi+diaEkal4kqN+znblpJ9FL4v7VYCUvd840W1Lu2yQQ4qfJVXoAVys8vG1JgAIQvgbPgJXRMv3Du3I1YNWoyltIeXc68brl2x9HyKGh3d5XAM54/xwHVNmWr33nQOg5xH0gH+hpC43MYES3vJPqAoZVepGBrApDRFXrQ5WFWBpMFovhlx0PzSnl3uIrxYegvey8XMYlUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xWVe9Zm0zAtY/qk6XfRnUMga2DdpfXrmwWZ4xH2R+E=;
 b=UftdHJN2M8rIh9hDmwadMRHPvmqRgjrdgX/5hgENE2/e76Czw2noTGfV5rdJn8yLNu4At+8Sve26wo83ZqTfP7D2GLSBILSJFREPi3kCsyiQpDzEQ5Xc5VJKi1l2urmrTJWuqCY/11jzA8qtibHxxy6g/Dw5rs5RB5X3bi8mBvfzN8lPjmbBoFyMvUcFTl2KpEKyng/1eoFCqIT4geFl+NxafjxrjdQfcurf0EEpAc0U621LnSKN1Y35r+w8EhifydGkaPh88v5l/Gvkrx+QoW0aVMHe2gcyvftduG3XeJF5VI9D62c8bBWOcBvVbdCHxC0ShjxLWTjTjLyFzDDF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xWVe9Zm0zAtY/qk6XfRnUMga2DdpfXrmwWZ4xH2R+E=;
 b=TqdUcEXC5zRwxb6kD9h6TAN+o2GFWkUaIansuB9cvNtQNLwFQEQes3wYcBa1r7vYUDI13NK/RXTObf5U8Zu5dBZCmXqAjad2+1RpvQhWH7PPB08uYddjgaWWcJ5Gg+OQr9m4hukMLL6dvTPL6kvQvd+/Uq+eBncAbGx0YZOd+qU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5785.jpnprd01.prod.outlook.com (2603:1096:404:8052::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:20:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:20:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Thread-Topic: [PATCH] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Thread-Index: AQHZuj8xZz3ShFRFFEKgV/KfnMYl+6/PCEuAgAYDmcA=
Date:   Tue, 1 Aug 2023 06:20:53 +0000
Message-ID: <OS0PR01MB592206B42D2B54966032B638860AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230719124729.270393-1-biju.das.jz@bp.renesas.com>
 <20230728102931.GJ8175@google.com>
In-Reply-To: <20230728102931.GJ8175@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5785:EE_
x-ms-office365-filtering-correlation-id: 7ad84406-7c86-4ec5-480e-08db925775d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HD0FGuJcwpb8jWRIj/Y5VbFDUX2wdxUiWY6K8p1Rrr/WWnJo04sDq0WABJFCfSC7TXX6vXzm7viMrUD033YiaS93SRFimbmA798Z5ZCVfBhE0TSNAn5SlYrONnzY/ncuJAUqyM6bKUtPHEEONEs9XJarHEyeC/Dd4vBYXw8VO4XRuPo9XbsGOyEFEy/io41oqveHE4PM5lNQ/UjWX7nz3b9f3k+yfzkF/pTdVt71RgFyp2z3XERB7LlSd9sRJRwZkxQPMFLczNrgqWqK/6BCPL81u3e9I1Qf4Ghoe7u7+aaBAi5/JeFAkdyY3MfBL7CnPCaWtj63EaA9PFLnwKNj8OwSr8fkaBTnHUV/exoQhdjEs4xZ5m1G/2TDpr0r40dNO8XeNlSh+MU2Kg8vRopZ1agiJtiRzx8BvD+qwZFIpkdHWM1vB36R/gAVWBMpf/+y5Lx35DRnqFmRVUB4yh9FZGvOICDWJrGXgthAKrnWoLNqKZKPaYfWzoo51Q+8USbnc7ImBJ1FXYlIcPjF06vamC89BgqFio+/GPtH/4CrvSGq91hLroMHHIppEBCxwQItO6UzyUxy3ZVSkdwLs07WCi2nlZHafxwPLOVxkT06vEPKA8J1I+TkZDzlDR3wTOy7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199021)(33656002)(4744005)(6916009)(4326008)(7696005)(9686003)(478600001)(2906002)(38100700002)(186003)(52536014)(5660300002)(83380400001)(26005)(6506007)(86362001)(316002)(66556008)(66476007)(66946007)(76116006)(64756008)(66446008)(8676002)(54906003)(8936002)(122000001)(55016003)(71200400001)(38070700005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OCrRxKRIatQsveiAECYDXsTEfVbDs4P5I+eBKyeE38OSGvYfKSl12LD9ax/L?=
 =?us-ascii?Q?4BFxt9maL9ZA0QVxMlcKxJ0MlyKDfORkpK0qLgoJgFlTl/1YldQSUcl1A50U?=
 =?us-ascii?Q?FucvfyoUNJH0QU7j1wAOUEKYoUSLVOpPI3rEDs18ffOGQMPun6uADPye5+l7?=
 =?us-ascii?Q?eieeJWvCky2Ky4+Wu1XEFDKTRUp4HjT0N3Eer/q1F0LhTijfJ0xW+rEnW3hb?=
 =?us-ascii?Q?XmirmGZirOsel62k1/pW9Z5Sy3u28cc+sDXtbL2E2F2+u9ks1Uah6tqarAGM?=
 =?us-ascii?Q?dKqZz8Gx4Kb0am0mPaOBMfXVas0sYQZP2O3JmSx4sJt2pbhT3e+f8q8HVIdy?=
 =?us-ascii?Q?xC+u/HiWHTNZBs0V26d9MWIrT6p6HUVWfi5OKngbPoSIw7fzgwYtV6V45R18?=
 =?us-ascii?Q?JdTD+PiV0jT4oENEGyEg/Kztrs4DCnC4OHLACrsUS5BwCLF/dsGt0y7iqCLi?=
 =?us-ascii?Q?RZHBxj6Gs4Wfy6qeUpOd549zahDoQj296r4MLY/m4yYU3MjxXlv762Yn8v0z?=
 =?us-ascii?Q?rnn36NM2shMNQ1DQOhdaSLQtnMYVNRpP1KDz4qirE1lybj6casd1DWVZMUjt?=
 =?us-ascii?Q?62vZKbwtm8mH1Q8KIjZnGXIlJrvZj9wVxfy4+iCIishortWdiAZCAi9xe1+a?=
 =?us-ascii?Q?jMyEXq0qm/LKszOjqAx5c4bk8BX0A5hi5JQF5m/OTU7hCdd7H8+sq7runGsZ?=
 =?us-ascii?Q?WUm1WfQOrjL9CX0hoSbcPIHqzeADMYGvC9E64vTs/Akz+WhpdNfTim7LHpW0?=
 =?us-ascii?Q?QFDub4PinohRSzZYzpIpMGE5gTtheft2T19yg8grdLJdYCM3Zu5RhiAkBzCs?=
 =?us-ascii?Q?bEtZJkKr9ipTU4XjZdC0drY/ttOlfwy9s7qI1P/ACeqo3G7bAMbk8v8XfpJE?=
 =?us-ascii?Q?YoC4cxv2lGX7mDKusJHGazFbcddCqgPNdgarGbE3vUuVeFSsYCm0dYjO80nd?=
 =?us-ascii?Q?HblW82KpkWtsSV+O4dtrEL/pfew0NeE+YRKRVSe/69/THaotzXDJLVe6wk6r?=
 =?us-ascii?Q?RQTxBoEC55HyZXvKoRC8sZtMjYSz/4llrC/ZbMynLoHJlBXv9JyLKcMdtlCv?=
 =?us-ascii?Q?hK196UKXOV+KDJLGA36K0j0/gtWnjCyVB8dchJ+LDy7xgfO6Vuvz+bb2yhWo?=
 =?us-ascii?Q?cWTOIAxwtrS962JbFKm15x6GfKVlZWVb3w3YzvRFE9GGKR07Frx40Lv3oE4r?=
 =?us-ascii?Q?f5iKnBfTWGDLtHlAb2ntpN/D1q04lDNvRz9tgjhsWr4pGbVWFM7xROToU7A3?=
 =?us-ascii?Q?LBUV/NYlZck7p8P6IMW4Pmt4Ovs1VHXVutu5vxk/rDjFBgpj5N1aSaYSP+Np?=
 =?us-ascii?Q?kq4K6q6KRgyw+ZSGR/VeliLJEd8pKeDFurYdduz8aGvkFFyJJnQrMB4N/kTP?=
 =?us-ascii?Q?0HSFS2GrjNK8auHnwNfT/ON5AeZC593xJsTn6dm/6MMXKTEKEzlNUdiVfiso?=
 =?us-ascii?Q?2nLY+HQ9Mw3gw7cym9e+cUOSFe6rItsk2n/HtdlGs0gU5ynanOxmYTovHtKN?=
 =?us-ascii?Q?nyuUjqAPatyp8fg/ZEm6ygQnBpayV4UNgQAr4yDj0oJwMLtidp4VCEfd1yO7?=
 =?us-ascii?Q?fhlzDtwXwf8XvXcT3aCi5kh+oRQMnHedzrtz9A4O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad84406-7c86-4ec5-480e-08db925775d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:20:53.9020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgyBhMCi9YBmgFjvd6tJFgvTngr5QYvbjkJI6Py8anwR9RslqlmmXPsd3heuHY/hrreklttuRkmqHkYN2DR7gQWmZC9me/F6irpzshyQ8V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5785
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lee Jones,

Thanks for the feedback.

> Subject: Re: [PATCH] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
>=20
> On Wed, 19 Jul 2023, Biju Das wrote:
>=20
> > As per kernel documentation, use raw_spinlock_t only in real critical
> > core code, low-level interrupt handling, and places where disabling
> > preemption or interrupts is required. Here the lock is for concurrent
> > register access from different drivers, hence spin_lock() is
> sufficient.
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes:
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This patch depend upon [1]
> > [1]
> > ---
> >  drivers/mfd/rz-mtu3.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> Doesn't apply.  Please rebase and resend

Sure. Will rebase and resend.

Cheers,
Biju
