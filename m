Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62EB8B894D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 04:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405365AbfITC3m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 22:29:42 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:40354
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405325AbfITC3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 22:29:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZzMo4mzsNHuo9YZCPhWGrIYy+2/XXjgcIAi7+CJMyUwKPoxl38WDkGE1lQwx0CWHCucDJ8HkVkGRMRVNHoiO3yHzPc4srd443t1koU6J7QKHjNXRQ5PAJ6HsFDqerOMVsiXejs2pxKWQy32L/Q9uJgUmia8wwknR//B82Ss9FZwn0RzWw1Gw3NJ7cY5EjTZkw0V8v07Ti7TXLCWc4oBwmUSB8yrlut6pORrAnj5HcwzcM1qVyByFctrBS5ZFHtJUrb96RzT2LyCO1an5FBf+oUNEqpikiYbeNe3fWpqA/Ft+WV95uCe0FPw9h+EEwLap8u0fN814ALQ01BNTUD1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jdVqwEncyhbwo1PN30dIHub7HzwCsdVHAFDObXZiGI=;
 b=FEPaGX58+99rD6V0Amadb0nlntbcVHJLKCPxOndsvqGhjUgqsHYKMITNQxR6jcrc1BfNGIbvwjZoLHqqFF5RSb5MbZCn4U5inB+VCW46jD1Zu/UaBV//NNcOr4SszG8tI+8r65SDfX0jEHnlM6Eh9YNr/cBsp+MzweXhRFAriJx7U2tlW+AIJvEBmUxCJXlStrRLlk8ClzT3N98ZhhQCowIth3LEV/KT4g86UiA3Q4Nz/xjpkUN7HcDc9/h1i13V14ZFYcL2CnEHtdBG7Y/DRQPNdEjKnrjyR9s9gwF7wt/tGlNdK6Pe7VEvAnMbYgwn67KhEs+FxE/csyzVRbRwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jdVqwEncyhbwo1PN30dIHub7HzwCsdVHAFDObXZiGI=;
 b=eBDWRddtSjPSDllENTHfG7cZmx8PyMofQK26luno3gZ2sLuYlQPfGWQLK5NSDYeIMWmzV/xLyik6YwzSkNZ7dAEZk7F9lBXaCzFEnKaiR8veTjjcPKqJhC618ALLPWaDG/5Xq+IRwEMOIz8r+XwgCyL8SLi06HfNbLSmEJwdkqY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3950.jpnprd01.prod.outlook.com (20.178.138.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Fri, 20 Sep 2019 02:29:39 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 02:29:39 +0000
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
Subject: RE: [PATCH v5 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Topic: [PATCH v5 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Index: AQHVaKNdrO0A71wVUk+CVDYAWACHDacz5O3g
Date:   Fri, 20 Sep 2019 02:29:39 +0000
Message-ID: <TYAPR01MB4544D10477526AA6362A179FD8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568207756-22325-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568207756-22325-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1ab571c-8d40-44d1-a94b-08d73d726314
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3950;
x-ms-traffictypediagnostic: TYAPR01MB3950:|TYAPR01MB3950:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB3950F3A3379C886C626B73B1D8880@TYAPR01MB3950.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(4326008)(71190400001)(81166006)(3846002)(8936002)(486006)(33656002)(81156014)(966005)(229853002)(66066001)(52536014)(8676002)(66446008)(66476007)(476003)(66556008)(6116002)(478600001)(64756008)(316002)(54906003)(25786009)(76116006)(6246003)(110136005)(186003)(26005)(55016002)(446003)(6436002)(14444005)(66946007)(99286004)(14454004)(6506007)(6306002)(74316002)(107886003)(2906002)(7736002)(11346002)(305945005)(9686003)(256004)(102836004)(71200400001)(86362001)(5660300002)(15650500001)(7696005)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3950;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AD1XITPWiwgJrB+ecp73Ic80ywNCnpe56QaZRLgn9HWS6VBJAm1wNCkVJpLWlUJYM97Hs2TX3K+VSqEhNE0HjzclxHwBlRJYhmspnq/8c7sAM5DwGUCGXg1J9IUYhHbr4+JIp4ORnanS5VzAVzcyfC6ZVS7eAXMxlbHRCXRMIh9SvUPD9P98xUeBVtShnvbD1SVpkdsW/iSfFn7mHc0knBYV3QYnFMujMjSMIV6loKH2s9YJMJWaq+oUPmgAsupGtCvoTJOOlLFuxl2DVjrD02SCea5MSgsMPHqMihO0p028A39KsAWRR3gXIkW18m/Ze3YlS3zyYIoQ0IzFrlNy/SZrN1OY9s4RQ9vm4z7iuFQy6ZvL6DF3bnYivzR22X3+nLL5ziO7qWVUiUaGy/tCx7XWnAal9M2iVPgEoL7ZLWM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ab571c-8d40-44d1-a94b-08d73d726314
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 02:29:39.2649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvVUAyaJmkVwKjtzb4dQI+Xmpw7Qe/GbXuFjl8Sl+ikDVROigJEZFRhXA/K4gtaLM4Lldl3R04UykormZtnTRRSB3BcmZaABRAzRdvnbBvNeIpUzKK20KiFpjWIBmvcc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3950
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan-san,

> From: Veeraiyan Chidambaram, Sent: Wednesday, September 11, 2019 10:16 PM
>=20
> From: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
>=20
> When R-Car Gen3 USB 2.0 is in Gadget mode, if host is detached an interru=
pt
> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect host detach, extend the DVSQ_MASK to cover the
> Suspended bit of the DVSQ[2:0] bitfield from the Interrupt Status
> Register 0 (INTSTS0) register and perform appropriate action in the
> DVST interrupt handler (usbhsg_irq_dev_state).
>=20
> Without this commit, disconnection of the phone from R-Car-H3 ES2.0
> Salvator-X CN9 port is not recognized and reverse role switch does
> not happen. If phone is connected again it does not enumerate.
>=20
> With this commit, disconnection will be recognized and reverse role
> switch will happen by a user space application. If phone is connected
> again it will enumerate properly and will become visible in the output
> of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> v5: No change
> v4: https://patchwork.kernel.org/patch/11138205/

Thank you for the patch! As I sent on v4:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

