Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19962AB5C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 12:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgKILEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 06:04:14 -0500
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:10407
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726410AbgKILEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 06:04:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAwP+iAyYRyONjnqp64gTckQuEkoT6DA4Pcb3ki+XJxKhH6z8mAWA1fFk+l+sKhbW9pIA0IdLIeO+vvuLvBB2Ifk6Z4fYIt/M9uERLe7kqF7hxYgweVp6D+cv/hArdab+ovEC1VPdMTqdkEW8f2YFkyFkACXdzCowLAzPsgLUP+EJL4QD/zGwz207BPQxoUkg+4FDXJHNRPmfSgdf0rsKioGZTCsAmxydAIRukMrGMwU86VNX95NNcUnKhiqwr1mvZPfGS+LcW5jiV4K54sZg+qUaiADRDVlvsirXLop/UbHzv9dE4xYfC7t7VbkJq26+tHRBjOAUL5aFPcVundBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT/2UU/kI0hZo2JOJUuTng+C9/bJVGWCC6P36U0+MO0=;
 b=gSOw6Wa4nYr4gOZcnSskUzifdVPk55/QibgbCD8jlLidIr/FxR0G//2HycyX9Vvq+ci57kpdGiwNrbbhIYyfbcGjYD5h2vhGhpd5lJLTovzSsY6RyiAyc3O77+RZpejlrBM+bXvLygOsCsArI4ja66oNIjKwCAs6z+T8aul8J6aUN7Pgn8X0V02ZTl/5mZpe3sNNBkZBEeEj6drGyfOdxTwKqE2BqP70AmEJqusOh5mn45el895bKZeOSJmrwujqyFB5GXF1TOrOC0ywlE/3p0zEZJ1EReZ9zvkm/If6ix9DbCHxxQNl+s35uTVJN2ExfEJDyBYVU5qAX8dFvOwEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT/2UU/kI0hZo2JOJUuTng+C9/bJVGWCC6P36U0+MO0=;
 b=mwqjGUn5afarimnqB1dSgWNqu4wbMomKUB2KYn3NdoMvJruDLmTrz/4MeuvaThOfZ7aWVd1bzrbkITPQqjwTKM8hP0D4kX8hLrtNhMBk6/J/Zvz3hL2Q58hTiy6opmyqm/OR3QTD1E8TNWO2mPo937z0EvG4xsZbpYyk/JRGeh8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1550.jpnprd01.prod.outlook.com (2603:1096:403:10::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 11:04:10 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 11:04:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Thread-Topic: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Thread-Index: AQHWtA4TAWUl3m9Gd0eEGY6K6vgzEqm/p2Ow
Date:   Mon, 9 Nov 2020 11:04:09 +0000
Message-ID: <TY2PR01MB36920908759ABC8371448370D8EA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6e52acb-6b61-4d20-7579-08d8849f2f46
x-ms-traffictypediagnostic: TYXPR01MB1550:
x-microsoft-antispam-prvs: <TYXPR01MB1550E865BB46EB0B8E907B6FD8EA0@TYXPR01MB1550.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CBljZZ+CpZ9sLx22dINAPEexLaaH9Q6IIGPg8y96w3o7lGZwn6KIPeqw/7CpdK1AquOKjk7voh1/YQGLfOy16aHQhhUqr4VgDc5B7NMLepYUB1Ku3aut64F+lT3gWNzPhQlC0ky99MNnPtnO3j5RKOHPkTKkieAna7pC6otcWEp7eqAP2qDjPejG8B2fXtH1NGoRHPtJmrBuAtgCtssQYA8ms+t28n02M4xvm87cXwhiPvItCandAdGGnePwJ+6wo5hFU9Mdvs6JoGv+IRD+al0ybR8YJ0lwP7mKLajJCQj0Mbk6Qg8pNYR43KXLVKoClubT/RX0V3dCmHcoohzeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(26005)(9686003)(110136005)(71200400001)(33656002)(4744005)(478600001)(7696005)(6506007)(2906002)(55236004)(316002)(66946007)(66446008)(8676002)(66556008)(5660300002)(64756008)(66476007)(76116006)(8936002)(52536014)(186003)(86362001)(55016002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lqjMVS/RCQUJ8GAHAjmqlvqzVLbkuigT9aRWWBLoqWdGIYP19+tekA/VHj3NhHsweJGK+AN69mjUNqNINdsTSVTL91CB15gYEQER96RHMgbziqu3qednRqj8xyJVWUdxvob2MKCzcK8QwvmmGzeAIWuFTX1Yo702iBpBYUoM3izLdXuiSWPidkE01LAO/nUCAuoiDZ1KwEnsqgbGoaL5pHSXPeIyh26913OMjIBjKNhfZyGfnu3YBgY7NWgQkNCr35tcibhzD1+EcQYykTDolojCparKBcMLhtK+Izc3M7UTY/aDGpHJ+ZluGmQJyPNua8aJs0TU9fIGFD85M+rYEt3MVr99R3rVlwHa8Yl7sHKtkpMhZGlf/pjSbovSAaBejw5paATyAO350XgbgV3ZcXDGnuJUrgGjq+FRJiIbRMMB/fcS/REkUNirJ23wrCa3EmagijAi8GBDA0hylpWGo6E6Q73CPVM0VsZMA1aEC1X/NhjPnX2JZJcSKosuB+Wnk6D7BLqdgeOwDACEYoci6NBRRAAiHGRy9DWKoN1yU8uewFKqSgC+O7OPsNzTC2dzjrmBBEj6PTIZdYTzzk2kpBWc6Efso7VKXdqT4QDheZZa7JEzPzRBbCIALvisDW8xokpFiEHGn2bQ21jtEzxK8g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e52acb-6b61-4d20-7579-08d8849f2f46
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 11:04:09.9379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQFtU/4vIK+TiNEpOSRo7oIqVpLLc3/R4nK2KwhgD930qFg8KewHJyWvn0gzdTeWqB05OgqLCKirMjJ1ZDukZCDht/vHuPkBvh6onxwD4bUxodfywZvLTB4SIcfebqpM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1550
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, November 6, 2020 4:26 PM
>=20
> After some refactoring, I had to insert a workaround because a
> regression was discovered when re-inserting SD cards. Now, this series
> implements the proper fixes and finally reverts the workaround.
>=20
> This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
> were already discussed with Shimoda-san and the BSP team internally.
> However, I'd appreciate Shimoda-san's tags be given here to make sure
> the patches are exactly that what we discussed.

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on the R-Car H3 ES3.0 Salvator-XS. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

