Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32B67F07A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 11:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbfHBJ32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 05:29:28 -0400
Received: from mail-eopbgr130084.outbound.protection.outlook.com ([40.107.13.84]:27574
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726716AbfHBJ32 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 05:29:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS6r6BWwUcszxXiIWOjaPMhxFqKeo3fd+eeBLc47CYT9x9KB/MOJb2Mx1DQACbbWs5yC4iWkRJkQQWICnrSv7et6Y+7iVXYpeb2tqHJJmkYLdy4evU6COunoUqsD6StvYo5zrREoAj/fuIBQIWphopMK/sXv37pD/AYJAgHh+Ui6rsTxdqGTv4xezvWYelvjbKy4pxJcwAiwWc2QLRh0mXSNr34rMBKmPKGTyEBcgxA8kWCsMb43pyhGHFv/72ZEvjszEYtj3wsFfa6Oo0vSBxr/zVSjtVXBrYNzJO3/UdDHSkPGFpmtiaRCE/6BlYqj76JxFXA/DfC9NDCz4OV8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=029QuZdo9+2wuHXmdlY9dpD9TMu6h/RXod+Koc+16VE=;
 b=CU0GYQgRR7ubQuMCUY1gqtdCokLdrcBqgXlH8hkg82qqeAAR7G44fdUfjJFcY/lPfcEhvHttiFwY4Q14izhE1amNkiNXO/SbATprMZq1yNM/2oCsEH62wPe9ClKWhz9zcdemfv204HeA3Ypn0r6XeEBpsjeGavwr0fZ0QN0HzcMGlZ5G7vj7Lh77mcvHydfOj6RCq4A2MFWBhjNaaSCQyPL38UGqJZnFhzoTgf6I5UbSVMK0rCchlaUDd9kDI+8GwBIfpFXLsVg1M9kV9eW8NZZ0Uhi9YDgPerTyYOguRuHp7pmemRQ/lXkqNh3WwnPdnkb9xreJJ6Lttqb06B80KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=029QuZdo9+2wuHXmdlY9dpD9TMu6h/RXod+Koc+16VE=;
 b=8TeV4jnRNyjsDPfuzyePpq0a8E0gwykK0A5JuJprVEFY5qSwXw1l93+nn7oH5F2LIMPwWVZhqUgYKwW1ZO53BDcEVk/cberDxZfmlInVYQR8SqA7JcXd134wvi7Nknu5nPlTASOWxN8bnVUDlAQ9XYcJYUWMkd77qkVkRaJ0h7U=
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB2800.eurprd08.prod.outlook.com (10.170.236.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 09:29:20 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:29:20 +0000
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
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIAgAEg7ACAAcNIAA==
Date:   Fri, 2 Aug 2019 09:29:20 +0000
Message-ID: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190801063351.GB17887@lowry.li@arm.com>
In-Reply-To: <20190801063351.GB17887@lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcc2e860-33b3-4fd5-21ca-08d7172be5e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR08MB2800;
x-ms-traffictypediagnostic: VI1PR08MB2800:
x-microsoft-antispam-prvs: <VI1PR08MB2800A64803969E084E61472BF0D90@VI1PR08MB2800.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(99286004)(2906002)(6506007)(102836004)(478600001)(6636002)(6436002)(25786009)(52116002)(256004)(6486002)(386003)(316002)(66556008)(66446008)(64756008)(6116002)(76176011)(3846002)(54906003)(66946007)(5660300002)(58126008)(66476007)(71200400001)(26005)(186003)(4326008)(71190400001)(8676002)(14454004)(6862004)(86362001)(68736007)(1076003)(229853002)(81156014)(6246003)(81166006)(486006)(66066001)(11346002)(446003)(44832011)(9686003)(7416002)(7736002)(6512007)(53936002)(305945005)(476003)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2800;H:VI1PR08MB3696.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NPgHMYoiFzRFBVrqIqEu7uL4YaYbPsKkejqFSFA1SauGUuvIMSdOKYE04OiBkB0KChC4wsPE+J8vWj4KMTrTMPAIbm9EGv7nIK9Xelsqqn7bYmOjdJAWUKD0cRfVlcl7IwmSNbtTlPKRtNZxoUQXyPOLnl1+Ibh0mpWL5nsHYufixEPcytuzeLVpC+Wcbr3oeuO4PAcmYfs7V/ttNEDwHhFu6EUBueCdw4+Q1XXrfsnIz/GNxbSfTSy5wYMNHIPEiVluR45NQcs40UbohqIfZ6CvDXDez6obrxK6ixwtAF5ugP8SYVNJeqsGMbVoT1MqdUxgMprUXzCJIvrD4dP4B1k6RW4nOfzQ2vTTJXMqK54sXiLGG544mAPs5q8sA1p0HMU0hNuz3opA5CcEXgRfTqnHUq//+kuDsRpdcO6qEWA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8157115E9F5EA4BB665A922E9F1FA7E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc2e860-33b3-4fd5-21ca-08d7172be5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 09:29:20.7196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2800
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lowry,

On Thu, Aug 01, 2019 at 06:34:08AM +0000, Lowry Li (Arm Technology China) w=
rote:
> Hi Brian,
>=20
> On Wed, Jul 31, 2019 at 09:20:04PM +0800, Brian Starkey wrote:
> > Hi Lowry,
> >=20
> > Thanks for this cleanup.
> >=20
> > On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology Chin=
a) wrote:
> > > During it signals the completion of a writeback job, after releasing
> > > the out_fence, we'd clear the pointer.
> > >=20
> > > Check if fence left over in drm_writeback_cleanup_job(), release it.
> > >=20
> > > Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
> > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_wr=
iteback.c
> > > index ff138b6..43d9e3b 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeba=
ck_job *job)
> > >  	if (job->fb)
> > >  		drm_framebuffer_put(job->fb);
> > > =20
> > > +	if (job->out_fence)
> >=20
> > I'm thinking it might be a good idea to signal the fence with an error
> > here, if it's not already signaled. Otherwise, if there's someone
> > waiting (which there shouldn't be), they're going to be waiting a very
> > long time :-)
> >=20
> > Thanks,
> > -Brian
> >=20
> Here it happened at atomic_check failed and test only commit. For both
> cases, the commit has been dropped and it's only a clean up. So here bett=
er
> not be treated as an error case:)

If anyone else has a reference on the fence, then IMO it absolutely is
an error to reach this point without the fence being signaled -
because it means that the fence will never be signaled.

I don't think the API gives you a way to check if this is the last
reference, so it's safest to just make sure the fence is signalled
before dropping the reference.

It just feels wrong to me to have the possibility of a dangling fence
which is never going to get signalled; and it's an easy defensive step
to make sure it can never happen.

I know it _shouldn't_ happen, but we often put in handling for cases
which shouldn't happen, because they frequently do happen :-)

>=20
> Since for userspace, it should have been failed or a test only case, so
> writebace fence should not be signaled.

It's not only userspace that can wait on fences (and in fact this
fence will never even reach userspace if the commit fails), the driver
may have taken a copy to use for "something".

Cheers,
-Brian

>=20
> Best regards,
> Lowry
> > > +		dma_fence_put(job->out_fence);
> > > +
> > >  	kfree(job);
> > >  }
>=20
> --=20
> Regards,
> Lowry
