Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DC02553CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgH1Ebw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:31:52 -0400
Received: from mail-eopbgr1300132.outbound.protection.outlook.com ([40.107.130.132]:13696
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726330AbgH1Ebv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:31:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3OpfLN6jX5COuo4k3KqI+/VFCVobfMqhTEI9MlWmUS9ARdXC6YpqXItCbSik1euw0F9wxMGqlf3j/G+Hwcu++ZPLauRHkAGj3h7wZuXAxkOh6ArMytPEX4gDoA7WXbi3nb+ydRYDChDE5BZQswwYPPewe5Vq8ROQxASOX+5v3wHp/upXYkVGAd37aoRxcUeARRjzccy8MdvUQRyatE2tQQYSjUKCCotrsI44XkOSdAJiiOd4spwjnUI6AFQBVZqf2leqCg5997+J4YPBW6/3KG3EDs1kK0a8chkWOZZQjlXb7WIw3RIuMAQ9hQ7+fUJeKNwY4Y3hnFS0ODxFVoE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM3popjzFVCjLqmkmRT0hsxcJxCzrcVerMqwbxmJJto=;
 b=HS9iQyOGOAyFJXY6dWv/XrTU4hwn/ubpQW0b0jsCDd6mo28QPmSgUo2GCmRCn/tJOvxds60LpL4vMQWKLAhwJ9teKvQIBx6bEBL7sS03zizSfmufan/rwkQIqwCNfiouts7n3N+qJylV9QrWMCSW+KLtiRG6OmoD3U8LC88tX4DlTjIVpp4UerH9vTGM1vgw1cnTq8ctwLz3YlK0L7xC9S2U8M9jUi+UnONKduSaozef2okTwSUZSCtlih136pEdlrl7qbTusUzKmfU5k1/P7zoiCxGPeFsPWV/mqkUEovP+8070yhJNR+xHbyUuO+w5w1z3oQ1MOlY32VsxkmZbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM3popjzFVCjLqmkmRT0hsxcJxCzrcVerMqwbxmJJto=;
 b=sgCOrTRfILe5WuTq2hoRP98hc7xgatiWAMtbeHpbGIJF3RYV7rJgIAeg3EaD4YVtkyUq9mXMCJP2KgWuYWGOJWxfLhK6Gb6EC5ntyuP/XjJBlB+BzQdFjCggjta3njPWm9PEZM2GtTuK6FUs+lTKEY4LMq3QYU1pyvgndUvLfM4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4507.jpnprd01.prod.outlook.com (2603:1096:404:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Fri, 28 Aug
 2020 04:31:47 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 4/6] mmc: tmio: factor out common parts of the reset routine
Thread-Topic: [RFT 4/6] mmc: tmio: factor out common parts of the reset
 routine
Thread-Index: AQHWdvVuQkk6YF+kgEuiYS/gF+gAbalM+SHw
Date:   Fri, 28 Aug 2020 04:31:46 +0000
Message-ID: <TY2PR01MB36920AC4ECE21DFDC16BF92ED8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-5-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0fe36cc-5252-4a59-49eb-08d84b0b4690
x-ms-traffictypediagnostic: TY2PR01MB4507:
x-microsoft-antispam-prvs: <TY2PR01MB450777958E2E61694BC0472AD8520@TY2PR01MB4507.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6GpJCDd0vC59TKzOxiG7W5A+34rTZDdwxOpgahfy5D4RIEisjrbmxmDdXdfa/bvqx2ucWT0ayEpU315Pd/v3TRT3csTfAwpZjojZ5pX5FBSsGBWCT7FzhuhTuSpY8OsliApW+LjyEePXlTEgwCBcjYuPaC92GKQb4YH05uZpaKzSvOhjxRIlOlNcgIA9uE0yNlfsI9B/WfCfCo+O4858qdbAAaIuUuNWxWJTp/9nO4NbiD0L5aXBOnzv60Kf/n9IYBAZRBmmzdvyr+nVQXJ1Wy4VsObNSNf4M3Z47iVqgoF67wbCtIGVahlZ5nOeyHY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(478600001)(86362001)(110136005)(316002)(8936002)(54906003)(33656002)(7696005)(4326008)(8676002)(9686003)(2906002)(55016002)(5660300002)(4744005)(6506007)(52536014)(186003)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Hf2aPH7Auh8aSUezrsCEIw/yf27lHfbWTcACgetN1srkVu6lfHpu2fTslr98+vCpJ+St4qOibt2BG9CozFy8Fx9NaZS/ZYH50WOkEXnPLTs7o5wygC6sYgazMvdllMQ7s3PXe+ct7SwgbwXYy/t/90p7f2LYzksLh5y+jCNMjdAxVsxkD9mn5rcvUL/Szm4tXK6biSaBd01p96vLzIEyjJwFD3EZ/LTYlN2BoSkF948xDLrSKSDY7CiiOubEaF4Pak3R3XH/V5xDbXXyN3F9TasimnjjpMb1Rn/+glx3ETvV2P0z2H3wA1klsA0ILpkEtyMkIvUrwDSVz1b2zcydPKCRxfWTvUk1pMrYZcPnIy6yVnKxO08kVFulOz44Jby5F8/dntbrpq/MiZxO3XGi/E+Jvm1eWOo1P5X7+xuFYTT0SzTH/jYolqzvsY95RhPxtZGCxFENZq99a3sak8XG2QC54FtyaEeq8TQSaxp9iSwxQSyNG3n55Qkf901iKHimr3Cy5JxcdCzDmKsHqGoYDeLvl+Wg0GVmKNlCwKrttIKDagq8rH6MUvhW7XGg37lnZtRfU50jmsxpKRB5nVJNWijmHNn1g38U9QNiRefKuJf4kdRy5olqz6+h4Y9GEqcCTGOhsneqNEIb+TWVbp0MVa87FaMwD7AbWXxROeULE7hAqpARkYd1uXJa9QIN4ZZo9X4LkqQ1Zm1dQqB/av7CFA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fe36cc-5252-4a59-49eb-08d84b0b4690
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:46.8452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m14ehL9ZlBXi/fMM6fV0wNiinriljF8hUp5YDOdA+WNeiE737JT2RBjILoC0RzDfRqkV2pH9qwL/7h7q480KSFqrD7fZ4/+ysyAzEfsRygqPkxEzaTgiaOmrL7JQTYJF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4507
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> Some TMIO variants need specific actions in their reset routine, but
> they are all based on a generic reset routine. So, the optional 'reset'
> callback will now only take care of the additional stuff and we will
> have a generic function around it. Less code, easier to maintain, and
> much more readable. Code in tmio_mmc.c is untested but in my TC6387XB
> datasheet the SDIO part is reset independently from the SD part, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

