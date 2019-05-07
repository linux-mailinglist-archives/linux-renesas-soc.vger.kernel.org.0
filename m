Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9B715E32
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 09:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfEGH1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 03:27:44 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:48406
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbfEGH1o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 03:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxt1hu7t/cMjhHC3AFmRgLY8q1X4jVZ5uxheCQw4xpg=;
 b=Judt++N+rsVDYgJukoBbrMN0FXnbJr0JrSeIxKXmGqghPdXrkD+2YwIR4sgYRUyLnLiiqANJGERlDr/Yn3bAhp3oSkqG96SmNdGehXzhOuXfT6mzxTZr7cW2VZSuNjygtiFbkoEjY8OQwUuBf8Xmk8QFTIMUj/EmW5f8999UnB8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3606.jpnprd01.prod.outlook.com (20.178.97.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 07:27:40 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 07:27:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] mmc: renesas_sdhi_internal_dmac: use multiple
 segments if possible
Thread-Topic: [PATCH 3/3] mmc: renesas_sdhi_internal_dmac: use multiple
 segments if possible
Thread-Index: AQHU+/AjXy3xSDmcPE6SxBDkwJ4NFaZOL18AgBEhvGA=
Date:   Tue, 7 May 2019 07:27:40 +0000
Message-ID: <OSBPR01MB3174C6DEEFD26C21765B1786D8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190426093711.GC1031@kunai>
In-Reply-To: <20190426093711.GC1031@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61ce00bf-fc96-4023-cd89-08d6d2bd7d23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3606;
x-ms-traffictypediagnostic: OSBPR01MB3606:
x-microsoft-antispam-prvs: <OSBPR01MB3606031F35A89FE7BBAA78AED8310@OSBPR01MB3606.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(81166006)(9686003)(2906002)(478600001)(14454004)(476003)(81156014)(74316002)(8936002)(7696005)(33656002)(26005)(186003)(52536014)(71190400001)(71200400001)(25786009)(64756008)(66446008)(66556008)(66476007)(73956011)(66946007)(8676002)(66066001)(76116006)(446003)(11346002)(6116002)(3846002)(102836004)(86362001)(6506007)(76176011)(99286004)(4326008)(6916009)(68736007)(486006)(229853002)(5660300002)(6436002)(7736002)(305945005)(53936002)(316002)(256004)(6246003)(55016002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3606;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q3H6RypNMvjnL9OsLds5XAhaHfv335VH4P6Q9KDCwN1jl3LYo+QyiC1ES7RaVAO5yL1qS80mNmQhr5Li7VWNiV5/N69fN+tnBaJkrEcUZwC03A3IqOjWcDid8OlSA5BvadWfXwmCYrYWgGgPCaTUghK48EawfY+poHp04CncgUyJehFQ/avJFiYRqvtnFd06SCFgVN4osKzWknoDXIlrixOq/4KjfDCV/Mm0KoWJVK5qMFetyT2ANJTTF0YnUDeJxL3BJFm86+s0GoLr9lNyj/V+MSNHhsPRt8+dVeeg4nvRMEWVDoWkNStgWiDbFjAjDkEsrnGdpiv5PEXb+/RR34QuXbOiFTfCB5yAgkUwPxt2dkhdV8taRsBsJT00CsbJbrxILBlYdZMfsAxdIG5xLBjZSRjEj3ANfZqG8CgBdTM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ce00bf-fc96-4023-cd89-08d6d2bd7d23
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 07:27:40.7912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3606
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, April 26, 2019 6:37 PM
>=20
>=20
> > +static void
> > +renesas_sdhi_internal_dmac_init_card(struct tmio_mmc_host *host,
> > +				     struct mmc_card *card)
> > +{
> > +	if (host->pdev->dev.iommu_group &&
> > +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> > +		host->mmc->max_segs =3D 512;
> > +	else
> > +		host->mmc->max_segs =3D host->pdata->max_segs;
> > +}
> > +
>=20
> Will this work with Gen2 as well if we explicitly set max_segs in
> of_rcar_gen2_compatible (renesas_sdhi_sys_dmac.c)?

Yes, Gen2 (renesas_sdhi_sys_dmac.c) can work with max_segs =3D 512.
# Enabling IPMMU on Gen2 might cause some troubles anyway regardless the ma=
x_segs value though.

> Then we could simply
> move the above chunk to renesas_sdhi_core.c and use this minimal diff.
>=20
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -726,6 +726,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>=20
>  	/* SDR speeds are only available on Gen2+ */
>  	if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
> +		host->ops.init_card =3D renesas_sdhi_init_card;
> +
>  		/* card_busy caused issues on r8a73a4 (pre-Gen2) CD-less SDHI */
>  		host->ops.card_busy =3D renesas_sdhi_card_busy;
>  		host->ops.start_signal_voltage_switch =3D
>=20
> What do you think, Shimoda-san?

I think it's a nice idea. So, I'll modify this patch on v2.

Best regards,
Yoshihiro Shimoda

