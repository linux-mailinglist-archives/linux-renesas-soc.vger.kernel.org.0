Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6A87BA6EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 18:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbjJEQnV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 12:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjJEQmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:42:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::714])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3109A5D2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 02:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsy4QcOrenhA44KZhgidU/ZSWOMvvU+AH8CETXohLcNZWNudjeJPAW/Lx2fy21ChV0vDWPRR4C0HI8ud4K+8yUcJLZTCHNfysVI8BcyK700cRwjI37Da5W7u/RsZq22eVWo2Zcg2kO11Co+6K6wsiDjxMBlBaLLSOEwxWBeoV8d+KrKxXlAcYoqRvL+1eyBndU4x3U6YJdYy1t17JZ9nQcLG8On3BWHRkPjlqvaUxqBf6a+gXRo7pJ8lMZ4324ubKW2otsWC5k26U+jUt4z71ahEl+VvfygJXTo2TjV4aD/gUE2eui/tURGeYU8uwS08nBeUOn0WqR5G3+5MKD9kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYbU0D6/uIr6dIhq7ckDP4mm6f5l8HebWt6WLrcwAPM=;
 b=O9LW4tZKqWlTvJMD36OYTOxgJWEVxTJ4z/3VJnZvcWngWzIRZTo2XDrIOWGaBDMWQJfRuqUTZ9Z7EwruLNFJzshqc1q+FWSKOL39Q1cPJG3QicL1dE+s12m/YQcacmhCuYLS/SmGZgS+IkVcBTLc1kk7UeWjDN5DeqzR63344Ao+iMSzsJmDj4BJtCALCTSEmPwgVUbn73/eymJNADP6W5Z0qfzf8wN7gT2U+Vw+vgJDBnuuXhD4hwtWzWmp8lYl8Y6pH5hEwfXRdlN7fshp2q8ec9KBaXCkYxOyiaZ49OTl/d3Yu4PcwI7bi2vZx3sYfsWpZyYIP15GEbL55p+Clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYbU0D6/uIr6dIhq7ckDP4mm6f5l8HebWt6WLrcwAPM=;
 b=bC/x1lt0BNvgTXYU0i4UJ4813TFAR8BakghOyvocLzkfS9yH64xhXYlEM6DnFFsjRrv8RTwszrsQwouxLs4pzifZK8yLtUTPD3t/JBFaSa0hEL4qu708uuGMErMJVyvlc3/JHvuLzlw3td/i41VXwhakXGpFo3V8xW0LPabKoZo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11062.jpnprd01.prod.outlook.com (2603:1096:400:396::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 5 Oct
 2023 09:31:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 09:31:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Chen Yu <yu.c.chen@intel.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: Re: [PATCH] sched/fair: fix pick_eevdf to always find the correct
 se
Thread-Topic: Re: [PATCH] sched/fair: fix pick_eevdf to always find the
 correct se
Thread-Index: Adn3XJMEXg5HmmANSMuF9qI6/HDBQgABKAZAAAMp8QAAACA04A==
Date:   Thu, 5 Oct 2023 09:31:34 +0000
Message-ID: <OS0PR01MB592297E9980E99386CA46F7D86CAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59220AF3959BDC5FEFC0340F86CAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922F9C13EB44AA99B3DC6C586CAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZR6A/lsQMP+ymD1f@chenyu5-mobl2.ccr.corp.intel.com>
In-Reply-To: <ZR6A/lsQMP+ymD1f@chenyu5-mobl2.ccr.corp.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11062:EE_
x-ms-office365-filtering-correlation-id: 19196ef4-b4c0-4fc8-a055-08dbc585de09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yGelvR13Zr7+RdyehwJgt3/m3Ej0hF+ocRKMYtiAv9oYJzAfqwP8QUW36ni1TjlHzq5YWVhAOx8z9zrWzUnxOGr7+ZxsOBpU/FCsZsLmJi2czbjj0y7J5kVwjBsroDat51OK0NyopXH8Ctwje5UDqzBpBvk+/tGV+IKKOuWT2Jq2TlTmJPmmaSM6jTuAvGRdIGXsRr/bCwvs5Ayiwh3RFIWi77djuBMBfrPnQoYGwdNBf1RG4CgU/g7AIcbfQBehW1EUayU+EAt8kY9D/39PohvkI1mEUCajMrYogcRNhhw0iY40SveVmxP/Oonyp0dsY72+ifvnFNRZlUQOQcDswTZUP5u2cfNvJW+Vp2dx1k0t5f1RXQ5nMf7Ok8FYN+R9d0uOmwf2r3qZU4iJ07X7ke3ysE6kizgeJiZF1O17JhqRWVTUvCc7S565PGddjIyOZGbQrQEs3hgugm5M3Jp9vct6mKMaTqTlQJMaRQI5bN0nr2ofhuVkrQfA9rJEvEhYktnYDZ0Vh9fJYOi8yCwEwWv7T2rVfo5nB60nQQhOtxAora85KMNXB9Izd83SqEYxP9FuprFr7A+oSQKkATYZmpfxwISGdahbVf2uYA/XTw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(55016003)(38100700002)(122000001)(38070700005)(9686003)(86362001)(53546011)(64756008)(7696005)(6916009)(316002)(41300700001)(478600001)(76116006)(66476007)(54906003)(66946007)(66446008)(66556008)(966005)(6506007)(71200400001)(52536014)(33656002)(83380400001)(5660300002)(26005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vmDTQ+HvFlmn05lfOUiAfz4xEVn7WWFtKxdaKUdWAmPgW339J6ujQ1LiZd7r?=
 =?us-ascii?Q?Ld89EoxkMssv5tZvfU1/C0EHlpZR2sVTVTGDKgQkdMYbZQfcvCuybBXYbxjn?=
 =?us-ascii?Q?769PC0Rvj4M9NVRdCmGS+2aC4F4b2XXpyTf0qZjgFhyQdQd7B8WywjXrd+SK?=
 =?us-ascii?Q?15ThTuPIl8u8FMd5Hnqoc9OnA4GaEACoOHFCwp6uvs1XpOYoDIBsalF4msPv?=
 =?us-ascii?Q?TNmoCCbAKI+zD6PtlifpceVS3gseGzjuv3WJUbdfLcVhg5gFS2PaxZk5qy7j?=
 =?us-ascii?Q?im/AHhPRqvlb4S4fsVxOis4YQAhFMkwxyq2BnBTNzeNwPdfAIr3faQfF7hX0?=
 =?us-ascii?Q?slED0EFdKj8AT3DA3dYNiJ6PNC4gF5ABgT+tbrHyJl1mRQZCaK6rp2HPTZlx?=
 =?us-ascii?Q?ZyygCp4hwlrxGiS5CIwILCGJqUkKFWLWbdcgsvx/Mg8GU66mug/YnjKabSeF?=
 =?us-ascii?Q?b//iXe5+xWWgbDnGSL1FXxeTIuwiBPVAaVAnKIAA9eEe+JYoytC6n+WdkEMT?=
 =?us-ascii?Q?wCp7N4wKxzAAnvBj7dNKyPSqQ8ILUHiFqEQxcT04cx5QC8t6d1sIGiaPBjEd?=
 =?us-ascii?Q?zldOArg36YudsPRak6j0rU0iwb+0XJheliAcU5umTh6KoelcaipJNjmw7RTo?=
 =?us-ascii?Q?1Vsw6UFQKTlZjVkcxP/V6aPmp28+28Vf15IzaAb2xcwW9+k7fhC/sCZO4X0l?=
 =?us-ascii?Q?gPqwmlshLXVNQkM+PUKE46qnJuCUuyyh5OfJjcw0e2sbsAQZ4O50FXQvNdrC?=
 =?us-ascii?Q?PgxCIWBmFORbv7cT6qKZz60DbY2baJt4GkzmKxoAGaKnBjPX1dq4ahS/506b?=
 =?us-ascii?Q?AW+cNQgc0orMRDVcTae7kGEPE9WB+qyh6zyIlwaLGHWGJHf5qtNjN4w1xMOW?=
 =?us-ascii?Q?Vexb+XuYNNJlr/LVrT9NSjXe5A+mUZt+puvVUKiEtXCyHA5ab3BJFHUt28HD?=
 =?us-ascii?Q?Ys+z2OOJjb4FIdF7PuJUkSZaBFtGG7ot/XMiS+SF8ffTYxjgNdHgSD0E7jPF?=
 =?us-ascii?Q?m+NeIGU08QfVWAzmas8/HjrLNR8BAvJFN/MKtlVl1VICvRmfdIZqR0vBMwvu?=
 =?us-ascii?Q?hHZpIqMMjwbz7v4kh4P0TtGEbdFv5LOEYkeyCvO5TCqBBYFdbnI+6n2HmGTT?=
 =?us-ascii?Q?dmX072XupCQ/SziOz+dI9QO3U8cUuVpBpItr5DKhxRrMKwxks5F2s0sDKkMz?=
 =?us-ascii?Q?Qw1AJMbvQnzLwu90ffrUvF9PSYMI5cEoSFAnPm0RWtgikYVTxvW7jaUnZWJT?=
 =?us-ascii?Q?5F31xwMo8Kd81dGkSljw2GPz20xvI/KmIBkevBXJjVWsrA0ERmomqh9l/fGX?=
 =?us-ascii?Q?jXUON/nq3Bh4egK4agJ0QU3SNCsLgwyPQ6xgwNqCpVP6a8fwPcePCArpOtTi?=
 =?us-ascii?Q?Mr88rd8lWtbmX4XjfBieRR7Eu9HevGyUG4uF76ue5xU2rnEyEFJjoIe1R1/A?=
 =?us-ascii?Q?0jHQwLdxTeWM+DuujkQ5ekzy35+S+kdBryi/C5/BrwwEbePw7ywQsotzlKLk?=
 =?us-ascii?Q?kNfP7Ctqofn7SUA2EHIrE2yr9XPVvnTO2XU31MyTYUgSja/bYPYuTWnYZBqE?=
 =?us-ascii?Q?4qGOnM70FpMw4fNYFF2WAWE1GrmzT9eI40lTQ3125hID24tfe3337m5QPlBF?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19196ef4-b4c0-4fc8-a055-08dbc585de09
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 09:31:34.9222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wm/ZRdoXAz9gH6vuev1zk0s1yQJ1PijJCLcY7Hv9kQR1nQhMC7J+JxVKjA6EdMTn/EcnXStJLIrzKtj/12rK8j/bTyfsU4fw9AMzdS0GBpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11062
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Subject: Re: Re: [PATCH] sched/fair: fix pick_eevdf to always find the
> correct se
>=20
> Hi Biju,
>=20
> On 2023-10-05 at 07:58:04 +0000, Biju Das wrote:
> > Hi all,
> >
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: Thursday, October 5, 2023 8:32 AM
> > > Subject: Re: [PATCH] sched/fair: fix pick_eevdf to always find the
> > > correct se
> > >
> > > Subject: Re: [PATCH] sched/fair: fix pick_eevdf to always find the
> > > correct se
> > > Date: Wed, 4 Oct 2023 22:39:39 +0200	[thread overview]
> > > Message-ID: <c92bc8a6-225d-4fd2-88b5-8994090fb2de@samsung.com> (raw)
> > > In-Reply-To: <xm261qego72d.fsf_-_@google.com>
> > >
> > > Hi,
> > >
> > > On 30.09.2023 02:09, Benjamin Segall wrote:
> > > > The old pick_eevdf could fail to find the actual earliest eligible
> > > > deadline when it descended to the right looking for min_deadline,
> > > > but it turned out that that min_deadline wasn't actually eligible.
> > > > In that case we need to go back and search through any left
> > > > branches we skipped looking for the actual best _eligible_
> min_deadline.
> > > >
> > > > This is more expensive, but still O(log n), and at worst should
> > > > only involve descending two branches of the rbtree.
> > > >
> > > > I've run this through a userspace stress test (thank you
> > > > tools/lib/rbtree.c), so hopefully this implementation doesn't miss
> > > > any corner cases.
> > > >
> > > > Fixes: 147f3efaa241 ("sched/fair: Implement an EEVDF-like
> > > > scheduling
> > > > policy")
> > > > Signed-off-by: Ben Segall <bsegall@google.com>
> > >
> > > This patch causing issues [1] in Renesas RZ/G2L SMARC EVK platform.
> > > Reverting the patch fixes the warning messages
> > >
>=20
> Thank you for reporting this. It seems to be directly triggered by the
> pr_err in __pick_eevdf(). May I have the kernel config file you are using=
?
> I'm trying to reproduce this issue on a server.

It is reproducible with [1] and [2]. The logs I shared from [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/configs/defconfig?h=3Dnext-20231005

[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git=
/tree/arch/arm64/configs/renesas_defconfig

Cheers,
Biju
