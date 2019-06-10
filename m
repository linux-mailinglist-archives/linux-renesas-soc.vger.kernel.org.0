Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2273B669
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 15:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390387AbfFJNuF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 09:50:05 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:52789
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390270AbfFJNuF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 09:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxppUPlUEXWyoigWYTJMTn2anvqfGBzKG9bAwWvFSbI=;
 b=H4Ujai3NS2uvtTlnPIW20oi09K5DANtaW49lGgPQMGzW96vUCtxzQmuC8FlvC6s+0tpfaLKmWS8KzzWIjED/Sm66K3EMQ+E9ST7K9Xe5XaLhoHQuAkZcOBwDYU3dNpdJME2MEboum12RI2DY8O/hHU3OXgeSFE53K1MlWaSpam0=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1514.jpnprd01.prod.outlook.com (52.133.161.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 13:50:02 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::21b5:2af4:8004:9f99]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::21b5:2af4:8004:9f99%3]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 13:50:02 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
CC:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "uclinux-h8-devel@lists.sourceforge.jp" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] irqchip: Enable compile-testing for Renesas drivers
Thread-Topic: [PATCH] irqchip: Enable compile-testing for Renesas drivers
Thread-Index: AQHVHRZ9qzcWohEWrUukD5+xq0eglaaU63Zg
Date:   Mon, 10 Jun 2019 13:50:01 +0000
Message-ID: <TY1PR01MB156202FA9531D576608908738A130@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190607095036.9466-1-geert+renesas@glider.be>
In-Reply-To: <20190607095036.9466-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYTNkYjY1NGMtOGI4Ni0xMWU5LThkOTgtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XGEzZGI2NTRlLThiODYtMTFlOS04ZDk4LTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iNDg4IiB0PSIxMzIwNDY0ODIwMTM0NDQ1NDQiIGg9Inc2dEZvTGVoU3FSWEt0TTdhS0t1eWpqUDBHOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64a3e412-7333-44ee-52e4-08d6edaa8930
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1514;
x-ms-traffictypediagnostic: TY1PR01MB1514:
x-microsoft-antispam-prvs: <TY1PR01MB1514A55E8478FD651CF7FC1E8A130@TY1PR01MB1514.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(366004)(136003)(39860400002)(396003)(376002)(189003)(199004)(81156014)(8676002)(81166006)(8936002)(14454004)(72206003)(71200400001)(66476007)(66556008)(64756008)(71190400001)(76116006)(66946007)(6436002)(2906002)(86362001)(9686003)(6116002)(3846002)(305945005)(7736002)(55016002)(478600001)(4326008)(5660300002)(52536014)(73956011)(66446008)(4744005)(6246003)(25786009)(186003)(26005)(53936002)(99286004)(476003)(11346002)(446003)(316002)(7696005)(110136005)(256004)(229853002)(486006)(68736007)(33656002)(54906003)(74316002)(102836004)(76176011)(66066001)(6506007)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1514;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qa6TEb2iFFD1Vir9vXFGQ3loVajTXBs0TN3ddWU2dupr/51BAUGVXxTa/FchOiYphSkEeaGwiCoKs7bGSNnYiRgmOLEa6snvgV1MNJY7pr586p8wy5rHX6aSLHlloltXsRs821IWu9uuHN5tSIw2TnklxoZ50aHL8Cb8fpdqBLjJ6UO0tvEX+NC1K4Cs2czzJlSJfQTYb9u80H2QvFf85zgRMEXVprNJB6v2K8sorMlc9/4ZTa3rwr8KYyPSFiP41KQya1czcfRoxKsIhxXY+LUQrlebQgBbOy6CRNwuaAQphi07H9CBECCl1WIIpiY2x6DTLuXTkgWsPTFuvkmgThzAKJCD2eNDSY+WO4WBRUNLA3fFU0nY+RHXjQIljCSrYZ1cqxWQPl0safWbjZez0zb2v2zIcmDUvzN84xdn/ms=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a3e412-7333-44ee-52e4-08d6edaa8930
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 13:50:01.9663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Brandt@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1514
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 07, 2019, Geert Uytterhoeven wrote:
>  config RENESAS_RZA1_IRQC
> -	bool
> +	bool "Renesas RZ/A1 IRQC support" if COMPILE_TEST
>  	select IRQ_DOMAIN_HIERARCHY
> +	help
> +	  Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
> +	  to 8 external interrupts with configurable sense select.


Appreciated=1B$B!]=1B(Bby: Chris Brandt <chris.brandt@renesas.com>

:)

