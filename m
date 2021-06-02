Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38279398005
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 06:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhFBEPF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 00:15:05 -0400
Received: from mail-eopbgr1300125.outbound.protection.outlook.com ([40.107.130.125]:6547
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230071AbhFBEPE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 00:15:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F04+2oB3r4GSFJ7oDmaThgkiGnuLMxVLT18V/k6WHpdZlANTJr3E/6ZEhqKGtnlhWOVuOgVrEjQf+ZiPcXTCDP8I4MKpya2vskBtjjE15HanU/6g9rroE604ZGBEwxUPJcS/PN3aI9Td4Qxu1UqsFR024KJLvbID1cT0uK3vHbhoGjvL2xBjD1o40Xu5NUiQXH9R/VqDvvujGsgr5qvyhgmXpkqMYF7IvCmCZus6EyJ3KGgkdwSaYXX+/liDioD3MeV4D6SE4e/QdyizpdXz8bwDGskwLN5ajE59tSjkcijGGKGW0pdRHWH6c3Zep7noxYo3J4gNam38KxLZ9aH1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxFMJLWlXsvWYwaTfDgNSAXiveRAG5TipBRI2XTSJZ4=;
 b=VMkUgpu4dksjiwgBT6ddtY/4nT84/rQq2jPegM3kIyqGmVXu27AryIH34Nl7kwQ10r+CS0yOBWDl++ZZBaElukQiyhpn7YfgOejdyx9nY02sNSr24mb0zILLzZauqoZYkwiyv9j4SPpew/ctrHhOjP5NjP4kZzhd+AK4QFyE/nlZRcNYj8CbycPhN+vXaRHFkAD8TOP/6D/B46j6z2AzwR9fJQmroR/hvjpiDKkhbVMczNTxeooXqRQN8/tfzOKSRTblE/D1NSWZ1Be2OPScoYUbh74vFtQqI+8jq6X8cePDg4pKMPbIQP5cVIPUuon8U6+D/mmZ+SwJCjGIc2R4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxFMJLWlXsvWYwaTfDgNSAXiveRAG5TipBRI2XTSJZ4=;
 b=LbpXGb6ywiV5IQoywSzvcURbIDhtF7l47eilAWjGnzsjC1mNfOPKalqRU3kQrPJZD948Dq10i/1IPIwcFHimrEGQsYJ9zy7AJEVr3vuAwczXrxwDiglAoKmyjjb6ntPlJV6E1q4rwXwplfpt6jcxu8zXltUGaR/7McO6oAXJ58Q=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2636.jpnprd01.prod.outlook.com (2603:1096:404:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 04:13:19 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 04:13:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77961: Add INTC-EX device node
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77961: Add INTC-EX device node
Thread-Index: AQHXVtpYxq2hNXFmjk+urKF7aPlBoKsAHWAQ
Date:   Wed, 2 Jun 2021 04:13:19 +0000
Message-ID: <TY2PR01MB36921C3C051DD686AD5957D6D83D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <6f3cc1a1b6d777e743a7a9e66a80aaf9d5232a4f.1622547125.git.geert+renesas@glider.be>
In-Reply-To: <6f3cc1a1b6d777e743a7a9e66a80aaf9d5232a4f.1622547125.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb443708-694b-447a-155e-08d9257cc0fd
x-ms-traffictypediagnostic: TY2PR01MB2636:
x-microsoft-antispam-prvs: <TY2PR01MB263677A6493A69FC83F9D6E6D83D9@TY2PR01MB2636.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J7j6s+dlob1rPzro6jHk2VU3EuILSxKCeEl6K57paH4H2lWzAbVLM7uxMHDLwTpXtelynMHB0/EX59ReH/3g/yfWMGrtI8cghPM7yHaJabJRXAM8DJxfsxoNBDNDPROkYEpUoFNW9WUma3CC8/t+MHdVQ5X+aIl7QNOl786minMaVvTzsM/eMtsjhIf7LV7RIon5z+D9aevDU6pH1amlRw6jDlbK+hHCu9p3s6WJRVj00rVYue4PwCPvkcr5a3AVVBST52S/Agw4flsws/0hogWvQhXEKBM7X9ejop85GOqU1Vtjt1afVPrTW4Xmv0/Kuykr6DHBJs0UcG3AjRbYzhJ6CpZocmwZjqOS07ThlmrJ+O6tlV/Jw01tRBFbIqUXAdviEET27DL3UcoVT5ZV/93Na1ppV58SDEhlU/pXyRnak7p7GHSBRxQfSvthw0Zgsm2xafCZCBT1Pq3EwX3JZ4pNkH1VFMYykgyhkBEBR+7goJvTvhNmWojAgs8yPIREzNlWscsW3nv1f//9OdRNt2ums8hAGcSrvCW5HF2nPcnONXGtNWsNp68QK/ZsI/FlUnEc83tSyU+Hk9qk6roxSy+epmc6SCV8okgx32fFP8A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(6506007)(7696005)(5660300002)(33656002)(8936002)(2906002)(478600001)(55016002)(4744005)(9686003)(186003)(54906003)(86362001)(316002)(110136005)(66556008)(52536014)(64756008)(66446008)(66476007)(76116006)(71200400001)(55236004)(66946007)(8676002)(4326008)(122000001)(26005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YrKm45RvbQkbqidi3NfFxGKizUmvnxmZ5fA3WCBYPGiZ2iJL2N18VH4yWRo1?=
 =?us-ascii?Q?mdh86AnnGxaMzdVKNlL4ZsYVKAyGexn/ZMpFz6wGS6gAfMiM+afBk9sfAFFo?=
 =?us-ascii?Q?gDViSZn18IPd4ZjRR+CyNfYh9D2cwEQgjO6H/hnCJ0D+Lg8Z7zzA8pSxzglq?=
 =?us-ascii?Q?XnCw9Sdtp4yAjjIGvjN7cE/n5rLbTZNKUQX8YmdP78fCz0m1vbdLHpQls5ae?=
 =?us-ascii?Q?j5KYGXbnMTnYnZSHxQyUIxv1MqdCkYSRsrOU8q67mqbm9BfGq0V6VnGqpd0F?=
 =?us-ascii?Q?oMjhcoANBqADiHGejTarbiHF8MFcn3EChQQhNpv2Qb1F6CKelc6z+83hcd+n?=
 =?us-ascii?Q?XKWbEWAOrmJYG0jygdLrPUj9kGoJ0tKqSwUEHOOJeUNBoPNh2KrJgCDwtl8q?=
 =?us-ascii?Q?gmTrzePCTzUpzpVoXMK16k8AAcAAeGkxaxEPnaP/kzwGymdxVP6eFFT0uKix?=
 =?us-ascii?Q?yD7g4Kv4so9mpq18mBhSLg/4HDzz0fdaR3G2GGTl2XxTOKMH6tXGe/BloxWd?=
 =?us-ascii?Q?Jx4ubBANO6qnLsoCvEdnhOkCFxRNDQ40ee1bk2RE1JMFVNn39ewxoWqvXe3B?=
 =?us-ascii?Q?0OT846KCKrrQTNcONW3ESGLhsmdLlS9I0/8BtIUvRfLBJnG9nRoILQrV6lyS?=
 =?us-ascii?Q?dVHWqxYJD2xLpiOKBmZe1UhCugsMWYsWDGepFHco7oDvsBPg6qG4C3Lh9eIO?=
 =?us-ascii?Q?Ad5qW6ywoPw1l28ESyQc5yLAeBKhXwAHAMhgwhSl55Ceb5qfZD+Z5WFPg6M+?=
 =?us-ascii?Q?Rsqmnj80acbg1NU9WHijKnR7FV/lbf3xKPBy+uf6a5glCvyONyJlsk0xPtya?=
 =?us-ascii?Q?NPFJvnip4wMIuQjFhOUVyA1GyFrjcsQ6Xt7NOd4qPikzVg9zZVm6d+sl3Gbo?=
 =?us-ascii?Q?rut+D4kWsMzNQ7DJGB2xFSnaOIA4m0VvLGlb0+8ztIH5oOF6ZIrOmMUVoy99?=
 =?us-ascii?Q?El1pKvyysRT8fqJ7S/vXutCaa+qIj9xKLXkv2eVjKAQJ6PxxfNno2cQNTpnf?=
 =?us-ascii?Q?2iSWa15GPzCBhIM91KIsBnBIqTic0z0+zrbB+aDXhEfiAnhwJETNXFcwK5z6?=
 =?us-ascii?Q?M+LgmQ+borsZtsDIdYe5rcxrHRT5yD+5mcTjVsbgTFaVElItZ/zMiZ7hQat/?=
 =?us-ascii?Q?wsFE+ERGrrE/29IAS3DqABB/lnL+SBFrULsvYeEhDvWAcye2SZUOoUW//LEa?=
 =?us-ascii?Q?P5D1BpkAIui5WfJuX44DeYeMQqkHBgCpUX6OLmkLGnu/8I6BFt/G7vjGdGUR?=
 =?us-ascii?Q?4fAPKe3cPp5LANaL79ZbC6ETN49M1uP/usCTJrkMz1lTBVMrmvRqHdX5e+F9?=
 =?us-ascii?Q?OB0G4yp1DQJicY3mGT8B8QKz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb443708-694b-447a-155e-08d9257cc0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 04:13:19.2440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2khc6Tj5uRJDi2vGG5TbUdTyz/VJzDlCfMWZTeYFrx0V29Hm+R45/1D2j/t3JKsDdYdwYw3gE9zoq9n7/Nc7WatOTy7vy+mARk8KpUqvBDHZ0Rz3K7iqcygSSkjw1JY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2636
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, June 1, 2021 8:36 PM
>=20
> Populate the device node for the Interrupt Controller for External
> Devices (INTC-EX) on R-Car M3-W+, which serves external IRQ pins
> IRQ[0-5].
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

