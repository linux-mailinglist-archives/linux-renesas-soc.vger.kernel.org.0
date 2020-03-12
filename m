Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F85A18282D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 06:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbgCLFR0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 01:17:26 -0400
Received: from esa13.fujitsucc.c3s2.iphmx.com ([68.232.156.96]:31846 "EHLO
        esa13.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbgCLFR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 01:17:26 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Mar 2020 01:17:23 EDT
IronPort-SDR: Nxbn0XBEFsL2/Ls1Yba+N3rUTPCepqlVUQ7563MkwityXcYfm4lMOo/OVguwFtcPMduNTdquNv
 Ux4JkBMmrEb+KPkYbLps66Cha7pTUH1rze1gHI9OmEc7Zcr0FNp7WbEo/t2EE6chHWbiy6+TkJ
 +2NVsjMmXjllWcPTqX8WkjvqvXki7Fur/ucmZj6iW6Rk2B6SfNvfGRxTGXPRrG3dQ6Wq3rebyX
 UoZjCxWJ/ae72LXqMnPRSBA7MDoz5c1ps1I+MbpFSsrEg4djD/uTki2XdFgIJAhnVfE5AV6tfj
 SfY=
X-IronPort-AV: E=McAfee;i="6000,8403,9557"; a="11005805"
X-IronPort-AV: E=Sophos;i="5.70,543,1574089200"; 
   d="scan'208";a="11005805"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 14:10:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQo3W3O7nTlEJtncjZp87WY+tdNrWL1IdnZT0puYi1ZQvgs2/Q33pT3xVJGm/qgYqwwjyafpv/XdR2TZtTAgTZpjYmW6TKaZ3WroUG9kkPIbfUtlZ+7UsCkR5gMIfaUjzUq/xRvdpTMwrIk3BuHZ6ByKBYBUBPVB17tBhVr+hFLQE1W8UK5deyvOowjPAMYIe9egfqN9+QPt6T+3uZl+sqdh5+aeIbW4EJ5eCvRwdnyqEFN0eYdhOI5aNrTo4naUr7065pvPKF7dKG54F1kdsS2o2Xpmri+4WTJvF5Adxz2Gley8AfAKi2PASeFAeq8woCboOdUVcKxvfjSHQ2Lwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ/TB+2uyYBdznMjZR7uaTF+XF/nRvCaKau0aSxIlwk=;
 b=JtGfluzzyft32LysHoabYnCKjhz7mTeTFem6FZglcoMZhnkVrfSNT0MhwEjKYEmxv6rJVctswFQE3+ByFT+3EduOYQem7aD7Kj3Cp1IbzLIrm098/UCBRThGHeta9rbsqGfuJ0zioD0/G4yxFmpVCeV1+gqk9BuaNqv47gq/vM57ss7a/t2LLLtSAX6apl4l2OWK31YK9TAp0X9lNOb0DLo1/a/xwgemD//o2VXF/+qqu1uSDTG/n7bDc3VTCUZ9WaT/ELsrU9mqKARBIcMKdEp7uN20VCbtJqol9YPmhZG56+hMsd3IB0sudzOEa89OlZf5Yj0GRFLSdjC03AuUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ/TB+2uyYBdznMjZR7uaTF+XF/nRvCaKau0aSxIlwk=;
 b=dFRqJWqiHx0SCF2VUqyLpXBhYlf2xqZccforeKEv7myWQyaAmdh6QA3h0iibpHEhPga0bDjIADMpZrn1Yr1pLoHEj5Qj9XbZ0mhPTNoDmMuorLp+tF4/31mKt9OumtswKlqFLxGxn0FpcLzcBtPt7xrDqfeH8tP46rOevrjEIJA=
Received: from OSBPR01MB2949.jpnprd01.prod.outlook.com (52.134.254.22) by
 OSBPR01MB3271.jpnprd01.prod.outlook.com (52.134.255.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Thu, 12 Mar 2020 05:10:05 +0000
Received: from OSBPR01MB2949.jpnprd01.prod.outlook.com
 ([fe80::c55c:c17c:b998:649]) by OSBPR01MB2949.jpnprd01.prod.outlook.com
 ([fe80::c55c:c17c:b998:649%5]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 05:10:05 +0000
From:   "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>,
        "george_davis@mentor.com" <george_davis@mentor.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
        "yuichi.kusakabe@denso-ten.com" <yuichi.kusakabe@denso-ten.com>,
        "yasano@jp.adit-jv.com" <yasano@jp.adit-jv.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jslaby@suse.com" <jslaby@suse.com>,
        "yohhei.fukui@denso-ten.com" <yohhei.fukui@denso-ten.com>,
        "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>,
        "ashiduka@fujitsu.com" <ashiduka@fujitsu.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Topic: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Index: AQHV1sAgPlnOtMWuIkKRz6OcOs9dRKgDJUQAgBHWrICAL6+KAA==
Date:   Thu, 12 Mar 2020 05:10:05 +0000
Message-ID: <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
        <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
        <20200210205735.GB1347752@kroah.com>
In-Reply-To: <20200210205735.GB1347752@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=torii.ken1@fujitsu.com; 
x-originating-ip: [180.43.167.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bf52c28-f992-4160-c63f-08d7c643a07d
x-ms-traffictypediagnostic: OSBPR01MB3271:|OSBPR01MB3271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB32711575D8E2CCC7DD16DE87C1FD0@OSBPR01MB3271.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(199004)(66946007)(33656002)(66446008)(66556008)(85182001)(64756008)(66476007)(52536014)(26005)(76116006)(186003)(8936002)(91956017)(5660300002)(7416002)(2906002)(6506007)(7696005)(55016002)(53546011)(6916009)(316002)(478600001)(966005)(4326008)(81156014)(71200400001)(9686003)(81166006)(8676002)(86362001)(54906003)(777600001);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB3271;H:OSBPR01MB2949.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I/RpCA+obSv1uLLOPZjGDvHRFKsrTsqsEQlEI8bfl3fePIY13LO1BsdzDS+NyjYyjMyQkUHxFXRa+0NctjIN6XGZdWWhiqoT+YLG8pexhIWQNHM7zBNChSWENAkwjYKZNP+kvQT4d7KwWkNvjPBeVqUGJY5Y4O+Mpy6sEnMrc3Pa/+7vAcAJPxrWXm98bykOfKjCYa6f2KTQrf1vwMkllaaZgc0lSon4Mi5qLXInPSpu/VINOnZRDslm81phn6S7hxVWBm7OGtU2xfoaESJhgzjaDZ1O7U1SH/9aEFSaKD9T1UCXY+Jx87ROket2R+hwXcbf8BxuRCYl8nR484cLvM2nFv2Tjh/YeQTDAddTyEQ4n4lSM4ShLCQMSFAw1yVr2LfZ8ztd+ve/rYdc4o/tsOsYdMpQO8bPLi+YBW9bVgQCFm8htTXahi3h6T1tB/l1f1FAFhj4xB4ucciOKErkMaXa+zs2mcUwgTRiIzj+IhkqClN3hF/miXCZmLZrNwUYfLUeuzi5Pp687rFlov6rXHtuwwoHFUnOKZtQiMSpBHya/UpDa/Uw+UA5RKTL+Vb+
x-ms-exchange-antispam-messagedata: osxHAQ22LEVkhRoe8Z1mTAmf9BjE5vXs98pRV3RZh742oGx7INh0T0Fi0fpCCTghNLUXHrRizUOOMC8RKJPgFvCU/ukMCi4A794+LspFu8F4DNoSM04PXM0GCeRzZZi9JF9gw/v9OhvZeVovmE8PDQ==
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <E5048FDE2074214D9B8CA4893A0664D9@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf52c28-f992-4160-c63f-08d7c643a07d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 05:10:05.0242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsE9UA3xm3W+PELlZmBUvexsMjDxb2XO0Bur/JmWjYkWizn/wgEbaMnrhAbuGP6zMPmHEl/aZdCDHTJgOKILID1VETToVmSCc0OXXf2kqww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3271
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Greg,

On Tue, 11 Feb 2020 05:57:35 +0900,
Greg Kroah-Hartman wrote:
>=20
> On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven wrote:
> > Hi Eugeniu,
> >=20
> > On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca <erosca@de.adit-jv.com> w=
rote:
> > > From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > >
> > > This patch is necessary to use BT module and XM module with DENSO TEN
> > > development board.
> > >
> > > This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enable=
s
> > > custom speed setting with setserial(1).
> > >
> > > The custom speed is calculated from uartclk and custom_divisor.
> > > If custom_divisor is zero, custom speed setting is invalid.
> > >
> > > Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > [erosca: rebase against v5.5]
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> >=20
> > Thanks for your patch!
> >=20
> > While this seems to work fine[*], I have a few comments/questions:
> >   1. This feature seems to be deprecated:
> >=20
> >          sh-sci e6e68000.serial: setserial sets custom speed on
> > ttySC1. This is deprecated.
> >=20
> >   2. As the wanted speed is specified as a divider, the resulting speed
> >      may be off, cfr. the example for 57600 below.
> >      Note that the SCIF device has multiple clock inputs, and can do
> >      57600 perfectly if the right crystal has been fitted.
> >=20
> >  3. What to do with "[PATCH/RFC] serial: sh-sci: Update uartclk based
> >      on selected clock" (https://patchwork.kernel.org/patch/11103703/)?
> >      Combined with this, things become pretty complicated and
> >      unpredictable, as uartclk now always reflect the frequency of the
> >      last used base clock, which was the optimal one for the previously
> >      used speed....
> >=20
> > I think it would be easier if we just had an API to specify a raw speed=
.
> > Perhaps that already exists?
>=20
> Yes, see:
> 	http://www.panix.com/~grante/arbitrary-baud.c

I saw the code above, I thought I wouldn't write such code normally.

>#include <linux/termios.h>
>
>int ioctl(int d, int request, ...);

Do application programmers have to accept this bad code?=
