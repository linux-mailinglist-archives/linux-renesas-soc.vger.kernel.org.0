Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AAF2757C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgIWMRO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 08:17:14 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:19520
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgIWMRO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 08:17:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmVtOxkl4jzArGNVjAYKUen6Z9HH4ah0YpO2XZfPq2CAufPNZSJ6dUnMs1ckhc3lT4jznTp6lpQ33MPKVN6dPmqCNj0aic9NnRyO1r5Gwv3ztKs1QtwTYIUSw3VV3P/2mWcTQeMpI0ODrzMhWqDd+kRhyd4wIB8laNr7CHSbngjzz6XPJWUlE13aW0NYD7Bw7FtpCEUWXONJyfo8WdlcrHw+H/kPgWgb/pXpfZecKikXpUMmxDKYHk9qevSMy4qJNdqAR567RIiBWsYE3HRTLZ3BaaDecK+wQMSo8BynuVnvabUrgT7vzmB7Nhcz9E1BAn+DUkJHUUOSfqyd8//26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v71v6FdvABqAfVMTWCFLoBHaTQh6JNKQMeegnM0gdx0=;
 b=atfowldtgMU1KIdMy1cgLwccLjCI5T3pUZ7Kpej1QOGjmGNfP96w9OsXoTBFjoOuEwC5OS0rMIWsrQ3mwWQZNeUAI0oMuuQp1qiebUyf04NGYQqFR04mm2CuF64i5yfdZTTQPdT13vIwEtEO7IrVmE+OiDc6/2yrHLUgzwtJfKZchcuk8oAU8smZ8aUAXGE99tdUozp4tgew73CH0CEXkKrg1svtrcGZkakKOXtN4/NXyK67h2zddr3r26u8Mg0Zoayp/78Cep3JkDQRLIl0okDh97IAUM6rd+zdNHOzei8dnY8xpgspdPyDTqkClVeWHtm1xyL5NUUL5V79WxuDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v71v6FdvABqAfVMTWCFLoBHaTQh6JNKQMeegnM0gdx0=;
 b=r1z7QPHdNGB/dkePZeXhM+0xzXD2Mejd16WrKP90W2pYQRZTqDRSkL2tSpnXkmGIz5EfMEijEC1ZwooJeA5F0NNhklG8Tdc9ALY9b79yyWLIcLS2Ql3Ibpk7Q/1ycUfPNuy906PQmx6Digm+h+4RteaI1i8+wi8uFUtNHrNSwjg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1549.jpnprd01.prod.outlook.com (2603:1096:403:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 12:17:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 12:17:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH RFT] mmc: renesas_sdhi: drop local flag for tuning
Thread-Topic: [PATCH RFT] mmc: renesas_sdhi: drop local flag for tuning
Thread-Index: AQHWkQUHBRdMid7yB0aKz627HwVWEal2Ij8w
Date:   Wed, 23 Sep 2020 12:17:11 +0000
Message-ID: <TY2PR01MB3692E6499F510DA2949E2EA5D8380@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200922172253.4458-1-wsa@kernel.org>
In-Reply-To: <20200922172253.4458-1-wsa@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e145a3f4-f283-4ac0-36b8-08d85fba99a9
x-ms-traffictypediagnostic: TYXPR01MB1549:
x-microsoft-antispam-prvs: <TYXPR01MB1549CDE8849B47672EF3A7EFD8380@TYXPR01MB1549.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vfuuWfNdHnATIrk40HWLmUBHqFhjrJTolPaWBuSDrbjTWj6GlfIcrOrQZS6n0X+Xtksvm5BKpjX4Ilz98nGJC1Y0EGEr8XCvh76gtpJTimi6E5f4Sa9asPuIG+tVC33IBYByZiyEFzuuzG0GnL8NBDc/kEzw9UKczw7zYdoUSReEJnAmWbC1yolx4z49nCSk9xhZaJgA3kQHOoHgPtyZqlkvk/PwQrp3g7K3iYTaJlejY83713O8CabhwOl5Pk11uAS6bNy1wKOEt2/KbWLQAyLWzl0ZlQaD2TgvLxm92YrkCNZBLOJwBHFxksEHEdDGazd5EaU9n/5lArbEZNG3Qg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(8936002)(5660300002)(7696005)(8676002)(186003)(54906003)(66446008)(66946007)(478600001)(66476007)(66556008)(64756008)(6506007)(4326008)(86362001)(76116006)(55016002)(52536014)(2906002)(110136005)(4744005)(33656002)(55236004)(316002)(9686003)(26005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: T/U8JZJY5NmmIFdneXRBgRNPqyqt56xqXpcGHtovJjN90Qqavex8uGpVAk93nl0gHBVjiJX31ANCGBd4vcJasPH8jFhLyXZWZCgeK54wOwwqcYIQgytbo4kfPuM2/078/dKXIHKdcYoXaYRn/poV3Gr+gOY+7V3raJRhm6p7hXvM5gq1iMkJmDuUM5Ny0XuJBYFQMbFyZQvMKwN1oJUeNWe4bJwfSWT6qbINmDfg+ukibzfdFWKT2sipVN0ugdymcELoKnSm577hRb+0przyTQW9L1EkdRI8VmF11GTK/44DfHH0Q/db05U5vppogBkFyJGnxHixWeZKr5Bht+dsiEYkyHsy4zVwZ8+MIVVn+S5xmqODcrXmJyBM78BECk0H8ulsDfXEJigYaV2ux2/Y882wggTELLaSkrFDfwcTJXFuXT7pspvk0stdMwW7dvHvvStd+VZPdbjDLR4Y0EVM3iBTmOV2K6qVLXTsGFOX/7yndowBjKrumO3A9hCVPaNb+i1ZrSYC+VwOJg7axa30L0bFX6mt8BG6eQgPcGKjm6vv5Msm3/jRZoxS06IoRq4hKT1jyqNB+3xyQMBJAE+x8FwXDuw0fmnQQtoFEaH4YxegIk4hhj3DSvZsxvPmHS27F2hytYBNAOr1fvH0Kap5Wg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e145a3f4-f283-4ac0-36b8-08d85fba99a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 12:17:11.7895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbUt1BnaWCx2YrUvJ1uV1vF3sZuy/aRfByYiSjePgXZqW/6EfBqqO/5KbEkdkkWf2WEiUcYNXX6bj49hNWZUrNtHhf7ksEaCq/f0DK70pe/TxTCSyuwxrEhve9G6dQ9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1549
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, September 23, 2020 2:23 AM
>=20
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> The MMC core has now a generic check if some tuning is in progress. Its
> protected area is a bit larger than the custom one in this driver but we
> concluded that this works equally well for the intended case. So, drop
> the local flag and switch to the generic one.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> I had this patch applied while working on other SDHI topics and
> experienced no regressions. But I'd like to give Shimoda-san and the BSP
> team some time for testing. We agreed on the approach already.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on r8a779[56]1-salvator-xs. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

