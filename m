Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4A8AD35C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 09:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731533AbfIIHCt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 03:02:49 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:32233
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730897AbfIIHCt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 03:02:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx+18ijD3vAYIxSsMuB6NohqxhsxlFPoeFwsCodZ2E8uVxq6wr875rnSQFgNCVwieSs75Asq2zjQt+Ir0QYaszftKVwN2tZlebfV15dJ5eucwp7qNJh8/UMCG8DNt6WquIAIr/Rr2XlJcdPR3ca1gy4vxc0Si48fcvIhIzCyVYRGilb9wTDhO4pjwxCFohxaeHzV9Rf4GHNfdzc8Rm3J2rFbIQ8AsoS1IrfiwR+rRoiL7iyOatxpUt2TVwdyndCrg3MgwJEvVhUnz+uWzjFa7d8qTX/E/sizK3Gra8is0o7DnS+t/Dw/msJLiXO3WJI62d8EhhXBwEOHoWzCfSJpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biiyvjvLMkP5s1F8Fn0V0GGCMJbke/5CIAQo30TH3ns=;
 b=Plzv62RATzQt0tqexW8BU70EURNcY0RWpeudaxt+tFJgHBKXG04mPIzYl8VrX2R6j9MbxSCy7805KiFg/4/uw+JSlT7Y/6B2uprLs6yaJi70s3q2wWB5m0Mt2g/OQipBSqcGKlzcjat1O+mLC2JyRRfXr9VUcaXw/wlYZzCtSmnG6aYPehfG8zQkLj+V3qWkt71Tkug9RrjOBTYsIxg3o7ZMY0/A16wkymmAvIqbotiJupQUGyEgQMInbma+pCxaAMzQlOrQLhyHFx6foV4cCxxafJn+KPf8PLnqFA13n7P26zgl0oyyl9glsladbDqliG/OHMuyPeCBu/buldE0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biiyvjvLMkP5s1F8Fn0V0GGCMJbke/5CIAQo30TH3ns=;
 b=qNWQEgTqJubq8UugCdSL4oFUh3pE52UR+z9TqLYB+N+gOnJSq+SSDntrHX66LxyiaPzVrjxeVKB6TjscRiJTrzamrcT6X9Am8LWeP/eqnl8oIerwt55e50VfTxnpYOXOoynjU35Zy6DGB/S18T/M3PuB7dycVQ7ZduRsFHu0odM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3198.jpnprd01.prod.outlook.com (20.177.103.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 07:02:46 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:02:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Topic: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Index: AQHVZKtAYYPE1vTZZkOmZZlQI7E9x6ci7xTw
Date:   Mon, 9 Sep 2019 07:02:46 +0000
Message-ID: <TYAPR01MB4544AA760AE8DBC4CA8AC25ED8B70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d410cd49-aec3-4d85-4b3d-08d734f3b7f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3198;
x-ms-traffictypediagnostic: TYAPR01MB3198:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB31982A920C0FD3EF3EAB646DD8B70@TYAPR01MB3198.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(66446008)(66066001)(11346002)(99286004)(4326008)(25786009)(86362001)(7736002)(5660300002)(186003)(6436002)(305945005)(52536014)(76116006)(55016002)(74316002)(6916009)(229853002)(14454004)(8676002)(7696005)(54906003)(33656002)(76176011)(8936002)(71190400001)(14444005)(446003)(81156014)(81166006)(256004)(6246003)(2906002)(9686003)(478600001)(486006)(102836004)(316002)(6506007)(71200400001)(476003)(66476007)(64756008)(66556008)(66946007)(3846002)(6116002)(55236004)(26005)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3198;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IuW3W3AXy1yCTlqT55aRvswoEhJoEoM89GnUOUPTqUBO/8uoJAKItKlnGUfdViRoC6PDgDt6bHOlnQZ8xAHf4OsFJzFhvdeX+fcYnoCCFAfra6CA/jE0xOatiQZbzYIVde/roS9YXQ8s3Rg3fvb5eE0PR+kW4/mwwwZl9L8ymIXE7FPbkh6WW7ZBuW+rmgEXT6No982aBYVV0WaabgV+Jtn+mLLKSOHD2BkbFTDdAhhIIjKAVHe/Dh4QGN7yYNwDiPyACpDMjPau7dVqd6JyxCZ+WOrd2SLc84xnUCwII1VJclvF5mdUkS30xSqspb6FOQ9iapv2jQTRyD6Iaw4FCbZGhi1TqdEvLf1/lqyxKt8llMJdYvpWJnE5zjdCrfWNnfRu991QFodiyuzBXgb1TuiNQsRRiw/eV8tg7D+oNk4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d410cd49-aec3-4d85-4b3d-08d734f3b7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:02:46.1561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tw9HogrO5G5PNZ6Et4YxF5g5ysjcLxEIuugsePlqsbMAEFq5pWubrUsHKHhRm8sS4Ss0FhJ6G8JK6a/uhar9QRaG4jQU6ZfV8EomhQY8pszV20fSihV5rf7fT4OvhtuF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3198
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

> From: Veeraiyan Chidambaram, Sent: Friday, September 6, 2019 9:04 PM
>=20
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>=20
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
> [1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> [2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
>=20
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

I think your Signed-off-by is needed here and patch 2/3.

Best regards,
Yoshihiro Shimoda

