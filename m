Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC052948F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 09:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501909AbgJUHhO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 03:37:14 -0400
Received: from mail-eopbgr1310107.outbound.protection.outlook.com ([40.107.131.107]:30624
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2501907AbgJUHhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 03:37:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7IS0Rjj3ZnRkPQLhW0tzaCM9ojThw6iBE2zW4ublN6ACQO+SFU8X4V7JfVwJLsJxcjutKo0oO3OAhAIMbttqoDQEd5ea7spapRfuQ3ZeoruK50KDl3GBfofx+p34CV01BOMZuz7hoywMQGog79Ai8Xk5kCBZCQVdmxlVz8jM1MMxTGaWcr6S17SSoggf3wqswEQBMHLhRm6/7zx74QZPbHE6D9d4NKoxd/1VeMmOSOw8qu3y6bJYWA3PZQ4l9vZoLozhCUzHXQbdCTrn7exXtLfVV507SJxcqn4Ku548MvVvJxaQq4cxuVAvu5uTAArkHdXKkfbZqmdVUarPLcQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJCeq9yTAX1RVHQO9SKHVfDbyhFp9VnA+g2GT+gtPWI=;
 b=cecD1tQzJr7GqzXDl4kKDyh7AhSvr2T4oaHgkJG4M51WOqZKdYvbZJP+lKSaSIJFQaKnQgg2TeMh5BkLHeB2E74tjLmP7oy72gECHYAYWi2l48WC0pHr1eLMi7Lme78JrP847XSQXKiOq1DHNw9fJiFlDMB0JNIOeTxl4aR8TxN39d/Fr7xENJo+ePbJ44IJiBKKGGaBcJHwco27J+UOsLhqhkthXrqIGrqNWiMEyMhnO2p7/IUb2jwnm9xYlNwi5Ef3U1Wt0J1dYhL5KmoReFGOinHgF5nOFLgM7SB0uAMUfkhalYrSxTO60tdu42pDbbs0ULeDE8/0/Ujxw9gHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJCeq9yTAX1RVHQO9SKHVfDbyhFp9VnA+g2GT+gtPWI=;
 b=nF8A9KEOkQPeWSt3YgabMiMwfq2H6C54lldDXbNqgQS6alGN+knjZB4ezvArYkgKHsZHNXQhSQYkTt+UNbu+UvQbmR6h8eogDFz0QQLx7utGGQTqA1rM0HZaGmBYj4jpIrr+Be0PP0rK2aYTHfrqmLGroKf7ME8KaZAKYtkwwCc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2347.jpnprd01.prod.outlook.com (2603:1096:404:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 07:37:08 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 07:37:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH/RFC 1/6] clk: renesas: r8a779a0: Remove non-existent S2
 clock
Thread-Topic: [PATCH/RFC 1/6] clk: renesas: r8a779a0: Remove non-existent S2
 clock
Thread-Index: AQHWphBCvZfYvhm0sUikH0Pu58qfwKmhravw
Date:   Wed, 21 Oct 2020 07:37:07 +0000
Message-ID: <TY2PR01MB3692F43F1DA44C670D4F5DD3D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-2-geert+renesas@glider.be>
In-Reply-To: <20201019120614.22149-2-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:5405:3048:ff68:887f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a8650625-a672-4194-2d75-08d875941d56
x-ms-traffictypediagnostic: TY2PR01MB2347:
x-microsoft-antispam-prvs: <TY2PR01MB2347B15AAC08BA937F85A03AD81C0@TY2PR01MB2347.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQGln3aqmLVnmnLtNwtZBAxXe7Ld17zYOsX+lKTs4/C1msKkJRCfC5+YxD7mPeGUne0C0twoI4IpnA2wuc5Yy5PGpSJWmM69THva+RjKWcTXkpyKU7aOZSHvXy7Gjx1CsRCHEZg6D5Xskhm7/U77rWorFChFAau9g24hcrZa5/ZZvStqiKbHEXfl0l+fB3mxCuwFbZ4drqZxs8m+GddS2hi7qLIUmImrM8R8FhmPhsr0ELEYRX74GhFo/MUz7mpb7aGTOOwQr4HhEdm0rbrw5eh+Z7gP9VIlQZZJDvb9SZH+Kxyg6EiZRg6SAj2zGsr9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(33656002)(64756008)(66556008)(66476007)(76116006)(55016002)(66946007)(9686003)(7696005)(66446008)(5660300002)(6506007)(478600001)(186003)(86362001)(8676002)(71200400001)(54906003)(110136005)(8936002)(83380400001)(4744005)(2906002)(4326008)(316002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: BSgwBe1QPmd20okO1bMqlKzw1OlMwO/Q5w2sIUN2RXQlCunSHbsqLshwNBekBnOMVsr37pwvFeNkEIk/HFcTOChnzNbL+Q8/sSJIM0yO2nhk0fcuUPNACRMqJ/uF99PcbUGqgQejJxrZSd+iO1kVA3RAwasqY+C9zdnMvrdvY8qvqJqdiazfE2hw8Wq8TZGmG0o5+xU9MH5opipmqcJwHH6Li/nsWZ4skuMyMvKZDqeQmJ0Pmk42lFU+hqPRIKuPML/O/n7l74075BEIknTw6+VdLssDnFlReWYIij3TVRZm/0dihMyV0GbR/9e2PtkwXCYACcwnHi+fRQGL2GmS5aWxAfXwxrtIKEu2Vo7jL3IAyYJQm+8FQrLR1E7J4uAI9fbx9i/gG6Fu1tBNpYUFd2hES1dNE4I/KE54Hmh7v0ixivg1NPErj8kLcghrEPVBN5L18qqFTBUvPJShQeuCswcX9IpWLc1yKFPS/AZ6j2bKjzyIj4sDl4kcIlCybNXuWja2Kywzm9E5OHRr6QX9m4FCOEcDuUI4Tiwb80RQzEma+7EPCFaKgIUyu5/k4fU4MnEpWZvkNluauOfPNAwXLR94jpLUq7ACLRhHJoz3n2qslyQaQIpZp3Yc8kiuz8cd/bXw8mE31SIzqnPaatxQ99LEYIs8rFXTuG3o8F6P5Amv8SXfha10ISMZu5MhhTizRxObXssZQbke7KX26Sr/og==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8650625-a672-4194-2d75-08d875941d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 07:37:07.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXpPuAaO7sW8NEkEjz6RCQWRkqewM9CVGYONI4nTjmcqMK3TSRxnTS4jR0xTQnt3xFKrtte0XvIwYH7qQ7CiKjCFMuJzxenQHFstI4MaK9pUrQdF+gIHhVYGri+eLrBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2347
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Monday, October 19, 2020 9:06 PM
>=20
> The S2 internal core clock does not exist on R-Car V3U. Remove it.
>=20
> Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

