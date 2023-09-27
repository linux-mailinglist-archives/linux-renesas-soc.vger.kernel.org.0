Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81BB87AF7B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 03:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjI0B3I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 21:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjI0B1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 21:27:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5CE6A63;
        Tue, 26 Sep 2023 17:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/OgVtZFGQtUmssSVmUcmxkfBuI5CQbWh+6iL+N4G7B46SaXHJMwQL1gEsPi1Qcb55aF3MI9v7hQnuk2k/+nIg4722SXjNe8gbvBHner4ApEWl3tPuWAeWrwcIiJMZZnwdfRH8Ao5jcNBe4xKeSt7giEzXT0OE2RGAm3Q29foPQWxlmRNAqfPpBl7FNVpBV5GASX8513+0k/h1HCwUQqb7R6l5GUMGc5KeXwsFngN5F3JxqSALjXyQaN536dXXwk8uLtlCaouOtiVS3h/fuywdyiB00JtypFdcpPcSooQIFFgjBtvamv/hCKZl0bHLiBWAQ0Jn//nIjtFlcAQwaxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1etfFcOTBWIzg9+FNqbT4Z7UuaAJWLuS/w4peVHoDbk=;
 b=dCvAmywyPn+5CEFj7UfKSPBQ0YcDW02vdN5Tgjk/yfPeKI155472Yu8u8q17vxsR2SiEHEq7OiQb+6Xp0NtFhjMSK3lauAUJvqLein4zllPktvMeD5KnO+wLYLpRVlyhJebl1uTKs/38gT2wezWelmBW+xxEeO3CALk6gQ+mXFwzmEFAVQDqHMkUNkJ0p6iE7pmGpknV/IahzLCleGj1uPBaPd4md+sd6gVNrp7nrlxWHMRyrfIrgmYYQa1SzOpaFGLH3som4ZRyC1Uf7l2z1QowNFy2bbDiIjKluSUji+qkPz+ijFm4Tj+3vrA/pANyspIA61fVRp2BQjFVI6gQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1etfFcOTBWIzg9+FNqbT4Z7UuaAJWLuS/w4peVHoDbk=;
 b=g+xK/zF2KeZqn9YzFSfwKg9FZXPY9MR8NpHAsVwRLt35gvhWsL9LBSSdPDtHYyJI+twTIiYNvJVNADxEBgckS0C2mWwtH/tueelQbT+usHWw2HpFLcC9fYQrVc2fM/rYKN505zOcicrzPpuN50EbjQBWLkK90ZYQCVKcyOt7flQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS7PR01MB11388.jpnprd01.prod.outlook.com
 (2603:1096:604:246::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 00:35:23 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 00:35:23 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Topic: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Index: AQHZ70gLPZK+4KBkgE+5y4WMpBuX/7Arl4+AgAEbrPCAAF12gIAAv34Q
Date:   Wed, 27 Sep 2023 00:35:23 +0000
Message-ID: <TYBPR01MB53419F7AFFF80FAB49C4F92BD8C2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
 <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
 <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <496825ea-8d78-47b7-b4c7-f74874ca278c@lunn.ch>
In-Reply-To: <496825ea-8d78-47b7-b4c7-f74874ca278c@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS7PR01MB11388:EE_
x-ms-office365-filtering-correlation-id: e3fc1a27-a298-4654-a9fb-08dbbef1a305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSvo+Ehh4OrJwqfHStgAJRMTu1LRWyJT8Cd8HYJrfM8f2jAHGKmHORJIDtR/bBCzuyUVLCxF3FoIAdWhqJDToFP8P2r0OV5BLvR/MSitq/s+r2nid1eyeo5coOr693qH6qPT8+48222GO7mjs/MyB+EOTmMHBfIFv6FZZjlZSonTxgUgo0NSmOKDBttin40nKSWEJiexX85f01O/sfVkzqixqv4+gXAlm9WiHP1QyCpMXo0TpaaTYmNUH0Zcef2DExmg+gNxMDHpIiUf9j4SHwkFGU9KfDuWrV2Rb3QvY13S4LCJgQ3JKrdlNf8lOdLanu/ZwWj3xn8oDSN24Jb+rnNdn1JYyM6JQHnQ72Toq31q1vndYcZ2TMimZ9d6KdvxcxhwLTRrJPhPA1e1HUn3WUEvstPH3/NV4VhynxQ7dwrvPB0UWJ0VS97J4eQgQXb/P1h3G/GmFpPDLC93TzhtOPRgKriLvklyeSpy6OIPrzAQv3kmOlLdGlwb/pOiMSDM8HfVJcqyFpY2rYDi6SC2FMXSuUDFjlO5fGnCScabqykodoc2AViIxCWMLaYR3x60zLg24pg+Q6CRTCQOL1KJysehL2/GrRUzqFsQF3pkhf0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(38070700005)(122000001)(33656002)(86362001)(38100700002)(55016003)(52536014)(5660300002)(2906002)(478600001)(316002)(41300700001)(66476007)(76116006)(9686003)(66446008)(6916009)(66946007)(64756008)(54906003)(7696005)(66556008)(71200400001)(6506007)(107886003)(966005)(4326008)(8676002)(8936002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R5l8Sj8CmBVhbAQ1PaJy8uf7sBjnccNsoMgyFHEhBnjkAO3fMM+/Jy3BUJrg?=
 =?us-ascii?Q?KXtsQgOH3mwnfZL9I1ER6CeldAKQIh8DPCgFpHucEVyZ99lrAJdIdd/BEONP?=
 =?us-ascii?Q?8WKdxwJ6S8233fbx5EpcZUZgDNr3uA3k1VzaGM2Pt8IsfbBECVEkV6226/xk?=
 =?us-ascii?Q?Go6x7tdXT3YDMaoP4o5AV+beBxxl+82vXOSWUrgLIIHm1uOS6NcOteceiMGk?=
 =?us-ascii?Q?WTLCjyYWrGLHLorpy0bWJWlLKKj5Y1LYoKkpI/+No5AhVH//+z1JizffGHya?=
 =?us-ascii?Q?WBiOGitJi2OcsFT+L4iFAIKiKrECw0x4A/cLZOhYfMwbZSk4eQgrIm8fVkOv?=
 =?us-ascii?Q?H+XSf9jTItJeNMyuLz4MmB8vRwnZJIE35AAU+xeTbDff/vydgYIgt9+9HpkC?=
 =?us-ascii?Q?Olz8rnNNA58yqD2QIzWpF1LCNUaRSn6Av97/TiVNkg58voITF6TK9bkl957a?=
 =?us-ascii?Q?fIQ5HmMUHdJgxH1WIKN/mWSZn0fPbS/7szCnhJrdCOfrCh7dun57qjMt4SZL?=
 =?us-ascii?Q?kIUAqFz+vilXVEKC9XA3fMF5DF0gSPWJwFewDFaIRTXgnPDBjTBSeFN3DCTI?=
 =?us-ascii?Q?6r8/51rzoeTc4Te4h+6jgQ1Cc0lup2vgOEgUbLU8bnwGYBpDS0FUdys6cgqh?=
 =?us-ascii?Q?qpgNOEKF4gnUIlyITWZ5G8+fqIj47qmgWN+SoQNqPzOusPghcAAe//wfsI6w?=
 =?us-ascii?Q?Xz1I7Uf+0HzgdPciOfo6meDFBuc5nmW/O6/RCGZQ0EEujdzCwX5tAiQhtM1I?=
 =?us-ascii?Q?Hji+dKeOGnz3dFS7ZqsHlxwS5W60psqeHpoYoIegeYiTBZODuCyshp/soSUH?=
 =?us-ascii?Q?beOLJW7Xm7AE9Q7/ZNPKnDdWovSSEiMAWjiJpQXDGEqudk/OFxBY7C94ra3v?=
 =?us-ascii?Q?U+pu/QsMD38s9/cOEAHzJ0CvcjuGunHUgyVqY0M+VaB6ktS87kWS4N+/5vYL?=
 =?us-ascii?Q?UrnOopWGTM1VH84sN0Vrgmcg/dhXYPk9cdTWgug8uEhrkSBYGUohyeLjCgsT?=
 =?us-ascii?Q?4FiA+FcAwFP74kpMneDnUJowc1io8YTSRLD3Goyxh5LHyP5EERBwjYj2pX+V?=
 =?us-ascii?Q?aI0pKLHrRin9egXfvEclPgfkbrcdMWJEpNmxKcyT8TE2q3NDNC904G1Azznw?=
 =?us-ascii?Q?mGamVz0cZ47ueTQmamep7uaZOS60uiA8SKbV86auSboFpAng5/W3daJtQm71?=
 =?us-ascii?Q?H6QckvChGhWII8RpggGMzdF+Oy28uUVKaNqczArRaosNRuKuIIo/PHbgoaaQ?=
 =?us-ascii?Q?RSSQrCmA/z+pDxIT1px33IMMSydx797pfqBoKLlC1rh6DwV7jnMjoRg1QSLE?=
 =?us-ascii?Q?2kyhGXmqprrYUGBeCVj3podMkYeGSWC9hT4IJB+G9h62PoUQv4mBm/EAZECl?=
 =?us-ascii?Q?tDnglMN++igx5w1H0EdhTrPNLZg0s5hjqSA3w2hhMj+AEehyKUDbrWwLq0uS?=
 =?us-ascii?Q?e9EntQISpIlXU+mIceaQnyOK/JI+KrR7wCNRu8IfTZJhn3VuvfyLUd2QIKSI?=
 =?us-ascii?Q?KU5n+ln/PUvW76IbU/HBOM7VM/tdhaDedq8yi2Pb/CI6hTp9qPQHzXmPRs+x?=
 =?us-ascii?Q?ghSl0QOfVXCPHxWSE+7bqK5UfbtvsOG+S1cKMpx6iU3xos5zIdAImTY/gGc5?=
 =?us-ascii?Q?F6k4vDRBYLLoO+chcY2ingm35oQxANfjKEyBboePHZ9fNz6n8u3nobpWE6Gu?=
 =?us-ascii?Q?QWHqpA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fc1a27-a298-4654-a9fb-08dbbef1a305
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 00:35:23.3930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnXq6qq+Zu/dH/lS8nNl/peETNRH6f2DxHF3Z1uka/hHbFCu3Q3GYRAaascBejwT9+lDx9a6f0gSDqvnSGvXftMRDO10McccpPRNUNkE2Mfy4DGw5twG+ITrTbiccgvg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11388
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andrew,

> From: Andrew Lunn, Sent: Tuesday, September 26, 2023 9:48 PM
>=20
> On Tue, Sep 26, 2023 at 07:21:59AM +0000, Yoshihiro Shimoda wrote:
> > Hello Andrew,
> >
> > > From: Andrew Lunn, Sent: Monday, September 25, 2023 11:18 PM
> > >
> > > On Mon, Sep 25, 2023 at 09:34:16AM +0900, Yoshihiro Shimoda wrote:
> > > > From: Tam Nguyen <tam.nguyen.xa@renesas.com>
> > > >
> > > > Fix the MPIC.PSMCS value following the programming example in the
> > > > section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
> > > > S4 Hardware User Manual Rev.1.00.
> > > >
> > > > The value is calculated by
> > > >     MPIC.PSMCS =3D clk[MHz] / ((MDC frequency[MHz] + 1) * 2)
> > > > with the input clock frequency of 320MHz and MDC frequency of 2.5MH=
z.
> > > > Otherwise, this driver cannot communicate PHYs on the R-Car S4 Star=
ter
> > > > Kit board.
> > >
> > > If you run this calculation backwards, what frequency does
> > > MPIC_PSMCS(0x3f) map to?
> >
> > Thank you for your review! I completely misunderstood the formula. In
> > other words, the formula cannot calculate backwards. The correct
> > formula is:
> >
> > MPIC.PSMCS =3D clk[MHz] / (MDC frequency[MHz] * 2) - 1
> >
> > > Is 320MHz really fixed? For all silicon variants? Is it possible to d=
o
> > > a clk_get_rate() on a clock to get the actual clock rate?
> >
> > 320MHz is really fixed on the current existing all silicon variants.
> > Yes, it is possible to do a clk_get_rate() on a clock to get the actual
> > clock rate. So, I'll use clk_get_rate() on v2.
>=20
> Was the original version tested?

Yes, the original version was tested on Spider board.
The original version's MDC frequency was 25MHz.
And the PHY (Marvell 88E2110) on Spider board can use such frequency,
IIUC because the MDC period is 35 ns (so 28.57143MHz).

However, I don't know why this setting cannot work on the Starter Kit board
because the board also has the same PHY. I guess that this is related to
board design, especially voltage of I/O (Spider =3D 1.8V, Starter Kit =3D 3=
.3V).

Anyway, changing the MDC frequency from 25MHz to 2.5MHz works correctly on
both Spider and Starter Kit. So, I would like to apply the v3 patch [1] for=
 safe.

[1] https://lore.kernel.org/all/20230926123054.3976752-1-yoshihiro.shimoda.=
uh@renesas.com/

> I've run Marvell PHYs are 5Mhz, sometimes 6MHz. This is within spec as
> given by the datasheet, even if IEEE 802.3 says 2.5Mhz is the max.
>=20
> Now if MPIC_PSMCS(0x3f) maps to 20MHz or more, it could never of
> worked, which makes me think the clock has changed. If it maps to
> 6Mhz, yes it could of worked with some PHY but not others, and the
> clock might not of changed.

I'm sorry for lacking information. MPIC_PSMCS(0x3f) maps to 2.5MHz.

Best regards,
Yoshihiro Shimoda

>       Andrew

