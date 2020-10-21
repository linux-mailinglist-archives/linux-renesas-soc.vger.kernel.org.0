Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2242A2948FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 09:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501922AbgJUHiC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 03:38:02 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:51376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2501919AbgJUHiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 03:38:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPAn7UFt7oq3cJeIK3zwUbLfS/KrCg4xU6X4Lq1wsgYnxvF5J83G2+omOSSWQYuAfoM8EbH7/p83uchCiTtJQ3brOvF3ajeJ2n3ASTYqgMcI8lYJDmhqwE3mPse1KcgwbKM6Xgkt+3b0KuJ+VEkmCYoSuWeEg6N+pfAJqcVD/wLd6B0h2Ta3NZOlZXsEScHjSAmXwyCHha7QVDZ6P2lWqxX0sfsjOsRx1LG9Bdd45OjiOxFsQMBCI5NS3rMWVBbhAm6X8gNs21s9/lz+OjrePFQYAJR1TsQGZr+VMzJOMazYl8a/NlZB+a2DJeGjCZ6azFMVTn/WbdQI0WgmEbJCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEu/T5dG/MO0mS++e+EoA6vz0NBKSZ4rccsv4ALSlAU=;
 b=Jsj0neVqnZFUDRuQihGetVCsPKI7pVoloeMoFuW2YRY8mc1q7KLjUasGpcNIh6fvqnDWQBSeBXcklfZn7NealL4fhuDGlqJ72L/W27gFAGbUD589c7/OPcXvM9QF2SEwtokdC3v8/WvuoDMroYmSbED+DJYEIbUXt2uGknmHM/xv+YHdAOPzNrv2ngDvAxiyfncly6OSAFgH/FVUeQW7oPYpkQ6wVl+oLucetGHmiiuLqizEiYg0iE+xgLpsNJsL1dXujBjWrEOCpW4DjGJxq2LQlUHpIE4S7wUciUl6QpJbsbvptfapqugMbCU0kNM6javktIDDuCavPwLQNlQV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEu/T5dG/MO0mS++e+EoA6vz0NBKSZ4rccsv4ALSlAU=;
 b=MuBEryTVy/8mdU9Xtskl6VZKkVJBQJpgTR6VDDFRhdpo6BvH7VUCZaxqhCqdpObdE8Mer1n934IEIOvBPSA5ZloMB/eO4Nnb9fDrHzKHTWgO8Cnzx2J1piWzGYLBCJLaX23lRR5Z2KHSuXnnM1cJoNj3wTXQANW6xai9aKh1B/w=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4221.jpnprd01.prod.outlook.com (2603:1096:404:cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 07:37:57 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 07:37:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH/RFC 2/6] clk: renesas: r8a779a0: Fix parent of CBFUSA
 clock
Thread-Topic: [PATCH/RFC 2/6] clk: renesas: r8a779a0: Fix parent of CBFUSA
 clock
Thread-Index: AQHWphBC9Dunwp4gEUyzBlx8m6gyGamhreLQ
Date:   Wed, 21 Oct 2020 07:37:57 +0000
Message-ID: <TY2PR01MB36926BE1E0A54EBC9ADBE8DCD81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-3-geert+renesas@glider.be>
In-Reply-To: <20201019120614.22149-3-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:5405:3048:ff68:887f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b67d4786-cc6e-48cb-7a96-08d875943abb
x-ms-traffictypediagnostic: TYAPR01MB4221:
x-microsoft-antispam-prvs: <TYAPR01MB42217BEC20C3599D1876D673D81C0@TYAPR01MB4221.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AiOAfDCSrptWsu1bsvoSnMXRXmOMLY79e4vH0e2aHlH36RTLKIZFSIudDajavZZ053TodEO45q77YZFxbRbPzukiIo6mxtBK9sSCmM/bI4MROovY0YlbuvMpXI2FPsIJHWT5yS5buehfYxWO96T0Tk74iRXblKKOez2nFUmK4wu+NevR6HbXARpGaYCTG2E/ycMTnHuJgoou4yeVYP+vwODY4QC1VxzZvtwCjSmNMYpH9RzyFk6uqa4oRDfPbqkQC/slmYXlpKZMaeEbBLmXJo5dAOezeN/QUt7GNvotXS7+RY1cYzazD9UrXvd3nmQ5HCjZIcx2Dd976riRs5gIUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(8676002)(7696005)(8936002)(478600001)(9686003)(4326008)(186003)(64756008)(6506007)(52536014)(66556008)(66476007)(66946007)(76116006)(66446008)(71200400001)(4744005)(83380400001)(5660300002)(316002)(2906002)(55016002)(86362001)(110136005)(33656002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 2uWSUERdkJzIIGSvUyfBsGb+uwPYGo5zsoHMdBMJ3F4cDcLGgPCtzfvaYEaUtvmV1HQZL0Ombw0V7BGf0yRETrQxcR9pFSRDz7a9MZB7YqK6yhjdhH5TyOXzmmVN5OXvO8S2Rv8FFoTg2tbRCPJkjUBbo/lZSy6fvt4dEDAClupFaJY0g77oBwtbOwIL663msgd5rWHvLyhH1uSfqq/boQs56T0XG+euE/QPOBq8oSpCruzr3H0k20pPdSAkXPzJRm9EhIyS0SSiDAgDJc0nMTT15tzBnfEKsQu8iZK1LC8MVYJ2auWYQwDVEipGFGNIB6KFg/3aCcUkyDhaNwmhVHqca06oVGsigH4dwQJvcSG7VlpEw7TOzBZi9LE0rw4TdiL8Hr7cmY58S1kcAHjJMPaI/FVgEnwRoaQZrSr2H/znDqnN1weWfkIDXfjFr9qTdXII+t5FXi92aicNMHjahKmKb8BEsAekoX3ec/8rMYQa5e4nzNOEiT/YI7CZ67cA8wZhf3LrWKvijwu9fuHTnCPIkWnzSHNz3oOYyvqr9emzSWyiL+uHPw+vVUf9dZqVPWWaTkAo0tPep5gJB0fM0m75b6jxhDi1BWTtSJeIkgqVZ/3sP+UpOQeG4zpYxKB0ejP4Ra5UW+CZ9Ltmafg2/R2+e32AB4GXGCuzGcIQXTdFlYYT8V/AmxhYMGwGrJGDe3W06JfPH//mwpB15RBKtg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d4786-cc6e-48cb-7a96-08d875943abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 07:37:57.2740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iBJ03z+ZPZA/avnIne11OSRTT9mdVCJFG1UkXtgqiWC/1RBKmz33xnw12EDbNszg4MuJ8jUititSnVotPk7o1crP+KP3dCk9WqufmXjrXVIc/koblHKhqOb5Il9CGWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4221
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Monday, October 19, 2020 9:06 PM
>=20
> According to Figure 8.1.1 ("Block Diagram of CPG (R-Car V3U-AD)") in the
> R-Car V3U Series User's Manual Rev. 0.5, the parent of the CBFUSA clock
> is EXTAL.
>=20
> Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

