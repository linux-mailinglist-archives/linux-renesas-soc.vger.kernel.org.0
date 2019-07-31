Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0E77BED0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 13:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfGaLFA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 07:05:00 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:58437
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726559AbfGaLFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 07:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=RjaCkRkeKWh/8MoIGXiFFbd7u9HAJqN58hIHEyE477CjmIhVLZ4tkTorNwTXCVfwXaGNzK+Fxi363gNcviJQZlf0+mtM8ljUP0WTUcQqeL3565ZLnqs4dqPWnD16v4RGM8CzOQ9gxscGYfgyWUzXna/iv1wF7Em4iyKoDTC3XF8=
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by DB6PR0801MB1846.eurprd08.prod.outlook.com (2603:10a6:4:35::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 11:04:54 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Wed, 31 Jul 2019 11:04:54 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:04:53 +0000
Received: ("Tessian outbound cc8a947d4660:v26"); Wed, 31 Jul 2019 11:04:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9813a73c8c05fd17
X-CR-MTA-TID: 64aa7808
Received: from 1952a4c4541f.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.14.58])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0EA3A515-25E7-4990-AF13-FC4F6E15AB07.1;
        Wed, 31 Jul 2019 11:04:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1952a4c4541f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Jul 2019 11:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBXMYppGLsEC3wRlnaA8ubca+Glr/RMSNdaBNam1tBbVOxko/efRF6PBzDBpudBZJKuxIq2x+gdZJEPVcQx8cST2D3b0VoWpNf+QPN+DgPaZcKZHyRvyJZ/GcAupBQkp0yaTzDsTGF8rU3GptpojWesI+exTQxENtGzaNXQ0KnOk/5mNmaQBWc5rGApYKKapMs4FeKrIXJqe67mhKDPvt5SNemCb4N/ipWYYhO9+xTRI+aN1CHi6Ytot00sYoFWbJMsi3u3Z2MyZasl4uuB5hml71s1E+jrOVYLVkAVLxGC8SzzDDvOMRNjLQlYENfDEPlMO6NzhzaHHIFMslCgpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=BeQbBj/wAwLa6085sQlDd81sPzlv3Gq54Yv/fY7XnqLIIgmNfob1aE6m0yVRpex4LvYJTATcIu1FE24nOi7qi14xm0gt1dGxaBvm65EoTsYGnm6PA1jk5CPpJoG+BNEcvnNpdWnpVjMoS3FYxQLjovypChz1rK39FWJWqQTYncXTQ2YrEfIAhJOaNR0VNRJnkIMomsBuCLjXKRgx+j79tF2KgJp3AVtQAsqC1yccAXp12HxDRncLoBqK3H/br+LB7C95m3hXrdRIpwGIRgx0kf6RedXJL/KFL0ejeIQ39XbCeZgym542Yj5Jgx0NYWNbyLYoi8TDyGyxYO3Ptjdtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=RjaCkRkeKWh/8MoIGXiFFbd7u9HAJqN58hIHEyE477CjmIhVLZ4tkTorNwTXCVfwXaGNzK+Fxi363gNcviJQZlf0+mtM8ljUP0WTUcQqeL3565ZLnqs4dqPWnD16v4RGM8CzOQ9gxscGYfgyWUzXna/iv1wF7Em4iyKoDTC3XF8=
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3405.eurprd08.prod.outlook.com (20.177.58.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 31 Jul 2019 11:04:32 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:31 +0000
From:   "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To:     Liviu Dudau <Liviu.Dudau@arm.com>,
        "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        Brian Starkey <Brian.Starkey@arm.com>
CC:     "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "eric@anholt.net" <eric@anholt.net>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, nd <nd@arm.com>
Subject: [PATCH v1 0/2] Free the writeback_job when it with an empty fb
Thread-Topic: [PATCH v1 0/2] Free the writeback_job when it with an empty fb
Thread-Index: AQHVR4+6JELUa+Im3kWvDFA/sbxmXA==
Date:   Wed, 31 Jul 2019 11:04:30 +0000
Message-ID: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4f57a01-6f23-4983-c3e3-08d715a6ea13
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR08MB3405;
X-MS-TrafficTypeDiagnostic: VI1PR08MB3405:|DB6PR0801MB1846:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1846FFD77A01A9FECD8D42CB9FDF0@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(476003)(5660300002)(2616005)(6116002)(99286004)(6436002)(81166006)(68736007)(86362001)(4326008)(50226002)(3846002)(81156014)(26005)(8676002)(52116002)(256004)(8936002)(305945005)(7416002)(7736002)(4744005)(6486002)(66476007)(6512007)(71190400001)(66946007)(54906003)(2501003)(66066001)(386003)(71200400001)(6506007)(486006)(102836004)(316002)(110136005)(25786009)(2201001)(2906002)(55236004)(6636002)(64756008)(53936002)(478600001)(36756003)(186003)(66556008)(66446008)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3405;H:VI1PR08MB5488.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 7vMiZ1bBdI+EIYlm6xc3REPKy0dA//uWXYpAEVu8OsckJArgXgIY3XcOFPEjv0wnxF473j31gVwjNRVJOWMHvrwwA/YJOEkuQozQdcAy1Cq2Rk+JGdlS450nFjk6fAr2Uwu7a9aC5Zr0ty67s+zF8ahG87dCnVEGyh5b/R7kmB6/xuo/F8Dp3n2wHPonlBpZ2ybkOb7UQ49oxLumd5ukwHqXyv73fGAe9nCfKUN+AxKP1Y9LA8XDZO8D0K1AkUzhyDQpextEseCSd/bN8hHinNlM2bc9nDeZrE2tuw2fOCuQN7m/5fJmyP5tK69ts9G8GDid8JlvZo2VrSb2KxcReIGFwN+yjefQDN1C4zd07C5WaGP+rTzpxSdAxkAmfX4LmThR7AwXKQpCSTT9L9sJij8cug3K4LGTsT39JPhZzzs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3405
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(4326008)(356004)(476003)(6486002)(22756006)(2616005)(102836004)(2906002)(186003)(63350400001)(6512007)(8676002)(2501003)(26005)(305945005)(36756003)(6636002)(81166006)(5660300002)(6506007)(99286004)(25786009)(63370400001)(36906005)(386003)(4744005)(486006)(23756003)(70586007)(76130400001)(110136005)(7736002)(50466002)(26826003)(316002)(81156014)(2201001)(50226002)(336012)(66066001)(3846002)(14454004)(450100002)(8746002)(6116002)(86362001)(54906003)(70206006)(8936002)(126002)(478600001)(47776003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0801MB1846;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2d94ce51-6bd6-40f6-b62b-08d715a6dc7f
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB6PR0801MB1846;
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: TMtT/NpFfgWSOyFfAfUC9PWWwqfoxn987LjKS/cJ7G6SISxGlems7pC/5oi+OEJiAOf7/5jzyxgsD0DeZ3ygQRafhRCoiBVqGxdrXICqV2T7V+E2Zy+AFwcaT0HVHixaDs9gAvgWVPpVDckQUh/Ys/Ghr91zsUf7Ytbgblg/Augd1ykI57wg5FNAV+0YNcoPauzDjZqavVyfqQSEM98AiEtkO9vxWJAf8ISe0BQLTzEA+ArRx2CBixZcoYu9/Ojx5bi3WWK9o5prsh2Atfy0jdGNKfT//aKXV2lT27UF5jjKy9Dp5crqc+1Dtfx2aOPUkU+r/bFhPWsJ0WPOhvTORXnoUDj9OV66C1gPlwtCQ/ctei9lKIebm8qLg+I3vUqltUDWBax2EoqMKG6+cfMTZWHhpurBY9MmcC8qxeXOlss=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:04:53.0371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f57a01-6f23-4983-c3e3-08d715a6ea13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This serie aims at adding the check and free the writeback_job when it
with an empty fb in drm_atomic_connector_check().

Also did some refine in drm_writeback_signal_completion() to clear the
fence pointer when writeback job signaled.

This patchset is based at the drm-misc-fixes branch.

Lowry Li (Arm Technology China) (2):
  drm: Free the writeback_job when it with an empty fb
  drm: Clear the fence pointer when writeback job signaled

 .../drm/arm/display/komeda/komeda_wb_connector.c   |  3 +--
 drivers/gpu/drm/arm/malidp_mw.c                    |  4 ++--
 drivers/gpu/drm/drm_atomic.c                       | 13 ++++++++----
 drivers/gpu/drm/drm_writeback.c                    | 23 ++++++++++++++----=
----
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |  4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c                      |  5 ++---
 6 files changed, 31 insertions(+), 21 deletions(-)

--=20
1.9.1

