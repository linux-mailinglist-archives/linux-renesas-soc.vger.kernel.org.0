Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724EA1CB154
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgEHOFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 10:05:35 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:56192
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726636AbgEHOFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 10:05:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5hrOo1TNjVkDhUuLJlL0LGhOo6mF5DJoma1I4c6NEg4CM4w3/ubA3Glm2bBQ50fYhpjS9iKHKObDGqI0kfepvZSqayhkgAefyKLtIPYYYBw2dcFKuRy1GPy3JMnA+ILmhow6rdmhuJ3itmhXCm0BYUc1reEXrY8HC8sbJ0EeFM1Ngkd3TnRqFeimux7DXg7YfD7xzM65YJ0kajT2fxX2AYolxQQwE8XmZRpajditu/eQxkHwO+PTuEi+Y154T/WXTZcZlrAcJGjx75EP803QcKk4eNLwF7i+pBFF62OO/Zg8MDvSSQFQXXJJCOAnUX4Y7SywIC5Dlupv6YsFceoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73UAbxvIQ/zltDgHGLYuMD5XJwwaD0rM3z5BehbO7z0=;
 b=XptBhYBEMsYEyStj9rMNZbcOZptoz6wKrvFy561Q4FWwMSS5yDqRNvItAoOthKeP1JyHOKZQjc2n2pDPzzuUrl95kR5f8FdAiaspCCu9FgCD9jroNPIZucbMMkzu3YYk01Vt8k5F6daQmCkjqRjQ7bUAoYJgMp8YA1qW1shXoKosj0FAukJuXJIDjQHAD/x0/W+GscvzjpcXQ7Z8bFKxOID59ZB/4wyqInR+YQmI9/zZvcFoLrKX2pkkrjfMvg7AmV5wlO1GIm6hv4aHbuk1iVyrh1kot40dDhY+Xno3AhLHCAxr5bNfT2dZZftHlxdAJk+M0gIi14z/gC5ZCyGeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73UAbxvIQ/zltDgHGLYuMD5XJwwaD0rM3z5BehbO7z0=;
 b=DoEujcH1a7qWseTzLxagYV9djwYaIlDL9dzW92V//JAUz/tXDVVt48RqbrPBu/aPbG0tHs0VbfewueASSQntHOnCfxfPOfO6jiRQkcuBUd3lu7xnDmFjakibjq1eymS8jchDdy093N3H+BZaahcoLU6FCG5US7Vthc/xXKcXS/M=
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com (52.134.237.147) by
 OSAPR01MB4052.jpnprd01.prod.outlook.com (20.178.128.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27; Fri, 8 May 2020 14:05:32 +0000
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::fc6b:d284:8f98:6fad]) by OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::fc6b:d284:8f98:6fad%4]) with mapi id 15.20.2979.027; Fri, 8 May 2020
 14:05:32 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nicolas Pitre <nico@fluxnic.net>
CC:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Thread-Topic: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Thread-Index: AQHWJEZM/vFSZcbEBkWB3Jk0Kwh3Paict0cAgAATqoCAABBOAIABWCcAgAAEhUA=
Date:   Fri, 8 May 2020 14:05:31 +0000
Message-ID: <OSAPR01MB2114FB6F10EC904F19363F9D8AA20@OSAPR01MB2114.jpnprd01.prod.outlook.com>
References: <20200507080528.547-1-geert+renesas@glider.be>
 <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
 <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com>
 <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr>
 <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com>
In-Reply-To: <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZjkyYWFiNzMtOTEzNC0xMWVhLWFhNjMtOTRlNmY3Njc5M2FlXGFtZS10ZXN0XGY5MmFhYjc1LTkxMzQtMTFlYS1hYTYzLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iMTA2NyIgdD0iMTMyMzM0MjAzMzAzMTkxMDA1IiBoPSI5SW43RWNxaFhGVDA3akM2b2FUZS9FMVFiUzA9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8ffb197-6ff7-426c-3547-08d7f358df02
x-ms-traffictypediagnostic: OSAPR01MB4052:
x-microsoft-antispam-prvs: <OSAPR01MB40520AF644C4561ED8BA5FAF8AA20@OSAPR01MB4052.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0poEUyTjEZ5Msd9VBKenBNDO8O6ho+AwtSIJ9DJENAwfUYgcW30bXKuon+zuYrgp7sANGo3kAJFDaD332iI2szJfsRPGHBVgwJlldokPav5pzKAaCzpP4X5+ghyxCBpKUstcrA755LqGqXuqhl3d8vc+GpTHSrq1WhmoKiKk3a9p1VfEe1/SyPH+io8w22tmYM32wDs9fi2XWNGm7BgF8GuQpSZBTogoU3hL/z2Uu3lQkO2cEJULguo/sC1MHibyCtyH4MXbXrwKeOj0jFjPoQEgwWf7pJhEoYgftQsZiT2E8bBRoml5CwiYzqIYGni2wm53eJNFpIeCnDvJiUx/R1KbFLhlkI3+sXCpKQXdSc+mtRRxAtFSS4fF7uQNcxk+hT92Dflqckcw5whSoXp0FLqnbcqSJHwnPEwiyc38YQ0tzyCE7L07yX4CgzTdtHD+bC9fC/OX5zMtNBiTVBFOsMOTmyg+B8sSZL/XIUEM1+tkhepQI1aidU7BNdq6qTI97cMA0njPWj6B9Z18VqGdgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2114.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(33430700001)(5660300002)(9686003)(4326008)(64756008)(76116006)(66556008)(52536014)(66476007)(66946007)(8676002)(83300400001)(83290400001)(2906002)(83320400001)(83280400001)(83310400001)(66446008)(33440700001)(6506007)(8936002)(186003)(316002)(26005)(55016002)(478600001)(110136005)(54906003)(86362001)(7696005)(33656002)(71200400001)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: m3/fSxIQ8CNxea4Lv5HcYvxRzTiboOrCRv8hN8RclRpkdUWUGcdnGszMU1fpEcrABmsEElzTr0JJFxAMVo+UUx5S37bSApaPiSspcVKy/xQhrb9dyP6UfEA/SIMJY54xxDWQTOEpfvfGPYSNcrFFxMTgx9x7onN0aSC94iR8u6OKleAvHB6aNl7jl+PTOueGbjlYXOAsWRNkDf5kHPAHF17QhYtbgGAoz1bYKjXtJO0O0u8YWefIJEnL7iU/GKn3sZp7Qpyfjxlwerf0gGxpgoOofhT2y2PSRdfDjV95hK2P8dL1C84jpuB8TnqMATQSJzmsCFUGerm/KfjqLzEPm7FGvj9vTxpMkZrKSc2pM4bQtAdXR9ytw9d6RdC4BnGIy/+9ioWu4WhK5JKgBbsdBPje7oW2oJLQNDhvTHuvhNguQAdJbE/jHZO71gBlXMP5hMrWj+vXaulag/T3UE9zasvPKsUQWfnPj8Oo67FG4NU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ffb197-6ff7-426c-3547-08d7f358df02
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 14:05:31.9320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89QSMDZe7wedFrs65OckXf+T4BY+IQZVo1BYs6zszqNrlpQyxXd4pP6uvJin3bNfHWcRQHIdryAR8wZ7ipdOFYHAoBjp11lncWQqLIjyjdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4052
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIE5pY29sYXMsDQoNCk9uIEZyaSwgTWF5IDgsIDIwMjAsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4gRG8geW91IGhhdmUgYW55IGd1aWRhbmNlIGhvdyB0byBpbXBsZW1l
bnQgdGhhdD8NCj4gU28gZmFyIG91ciB0cmllcyBoYXZlIGZhaWxlZC4NCg0KQWhoLi4uLkEgbmlj
ZSBoaXN0b3J5IG9mIG15IGZhaWxlZCBhdHRlbXB0cyAgICA6bw0KDQpUaGUgYmlnIGFyZ3VtZW50
IHdhcyBhbHdheXMgdGhhdCAiWElQIGNhbm5vdCBiZSBtdWx0aS1wbGF0Zm9ybSBieSANCmRlZmlu
aXRpb24gYmVjYXVzZSBSQU0vUk9NIGFsd2F5cyByZXNpZGVzIGF0IGRpZmZlcmVudCBhZGRyZXNz
ZXMgaW4gZGlmZmVyZW50IA0KZGV2aWNlcyIuIEFuZCBhcyB5b3Uga25vdywgdGhlIHBoeXNpY2Fs
IGFkZHJlc3MgZm9yIFJBTSBhbmQgUk9NIGhhdmUgdG8gDQpiZSBoYXJkIGNvZGVkIGluIHRoZSBr
ZXJuZWwgYmluYXJ5Lg0KDQpBdCBhbiBFTEMgYSB3aGlsZSBiYWNrLCBJIHRhbGtlZCB0byBBcm5k
IGFuZCBoaXMgc3VnZ2VzdGlvbiB3YXMgdG8gcHV0IA0KdGhlIGJhc2UgYWRkcmVzc2VzIGZvciBS
QU0gYW5kIFJPTSBhdCBhIGZpeGVkIGxvY2F0aW9uIGluIHRoZSBrZXJuZWwgDQpiaW5hcnkuIFRo
ZW4gZm9yIGVhY2ggU29DLCB5b3UgbWFudWFsbHkgbW9kaWZ5IHRob3NlIHZhbHVlcyBpbiB0aGUg
ZWFjaCANCmJpbmFyeSB0byBtYXRjaCB5b3VyIGJvYXJkLiBUaGlzIG1lYW5zIHRoZXJlIGlzICd0
ZWNobmljYWxseScgYSBzaW5nbGUgYnVpbGQNCnRoYXQgd2lsbCBzdXBwb3J0IGFsbCBib2FyZHMu
DQoNCkkgYWRtaXQsIHdoaWxlIGl0IHNvdW5kZWQgcmVhc29uYWJsZSwgSSBuZXZlciB0cmllZCBp
dC4gTW9zdGx5IGJlY2F1c2UgDQppdCBzZWVtZWQgbGlrZSBhIGxvdCBvZiB3b3JrIGp1c3QgdG8g
c2VuZCBhIHBhdGNoIHRoYXQgbWlnaHQgZ2V0IA0KaW5zdGFudGx5IE5BSy1lZC4NCg0KDQpDaHJp
cw0K
