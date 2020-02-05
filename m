Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D35FA15240D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2020 01:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgBEAWk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 19:22:40 -0500
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:43191
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727537AbgBEAWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 19:22:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxi4T1NQ80N8LiHr+R58tTLNaf9tAIRyakVf9sGCe/FJYrUqk9hQ+pV3xt9zLjPUwFhKpEoFkYefZvUAxwiRFGT+EF2wJSk6whqHfAAjiiHMVMWf504PgCiC/75gUmx/F4Y96tX9zfsbQTOBw0LTPaSyLFTYvwjwSPpA8vu1WMS9LExkxwNl4uuFcVlfUpkZk0KDl5SAIp/1laYSEMIhEji7J4TFLmYkvFAnqCFKxbF4wocFkE01OuKLNkQG0UMepNrSBZhztUmtr5j5AJvPbOYjYmo91RX2NCsHv8sQV2xJKMHcyzvswat91lUMI5Drna36bEKyjoImLMispt/ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSt6buwEMJtXFkv0hDB7WN735/6oqeBVb/VkzhiwQy4=;
 b=RWo8nY+mSDBnzzZ3kjIoQVS0EhnPjHesJ3MbjAEmmYXLxWQKlwMjoPh+aJjG/aFQogYP65x4B8EbOcOa71KFGk1+g1NFT9JBLpD7j8YuCS+bjonIicpUZ44TlvUVu7mgHKGu1FLr1sRqVQT2N3SGabEaHJV+zVCCrIlm3nLDAz5KB3p3vnE2jwXGoICPh4X/GBP4ddcAPt+li0P0N4d4KdxWJo7NWbSAEDNFH+HOGbtSNrHQyRUypZTNpd7Cxhahz9kat5PhAsb1grAxmvY5rb5J9GuTiCmTeoPqlp5UL2X+fmNBrXGjV+z8PRZSdhyp6Zl9MfgT388qXZdR8RU9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSt6buwEMJtXFkv0hDB7WN735/6oqeBVb/VkzhiwQy4=;
 b=cXePfotKWU1RH5yeKxs5JxLwCjwNedcBryUMB1RjtDgPrN9qn9UXFqr7+5LYwgYdns1TYpPXW9cF5KiBSQ2FYoUupCtPhSnQbii9fzFbgkZd0LAroF+FxDzSCffEmTYA6HaYzMqpMgvCj5vyecIjNj/Jgmw0u2TJVVZs/1E//KM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4621.jpnprd01.prod.outlook.com (20.179.175.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 5 Feb 2020 00:22:36 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2686.034; Wed, 5 Feb 2020
 00:22:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH 0/6] mmc: tmio: move TAP handling to SDHI driver
Thread-Topic: [RFC PATCH 0/6] mmc: tmio: move TAP handling to SDHI driver
Thread-Index: AQHV1uPtsSdJJ1y+90m6Im2NYeu7wqgLxHMw
Date:   Wed, 5 Feb 2020 00:22:36 +0000
Message-ID: <TYAPR01MB4544290FAABA8157AA4AFA79D8020@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7db52988-2e7d-4b6b-bc22-08d7a9d180a9
x-ms-traffictypediagnostic: TYAPR01MB4621:
x-microsoft-antispam-prvs: <TYAPR01MB46213490609164D51E6CBBB9D8020@TYAPR01MB4621.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0304E36CA3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(199004)(189003)(110136005)(478600001)(316002)(26005)(6506007)(55236004)(186003)(5660300002)(4744005)(2906002)(7696005)(66556008)(52536014)(66476007)(64756008)(33656002)(66446008)(76116006)(66946007)(71200400001)(4326008)(55016002)(9686003)(8676002)(86362001)(8936002)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4621;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bb+9wz6XLYyML8aX3VLB6FwPgmy6AqUPHFFaW6vVjFEo3/lPuEG8OGOwcA2pep5Eoon+vUm2jbXhBC4FjY14A/sncKoYtFwG/jK5xagIp54YgjQUrflGlXtng1LZIuPFCqAtTwQiBXaya8nxDiIHSsCl2vFtHz+MEt9ePtAFm715ceGIXwSpg4Px4Q2+C8uxs4QUQWGLm5Lb+AKiOyjbWSpl0GRKl1ZEGtjmMPxA72Xims6PEpsXQo5tSPv27cWwhMGwTeDBO9GcUi/cq2Du7kPbSAa5ApI6jssuMS/J7WkSL2Brj24A/1QXg/YLf0/YOJskEEti7ff2uGPy4n6Y8mkRNHMzb4lsgTRI0VBKaPyJJO88vW7omS7muR14+HkS5WYjBeMJWRF137iX6Q8KC8Cd5SaZO0210nqG7/xKZZC4LkjL6Nl65vIjXj8gqWt9
x-ms-exchange-antispam-messagedata: VEkM7QAwVnIOqtsL7zBZTCt0evYKHtSdwJEaPpXfycbWoXg3sps+bUsqUu2ZQhHtCtxpA8JALRsjxzBVP9qBe+VeVvzGLN5oSN9ZZDElKfE2OQLVd6xbKg97ioHmi4uYO+eB1DcnS3AXaMw0P5kTeQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db52988-2e7d-4b6b-bc22-08d7a9d180a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2020 00:22:36.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h314lNDIwlQiNL6nvAoQHv1FIUP+33pvyUZqyBr8C8qvYd6eq/Tihdjhmb0dDc7ASKn86R8VZC7y6m0sRfNLKpn6UlwqbsbwOfeS2eQcg8jwI998Gs55lPJBonXx1kyE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4621
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, January 30, 2020 5:37 AM
>=20
> TAP and SCC handling is Renesas specific, so it should be moved to the
> SDHI driver. After previous refactoring, this is possible now. And
> feasible, too, to simplify further HS400 corrections. IMHO it also makes
> the driver less complicated.
>=20
> See the patches why this series is still RFC.
>=20
> This is based on top of the series:
> [RFC PATCH v2 0/5] mmc: renesas_sdhi: add manual correction
>=20
> A branch can be found here:
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
new_manual_calib
>=20
> It has been tested with a Renesas Salvator-XS boards, one with a R-Car
> M3-N and one with H3-ES2.0. Tuning to HS400 still works.

Thank you for the refactoring!
This patch series looks good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

