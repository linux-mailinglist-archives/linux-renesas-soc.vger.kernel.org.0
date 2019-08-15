Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22E4C8EEF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 17:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731371AbfHOPBt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 11:01:49 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:17984
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727160AbfHOPBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 11:01:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC/N8NW69QVyJ5oChT4ro3Dxuh8uy0Ir6H6zc5jSm8ij+RWA2YmL7OaufQMXl9XTEX5+9liCkuU1p3BfYL2aQIte7++NRZGLhyerMJuYz9uCVWE046GQR88Gw7d68Fr+zjbhRb7RC1UJ77jWx3O6iMH/pyvzrZGb0HYcGH2AbfmqONKLlq2MI5zJSRsD++p4e7YVeewNgr13ft3h499kCmZbBAYUU8U8if6CQZjb4VdMLpVsE3gT7Qq/NlVrNHnk9AVb3Bg7e2g9yVrDcFFu/ADngPA3/uxafbpse5Vf3cwmwGnuNsbTAQfnr6kI0YsU1Gfq9iTIlwja5gfvqgNDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXGUA2JogWOLFE2PJ6GSAFG+qu+o5RBJL7qBImXb0zo=;
 b=h7lBzMO/P7ByP8XiOLcGuUWSmQQ6RO0Q0N7fkiau/9xzr4Fv743b/zIgxpj7BjLIaiGpcPWIMSIE0e9tyJE34lm/MKEO121ss1qNRFPXKggWl87sB3WukorkuV0fh5EYPn5IC4/QsvjKIYBMkUsJ/MWVkqHHT5nc4s/TDladqfy/PfYI/wQBEw2rgZLLhF1Cx53lyyudZWcPYc+QHsGALsH4kmtz4vHNOWxK72hSEH9GOcbPeTeq6Xg27mNgdqqFavo6vC5sM4XoDZU/AroyNZTYn4PpIOx0S+5I5myHHjJGByeoj6zw8Eqjzu8slZjE3t4KkYGU6RscV0IKZoovyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXGUA2JogWOLFE2PJ6GSAFG+qu+o5RBJL7qBImXb0zo=;
 b=IIaJ0nIrn78qV0Xn1IDqLuQ7kGo459yQWFiObBK7GbtsC4m2KLsq/JXGdGHi/GYYuBoEMPKUMOd99gnMiZc+tPlUcraF1v4ByAPBnOKWQpUI23uZKPQWizCEXf6R8JJNOUBR3WWkX6F2Ir21Uc26XYqkXhG69X04l4K9MDx/1Ec=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 15:01:44 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 15:01:44 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: RE: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Topic: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Index: AQHVU1lM9+L2miT/i0amqdy98WNy2qb8MTMAgAAMrQCAAAL7AIAAASrAgAAJiwCAAACe0A==
Date:   Thu, 15 Aug 2019 15:01:43 +0000
Message-ID: <TY1PR01MB177014EDD97819824C163F36C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190815145300.GA15016@kroah.com>
In-Reply-To: <20190815145300.GA15016@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eff8ff50-8c27-468a-5848-08d721917ca2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1596;
x-ms-traffictypediagnostic: TY1PR01MB1596:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB159675706F14FA3EE0B51594C0AC0@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(81166006)(76116006)(64756008)(476003)(66476007)(55016002)(66556008)(11346002)(81156014)(186003)(446003)(66946007)(6916009)(52536014)(26005)(5660300002)(86362001)(4326008)(53936002)(102836004)(9686003)(6306002)(486006)(8936002)(66446008)(74316002)(6246003)(53546011)(478600001)(66066001)(316002)(6506007)(25786009)(8676002)(7696005)(305945005)(99286004)(3846002)(44832011)(2906002)(54906003)(256004)(6436002)(229853002)(7416002)(7736002)(14444005)(6116002)(14454004)(71190400001)(76176011)(71200400001)(966005)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1596;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KiRZHup8bNKAh15iWEo3E/ljcaWcYWV26thAD7UdICWC4W6x2hh32UZSYfplGscYOUQ2Cp/sT52MPoXbMqGl9TXbl19aeC93oelxh3goV2OhK1rRw1mRjDUn3gEFMIuY9+0fQtiZnh51i1j2V6AGrcM63+ETidVxnIg+ntHDuYwVpXpzPtFRZsZL+CbEZ8PbmdszUgPUzkRVkm8geNiGD+a6hbbODDshWef5rMhDl8xfn0GkkvTlUzBYVNbVg/3MGEOpQsZcsOMeDUKDGl+SvVlSOWYwHyGGcoqnqcc2VCdf0P/BUHwtR4VyqsFwxZlTpVmh+5i7TFKasJLs83jGH8iPTdFgeMEva37aL6HcF7+5GkxpSRuLBs7iuG+QZFX8e6vGP1eh6q7RdCGPwBZja2/VPzC94YmKCtk8XkxCwlM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff8ff50-8c27-468a-5848-08d721917ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 15:01:43.8135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rx5IOwulmj/jTaxkShwIhWzGkx9xLBsz9T2m/VxjJBM2xrnzxNp9f2kkGfNro0dhKUXNP82QGQV3sVxrMtX4oRFcmNtez4a0h0b5H6W8f3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg, hi Laurent,

Thank you for your feedback!

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: 15 August 2019 15:53
> Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
>=20
> On Thu, Aug 15, 2019 at 02:31:26PM +0000, Fabrizio Castro wrote:
> > Hi Greg, hi Laurent,
> >
> > Thank you for your feedback!
> >
> > > From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.ker=
nel.org> On Behalf Of Laurent Pinchart
> > > Sent: 15 August 2019 15:15
> > > Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_tim=
ings
> > >
> > > Hi Greg,
> > >
> > > On Thu, Aug 15, 2019 at 04:04:00PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrote:
> > > > > Hi Fabrizio,
> > > > >
> > > > > (CC'ing Greg as the architect of the SPDX move)
> > > >
> > > > _one of_, not the one that did the most of he work, that would be T=
homas :)
> > > >
> > > > > On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> > > > > > The information represented by drm_bridge_timings is also
> > > > > > needed by panels, therefore rename drm_bridge_timings to
> > > > > > drm_timings.
> > > > > >
> > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.=
html
> > > > > >
> > > > > > ---
> > > > > > v1->v2:
> > > > > > * new patch
> > > > > >
> > > > > > I have copied the license from include/drm/drm_bridge.h as that=
's
> > > > > > where the struct originally came from. What's the right SPDX li=
cense
> > > > > > to use in this case?
> > > > >
> > > > > https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Publ=
ic_Domain_within_SPDX_Files
> > > > >
> > > > > Greg, any idea on how we should handle this ?
> > > >
> > > > Ugh, what lunacy.  But drm_bridge.h is NOT under any "public domain=
"
> > > > license, so why is that an issue here?  This looks like a "normal" =
bsd 3
> > > > clause license to me, right?
> > >
> > > You're right, I overread part of the text in drm_bridge.h, it seems t=
o
> > > indeed be covered by a BSD 3 clause license. Sorry for the noise.
> >
> > Mmm... This is the template for the BSD-3-Clause:
> >
> > Copyright (c) <YEAR>, <OWNER>
> > All rights reserved.
> >
> > Redistribution and use in source and binary forms, with or without modi=
fication, are permitted provided that the following
> conditions are met:
> >
> > Redistributions of source code must retain the above copyright notice, =
this list of conditions and the following disclaimer.
> > Redistributions in binary form must reproduce the above copyright notic=
e, this list of conditions and the following disclaimer in the
> documentation and/or other materials provided with the distribution.
> > Neither the name of the <ORGANIZATION> nor the names of its contributor=
s may be used to endorse or promote products derived
> from this software without specific prior written permission.
> > THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS=
 IS" AND ANY EXPRESS OR IMPLIED
> WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERC=
HANTABILITY AND FITNESS FOR A PARTICULAR
> PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIB=
UTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT =
NOT LIMITED TO, PROCUREMENT OF
> SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS =
INTERRUPTION) HOWEVER CAUSED AND ON ANY
> THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCL=
UDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
> WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F SUCH DAMAGE.
> >
> > And this is the license coming from include/drm/drm_bridge.h:
> >
> > /*
> >  * Copyright (c) 2016 Intel Corporation
> >  *
> >  * Permission to use, copy, modify, distribute, and sell this software =
and its
> >  * documentation for any purpose is hereby granted without fee, provide=
d that
> >  * the above copyright notice appear in all copies and that both that c=
opyright
> >  * notice and this permission notice appear in supporting documentation=
, and
> >  * that the name of the copyright holders not be used in advertising or
> >  * publicity pertaining to distribution of the software without specifi=
c,
> >  * written prior permission.  The copyright holders make no representat=
ions
> >  * about the suitability of this software for any purpose.  It is provi=
ded "as
> >  * is" without express or implied warranty.
> >  *
> >  * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SO=
FTWARE,
> >  * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN =
NO
> >  * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIREC=
T OR
> >  * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS =
OF USE,
> >  * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTH=
ER
> >  * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE
> >  * OF THIS SOFTWARE.
> >  */
> >
> > Perhaps I am completely wrong here, and I am not a lawyer, but the word=
ing seems different enough to me...
> > I am happy to use "BSD-3-Clause" though. Laurent please double check.
>=20
> Please talk to your lawyers about this, we are not them...

I am really sorry for the trouble (and the waste of time)!

I'll try and use "BSD-3-Clause" for the next version and I'll see what happ=
ens.

Thanks,
Fab

>=20
> thanks,
>=20
> greg k-h
