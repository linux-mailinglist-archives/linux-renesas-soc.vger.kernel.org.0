Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513D41140A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfLEMOT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:14:19 -0500
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:44012
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729048AbfLEMOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:14:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CApvy5HB9iu2VG9ZnsuRA4O4pISm3fYrMsUbGRVtq/IYCtZ+j6XNJyPjKkIs9hDMWXRI3b1k6JP9IKOXaSyh5hselxuj6GpMfaJFgfytkZQNElY483Fx3wfb192sIdixbe/DKIAXnuSjpG2Ilnz95TNbXq9QbsTstkFo2wVeylGjkfbb68rsts+XuGSMX5+C47sGmSwAXIjXQZeFfZSzpx2gc6peCZKpm72BfeDbLackpzSqrk6Lv7ckri6IqIHYx/EhZBn6c3TbwkCD3yxumBJs+R4BDHQFOkBJ3kfYh0dKElwacJddkMAiDM1U4mvqHFPcxj8cZmA2F6jQxZIHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRmizF0znkgo0ZwxfVLxuiljX5d9Ro1ouDdWkNb7x/A=;
 b=BcuN4adaTFJjureAZ8JAcso0zRSNT8tGs8poJ/U4z1YTx8HstMaOniR7wVYsOjAd+kggnVmXNmvg/uzQw4BA/1e1HzEOQmKR1nA28qNIixFLxn8kRlFFupxwALo2RgtAWlt/N0d99P/U1eyH2yFpauMPTStM2AKHY6YUth9Hg8soSSnKytaYU4hNfDKAU6RMQXrK/tntXLLFW0XjIfBNdItwOYF1xRvTZyCRTeBf09M9dN7m/REz8nQQqZo7GX/8rkezBeE8bfPq7LIA7jl/SIa7w0oYn6GRJrjUTvFbE4S4U3sm3ymNGvgpYMtzEkiDlKN63ojashqzpfg5PFLiPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRmizF0znkgo0ZwxfVLxuiljX5d9Ro1ouDdWkNb7x/A=;
 b=UPSI6UtS+2zYxoc+OE0VRts/7k93HXifs67pKu6jp7hMM3Ma5G5ezD4AOBSivUYbxnQgJ51RMZru8FRBrB/rma29iB6RnTXL7YqgN2cDS2+WUymdsSHmqK2/PC5ESatMN/X4h9kTTb4K9k2V8E/oPC4Elg2WCNCfrNhmaS6SNbk=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4752.jpnprd01.prod.outlook.com (20.179.186.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 5 Dec 2019 12:14:16 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:14:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] mmc: renesas_sdhi: make quirks info accessible
 outside probe()
Thread-Topic: [PATCH 3/5] mmc: renesas_sdhi: make quirks info accessible
 outside probe()
Thread-Index: AQHVqhT/RbhLLlpJVk6ixi9SN28JxKerdsNA
Date:   Thu, 5 Dec 2019 12:14:16 +0000
Message-ID: <TYAPR01MB454490EB7A72A75BDA34A93FD85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
 <20191203200513.1758-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-4-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6fc9cdd4-6fe0-46b7-599b-08d7797ca624
x-ms-traffictypediagnostic: TYAPR01MB4752:
x-microsoft-antispam-prvs: <TYAPR01MB4752FD96C04AD0F88D975767D85C0@TYAPR01MB4752.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(9686003)(558084003)(186003)(55016002)(26005)(229853002)(86362001)(33656002)(102836004)(71190400001)(71200400001)(6506007)(8936002)(74316002)(81166006)(8676002)(25786009)(14454004)(81156014)(4326008)(99286004)(66556008)(66476007)(66446008)(64756008)(305945005)(5660300002)(11346002)(66946007)(478600001)(7696005)(76176011)(76116006)(52536014)(2906002)(316002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4752;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3gWBIl6kT2ZO879WYs0L3RXtoZKZoMmYvejvx3nnC3D87RuKArE5faM6Knd7KI6zC8MHRv8Ywiqu3cY8FePydJCnIL/D1I/SjvLpL/glEegWusNHp83odupHq2LO+9iK5/6anyqpfTcFfv9hPTUViXxu/OT8unDd4zwILGbu+YBMQPymi2NQgVLv+wOc/R2tsCe68VCV9XVD+PNRzbY51crCf6ornRExRCM19Mm4dEXles3XeKweB5ge6hUnsnYtbCPI0rt3R40OZYOMoLt+z2WZWPcdRQpvgA1zds7AsNwfP9DMTMvP5N6hmE6TLkL0bAIGLaA+EezdJrVwaX1Aj+iNza5aGWD0v1HGZq3yeUFZAEMOeUf/jRbLT8jjE6Gzy0kA5AjtmoKjevcs1izmxeb2tWWWdRb42ZZDv1g5UdTX3D7jAvkvnECfWdKuKcM1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc9cdd4-6fe0-46b7-599b-08d7797ca624
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:14:16.4741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ee8zKuLfsMkMuFBRfK69nmpDpnnCIcAOJRKuR0N4n8bQAb+GvSxJkARAlPcX8YY2cckmbFoo5X7axCY1bJQ42nt5Lv3TjKYWXU7RIg8QRPxe7GJ4pkR3kaMBCcVpQ5yJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4752
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:05 AM
>=20
> We will need that for a later patch.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

