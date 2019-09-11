Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729A7AF47D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 04:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfIKCp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 22:45:56 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:10815
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726680AbfIKCp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 22:45:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igXJztlXgx1/zWnBuGFnBKCI6bB5dCc8TZPp+HatE6acmA2xCJJDkD+G3ovfwYHI8RMCYywk0yA2y/9h/5prODj/oti54pjH9o5WJZ/fdCIoDFb9n6gIufVeWVXLvOOVT+eiWs09vjLuGe4j94dRXoUAW6R5tJtx3TxZTARcEZ9rOIYYEDJ1mlT0IdJWnA9fuGpwJc8LA0jmAffSSrN/ZEZqFeCzNsjPoRtHcrdj6eVKGSPPnKuttlbPtrLyV/7WyI+H96JLBBN5MMOZR1bri8kqgBhDAkPNi7G4+PIiKlvcjOWrllD/bcc2xPTAZpAY1ECNJ2yG7RIRZqbjpJVzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCsKjD57YPg0utMrHcVo/qeG1Sn3n7Q0Sg/ZbijN6d4=;
 b=j9lFMw5AYiGDhJnHDJubVBn3ZbpZWDQcwfCHdCdBcziIZz1iBgZoqGlSyU+tScvlC2FbVPeNzOYsKxZ2H6GZBZFrn+ip8e6RDT+tCkO2zRat0OJTekUiej7s0SabcUkeKrUzfTWD0KA+VOCvWugB87AezRLDN0aVHIGPPpxnZhKc4Hlo8nLFhn8Gm4Rx6+4H5jXiw81vMfrX/rPCEtfXQ5NjA4Hj5umdCa8xqhprvDWWHYah8CLwO3Bahh+3BjSVqhh3nSwV133LlONrX0SvUWCkhaHvS0loEG14phZfrI9TaeZciOUE2q6U+OBV7CU45G6rSkgXuMDhDTmMG7jpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCsKjD57YPg0utMrHcVo/qeG1Sn3n7Q0Sg/ZbijN6d4=;
 b=aVTEfbcWlSl/SkWXIcQcFpoV1oBBt2zRonexnwkaJRuhWgMMzsKBZBeyeL9bIspera7QLMRCVNwMvrm0wvfmQO5yvGMrLSD0t9xVUFjdCIcvqwatITALuIPwR8Nq6u96mqQBOqN2YbGJ1u/rg7xFN3oHCBd+OAnnDVjN4z3ntOs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4367.jpnprd01.prod.outlook.com (20.179.174.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 02:45:52 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 02:45:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v4 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Topic: [PATCH v4 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Index: AQHVZyXAui4/Onta+kaFTmsrMkfxKqckVeJwgABQ0ICAAR5SEA==
Date:   Wed, 11 Sep 2019 02:45:52 +0000
Message-ID: <TYAPR01MB45447960B4D77CB0C01B08BBD8B10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568043974-1236-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB4544C419E30F3D3033086088D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190910093117.GB9960@vmlxhi-070.adit-jv.com>
In-Reply-To: <20190910093117.GB9960@vmlxhi-070.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96a9fee5-4fe3-4e1c-a1ee-08d73662299b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4367;
x-ms-traffictypediagnostic: TYAPR01MB4367:|TYAPR01MB4367:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB436731C446CF58EF01154E8FD8B10@TYAPR01MB4367.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:107;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(189003)(199004)(55016002)(74316002)(53936002)(64756008)(66446008)(25786009)(11346002)(4326008)(476003)(6916009)(66574012)(6506007)(26005)(14444005)(256004)(2906002)(446003)(71200400001)(5660300002)(486006)(6246003)(107886003)(229853002)(14454004)(66946007)(76176011)(86362001)(102836004)(66066001)(186003)(76116006)(6436002)(99286004)(66476007)(66556008)(9686003)(54906003)(33656002)(6116002)(8936002)(3846002)(81156014)(8676002)(81166006)(478600001)(305945005)(52536014)(7736002)(71190400001)(7696005)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4367;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bEvLkY4kKR0g7/OYdZnQlWIa/G4PRYA1CnOAysa8hWOnKnRGwBJEhPjPYUW/iIInsg61FDXHQuEwNr8+dnke1QDGoUS0NWqjUvghqbUlaTMxSbuxeC8cAlbGk/fs9cW1+LYkSXnhD1vlZmPFImOC+oahF2u0LTFhM737wejZasTLX56cwoMjPm+Yi6Ad1O1gqijmdtXZwLH2/Ep0vnzDdi37sTZIAmTSu3K8iBEBdlZ60jHBOXdDC4noC3qtvviYeyjChHYEDkwgUE/6eN12JLMYTZpiWyQhr1gLCfWLY/O7uXalWrpPKoKXZlDeAAn5Ucu5Jk2WfzEu1776asYc/t0jBUFOPsD47nR+QyARq/EoYCuGwU0YGRTgVt2gR2u8eQ/RmafHMs1rSIeU7XsozY0+9yZC9kGcbLGYZRcgLbM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9fee5-4fe3-4e1c-a1ee-08d73662299b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 02:45:52.7355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hCK3G67uPFtFarEjmNCpIoW7Lin7UDm2wYf3MNosNPiZ1IpqzvSC9A0J6sAOX60FBsvpMCeyeMXkuzuyf7A2JtlaW262xou2k4UA3EyuRx/1Dou7gFt9H3euR/jc2fDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4367
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Veeraiyan-san,

> From: veeraiyan chidambaram, Sent: Tuesday, September 10, 2019 6:31 PM
>=20
> Hello shimoda-san,
>=20
> Thanks for point out checkpatch warning. After resolving checkpatch warni=
ng,
> below  checkpatch warning is seen.
>=20
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars=
 per line)
> #23:
> [1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common co=
de")

I checked other commit log, and it seems adding a new line is better like b=
elow:

[1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common
    code")

JFYI (out-of-topic though), checkpatch.pl doesn't warn if a "Fixes:" tag wi=
th
more than 75 chars like following commit [2].

[2]
---
commit d950fd992ef89f39ff8908f389ed6cbd2fdc0513
Author: Niklas S=F6derlund <***>
Date:   Wed Feb 13 17:07:54 2019 -0500

    media: rcar-vin: Fix lockdep warning at stream on

    Changes to v4l2-fwnode in commit [1] triggered a lockdep warning in
    rcar-vin. The first attempt to solve this warning in the rcar-vin drive=
r
    was incomplete and only pushed the warning to happen at stream on time
    instead of at probe time.

    This change reverts the incomplete fix and properly fixes the warning b=
y
    removing the need to hold the rcar-vin specific group lock when calling
    v4l2_async_notifier_parse_fwnode_endpoints_by_port(). And instead takes
    it in the callback where it's really needed.

    [1] commit eae2aed1eab9bf08 ("media: v4l2-fwnode: Switch to
    v4l2_async_notifier_add_subdev")

    Fixes: 6458afc8c49148f0 ("media: rcar-vin: remove unneeded locking in a=
sync callbacks")
<snip>
---

Best regards,
Yoshihiro Shimoda

