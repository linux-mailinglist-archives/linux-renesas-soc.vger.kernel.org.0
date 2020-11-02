Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069D32A278F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Nov 2020 10:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgKBJ5R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Nov 2020 04:57:17 -0500
Received: from mail-eopbgr1320104.outbound.protection.outlook.com ([40.107.132.104]:59932
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728132AbgKBJ5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 04:57:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXs5yw5g3G47AtvQQIzYN/ZWHHfsyZede/Wo5ayiI7XlYUwSukNZW9cJWmUuq9IaN6Xt68Aw7agzhoA7M2U5J65KqSSI+kpH5mDc01fO0+CePa9YqrxIYrLmv87jy6J7i6kUhCCvVd+dKiXgosCYl81I6leRZIVJOY1HJFvrCTB8L4XI2kUh7mj0Go/0oBQuRVhIgUhUlO7nO1FYnDD/+pze1wElbjIVyj0qyA6Q5S/tP8K+1X4KqFn57Rmj5Q+WSJcu5JmJ+CanPnr+RgTWpW20I/NCA0OynoaF3fdMrXLvQBwZ6Sw7WZzd2gK6Q5pO5xVSzg2wFHwhohjLs49WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujxaOV6BFN7xvyD7vRvCZJiqxsa7hoeTY/P2qXG1vxk=;
 b=AX7TbD5W/9FO+NeFj3uufmuRyE2+tQ6iQWcYpEHBnrTcnaXB3gsLql25AvHvsNZT5tYBJ4hOyH3NV0K2mW7LoPIUwWTB3W4YW22N+pfRw6xMGpRC2gVNecJw4UpbM8SvxksLmEpBHV0ZJi6qJ6IyURxuc87OcixXoV6naxfvB/q+qS4StCUI6M27Uhsjb3uBx9u3w8e5WIIdQm5tsaNqTcXRyaw+hbtVWnsm+etgiarNxTkzhN4+5SC8ZqF8SGi0yTebbif/06oCFHKN3mKba1j9L7zvGrVyd5sMdYO0BcYCO5009HuDyN1JPRJbY5QA74wzj6rSQt5ftGGf5Sdn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujxaOV6BFN7xvyD7vRvCZJiqxsa7hoeTY/P2qXG1vxk=;
 b=XK6ouBa8Hf7uBrBv/w6WRMLjBXTqFo9t+v24cysgpHMRrdFSrpIprCuZH8ZTu4ZOc52GCKwZQxl3SFA5UqsEQTg+8Qkpt49r9R4iqEyiUMUgIIsBrumIn/KNF4xaCAJqLG2ldgGelvSISBmdxmehVphdMTFovRJKtdrIJTNubHA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2473.jpnprd01.prod.outlook.com (2603:1096:404:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 09:57:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 09:57:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: disable power off notification when host
 is removed
Thread-Topic: [PATCH/RFC] mmc: core: disable power off notification when host
 is removed
Thread-Index: AQHWoUNC6tSZ/elwUUidYVOSVqoT96mwNceAgAAc+oCABGayMA==
Date:   Mon, 2 Nov 2020 09:57:11 +0000
Message-ID: <TY2PR01MB3692C46098F9B7D5B2CF86ACD8100@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692EB14470C517E771746E0D8150@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFoSd6+i9Od1tmodNjPVG_4GU2YAnyLMs9a7C36SBzn+rQ@mail.gmail.com>
In-Reply-To: <CAPDyKFoSd6+i9Od1tmodNjPVG_4GU2YAnyLMs9a7C36SBzn+rQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5332d2bd-6c01-42e8-fc71-08d87f15ab16
x-ms-traffictypediagnostic: TY2PR01MB2473:
x-microsoft-antispam-prvs: <TY2PR01MB2473370C1CB25F8E60DFABA6D8100@TY2PR01MB2473.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xerAfJ9iAB63kgZyKjF3eoPkrR0kYfti3CjnX3c5ky5Q0/rSnU8PFel/Z5+UQJu8kyT73opwk/Z8WKSJtLtpV+1BS2D6s9xTIk9bYRWsbz7sJZdrFj4Thf2qx8cynSPvYg1B7O257o3NGjCML6d85lldN3xUmUJkVPKX2yniL1Db/V7dqYtnYWW+se2Uvu9gR7Kne5oxLisPRJqMAkNZC71FCZ6o3IkvGBvQSoX6pg8y2f+fZdnvx7m+7thEgKqH8hoo1dbJhlnSLk3nymngl2tNBl8itU1cP3yQ2J7qxVV41lffS/D+Xl/T3vM5iw8lu3o3v9mpe0iUxxwmMVYwNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(26005)(83380400001)(186003)(6506007)(76116006)(55236004)(71200400001)(54906003)(316002)(7696005)(478600001)(8676002)(9686003)(8936002)(5660300002)(86362001)(66446008)(64756008)(15650500001)(52536014)(6916009)(66476007)(55016002)(4326008)(33656002)(66946007)(2906002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WKf0aKFfroGuhWKUG8phMgcisd3nHM9o2dVLF2I0e7XJ+hkqrWsGD190e3NADulto5mx7z5wakxK+lnjiGVdOHyynT8T5/Hh8/9Uyk228tQVw37hIND7Gz0aX9mZcTyPJylRRkRIE+NXCmHYFbXbWx43fTnvhzHJTx+oChIttBE3mIE62LL3XAMl6JYlfdyqeooP+kUEFos0HomlBYKeh1xeDKy8eEbpFF3YVSV8LtLDBGBkJLqZgYsQ2TgohQ8gW6MVYK4cbAyqU4QuLESAZiAOJIreZNybUsf5d4azxqSjuKLASgJIbDagUmFJxNPZ1f8pprLDVU/33rcW1iRV7Id8F+bHAEygUO8/2Wpx0Nwl69k26zM80cTz197xgo49leKj6z6P0P44p0x6yHC+bVTVAySf3wxhcfc/e4FrsDeGaZ0715nb+TyIpA1slR998rBZoI+lQwnAAu7aU2LegQl4IFK9MiOr2h4imSQua+OrW9p5hs9rXC1m62DoK9N8bbkMJpcDfGV79lg0wR2Mq/xz2x4scYGoJb8gL6jVX+DdVmHmojQUyuzmpKqUOXsmwhYHkb8S/aoZzJCYk9TwbI9DErgl0LRSi66X8gOjs7OZOx1+s1vdeGGwblIndXlHNbndRIfre8QCNkXBYvqvIg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5332d2bd-6c01-42e8-fc71-08d87f15ab16
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 09:57:11.3007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDh2X0NaiwUwHV1HSieIn16+Ie4lUNAkvgG/LuNfRqAOMLbVUgLTbc5IK83xQ8furZy243OZU0klAUryNEXEqXR3Wupf6EEsiHEbZsvW4uV4VwlHOxxRE/Z90mso55I4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2473
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLA0KDQo+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBGcmlkYXksIE9jdG9iZXIgMzAs
IDIwMjAgMTE6NDEgUE0NCj4gDQo+IE9uIEZyaSwgMzAgT2N0IDIwMjAgYXQgMTQ6MDIsIFlvc2hp
aGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBIaSBVbGYsDQo+ID4NCj4gPiA+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBT
ZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEzLCAyMDIwIDY6MjkgUE0NCj4gPiA+DQo+ID4gPiBVc2Vy
IGlzIHBvc3NpYmxlIHRvIHR1cm4gdGhlIHBvd2VyIG9mZiBhZnRlciBhIGhvc3Qgd2FzIHJlbW92
ZWQuDQo+ID4gPiBTbywgZGlzYWJsZSB0aGUgcG93ZXIgb2ZmIG5vdGlmaWNhdGlvbiB3aGVuIGEg
aG9zdCBpcyByZW1vdmVkLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBT
aGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+
ID4gIFRoaXMgdG9waWMgd2FzIGRpc2N1c3NlZCBpbiBhIGZldyBtb250aCBhZ28gWzFdLCBhbmQg
bm93IEkgY291bGQgbWFrZQ0KPiA+ID4gIGEgcGF0Y2ggZm9yIHVuYmluZGluZyB0aGUgbW1jIGhv
c3QuIEknbSBub3Qgc3VyZSB0aGlzIGlzIGEgY29ycmVjdCB3YXkNCj4gPiA+ICBzbyB0aGF0IEkg
bWFya2VkIFJGQy4NCj4gPg0KPiA+IEkgd291bGQgbGlrZSB0byBkcm9wIHRoaXMgcGF0Y2ggYmVj
YXVzZSBteSBjb2xsZWFndWUgZm91bmQgYW4gaXNzdWUgYWZ0ZXINCj4gPiBoZSBhcHBsaWVkIHRo
aXMgcGF0Y2guIFRoZSBpc3N1ZSBpcyB0aGUgZm9sbG93aW5nIHRpbWVvdXQgaGFwcGVuZWQgaWYN
Cj4gPiB3ZSB1bmJpbmQgYSBob3N0IGNvbnRyb2xsZXIgcmlnaHQgYWZ0ZXIgc3lzdGVtIHN1c3Bl
bmQgYmVjYXVzZQ0KPiA+IHRoZSBfbW1jX3Jlc3VtZSgpIHdhcyBub3QgY2FsbGVkLg0KPiANCj4g
SW4gcHJpbmNpcGxlIHdlIHdvdWxkIGxpa2UgdG8gcnVuIHRoZSBzaW1pbGFyIG9wZXJhdGlvbnMg
YXQgInJlbW92ZSINCj4gYXMgZHVyaW5nICJzeXN0ZW0gc3VzcGVuZCIuDQoNClRoYW5rIHlvdSBm
b3IgeW91ciBmZWVkYmFjayEgUmV1c2luZyBfbW1jX3N1c3BlbmQoKSBzZWVtcyBiZXR0ZXIgdGhh
bg0KbXkgb3JpZ2luYWwgY29kZS4NCg0KPiA+DQo+ID4gICAgICAgICBtbWMwOiBQb3dlciBPZmYg
Tm90aWZpY2F0aW9uIHRpbWVkIG91dCwgMTAwDQo+ID4NCj4gPiBJJ2xsIG1ha2UgdjIgcGF0Y2gg
aW4gbmV4dCB3ZWVrLg0KPiANCj4gSSB3aWxsIGhhdmUgYSBjbG9zZXIgbG9vayBhdCB5b3VyIHYy
LCBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheSBpbiByZXZpZXcuDQoNCk5vIHdvcnJpZXMuIEknbGwg
c2VuZCB2MiBwYXRjaCBzb29uLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo=
