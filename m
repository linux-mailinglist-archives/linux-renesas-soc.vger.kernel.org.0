Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F653B4386
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 14:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFYMop (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 08:44:45 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:56240
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229878AbhFYMop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 08:44:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COT5xGW4IR/jKcDjnuZZNBG/Oy6n6zJFXVfPjpJ2Utky8/0qfpp7CJAVU9fvDSIz+ZULYLdWcZQfEX0rVrfz4SVsboyDvTmN8GLZFaCy4S68A1B4dKA2a2Yd93CAH7hun0rA+OOmUggwUNFkKtsh8vBmFriNiV96dexhirA3Alrun+okW35iswajtkyGHzYC6KZeN+KHjnch7O1j0PhXyRVO4aXnqHIcXvTvKxTb94r48cr0SR+tXu47vamzyW4hZw+VaOqj6CFD75n5ipsajeYf/wtJeZKGsLGdQpiF8MU0QCOLVIvobenUFBbsTFTh+0OQtZ1YO/N/7AO99TyCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGp7rSiVde4xdbe1OYGRGXuvp2rc7D5/7W23pMnS8Dw=;
 b=Cl/Mnn2CNKVKEPihbGBO1HI6d8NldszWChbhoJyCwkeXdtsS6WZ441yQwaCSUhGpxvd/NdhMoF/H3JQsD2GFlNZBEeBBas38j/rufBLdP5L+qsjm7N5WMbV7UVh3FmUGnjMnwzdDwXzGjeHlWzBC4mQlYfmFkFJXin9CELlFtsvoHrNTyuo8BRGW8GMA50XnCa9h5evWTloLl+sf4WWUy5uf2LTguhKxIO2msfrnq/Aogdn2/Sh5cZKimFiIGuezvq+91EP57XkyssrScECLtmh4EpEOQMYvLT/OgVHlrw5FlJG5OC4WWYVFDEd1cvR5olok+zeuZrd0edAfpr1XcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGp7rSiVde4xdbe1OYGRGXuvp2rc7D5/7W23pMnS8Dw=;
 b=YJ2PQWyZIZ55VL22/CShXSQsiJSOrFcesSvpbqZ7ltfImY+/o3ifsqphVM5GYak2+5nFMwvM7HQhtWB/4SgPD67Lef/ji3UaoOVkvrekV6G+4w+aeUUe3GGyoWbueAyd8V8tWtQELpCjD9SyBgJebbRQL6UsrorU7u1glk/wXo0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6430.jpnprd01.prod.outlook.com (2603:1096:400:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 25 Jun
 2021 12:42:22 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Fri, 25 Jun 2021
 12:42:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
Thread-Topic: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
Thread-Index: AQHXaZd5jr3zz7SVJkuCLUlHvyiT9KskqoAw
Date:   Fri, 25 Jun 2021 12:42:22 +0000
Message-ID: <TY2PR01MB3692DE0BFDFEFCA0A8E1C890D8069@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7cd2c1c-5717-4728-c85a-08d937d6ad66
x-ms-traffictypediagnostic: TYCPR01MB6430:
x-microsoft-antispam-prvs: <TYCPR01MB6430CE2522F3587EBDEBD308D8069@TYCPR01MB6430.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSNyFwW1RM1nB/9gTCWGfCA9hh4JVjsZ5e/vJZFPL2rfWtMqSuB+flva5Zeut3HRDAh6DMatAvFgzIH6paPmtKSdGCfTvl9J9dXZp1NruKy5UdPD457PJSA2a+8UzaDgouFSdKfiFK5ErX+J6D+pd1DS59LWN9v0SZ0vBHdrMtI1ZHUt4o8/9oIEEFmlZSy2xc05Q96e3bE5Cc3vNV34KD7e/BUMFkDcZnindUgXFgL5IbAQRLnZZdkINjCOMjFkVsohyvkbbHaFAoy2UO5lhm/ZLsMhKd4LcmUZCM8iPgdNNOuZbMvpJskXhOY4GV3tZnlpy7MrdWs9qm2zZaBCVJIZxeu2IB2f+Dc7IUsnU137YbK+Mjlz/ULsmWjFsAEI5ch5d5ZLR3QhuHSnc+A/7zZGDYX80MYeHHN7cp7TZszHCV6H3y3tDA8OrJe+oDZzmV08Hk0b00SqckwPizawS8idlIfKxSmHB06ZZspHX34VakhA4oXBZWoyIdZVd5omxTWPxUO2hchZQ3WAzoXN/aMCL/MUSxOV5vX+zOvZB136E++YQI61oR6fTqezCEWtuZNRGWQN1oAoLZ12/+m2BXf6a54BbfXIh7zJ8eA2fYo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(9686003)(76116006)(5660300002)(66946007)(4744005)(55016002)(52536014)(71200400001)(8676002)(4326008)(8936002)(316002)(54906003)(110136005)(33656002)(38100700002)(478600001)(6506007)(55236004)(7696005)(186003)(86362001)(66446008)(26005)(64756008)(2906002)(66556008)(122000001)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6BYbyBhYBnugGZ2H34h1CMr3FnHT7hiE2dKSuGVZz02w39NtzwgD9o4+0re8?=
 =?us-ascii?Q?Q8LIwKr4WwgEOS6EIDyyI/AXvz0gt+VymnH4ir0qahEMcnLQV96J/+iVDub2?=
 =?us-ascii?Q?pvea+3NVT+yRPAuCfHrpJ6VH+GJ1mn0y2Nuebln6RkLZByhYe/DiUuHOgvSU?=
 =?us-ascii?Q?8WLgKDi52b0tUDIyyDzQy2BFpG0rY+oH/ontUID+MJzlGcO3zEULHRq21p6q?=
 =?us-ascii?Q?KnJa/gn/1fUB3jQOSlPDCdhvt/4fqr5w/wubbXCRLSlSoiTgnrDR+dZTzy26?=
 =?us-ascii?Q?Sjp5MUC2ySMT0OrTjswzg3OU9UWAhI8EXtpeISxx+Kh09XGiw3BTcnQ3C4LK?=
 =?us-ascii?Q?ot9PC4EqzuXNFkVejrpaPpU61YDHXetjZRQtopatE513Zb/RWDRzSJu5K3IC?=
 =?us-ascii?Q?jsTM3LUNL+5Wlgna4Oap6SmXp8Y/6o/MbXRrWrui3GVNPY0TX0hwrqBtGxag?=
 =?us-ascii?Q?OZzs9Mabhm53PUADawS+IA+ITI0Uy3eXIfc6Pmw7nmCrE9fyuOQ4f+8ZXltk?=
 =?us-ascii?Q?HFPTJrb2fYLqaxo8uxlfKIaAj3s80WgOCRuhaidFnO51QvrEAYOgn+gQDEiU?=
 =?us-ascii?Q?EORmHkECXaGki/27QYQDV3EujyyJj0DaulLmIKQdBDm99ER9O0RAnz2zKR3G?=
 =?us-ascii?Q?Syt38hkpLdEFU+dtwxYPk/TnmMVJoMNt5td3G1VILTnoKDAdNraStojUx2Zx?=
 =?us-ascii?Q?ACK65HKPXR7vBwqKejze4lZZt2M+e7wBdlioQUe3OKOXnulfbOjvRTiMsNg+?=
 =?us-ascii?Q?M8H5PQvqAWfa62D3b/QhiMP0eLosVchMuCe8IASYAOMnGKY7BGf1lfzLx0nC?=
 =?us-ascii?Q?0ANd4DtdY7ZmK2f5GR6g7dS8rHFo4oWmmEvkbHhBpj2vzPGxOFgYMp4xDETl?=
 =?us-ascii?Q?091T8bcxSyZqtkeR/fptRVNHSn0hbsHi/0lnT+ija2xBJSngda3k4Q6hadzC?=
 =?us-ascii?Q?kKFxB6fRW2vXLUNtvfAc0LXecPqyn2KxajIdknJirNlYtjPeu2j3Grkhq5gv?=
 =?us-ascii?Q?prG3vK1j6ZrMwhQQp3bAgYfzXlHf4Uq9yxiItTp5g4yUqRzUVyaK9SE1rPfy?=
 =?us-ascii?Q?K2FiNJXWSiNDYiZBBbXWlj7JKLOKlBdRNIqevHtVpWrL35ttTcjwIsMrHYKA?=
 =?us-ascii?Q?TE8P6D1wq8OnsuUvFJmuPCrL9SlIr9Xm01TImhUe8HnTqKB6XZNHJRBw5KMI?=
 =?us-ascii?Q?f8lsf50ayvFMZfku/JHTvEFGGso0kYDHUTm8sILN2ONk9oB6SyFciAgh3+AZ?=
 =?us-ascii?Q?n40sZ7szWgxSOhcRIYCJ+zkE03+pm0KUHzOsxeXEksGFrckYrUk+g5S3KJdK?=
 =?us-ascii?Q?Yo2BqMvAAvrneOvIg6jcHMx1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cd2c1c-5717-4728-c85a-08d937d6ad66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 12:42:22.0779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgcBuvrktJQzu9dr/PIAosjugiQ/XkPemkZOY6qvmCDljRBAzj/h7zT2NlCUhgx04YHkVXUCDTwXq6AOWaySIKpzO5vt973YwtjY66qiB4g7ZMlS2XVOJUtIbGF6L/qK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6430
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: Yoshihiro Shimoda, Sent: Friday, June 25, 2021 4:55 PM
>=20
> Refactor of_device_id.data to avoid increasing numbers of
> sdhi_quirks_match[] entry when we add other stable SoCs like
> r8a779m*.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
<snip>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index ffa64211f4de..9255e93e6248 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -25,11 +25,15 @@
<snip>=20
> @@ -70,6 +82,10 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_=
compatible =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  };
>=20
> +static const struct renesas_sdhi_of_data_with_quriks of_rcar_gen2_compat=
ible =3D {

s/quriks/quirks/

I got this report from kernel test robot locally.
So, I'll fix this build error (in next week).

Best regards,
Yoshihiro Shimoda

