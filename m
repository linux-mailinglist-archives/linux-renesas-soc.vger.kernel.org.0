Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94D8C4970
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 10:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbfJBI0F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 04:26:05 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:31205
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbfJBI0F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:26:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKSoiDbLH/A1TH9XBTEryuADY3aXzN3i9lh1igpk1hSjvwQJMRe0u6erOI3vHVShJimbwWll2v6OSWiG+Lmyuz7fbQzHWBF3zN91oo/YxazPh5SQx+eyTZTnjFjG+vRvJbXCP25eMHMMA27B3JeejP3AyrMzJQg+t00FWw4MPj2D1hA/CbgjTWxFWVJ97YsTDAyoJyOCUiEW6BNKN+31AN9ht4Rze8hG+GdVVn+BL9R9aI3IDN0GaolCPKeDcXmyMDIn+3aDpy2F3iHEm7eSYVjhGlWcM+2qSBvLkvBQzIss9Z+Dbz437sGtQ11r/MlQJrl7xd9d0aZouxOOvRIigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHsUcaSl+Fq+a5FiLMNQbBEFAIpeqjZd1JmAw9kkw5I=;
 b=Rbr7CfgqPdHM1fElswGGX1cKAoAV+z9FUjfv3WB5+6IPrghxKP+BS0+7Z5Kdj/ZzWubjfebJUezl3XCZoAK0zjZj+lJupjwFkfS9q4YdQ/km3rZrJ4OoayPDg6WjwvE+ZHJPUjYgBE+g9H0HxgjbDMc5axji2QFx7qgQAH5/118P9ytDr/eXxvDNsFKdJcCIKkwYam4VE2H4zvnppbDf+0iaVROM7CNBudmwAWZKgCavszQAwpOzKwqiZwaVK2+vWHsTE0MwVIQPkGlDhSrYVgfIoguRk2EO8lQ4njMRIcpz/sf1O+R4RECZjqTrtkHAMSn4KhLqLfuOGDXFJZWzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHsUcaSl+Fq+a5FiLMNQbBEFAIpeqjZd1JmAw9kkw5I=;
 b=M6Ep3XWfBI3LBGrLIjRgJiRWs2LVrNIip8GsyRTCjOS1A6WsaqmrK0ypkAvr8awa73/aTJCpS/6vcBzQaFQ2tqqyw3qGuG7GtmWvHHdS6zt7qNKjZfqxTfzi3fAB6vTWLKT5jEbrLyOjzW+GIpxkuogIQB734CR0ULd0MJSBnZw=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4494.jpnprd01.prod.outlook.com (20.179.173.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 08:26:00 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 08:26:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Topic: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Index: AQHVeINBliwm7hLnmUKaPfQ88mi/3KdHAjCAgAABsOA=
Date:   Wed, 2 Oct 2019 08:26:00 +0000
Message-ID: <TYAPR01MB454472C76E03930717A2898BD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180834.1158-1-geert+renesas@glider.be>
 <20191002081553.GB1388@ninjato>
In-Reply-To: <20191002081553.GB1388@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 216a38e9-5231-44a0-0516-08d747122837
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4494:
x-microsoft-antispam-prvs: <TYAPR01MB4494B0BFCCD932B8C2B3CBDDD89C0@TYAPR01MB4494.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(199004)(189003)(229853002)(74316002)(66446008)(5660300002)(25786009)(3846002)(4326008)(305945005)(7736002)(66066001)(256004)(76176011)(7696005)(33656002)(4744005)(6506007)(81156014)(81166006)(8936002)(6436002)(55016002)(102836004)(8676002)(6116002)(478600001)(9686003)(71200400001)(54906003)(14454004)(86362001)(110136005)(71190400001)(26005)(316002)(446003)(2906002)(64756008)(186003)(52536014)(11346002)(66476007)(66556008)(76116006)(486006)(99286004)(7416002)(476003)(66946007)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4494;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PXbqr3F2iLxDZoE2LcWauN4lMujez+6W5mAQBIipsbJWn5V5iRxe2fUiAoCfquZyhEJdpO0NhHw0JMN97ZUNfVwbxk13LYTJ18LBJ+LK0APvHit3FgHj6VD2I/fGh5twA5muACs5YXMKj6IRxMMoeWgUHZ5jOAufnUkaFQuSDvxB6AYHWXHBT+JrcqgwaqemgmasAoDyC2UdGk8xphVwQpa0657jXA9hreK2JYUhvIe/wb51xZ2XE+YdNBYM4R3wZGNzJdcSjVyWJzJrWIk4kY/LWzBY/wS6SMFzwiIM+p1gMs8YxFhC9cdUA3Kd+SDVbfuxY/FWc7T6HgERf8HTZrGaDHKc+OCq91LnfgIMeT1sqC8QMaqvWwzM9EJdbGm9SK0DvoaP+LuiSK/XW5QGaWN8+ZlTDXNqrkjucvrldhI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a38e9-5231-44a0-0516-08d747122837
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 08:26:00.3893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iweZAXp0tLK+iMV8Y7XpoASWlxa+yxFaCybbOQkOHhZXzFoFHPpQ04a9g77flyedhA/dUPio+AuLSKBNsQ0Djj9zOxOwYpWkmDaNhL+C71dgzGnrRLQ5AW5oZFGVzLaz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4494
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: Wolfram Sang, Sent: Wednesday, October 2, 2019 5:16 PM
<snip>
> Tested on a R-Car H2: it does make the error message go away and the
> MMCIF device acts normal during boot. Can't enter userspace currently
> with v5.4-rc1 but this is unrelated to this patch and MMCIF. Looks like a
> configuration thing on my side, so I will still give:

I also should have reported this though, my environment (R-Car H2 + NFS +
buildroot on v5.4-rc1 with shmobile_defconfig) also has a similar issue
like the following:

[    3.573488] VFS: Mounted root (nfs filesystem) on device 0:16.
[    3.579869] devtmpfs: mounted
[    3.588014] Freeing unused kernel memory: 1024K
[    3.651771] Run /sbin/init as init process
Starting syslogd: OK
Starting klogd: OK
Initializing random number generator... [    4.073629] random: dd: uninitia=
lized urandom read (512 bytes read)
urandom start: failed.
done.
Starting network: ip: OVERRUN: Bad address
ip: OVERRUN: Bad address
ip: OVERRUN: Bad address

Best regards,
Yoshihiro Shimoda

