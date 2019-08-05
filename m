Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF6781AE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 15:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730014AbfHENK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 09:10:26 -0400
Received: from mail-eopbgr150053.outbound.protection.outlook.com ([40.107.15.53]:54910
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730310AbfHENKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 09:10:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwjbsxT4C+p5VWQXP5q+w7fCUYlnWUSM8gbxNTvLzkKg73QMQWX8qa8lG0vc9nqJGJ2SphJ1U7MuEIhwB/+0quEkPCj+hhUyLGbypgWTiqhRwfCa2Y4Fd6J6tJZ6PTG/OQH0BK8lh/A/RTqsXtCDEQ5t2+XuHmjqzcVQnCB/ET7r0EYKJlFbFlQ5sL3wToxPP5loTl2ePQrY7+YANNE3WiUeHiKjOPOH7W876Qn2991Ygk/q9JL0NEI9PkNueNl6jevUX6QI3zkRq9Y94IKlDzRcXLaRA8ISYD58tsm3ZA1j2EU5BSjPkldvSMvjFfz73CShSv2+7a/v3LABXbHxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCE9ySg0JEb1faX3GeVzHASlQlfnkWBqgZHYEiZe474=;
 b=gy2BrgKtz2ZJlcpE0tTcK6BolsC2PUq/b8HTc4nrkcOf3DSZLgPXwQ22sXyb+y8cQLb0rnNjKRH7TFTO2Dc+FoV+Tbz5U4ps7YxiS2p1OdDFgkQqwk0dNkSy+HTKcfDhJMCzrCG8Hd40wZOogBQ28739AO29lWIomjFNFFmxigg7KY89m4vFAmMqi+zOyzzID+bZ6lG0/b9YYygG/r5XjL8sjLCrR5VZ73T60wS8oAIr89FkFmcAmysMz5VwTxHvx9JKapBv8UlQiZql0JtY8m50N6X1TUaJ40v6as5Mv44vDNHWskHhdGUJj2qLLl82P2EpH3+7U60nTMKOocFG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCE9ySg0JEb1faX3GeVzHASlQlfnkWBqgZHYEiZe474=;
 b=khVS0YE0SwDYdp0sjWkqBCnEo61Zf33777fAjpDMVOaLDe+o7m9gIB62UEz7kiFg890JMqEoBQ1P0KEz3QwncXwnQXPrcvrhWmia7LyAv0x5nvsE4QNr/kJc7sBy3NsuVrqgFbF7qXa4uhPTx4k8Ezu2nQWK7Gh5z9htVGSw2rc=
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB5360.eurprd08.prod.outlook.com (52.133.244.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 13:10:17 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 13:10:17 +0000
From:   Brian Starkey <Brian.Starkey@arm.com>
To:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
CC:     Liviu Dudau <Liviu.Dudau@arm.com>,
        "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
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
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bsjx6A
Date:   Mon, 5 Aug 2019 13:10:17 +0000
Message-ID: <20190805131014.u2kei5tvbkcf7aeo@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::33) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e39071b-d675-4174-09da-08d719a642a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR08MB5360;
x-ms-traffictypediagnostic: VI1PR08MB5360:
x-microsoft-antispam-prvs: <VI1PR08MB53607FB3023F6B6F01AD85C9F0DA0@VI1PR08MB5360.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(189003)(199004)(102836004)(25786009)(4326008)(76176011)(6506007)(386003)(7416002)(53936002)(2906002)(6636002)(478600001)(3846002)(6116002)(6246003)(44832011)(1076003)(86362001)(446003)(6436002)(229853002)(256004)(11346002)(486006)(6862004)(316002)(6512007)(9686003)(58126008)(54906003)(14444005)(476003)(14454004)(6486002)(66946007)(5660300002)(71200400001)(71190400001)(68736007)(64756008)(66446008)(66476007)(66556008)(305945005)(8936002)(81166006)(81156014)(99286004)(8676002)(7736002)(66066001)(52116002)(26005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB5360;H:VI1PR08MB3696.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9qOBNaHn3scpbwUYXVz9M5T5ZINDlik9ZPhIOlX6I82R368LEMIAtIYov76xK9FlCrGXa2S0H+yuTR+UznaB8exemr73cDys8l5BWFeNrHwrlJoWKvKnF1UT83cyILHv1790cNjWj6Yo2Q+3wgC9XcjD+Gfnd2KHSgQ4ginRxMSgo6YFNAWMxnHkKsJW2wpprw3UYjkvfQmYxWUG403FOC0edDc5eXfyiQn53/kdGsoqWZFehZpPwQKT9A8TAx4jUXPaNSxuFSDOKgour+MfZB6TZrle+D4jcxie/QFwKpzshyXOl0PuSJwb12uLSKkcqrehzV1TFeWslrJD9K6oAIEp1Cw6VV115+lMZgYq1y4ICif74aIsC8TX1eIpM7SM8dHdkiZo719hvsg8L7Au5R4MJMxzw7R6CoSwj+P3H8U=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AF3F22A2EB691C4CAE958A80FAC283BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e39071b-d675-4174-09da-08d719a642a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 13:10:17.3412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lowry,

Based on Daniel's input, this patch looks fine:

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

I think there's some opportunity for improvement around
prepare_signaling/complete_signaling, but that can be treated as
separate from fixing this bug.

Thanks,
-Brian

On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology China) w=
rote:
> During it signals the completion of a writeback job, after releasing
> the out_fence, we'd clear the pointer.
>=20
> Check if fence left over in drm_writeback_cleanup_job(), release it.
>=20
> Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
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
> --=20
> 1.9.1
>=20
