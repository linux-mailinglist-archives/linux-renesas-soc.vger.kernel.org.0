Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B957BED8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 13:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfGaLFR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 07:05:17 -0400
Received: from mail-eopbgr10041.outbound.protection.outlook.com ([40.107.1.41]:19622
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726559AbfGaLFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 07:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=91A3RoJk96bpl7g//6O2VxMd1wj5EZtgGEX/wfhXEaQ72izJWr967s5rd5NkdfJt8opNxMMbE1j5Zjyeq6XrGpsKZjswPDJ35ki7220MloByiE86xei3PA6naiQ5uS9aQRGSbgcQkxE+cV/vull+VPBWih03AfRSINeCulbjU/8=
Received: from VI1PR08CA0236.eurprd08.prod.outlook.com (2603:10a6:802:15::45)
 by DB8PR08MB4956.eurprd08.prod.outlook.com (2603:10a6:10:e0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Wed, 31 Jul
 2019 11:05:11 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0236.outlook.office365.com
 (2603:10a6:802:15::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 11:05:10 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:05:08 +0000
Received: ("Tessian outbound 40a263b748b4:v26"); Wed, 31 Jul 2019 11:04:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a8608357a0b1067
X-CR-MTA-TID: 64aa7808
Received: from 9c97919290da.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.9.57])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63DA46EF-32F2-486B-ABFD-399FFB8C0405.1;
        Wed, 31 Jul 2019 11:04:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c97919290da.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Wed, 31 Jul 2019 11:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly9bw8+PoyxEMVCZideNgyBWMsNV0d7jDXx7wDYJkbwZ64bfoTavp63Jbi2hwZ/fagof2oCxBApO+DtyTM7Cvoy5hGo2JhG4rFXsAZMJ978pWYVq2Rw/bZ0Psk7cf1Wf8jpTqAFymEtoNSaE7ptrYnxnxSYkzLW7yrKZXdBNHIHA4r3w6L4gfkmlhx52guPNDOVnGk9dnqZlNVD1LVnACmAPcQvD9/uH5dF8yaRCUZL1Fl/zYsYy7Gda06VLWdFJmhkcTCTDlwR7cRYa1vw2bUx/8Q4LZMr9wCB5wz1PdDeK/QuN0sDbQYFRX+YhNp48xwtt4XsUtLBvtznoqB0jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=KE10ntXsIELeWem4U5mPYUKK/io3cEt7AAgMwc2un6/99Yx5VnQKRWZ5aYzJBXTT7z+67ndVEGuyU8o25fndPCMxomDEdsqP+McNoRMg6cKFK26esMWUhNDR5DRtmxm/TqPs7BVok4SPHUz8xN2FeYdZLtowfHlvLzQfpNR4lytWh3G9xVgzCPVBnMkjIsMp1Jd30fkXUYNlBlHFRMlXyN5dDBc/Fgiigj8b/2UiA3gH1HCky0WrWnm0rtO3MwNDHhhdGNacDkwSl6vrb9jzO73MlBt/UJKr0WiCykQKKe+VBhtpa5E3ENWCeQH9e0a+Ghbw8KaNQILOg/aAFXe/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=91A3RoJk96bpl7g//6O2VxMd1wj5EZtgGEX/wfhXEaQ72izJWr967s5rd5NkdfJt8opNxMMbE1j5Zjyeq6XrGpsKZjswPDJ35ki7220MloByiE86xei3PA6naiQ5uS9aQRGSbgcQkxE+cV/vull+VPBWih03AfRSINeCulbjU/8=
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3277.eurprd08.prod.outlook.com (52.134.30.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 11:04:45 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:45 +0000
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
Subject: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/CyrPm3jrEukClo/Nxj8QL5w==
Date:   Wed, 31 Jul 2019 11:04:45 +0000
Message-ID: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8483d766-7934-450e-3ed8-08d715a6f34e
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR08MB3277;
X-MS-TrafficTypeDiagnostic: VI1PR08MB3277:|DB8PR08MB4956:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4956E594D9A3B4CFED8A66DD9FDF0@DB8PR08MB4956.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(199004)(7736002)(305945005)(50226002)(64756008)(66946007)(66476007)(66556008)(66446008)(8676002)(81156014)(81166006)(68736007)(6486002)(6436002)(26005)(8936002)(186003)(6636002)(36756003)(2201001)(76176011)(14454004)(316002)(110136005)(54906003)(7416002)(256004)(14444005)(99286004)(71200400001)(52116002)(71190400001)(55236004)(5660300002)(478600001)(66066001)(102836004)(386003)(6506007)(2906002)(476003)(11346002)(2616005)(6116002)(3846002)(4326008)(6512007)(25786009)(446003)(53936002)(86362001)(486006)(2501003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3277;H:VI1PR08MB5488.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: WXmqDohCEA/7fkuqz1RlAaKhUO2FNDYypqCPHSPtxeKhQORsDfncdEfO19B634W/mx5bssmCdeeCg7UUn6yjLbjjRHx/hDJgg408/FvSPzGPgipPADzSOyst3x+H+Bw2FvgV56M1eKqVo7ZcztsYp2FW7vcMPUP9cl6KgBLgeT6Pc22bacP24soXxfFXihhzqsKc1q9XWrFqsntRf33qDuKtUIsD8b3uz0yEbseUuOqFYu4UvU+YPVwwFZn0riQv4Nq2Maki+28yzGHZUCxuWtY+L18TyC5PsBGpuDam1CHp0mculguYH/vn4JSMpNGOLBrXA79X/g5uMZPqzFTUWJkr+jV8x5X1l3luOvYTFiyDLw92EThQRV5VIkObmpdTkIqEq/O6c76tmowEe9wnhvC9jYvQtF4UIWMXQG7q4oI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(2980300002)(199004)(189003)(76130400001)(70586007)(70206006)(14444005)(336012)(6636002)(50466002)(47776003)(8676002)(5660300002)(2201001)(14454004)(2501003)(4326008)(66066001)(102836004)(450100002)(186003)(2906002)(25786009)(8746002)(26005)(8936002)(23756003)(81166006)(81156014)(50226002)(6116002)(478600001)(3846002)(386003)(6506007)(26826003)(316002)(110136005)(7736002)(486006)(356004)(476003)(126002)(54906003)(36756003)(305945005)(22756006)(99286004)(2616005)(11346002)(86362001)(446003)(6512007)(63350400001)(63370400001)(6486002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB4956;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: b45b6f3b-2ebb-41b7-1031-08d715a6e52a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4956;
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: OIfsA2nSDSHwqd8gZ1WBhm+8Qp7iJjhtKilLQlQ30XEntI1svhTQh8QHAQJBV5BaZlKEu+w0BxXxtt7HLm0yTbvJts0Ya/YekhmFEe72WEDzFdWmGnVuaRy4/i4x+3LMD4u5qy9OjLmm4Qqjk+2GpQa/okbTWL2SNOsz9+xHYxJqzwfIdp76BtSmprR2Pb0XcMj8SdIIPbaqG9COdDH9hmhzpk2pjhmz2QPkYFB+ujMkjvgX9I6/FH7g8uI1pmmWefY5WkaF9A6nlU5y/MxjQcz9wzCr/z7QCBzGV0G8OQhm5O8eaSjso64tnmuyOr5zlxnBJjHD6MCs9bSNM4l9E0Dq2LfIML96gOHMensUhpam7bannL49YjU2BvZyKpcY0nQl4F/dUqNSuIWY2it7Qc/XDPKiUP8lMowLnrYZftU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:05:08.6229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8483d766-7934-450e-3ed8-08d715a6f34e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4956
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

During it signals the completion of a writeback job, after releasing
the out_fence, we'd clear the pointer.

Check if fence left over in drm_writeback_cleanup_job(), release it.

Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
---
 drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writebac=
k.c
index ff138b6..43d9e3b 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeback_job=
 *job)
 	if (job->fb)
 		drm_framebuffer_put(job->fb);
=20
+	if (job->out_fence)
+		dma_fence_put(job->out_fence);
+
 	kfree(job);
 }
 EXPORT_SYMBOL(drm_writeback_cleanup_job);
@@ -366,25 +369,29 @@ static void cleanup_work(struct work_struct *work)
 {
 	unsigned long flags;
 	struct drm_writeback_job *job;
+	struct dma_fence *out_fence;
=20
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	job =3D list_first_entry_or_null(&wb_connector->job_queue,
 				       struct drm_writeback_job,
 				       list_entry);
-	if (job) {
+	if (job)
 		list_del(&job->list_entry);
-		if (job->out_fence) {
-			if (status)
-				dma_fence_set_error(job->out_fence, status);
-			dma_fence_signal(job->out_fence);
-			dma_fence_put(job->out_fence);
-		}
-	}
+
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
=20
 	if (WARN_ON(!job))
 		return;
=20
+	out_fence =3D job->out_fence;
+	if (out_fence) {
+		if (status)
+			dma_fence_set_error(out_fence, status);
+		dma_fence_signal(out_fence);
+		dma_fence_put(out_fence);
+		job->out_fence =3D NULL;
+	}
+
 	INIT_WORK(&job->cleanup_work, cleanup_work);
 	queue_work(system_long_wq, &job->cleanup_work);
 }
--=20
1.9.1

