Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16761BAE77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 09:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393427AbfIWHZ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 03:25:57 -0400
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:21318
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393424AbfIWHZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 03:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=3Utr1eS2cQqR9FhvbB2msaGvTmRJ1A48IFbMGiNkuYDrtbSigLYjqJ12qlSjr0Ps93MVbpggz7s/T/5ZAnNneJmyfsGkyNVt8qsw8huEvDp093b4plFuxNJecf3+0xd+zp9nqPMX5GhNTzmIAToa3W0dr/QWgndgKJh88KfqAjE=
Received: from VE1PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:803:104::28)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 07:25:50 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VE1PR08CA0015.outlook.office365.com
 (2603:10a6:803:104::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 07:25:50 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 07:25:48 +0000
Received: ("Tessian outbound 968ab6b62146:v31"); Mon, 23 Sep 2019 07:25:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbd8fe14646136a0
X-CR-MTA-TID: 64aa7808
Received: from b3a8755af1cf.2 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.2.56])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE654876-060F-458D-BFAA-76941B9F5D99.1;
        Mon, 23 Sep 2019 07:25:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3a8755af1cf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Sep 2019 07:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaLvxJNEOiIyg4mKSOFcxpFhC3thUNmIfwbprBmMrbWsZuN74OxuaG+18keXKw81ADkzTEq9T6L+vFAay6wVXVcMhGymCDcGwItQySRSMAA8T5zfAbIinmoDDeGQ45uQVa4t0AbOmc/Lt/07NU+T5aIxRhcG6CJ64qXovk/B8Y/LMZc5myIq7l8AuS6WUm9D3KcYCOmKPd/WTQ/qohG4gmTHhOPYefBzBifhsoCrRSYwe2dnzouNkbABSIUSPXjJC5+uY4n9/0zXkkv6teZWCVX7ublVlk8YDiHV3jNAl5lH1E3Cl9RkDA3h9A66KXwq7VL1UPP/YD0/5hMzqI1eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=k+mHraDy6k1m7IIoaY8Z5l4Gc+dm4OrRFh5dr8UouMDSx0o4nl/3VDikf4c2XfO6494AxuIN2f3VoeWHdaoDS/0968M0nKCPEfpGfcLL4Mymr2BF+dSJYbfjco+y8FXfv2OoZRJbzJhEiZzo0ozVdrBuodbuFpypo6TuODNKMllvCKhrfx5xoN+Bt3eVNl62/hVx+zuMK9mEHy0tl3kwsRhNhd4kwE0B+RMQkXjRP2ZbrmTZlpcVv/49P0s+H+fCuV51xPxrhVy6XQeyg2/xUS2UmAMgwoMnhnvrRE+XlOQiALTas6VqxUrhskxq9Ro2G+cmPkcsy0GkwIQgYnZN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=3Utr1eS2cQqR9FhvbB2msaGvTmRJ1A48IFbMGiNkuYDrtbSigLYjqJ12qlSjr0Ps93MVbpggz7s/T/5ZAnNneJmyfsGkyNVt8qsw8huEvDp093b4plFuxNJecf3+0xd+zp9nqPMX5GhNTzmIAToa3W0dr/QWgndgKJh88KfqAjE=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 07:25:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:25:37 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
CC:     Liviu Dudau <Liviu.Dudau@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, nd <nd@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "sean@poorly.run" <sean@poorly.run>
Subject: Re: [v1,2/2] drm: Clear the fence pointer when writeback job signaled
Thread-Topic: [v1,2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVceAYuYsxZ6juH0uAeBdpCl+Fkg==
Date:   Mon, 23 Sep 2019 07:25:37 +0000
Message-ID: <20190923072529.GA17154@jamwan02-TSP300>
References: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0202.apcprd02.prod.outlook.com
 (2603:1096:201:20::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a5cec065-7a0d-4354-4557-08d73ff741b8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VE1PR08MB4799;
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|AM6PR08MB4851:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB485147041EDE77D1011EE3B3B3850@AM6PR08MB4851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39850400004)(376002)(346002)(199004)(189003)(14444005)(386003)(66066001)(4326008)(229853002)(478600001)(33656002)(6436002)(26005)(6636002)(6486002)(1076003)(25786009)(8936002)(186003)(316002)(7736002)(305945005)(58126008)(86362001)(81166006)(446003)(5660300002)(7416002)(6512007)(81156014)(476003)(11346002)(8676002)(486006)(9686003)(71190400001)(71200400001)(54906003)(66946007)(6116002)(3846002)(66556008)(66446008)(66476007)(52116002)(76176011)(33716001)(64756008)(14454004)(6246003)(99286004)(6506007)(55236004)(6862004)(256004)(102836004)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4799;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ewhaOac6Azo+aYxhiG2WNz/lJFJWsunsw/YcI0vS6bMFEPNOu1Bv4oe2tz8YsUwAYYtvsPD8L3JliF7iBfplW5pmtKaG85RlhSTHqp2K0JMhkdn+6tNzVXHzLp2OQxuzZiU+JtIkn2WFFCA+YSyhTO0K6h922An+QL5ZBfZRVCUBsL/KJfimJ+K89uMzEZA8JtqlAdl0Z5D7nODO6OO9prZd64mMRKOxrU4788XlrnCcm3J+K7MxELIFBhkG1KqFMZ2tPvX/dzMzHjJFVrReOHLqnZAFP+cYwgJRKU3sOJNKKkVFVP1TLyA57e4q+q0LT5OwhocgBJ3k9onZFf5srGXAeCh89m1Rb3zyLe7N+zFJZEYALyqwrCHYXK78zIjOJFfNfWJY4RqXG7rMM5FOKYFs2ZYRpAVeqlyjbQBPqXI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B4ACF590EAAC004082B04121BF49F3A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(7916004)(4636009)(136003)(396003)(39850400004)(376002)(346002)(199004)(189003)(316002)(486006)(14444005)(99286004)(36906005)(58126008)(450100002)(336012)(107886003)(229853002)(76176011)(54906003)(25786009)(386003)(102836004)(6506007)(1076003)(86362001)(6862004)(5660300002)(6636002)(46406003)(6246003)(33716001)(6486002)(126002)(446003)(11346002)(63350400001)(476003)(2906002)(66066001)(9686003)(14454004)(47776003)(6116002)(305945005)(7736002)(3846002)(356004)(26826003)(50466002)(97756001)(186003)(6512007)(8746002)(76130400001)(70206006)(23726003)(26005)(70586007)(478600001)(4326008)(8936002)(81166006)(81156014)(22756006)(8676002)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB4851;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: a7c5bf11-e077-406b-8ee2-08d73ff73a95
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM6PR08MB4851;
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: vEfL2IIvc53wWh+779H6F4d3q4G71j15aWKpUlhSXMWCL8gruozwJlcUN0pNktgc+/OiAzTQPU4mu7j+Nn4KXXVE6fQ82BhckzmVNL9uATwjMByVT6f/dKZcxuPIua2Q4+kZ2bGMly0DJD4R1bdQNY41+ByFuXQVvgWuNxr2cJiOc+p2ZMhJKsPWNiXJC94mBvJP/HGSO57TicIDSsKVsnCGJjjs18t/hOg04pniijlMITr03VXnreBeivJ3NuBsQoysUurappX4/GjYWqxPQInCXji33SbxsJ+wxYjgGqWHBMUY1nktwhlCn8x7rzOTYQBYD3qJo1u5zUqoY/FTjx34WTvqqz1AjrsXIrCmj36qEkbmai39q21fwY2HCFiJLjEXWOD3Vjy0/1e1fWFnoG+SWqGjK+uhnNj2QVZI38Y=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 07:25:48.6750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cec065-7a0d-4354-4557-08d73ff741b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology China) w=
rote:
> During it signals the completion of a writeback job, after releasing
> the out_fence, we'd clear the pointer.
>=20
> Check if fence left over in drm_writeback_cleanup_job(), release it.
>=20
> Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> Reviewed-by: Brian Starkey <brian.starkey@arm.com>

Looks good to me.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>

will push it to drm-misc-fixes

James

> ---
>  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index ff138b6..43d9e3b 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeback_j=
ob *job)
>  	if (job->fb)
>  		drm_framebuffer_put(job->fb);
> =20
> +	if (job->out_fence)
> +		dma_fence_put(job->out_fence);
> +
>  	kfree(job);
>  }
>  EXPORT_SYMBOL(drm_writeback_cleanup_job);
> @@ -366,25 +369,29 @@ static void cleanup_work(struct work_struct *work)
>  {
>  	unsigned long flags;
>  	struct drm_writeback_job *job;
> +	struct dma_fence *out_fence;
> =20
>  	spin_lock_irqsave(&wb_connector->job_lock, flags);
>  	job =3D list_first_entry_or_null(&wb_connector->job_queue,
>  				       struct drm_writeback_job,
>  				       list_entry);
> -	if (job) {
> +	if (job)
>  		list_del(&job->list_entry);
> -		if (job->out_fence) {
> -			if (status)
> -				dma_fence_set_error(job->out_fence, status);
> -			dma_fence_signal(job->out_fence);
> -			dma_fence_put(job->out_fence);
> -		}
> -	}
> +
>  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> =20
>  	if (WARN_ON(!job))
>  		return;
> =20
> +	out_fence =3D job->out_fence;
> +	if (out_fence) {
> +		if (status)
> +			dma_fence_set_error(out_fence, status);
> +		dma_fence_signal(out_fence);
> +		dma_fence_put(out_fence);
> +		job->out_fence =3D NULL;
> +	}
> +
>  	INIT_WORK(&job->cleanup_work, cleanup_work);
>  	queue_work(system_long_wq, &job->cleanup_work);
>  }
