Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA49E11670A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 07:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfLIGm7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 01:42:59 -0500
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:44450
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbfLIGm6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 01:42:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPjMKrWf2E+qWzHKzVSnG7ncjbJZlS1ghK3wRpcPUYGLqOlGY0Mc0UV0hxtEzU9pkJBrx3UK5YNbJOStCDxxk2tyAvzMQEeex4q0cBit/0SKtBTngHpq3/ET6AU3DI/MqOgw8PKk/CYBz0aeK20qsB5/I2nq0eSPlIzMFnW4bRIYQn1aaeibKG6maEaaV3EiEWV/t6w0ioczxucBWAC6hcK/aouVQ74nUExqw52Ud4zJAekXkYGQpvSAP1DoxLQNFGU0oWqwPqyE72hyCH1q6Cy5nSl/huuC/LVDl9m7BLurjHVmGZHcrD2i0QOm84/wHqK+L4iNlecI9MxWrsUh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wGaxW4AJq8VyL/dodQ6iQiyr3QUTFr4COMntmAFt/k=;
 b=W/CDT1f+hFJQ/qFNQ9nOcB8rPjXujrvVYaiwc3LmM5uV+o8CUxXJ6RpqiBgF5fmy/u15VEON9xQ1aeCJLRUoJ0MuCixwdJE/YzwgKH2ltUEweIAX5Lx4/Cn36dyPAr1SIFcpZ5J6E5Kb1x241hwvz8icZZqZfA8m+oRo0/3IlJc5HD1kj6FQEra0YbCJMxBXUthpstt8Ux1JOy/RwcLsxUrhs1JAm++o+5M7Fiua+3B/khqXq7vgutTb6aJo89jlN1stmaDMMSelY30SeiVs56sxQiS9KNkgnsmi7QE2xcXka+z6XdixuPz9J9AjAgD98ffbFBkbYUbwh76yCC9K7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wGaxW4AJq8VyL/dodQ6iQiyr3QUTFr4COMntmAFt/k=;
 b=MxYfcnKfm4Fai1mnDJnaiLCP7sP5gE4T3xLLzY81TLA+6V8b0EVRqqeTSa6eRQuwgM9E8+DzX5HzEHRJr+Rp5SqDyUMt+Qv2ld5jlIEb1aykoKyjzLIViqZwjATNlEPPxqjEAU/UyVIzE3Jo1iJDNPyY6t4ti4O+SsOtPf14Vm4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5134.jpnprd01.prod.outlook.com (20.179.187.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Mon, 9 Dec 2019 06:42:55 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 06:42:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
Thread-Topic: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
Thread-Index: AQHVqhjg+Df8O9WZ+k61j8D0+jPaEqexXHFg
Date:   Mon, 9 Dec 2019 06:42:55 +0000
Message-ID: <TYAPR01MB454418FCE6AD83C0DE56E420D8580@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb2f237b-f4db-4509-7c1d-08d77c7305c2
x-ms-traffictypediagnostic: TYAPR01MB5134:|TYAPR01MB5134:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB51340DB18D20D6B7B80A18F4D8580@TYAPR01MB5134.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(9686003)(8936002)(478600001)(8676002)(33656002)(74316002)(71200400001)(81156014)(71190400001)(81166006)(5660300002)(7696005)(55016002)(966005)(76176011)(305945005)(2906002)(99286004)(316002)(76116006)(6506007)(26005)(102836004)(66476007)(66556008)(66446008)(64756008)(66946007)(186003)(52536014)(86362001)(4326008)(54906003)(107886003)(110136005)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5134;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xKlHJfkYM1fGLF/qCkegd2RgATUY9Gw/eKcXpGQsZGmDu+L2Gk6LQ5/EM+1DSkPbgsVUIt6DHnIg8ZhEmNhI8ejhLiieoeabPmxU79aPi/bnXGZokI9XKqrSXthLJy1h3iZnvP2DbGI9ZZnTcEVWvrNrVyF6ZipSeMew9HY9L1lrHnLbIOOQwr2wOs9hixM+KVOJfB5YyhYkZjGaoP3jokG0Gh0FqZYVtexsjccPynK4PTXhHUPc5dyE+RKOu8s5o68Ua39IfAZUgGb5zGWUNY2Qmq2HAfHg+eTUQB5L31O8gx3d/oCidd9lyh0VsMBdIRPFNOyzPngzX2nHucXI7mgWup65UR1SywN9DaCQD5paOodh5GbYFVZ7xcbShf6HqFhYCNqTQD/bladjLGIZzPe3kCqVX8bs4zLSuQWydnAK4HI+QHTMetdwd9Qoo9TvEXf/WcmM7y/ExXqJBdyOwkwvxPdX9qQSc6oCQM8jZSg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2f237b-f4db-4509-7c1d-08d77c7305c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 06:42:55.4180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oruwb8pbqJ7giTG8nkQjV4tvDy6/2PiI0KFJXkuF3+/dYHvDiqm92WVlv5Xo1sTx57MaIFFrdN+8mRXEXO6Orbh96TAiVOotKnyXeZYH+xYqDqRFwNGu2jtRreZZk1ZR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5134
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:33 AM
>=20
> This patch adds a manual correction mechanism for SDHI. Currently, SDHI
> uses automatic TAP position correction. However, TAP position can also
> be corrected manually via correction error status flags.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Pretty much like the BSP patch. Just some rebasing, refactorization and
> updates of the commit message. I especially changed the original
> calculation from:
>=20
> +               host->tap_set =3D (host->tap_set +
> +                                host->tap_num + 1) % host->tap_num;
>=20
>  to:
>=20
> +		host->tap_set =3D (host->tap_set + 1) % host->tap_num;
>=20
> (same for -1). Because "+ tap_num % tap_num" is a NOOP. Or did I miss
> something?

Thank you for the patch! I checked your calculation and it's no problem
because the type of host->tap_set is unsigned long.

example 1 (set =3D 0, num =3D 8, down):
 BSP code:  (0 + 8 - 1) % 8 =3D 7 % 8 =3D 7
 your code: (0 - 1) % 8 =3D 0xffffffffffffffff % 8 =3D 7

example 2 (set =3D 7, num =3D 8, up):
 BSP code:  (7 + 8 + 1) % 8 =3D 16 % 8 =3D 0
 your code: (7 + 1) % 8 =3D 8 % 8 =3D 0

So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I have a nit comment below:

<snip>
>  static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
>  	bool use_4tap =3D priv->quirks && priv->quirks->hs400_4taps;
>=20
> -

nit: This deleting a blank line is not needed after the following patch was=
 fixed :)
https://patchwork.kernel.org/patch/11271859/

Best regards,
Yoshihiro Shimoda

