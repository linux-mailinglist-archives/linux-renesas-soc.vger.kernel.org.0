Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881437F4BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 12:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390043AbfHBKJL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 06:09:11 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:27045
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389779AbfHBKJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 06:09:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0YlbT18IbJp2nkACM2Jxb/qlalw0tB615VmdvqkybhJ196efr4h4cYhY/iY3mlnIx/8+x+zkTn+zuWMNfmE8jAjKmo9Q7/sBwytKsW8VhrGfy/IjdXDhwnFWh9W1miTOQdnBGOhm0wJiCles9A12L9xBq0oRCLWErfhFJYJhgQ1vpdfIHHVivoItsG98Hf9/JdAK4A4pSjXlSuYOKMxN6gxQhTNzluiyxYXPOxblyVlAulcJGymzncxNmGKEN8m+8x50dwYYW665qqB3fbBpo3fCg5V7OoawUckh0rE33DJv0RzKJKHNZwcnzhA/pRZMdgNVrVTc/BAkRooLkYvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfKosLdMx5qpOHeIyZTSGcOGGMo+sglvrcTBxRRYjZw=;
 b=VKCR8Hw3U6GYXAkCGHbfeRIRx6aeMZol97XrCgW3k4hk+ww0hr6a8Y//bnIgsHFIpffgudwGfSU29xnLU2ojRYTD548MDE8i9ikv3HyUYc26f1MOJageRSt2pYa5on9UPZngoi0wYPAkqGBk3JeSJX8/GU9NlpGLGfBfPJ3FhzbYvQf7lhu5xUbZTwfF4U7ZkcNBNdBdfoZoJxR263x35S2DuN8BjlA5JRHuo9PpEnX0WQBH6WTBKyYuIiYQ8GK41hq/fZxwNSuCkLWKvegXTBeMsJofS3Aa4Is/BwgqlkyW/NiOarmw97uRHkdKvzkdVGfoLnEKqPTVCaI7Xe4nCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfKosLdMx5qpOHeIyZTSGcOGGMo+sglvrcTBxRRYjZw=;
 b=lIEOsrgEvcK8oUgtj+3JH1kQGiOH/jJXQi4MlKOf5LmUfcFp4s8Zx8dN7v4yws2CJeR5rVgXqCLpTdU1SkOro4AuMEtDFKf4VP3GbHguJ/wUJcIUKOZDbquH/a5FGo+v2lUmeFnMVrZ7uOBtHyS50wFWnquK7H/K8CDIK2ccdvI=
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB2686.eurprd08.prod.outlook.com (10.175.245.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 2 Aug 2019 10:09:05 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 10:09:05 +0000
From:   Brian Starkey <Brian.Starkey@arm.com>
To:     Daniel Vetter <daniel@ffwll.ch>
CC:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
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
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIAgAEg7ACAAcNIAIAABACAgAAAcICAAAaqAA==
Date:   Fri, 2 Aug 2019 10:09:05 +0000
Message-ID: <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
 <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
In-Reply-To: <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6da21692-af07-486a-4bad-08d717317321
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR08MB2686;
x-ms-traffictypediagnostic: VI1PR08MB2686:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR08MB26863001680C7DB582EEF61AF0D90@VI1PR08MB2686.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(6116002)(3846002)(99286004)(52116002)(2906002)(58126008)(54906003)(8936002)(9686003)(6512007)(76176011)(6306002)(5660300002)(81166006)(81156014)(6436002)(14454004)(6486002)(476003)(11346002)(446003)(386003)(6506007)(102836004)(53546011)(186003)(26005)(8676002)(486006)(25786009)(44832011)(6916009)(305945005)(7736002)(478600001)(68736007)(316002)(966005)(6246003)(229853002)(53936002)(7416002)(66066001)(4326008)(66556008)(66476007)(66446008)(64756008)(1076003)(86362001)(71200400001)(71190400001)(256004)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2686;H:VI1PR08MB3696.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sBXVTxvWron+tZFQAcT4526jwEA1q3vEdIXztGikzw8GxxtyTIM0j22+hTWPmW85IpA1AijIUxCP39FMHEX4nb/gd+PdIch4p4csfYONL2qHjAqd7uZ3H4oyjFbczw3lqzeDR0OMqLfLUufeW/0+xouBCm/nidUUVgfG4BX996AZof75BsdfEEfnacgtxulrzWVsK7n3z8a3reXZHpsHyscDrmy/yec1tRtrGLw07L5ZzW+1/gk3yV9NXcdHqfCBbCV7Ehk59EVbWZydJPet6Ji82JJZB84hHwd8J6DSmt/hnn+XuqWB3JkIp8VTpv2+wuN32k5CEMRsTcs9S9w1RFIZ+AC59MKkduIX/w6wdQKhCkQilY6DFKfokshclkskGRUhRa67E5wdluBU1/GeuWJEvqzf4XeLn7YzhSK+llo=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FD57427F759F04AB39001C9E7B0864E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da21692-af07-486a-4bad-08d717317321
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 10:09:05.0711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2686
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Fri, Aug 02, 2019 at 11:45:13AM +0200, Daniel Vetter wrote:
> On Fri, Aug 2, 2019 at 11:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Aug 2, 2019 at 11:29 AM Brian Starkey <Brian.Starkey@arm.com> w=
rote:
> > >
> > > Hi Lowry,
> > >
> > > On Thu, Aug 01, 2019 at 06:34:08AM +0000, Lowry Li (Arm Technology Ch=
ina) wrote:
> > > > Hi Brian,
> > > >
> > > > On Wed, Jul 31, 2019 at 09:20:04PM +0800, Brian Starkey wrote:
> > > > > Hi Lowry,
> > > > >
> > > > > Thanks for this cleanup.
> > > > >
> > > > > On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technolog=
y China) wrote:
> > > > > > During it signals the completion of a writeback job, after rele=
asing
> > > > > > the out_fence, we'd clear the pointer.
> > > > > >
> > > > > > Check if fence left over in drm_writeback_cleanup_job(), releas=
e it.
> > > > > >
> > > > > > Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.co=
m>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
> > > > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/=
drm_writeback.c
> > > > > > index ff138b6..43d9e3b 100644
> > > > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > > > @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_w=
riteback_job *job)
> > > > > >   if (job->fb)
> > > > > >           drm_framebuffer_put(job->fb);
> > > > > >
> > > > > > + if (job->out_fence)
> > > > >
> > > > > I'm thinking it might be a good idea to signal the fence with an =
error
> > > > > here, if it's not already signaled. Otherwise, if there's someone
> > > > > waiting (which there shouldn't be), they're going to be waiting a=
 very
> > > > > long time :-)
> > > > >
> > > > > Thanks,
> > > > > -Brian
> > > > >
> > > > Here it happened at atomic_check failed and test only commit. For b=
oth
> > > > cases, the commit has been dropped and it's only a clean up. So her=
e better
> > > > not be treated as an error case:)
> > >
> > > If anyone else has a reference on the fence, then IMO it absolutely i=
s
> > > an error to reach this point without the fence being signaled -
> > > because it means that the fence will never be signaled.
> > >
> > > I don't think the API gives you a way to check if this is the last
> > > reference, so it's safest to just make sure the fence is signalled
> > > before dropping the reference.
> > >
> > > It just feels wrong to me to have the possibility of a dangling fence
> > > which is never going to get signalled; and it's an easy defensive ste=
p
> > > to make sure it can never happen.
> > >
> > > I know it _shouldn't_ happen, but we often put in handling for cases
> > > which shouldn't happen, because they frequently do happen :-)
> >
> > We're not as paranoid with the vblank fences either, so not sure why
> > we need to be this paranoid with writeback fences. If your driver
> > grabs anything from the atomic state in ->atomic_check it's buggy
> > anyway.
> >
> > If you want to fix this properly I think we need to move the call to
> > prepare_signalling() in between atomic_check and atomic_commit. Then I
> > think it makes sense to also force-complete the fence on error ...

Well, fair enough. I'm struggling with "that's too paranoid" vs "fix
it properly" though? Is it a "problem" worth fixing or not?

It seems natural to me to do the fence cleanup in the cleanup function
for the object which owns the fence.

> >
> > > > Since for userspace, it should have been failed or a test only case=
, so
> > > > writebace fence should not be signaled.
> > >
> > > It's not only userspace that can wait on fences (and in fact this
> > > fence will never even reach userspace if the commit fails), the drive=
r
> > > may have taken a copy to use for "something".
>=20
> I forgot to add: you can check this by looking at the fence reference
> count. A WARN_ON if that's more than 1 on cleanup (but also for the
> out fences) could be a nice addition.

Do we really want to be looking at the fence internals directly like
that?

Cheers,
-Brian

> -Daniel
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
