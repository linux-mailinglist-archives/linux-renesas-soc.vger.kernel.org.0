Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2435AE31C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 06:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfIJEl6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 00:41:58 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:58640
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729014AbfIJEl5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 00:41:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLrK4dOgvaJmcbs9kNyatVOnJT02OFAt2DgO+rbjNqVEgY5M84KQEO/kxlCw6R9R5uBmM2vF0z2Xcd61PKx+M/uPKUl6E7qY77RpfMCCZlcoOsY/XKYKiPbwsYOTsilqSvMbvzqwlRbvoafk3pdGXWCfTJekJ9g/Xnj+EqkjvZK2NqS00NZ43COAJc2XN+VJgCPU894xEz2CbFdT7IUTkFbZCTMB+pWsbbl/66BuQEg5y0XnxGYJ+mkTsGbIJ9MTLLWcY9RBZRJIz2gpcS7SX9mtUg+JZtvMlYYd9J+nJc6f9KMSr5wxknr1H46NbtxzjR3M0I+zAYAjqqzcBSRKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STpK6pXBpCRuBUW4xFA/fAqBaX2mDrlyPm2okjFKRhc=;
 b=CdqQuaOaBX0vrRQ9rgteyi+DpcRJ/eXHMgq9p6jakZDIK7hoiZuPMmyAsm7BE+OisJzib4AELRPlG2HVdZenO43f/xRO4VLBPM3BIcsG3C89LMX5YES5YyUtBwWB9drdMzCCWSPvlHbzfR0bI/rKIfECy96c0BAFGmNZ8wZm2MsA8JKFcPnjq7kJHPhD5mr4uMqbXcDKcWJ7eWFWldY+ZqWwKiA/ANdu0RrEc1WyAy8auW68usiWJ2/JZTDnbq2b8E5nV22PRRlHX6pZm5g1FKe3YkinXs+eCDI4fYrSJUhzrMPeMjnYWWVyEgJXXvQPO/6nKDOo0kS4DCawfh3YcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STpK6pXBpCRuBUW4xFA/fAqBaX2mDrlyPm2okjFKRhc=;
 b=YCjsceWvDrFrwyxl5aBW16lqKbcPLQyoW+kuVcskS1cQuLNoHJGbDJoUFReCR3S95VZxKkgwzRxYGpL7dJo9MDcOaNjWsDwiTAH3lLsgT5kUBBpBBK4xU+LRDMxZLLkUU6szLdqDlsXRLMxQ/B33vKbFmTx71TLnjMONB5hVKwA=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2976.jpnprd01.prod.outlook.com (20.177.103.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 04:41:52 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 04:41:52 +0000
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
Subject: RE: [PATCH v4 1/3] usb: renesas_usbhs: simplify
 usbhs_status_get_device_state()
Thread-Topic: [PATCH v4 1/3] usb: renesas_usbhs: simplify
 usbhs_status_get_device_state()
Thread-Index: AQHVZyW+BrJJGrBbx0eU4Bti60u24qckVOlw
Date:   Tue, 10 Sep 2019 04:41:52 +0000
Message-ID: <TYAPR01MB45441B261C2EA251DED6E606D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6212a2a2-ad02-4ce9-008e-08d735a93380
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2976;
x-ms-traffictypediagnostic: TYAPR01MB2976:|TYAPR01MB2976:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB2976BA3A52D6A23A90D43104D8B60@TYAPR01MB2976.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(110136005)(478600001)(54906003)(33656002)(8676002)(81156014)(99286004)(81166006)(8936002)(486006)(305945005)(7736002)(14444005)(256004)(476003)(446003)(11346002)(71190400001)(71200400001)(74316002)(26005)(66066001)(186003)(102836004)(14454004)(6116002)(316002)(3846002)(64756008)(76176011)(86362001)(53936002)(6246003)(9686003)(25786009)(55016002)(6506007)(107886003)(4326008)(2906002)(5660300002)(6436002)(229853002)(52536014)(76116006)(66446008)(7696005)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2976;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WMgwVUI8NYZaVhfjHWquUnaFHExgJrDI/PAMdC1//+dUlsCvi4RHk21dsEBWmQDrkv1wsHYwNJ8EZ30XSanNCUiHHdg+vq5BjvjY8mmUTmHsR8oxqlPwW0qi4xeSN4I+Z8CikDVeGymwmoAhqy4XOQ7JMv4gL6h5eYNkuOp0UowoWO0eMCvDiMJB2hRCUIw81Kl/72D9V6EJfS5g/MuVud8VA2VdDSXikCPStIYgCt6TH6leuK3UtUUWGBKk0DJyctRwijkW83X2Q9qhLzYbL85X9GmQCAfN4ciq11cLeyKotoj81mgvZywDB2D6S1bbepM/xTD1eyYEreoHa3GsQdD56r1vyTuxtkJeuvWZ8ju57fs4GXV/CRwZ9uVEn0EVELE1Z34CCmWZ0ltXt2kqI+/icLnZyVNhxZcBCtskBEk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6212a2a2-ad02-4ce9-008e-08d735a93380
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 04:41:52.4927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yu0K8R/aKF/UvHoZTvxfm+eQBmrbn/kezH1i1KQHAoyn2PbCmWssoMr/atjm9gncFY4HCmcwA/S0Aqdw2inoE82xiFCEY4Rz4NNgVTTB7IUS6orBGgV8qA9tzicHh6ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2976
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

> From: Veeraiyan Chidambaram, Sent: Tuesday, September 10, 2019 12:46 AM
<snip>
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

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

