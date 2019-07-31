Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5693E7C4E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 16:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfGaO2T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 10:28:19 -0400
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:6069
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfGaO2T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:28:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejuKJeijr8hoTcAwcGcjB353vImjwo4zf74V/YQt4uCZcfDxFtYprxVOEC/4/d4rBquUnkoZHb6Kv3aLOgJfbSaDeMfp1YB8HDjudj/GIJpw87XVdQXFFbU9Iir2dUR8x8wty7cFGHrtIvU+w6eAA7G+0i998m65j67uVsVvw4McYReN12VrfLn8ox85ULgqCV/X6ZxV9OmW78m4vQpMkxzLat0jUhKX/Ze4lBUoEhElqjt4S28ydgoDKVwjRhgXUA4O59AoXCeCpItWk5T9PCJZlh+LUAeCqwMwEUcPpacU7TiufvUBCajGQR32UjE0OksgXCHG6GndBSQxCT0eVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY2vEXaqoG/RQ34xfRV/bx9csl5tB9R8LcluNJSksEI=;
 b=cNZ6C2vk1Zp7EFMEUzDmMgVesmPBhYewpp4zo4l10t4pFQm4tnH4aa6DgMLHWJhCmrWneYwmdnRFXSPwqLwwoivYIdgF5SZCEJdrPtCF73IU6sbp3DE4272EvNZBOvW4OeULtFShixFkDkxLyUWyNKRg706Ye4NQB0w5zKUy2uhL2KvtjsnZCCKTUCEgY9FyrORiNax8VmMCJ8eJuihajclr49uXsAp2C1W3AU6YLdQbfJfwfoIKj0H624zU6x37O3+Cl1pt9HuErYE3Ckjb/7rx8IEnIu+ztnI1VRQes+E4t9cZDCnDl8SRNBeTKqVa7uA5/loSNMXoccUya+z8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY2vEXaqoG/RQ34xfRV/bx9csl5tB9R8LcluNJSksEI=;
 b=a2JUZ03Pel8NK8N3yCNif6ef7AFkMSNJOhqb1Du0Siwzf7cXIudLmlx8I/Fpl4CcLhkQp8h2TF2Lgbxt6wP6qlENygfe4o9NXjrwc/bmZ10oJcKjBxYNyNcISKKhXhhEz8XET0/8b5BV2k5qx9SRo1+Bf62oV4Bv3E0yIhFxHOU=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1563.jpnprd01.prod.outlook.com (52.133.160.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 31 Jul 2019 14:28:16 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::3cb2:b1fe:7123:85d]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::3cb2:b1fe:7123:85d%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 14:28:16 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
Thread-Topic: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet
 aliases
Thread-Index: AQHVR6Vqe9NZ0BXolECcyIIHEKiMa6bkxldQ
Date:   Wed, 31 Jul 2019 14:28:16 +0000
Message-ID: <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190731133936.18228-1-geert+renesas@glider.be>
In-Reply-To: <20190731133936.18228-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNmRhMzA2NTMtYjM5Zi0xMWU5LThkYTMtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XDZkYTMwNjU0LWIzOWYtMTFlOS04ZGEzLTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iNzI0IiB0PSIxMzIwOTA1Njg5NDQyNDQ5MjYiIGg9InRadzZvQVpWUUI3YTREeEJRVUlJdzRGRTNtdz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88f4ab70-a44b-4409-2db4-08d715c353ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1563;
x-ms-traffictypediagnostic: TY1PR01MB1563:
x-microsoft-antispam-prvs: <TY1PR01MB156367003402CB6C8A6F79868ADF0@TY1PR01MB1563.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(66946007)(66476007)(66446008)(64756008)(66556008)(7696005)(110136005)(54906003)(76116006)(478600001)(305945005)(2906002)(256004)(71190400001)(71200400001)(7736002)(99286004)(4744005)(316002)(14454004)(53936002)(68736007)(5660300002)(9686003)(66066001)(8936002)(476003)(6246003)(81156014)(81166006)(486006)(8676002)(52536014)(11346002)(86362001)(446003)(55016002)(3846002)(102836004)(6116002)(6506007)(25786009)(76176011)(33656002)(4326008)(6436002)(186003)(26005)(229853002)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1563;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JCFOZmmoEHEKuyZ8q4/+Ll3BsQE77EG+gMxEYCzhvx5FfsudtGw/ufefAcQIzaZsKl/J5eOzF5qWOF6y3r9ihwICrwDWlmtFaTitDqeDD1IyZe/BqCb/pkaQh8/dBMBlWFtoIi1yNnSLC93cTn9K5bjBjfcqV3811x8dcheh5j43De+BV1bYCETuc+E2xD2JAUrahZe/QGdOz8o+QV4/cXPcGwVHPHTu4hBFtZfXykZ//0w08eDpx49z/Do70i+HpnXdfJNpqqxNbvR9WFNbVr/Jgth91BCQIO9XpbVPiHdP6awudwdiHWNSEof5QiLnWdazy0doZuIvrNnH0R0dKo3nd/7m5QWqvGL9Vp+Iqd7wT2apjvWRoNKPDvIBUxKkKxQ680Luy0VoBkh8bePlDwyrLMFu6j18aivyBzal6yY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f4ab70-a44b-4409-2db4-08d715c353ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 14:28:16.3772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Brandt@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1563
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Jul 31, 2019, Geert Uytterhoeven wrote:
> The two Ethernet ports on the RZA2MEVB development board are labeled
> "Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.

However, the channels are labeled as ETHERC0 and ETHERC1 in the hardware
manual.

So I guess my question is, in general, is the board specific Device Tree
supposed to describe what is on the SoC? Or on the board silk screen?

Maybe this is like "COM1" is labeled on PC motherboard and we expect it=20
to show up as /dev/ttyS0 regardless of what physical serial port it is=20
connected to.

Thanks,
Chris

