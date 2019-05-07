Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94231607F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 11:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfEGJRV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 05:17:21 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:20625
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726824AbfEGJRV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 05:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qTrQJ/Q34mEUbcNc2+6OxdWHpu9YjWZHxyTd27UTMY=;
 b=Jx83/KmVKv4n7QMmxusBr4hRZIZ9W5eg+SSK/A4vzKWTo2u2lXZVKfed1XsLd+olEb8wpo3sdqttLwHNSm9cHrTuEmRgB6EVczdEFxzmtkKcCMSduv+xjCvT1Afu3vB8YjNOJK2fq4HZBWucIUF/YdqnX1LxycFJ3rXv2gJiK8k=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 09:17:17 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 09:17:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Subject: RE: [PATCH 00/10] usb: Add host and device support for RZ/A2
Thread-Topic: [PATCH 00/10] usb: Add host and device support for RZ/A2
Thread-Index: AQHVBGYHqBe7JTZ/4k2vKamrKGugU6ZfYQSw
Date:   Tue, 7 May 2019 09:17:16 +0000
Message-ID: <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c51c267f-b69d-4c08-2bb0-08d6d2cccd4c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3174;
x-ms-traffictypediagnostic: OSBPR01MB3174:
x-microsoft-antispam-prvs: <OSBPR01MB3174E3D2D70EFCF0D2D88299D8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(39860400002)(346002)(396003)(366004)(199004)(189003)(76116006)(6436002)(4326008)(6636002)(305945005)(9686003)(25786009)(64756008)(66446008)(73956011)(229853002)(66556008)(66476007)(66946007)(11346002)(476003)(7736002)(4744005)(446003)(86362001)(6116002)(52536014)(74316002)(3846002)(316002)(54906003)(71200400001)(71190400001)(486006)(6862004)(6506007)(99286004)(66066001)(68736007)(102836004)(53936002)(76176011)(7696005)(55016002)(478600001)(81166006)(81156014)(8676002)(14454004)(8936002)(14444005)(26005)(186003)(6246003)(33656002)(256004)(2906002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3174;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qDl3W9fa35g7ubNRHL7NJ8Cv/MRtDTXBNRWjMexuPLXSVvi3/WSa+MJRDwNiudQ/CbouxAm+RuApf7u0i22/fB2WQhX4XVM5irvVaqbFU7DrVP1dGF/fMUB08srx/6OV/o8XQvCyeFCY+1z7r6MiN2bSRUUhsNyTfakCrumu9AKGN4TK2fAUNIUzZ4RvhF8t03xwUQPzABKA4pqvFqzet6fnjx3UYcU72xo0FWXZfFk50bA0B0YxRFWTCyrPd1cPNOqqa5X5OzCa9ffGoqXBjbQGh67sRCnSaCSCGqgN8t74dH1XtF7QLeDV9cnh//zT+OW4j5DlGhOjQSzY+Cyu+0n1+a5zmlxuhP54z0GKLCMbUyzdcQ/9hGKVVD6EsoztT4gqDSgu9TzFihRhSlHwCZ8aXewrjicUy1onEvT3R4o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51c267f-b69d-4c08-2bb0-08d6d2cccd4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 09:17:17.4343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3174
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> For the most part, the RZ/A2 has the same USB 2.0 host and device
> HW as the R-Car Gen3, so we can reuse a lot of the code.
>=20
> However, there are a couple extra register bits, and the CFIFO
> register 8-bit access works a little different (weird, no idea why).

This is just my gut feeling, but if we set the BIGEND bit in the CFIFOSEL
of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the original
code work correctly?

Best regards,
Yoshihiro Shimoda

