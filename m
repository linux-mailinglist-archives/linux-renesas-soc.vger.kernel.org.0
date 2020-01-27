Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8201F149F74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 09:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgA0IIa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 03:08:30 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:12608
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbgA0IIa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 03:08:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUgiYealrjoQKQ76k9o0OskhpCEqLs41CbJ31odhJOEbVXQzYi73feL1Pv3JCAfPJ+E5JE/6sYTTOnDpO/TWEuTkA5g8sDzVId2P32tS1ow2V7GAoFMuTJfKIWP40BPRC/Ejmi8IWSS4WflCOID/ngGBKJLlQFvm1aaVsStNBYJZr8xzEpM6WHdviEADwgWdrku30+IN1YfuZaeKV7LFwB+kN/THE0Z5gxxsIVDkpp/Ag056jN/tlisDqkIOF+nCWCwsMXndHzTUjLnS8EbjkTSMEIgd21g1ViwDEuTAkpBFWjNdDEKEFo1RkAeVOSGA/khEtZm4i36tGCOPTdtHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b89yY32PeV8u98RcvIUAlPd6beyEtRXLMrOg88Sb3zI=;
 b=GsNHdlsX11gZLGRGWWHPr7z2beLIYEdjc7O5/J3EF0Tlq2bQ9W+/K6E2JvT6meYHvWKw818F7v0VR319kJnjbxev4KLHSAXGZaMwPvy5hlVc/m7PRseOOZCpggLGGfzY23RlrWfHxW+d611fgL+LGe5v3QTOd3kIteJMEEsf0/R6DcKFU4lvuxZcaNvc1rw6FR+FltSeDGyhHW6zc1g4nxQYvTFHHeNWzUZeZqt1Ysutrrcsqad3wwxs669OiicHRCDSDrEipDAj1+TDKTNO+ndxNlv3Nyg84hKf755sIC4A3r/VXfelrTqFwAEivinoSzxHF0ZO2agQ0n3gW8NndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b89yY32PeV8u98RcvIUAlPd6beyEtRXLMrOg88Sb3zI=;
 b=O5BnBR9jUWeMHtEfFkwh5cz3NlZkXIWqFUbaMN7nare4xcqet9Povs+/upeXchVAttK/Zs6eNS9MxZgcNxTWe/xW8t+QoZAMLOemiAKaAViU32ohijMASP2xQAnwWONhAUA4wKffZRd0KiWy1JKiYoi7ePd7jvWYBVDhtSNcQ1Y=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3376.jpnprd01.prod.outlook.com (20.178.140.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Mon, 27 Jan 2020 08:08:26 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 08:08:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@prisktech.co.nz" <linux@prisktech.co.nz>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Topic: [PATCH v3] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Index: AQHV0nCgCmGZDW0wmUeBWqdopQnn66f57ieAgAQ+OPA=
Date:   Mon, 27 Jan 2020 08:08:26 +0000
Message-ID: <TYAPR01MB4544DA234E38453AE84B4F24D80B0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579840923-10709-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <Pine.LNX.4.44L0.2001241012160.1610-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001241012160.1610-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9307d66b-a0e4-46c5-4868-08d7a3001667
x-ms-traffictypediagnostic: TYAPR01MB3376:
x-microsoft-antispam-prvs: <TYAPR01MB337657930D1AEA74B97BA76FD80B0@TYAPR01MB3376.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(81166006)(8676002)(7696005)(81156014)(6506007)(186003)(8936002)(26005)(316002)(33656002)(2906002)(4326008)(66946007)(76116006)(52536014)(86362001)(66476007)(66556008)(64756008)(66446008)(71200400001)(55016002)(54906003)(5660300002)(6916009)(9686003)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3376;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FVEDJ6ilMEcFe5onEBKnkXNKD1MF0QbvjLe8/BUzzx99n4LtPXD9WoBB6bHNC7FHmHcYaxsgaEbZHOAp5/H6U62ciKOiezhIKBbiuOK0oqN+WHVX/XoEUYJatJ9Ivqjk7xCOCTmozgyP+g2diiy/QZh8At5wS7Q9PF6aNLFTMmiMEyn5JBUrpVGbCTLbAfE3e5C07wE72eRbgapD5VfLaop8ghbhtfihfanDSJbuU7WaG2rlp/bws8RfL3LzmlRHmGiZt+qB++rE49ES7NFvIXJpGsvW3B9RGVusEK4CE532FUqJYSDCwmQx22c8eSJpPh8IaVq8MQlqLpFgpX3d49gtx74N3XA/OjXZ00kGuuvV75l8scecHBVtMmAE2gPAmXjnGDocoWFua8Rcm4O6QNJJUwNml/8KiYCq6NV97N4jL45OLIGQbQ+AM+mBPnt
x-ms-exchange-antispam-messagedata: 492c4r2z06hv16NVpqf+qtEvck+N3b8ArkfdsFKeTomxB+UZHqUoGMUImNtH8YyLyOsh1tjrl+FfIdwl0M4KZ+4xjyUWMp1EuG1xD0jh9d01oKboDt20ZyVQ1jURoVRaj1Vli/DDCPuwATdZ6vPD2A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9307d66b-a0e4-46c5-4868-08d7a3001667
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 08:08:26.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJQzxZcVzURS/5wn+3NV1P7ADjvODI2ClEoOoDDVD8nLxoqsMdjhqbDYYu5lvP60pZlx/Nng8l3ztmsdBqHtgQhgKICTWtDgomb5WrvaCPtoXPFUi5UpivbkZXJA/lVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3376
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

Thank you for your review!

> From: Alan Stern, Sent: Saturday, January 25, 2020 12:18 AM
<snip>
> > diff --git a/include/linux/usb/ehci_def.h b/include/linux/usb/ehci_def.=
h
> > index a15ce99..0ebfa74 100644
> > --- a/include/linux/usb/ehci_def.h
> > +++ b/include/linux/usb/ehci_def.h
> > @@ -150,6 +150,7 @@ struct ehci_regs {
> >  #define PORT_LED_MASK	(3<<14)
> >  #define PORT_OWNER	(1<<13)		/* true: companion hc owns this port */
> >  #define PORT_POWER	(1<<12)		/* true: has power (see PPC) */
> > +#define PORT_LS_MASK	(3<<10)		/* USB 1.1 device */
>=20
> The comment should say: /* Link status (SE0, K, or J) */

Oops. I'll fix it.

> >  #define PORT_USB11(x) (((x)&(3<<10)) =3D=3D (1<<10))	/* USB 1.1 device=
 */
> >  /* 11:10 for detecting lowspeed devices (reset vs release ownership) *=
/
>=20
> You can remove this comment now.  Since there is an actual macro for
> bits 11:10, we don't need a separate comment saying what they are.

I got it. I'll remove the "/* 11:10 for ..." comment on v4 patch.

Best regards,
Yoshihiro Shimoda


> Alan Stern
>=20
> >  /* 9 reserved */

