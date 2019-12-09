Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742F7116741
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 08:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfLIHAT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 02:00:19 -0500
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:42804
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfLIHAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 02:00:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exj/8mHkOUZNr0WRRQEwc7GcBfFd5QivrBBjGe93BRXr0OT5+hvVr7tPotAC0x7L1b5Up3ap4tI4yTrOSw8jFVVKSI6Y4b87qnpDJ1pAts7XZhruuiH7FAk4ofzR4C0dlKWePGIitrw4iRZXujoN8CWtWe7+xdu+ejurz8AJGqkCmL3/9+K9LzuDlol2Svx9izwv0YwQISRi4HPpt4YjXD1Fi/61eUR9JBminw8ova5IMoQC3z8R5qpcw37pDjKPBTg6AVst7u9LPP4W+g171U6fcsmVkndO9vhLP765F8GmYZ007b/TV8ITIZzAPXgGZOPdgiEMQHuLE78y4jJfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlKGQt8DSeq3kqFGQPo3A9nt3E5vgveYhWu5TGO+lT4=;
 b=b/DY+ZWtIcFoqJNcjQlBohuh8elWhHOC6XlZvB3/9jqW1qPiXzAF6tXUsM2d98ttHzTawc7b2tZDjP8YbeOIgM6W6mXwu1VV2zZO0gNOVPz4wcVW1huBMx8YvKUX4CxT7mZ/L/brOPZf1yyV/N4OipQiyhdv+pQ+I57Lje00nnMuZ20Z8elEZYwdSzS7mU8uCO36QhsDfczxoPGDaMtycPRhYsfJIuz527+FU8lP6UsC+RC8ABQb2fovApGW1GcWBUqmr5Q1QjM2BEMClTm7yvkYmWCE6o6uFD+ssc8IpCDa4C/OSYXMHZ5ZSoYrm1S6fM7poSxUcNHTB6b8lJB4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlKGQt8DSeq3kqFGQPo3A9nt3E5vgveYhWu5TGO+lT4=;
 b=Sz+G03pNmRB0FZZm+CjuqtO+i83993ZPPR98E4W0Xv6Gtu09T/hCGhnb+2SsYXv+sW4vpAhzsQah0Wq9AaMM3QfG7jjekPXBGj7SNDZIUjSJrvddjHF+7PmxqKwmallUhUAq9heOqFzfnOZM436cDezYTzOpWLcT2RfEmePdHuM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4960.jpnprd01.prod.outlook.com (20.179.173.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Mon, 9 Dec 2019 07:00:16 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 07:00:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH 2/2] mmc: renesas_sdhi: enfore manual correction for
 Gen3
Thread-Topic: [RFC PATCH 2/2] mmc: renesas_sdhi: enfore manual correction for
 Gen3
Thread-Index: AQHVqhjgJh9C1uyXEkasHsHT0G8X6KexZhrQ
Date:   Mon, 9 Dec 2019 07:00:16 +0000
Message-ID: <TYAPR01MB45444F578C0EAF358F373557D8580@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203203301.2202-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c1bad3c-8b98-436a-0d6d-08d77c757205
x-ms-traffictypediagnostic: TYAPR01MB4960:
x-microsoft-antispam-prvs: <TYAPR01MB49604F0F79FA890D1FA74AFDD8580@TYAPR01MB4960.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(71190400001)(71200400001)(66476007)(316002)(26005)(66556008)(76116006)(66446008)(64756008)(9686003)(66946007)(478600001)(81166006)(55016002)(81156014)(8936002)(8676002)(4326008)(6506007)(86362001)(76176011)(305945005)(102836004)(99286004)(229853002)(2906002)(110136005)(4744005)(52536014)(7696005)(186003)(74316002)(33656002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4960;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qn5ttNl4A1vaPxdnL1h4g5JlgmXm3mlMQKb3E/VHjA0XdglBEIFX4TtflWgse9ddeZcUJoUB7jLDh35iUgaEv9D49DmXxIMh5/hbkK7AmZ+GS+j53Ef68jtFA9SCvOLb2i0x7nO2oy/FuvbmYfmV+FF0FV+/NC0grKk4pw0R8Nn16dqWuThaY286SHshkYZIufhi7aJUmGoSv0y5cwDdijDO8xJd5cVuKIu4hntySi8+yyIoU+Y7Hj33/lz5OrxOHxfV1x2FBB94zE96vHfzje5KGl8B6gDeyH0+ycXl2Zlo5rPYXT4/KYcYyR04NI3CYU1MCXtKDtysUKwb/cM3XBLJGJ0VNSVJQlCGDtAEg1+lOY07P3Kub1pV1Px4gMNIg7Oa/efNaGMf7d4PVihrXLPvxNioJCIHwydB/1HSVT3JwhuEJVzpQAae/TTxDRdP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1bad3c-8b98-436a-0d6d-08d77c757205
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 07:00:16.0926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZUx+sVGk9D8s5GMNmse+l8NHI0uckJb2C5Ma+Ww7sndQbu6XHns9wBTBk+R7JD3P2b42EWjNPN+WzPcricRFW/iztSOiIAqTWwjhgbrQUxWispU9WWbhxPr5SfDD/AL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4960
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:33 AM
>=20
> HW engineers say that automatic tap correction cannot be used for HS400
> in all R-Car Gen3 SoCs. So, check for that SDHI variant and disable it
> when HS400 is about to be enabled.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> The BSP handles this differently and adds a quirk entry to every
> soc_device_match and checks the quirk entry. I chose this less intrusive
> method because all Gen3 SoCs are affected. But not all SDHI instances,
> only those which can access eMMC, of course. So, I likes this approach a
> tad better. If you think all quirks should be centralized in the quirks
> structure, I am open for discussion.

Thank you for the patch! I agreed your choice. If we had a SoC which can us=
e
auto correction, we could add such a quirk at that timing :) So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

