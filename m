Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0A47F4BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 12:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389242AbfHBKJy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 06:09:54 -0400
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:65017
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728855AbfHBKJy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 06:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=dR4rMXHIzBUJCuM7lObIE/MNMCV5S1PDLkl29dF+/tB/7vKC5xW7BYVI6MlTPFCoJcPM456/SKIt1NEWuSg0xoHAW8AW1G1XDzCerTqy3P++k+Q2PQjTxE5zkzLgw4bl9geMTf9oExm+i0xUhSntmx+Lp//91XZKRaRzG5jQBNI=
Received: from AM4PR08CA0073.eurprd08.prod.outlook.com (2603:10a6:205:2::44)
 by AM5PR0802MB2594.eurprd08.prod.outlook.com (2603:10a6:203:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 2 Aug
 2019 10:09:47 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by AM4PR08CA0073.outlook.office365.com
 (2603:10a6:205:2::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.15 via Frontend
 Transport; Fri, 2 Aug 2019 10:09:47 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 10:09:46 +0000
Received: ("Tessian outbound 6d016ca6b65d:v26"); Fri, 02 Aug 2019 10:09:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e6416691434723b
X-CR-MTA-TID: 64aa7808
Received: from 804603496778.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.2.53])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0483FA3E-A63E-48E7-92A4-124BA5A31D6E.1;
        Fri, 02 Aug 2019 10:09:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 804603496778.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Aug 2019 10:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jalIwTcSv3c0mxeks8Wg80abLv8CRDSLltCiU0iEIyotcHHZlzn7H8RB0A9Y/VPNjptV/WY8Wbt/A0beFsf4sedKRq5/fXWtf/nCkMjhcOKdj0LIyZZkVvk7jjNVi3NGW4YtZYZupIWymLsGdKR2YEDLXiiGmEkFqxMbHe2WLqTNN66O5fkExS/GfdcXIzl+gd1T9XKvQcCVXtt1dhAyeIAT7A/bUyUU84RJA6WlarwF/0GmxT03tygcbUuTK7rTkuPNTl3+N9rZb2/SdQWzN8vdASplMDxMfC/CM2FN0+sTr4cRJ3z46h0lRWb4fNyTEb951ihIXx5+c37AGBjSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=SFGRC/HfEx3n2zhVz2ZAec37ghxwAaLF43ZX8qRfnJtbsRq6ZrkX5zLmrMOLVoPmArKhkFy5iUbfNRQD681zq9hWH2oHd1h4zCGnT2alogmeNUFV13riBEo9zaqa5nl9STKF5iawPOXnRyKs+RuJjguSdavr7usPQUep5orn6GzjmDxMoQm3kfEvfYEbv5uWvx8Gl+h7+QRTXgD6icaNh3tI+1bBk4ZsUWs2rckae8zAuKXc8ROxGQfZxUF0iPJQ9mrzihISleu+JSlpciMpx5h0MSiTprsguJrXi/6nXn/uhjvYiVP3cAVnIgu2RThqi+6Gom8M+KJtbuH6VpV2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=dR4rMXHIzBUJCuM7lObIE/MNMCV5S1PDLkl29dF+/tB/7vKC5xW7BYVI6MlTPFCoJcPM456/SKIt1NEWuSg0xoHAW8AW1G1XDzCerTqy3P++k+Q2PQjTxE5zkzLgw4bl9geMTf9oExm+i0xUhSntmx+Lp//91XZKRaRzG5jQBNI=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4800.eurprd08.prod.outlook.com (10.255.114.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 10:09:27 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 10:09:27 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     Brian Starkey <Brian.Starkey@arm.com>
CC:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
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
Thread-Index: AQHVR4/K4z4SAitqoEqzGGms5irnZ6bktjQAgAEg6gCAAcNIAIAACyyA
Date:   Fri, 2 Aug 2019 10:09:26 +0000
Message-ID: <20190802100919.GA26225@jamwan02-TSP300>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190801063351.GB17887@lowry.li@arm.com>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c3304e3a-0300-4681-d205-08d717318bf5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4800;
X-MS-TrafficTypeDiagnostic: VE1PR08MB4800:|AM5PR0802MB2594:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2594224CE092B043EF6C4438B3D90@AM5PR0802MB2594.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(58126008)(68736007)(1076003)(53936002)(76176011)(6246003)(14454004)(6116002)(3846002)(2906002)(4326008)(86362001)(71190400001)(71200400001)(6862004)(5660300002)(7416002)(66476007)(64756008)(256004)(486006)(9686003)(6512007)(186003)(66556008)(52116002)(478600001)(66446008)(66946007)(8676002)(81166006)(81156014)(99286004)(33656002)(6636002)(8936002)(305945005)(6506007)(386003)(6436002)(33716001)(55236004)(6486002)(26005)(11346002)(7736002)(54906003)(446003)(229853002)(102836004)(25786009)(316002)(476003)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4800;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: O+b1mwjUKDIzHejqGWJdW8KldKFEJrIpB/8BmoZ5bOSp8o0nCx7PRcEDVmO32QXkKXwggJLbuamv9puo+4RaWdXMK7E56M2nM+DKdhmPRvJ/0j/zoXRwlXzsdqI4RG/3OdZST859nQWe2MTa/DoE0LA1zb0Uz8z/KL0NSy3j3XdMbq9R0pVfkPpAo+OhA2ZXoQ2fCpF/e14iKUjv2zayhPT9MDmId5NftaM0wHSvcuJtCayKRcWRRMuNq0FEQTik3tIJDukXBBR9vmtNgqdUBRibm1mbtqKL//0ww6SF8lymcQzuZyYrhf3DLvfbZhhL/7c8nkXlGED94izLaJ6e+dWj1+mANh6QtUwJNkT221SF6Me1DbwiU1MCysUqQEJCNO+Sj4hD8RzR5KzEN5bMLFnc9/ZBjqnQDvySpTxYwRU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABE785F5D86ED140AD93C732BBEBA4F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(7916004)(1496009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(189003)(199004)(97756001)(36906005)(229853002)(46406003)(8936002)(8746002)(33656002)(356004)(6246003)(76176011)(81166006)(81156014)(58126008)(8676002)(22756006)(6862004)(99286004)(6486002)(478600001)(7736002)(4326008)(25786009)(9686003)(50466002)(54906003)(6512007)(26826003)(305945005)(33716001)(186003)(70586007)(6636002)(70206006)(1076003)(26005)(450100002)(76130400001)(14454004)(102836004)(86362001)(2906002)(316002)(486006)(336012)(6506007)(3846002)(476003)(11346002)(23726003)(446003)(63350400001)(63370400001)(66066001)(6116002)(5660300002)(126002)(386003)(47776003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR0802MB2594;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3589f375-24cf-4038-0409-08d717318022
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM5PR0802MB2594;
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: CzZE2uSvXJvFqh5GYCBWimwNhkIssD3V0rTxOvN8YblNBWlCtpEBjQWMwF7BGwdIi9zllG8b7p8eqla8cPytJZ3DFq2XnnNzXGmxrd4oUYFkPkNZZLT/yFGVL0yKWwSuMad2Bfz4ulFirRKQT6gtfuHeKSezWsPKu01U6FuTPhQBFKncSYhMUigiC9NGdLf5MoEh7Yi5fajDhfDAhv+saI2nl0ll3hC99UqY0m17PPxpWe+WVDislYrwsA8k4eqaBMCGTF9OCZnAZN1vZOETV6aY3tAX3Tmje0mlniLte/o7fdjHwAgBEaG/4HKAHwo4yweUS0sL7AWPuhXQqHG+4lxylW/pp4XLULscTC3iDmgupStvL7GF+gkO+0Ca7AaoLO/iz+wfMhQxSKYdunU8lvv3fO5/afB59iSAc3j1QF0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 10:09:46.4043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3304e3a-0300-4681-d205-08d717318bf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2594
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 02, 2019 at 05:29:20PM +0800, Brian Starkey wrote:
> Hi Lowry,
>=20
> On Thu, Aug 01, 2019 at 06:34:08AM +0000, Lowry Li (Arm Technology China)=
 wrote:
> > Hi Brian,
> >=20
> > On Wed, Jul 31, 2019 at 09:20:04PM +0800, Brian Starkey wrote:
> > > Hi Lowry,
> > >=20
> > > Thanks for this cleanup.
> > >=20
> > > On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology Ch=
ina) wrote:
> > > > During it signals the completion of a writeback job, after releasin=
g
> > > > the out_fence, we'd clear the pointer.
> > > >=20
> > > > Check if fence left over in drm_writeback_cleanup_job(), release it=
.
> > > >=20
> > > > Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
> > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_=
writeback.c
> > > > index ff138b6..43d9e3b 100644
> > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_write=
back_job *job)
> > > >  	if (job->fb)
> > > >  		drm_framebuffer_put(job->fb);
> > > > =20
> > > > +	if (job->out_fence)
> > >=20
> > > I'm thinking it might be a good idea to signal the fence with an erro=
r
> > > here, if it's not already signaled. Otherwise, if there's someone
> > > waiting (which there shouldn't be), they're going to be waiting a ver=
y
> > > long time :-)
> > >=20
> > > Thanks,
> > > -Brian
> > >=20
> > Here it happened at atomic_check failed and test only commit. For both
> > cases, the commit has been dropped and it's only a clean up. So here be=
tter
> > not be treated as an error case:)
>=20
> If anyone else has a reference on the fence, then IMO it absolutely is
> an error to reach this point without the fence being signaled -
> because it means that the fence will never be signaled.
>=20
> I don't think the API gives you a way to check if this is the last
> reference, so it's safest to just make sure the fence is signalled
> before dropping the reference.
>=20
> It just feels wrong to me to have the possibility of a dangling fence
> which is never going to get signalled; and it's an easy defensive step
> to make sure it can never happen.
>=20
> I know it _shouldn't_ happen, but we often put in handling for cases
> which shouldn't happen, because they frequently do happen :-)
>=20
> >=20
> > Since for userspace, it should have been failed or a test only case, so
> > writebace fence should not be signaled.
>=20
> It's not only userspace that can wait on fences (and in fact this
> fence will never even reach userspace if the commit fails), the driver
> may have taken a copy to use for "something".
>

Maybe we can add a wb_fence canceling into complete_signaling() for the
atomic_check failed cleanup like the crtc->out_fence.

Then if in this place we still can got a fence here, that must be a
error we signal and WARN it

Thanks
James

> Cheers,
> -Brian
>=20
> >=20
> > Best regards,
> > Lowry
> > > > +		dma_fence_put(job->out_fence);
> > > > +
> > > >  	kfree(job);
> > > >  }
> >=20
> > --=20
> > Regards
> > Lowry
