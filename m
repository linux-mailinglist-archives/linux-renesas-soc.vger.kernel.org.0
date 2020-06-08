Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F59C1F12A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 08:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbgFHGCq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 02:02:46 -0400
Received: from mail-eopbgr1300100.outbound.protection.outlook.com ([40.107.130.100]:19376
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728159AbgFHGCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 02:02:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agsX9L39Spa3hIEK0o6ONeq230JOVnBfEw18ti9h3qf0vJEJ7otEyA2nS/yUk1nUqmdmx0NClkOUB6/6R60+UIuAy4PxD/uQtNenXmRI3bbAHLk0s0oppMjbcaAdEfqEcdcN44abtD6lpTeHLZeOk3vTNNICnx9EtHpLbfirLnk5F8ShIh+feFU1GBHwgHVwepMl6ok2GZwXRXeURwQczjWVYwftFTfnBpAWyj3V39M4NHgoCFUujbPCppRL7ikqHPgmJNjjqVAzPEnsIQvnCy6V7cDQB8IWHHGx7d8Cs0fUn6L2lYbsllP2oTzSSg1nEYxTqyODsfLGasSzOXN7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcYW1BQ0bk6J7OSs/PNSxHDAnWAUzxtPnF+/W+aopZY=;
 b=VlwBIvXeAN13oj94zaMHGiCqlXYB/VaTsKXNOsTZoY0GAgUZYqB3vraSlzXqvpjXpFX5m7kQOlUyPAJxfrkCeHaTpr/u4gSSwqH+clt3yPC8DWIhIS4GqOrLguCMfN+WlI8BasyP2u2GA6LhB8BUgs1yF3hY0ztlZdH0QZeQnzgKNa0foTNlQRoHeGdk0+A00t0zzMM3oVbpswfRe5c0VF4JjmSpyTuzGAVJNw24Nr+9caJgMYi+m91omF9xx+/llN3EyjBCfeUZTk+7HKjc5LYXbhX/UP2K4JaU92Poh13vfA2Fynjhlv3b3INBrF1z7GtTnYaX0hlVI8WXJNJwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcYW1BQ0bk6J7OSs/PNSxHDAnWAUzxtPnF+/W+aopZY=;
 b=JVSuH1fkL9jmmmvcGhraF4bFC7f4xl/cD3lMmfJVlCf+KH0wn6ezJSjM8YhU+LgyLDDX0fot8s9WeWQaUmQwWxRdlhJuiek7Gk03/3bBDqovPNE9916wnyWmfEVLPsRtjE935XwlZ/UOArJl+qqiuqMMUfKWr9O9ans2Q7dVpqE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3547.jpnprd01.prod.outlook.com (2603:1096:404:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 06:02:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 06:02:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] mmc: core: when downgrading HS400, callback into
 drivers earlier
Thread-Topic: [PATCH 1/2] mmc: core: when downgrading HS400, callback into
 drivers earlier
Thread-Index: AQHWOmI3Nx6zJ2C2OUWQ6X8UubntrajOPffA
Date:   Mon, 8 Jun 2020 06:02:40 +0000
Message-ID: <TY2PR01MB369228A84C46D582D1219EFFD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200604112040.22144-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 828241ff-f46c-438b-cc91-08d80b718daa
x-ms-traffictypediagnostic: TY2PR01MB3547:
x-microsoft-antispam-prvs: <TY2PR01MB354714C341C3DD7EBC2C6D3AD8850@TY2PR01MB3547.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEgbjWq+UUygRPCfIeCWpyWJ0AAICum5ED7zRUV3vj4WWBnpSdAyV0cOhOtrzxVbzWgKZa++V5WMN3jCzMYNJN+ZopW+kzAPo0i287mT+VYv+Zc0+FlosvcTABAVzk+9xJXvCxRpI5PiA3tgDTTWZYQLrcV9i83Qorvc3ek/dv2p9D9pGAhY/bXdETwh0cgydqy4cVj/DQaxFd2Wy8wJZ9JHUnUJ5Obxb4wHWDIJrmTGPRGjzDaDoxC7cVE3z+1dI/YJkKQFfWV1JnP8sC0fWfhtNALHhW+PFIXVcsQPgpWOWIbN7BCdLWktm6C4LIIOxxGycQdgj8led+bKdRBdsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(9686003)(8676002)(55016002)(316002)(55236004)(2906002)(7696005)(33656002)(86362001)(186003)(478600001)(6506007)(83380400001)(110136005)(71200400001)(66476007)(8936002)(66946007)(76116006)(26005)(4326008)(64756008)(66446008)(66556008)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 82oQ0oyrBqxCeUlpqWWn7rX3F7x8gOFdJpu+nF95OB9dOqdRAJJw2SzED3II8VoIexCnfhxrFN/l8V7ziJHvi2QLfvhuykchAiItlmiDVT5pUeNjYheQERQjNulz8bW8/0W/H0zdKCTLy0FaCzjkTegxn6dy8XiT1efjpSC33jebTaJ34ZRrQg3WZKa4yDS0FRRfvMHGpXar6EK+CbWtfXqYliJramMpISrTJ5IZP0LJ+LlJbIHr6Rd540KIRtVlNb0GOoU9ZrmwDxblonrY+1mITzaMA/v0IbQv9f4Yv4qio43CZ5eCGW2przoiVR0LlOImwH0aGV6dhff/+LiT2b+xP8QS4ZVoxDwHlxhUj2kQF6h9lwJe06CescuX1ppNythsf6HNfAqRPbUBJ1Gk+Ybq+HzeezQsCuUOKfJn25b9fI4DhgAPo9DtgdiS1uelON1RU6HgUYQ5zG8rE34whOyW09r5Ia70rLrQuP3npj7eAuQzCW3uaqdKMIzGwjE1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828241ff-f46c-438b-cc91-08d80b718daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 06:02:40.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1X9+7JoGNrPBKtZGcndHxJqZOAH/7ZfVu1dcVIk4tz4pNczteOlteP9fzZZ93JuIyuPTMzWjjGtD3HsoPSJck4c/25zitjDKfaCugher3GNKUMEqW75HB314eK8soKG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3547
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, June 4, 2020 8:21 PM
>=20
> The driver specific downgrade function makes more sense if we run it
> before we switch anything, not after we already switched. Otherwise some
> non-HS400 communication has already happened.
>=20
> No need to convert users. There is only one currenty which needs this
> change in a later patchset.

Perhaps, should we add Fixes tag like below?

Fixes: ba6c7ac3a2f4 ("mmc: core: more fine-grained hooks for HS400 tuning")

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/core/mmc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 4203303f946a..f97994eace3b 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1156,6 +1156,10 @@ static int mmc_select_hs400(struct mmc_card *card)
>  	      host->ios.bus_width =3D=3D MMC_BUS_WIDTH_8))
>  		return 0;
>=20
> +	/* Prepare host to downgrade to HS timing */
> +	if (host->ops->hs400_downgrade)
> +		host->ops->hs400_downgrade(host);
> +

IICU, we should call hs400_downgrade() between the __mmc_switch("EXT_CSD_TI=
MING_HS")
and mmc_set_timing(card->host, MMC_TIMING_MMC_HS) because the switch comman=
d should
be issued in HS400 mode.

>  	/* Switch card to HS mode */
>  	val =3D EXT_CSD_TIMING_HS;
>  	err =3D __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
> @@ -1171,10 +1175,6 @@ static int mmc_select_hs400(struct mmc_card *card)
>  	/* Set host controller to HS timing */
>  	mmc_set_timing(card->host, MMC_TIMING_MMC_HS);
>=20
> -	/* Prepare host to downgrade to HS timing */
> -	if (host->ops->hs400_downgrade)
> -		host->ops->hs400_downgrade(host);
> -
>  	/* Reduce frequency to HS frequency */
>  	max_dtr =3D card->ext_csd.hs_max_dtr;
>  	mmc_set_clock(host, max_dtr);
> @@ -1241,6 +1241,9 @@ int mmc_hs400_to_hs200(struct mmc_card *card)
>  	int err;
>  	u8 val;
>=20
> +	if (host->ops->hs400_downgrade)
> +		host->ops->hs400_downgrade(host);
> +

IIUC, this also should be called between
__mmc_switch("EXT_CSD_TIMING_HS") to mmc_set_timing(MMC_TIMING_MMC_DDR52).

Best regards,
Yoshihiro Shimoda

