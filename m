Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C34120CBAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 04:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgF2CMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 22:12:32 -0400
Received: from mail-eopbgr1310095.outbound.protection.outlook.com ([40.107.131.95]:23308
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726071AbgF2CMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 22:12:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofkjOjXreZOaCWPflEp/z2ZStl2p7cWkF2Rw75wJoxNTeVR4F82QgNMRhiMCA8IQ1o9h04N7UwdYrr6VlQ4JdyRzOCG6ZcpbWKCXIIGSImRRiagauoqS15jp2BLMW9zyaM8KinUAErC36IhluMM0dIK1OpnR2hhZu1mkualYgPFhGqw5XVc00Lmy5wR8SFAtzwbf4aDXZTK32CvofmQ8v33DoH/Ve0adlQ6B2UtAPoKNVQhY2zlKdw8SkDtBUS+ZORI/NRSmoCM2MYOxwH6oSNrQ4+bdjFw6xbeuX8uV6JRom3ITE5lJkTzLzSGb8B7XxkMJ2oWL/AjKiiflKsZkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ7M6Xtgvft+1JeobBbMcL+gTkR42pOFS815r7RIFcM=;
 b=PjBp50SUvLO3t3Ls+HUSo1cemZg3AB/peKBei/k691Id7R0+KWgd/azxqvuwKs3tXJ+YUSwQErOK3ktddb/SMzERYtJq2aNKJKMo6p7KQil51FHnTtsmMYe0PXC5Agr/Be40dDJaPjNmxK/GkfkiE8tQYD/GVlDD1/12sK0h0WOH3xm5imejUCajDTLpa5l+P7jzzGkraMwzGWhPwfG6/3HzYHpXh5mzKKRixXefSmSq+QQxyD5hlmkWHHhV2QwapVpJYEYytypJFN00p5bFmX0O1cOR4MBCtvxRLPrlokgyycz90Qdxdw+S5e+Rx79tSec6RJTG4W90D9hRhtThXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ7M6Xtgvft+1JeobBbMcL+gTkR42pOFS815r7RIFcM=;
 b=krSnPLyVvChJcd+OjexFXWlqmH1YKjrJR7I0dfnUt3/gRkGT3WdP6pvxiU1ASofGwZUkC8U15tfjFDgpAdjzZ35hu4cQlEAxqDG+P8i7iqD6fomryAJcDcGmh4nmhg+UktnYBuxZyqRf8RXGrLX+eiKJndrn7fQ7nJsemUMc9dw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4025.jpnprd01.prod.outlook.com (2603:1096:404:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 02:12:26 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 02:12:26 +0000
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
Subject: RE: [PATCH/RFC v4 1/4] regulator: core: add prepare and resume_early
Thread-Topic: [PATCH/RFC v4 1/4] regulator: core: add prepare and resume_early
Thread-Index: AQHWS5y2xTHB/bN5kEWVx8Xm0qNT0Kjq9VyAgAPa5aA=
Date:   Mon, 29 Jun 2020 02:12:25 +0000
Message-ID: <TY2PR01MB3692FA79B8187D100F947327D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143009.GD5289@sirena.org.uk>
In-Reply-To: <20200626143009.GD5289@sirena.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbc9484c-c5d4-4578-2055-08d81bd1de12
x-ms-traffictypediagnostic: TY2PR01MB4025:
x-microsoft-antispam-prvs: <TY2PR01MB402503D8CE14D1A8B7B07FD3D86E0@TY2PR01MB4025.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W48lhslR0ohBnU1UjuUouw6mSBw2ZmecXOuyb/2DJo29dxrMiqqJe/wPo539MKTKqRxX19N3UPo/6UeqBEP41FEhBvDfadk3Oubr4DufTD7AwoY9cNIDtajP5hIX2eVn9fE7GxoP6uPw6SYLObLPCX+DwC2p/NDZMTDAQKI0m/MgqvVJVUZAlMksuDn4ORxpOyw6s3ZxavR5vzaNQIwNO27KIWbZAx6JICT3cVPfDKS2NrCNwwxqT+JLaOIudDei9kVtrr9Cjazivhg+TMwvq/LUCM2nqVVU/WPnXktLQv7cBRBf8AZBwiV4bhTbmroh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(83380400001)(5660300002)(26005)(186003)(55236004)(6506007)(8676002)(52536014)(33656002)(8936002)(71200400001)(478600001)(316002)(6916009)(54906003)(55016002)(4326008)(86362001)(7696005)(66946007)(64756008)(66476007)(2906002)(66556008)(76116006)(9686003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 504OAqcfSCDCDC2KCyizwIfIHBpq9LxSZSm0suuMGh55YiodkOZVxgKFbpMMLBjLoP9rpyTm2HHmzP4XclKKQEd7Xw9AdH12zNSWPMi+uXPeNGwwfaum5w3+GGJVOtia7/rDUEpfivdUGMv/Nhl7nSO4If2lskCE0NWucJ8kd4KpvZWCEDtkYk4NXCywIOhbnoPuRXzK/TTTgW5c3OfOH7906BrjyLwu+lia38h2IwrfUCCzjYmR2md/+/xQu/AexSbMKjWA6d3FEnsOi2pqwDMocIzWqc+DMGOON2S4/0bIu3IW9rhnDRCmKQuLsEthULeGy2dTn13GDxH65/s6XXjiWVZJMgybnzwCUzuth5nFzrh10zt1kLtBsvQ7Tg9/7ie6eczkJY6+dZLqYrFp/4PYvIwHcw39L2gRjGKJXuJ2N9nlmLdpEc7lBbdkej5rd4U9bsDKR/U5Af4eV5j8+uWuTspS/lbY3MpWiRSK0iRpGu4IWUmbzlQN31iczFjC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc9484c-c5d4-4578-2055-08d81bd1de12
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 02:12:25.8521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUcEBLmCumC3J91srB9O9/XWU8nxNADXXChP4xWF202u73lsflvwglNZhZDqNw9z2GODXml1+uIcx4x8YWa8wFD4IdQoU26qCPF//MpBr4lX12NVHbQlV9wYIE2kULH6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4025
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> From: Mark Brown, Sent: Friday, June 26, 2020 11:30 PM
>=20
> On Fri, Jun 26, 2020 at 06:32:19PM +0900, Yoshihiro Shimoda wrote:
>=20
> > The regulator-fixed driver is possible to be off by firmware
> > like PSCI while the system is suspended. If a consumer could get
> > such a condition from regulator_is_enabled(), it's useful by
> > consumers.
>=20
> > The regulator subsystem already has regulator-state-(standby|mem|disk)
> > sub-nodes and regulator-off-in-suspend property. However,
> > suitable regulator_ops APIs didn't exist.
>=20
> > So, add new regulator_ops APIs and prepare()/resume_early() in
> > the regulator_pm_ops to set/clear the condition by new APIs before
> > suspend() functions of consumers are called.
>=20
> I can't follow this explanation at all, I really can't understand what
> these functions are supposed to do or how they are supposed to be used.
> Nothing in the rest of this series is at all enlightening either.  It
> seems there is some need for a consumer to query things about the
> suspend state but there is no obvious connection from that to adding
> these new operations for regulator drivers.

I'm very sorry for lack description... Perhaps I should have described
one of use cases like below.

regulator_prepare()
--> call regulator_ops.set_prepare_disable() if DISABLE_IN_SUSPEND
 --> A regulator can be disabled by the operation.
 --> We can guarantee an order which is called before a consumer if
     it uses dev_pm_ops.suspend().
..
A consumer driver's suspend().
--> call regulator_is_enabled()
 --> If the regulator was called set_prepare_disable(), this can returns fa=
lse.

Best regards,
Yoshihiro Shimoda

