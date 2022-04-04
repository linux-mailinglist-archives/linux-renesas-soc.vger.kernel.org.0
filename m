Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD6A4F1465
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236869AbiDDMJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbiDDMJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:09:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6693DA53;
        Mon,  4 Apr 2022 05:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxM7v3oAZ8x3j5cxIaMNDDGSVMx20fJBj5eA2Km7MUvSePR6lr1qurhwIS1k4N732FX57WEDgMVZjWBDLLxB0tm8wFAZsFpjSS2KOfTtyN3SNspZb7bgpQ97C6lkbj1LRh+e6H54pEk5Nzn0QS+QswDc106xv0kOIEDXU0Z5stZvxaAxox5TQm7FM80xjcFY04nWswK+HgNz4hLuzBQTf3FtE6jmJOuxC096cduk5LYD1pNIYG3+KgCg3gALMWuncQD9tdsBZnht81OXrssXYo0ImRWAmL9/jMX207gWJHn2PKNjoMtfAHSUPYqjLN++yNhNY94qoxM1sOZNVlvoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLwko4NKnEC3zNRDCYAVi5bXCWMnStFVf96If6kGK4Y=;
 b=LkJGQtD+Wr90XBeO70/7PUBXI0hIWmqWdCWpwfqbTacMS7/S7qbE1r+UzFtQPAifFDYcQsdaMJbBqVdAx/3Fl2gR+oXZntR6ZK7xcrRgxB1+VvoeQpfPecXITxLBYM9/1KXwjRHU8mprgAP6WBq4Ifc5qWLGa7x/Wsyy7dJFTDJaBP5RliMEVsYDTyTxSMGO8AUDRiGYFMbw75LFSKv35cJWl0SOD3Wh5INO5HvppGYI85arHqwlNO+1unLbcS5uaYIG4PkEbDqDTGfOOVIA6NChqR5kgq2TMkqR048e/fnB7oozGH8rZ2ukxF2DKDnJzmJbvXBZmdQfJQ3A3GOuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLwko4NKnEC3zNRDCYAVi5bXCWMnStFVf96If6kGK4Y=;
 b=fiK336jn4Z8SQ7ddZDC1xlUg+4+uhLzYZIfmaaSCubfElMawi9Tb+sYfbOXbrknDdfCS85SClg6Ui8j2zn8XdgDTLM9gch1pXxX44VYVVMq4AFVS4zjqCakTnhtZqgeX0jFiDQ/5Fycw8e65nJLLkvAAPc9R4/z6KvzDIdFtbTs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB3053.jpnprd01.prod.outlook.com
 (2603:1096:404:8a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:07:29 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053%8]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:07:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: don't overwrite TAP settings when
 HS400 tuning is complete
Thread-Topic: [PATCH] mmc: renesas_sdhi: don't overwrite TAP settings when
 HS400 tuning is complete
Thread-Index: AQHYSBn/3TlYVbVFYEyd9huZN3UIPazfprwA
Date:   Mon, 4 Apr 2022 12:07:29 +0000
Message-ID: <TYBPR01MB53417BC479E584869FE6643ED8E59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220404114902.12175-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404114902.12175-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4fdef13-2932-4a06-8110-08da1633b0f4
x-ms-traffictypediagnostic: TYAPR01MB3053:EE_
x-microsoft-antispam-prvs: <TYAPR01MB3053543195CC05CC11B84847D8E59@TYAPR01MB3053.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kQ7H47fuEhXmGydRoMs/QBObdVBBEovPvtyF5WTM46YsFYTsZQfJUEJndnazUQkOnL0l8X9as9iUlON+Sf78PQ4s5SDstZSMTuEbKQziGXHgNpj8Ax32mxewuqA0QuozEQuPKzv1XxKI/ln5rlsNWZ0C0Q+xRg13ZfuBGRJ1sk12vCfAnqyfRWqngByIz4uZ0bgxRg9Ux6DWCX+3mC8c64KRurF9u5o7XqA1msmFDdX3r01LfXTq0qp+nS3P7PwVDsdoRCUhcH6AW+st46tH1ppqbABd8/ng1z1dAInLw7L/SrdJtK570VM7DpYot5A4YtYOMbQM2lpJ9lqD3Rhm5iHV91PnW4EO3okBfO7aXas24eQaMLI7aqDCBvcRBGNuyElkm+jkVCEMMhrI2AocJS+qSHhc+qYRwiD/UKEWIDh4svrU7nt5S+E17Bav+lLFa8yQ5P32hxC82bZmb0/Oq8ugb8ahE9COS5ffonj+J00cehypVfrZJ/15bnAjG9GYBgZ9xNt2LELZIQj5Rihd932JbMppOI2zGCbw0n61Q4hGnyRsbH+q5mzPdK1cF+NTpcnyMrSFDHrs2wmNT5NBRfbg7VmKzknrbGBwuosPDFdNoxF1RF/vRYgsh0MNblfKpf42SZ4L0VeSy/gDG+4gpEzt7UTO9K5xWN4Adr2hPVaBMPZl1166LlMrD+23kHZlAMoSjuagaERzc98IRipzFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(52536014)(4744005)(38100700002)(38070700005)(2906002)(122000001)(110136005)(9686003)(316002)(186003)(71200400001)(6506007)(7696005)(508600001)(66446008)(64756008)(8676002)(4326008)(66476007)(66556008)(66946007)(76116006)(83380400001)(86362001)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tfdZeoRopWXdZnQRVPPqSVYwuqor8031UyNMZ76UMDFQvfSuXL959r/EDLa8?=
 =?us-ascii?Q?54sjgDxUmM4iG+M+DWIrc1dnd8p4xZB1hN4PvEv5ZvSr8FCWpyuAGyQ8ckdT?=
 =?us-ascii?Q?n+fhZXvH2z8o3XEOdGy/EXK8k6yx5D0jOL2r+ZLbTiQ8AF+ad8Ic2eH+FQLm?=
 =?us-ascii?Q?rhgU6Y6kIZE4Jw6gvQ06N+gj6NTZlYTVh8FtSpjr4O+6TDkdKCxyKEoNaozV?=
 =?us-ascii?Q?H5PSMOusLes4+ZbLgj+rZgqdOvTxKeeOFVVWjrguAmpzRE4lum9xnTtqvLEU?=
 =?us-ascii?Q?Hb4VyEgBDYQNuK8QwoI/yiilBrJMgoRs2hJxMRHXcGh+uRBUX+4JdyXJ2Y44?=
 =?us-ascii?Q?lJXF8zdvkjXsFq4oDD4A9HjC1oRZc8fU1mQIZpHf2Vn1+ATisxjiuoWt1JJT?=
 =?us-ascii?Q?iGa3mrT9Vl4NupWwxb0N4XfQapuVYDlWvXTxNIyJLGVLnz+ywY/5Tcnwpamv?=
 =?us-ascii?Q?zFtxxbPFX4pcsEFWhsdjKw3J9CEF0pW3veWGVXOA1D+Ms5Bq17JrmS7m3nD7?=
 =?us-ascii?Q?oaw/gnmq7Y8SJgwsvHc5RjSekNy2gMrr062r3J6a3np36AwXLtn52qVeuidy?=
 =?us-ascii?Q?OFvQl1wmgr+FLnRLxH5MGbRD0w5E5IbwgqRyBsQNpklAI4mP6VBLY3/DG2K6?=
 =?us-ascii?Q?PbwyFpRoAPk5+lDBDlL5kxa7UjEHzuboKqEP1BqefinW5EChaO9K38geb/yW?=
 =?us-ascii?Q?v2lzGQJu8vGeO9lkZduX3p70W73TC61u9Wm2D2QjDh/lXKC6Y94oO7UP/AVY?=
 =?us-ascii?Q?R3NqcFRc7UrwKu4LXDmQrynyciPS+NLmSYrgwjQtVfgaxGQ7Wyahpstua9hv?=
 =?us-ascii?Q?0BlUGVO5b1bL+2StDRBABBUEcoLADuCODjjPu6avvBucitAFgNXm3QVSObxq?=
 =?us-ascii?Q?6jYGFZB85GKT6gMbMejdDJkuuAIjC62JWqlyQHcOuUgESFpypET45Msf/sN/?=
 =?us-ascii?Q?F21HORJnDLWJrb6r/J9opHpu9sTekgrGnwaQN6lX+BdipCxsYnrFubUMsprj?=
 =?us-ascii?Q?uhquWd/FmknaCmmjzzFV9OWhZLAPVVmJ0qvykHpguI21ty8ORxy63GERevO0?=
 =?us-ascii?Q?0IVl9eYfiGHDykW4JeifO32kpTqCAiKLlnfHRIYuqtR/s4sQn+VDkQT74zmk?=
 =?us-ascii?Q?1jbVR55lyPN7c1IUifQYsk+GJ1zbbKnwQK4Pfd0c/1IwrBvNrHqrqut3LiyM?=
 =?us-ascii?Q?533pJ41l6vMH7v5d+M17pAhfu01jQcVweDtP2j5aUdFoEEAbRtPlWCLBBjM2?=
 =?us-ascii?Q?A+FqAubezzwtCMEjNfscyy5tpt5//3qQ2/QY6kOHieq2i8/DWO+pjntdWr2F?=
 =?us-ascii?Q?nIPrX2AXvwa/s4rxPefy1AadszwVhuCp27mW8JP5oKLGznoB4zIojyznP8DR?=
 =?us-ascii?Q?qu/rcI8BdfMpZUnqHdb3PUMfBFmkS1LVU3+BArO3qD5SefNjbmEoglRX/+sE?=
 =?us-ascii?Q?ltym7hKwTVmk1HbH+Q24DVm+6amuQJ5WHEkkrkeLvK8vf2tX/p60DS83plXW?=
 =?us-ascii?Q?RF4gJgqyheNnqQuUi3HfbaYp+v4F7xYHeHzNJk4fKF5oluQAK27GbbrK/k38?=
 =?us-ascii?Q?aB+LC3zzvHOQEn0Wa94xJt6E9Ygq3aC3gjjYe5mVpd+95REPSLI4zOtZTacW?=
 =?us-ascii?Q?gVVJE/oOHR7K7d7p6ftBetQ/0xuCwzqt/8QPJ0uJ1CHpfRBlSpzlkkmtWfBL?=
 =?us-ascii?Q?MHTFBckyGqY6OPDr9W7RYBvmmo9Vkqler4f3ewn1yD1Hh5CI4G+gGsX3+Os3?=
 =?us-ascii?Q?Nc/tolaeI0F+ELs79VHEQCBD96ObhVwj820RCa1DzOPCaGwtNSEJohntgQRj?=
x-ms-exchange-antispam-messagedata-1: HPHxuXZ103QnsXQtArvuwb0wMA5uSlP4giM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fdef13-2932-4a06-8110-08da1633b0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:07:29.3678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1ZX/fp9Myt0Vs0ouMQ0+lgJVf/3ftW6Toa/TU/rRENmTPVy8pexBSQn7sAdFx4BVY547/rx21G+WxtO6VJuZFtiQKUpFUOheutl5xu+fOBk/v6Dnr2+qioMCbrHGBZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3053
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Monday, April 4, 2022 8:49 PM
>=20
> When HS400 tuning is complete and HS400 is going to be activated, we
> have to keep the current number of TAPs and should not overwrite them
> with a hardcoded value. This was probably a copy&paste mistake when
> upporting HS400 support from the BSP.
>=20
> Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Lightly tested with a Renesas R-Car M3N SoC. I think I can't really test
> it because my TAPs are usually stable in my environment. The fix should
> be obvious, though. Shimoda-san, are you happy with it?

Thank you for the patch and test it on your environment. I'm happy with it.
I reviewed this patch, and it looks good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

