Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DB520CBD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 04:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgF2Cte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 22:49:34 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:34748
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbgF2Cte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 22:49:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC+wdMeL6KxPxwW7anJIJ2NFmH6ai1Iqu32imfqnLoBmCt1/74cH8HwhmIKdOnrOBqB6svJ1kU0zamxVL9giIuDiNHtv7kB/w/AykK6kb8tiAt4u4ZdA+uHj16E5qBWgNpkiSM1Av1t6Z9Bg6rxwA/NME7qr2Rjc4a66IVLsWnXRWb3O1JJr2XcvPPXzYUTMtD9wtGSuY4xb5zNCPxjunyOu3rxgAnGE3KU+N2+uza8DKK/ZNFhyozbke2YT7iJMhgVfi3V38J/CSzHOF9ROxsok0nbtsM17noigtR/HFiOBqBor5AOXd0D5QQyw5Hl6V3hRHnYW0U46PFU2J/88CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE1V1JHUxciUnSqOxiMQ0Ld99J67xsUFcnbEWx7VBXk=;
 b=X/Q73dzTvTE/RWHmqhcdssOWny/MFL5MikPW1yQLpsDsF/biuRrU21cu3d6iFDBrRD3B9dlCpCWfq2cqFCb8lded63UiVhHHc8DKAXCxndLLjaIf8ucm6r1gFw6SmCbMYGs4YCkZlZqExkTWH0lI8TuXAtkJc7niL8XPreOPDwm9Bksz+6HQV8cJEtNQ0ipeCMYFtFXGlTGKQKSNdktPzhdwWSO76eEREi2ldl//ZdWaLYVgrJaDh1rA/O36QiJtbc5DZIee4sfjeh0U7wrvNc/GPq70IwnSRxJEcx0MvLTSJrfQuLrY328I4aRbfPCwrLYr4+OD3P6VQauGQEoXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE1V1JHUxciUnSqOxiMQ0Ld99J67xsUFcnbEWx7VBXk=;
 b=WO+QZ4pcq7m8obCi5qa+KebnKVygDAoQNspHmYMBe0crIwPcy19X+6/wY0dzZgISn6ajigKKY7qm+mLSLjGgfiHJEIxKJO9gdl0zzOLvKScu99cmhHK+gkOMlE49zM+7tVgwY/UCliQTZUtnq8TxOAtlr5hu+4hI0qL50EN7nLM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4221.jpnprd01.prod.outlook.com (2603:1096:404:cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 02:49:30 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 02:49:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
Thread-Topic: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
Thread-Index: AQHWS5y2P9SOm+4ShEmD+FQrAiQE9qjrAYcAgAPlY2A=
Date:   Mon, 29 Jun 2020 02:49:30 +0000
Message-ID: <TY2PR01MB36925C9FF9C023C9FAD63D13D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626151342.GF5289@sirena.org.uk>
In-Reply-To: <20200626151342.GF5289@sirena.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: efb09d15-6652-4777-ccd3-08d81bd70c37
x-ms-traffictypediagnostic: TYAPR01MB4221:
x-microsoft-antispam-prvs: <TYAPR01MB42212410969BC37D32DE6777D86E0@TYAPR01MB4221.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDeskdBBfwKoWd/C2XIKqM5vbne8B4vRs4lL1AeaifgdC3V8/H/oZF5o8f05YRqscz+s+3/bie1XTkPkxAGfTge4p7ZuQvzYTYZuiHd9RWmFyS/hB0MI+kjQKeExWodb20OTsBKqaZ+RulQtyZ3dty26iZ4ll/nqcDpubVWX09b2jWyDkNXc7tILXYo0+07fbApmHqs9U97sdvCyo9vGNNlvR6nZjNgDGC2r+Oai2woBkjv5ZmHJfggz1kCGd9OLTgcQrZ+NeZ6w5bK2vGdpAucNbcBZq84p2Y5eR89wq3CI+2VaZ2L3xfZcYCXVN3Yv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(26005)(6506007)(55236004)(8936002)(54906003)(8676002)(186003)(2906002)(33656002)(52536014)(66476007)(66446008)(66556008)(66946007)(64756008)(86362001)(5660300002)(4744005)(316002)(76116006)(9686003)(83380400001)(7696005)(55016002)(6916009)(478600001)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: g++oz9OeQigpgZxDerU33vauhqfaLEgHn6AEEOcY2GWTHw00327o678zOBl/9u9vy1qoFWAtIIUAqW4+p0zrRGljAAydJNwpv77VuFo+2n0WmgFvrho7SKh2w8er85HWGDPu/PeMnVj+M5i15p38TrbG+5kpCcuaU77j0M/Lp2Wy25a5jDQ7tJeuDZWgZIYe+3sb+ffL1+okuDubGC96ahJNUyW7b68WVSlruI392+oJr2sriTxCUFajHW+hC968txi6nYIc2CaRH2uRxvbYNY2EPfhrCkxk3YTb/RCKpHXeLOpuJNcw7CpYkbEdF624PWwVIxl9GXJam5adSxyW9zxgGSauTZdvcBXGoX2z45Q4QpS+OBFLzYRKUAWSIKkWwNuhOvelQkw7ZMOBgRYvvl0ryA3sfEgs9HuKI5nvzPtM2YP83hz7sg/XXJjG3hw5a67Frs3ead6zB9/FIQm8MurISB1xv724y/toJIzsmPd2HabO621aPxsKYpHfaQnX
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb09d15-6652-4777-ccd3-08d81bd70c37
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 02:49:30.8348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDw5C5sN6f6uGPgKvIlqQhJhFBaQkY4NJWKtjlzwb5//jjBJ68fwFxFtOfUzAOZJGR0vW/dbGqNMBoOUQaW2jzSPhHN8feUXgtjFQC7ZYEjIJZQ/W2hSa3IOGBYmJGz9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4221
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> From: Mark Brown, Sent: Saturday, June 27, 2020 12:14 AM
>=20
> On Fri, Jun 26, 2020 at 06:32:21PM +0900, Yoshihiro Shimoda wrote:
> > Note that this is possible to happen when the regulator-fixed driver
> > turns the vmmc and vqmmc off by firmware like PSCI while the system
> > is suspended.
>=20
> This is not a good interface, if there's a need to query the state over
> suspend then we should query the state over suspend rather than trying
> to somehow shoehorn it via the runtime enable state which is going to
> break any other users and relies on the regulator driver doing dodgy
> stuff representing the enable state.

I understood it.
So, as I mentioned other email thread, I'm thinking adding a new property
into MMC is better.

Best regards,
Yoshihiro Shimoda

