Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E7FE718B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2019 13:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfJ1MiE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Oct 2019 08:38:04 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:20113
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727024AbfJ1MiE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 08:38:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfkAzVJmbsu0FHIcqiloSFsIr3aLplVwv+/huXgs0/Him1e5X8G8OD7kACw8y8B4SPOGgHnD5aZ+Ygu3tyTlxlYj+Owwv1TyPJoER1zdw8GMom86ww6uuJm5OOPEEBX6pi5CXP0DSlASB/jJqEFktTtwGQ86QsQJoiVD5soTkFPuJENsXUEDA7zlJPdcGT3AD05iwbvNe80asxmKh+ZU6Uqpgu6z0Ine07CM/UWqceuUKNxKjzBXj9Y044hF0lFrx3R47a7gK4sN/Oru4t+zOUDj+wttQ2g1+DQkd7LxlnoZ8AYStzIzwvaSaKaKAqC3nuVhD22tYXAjSuiC2sdNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJhqNuicpH0Xu4ZcqihiZoDPzRxHsJtpf8e6wvb1NbQ=;
 b=O8yaun4s7xh/+6kDm8L6au4vghVz/sofJMHnApx3fIyQfH/5pHypoA4GKxg5LnJ7iA4hU+fJfSRMWaluvgeXIYyxgbKvetfsnajrk1j2AETZ8+bhoe14rQCLCd6GctW/c4+Rr6+L8uabzyWRWnbKzy+AsLXKZDs1DkScTTfb3VT0nJ1Hi9P7huv+TJBR9VYWBykZV86nMRsLXwnT3MyJrWK5DI6RiMSXBx51DJFR64MDT2PCdr7qvSCrOEQkKFSmQPcWkMBck/QJsptc5UU4akwseoT8fU/lGu0hbjs0BwOkCj6PeUMFi7tIfCku3HO0lkMhWrCbDBKVgsVXJiX6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJhqNuicpH0Xu4ZcqihiZoDPzRxHsJtpf8e6wvb1NbQ=;
 b=KZKrshEo6lNKxtN6v+E0IXBacDFCNQhIApKmcz89Bxn9oDVOtiwk8YZOv+1qmcdXDCZqlx4LnMiaZD1ho5m/2GPthUkOE9xP91NBe490rmlBKPHQ/SCTn1TNu4TC04TAV7XaMB0FX4M+w6XGEl+Zg3a0IiflrBOoI8DRg916vmg=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1925.jpnprd01.prod.outlook.com (52.134.242.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Mon, 28 Oct 2019 12:38:00 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2387.023; Mon, 28 Oct 2019
 12:37:59 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqdohGeAgAeu1bA=
Date:   Mon, 28 Oct 2019 12:37:59 +0000
Message-ID: <OSBPR01MB2103BAA79F78DCACF3C336E7B8660@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <20191023151629.GA5153@kunai>
In-Reply-To: <20191023151629.GA5153@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 643c05d1-4be8-4296-7b0d-08d75ba3aacb
x-ms-traffictypediagnostic: OSBPR01MB1925:|OSBPR01MB1925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB19254129BD3E6B8D51EFA387B8660@OSBPR01MB1925.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(13464003)(189003)(199004)(74316002)(8676002)(52536014)(2906002)(229853002)(99286004)(6436002)(54906003)(14444005)(33656002)(4744005)(6246003)(9686003)(55016002)(14454004)(86362001)(6116002)(3846002)(256004)(4326008)(71190400001)(71200400001)(316002)(5660300002)(64756008)(66476007)(81156014)(76116006)(66946007)(66556008)(7736002)(186003)(66066001)(25786009)(26005)(476003)(305945005)(66446008)(81166006)(7696005)(478600001)(76176011)(6506007)(53546011)(102836004)(6916009)(8936002)(486006)(446003)(11346002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1925;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7TPK47zsR5zmS9NykZHb93bPRhXGMiNyT/w1LdeQxETwfjhmUM/M34Yd1ipJO2mvrClYCUMJ3UywFWYTxh84wwv0uUHCb5bHAHIkNq5zn+pRD5Nmg57H3yhOgqIOdveMp3hk17HcKzI93YdvHXwgrm1yiRPOC1lV24SCpVpX+Up6aRO8zIl/DvCEfukxQyEiwX859LxasxXSAksCI6HYUT1YcTCdsAikXMojklYOf+i8n+X5FI+I2oENZdNsB/ap6D5sXCv2cYBrPmbVpYFmpDXhgLTd12vQFdZfwIZFDGBHIawm0svK3UKju53bJ2IQas4G6s8sz5EHfAbBQFQfCZAVjyvq+QF4tRyaR4JdA+1GUNsl/YSaEE6fFyURTLqd+tiZJaXqGzLxbyP66RHJbaXzjs70c5DkSuDWM7gWjnCU6NzZqadusNWNgU0ZGIhO
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643c05d1-4be8-4296-7b0d-08d75ba3aacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 12:37:59.5055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrnL+uQ/EbQLFbpkqavkDOHJwyQcIE9TB+YiU+ZA9UXqETusEw7MwLaxv/bc/CkdJK8J0mptk4mvRXocyQKyFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1925
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf Hansson,

Gentle reminder.  Are you happy with the below patch?

Regards,
Biju

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Wednesday, October 23, 2019 4:16 PM
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>; Wolfram Sang
> <wsa+renesas@sang-engineering.com>; linux-mmc@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Simon Horman
> <horms@verge.net.au>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Fabrizio Castro <fabrizio.castro@bp.renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1
> support
>=20
> On Tue, Sep 24, 2019 at 07:49:04AM +0100, Biju Das wrote:
> > This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> But please keep an eye on the patch which Geert mentioned and check with
> your HW team if your SoC needs this, too. (You can't really test that wit=
hout a
> very specific setup)

