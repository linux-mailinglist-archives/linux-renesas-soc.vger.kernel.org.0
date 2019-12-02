Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59EDF10E6FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfLBIib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:38:31 -0500
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:32288
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbfLBIia (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:38:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsErqbxcQKwHK9LbTLL29lAlo/0/rGiy5J8YfOll+TRye/8ijn1b/x+lAoamjt7IE0qIN5bbfuOl/sQcHWqGdVdcEDxRzjgMdj7/eaky96mtvm9DuHr2nEgzc+bNF1vI2ApAfIy2NjK4VUlsJE34xSzW1p3fWohK6XLE/CXh0jjgScvIKF2sjHRbGraDmTq9Cmwo/J4LpwfMeeR8ojNg3gBG5p85qUTOJ5plKmz9gln/AaV2gxfDtpLpZM5qWgCCcTEKqatQxlT4ZGasLyB2zqHSDCEwFs2rXYm+GBpaAOdVY1oMdC1PrxXSOzboG7QP1C36F5hA4Bo59kt5c6wCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPhiZGIwpbwHOaS3HxBbngPsA3UpOrSrKMtWbTOBTFY=;
 b=ml+u8wnn0UVHrHVF90UUvWSgHe4w9+NtxExRZv5Yh88noLSJTaNwpt2OwlmI6I2YFiFuR9LDT9BKUZQebauVMLf3w2dBtA7mv4MzT7aaOAF1gS2x7FZNKFfeKP2QiK8yXdfaG78Ey+FH7m8HY+ejMBVtPQKPdl2z8qEVjFF1BU1RiyUHjbAYwwZEk12WgU31MN09rR5d+tmMSQsAslDlnT3C7WMSIffIN9nGqzYus+lmQCnSFEyiiviG2MmASHIVJOeM73+hwpVxuAkbnwUa8snYflXWui2du0EtW/+5s5/x90H0pl87aH2qNRDE1gM9axvcJF5HzH/mDObJ4Jx6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPhiZGIwpbwHOaS3HxBbngPsA3UpOrSrKMtWbTOBTFY=;
 b=GtFFGbnc6K2ZQYkE95eOJJYGcmtjiQIindGn7bkXD4LSAUJYutnW0Q/UrEjmfW7RlJWYZUkpQeua/944GqmvkwbLKoCmY/BvD7uUw64LcjEtRNP0aeMvfi/2vvMtJA0WqzTLda4fKgB3L1kZTe5TL61ob9sgRltt1+a+O4MZPlk=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3277.jpnprd01.prod.outlook.com (20.177.102.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 08:38:28 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528%5]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:38:27 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set
 dma_buswidth value to 32 byte
Thread-Topic: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set
 dma_buswidth value to 32 byte
Thread-Index: AQHVoPwELQfgE6mlPkao0v5O9MIm7aehHbYAgAVtM1A=
Date:   Mon, 2 Dec 2019 08:38:27 +0000
Message-ID: <TYAPR01MB45448366F6EB1F581CD399F7D8430@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191128210728.GA864@kunai>
In-Reply-To: <20191128210728.GA864@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 73cfc0b5-e27a-4da9-d673-08d7770300e5
x-ms-traffictypediagnostic: TYAPR01MB3277:
x-microsoft-antispam-prvs: <TYAPR01MB327780E771520EB1C6032C66D8430@TYAPR01MB3277.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(199004)(189003)(55016002)(6246003)(478600001)(446003)(3846002)(6116002)(76176011)(5660300002)(229853002)(2906002)(52536014)(99286004)(316002)(6916009)(86362001)(33656002)(14454004)(66066001)(6436002)(71200400001)(76116006)(71190400001)(25786009)(7696005)(64756008)(66556008)(66946007)(66446008)(8936002)(8676002)(305945005)(7736002)(66476007)(186003)(256004)(4326008)(9686003)(6506007)(81156014)(81166006)(11346002)(102836004)(26005)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3277;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: teE7tRWo+8IbQBU1vIHPuMHlH5KtQ5jrcHWadUO9DNSRk0FiFE2/2vybk9wZg8H6tLI+pAuB2IZ9u3DUlkENLTOE6oG4aT4hP9VrRJmgcWKZhVKDf2K/eMiSZ2zQaVqEsHeFIuid9u2GyYgd7qXDWtOTw1CwtALisXTr6aa98SeK2QxkPQlsi/zQtkErcvfQ6yWEm+X3xs1VG0RWOM+mTy8tLpTZgb6lXaAWIOiswunsFh3JtGVKQGBID2B6ccLLbQEaPVSiYoRmyJ+HGwnxaSEUPwtoQ9DBDfqKzkV+W1VLEtUAp9g9FzGAaylRCtvhSC6AeH7ScHXtMPSGFY+ut+Uy+5NSVKZFyKTx9eIB5pAvu2nX2DNyWgsgNKasP4TmlP1brBHE8eCv0Ud+lKBNGaZKkFY0YDp2UNmJiqdYpAp8NMqQZO0RViBexD2hsj3q
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cfc0b5-e27a-4da9-d673-08d7770300e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:38:27.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYMhdkOXec+zyFR2NXytb+zICwmtV2Hqlg3LrEESOk2sOXBU3eNF+N1GNz/EchJOqkETdmRE2aXTlLZZb6Db5KITcbn97LtsdKdETtaPBb3h1s8qb1aiC35/EKG5PxH2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3277
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for your comments!

> From: Wolfram Sang, Sent: Friday, November 29, 2019 6:07 AM
>=20
> Hi Shimoda-san,
>=20
> Interesting series!
>=20
> > -	.dma_buswidth	=3D DMA_SLAVE_BUSWIDTH_4_BYTES,
> > +	.dma_buswidth	=3D DMA_SLAVE_BUSWIDTH_32_BYTES,
>=20
> Two very high level questions:
>=20
> 1) can't we set dma_priv->dma_buswidth at runtime when we know what the
> card is capable of? Either DMA_SLAVE_BUSWIDTH_32_BYTES or
> DMA_SLAVE_BUSWIDTH_4_BYTES? Then we don't need to fallback to PIO.
> AFAIS, we only Gen2 sets .dma_buswidth in of_data, so we could even
> remove it from of_data entirely?

As I replied to Ulrich-san on other email thread, for now, rcar-dmac has a =
limitation
on dmaengine_slave_config(), we should not call it at runtime. But, I don't=
 think
any sd card have such a limitation. In other words, if rcar-dmac doesn't ha=
ve
the limitation, I think we can change the buswidth at runtime and then we c=
an
remove the .dma_buswidth from of_data.

> 2) Just by grepping in mmc/hosts, I see that no driver uses
> DMA_SLAVE_BUSWIDTH_32_BYTES. Do you have an idea why? Because it is the
> convenient setting which works for all cards?

I also grepped in drivers/dma, and all dmaengine drivers except Renesas rel=
ated
SoCs don't support DMA_SLAVE_BUSWIDTH_32_BYTES. So, I think no driver uses
the 32 bytes on mmc/hosts :)

Best regards,
Yoshihiro Shimoda

> Thanks and kind regards,
>=20
>    Wolfram

