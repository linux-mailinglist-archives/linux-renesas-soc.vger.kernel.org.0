Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE2B294909
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 09:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502034AbgJUHku (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 03:40:50 -0400
Received: from mail-eopbgr1310102.outbound.protection.outlook.com ([40.107.131.102]:51528
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502025AbgJUHkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 03:40:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCf+98hY5AKIOt7OQ9fxFpGthO41KSZ41XL+g0OoXZt+N4aPd7hw97Ld47SLO4A+Sx+bnuOg6rvv1ndKo0JDRtqUE9MxbhHXUCb2wJ3vDnJXa5QlwSN7lKCBLaf0yXp9/+qHycEl3HN1XkUPLu9Y/wVwn7TwQON1LC9n9hHGe5il/tjbn32I2AEKKw7oyK9HrsrDh2Xk1jeLIiBySESW7oeNhZ+2SzO1MogYbtGIyWJEBr9l769YKjagMBK1vZCysCXczQCV5wwpyiI+KOy5yMmPaSU9KbYp1XGbEO76ztC2MphD4k9aa6hxYc8OdQwuExgqn8PAYLTPOKNN8bAFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ4J3ogITAsxFYfwka5mUK+wFxyNd1hxOJe+QZSk4u8=;
 b=A0fDKyuof0N38V41IGKOyKS/wK12905Vi6qnO09aJmFeLJweOrbWB3YAp43hrce5UUcgzo1mlGo+H2gK/hVYOwijShDPZpzliEpt1j9CE/JyvElT6pcIBLTi+rRzfGC2Fv4aoFHXIU+Lb1WjJaAvuhhdA0+oKZPLUcmdhzuzJEsarblJTa4cMUbSDR+w8qIwqKPbbf7xj/bGM4uPvWuAKYNW7RM5GLaZlV6Du2GgZ7/SUpvs8pBdzqW+RTe1KPcO3zQ3qvaZiScIWirx5Uyd4DTGizd869cE/oVz3UbkFawigYkzsnlvWGdiYOj9If/j5XIJu6NLJne/2tb6vuYdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ4J3ogITAsxFYfwka5mUK+wFxyNd1hxOJe+QZSk4u8=;
 b=O/NSmOYteL5R7sGbc7X3tGE0GGb1ufbJNjTP66n7hHJJrSrFTeIF/dNzscDgWdpWer3UkiavT6MODfnX9/c/rZ1nprNH2vlwcJ8Ek9EL1ujuI0xSgj1uW9WhMD8MSBaFLAnkz1qi9R4MD+o664WjKaR37LYXTfbHEDygAJIeoK8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2347.jpnprd01.prod.outlook.com (2603:1096:404:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 07:40:45 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 07:40:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Thread-Topic: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Thread-Index: AQHWphBCv8ztLOHTs0O3grsNsxvjBamhrhaw
Date:   Wed, 21 Oct 2020 07:40:45 +0000
Message-ID: <TY2PR01MB3692A94AF01CE95C4E206279D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-4-geert+renesas@glider.be>
In-Reply-To: <20201019120614.22149-4-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:5405:3048:ff68:887f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c874b61-4b5b-471a-b774-08d875949eee
x-ms-traffictypediagnostic: TY2PR01MB2347:
x-microsoft-antispam-prvs: <TY2PR01MB234793AEACD2856688015C5AD81C0@TY2PR01MB2347.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02AMgSYZmfJnIgmTWCbvxyW/ANX3CX0eV1yezcsspzK0M2lxNtXLHxsp1QzJAgCEZn9PKQXVY5wuF0WTSlKBGIPZZfkgNlFTbFg6ErHoTqvtGtGCaHDeCjM77Tnd0dTiA7O2pExaFqqYKnasYtxS8FwZ6sCPtn1gIQeAqYkX/DNgJFxzm/kjL0dCqpsU1/emfVGlUu9vPPUDYnX3qokCzM6KXOvMjzrf2/YsFTZaI86v1BjVEfX75po2CPvFrVR1TCT6GLGJ+KLZXMLo8BiK8voz0UkT33VlLIdSQJ1wPM7JpykMYYN+lPoslAqF6/olw0EUB1wN4fC3U8SOHDORmw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(33656002)(64756008)(66556008)(66476007)(76116006)(55016002)(66946007)(9686003)(7696005)(66446008)(5660300002)(6506007)(478600001)(186003)(86362001)(8676002)(71200400001)(54906003)(110136005)(8936002)(83380400001)(4744005)(2906002)(4326008)(316002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: chrU3bxPT8EZqUg+CYGuUNpKeEdQIaS2YqVT9Oab6/2GCHDaH1ZTjEJfbt5SEvPR2QJF1Yc2pdFywOjN3u9z2RPIQxb3Ma599+HqbRu0m38C0W2ArvoaBQmjZsnjkC2/lkwOhuBGJeV+8benuvWjsycmYQEMnMoYOlh7P+9GAXcbnyDKQggzfYzM6RyRYWy0jYVreqk3Z9fKiqVZFkI0+8gikVwOqzzKDfJHqOvPQRfXDIokiAY1ofYQuiis3oNTx47Z/onLHuGbOXLH7kn8GCV+iTX0Uh3VuVO0XoCLO83XtCud/4HF/jqXYj9H8XustwaSXsryfBdCihs6MCV3diTJ+xW1RmtA+8rrgdEhCzOMh+uSbYi5Ktcm3+YgKkoagRxa8FEdChPhjicDgO8oQf5wGheN8jo54kIA7vXCk7ndcG/bsSjE7f+2HTkUqUEEeO8ZDbKxxRwId/zd0SPU5i9CctFKc6xRAY1J3FyPJkv5JkMtWXQVgfSt0RqXbDsbgSWAe5SOZZmO8FPl1mZrnNlUXRYFA6o+SeK1a320Mj2IazE+Mjv1OOaaHoPR93vDBjbhPLwYiC50zzSQg4FHp5QH2qrY2/yATwz8vDh82+DTbGxh/4A/03JkIJvyj6LRtgbJYu3pN3FCbse5ST9q9EDF18s1farHuU5yRsBMu23iR/1GAjnq1ldH97G1rfK3z+s3s/FDAJCwcx8MNCRFXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c874b61-4b5b-471a-b774-08d875949eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 07:40:45.3640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFCm6nzJoInxNuq7F7vzEakOOMmrVmX1ORvjAt4gwQd+q9udIzJsmy4igJTlnP35COY+kurcVojxE1PMAs+oNQBAa+c04R2MOcVHSKoUPEHKKbN2KXi7MZC+Zgd7nDow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2347
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Monday, October 19, 2020 9:06 PM
>=20
> Add the module clocks used by the Pin Function Controller (PFC) and
> General Purpose Input/Output (GPIO) blocks, and their parent clock CP.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested on actual hardware.
>=20
> Note that the BSP uses MAIN instead of EXTAL, just like for the CBFUSA
> clock.  However, according to Figure 8.1.1 ("Block Diagram of CPG (R-Car
> V3U-AD)") in the R-Car V3U Series User's Manual Rev. 0.5, the parent of
> the CP clock is EXTAL, which matches earlier R-Car Gen3 SoCs.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

