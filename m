Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA320FAC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfD3Nt3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:49:29 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:15042
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725938AbfD3Nt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KlGZI9LbJj7v1ZC79OXk8337NblloNeEn3yMBRRBdE=;
 b=j7cQUJU8fR7sM2V0v2msrW797PrNVi24163plr0aarUuasMI65gqbJs/nXvCA6YCFHoOwuT/HFd5ifUkMTiPhao2Ubab4Sau54hE144CqxZDjMcqtXWDzJHrSRq7KBlhkT8zoqdC8DxSMfpgUwzdKKUmLVPAMjT1i+QuRUmU73E=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.162.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 13:49:25 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 13:49:25 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Topic: [PATCH v2 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Index: AQHU/04ThImkNB9kiUWbCASTclIWoKZUtrGg
Date:   Tue, 30 Apr 2019 13:49:24 +0000
Message-ID: <TY1PR01MB1562FF2E949141B569DA32F88A3A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-3-geert+renesas@glider.be>
In-Reply-To: <20190430121254.3737-3-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dda09cf-5141-4482-cf33-08d6cd72a83e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1497;
x-ms-traffictypediagnostic: TY1PR01MB1497:
x-microsoft-antispam-prvs: <TY1PR01MB1497C6A02068E12E1837D4C28A3A0@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(136003)(396003)(376002)(366004)(199004)(189003)(478600001)(76176011)(6506007)(110136005)(99286004)(66556008)(54906003)(186003)(66446008)(76116006)(73956011)(66946007)(26005)(14454004)(476003)(102836004)(74316002)(446003)(64756008)(86362001)(66476007)(7416002)(316002)(486006)(7696005)(11346002)(4744005)(7736002)(305945005)(25786009)(66066001)(53936002)(6246003)(33656002)(55016002)(71200400001)(229853002)(71190400001)(9686003)(81156014)(8676002)(81166006)(6116002)(5660300002)(4326008)(3846002)(2906002)(8936002)(256004)(72206003)(97736004)(6436002)(52536014)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1497;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4rdIsCig8ETAKU5PcUH8RqblHGAraRpeXBexSTU2S2RM/uHMNTQG8xTqxBaadFzURMoRfnZ76RDmnZWfjeI5XT1NxdRwmvo1MIqX8iXAIw4MVcJL2+Hx9VzI4XxwZn/UoSBL8hgCIyDQfGfL2vY9tprcIiczyj7t4A4POohk89SnbWYoqvZ9julJlN9ja/KSHajQ1YdvdWHRz6anbO1lH0uaE0wGA6pU3Cn4gyDGn1rY7dVbpWbmar7xNNbw11lmhEHBpzSZ/9MbKESIWMgCQ4oeZcjvYjin034a4C2eDuqKcIwsHaaLoMxi2cUkZd7UjmLRlBpf62va/vrb2A+MAwK6L8Z+0KLzwsUC5fENLS1vKh+b0NlMj8GW3nJ7WF8dvAeEHev6wQuYUmEKZG30Rlymrg4S4tpbX38AZaIy7c0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda09cf-5141-4482-cf33-08d6cd72a83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:49:25.0827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 30, 2019, Geert Uytterhoeven wrote:
> Add a driver for the Renesas RZ/A1 Interrupt Controller.
>=20
> This supports using up to 8 external interrupts on RZ/A1, with
> configurable sense select.
>=20
> NMI edge select is not yet supported.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use u16 for register values,
>   - Use relaxed I/O accessors,
>   - Use "rza1-irqc" as irq_chip class name,
>   - Replace gic_spi_base in OF match data by renesas,gic-spi-base in DT.
> ---
>  drivers/irqchip/Kconfig            |   4 +
>  drivers/irqchip/Makefile           |   1 +
>  drivers/irqchip/irq-renesas-rza1.c | 235 +++++++++++++++++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 drivers/irqchip/irq-renesas-rza1.c

Tested on RZ/A1H RSK and RZ/A2M EVB (push buttons and LCD
touchscreen controller).

Thanks!

Tested-by: Chris Brandt <chris.brandt@renesas.com>

