Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733DCB5EDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 10:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfIRIPI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 04:15:08 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:50678
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729939AbfIRIPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 04:15:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5TgWUgwvEVxyYLBSWaEZmm/bB/5vxumF2tc/NhTeNbPnt1EJQOmvZnmCudNmiUMeAwjicqwuoIzSeDkcRZVLZvyvDwj3yH7PaTjcLnwd9xcbRvUzolWgehWNYBY+lmkBbHjtvmPuEgNHrJZ+0M45//NGxNtVx2D8mJqvBEyJYEgf7CdvviepPnFWBY5DYWrxCIqIEB9Nwh7wrCxWUbjd78p8CcwriV2DFYzDCV+6XvCWmAz3WNxJqVqRHwdeZ+T5O5M1p6jHHCiKlVLaiULVtzhPNl3f1jkRS5p7eATm+yWxSBxdUx9M4faqZKwFSuQq/aQgHyGzwhNxPXOY1YaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtRSHNmE7w6V1yw58RnmnhWh/iPQ4GXe9gSTu0ciB5w=;
 b=hJDJze2gEFjhZWfq7O4CJS6poRa+mcilLBKlKSu6u23GwfLfJF583kJhzxLbrejnYFKXv7bc1IzF+OIofmMfmN2WbU6ltpjeoHTKCxptecDhFcVSldWrzYBMbhhsxc9wX8x5e1AZ69g3JiYISMV4gKtG8PjXwPu8WR0CdASUvAK/qbqgjASytyKGAn8LxKyaTr5SUt1W242smmXdNBK3rNt1J3KOKPjcex55OzaKm8RUHadCm4jtUhEtJ4jLsIqGk1JTG/R+Btd+RpMmctuHk+K8njV0NcANOp9IE3i9j59KDrGLzAnOD6jakfZAyszgBYXu5xCLaiCcYmlPhYS4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtRSHNmE7w6V1yw58RnmnhWh/iPQ4GXe9gSTu0ciB5w=;
 b=gVQw/beukrVZdTSrlJXWEEioCp9U9xScMVLe1RCFaH3LFUEpW6pu+ITiHu6UFmSXOoJdMyZumV/jIuTceHSv0qbBXpKWsjAJRxxIOLLvvdrM805ggIDhoJyfWM7EuDQzLs0PhD0el0upENCU+w5a+YySJOnZvWi20qxWNBi0x8g=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3726.jpnprd01.prod.outlook.com (20.178.136.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Wed, 18 Sep 2019 08:15:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 08:15:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: fix hang up in HS400 timing mode
 selection
Thread-Topic: [PATCH] mmc: renesas_sdhi: fix hang up in HS400 timing mode
 selection
Thread-Index: AQHVbapRlmNlBZu4E0OZmsTlLvIQ5KcxE55Q
Date:   Wed, 18 Sep 2019 08:15:02 +0000
Message-ID: <TYAPR01MB45444D01948B219CEE4F86E0D88E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6fb4883-2ca3-4250-6f6f-08d73c104e92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB3726;
x-ms-traffictypediagnostic: TYAPR01MB3726:|TYAPR01MB3726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3726584BEF3A4CA4C0C6490CD88E0@TYAPR01MB3726.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(199004)(189003)(8676002)(81156014)(81166006)(6436002)(7736002)(8936002)(486006)(110136005)(186003)(229853002)(5660300002)(71200400001)(71190400001)(476003)(11346002)(54906003)(446003)(9686003)(478600001)(107886003)(7696005)(6246003)(26005)(55016002)(76176011)(6506007)(2906002)(316002)(99286004)(14454004)(102836004)(64756008)(66556008)(3846002)(6116002)(66446008)(66946007)(4326008)(25786009)(2501003)(66066001)(66476007)(52536014)(256004)(86362001)(305945005)(33656002)(74316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3726;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ROK6A0CfrEcKZPRrBD+aW/AthZMbkCHOPXPhDFVuWRp+tUWEX/HRQwCGuMggmRa+fqigpkcIMDYdIh02S/vcfxna8rZWV7ceoYqfxQXrI07efIfCh+iD6E+2P1wEkZUdDQxIJkhuO21HIHhSihWmtcrcHl3Wy4JS014sUOvFqHjSfofXvCoB9DEP0FPn/VSK6IquDlvQ5cmGLRCfqtjeQJhTbhg5/o+mqkAeJOCRkR2Sx8BbyXK+21xw6rclnMcibVS/gbcMAxbSDsmKQ/eAgQKvPgm9JG9J5p3lCd9HGe6OtNcqC/LuK//bo3S7dGaIf1lk7t+6YgE1u2L87ImsW+9M4ZOIbqVOic75CCqbZ70KyDB9i2NGer6vw+ZtCcQCVuF3MudWHgp6uhV6fQRusjU0Jij3+zlJFZx+LB98CJg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fb4883-2ca3-4250-6f6f-08d73c104e92
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 08:15:02.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8x3V2D3+EFk6h1Rnoa1iD2x7JAvBQXqlZ1qINLBpBLuVBvYkQTTAhFsxvGvPy19HaxiwVnv5HSq2Ewk7VniYlpRsMC1fib2Nw4w3t4nzeGoS6IAVT7cIZrz2UHX6qk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3726
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, September 18, 2019 7:50 AM
<snip>
>=20
> In HS400 timing mode selection, SD clock is switched like:
>=20
> 1) HS200 (200MHz) for tuning
> 2) High Speed (<=3D 52MHz) for select HS400 mode (card)
> 3) HS400 (200MHz)
>=20
> The SDHI controller needs its internal SCC component for HS400 and other
> modes which need tuning. However, SCC gets only fed a clock when the
> module clk is > 100MHz. Make sure the SCC is always active with tuning
> by enforcing at least 100MHz. Note that we only change the module clock.
> An internal divider ensures that we will still talk to the card at
> 52MHz.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: don't overwrite 'new_freq', use 'mmc_doing_retune', improve docs]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Shimoda-san: can you forward this patch to the BSP team to have a look,
> too? I needed to change their version of checking various MMC_TIMING_*
> constants because this approach did not work with current mainline for
> me. After some testing and researching, I think the solution with
> 'mmc_doing_retune' is not only working again, but also more future
> proof, in general.

I asked the BSP team about this topic, and then they have a concern about
the retune. Since they would like to check whether the software is
doing tune or not, just tuning situation is lacking on this patch.
So, if MMC subsystem has such a new flag as "doing_tune" in struct mmc_host=
,
it's helpful for it. (Also, perhaps it's helpful for adding extra quirks
on this driver in the future). What do you think?

Best regards,
Yoshihiro Shimoda

