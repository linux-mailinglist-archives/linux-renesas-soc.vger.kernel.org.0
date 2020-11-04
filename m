Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFC22A5DE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 06:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgKDFlQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 00:41:16 -0500
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:38784
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgKDFlQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 00:41:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obBWgSp/UfHvlvpbwgXPPev05ENieLwxUgb4oHFc2S1sj4pnhIyMZzNQrBKvAkduP21vJywPiwksDebrSep1aTr6QMr7lo0F2mFkFOAIsp3q2pSq6Lh+6WDqHC6UhUXOnD6iV84zEelw0EFjiRtprRRtC+7uNbBxwNda1HsSJnbs9/vH/BjT24Ec8gQkomu9ZTPV3bAAEcM2aQXomxOXU9wW/etUBtZamJ5hx+bc/bGiRqnAvkhw5O1s/rK8xTgYUwV2R0CWV0bltC+SyXTufCoBj3tDOGSxcFJ+VqTV1yhJd3QeuV+8/31cO2u/16h7C3RHGp4ZKbbiGJE/nvCCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk8d7fVFWE7sSm2vJctL0Qdlgk90C1nERbWWQVgoCts=;
 b=BExW1fdhFYel8L6/T2zCTMeW/QTze280fURjP03tzYtSdEptk4TMIShPCTlxfW0KLSwh9mC3N1j0ZfRLpEKbXRr4z+byoFBKVxNMhOEZHM80xoHRq9wYQriE2g1QN2SrGWwDqqcg19/4bHpqACoJ6cTj3tQUqb6842LVSfUo109y3MbDjWY/1di12K9Wx0HY63IczqjhCvwLW8Kq3mge7JLXiF8Ka3+O4WfDvA5HC/Uza8uoZFEDWxxoWxUSrrPvC2cn1Rkn73pIq6xjaOCoWftTUqk1b0YCg3wu2BABlxgwKL44hybbabnNWz9G2x5lp8fjxIaY4WqTL92VBUoFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk8d7fVFWE7sSm2vJctL0Qdlgk90C1nERbWWQVgoCts=;
 b=IY80gAudVp1exgVPnH1jQNseb/vo0flg5lKQAX/LjD5cTvuFAB0thsO7PTTIfPpmjdD/CQlFhsrJsQlJVMGmJHUBofIHgXWVBB7PmvOFPy5CTRh5Og7IDs3hTwrDHh4jKMAq6AzgbPLycUlwTQ34FD8KTrNYOpMRb284cOHx7CA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3936.jpnprd01.prod.outlook.com (2603:1096:404:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 4 Nov
 2020 05:41:13 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 05:41:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: RE: [PATCH/RFC v2 2/2] gpio: rcar: Add R-Car V3U (R8A7799A) support
Thread-Topic: [PATCH/RFC v2 2/2] gpio: rcar: Add R-Car V3U (R8A7799A) support
Thread-Index: AQHWrpTVnMJmsp+jTESBiVO0zkRvHKm3eBNQ
Date:   Wed, 4 Nov 2020 05:41:13 +0000
Message-ID: <TY2PR01MB369202D0007B832F8627F318D8EF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201030081522.2297074-1-geert+renesas@glider.be>
 <20201030081522.2297074-3-geert+renesas@glider.be>
In-Reply-To: <20201030081522.2297074-3-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:184:fa7:6262:a02c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b2e91b28-0420-451a-8ea7-08d880843df4
x-ms-traffictypediagnostic: TYAPR01MB3936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB393688B68F7012BEAF680391D8EF0@TYAPR01MB3936.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E36SIoWu8F1TuXjTLvKGDHvzf3xpxHPdQXUIjQ2E/xz8Jm4rAMGmjTfggHfn9193ClkyZoGms7H3EcLLeJsieMHoxatNoguqb2Nr//BCKLIKk2QwKNbT5HqND/vySJ5fc6WsygpqU2IjF3u8yB7T9uubZZW3zJznXXUD9n43IuetMqIKi0txLRMiuv2grBr16VeG3i/afa68ShI7b6kEBQtRg7ff4Wo2bIxEnm4n9VQGu15BxK4x3ZzGpxZKmUAFcVltskUbtepS9ue6viaDXt1/E3fA3JgVE3i6sZcBxWbJQpwCinP2V6cIlgmfy/Z9NF82UK6QX5+7MnyQwfDF+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(9686003)(54906003)(55016002)(7696005)(71200400001)(8676002)(186003)(52536014)(316002)(53546011)(6506007)(4326008)(5660300002)(478600001)(110136005)(76116006)(33656002)(66476007)(107886003)(66946007)(66446008)(64756008)(66556008)(2906002)(4744005)(86362001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: xg9gVV2oXznaUjjgX9YbzZgnD34uouuR/4wrfJuwtktxRdxk8rhLHYhp354lLq5BoBYpu6SBbx3kzy96K2CKt3un3TM+V+hR6QJ+IXHWEJMP2QxePOhdoDDECkM3BAaiYJfEdTdNJ02068g9hYW6HAIEyg8AUAa1dFtConv0MXyAFdfYyOswQb1fm5O+pudNWUg/RqyQjODZyaDZBXShO8U1W/PPdpH8uELFv5VS+wGtYT5/PpGSJlHjp11vBxPSZ1UDWcvC7BOrO4q0IQ6hX4bkF7QtdB9q6ri/FCgxH+hjcguPIO0iyogP2l9104dcJwTA+mLEvWRT6Tbm36FdJLMIOomp3fjW7K33MI69RNrRn7HqqoppHRQN/uK8MrmTRR8Kdk/HjglK/nLVq9sK5VvCkgfvq6aWwPxdp5I4WAElMNejWAAle8VBHTHkWoVmNwPvtzArMHPkwWiG0D23pcNsefGtOfdYjHL73LALS8oa1opEUrWt+dhnXfPWMmbm9plFabQYiw8rhwndOzVSK392N8htnWb4g2dIbQN3G9cTdfZ/f7WhxU/IA2ApxN85nONEXiV2pI6geVPWeXeqxAaFnZ3QP2Ukr95kGa89UD4qRsubgMvtT+mVtuF43uKbf+Fo2LOzkjQkMoW38C9RwAu7uGfG/AjxVBtAsp7kF2JhgchP8KIzLbLDMI2WGdIy
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e91b28-0420-451a-8ea7-08d880843df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 05:41:13.5181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLToL77bN7/1zLZ5o2l7oY2JmAbtr9NoxoBj3Fj80dFmw8ZokvRPahC8SVQCeLSjm0fAL5tb9/f4D0ZgeHtr2JaHcMrDHEe3HpFauvd7Gp1OVy6MLehfdNPCWHeYX5YX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3936
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the patch!

> From: Geert Uytterhoeven, Sent: Friday, October 30, 2020 5:15 PM
> Subject: [PATCH/RFC v2 2/2] gpio: rcar: Add R-Car V3U (R8A7799A) support

This subject should be "R8A779A0", not "R8A7799A".

After fixed it,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

