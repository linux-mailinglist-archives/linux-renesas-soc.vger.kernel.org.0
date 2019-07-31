Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684627BED6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 13:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfGaLFK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 07:05:10 -0400
Received: from mail-eopbgr70084.outbound.protection.outlook.com ([40.107.7.84]:13763
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726559AbfGaLFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 07:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=E7ebuFvkbTjAUaKPJgPRhwxtibO/xalGiFHtFCaDAoc8lhXQ8VGQgmb5a7QTnAU2bE31mMXDyzS7/Ft0iMUnMf2V2CdQPWuJqijoWsSy+uW6zs4Ef0lMuo/riQqbmQfXKcysecQDgLjpURjMWmt/9K9/EtCE/hMPd27VHd4ohq8=
Received: from VI1PR0802CA0016.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::26) by DB8PR08MB4953.eurprd08.prod.outlook.com
 (2603:10a6:10:ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Wed, 31 Jul
 2019 11:05:04 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR0802CA0016.outlook.office365.com
 (2603:10a6:800:aa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 11:05:04 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:05:02 +0000
Received: ("Tessian outbound 71602e13cd49:v26"); Wed, 31 Jul 2019 11:04:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bde33b5ab3e1aaf6
X-CR-MTA-TID: 64aa7808
Received: from bb723fe09053.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.9.51])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 605E3197-38F3-4DFA-9B7F-B076A514BC2D.1;
        Wed, 31 Jul 2019 11:04:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb723fe09053.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Wed, 31 Jul 2019 11:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIWkv8KxOPf/yJ12N1e+YoRx0wAVkEwXLBptYvPNcJds9gZ3caQVb7+PC4dRD0w0IAwFuB2VGmjfvuKwz5ZLXJ4ABOTTP2Vfh/ADg8ip3qATe39PSKLM+Fkimrj5lKsGE/aGOzB3vJhgwphOYr7jMjqSwt5vjmrZiOxn6wy0zEHEjqSYQs4vmkUtSwXrMqJ9MHFJLVnnGwfr++kWk5vKdhrq+nJpvfWMFOIQb9ZUIY9N2/j+8z5bNPZw7SEwBen/Fxt9W8HhdWaRct5ZTyLz0IfDcxqYej1PQqJc7mklul5w/r8dSo926xwlA/MXCrEtwn4p3ovqGkPc7XKVS1AGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=AWQaQDdmP4LqACa8LCJa9kjk4PEqcHT9AbRtl4pc3ff6wwhMbZe1NUy6w7WU9NyAhfEkr0DoAg9/PTB16RXN3lufrVQDxxnRgFRcWJaCPrQ8xhUTrF1bdUkn3FSYSid/DVtgTXJzUria2VIwHtRqJ7JJ06SirJw9rOk7NE38GtN/TQsoPqVUfN7AFDNdgCrydLvjKptEFNHYYMeSvM3rdFVqt7AYHAf07wwXMIbKDgqTXQDVQo4DwJhdzxwSbkAzm+4XYw9P7cljgClyUQSvawbruTfs1z7WE8ZZuMzW/3dL6JBh6N2UlZBRaThKt/y5b0Mt5s4hS2nFM4JpYnNgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=E7ebuFvkbTjAUaKPJgPRhwxtibO/xalGiFHtFCaDAoc8lhXQ8VGQgmb5a7QTnAU2bE31mMXDyzS7/Ft0iMUnMf2V2CdQPWuJqijoWsSy+uW6zs4Ef0lMuo/riQqbmQfXKcysecQDgLjpURjMWmt/9K9/EtCE/hMPd27VHd4ohq8=
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3277.eurprd08.prod.outlook.com (52.134.30.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 11:04:39 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:39 +0000
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
Subject: [PATCH v1 1/2] drm: Free the writeback_job when it with an empty fb
Thread-Topic: [PATCH v1 1/2] drm: Free the writeback_job when it with an empty
 fb
Thread-Index: AQHVR4++ZQXRcCwwSUeRbKZ2hesp5g==
Date:   Wed, 31 Jul 2019 11:04:38 +0000
Message-ID: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: f99bfa8d-ddcf-4758-7ae1-08d715a6ef84
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR08MB3277;
X-MS-TrafficTypeDiagnostic: VI1PR08MB3277:|DB8PR08MB4953:
X-Microsoft-Antispam-PRVS: <DB8PR08MB49535EB46E6A8D91222D3CFD9FDF0@DB8PR08MB4953.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:51;OLM:51;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(66066001)(6506007)(386003)(102836004)(256004)(99286004)(7416002)(55236004)(5660300002)(71200400001)(71190400001)(52116002)(478600001)(446003)(25786009)(53936002)(6512007)(2501003)(486006)(86362001)(3846002)(2906002)(476003)(4326008)(11346002)(2616005)(6116002)(81156014)(81166006)(68736007)(8676002)(6486002)(50226002)(7736002)(305945005)(64756008)(66446008)(66556008)(66476007)(66946007)(76176011)(14454004)(2201001)(36756003)(316002)(54906003)(110136005)(26005)(6436002)(6636002)(8936002)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3277;H:VI1PR08MB5488.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 9GAulN+Mfv3Bpdr9b2MuGoz5KCMe6el24Mp1s+W8k8hr7TyjLJZtd/MDbq2tKxQB33px8GgoHBIE6dOUO/Vr6LmCgMY2ILB+TuC79wnMEd4MGZW5Wl93ibUTl6lcubQ9osUm2ckkwo2eLq1xAHzG+54bUz6+xKkVDvrgyreqyDZZvpN8zKYnEZKhVIUCqT67S/HQN1XiMdE/Pm9A0EAwgpkDKUsR0Crbq2UNiq+jTbp9jM9RO6HHhUFPXJHqAB3RT6SWBAJy+XAx1vQm6lMR3DWgBf3ECZnxTTbfyb12hP8F+p4g7ZqStgdrHH4f+dAomL34kgxCuIW/tiklSf2oFMlf484hu7K38uArAfk9iQh9V5PTrX9dorhbubn7sfueyZtgBqNUibTfxEqrrMOvTM08XHAWpTVjNDKiU4pIjLI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(189003)(199004)(6486002)(8936002)(2201001)(450100002)(26826003)(356004)(22756006)(4326008)(81156014)(81166006)(8676002)(25786009)(478600001)(99286004)(50226002)(8746002)(6512007)(2501003)(23756003)(486006)(6636002)(336012)(14454004)(3846002)(5660300002)(386003)(6506007)(305945005)(70586007)(63370400001)(70206006)(186003)(7736002)(316002)(66066001)(36906005)(446003)(76130400001)(2906002)(76176011)(26005)(54906003)(50466002)(476003)(2616005)(11346002)(86362001)(110136005)(102836004)(126002)(47776003)(36756003)(63350400001)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB4953;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: cffc6c92-4413-4819-1729-08d715a6e10c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4953;
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: iiPL8r4qDv+dwJjxXSS489NLXlCsVU3v2QS2DCp5p45fn9ZkgAJCMcMevSYFC9q4CfutzuPJkmpLdHlQ4ZAFAyXLNOHCLsdcxPf5jSBzY/6ws7eJ72KtWG/MXUt/LTIzTMf7CFEKC+wj9SydQcKINgHFIenQVNsEzynz883DiKVa6G3wp7IorTDmrbGMRFyHK3CwpmU4mBys7w5ZFBQaxKCu+ihTKYORnSbwUIE1le8sG/K1SQztbJoPoo0+FSXuWlkITSRuKXXihvj+szu60qxXw2eitSZocNaaBj7ohxg5DnCZ1WVN+BFWUOjYOy5694F76sjA+Msok/3vjSkuBtxsjS8KGZ5Uf9c+YOsmQig+aPRPNvNTdl6ieIUtJy1V+5y+jS8RR2nKJGAXd0OSU1C1bs31kTmjrl+QxhG51EA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:05:02.1794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f99bfa8d-ddcf-4758-7ae1-08d715a6ef84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4953
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>

Adds the check if the writeback_job with an empty fb, then it should
be freed in atomic_check phase.

With this change, the driver users will not check empty fb case any more.
So refined accordingly.

Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  3 +--
 drivers/gpu/drm/arm/malidp_mw.c                          |  4 ++--
 drivers/gpu/drm/drm_atomic.c                             | 13 +++++++++---=
-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c              |  4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c                            |  5 ++---
 5 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/dri=
vers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 617e1f7..d6103dd 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -43,9 +43,8 @@
 	struct komeda_data_flow_cfg dflow;
 	int err;
=20
-	if (!writeback_job || !writeback_job->fb) {
+	if (!writeback_job)
 		return 0;
-	}
=20
 	if (!crtc_st->active) {
 		DRM_DEBUG_ATOMIC("Cannot write the composition result out on a inactive =
CRTC.\n");
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_m=
w.c
index 2e81252..a59227b 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -130,7 +130,7 @@ static void malidp_mw_connector_destroy(struct drm_conn=
ector *connector)
 	struct drm_framebuffer *fb;
 	int i, n_planes;
=20
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+	if (!conn_state->writeback_job)
 		return 0;
=20
 	fb =3D conn_state->writeback_job->fb;
@@ -247,7 +247,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
=20
 	mw_state =3D to_mw_state(conn_state);
=20
-	if (conn_state->writeback_job && conn_state->writeback_job->fb) {
+	if (conn_state->writeback_job) {
 		struct drm_framebuffer *fb =3D conn_state->writeback_job->fb;
=20
 		DRM_DEV_DEBUG_DRIVER(drm->dev,
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 419381a..14aeaf7 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -430,10 +430,15 @@ static int drm_atomic_connector_check(struct drm_conn=
ector *connector,
 		return -EINVAL;
 	}
=20
-	if (writeback_job->out_fence && !writeback_job->fb) {
-		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebu=
ffer\n",
-				 connector->base.id, connector->name);
-		return -EINVAL;
+	if (!writeback_job->fb) {
+		if (writeback_job->out_fence) {
+			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without frameb=
uffer\n",
+					 connector->base.id, connector->name);
+			return -EINVAL;
+		}
+
+		drm_writeback_cleanup_job(writeback_job);
+		state->writeback_job =3D NULL;
 	}
=20
 	return 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/=
rcar-du/rcar_du_writeback.c
index ae07290..04efa78d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -147,7 +147,7 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encod=
er *encoder,
 	struct drm_device *dev =3D encoder->dev;
 	struct drm_framebuffer *fb;
=20
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+	if (!conn_state->writeback_job)
 		return 0;
=20
 	fb =3D conn_state->writeback_job->fb;
@@ -221,7 +221,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc=
,
 	unsigned int i;
=20
 	state =3D rcrtc->writeback.base.state;
-	if (!state || !state->writeback_job || !state->writeback_job->fb)
+	if (!state || !state->writeback_job)
 		return;
=20
 	fb =3D state->writeback_job->fb;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 96f91c1..e92fa12 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -229,7 +229,7 @@ static int vc4_txp_connector_atomic_check(struct drm_co=
nnector *conn,
 	int i;
=20
 	conn_state =3D drm_atomic_get_new_connector_state(state, conn);
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+	if (!conn_state->writeback_job)
 		return 0;
=20
 	crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->crtc);
@@ -269,8 +269,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_=
connector *conn,
 	u32 ctrl;
 	int i;
=20
-	if (WARN_ON(!conn_state->writeback_job ||
-		    !conn_state->writeback_job->fb))
+	if (WARN_ON(!conn_state->writeback_job))
 		return;
=20
 	mode =3D &conn_state->crtc->state->adjusted_mode;
--=20
1.9.1

