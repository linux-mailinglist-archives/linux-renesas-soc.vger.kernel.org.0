Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546B4AE31F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 06:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbfIJEpd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 00:45:33 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:15065
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729298AbfIJEpc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 00:45:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsHV8iICssu/1lYAYqlg8pNlikRPg6SSdGMODMDlylnme6QSn2wfSJtmaLMuaV4hqoK6ggSrT4dHmRhTN/DrKi9X8XBX23xn+KGlRq6Y8DCBSyQcUmOnQenEADMEZGstQkaHM1nbFU7Ok/mxScMPFZEpv2qDbwE/Drs6LNhS8F/h35ls/habZDZ+Qz5pnPJRVo9UFftwx9YZUGgPHyOXlx7G6yvS91pfsiZiGXWC8rf3Zo1cOlTrlc8+dBY27ou04d/yzYwqatJOgQhV2leBn8koY+k9qjqEWMLEcKHVL+p3d9FYG/Kkwr+jLYIWW+0OCHEguXOhkAcS4vfMpw+RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjJn9DsEtRvUavsB9cFPB5P+tsQhnyL5FHq4TZh5m4w=;
 b=LI6rM8uurYKNoNjc30Ricey/D8rFHvU46UrMo5KSqLPXYKeeOsaLLOzIX52nrWgj+peJZ8OYT82vASZG5BvVkl3+c45sEdRC9aqNkMJW/UkFudKhcNcropYjipovwcrTLDR4hwo1Et41p3Ldi/fHwwXJ+mxX8Y+diNQTVZ1EhcUH8rvlH/KPvyNMBagU/dh4yonkFZs8ygyBMC6gkkkx+USxe8QaGuUeAnYeQk+g35ZGw9bPBwWvxGOW4pnkjFj7FimYvRVZ/h95lltDrRgV9O827vJZbC1Zgq8t2qDeAKUCJ061ZNW0Gtz7R+5HfQxgA5q0+dlZLTRJKmhaskUgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjJn9DsEtRvUavsB9cFPB5P+tsQhnyL5FHq4TZh5m4w=;
 b=kBzWmiPJFfdbDrpS5NdBe48ESAAY+V/W8qrkHGvnh1N9jES+dZihymA8BvxFtV/rNsB68ViFhA7zIeR0NyojMTyZ/Chx1sjxi6GI+0nputdt1yLo2D+7CSDhhKDqhMr1bPPA2hOAe4devF4EvzHVQ6cC4w2wd9kJ+eAu+uV79es=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5181.jpnprd01.prod.outlook.com (20.179.186.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Tue, 10 Sep 2019 04:45:29 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 04:45:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v4 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Topic: [PATCH v4 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Index: AQHVZyXAui4/Onta+kaFTmsrMkfxKqckVeJw
Date:   Tue, 10 Sep 2019 04:45:29 +0000
Message-ID: <TYAPR01MB4544C419E30F3D3033086088D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568043974-1236-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568043974-1236-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b45316d-71c5-4fa7-a229-08d735a9b4b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB5181;
x-ms-traffictypediagnostic: TYAPR01MB5181:|TYAPR01MB5181:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB5181810F66802181FDD3D7FED8B60@TYAPR01MB5181.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(6506007)(76176011)(53936002)(476003)(446003)(486006)(99286004)(7696005)(2906002)(316002)(14454004)(6116002)(110136005)(11346002)(33656002)(9686003)(3846002)(54906003)(229853002)(478600001)(186003)(26005)(81156014)(8676002)(102836004)(81166006)(8936002)(5660300002)(52536014)(107886003)(74316002)(66946007)(64756008)(66556008)(66476007)(66446008)(76116006)(305945005)(6246003)(14444005)(256004)(66066001)(86362001)(55016002)(71190400001)(6436002)(4326008)(71200400001)(25786009)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5181;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LSUDUVaY0MXyllE4RCaY7O/6/d6P+FdmZzrRM/LOlqaJmQaBfz/tGdRS/aE6eCzO5wLlgO8cY3YLeqNUk/kbEw1mQal+E1eegc0iQpxJPh/G1A9CTZmkhgXFOwRkgmPjf72QD5xzpXVyskp+mYOoyqrjtl0SswMtjNTSr0Mn0HDvc+VNW/lckOxmiW3/gF/gL51fc9AuiuPUhhiTxj3vi4Is7u60zh3a3KHAF65Yr1GR/aQ9kcX6dG2yn59vc0kdYSqWwi0ClGzfbl8HT+kkjyozlBYbh92jFISf1ysFqBbNk6zyoU1prY8zHNSuAVu8tE7DphxdINA17FVmuW7CWMgfTW3Q73oWdRQhvfRpAkHui6OibUBUofLX0+AVH79CCPh/H/ZT87OYqrtb2t3+iKUic1hcG4laSTJ4I/ltsRI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b45316d-71c5-4fa7-a229-08d735a9b4b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 04:45:29.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keKtXu3SOq0VQ0sPK/9LeJsPrnMuzgysblHMm8fPoAfgfUPHrEs7cOgXiKWzLUSx+WayOcWuZ+y7af4NHcs74FoScp+mbrJ7B+HNJr6DsQ+Hp24UV9QcYtWm6soNKJMU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5181
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

Thank you for the patch!

> From: Veeraiyan Chidambaram, Sent: Tuesday, September 10, 2019 12:46 AM
<snip>
> Commit [1] enabled the possibility of checking the DVST (Device State
> Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> the irq_dev_state() handler if the DVST bit is set. But neither
> commit [1] nor commit [2] actually enabled the DVSE (Device State
> Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> Register 0). As a consequence, irq_dev_state() handler is getting
> called as a side effect of other (non-DVSE) interrupts being fired,
> which definitely can't be relied upon, if DVST notifications are of
> any value.
>=20
> Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> doesn't do much except of a dev_dbg(). Once more work is added to
> the handler (e.g. detecting device "Suspended" state and notifying
> other USB gadget components about it), enabling DVSE becomes a hard
> requirement. Do it in a standalone commit for better visibility and
> clear explanation.
>=20
> [1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> [2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

I'm afraid I should have realized but, according to checkpatch.pl,
these formats cause ERROR like below. So, they should be fixed.

ERROR: Please use git commit description style 'commit <12+ chars of sha1> =
("<title line>")' - ie: 'commit f1407d5c6624 ("usb: renesas_usbhs: Add Rene=
sas USBHS common code")'
#90:
[1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")

ERROR: Please use git commit description style 'commit <12+ chars of sha1> =
("<title line>")' - ie: 'commit 2f98382dcdfe ("usb: renesas_usbhs: Add Rene=
sas USBHS Gadget")'
#91:
[2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

Best regards,
Yoshihiro Shimoda

