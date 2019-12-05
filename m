Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C201140A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfLEMNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:13:43 -0500
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:49696
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729048AbfLEMNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:13:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy72Ei9eBRwDGuqpvVxt6JCcOFjRGBTUtC3p8NUVurydJm/E+duVlkTm1TV/n3gTRvHy8QL6n6uEQnAQ8uAoQKnD8fjCHD3QXjKp6s8KvFQN6gMtVQWpiH3uNweiXIOLI7/dfU5lJuWKFzLhy6Tyh9yYYnArYOA7wsMrtDc2cjgwd810rJiunU9D6v9Wvg08UegWz3KXtPZwlp63N53G37pA6jqKjGp35qCMpitSmS7fTlgGP4MaxfCCYhL857uL2zcZFYqJLXrobxgAQhWqG4YjuT37y4uJ4vIa5Spi9YAM6A7nHS1qeVlYgw2TRHEy49gbutHqAo4LqtB+EN1Nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qaPuQorawOTWSG9QkcNqZVXpeoU4EwIH5RCMV6x+8E=;
 b=SujCzGgBjF83bQuOiOSFFHhJpSGY8Sgo6vuzgLFAyKaIZFFz/LXh6dkIGHIj70j+YZTaCnm8Q8grynNf9ZkO2gR9VbU4T2iCeRF2IW5JIhwBEe1AWrX5Ci3ksTdRXC/O3cNjhrnkV2HAVx3OirluAopwEbud/2Evc7AkvRqOrP8OEuxEcQjT9mpT4OLs2MVoR4ZLmQtHOBWlRxNSbkRKAvc/Wn3eur+aHCuG9XYE8lPnHedTSCbVUH1h+hnjGHBEZYGMAlX6iANx/F2aZiNMWjazlIjmZtyv/rxFnpDV9HeBMfu8PC3vM2LvSQ9WM20tpnjDHkp5QKIdLUKfxdAwhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qaPuQorawOTWSG9QkcNqZVXpeoU4EwIH5RCMV6x+8E=;
 b=Cyq/o8WlX7tQS8EdOL+gQ9bfW6DumcGcusrv5QT7MHqzCzKrLlKUdQg2/NsqVuPVXJ6wdxeO2sUJt0B08P+Xkbbs3e3LDFoNBRbtRMo6ne2HdPdDEDfGsoX9gRkjRcHPXV2U+Dv5/zWduQzapYay5jtnQb2C7NF+ft7BR9ueK7Y=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4752.jpnprd01.prod.outlook.com (20.179.186.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 5 Dec 2019 12:13:39 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:13:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/5] mmc: renesas_sdhi: make warning more precise
Thread-Topic: [PATCH 2/5] mmc: renesas_sdhi: make warning more precise
Thread-Index: AQHVqhT/eeDpQl50wEy5utvVR0UlQKerdpcg
Date:   Thu, 5 Dec 2019 12:13:39 +0000
Message-ID: <TYAPR01MB4544D508F660975815888B8ED85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
 <20191203200513.1758-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee893849-ab49-46f8-1899-08d7797c9031
x-ms-traffictypediagnostic: TYAPR01MB4752:
x-microsoft-antispam-prvs: <TYAPR01MB475252573518328EB186F7B6D85C0@TYAPR01MB4752.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(9686003)(558084003)(186003)(55016002)(26005)(229853002)(86362001)(33656002)(102836004)(71190400001)(71200400001)(6506007)(8936002)(74316002)(81166006)(8676002)(25786009)(14454004)(81156014)(4326008)(99286004)(66556008)(66476007)(66446008)(64756008)(305945005)(5660300002)(11346002)(14444005)(66946007)(478600001)(7696005)(76176011)(76116006)(52536014)(2906002)(316002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4752;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUjyUKeTDdvzandai4ZiLCN557zF+GIa8tQ0tmjWr0MuGtjth5CPjYL+dYExDfsN78qZ5b/1JXHzZIhd2wg8GC/aU9up56dtf1S8PasJ9NUO6q1ivw/xi8LvWskGuilBnI+AgP8MTmr55Zd9LZq2+4iOeRvk5YZD91nckFuWQl5ydhSlVce3M++fAgqLLyBYPxW/Fr37cuIlEHlH2VpgcqazgjXvfj+ICqVCO9o3IybDXZOK2YfhjSD4Ss58zRXkbAZ4+wnHqXKlTFBQmmAq+sSgekPhgNpa/jf/O0axSFTvBx4LSPqEQntkMNItuQmx5KWdytsloSz+H7wxauyskee9g7/TNlT5+CDrY31xHkOxdcmF8f/cFTdtziFm8UvjhpJGcomaiFnomMrMKgZa/uBo7GtvAgkmvqDn3AVwXd26IyIF/oGJCAaR/ufeRsex
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee893849-ab49-46f8-1899-08d7797c9031
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:13:39.6747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STay1IY3qFaDc8DMoB59Xsk8h6pgaO931EPntwMZsJ4qPm6Pq8dy99RSVL6iyO4fMyl95kZRqd9KQOIAkj5Dh4wyqhc1v0nbnnbSm+4wysWdRurG8RgDca9iGr2ZgV1D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4752
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:05 AM
>=20
> The warning is not solely used for SDR104 anymore, but for all which
> require tuning.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

