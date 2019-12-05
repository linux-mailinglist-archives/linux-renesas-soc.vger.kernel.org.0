Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657351140B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfLEMQo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:16:44 -0500
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:41259
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729074AbfLEMQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:16:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5yD2rydBdGEA+6OBDIRt109ZqzuEAu0/lh4tJs6+wy6xAxUf4tNocAorgtHPvYFPfDTBvL55hTFgoRkH5JQOrx43TXmVepS9SygJGfZUZCHbCHTPXi5kcdRc4i0L8LVLHoomZ1dn9bLWgO9YnQLtaCaaPDmrmf95FvxVCUFBoMkJmQNqHcxkXEEH5USmtUMDCV0c4pNcJadOs1GogdLT5M2Qq7gzRSTgSsa0uVX8XH9pvjU9kCujV8tJVL9HWfYMz46Jy1O0wtiTSPL87go3BKmcf+8YuDuEWxHh1F5HgmxT1UDxwoOE7o3bwjHkiNPOix2KRjHgxJHylHHke8LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/8hT4G6QKq+7Uid4otyutHm9z8qVbyD3dJyTJifzus=;
 b=HAmw8Z8IiWCbsJH0srucTqMTUrfKkjQ5JgdaIZc8ZtmyIIZmMgzrEQUAFmTl+c7C8mNCa30UYBXoLRkRgddZXj63+z73W4L3kNHyc0hrY1Fa4pENVAmXPXeUs4UrQjsfacIm5pRkCRQKc7c057SZHTNMfiI33SFJU0oBJ5hzuqrpYlenjnBGQKDcrR6gG1fEccQC6Fv5zjkdcy8c/ff/yioC9yInpaCD5evZ0l8Mfw87QclO08ThaIrA6mPUX1vWvDG8I3+YIwxZyusqKu8TpI3XDhEt9fgoM4lBWV297GHM+Y+3rcp5oi23SMY8OkDgpeF9tfCWBbdJcwYzOh771Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/8hT4G6QKq+7Uid4otyutHm9z8qVbyD3dJyTJifzus=;
 b=cD5cUY04dierEfRd/h+5Rk0fQqUhCpd9Q62TQ6JlS7Tr8pYVPPnJLMhIngH3icQp0ZdNYMIe6kQSzr+6OsbBnkSxNXf9HmhAHRmfK1X02HHFOFlmNRTz+OBPo4mjeF8vOQ8O3BTcAbEAZMQxsS6Ig3inZXLA2jOWniXZMQVvjpQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4752.jpnprd01.prod.outlook.com (20.179.186.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 5 Dec 2019 12:16:41 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:16:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/5] mmc: renesas_sdhi: remove 4taps as a TMIO flag
Thread-Topic: [PATCH 4/5] mmc: renesas_sdhi: remove 4taps as a TMIO flag
Thread-Index: AQHVqhUA7EmdEL47/k2cf5s4bqjZQ6erdujA
Date:   Thu, 5 Dec 2019 12:16:41 +0000
Message-ID: <TYAPR01MB4544066B13EBF74A50440194D85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
 <20191203200513.1758-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-5-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c408e8d2-1954-44f3-1327-08d7797cfcbd
x-ms-traffictypediagnostic: TYAPR01MB4752:
x-microsoft-antispam-prvs: <TYAPR01MB4752CA259F573D8AA8EC7DADD85C0@TYAPR01MB4752.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(9686003)(186003)(55016002)(26005)(229853002)(86362001)(33656002)(4744005)(102836004)(71190400001)(71200400001)(6506007)(8936002)(74316002)(81166006)(8676002)(25786009)(14454004)(81156014)(4326008)(99286004)(66556008)(66476007)(66446008)(64756008)(305945005)(5660300002)(11346002)(66946007)(478600001)(7696005)(76176011)(76116006)(52536014)(2906002)(316002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4752;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TU/WZCEAvZ93OIagVhHXWn3VxTVnV0t3GSYQfnsDdAOJP7Qc2BxNnKPMl2NeatZDEN5GRHw7kB561OJLnjuy6Db38LkRMY/wn/a3bd8ep++kxsFBH6KvXcBVpQzgzcJeyhaVExV0LiL9Udj01TOMxc3iARsAqy37miYp+o/AL+/A/uJYexZEC0Lt859yciqtADGZuLPvnOsV+c+QzFxz/5bqpTs6wQ8KE2at1666KcyGZUIZ85WMHygKzLBhItQabhrD60YnjVsi6SRTjWCiRC8xOhMLwA8+iZnLDEltPeC5ycuDJRYWeojsfuuIamfe5euZt21yrU+YoZsF3m4rfoUqBBNcbV/dlzWzxX4BqYBd6qiny3raY7qbBurLW6ssVLK7hIKa5TzWeIf4u8wIij80cwpfhXdmk2M5lCDk4MB9mzyuN/8fQfbsNdrMbZTk
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c408e8d2-1954-44f3-1327-08d7797cfcbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:16:41.8070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgQrXjHY1gD4gn3Qi9FZpzpCzmQk+aNXDp5K2Uf2abWV3MZgurePL/tzgvVhDYLuYKMAYEc8Grl5iTtB9ClKYkH4FW2qYDQ2q5+xcYHzw02zvIX1xxiOTv/PAk2PRNH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4752
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:05 AM
>=20
> Now that the quirks structure is accesible, we can remove the TMIO flag
> for HS400 using only 4 taps. This is Renesas specific anyhow.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!
After fixed minor things which Sergei-san mentioned,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

