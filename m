Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0EB7C32E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 15:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfGaNUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 09:20:09 -0400
Received: from mail-eopbgr130082.outbound.protection.outlook.com ([40.107.13.82]:7678
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728082AbfGaNUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 09:20:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYUENCu4qrwThoMPAd+n4dyJPsIPhu0x4VDZyHiIkBOtqgZ1WnezgMXNjNLQ7CIgDdZWFBKYs3PG7Et8BkIB7psEGqq+oqOi66wN7wvKrhuo8Zxt5/SfJHKhvJ5VmsCGCMVN3XLAIifEL48LT6jdGQfoaHPiTQSnPMAGDJ8KJnQ8ePR4pXWHS8hShcn4Ai+vino6PsJhPhGCmCIxCZW4Wg6wAKbJZcaMrmDGcr+VQ8uAtoV609wZK2gUMPHxo+tn2Q8uKg2nKALXhTHCCsIMVBxVLUKussHtepP7PfI5z84Mp5331W3HObg88TX7XBlxX9NaU2LSb2pBEP/2Yev3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuSkLlpTjoAAw3ygeWNyh42L9mDiLoQVEwylkEU2t3Y=;
 b=NKqJaOFd/pehwRte4gPoO0sogMWCGtuwLMWUEBHJQy0EF4B43/a/muVgLALk4YNBlJooQ4qIAexim0YWhAM62V7c8wqpPKeCNfHGo39MtlCE5lBR0BGxgv7o6RW/Yr92e3bV70yCR52whiginkxgQkUbb6kCIjBsC5Sk2LeZ3P+zIvY2YLzWQ3WTTPq7bMRBB1DDRrCe04DnSpMJDBv1y0hMfbPENk3X87qpYqjYOe05vwBOqSA8PE1mLb6fFRd7I2HuWAy94UyBwzLhNgIuGVKKpvk6lhdTADyQgfA77Ff3MxoXuNyGlVXPFrZCirn9OqGQ61OP7Un8V6mPH2XJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuSkLlpTjoAAw3ygeWNyh42L9mDiLoQVEwylkEU2t3Y=;
 b=b+pstyLyDIC6x5SQD1k0FPbHyu94QySZtunMP7iQjVMkcfT8hQKXOaYz0F3T5xVNQUyVAIAp1dogOqTlxyTQ+vrQAtheWog4BfXrziOL79C2ZAZ+zyJqhMsK9IkdtFFtWRyqoKlB97hW+gRiRdwSumqyrBVGw+g6MiRE4XPxBK0=
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3662.eurprd08.prod.outlook.com (20.177.61.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 13:20:04 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:20:05 +0000
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
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIA
Date:   Wed, 31 Jul 2019 13:20:04 +0000
Message-ID: <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cfb4053-22b1-4a38-2cc8-08d715b9ccad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR08MB3662;
x-ms-traffictypediagnostic: VI1PR08MB3662:
x-microsoft-antispam-prvs: <VI1PR08MB3662CD7184680ED022D69040F0DF0@VI1PR08MB3662.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(2906002)(71190400001)(386003)(86362001)(5660300002)(14454004)(6862004)(9686003)(102836004)(6116002)(99286004)(71200400001)(6512007)(76176011)(6246003)(6506007)(3846002)(478600001)(7736002)(53936002)(1076003)(305945005)(66476007)(25786009)(256004)(66556008)(52116002)(58126008)(4326008)(66946007)(81166006)(186003)(446003)(6436002)(316002)(476003)(11346002)(486006)(81156014)(26005)(6636002)(8676002)(8936002)(54906003)(7416002)(64756008)(66066001)(66446008)(68736007)(44832011)(6486002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3662;H:VI1PR08MB3696.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Sf77PoeWBWTi5+b8IEhz9XsbqluOZ6jcxWEbbm3K2/SBqe5YxzCxWPjBz1bQx8nk1wIDnUUg9BNMYl5wDTKLxu76j3mf7lvqb/R+ECl0XUWULzpYS1lsjKytljrFOs/XHd+x3w/XtwmQOOtZkcfprZgEYCA9sBszZwMQqnUA5b/cYYkyej7Hxx2nX3Q8qKYWiVl1Ugsoe2UKOHavO/2XNRb+Z1/Rr1ZMfvBdHVkTaN/i3ODZ+DjVWK+CwKV/x0ZDJCKFFYlFTTPRRXIZmh7Bb53cm28gL+0f7AkIdc0NYzkyJKsDTaCZHAPm0S7cMs1+L1jN2RNSr4WL3N1t7DjGkpp4a0n2wCNivBWE9rVltQw/Wnx0jQpQJeOpxc5xShmL6e13CKxVWYtQQqyebDjSFeCFG5HOHeb3zexnVcqrpug=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30B2B0A32DF9114B91949B555FBBCC60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfb4053-22b1-4a38-2cc8-08d715b9ccad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:20:04.5237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3662
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lowry,

Thanks for this cleanup.

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

I'm thinking it might be a good idea to signal the fence with an error
here, if it's not already signaled. Otherwise, if there's someone
waiting (which there shouldn't be), they're going to be waiting a very
long time :-)

Thanks,
-Brian

> +		dma_fence_put(job->out_fence);
> +
>  	kfree(job);
>  }
