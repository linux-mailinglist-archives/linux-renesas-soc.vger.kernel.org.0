Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D98B1140A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfLEMNG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:13:06 -0500
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:58933
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729048AbfLEMNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:13:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th23MV0yB0qEXV1TQYG7+CV1M493g5W+QutsIyet9QxMyNgFdQVKyXMGOz7xKWWx8JBJecOhZTsftTfsGucLl7eeBAtxKIliRqa6imHXLGHlkxz256brLkCtCN6dTPwucYCG6Mdg2I71TTAuDsehHoCYqsZkar18Kt+EQGhNkgiLBw/aOdLvfvi9k/CxjmdzMvFszvhPD718wmD5rt1TrDfYoCOuQo6O2P6X36P1JgTIQpznZP+t17RtmzJMUZNzrpVqrh+yx8N97CMj2nYZLwH3Ne+Edvm5w8LqtUG4rkZHl7nImEJZ5qzICzyC0B+U0kyudDx5uE4yzAE74VI8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQQ8HEsxuK6yaUour5Iy39IzkbZpebTra7+PVBhfoKs=;
 b=ZIZzDiJ4QhsWl9jZd2lWy/kgScOYvDksMjBHl/9SxRrrUx2d6N9bMbgvy1xUcBqS601mUXHd+DXl6k2iaFO6li8JEt+1LweZo1uW7LGvU7qzecn/V860QkH7p0v7adi5JRWBYj3zLJsAChr0+xCmhxrZohGLgQwjx/yuBVc39LnHS+0s1/kloAa2fhu2G4YxoPc4kAug0Pl2T/2+/jjWbsXcG37/SB85ZrkYtxsvhQmxlSoczQaVKDLuoAkDPWc7s0rxh/u3Ur9IfY9lVvsiQfOf5POX4xhsTzC0R7X7B57iphRzC/KCzRkmkyd1njrvVohY8RDm2an/5RAc0BIX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQQ8HEsxuK6yaUour5Iy39IzkbZpebTra7+PVBhfoKs=;
 b=Fj5eQN7KTMhfSB1PqpfCLrMqe+j3SV8gEQ7nO0+j7A3ciE+4rIQWPTSli9CswfCuQIajSSJ9zqN2kdTk1eaT5q5FlDGY0aIqmRNyon0yYkgxRwMmyFmh0fCe/8N86FjOORQZCktAhxTPFKR8XPgu1LDoTJa+4rPLUQwpf75gkKs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3808.jpnprd01.prod.outlook.com (20.178.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 5 Dec 2019 12:13:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:13:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/5] mmc: renesas_sdhi: keep sorting for quirk entries
Thread-Topic: [PATCH 1/5] mmc: renesas_sdhi: keep sorting for quirk entries
Thread-Index: AQHVqhT/MEqyEAynZUa9lKK1eTwk6Kerdm3w
Date:   Thu, 5 Dec 2019 12:13:03 +0000
Message-ID: <TYAPR01MB4544A12583071E91504E1864D85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
 <20191203200513.1758-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9fdb7bfe-b39b-49cf-e599-08d7797c7a86
x-ms-traffictypediagnostic: TYAPR01MB3808:
x-microsoft-antispam-prvs: <TYAPR01MB380889137DA4E8E59F9A30F0D85C0@TYAPR01MB3808.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(66476007)(66946007)(64756008)(66556008)(316002)(110136005)(76176011)(6506007)(2906002)(66446008)(186003)(305945005)(33656002)(4744005)(4326008)(7696005)(86362001)(99286004)(55016002)(8936002)(76116006)(52536014)(81156014)(229853002)(11346002)(71190400001)(71200400001)(5660300002)(14454004)(478600001)(74316002)(8676002)(25786009)(81166006)(26005)(9686003)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3808;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XJxOmoyv5pP/2xbwI4xe31kO/RdatLurHJME0vwfvRFd8rv4cMJQMstpkdrN0lPKdONgKVNYy885ZrbB3z67WLY11RR7K/1FF1usin4rH5BdRhmYnR+gShRbwWgJ9yxs83mCUj5jmTwrHu6TyQtPwUwrgUAf455SyTzvxRuxuVuR7MT/u8r15tqle6LLBtXq6Hn0TN7utRdYYvMqIGWyvTG2BHJGgmtRRDsQOmw4Fz1Oam+wfnK5Y6eysX6yWJp2Lb+mktVWXWwbsswHBVBfqgOWNc3JKxWNcrWly9vTRTy9bm6joirXjIFYd42ggRkN740kSnW4wYnoZEyNX1P9rehAYmZP4dGUOPvzGT6ht8U7yTzgoAfSAgoIL9Aw6+7M3rcYtFx1Wcz3yzHIUPkeX5QL5lvPW6yYhTLJD8YAmM2P+2hEsOTERnxvAMOiWoTV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdb7bfe-b39b-49cf-e599-08d7797c7a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:13:03.3102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2G6lL/7OxRdH3OFqZ9VSY6TA2wMB5zoPH49ZS8tI1uLxtUZKY0ZX23Yll5LwAvk7ig6EgWYoiEZ9kMQ0XLgW3es0VoNz49P5GGGDuUgnsRWhW+34N92zc2Ie8aFnJr+V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3808
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:05 AM
>=20
> The two devices next to each other are super similar, but still, let's
> keep the alphanumeric sorting for easier additions later.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

