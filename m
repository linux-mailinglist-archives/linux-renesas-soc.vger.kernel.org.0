Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533C0B3BE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Sep 2019 15:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfIPNzw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Sep 2019 09:55:52 -0400
Received: from mail-eopbgr1300131.outbound.protection.outlook.com ([40.107.130.131]:31068
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388106AbfIPNzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Sep 2019 09:55:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn2Tl3x5DkmA9mciUJk/Vx8hAtdw1jmsfvc4/jg6kg9pE4V3SirGUC0LqH1oA+5mKCBfuPsXM+S4ty3HA85d2Rn/Vt30x1A+2QMP3/fqOof9/t+ziV+N0dB4VgdPhU8chx3wQ/Q01VQIOzYYcK8BZsrqn8456NcekvnC7BAF8xKuBYmr8PJt1ZgSk0VCk9cQDB0BjnK84PdNdSa7vHVudTIPx2nlgAaL4yYJc1kTwT1q1Mi885yQP2W5H4ROFxuh+uaZm+7OUSkV8xn9Dd+GVi1XyBQzk+/dDMk2e8oUImuPuN7Go7c7MaImMfS0S4ZScAcTEcGWp1Pk+JSKdY4iZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfkCwFkcq8tReNHrTOn1faXDKvS5YVVzk1uXfTIUVB8=;
 b=BEiLMu9rKq4SYlumQ3/sC8EgUdHm4etLzxXbjGpGu1u4KdqS3DmIdrkKRUNjxfPFSMXaU+/4hBVzAPgPEWaK62wb6E4mY8HGRlPo81oS2Qy+jbF5WbcQFYm2Bf4DmxdaWiWdejOwdtzDIlu5EopOp2GXaBJbZiONgBTwXaAsvW4xM9S0r7jh2+CowQbKZPPzi1vHXphTPsUXV9VT3D/rqbAq6KXA8OGo5R9sInfKxkgtlI+VIQ64nI7KOuEmiON46QSKvD3FyvSrW3BARDN4A3c61Zc6OQ6l1fGUqxQA59z2MmzTbEQJ9ErEp45RI5DyAwpyC6VcFMQhOQD3zSrvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfkCwFkcq8tReNHrTOn1faXDKvS5YVVzk1uXfTIUVB8=;
 b=oSOoTaz7q5RsAy1LhdXPCxBKvheTycd8Q9hNCuhZAzAvlTmVEy1qZLR+jBUXov8+bIrMKDR5p6VWzVq3ihkbxtRFTEdMlnsR/IWfbOU4Q79FmEsZuOJ2g3yN/lmfRZi/MPSzry9UugbApa6t76mS8zerDznEPIo2uLi7gDYy3mc=
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (20.177.98.81) by
 TY2PR01MB2604.jpnprd01.prod.outlook.com (20.177.100.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 13:55:45 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 13:55:45 +0000
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: DRM Driver implementation question
Thread-Topic: DRM Driver implementation question
Thread-Index: AdVslX1ZBzegHzojRVS64lgG04s8jg==
Date:   Mon, 16 Sep 2019 13:55:45 +0000
Message-ID: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gareth.williams.jx@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77e73d7f-9dc0-4037-0885-08d73aad928d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY2PR01MB2604;
x-ms-traffictypediagnostic: TY2PR01MB2604:|TY2PR01MB2604:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB2604388BC49EA2C4B804C4E5DF8C0@TY2PR01MB2604.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(9686003)(4744005)(55016002)(33656002)(5660300002)(6436002)(54906003)(186003)(486006)(14454004)(3846002)(476003)(6116002)(110136005)(71200400001)(71190400001)(4326008)(7696005)(8936002)(478600001)(6506007)(25786009)(102836004)(26005)(81166006)(107886003)(66066001)(2906002)(99286004)(8676002)(256004)(86362001)(81156014)(66946007)(3480700005)(76116006)(2501003)(66446008)(66556008)(66476007)(305945005)(64756008)(7736002)(52536014)(74316002)(53936002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB2604;H:TY2PR01MB2924.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9ShJkW3AAmsdPZwPfujhJzKzf/0XNpJkReCSEkGv41q3M1vG+jr1hgv5lpm4dY5wWCwqYHbQ/TDlKq4Vz3uKbhxQll6LJ/FovXl85OEuKBDJGWkuMWlBla0jFsKNxf27uNf8+pwpFmm2B83Z8bR01Rtt5I8ik+lOwRqkpdRHIawMi6/roQamozWgqce1pGBpaOnNgUPXB87m3Bx9DIfCaJ3fayuK4D4SttBNfBSe4yMD3aqCJSxq0cB4EXeq2Cgk4k/SOSZ4zCbb9OWmYY9/BbNN9wHOThM/F75So9ESpFny66vS2dk022JzVqmRB2ZOJfgTfKCt1dNws2el9BLaxRhmzXFrLvWmBRyy3ELr4aH4weYkTN+wjL/cj0PlOJmOjfG0OCJBB2NbwdaeCD1sCQjzzAjgNu3MZjIwH4UEhDU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e73d7f-9dc0-4037-0885-08d73aad928d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 13:55:45.5196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hc6SQAo0ptW1Zg77KQIHKsu7buYJB0CKRbr49TGlKjkDfD7iJMfo4aDXWVi8qzWyxo2FpG8GBT5nKS+rQxLpV8LCU0S32caD7ma9odcfx+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2604
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent/Kieran,

I need to upstream a driver for a display controller that within its regist=
ers memory region contains registers related to a PWM device. The PWM devic=
e is for controlling the backlight of the display.
Ideally, I would like to create a separated driver for the PWM, so that I c=
an re-use "pwm-backlight", but since the registers for the PWM are right in=
 the middle of the registers for the display controller I would need to ior=
emap the memory region for the PWM registers region twice, once from the di=
splay controller driver, and once from the PWM driver.
Do you think that the double ioremap would be acceptable upstream?

Kind Regards,

Gareth=09
