Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C169BAE71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 09:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390274AbfIWHYv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 03:24:51 -0400
Received: from mail-eopbgr30085.outbound.protection.outlook.com ([40.107.3.85]:40515
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389719AbfIWHYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 03:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=ggA/OuL4Py+E5XEiw0BcftPSXM8yeQMWz7RMWoZ6D7ff7yIkBpXDxqDpaf5oNdXrWpbzvGKkcA9Hk8Ikk+oCorT4j04OdaDEb7FovsgTWb/rh/TqRlxfX1nTqazQGYffEaQ2CbXn7EUX5dONpkJ2uhQiv//RFw6OORKm3WYEKUE=
Received: from DB6PR0801CA0066.eurprd08.prod.outlook.com (2603:10a6:4:2b::34)
 by AM0PR08MB4468.eurprd08.prod.outlook.com (2603:10a6:208:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Mon, 23 Sep
 2019 07:24:42 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by DB6PR0801CA0066.outlook.office365.com
 (2603:10a6:4:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 07:24:42 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 07:24:40 +0000
Received: ("Tessian outbound 5061e1b5386c:v31"); Mon, 23 Sep 2019 07:24:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7d1295e3cd5b193
X-CR-MTA-TID: 64aa7808
Received: from d662ad4798ff.2 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.2.52])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id FC8A64BE-91DC-4885-B43F-536B48960A92.1;
        Mon, 23 Sep 2019 07:24:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d662ad4798ff.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Sep 2019 07:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR/HvTlVRlctQiJQVzBS4B/pOIluKjMNMIgEaMBp5Ureppei5BZaB2+oinkxl3LRnYP7lDrfpTps3qQdlPvLJdjkoEHmUKsTp8TqP61PUMfCEjqEe11/f6+kTqHrk7FTiT7Z8QiVDeK8S04JoM/+5ICgt5Y39pAGBqpHIoZJoq6H5VmQ8jniWEPeEh5jgGE6wWA5u919mLz7hOL+Q9plI4yl2w3zYEiQKPFgdCyroJ4qhrDbpHsNeVAbWakN8UVvoHL6zJcYdtXU0PVSiF2LZK8AJcTBS5LYpGoV0WaSVpXaYB/iqq4g9aRlkAjo9+FQ887YPHr4D8vi0OJCRxQdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=oBZDoIQOlQwTiFP+X/FigLiHsvpAJfIoiw3XyUk4QKx8xAfrabzuuKXAggp1nBC9AHxBqyfzI3ueBOBLSU6DRQeKSFMNgoiVGFuyaBgrqHUJuSmz07Tul3TZQUkXrLUHUuIek3Zv3MaJtrdYVwUYXcqS3pGWDRqaQ8dW53TOh5nZGoTaPM33Hg6ZLNNTcieGQEoOC8lIZBessV2E1+a39B/ztDIvTFtPfIzFFlGtpjcBoqAvRDi3QmCvhTUefc8pz5A1JOy81tXGnWCshw8z0D/WfvGN8H6BvGtU5ljKztZWiyhlxo+G6E5hC6g5vX93mXrldxJYnPBGpPeLJP8pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=ggA/OuL4Py+E5XEiw0BcftPSXM8yeQMWz7RMWoZ6D7ff7yIkBpXDxqDpaf5oNdXrWpbzvGKkcA9Hk8Ikk+oCorT4j04OdaDEb7FovsgTWb/rh/TqRlxfX1nTqazQGYffEaQ2CbXn7EUX5dONpkJ2uhQiv//RFw6OORKm3WYEKUE=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 07:24:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:24:26 +0000
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
Subject: Re: [v1,1/2] drm: Free the writeback_job when it with an empty fb
Thread-Topic: [v1,1/2] drm: Free the writeback_job when it with an empty fb
Thread-Index: AQHVcd/uPDLSm4oTDkStRUBRXbS/uA==
Date:   Mon, 23 Sep 2019 07:24:26 +0000
Message-ID: <20190923072419.GA17006@jamwan02-TSP300>
References: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0206.apcprd02.prod.outlook.com
 (2603:1096:201:20::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 558d73fc-8c29-4449-b218-08d73ff71956
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VE1PR08MB4799;
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|AM0PR08MB4468:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB446825B1AC0C94AECC493E9DB3850@AM0PR08MB4468.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:41;OLM:41;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39850400004)(376002)(346002)(199004)(189003)(386003)(66066001)(4326008)(229853002)(478600001)(33656002)(6436002)(26005)(6636002)(6486002)(1076003)(25786009)(8936002)(186003)(316002)(7736002)(305945005)(58126008)(86362001)(81166006)(446003)(5660300002)(7416002)(6512007)(81156014)(476003)(11346002)(8676002)(486006)(9686003)(71190400001)(71200400001)(54906003)(66946007)(6116002)(3846002)(66556008)(66446008)(66476007)(52116002)(76176011)(33716001)(64756008)(14454004)(6246003)(99286004)(6506007)(55236004)(6862004)(256004)(102836004)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4799;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: nu/8GwjlYPrJR7uWTxQHHN/V3edaq8k9qVZrsl78x2K3cBXiHxDFUM9bWTnhxyikC5coieVS0gOrJHxsT/azNFD0M3/LYFGS9XwM45wvetvASOmLAarjxlwNJqUGkFEYgtcfzsoE0huj8qyWu5c3hvn9dsZMxzitOrV/MscD7Ul4E6heTBjBLu2KOtuOxqs0lme7eyoVSbgfZBbQdpyENGOmGyW0mXNmxAaYhFYC53bsv8MbvPcu55w1Je02h5jnuinvC1f8Qs7tvJ7vuLgzMX8W1YxoMvFh9klf4qSwPCrRcpql/CIUggR3CjESxIxStKF9QjCPUpkIknUmqBE9U0yM+g3JxSINKmeqOc5hV+JvFJbE2qkbX5rqvafpb1RbHKkbSvpmvQEvLzO12Jj/1NSRJbZNNOqsXykfvt0TGsw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2817BAE5E83DDB4F9DB84419C25E7931@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(81166006)(186003)(26005)(4326008)(7736002)(6506007)(305945005)(36906005)(107886003)(33656002)(76176011)(386003)(450100002)(76130400001)(97756001)(99286004)(316002)(486006)(11346002)(446003)(126002)(229853002)(356004)(25786009)(22756006)(6246003)(9686003)(6512007)(102836004)(63350400001)(70586007)(58126008)(476003)(70206006)(50466002)(54906003)(6116002)(336012)(46406003)(2906002)(14454004)(6862004)(6486002)(6636002)(8676002)(1076003)(3846002)(478600001)(5660300002)(23726003)(8746002)(33716001)(8936002)(26826003)(66066001)(47776003)(86362001)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4468;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: fde72182-c92c-47cd-ca0b-08d73ff71076
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR08MB4468;
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: 7zL6wDl7B8P6Qrb3/hsIhT9gwy6/So+evr4F75DsiZVu2/V8GoGZ9FaJ5imhpfF2CrMoeAJyGVosEZM/9fbe/jWbukYmWyjXf3VKlcc8rZp3Ec015bHZkS3IpBoWhi77Svnh9taUp7j6oHo8axGThw9xe31EaZ6W1HwOkS0d3+OohVREWtRLDyVLTiLlROgNqkX1wYRQxqICea6qyRiIbiDuz0f+lENV50zYVzzmJAaF11p1Nj2cNlI6JYv4ymqRqfazWJt1ExY3aMFoE0SOgs6kGq7me+7o0kJTOG2xG/Q8mEYusd1Mo0SsfgGXpcnTIOJAE9yWl6D0yd8O75CVNnpaWeVLEYvuCPzCLGbvZAb1Dd2CQI8MLZq+/sZLSA5tuIN11qWSPShUQIquWXL+h++U7VFEIE/JhG40H2q6tMs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 07:24:40.8706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558d73fc-8c29-4449-b218-08d73ff71956
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4468
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 11:04:38AM +0000, Lowry Li (Arm Technology China) w=
rote:
> From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
>=20
> Adds the check if the writeback_job with an empty fb, then it should
> be freed in atomic_check phase.
>=20
> With this change, the driver users will not check empty fb case any more.
> So refined accordingly.
>=20
> Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Looks good to me.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>

And will push it to drm-misc-fixes

James

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  3 +--
>  drivers/gpu/drm/arm/malidp_mw.c                          |  4 ++--
>  drivers/gpu/drm/drm_atomic.c                             | 13 +++++++++-=
---
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c              |  4 ++--
>  drivers/gpu/drm/vc4/vc4_txp.c                            |  5 ++---
>  5 files changed, 16 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/d=
rivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index 617e1f7..d6103dd 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -43,9 +43,8 @@
>  	struct komeda_data_flow_cfg dflow;
>  	int err;
> =20
> -	if (!writeback_job || !writeback_job->fb) {
> +	if (!writeback_job)
>  		return 0;
> -	}
> =20
>  	if (!crtc_st->active) {
>  		DRM_DEBUG_ATOMIC("Cannot write the composition result out on a inactiv=
e CRTC.\n");
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp=
_mw.c
> index 2e81252..a59227b 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -130,7 +130,7 @@ static void malidp_mw_connector_destroy(struct drm_co=
nnector *connector)
>  	struct drm_framebuffer *fb;
>  	int i, n_planes;
> =20
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
> =20
>  	fb =3D conn_state->writeback_job->fb;
> @@ -247,7 +247,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
> =20
>  	mw_state =3D to_mw_state(conn_state);
> =20
> -	if (conn_state->writeback_job && conn_state->writeback_job->fb) {
> +	if (conn_state->writeback_job) {
>  		struct drm_framebuffer *fb =3D conn_state->writeback_job->fb;
> =20
>  		DRM_DEV_DEBUG_DRIVER(drm->dev,
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 419381a..14aeaf7 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -430,10 +430,15 @@ static int drm_atomic_connector_check(struct drm_co=
nnector *connector,
>  		return -EINVAL;
>  	}
> =20
> -	if (writeback_job->out_fence && !writeback_job->fb) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without frame=
buffer\n",
> -				 connector->base.id, connector->name);
> -		return -EINVAL;
> +	if (!writeback_job->fb) {
> +		if (writeback_job->out_fence) {
> +			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without fram=
ebuffer\n",
> +					 connector->base.id, connector->name);
> +			return -EINVAL;
> +		}
> +
> +		drm_writeback_cleanup_job(writeback_job);
> +		state->writeback_job =3D NULL;
>  	}
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/dr=
m/rcar-du/rcar_du_writeback.c
> index ae07290..04efa78d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -147,7 +147,7 @@ static int rcar_du_wb_enc_atomic_check(struct drm_enc=
oder *encoder,
>  	struct drm_device *dev =3D encoder->dev;
>  	struct drm_framebuffer *fb;
> =20
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
> =20
>  	fb =3D conn_state->writeback_job->fb;
> @@ -221,7 +221,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcr=
tc,
>  	unsigned int i;
> =20
>  	state =3D rcrtc->writeback.base.state;
> -	if (!state || !state->writeback_job || !state->writeback_job->fb)
> +	if (!state || !state->writeback_job)
>  		return;
> =20
>  	fb =3D state->writeback_job->fb;
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.=
c
> index 96f91c1..e92fa12 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -229,7 +229,7 @@ static int vc4_txp_connector_atomic_check(struct drm_=
connector *conn,
>  	int i;
> =20
>  	conn_state =3D drm_atomic_get_new_connector_state(state, conn);
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
> =20
>  	crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> @@ -269,8 +269,7 @@ static void vc4_txp_connector_atomic_commit(struct dr=
m_connector *conn,
>  	u32 ctrl;
>  	int i;
> =20
> -	if (WARN_ON(!conn_state->writeback_job ||
> -		    !conn_state->writeback_job->fb))
> +	if (WARN_ON(!conn_state->writeback_job))
>  		return;
> =20
>  	mode =3D &conn_state->crtc->state->adjusted_mode;
