Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C3C8FD50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 10:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfHPILa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 04:11:30 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:22016
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726482AbfHPILa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 04:11:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DECPryo+Fb8+SXlBY8D8DcsI528bFmRB329cNJF3cthpJt2UTH48bQQmFxuiE2/QmdQx6AGSlsjHNTsJdJZqdo7PFnG9RLx5Z2bB2b/irFFS3BzAudK3AzgVEXfycJbW6XMHC53DI77VQOJJuyWCtZZZBDxDBwoPVHjdZQCByyM4sFcRB9Co6C8yRbervPbGFxUjb9yhdF1RQ5PayfmGOAoHE5DQQY/oxHDm91SLQNjAHMYbZ0OWyZ6u0ygX8FtPuBeXgm+DONItka1Gg3m3ETDOmXWKAWx2mdwTxsbAiz3RWT7rOFTANu0n2DPa3dOWs/cHvNTcfjXOO5Q6u/+wQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVCQgd/O+r6bO1RV2qsLx1yZnDhXj51rF1NMLFuKa1U=;
 b=SV7R5eryienWpvicH+53X3/DK7MxW8qMDyWaWKhDNLP1U3S6pd7t2q2QKhfP6BQBioAMOlLiXpW0+DjXG9Sz6fZqa17Dx4V/i4+rBNJIojMxa3CLFkDkPnfFZAhzeUCLw7neBG5UVgwkq1huAptQA7Z0qBPmEn1055LPAzrzWGBYPuPNEu8ZP8/FWIbg1uPpLHG0i3SAqpfDQrjY5TAGnom3+GvqIUXLTCJcGfDWjGapyB+NzFi+H/MUxNzyuw59N/tlVToofDauOVgQ1BpIqofvrZqllxBnpyY/Is1OTcCTutLsauYJmTjNRrvR+K6Nb+9KgLzRvZnI4nJy49C5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVCQgd/O+r6bO1RV2qsLx1yZnDhXj51rF1NMLFuKa1U=;
 b=P3B4zYorC5hCW/bQUlg3IJHAx+1eVDcirv8XY/oXTSkSB9CRtLEz0gADOc3JZEP3PPDVcHRULOEmz9mC5CxZl0qQPqtWTYCHtb3y8muId+46dkBPLIc4VSVA5zfUJJDKRRPwptcphdqRZFSm1dJo82E9sID3KLAlbLVXeBqqMiE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1498.jpnprd01.prod.outlook.com (52.133.161.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 08:11:25 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 08:11:25 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Andrzej Hajda <a.hajda@samsung.com>,
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
Thread-Index: AQHVU1lM9+L2miT/i0amqdy98WNy2qb8MTMAgAAMrQCAAAL7AIAAASrAgAAJiwCAADYegIAAEGwAgADa8KA=
Date:   Fri, 16 Aug 2019 08:11:25 +0000
Message-ID: <TY1PR01MB17708449AC5C85C2A1FA6BC8C0AF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190815145300.GA15016@kroah.com>
 <20190815180641.GY5011@pendragon.ideasonboard.com>
 <20190815190528.GA14835@kroah.com>
In-Reply-To: <20190815190528.GA14835@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37c7617c-4dd7-401f-aea8-08d722215547
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1498;
x-ms-traffictypediagnostic: TY1PR01MB1498:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB14988DD75324CB1A6C63E59CC0AF0@TY1PR01MB1498.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(305945005)(478600001)(6306002)(102836004)(229853002)(6436002)(66066001)(7416002)(52536014)(9686003)(8936002)(55016002)(7736002)(33656002)(66446008)(76116006)(66476007)(5660300002)(64756008)(74316002)(66946007)(53546011)(71190400001)(44832011)(446003)(966005)(186003)(86362001)(81156014)(8676002)(66556008)(110136005)(14454004)(11346002)(486006)(7696005)(81166006)(26005)(6506007)(53936002)(476003)(3846002)(6116002)(71200400001)(316002)(6246003)(25786009)(76176011)(256004)(2906002)(54906003)(14444005)(4326008)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1498;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HXtxxZRtAvC0ezMJSKoDSX+KpGQxUPrW3OzQYajkhMpvDJKL/MI3X2Drkb2hAjidZZ0hQ0QGfSiyL7oSv7CVFCF30sqssR+4PZMzKPSPx+41seNizqBLvUmGXGCQRswRzFyZUnNKxH8JeGmmOVfEE+WaYbi27lMFTbYeHGEt3UNMndX1SWp2FG54kskIRbPyJWBS7oPmeKLi35gobYwl8TqWWoSwkgI0QTebzb2u9+hrpKa1PFPT8TVkSFUrc0DPnRplJ2hFVF+eqEBWFCquwMEkDh530FzogtCFDYwaQ/jnFlD0/u3WZA7Bj54/INdG06uum3AVWuwmNTqN45Ze8+h4mskRQSVIZa4No6dJxfhvrhj91cLQKG8lKj09f1TsiGXkUvYf+Ur9g+9oe++eV8uPnRCuBqimbD6nEmRg+LY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c7617c-4dd7-401f-aea8-08d722215547
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 08:11:25.4052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv38HUze45J7jfrtu9JssC+LRIpWLLqOPuxy/fTrymCTrmXhKI4bCzz8s/EEwPDzKwnz6gYf8Q+xfRpEYpwhnDE9Jk5sIq2SzQIn4EP3OQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1498
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg, hi Laurent,

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: 15 August 2019 20:05
> Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
>=20
> On Thu, Aug 15, 2019 at 09:06:41PM +0300, Laurent Pinchart wrote:
> > Hi Greg,
> >
> > On Thu, Aug 15, 2019 at 04:53:00PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Aug 15, 2019 at 02:31:26PM +0000, Fabrizio Castro wrote:
> > > > On 15 August 2019 15:15, Laurent Pinchart wrote:
> > > > > On Thu, Aug 15, 2019 at 04:04:00PM +0200, Greg Kroah-Hartman wrot=
e:
> > > > > > On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > Hi Fabrizio,
> > > > > > >
> > > > > > > (CC'ing Greg as the architect of the SPDX move)
> > > > > >
> > > > > > _one of_, not the one that did the most of he work, that would =
be Thomas :)
> > > > > >
> > > > > > > On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wro=
te:
> > > > > > > > The information represented by drm_bridge_timings is also
> > > > > > > > needed by panels, therefore rename drm_bridge_timings to
> > > > > > > > drm_timings.
> > > > > > > >
> > > > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.=
com>
> > > > > > > > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43=
271.html
> > > > > > > >
> > > > > > > > ---
> > > > > > > > v1->v2:
> > > > > > > > * new patch
> > > > > > > >
> > > > > > > > I have copied the license from include/drm/drm_bridge.h as =
that's
> > > > > > > > where the struct originally came from. What's the right SPD=
X license
> > > > > > > > to use in this case?
> > > > > > >
> > > > > > > https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_=
Public_Domain_within_SPDX_Files
> > > > > > >
> > > > > > > Greg, any idea on how we should handle this ?
> > > > > >
> > > > > > Ugh, what lunacy.  But drm_bridge.h is NOT under any "public do=
main"
> > > > > > license, so why is that an issue here?  This looks like a "norm=
al" bsd 3
> > > > > > clause license to me, right?
> > > > >
> > > > > You're right, I overread part of the text in drm_bridge.h, it see=
ms to
> > > > > indeed be covered by a BSD 3 clause license. Sorry for the noise.
> > > >
> > > > Mmm... This is the template for the BSD-3-Clause:
> > > >
> > > > Copyright (c) <YEAR>, <OWNER>
> > > > All rights reserved.
> > > >
> > > > Redistribution and use in source and binary forms, with or without =
modification, are permitted provided that the following
> conditions are met:
> > > >
> > > > Redistributions of source code must retain the above copyright noti=
ce, this list of conditions and the following disclaimer.
> > > > Redistributions in binary form must reproduce the above copyright n=
otice, this list of conditions and the following disclaimer in
> the documentation and/or other materials provided with the distribution.
> > > > Neither the name of the <ORGANIZATION> nor the names of its contrib=
utors may be used to endorse or promote products
> derived from this software without specific prior written permission.
> > > > THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS=
 "AS IS" AND ANY EXPRESS OR IMPLIED
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
> > > >
> > > > And this is the license coming from include/drm/drm_bridge.h:
> > > >
> > > > /*
> > > >  * Copyright (c) 2016 Intel Corporation
> > > >  *
> > > >  * Permission to use, copy, modify, distribute, and sell this softw=
are and its
> > > >  * documentation for any purpose is hereby granted without fee, pro=
vided that
> > > >  * the above copyright notice appear in all copies and that both th=
at copyright
> > > >  * notice and this permission notice appear in supporting documenta=
tion, and
> > > >  * that the name of the copyright holders not be used in advertisin=
g or
> > > >  * publicity pertaining to distribution of the software without spe=
cific,
> > > >  * written prior permission.  The copyright holders make no represe=
ntations
> > > >  * about the suitability of this software for any purpose.  It is p=
rovided "as
> > > >  * is" without express or implied warranty.
> > > >  *
> > > >  * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THI=
S SOFTWARE,
> > > >  * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS,=
 IN NO
> > > >  * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, IND=
IRECT OR
> > > >  * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM L=
OSS OF USE,
> > > >  * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR=
 OTHER
> > > >  * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR=
 PERFORMANCE
> > > >  * OF THIS SOFTWARE.
> > > >  */
> > > >
> > > > Perhaps I am completely wrong here, and I am not a lawyer, but the =
wording seems different enough to me...
> > > > I am happy to use "BSD-3-Clause" though. Laurent please double chec=
k.
> > >
> > > Please talk to your lawyers about this, we are not them...
> >
> > I don't think that's fair though. Fabrizio is reworking kernel code, an=
d
> > as part of that wondered what SPDX tag to apply to a new file that
> > contains code moved from an existing file that has no SPDX tag, but the
> > above copyright notice. He's not trying to change a license, or reword
> > it. As SPDX is the preferred way of expressing licenses in the kernel,
> > he legitimately asked for help, and I think we should provide an
> > official answer for this (which could be not to use SPDX but copy the
> > license text).
>=20
> Ah, ok, that makes more sense, didn't realize that.
>=20
> Fabrizio, just copy the license text as-is to the new file if you are
> copying from an existing one.  For all of these "we have to read the
> text" files that are left in the kernel, we still have a ways to go to
> convert them.  But, if you leave the text identical, when we match one
> and fix it, the tools will catch the other identical ones as well, so
> that does not create any extra work.
>=20
> hope this helps,

It does! Thank you both guys!

Cheers,
Fab

>=20
> greg k-h
