Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EF5B8946
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 04:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405320AbfITC1Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 22:27:25 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:56932
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389457AbfITC1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 22:27:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiSku/lDgxmjBFky3nUNUe0uoxo0Cx7Fozl6IXCVlMVTBhZUDSph7dv0qM3yljUAvs76oiaZehvvKiDBT/YbtvTi0/BobpFOepQD7BAbCleiMAz31BqWZXB8M35e7/GEKCY3qslz7YvHZ7HD0NRUUz8j55U4rybTagv2dhif9Ta+kqK6xTin8VZ27EdABGs9hmnmJ0N2/Ypdft49avO6pSuM86Rm2SoVMNvPaBphcBTxa9lYfg42Y/YXEIo4JzHgyxFisObIq9vdM4w+BbdKI7lyJdYzxlmPX0MKUPLUmRa2TKr96uNNkvMbgTBwTe3aSyddww9RFCsvEQWzId4HXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5cjeEBHblYfCqDY/1f3w8WMWBUiR+UBQ9RIXs7EXNU=;
 b=eyFtmZJPW9XY8+cUWEjOx5zy8TSa0Djf6Nwg96hI/KX7su3gi8fUrK2KZArouV0GTNVjoLVha76GEOTUu8vld5O0+ixnYiIH+eXtuN1I0NvMhj7LkkAeFgAzXZ9gKngnKocpML/olo9NPgdjY+WIucswYxYhZfJY7kRzcrjGktEv8MaAG3YpiGPXiCiK4DI07X7JVjSPHh1OP29QOFSjws4AvilD0S8os8mvPdHmIzvNzxDFgKVXCwMhHIC2P79Rww53pCmjEaoPuWh2YbH5MlyNYDMk5lbW+xW9Gyr7lRHb2kGcpgIyFlZQLm7lU5jJYmvH6AZCCNHAtPtBLuVMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5cjeEBHblYfCqDY/1f3w8WMWBUiR+UBQ9RIXs7EXNU=;
 b=CxVEB0nTp8iY0NVgRbo51Rz0lQR4ZOj+IqGWJOx/ev/6tT7ODjcYT9Iigg8FwqRuHhFn9B0plVpurNkl4mB6O1ulIK8QJvPqMPikkeC/2OS5vwjQ6EgpwEAeP33B9296sMieDLRBKKCiDUq1UHFgjm8gfrFuAGKLt7bjU2JT7nQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3950.jpnprd01.prod.outlook.com (20.178.138.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Fri, 20 Sep 2019 02:27:20 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 02:27:20 +0000
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
Subject: RE: [PATCH v5 1/3] usb: renesas_usbhs: simplify
 usbhs_status_get_device_state()
Thread-Topic: [PATCH v5 1/3] usb: renesas_usbhs: simplify
 usbhs_status_get_device_state()
Thread-Index: AQHVaKNao42qULC3gU6uMYp1la1FCacz5Bjg
Date:   Fri, 20 Sep 2019 02:27:20 +0000
Message-ID: <TYAPR01MB454437DB57E25E5C7122EAE7D8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cb11494-82bb-404b-94ea-08d73d72104e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3950;
x-ms-traffictypediagnostic: TYAPR01MB3950:|TYAPR01MB3950:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB39505688F578EC2B734D1589D8880@TYAPR01MB3950.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(6506007)(66946007)(14454004)(99286004)(107886003)(74316002)(2906002)(6306002)(55016002)(446003)(26005)(186003)(14444005)(6436002)(7696005)(71200400001)(86362001)(102836004)(76176011)(5660300002)(11346002)(7736002)(256004)(9686003)(305945005)(52536014)(81166006)(71190400001)(4326008)(966005)(66066001)(229853002)(486006)(8936002)(3846002)(33656002)(81156014)(316002)(64756008)(110136005)(6246003)(76116006)(25786009)(54906003)(8676002)(478600001)(476003)(66476007)(66446008)(6116002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3950;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WostcaklBBQwmTP3DF5KZTnWty5yqTNpoBXs/lK6M5fYtk7WvMnqzrJgaQVgs1c8gy+IFE4CGLBz3cIe9MY8s9n+Phdzp88t+8J6yghN2AlB26a0wF+hybCKyAcf/qk5CzIFrGdpMl7G64SWI5nmSpoSfrB3wvjNwbjSEFL05UZfjtFcyXCGW2e7Sqyok9KTXMekfgcsL4B6i5W61QX3VL79MJqvLvztdKjzT8m8gjQlKn52ODBYA9vNjTOcYvTH9p22cvLCYxPaml+yjmb43LkfRS1A76vp87CQ73g6+nBlEqjQk+Q85uNOcaxSQHzCCPbeVebGwiXHdWc1K6434QN8XR4yLEHTbjKzdaRRgvE1rCYel/wS1OMEg3nGRm1M7Q3Rq/5ixXlnXE8Fa4uDp8VxyCHiRgqd00lMP7gMtQA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb11494-82bb-404b-94ea-08d73d72104e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 02:27:20.4276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGgsg3420XDIz81zSsD98f7F5KcKMs/8fQp9jJ+onn8TrdJ7Y0ZqgcrDMYZGG2JM21fROHHcJUvOKVsJOqMoK/v1h6sP41+/AEmH+DBjIsPsEJPn2rZvWNge2c2dX2Sa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3950
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan-san,

> From: Veeraiyan Chidambaram, Sent: Wednesday, September 11, 2019 10:16 PM
>=20
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>=20
> Similar to usbhs_status_get_ctrl_stage(), *_get_device_state() is not
> supposed to return any error code since its return value is the DVSQ
> bitfield of the INTSTS0 register. According to SoC HW manual rev1.00,
> every single value of DVSQ[2:0] is valid and none is an error:
>=20
> ----8<----
> Device State
> 000: Powered state
> 001: Default state
> 010: Address state
> 011: Configuration state
> 1xx: Suspended state
> ----8<----
>=20
> Hence, simplify the function body. The motivation behind dropping the
> switch/case construct is being able to implement reading the suspended
> state. The latter (based on the above DVSQ[2:0] description) doesn't
> have a unique value, but is rather a list of states (which makes
> switch/case less suitable for reading/validating it):
>=20
> 100: (Suspended) Powered state
> 101: (Suspended) Default state
> 110: (Suspended) Address state
> 111: (Suspended) Configuration state
>=20
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> ---
> v5: No change
> v4: https://patchwork.kernel.org/patch/11138197/

As I sent on v4:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

