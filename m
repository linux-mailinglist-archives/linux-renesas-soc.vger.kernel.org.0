Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA511F383A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 12:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgFIKlI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 06:41:08 -0400
Received: from mail-eopbgr1320125.outbound.protection.outlook.com ([40.107.132.125]:48576
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727818AbgFIKlG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 06:41:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkaJ1m59DjBcCgkNutgxmRxvdaeuU0mEBhAfyLiKH6cqQACIMmjK/vyzXgSyRJZFnTKFTYKS2zkPM+wH79rOdENL5SZ1U0hyPsP18zGl0IngMvLzVXWqv1Q53FutEvvz8nimwmgOGC6glwJqVprZXeUiOb9wSXOBQhdiMuTy3QYHPNcOYUl9cty5WeiPJaiYumBYV2kFgTvT2AYRLBZqOQmlzQfgu1yR7OydLDkbV7dX71I/gx6W5dHf5wA3ZmeYXRABpbHFxR61kfMIfqH44Gr5wSdDevofXmVQPUdrEEparGvm8F2RzYBfh5bsByoZKMP+T2AsOb348afl0QdsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GnBTODfBnUQewolmyb9ycqLKN/2eEio1vFCIaYZf0E=;
 b=e3E8RsxwZxkekrV/hdrD/Z3MBsbabGgZpUDsjCwZyUgcj3ozh4aHCARq+Y1sE0yUEnz9W5FARivHGqHJndEzTEyHAEA/xLoSe1TEHrnNV/Rmq7OSQDvpLKPm5Ka5YPOHe/dNBzU1jULAI46HiSSyubhQhXQ4gG9MX7LsSbJ436Zf+6LtFqZEFJnakel3dc81ySPEh4xDqAM6XWL1fbfVg9WNa1rUY3Wz1cAavVkiXf8KF8byoAA0ROZtiOnTKemU3xn4zTHiu48i9yT0i+sNe8AdgYxBPj6o333g94Cl4g86n6qiw4dlwrF/gqL6vCGkV1KfQEbNHZuefTO5M1zldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GnBTODfBnUQewolmyb9ycqLKN/2eEio1vFCIaYZf0E=;
 b=crcMPv7n2f1lqzXSBFAFQlBvPV4zCpHrGyKOVAAL+ErRZ93MUfszS4TtzvBwKGlCpT52+uLUYPg2/D7TlUY+sLjMmUliv29Q51wRluFkbLd8K0Kv1D8PB21fQAuKkpZi2Z3K3PzNVGqNpB1mYTxcUSAbXaxUu8gbqpUn9hGR/gc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2058.jpnprd01.prod.outlook.com (2603:1096:404:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Tue, 9 Jun
 2020 10:41:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 10:41:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Index: AQHWOmI34Rq2naXnyEWINhVI/t25BKjORxnQgAD7OwCAANxGQA==
Date:   Tue, 9 Jun 2020 10:41:02 +0000
Message-ID: <TY2PR01MB3692310754A6B4D6A05DADF0D8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36923A1D7091431CE3F73195D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200608212702.GD917@ninjato>
In-Reply-To: <20200608212702.GD917@ninjato>
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
x-ms-office365-filtering-correlation-id: 4153c735-6fe9-4b94-46ec-08d80c619b56
x-ms-traffictypediagnostic: TY2PR01MB2058:
x-microsoft-antispam-prvs: <TY2PR01MB20586E2C9BE152AC6A28B1D6D8820@TY2PR01MB2058.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YJydXIMG1PPBhNkXvlBhpg6UwdTtQCfC2CzHupjt8r42Kf7bG0ZT/GgN8s7Bgp51/5HvXXGc09VBlQmiHozFLH8kPn3WOPggmHv85xQ6KOrdh2qpt6n5BuwdyISP6vhjYG9Y15VL8kWOaouXFcihXxdQZQMsm8RWC1zsxNkCo7U90rk7G4SrSrcofBDTC5ywVgMhMF75W66awe6bnzOxkI3dZMMS1Zhz0b/C+211Zjm+Bdh/sg/okEangJl5W932EwYdhxBSL0bBnq4VTNsJaXfTStp6lHdtz8oqZzA3b3NwVHn4Sd3oPAc/lhnAFuYMKOsTohyL5K8LSbRHXrLiZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(33656002)(478600001)(7696005)(4326008)(55236004)(83380400001)(8936002)(86362001)(6506007)(8676002)(2906002)(52536014)(66946007)(55016002)(316002)(186003)(71200400001)(4744005)(9686003)(5660300002)(66556008)(66476007)(76116006)(54906003)(66446008)(26005)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: A4JqEhtYnOTpp+jAiHFAS4S7GNHXSCkRmdXJMf1Gs+rua9pUQJJsTaxqGVA7PKyXK4f1VVb6QvpdSU+04SNgFHyacRmtLa99nfz/8nwiU6ihfR3rkwxI6UjGSSmk7mUdZWqj+nIugRzH4P1Wgb0yztKyWfHMPjmJWY/+dI8w32LW1Rq+dfA00nT3GY2zAWcqZgW7OxYm3ltyMtKo3ILF+Kvfi+gzCMA7Goqkz9hzAEJIqp0VGKhU6OvE6Z+hmGKhWJN+OjbVCiHG9CE3TdEaFwvZIyFfZYwcz0RCtjQ0CtnIF2z72+gdvbIwdjs408+YyFsVF7SgkXNVFnOPJlyVT8ohWOsR0UMNpCdTV0yh0A8GmTwG6440HfQJR53GTs+uvfc5Fp2Lsr/1FmBD/RvIakL7QQfU0GuX1byFHlmCA26wNHJUVtPYQ7j4qxdttZwBi1LjFAaLQvxoac/v4ELCyT9hHa/qICa0xyyOgFwEaPnTKeCTGwJAjMiWk/Ro4OMy
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4153c735-6fe9-4b94-46ec-08d80c619b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 10:41:02.8869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vd6EgnBlhKa7Igv/kaZUfrX6dk2uqoomp387E6skV168XH+KJT4Gimvs47fzRCErygP5VXF3FZ9tfu68X1ViR3eFPIS16/JmiAc8SDNAHZqVTNahZOS8koXcs49Kt6RW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2058
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, June 9, 2020 6:27 AM
>=20
> > > +	/* Tuning done, no special handling for SCC clock needed anymore */
> > > +	priv->keep_scc_freq =3D false;
> > > +
> >
> > Setting keep_scc_freq to false is only here. But, I'm thinking
> > we should set it in some error paths like below somehow too:
> >  - error paths before hs400_complete() in mmc_select_hs400().
> >  - error path of mmc_execute_tuning() in mmc_retune().
>=20
> Hmm, I guess you are right. That would kind of spoil my approach taken
> here. Maybe we need another flag in the core like 'doing_tune' to
> supplement 'doing_retune', so or driver knows when any kind of tuning is
> going on?

Adding such a new flag is better, I think.

Best regards,
Yoshihiro Shimoda

