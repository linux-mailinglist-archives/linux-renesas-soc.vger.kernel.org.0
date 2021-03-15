Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD3233CA36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 01:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhCOX7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 19:59:35 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:4960
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232736AbhCOX7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 19:59:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSrrmy2/fpnXnGIMFX9j8KWJWy9EUnXe1EmDJ2OmnIELcSHt7NXOBPQI4JFhCSDJPdIDNsxiMYD1bFoziYmC3qhO15krIQsxPNkDbOMmXPXQKfx+GoLLQM9LpmUS8PuPBhIvWpuTO5cXOxYdwioJMn2DbgNSSYGdHl6VAkIE7XGY34fxUhkNWp1rR2soMKltySHq+ysQuq/fStSscwLToVY4iwu5SRPzNeHUhrRKNLKHOQ9k2+ouL14n0eIN5gZNYhVLgETrgJJJpJdqCxrCbUfqtac188q3ZROZfETic1yELtKRzTsifHi2Np3qzyV/sHvY7qbcAz6reO3TNirsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSxeQBu44MGe8avwDtDwUaqE8GCNbaG6832aCweOQEo=;
 b=LBpMz3Ks83kGxjGFsdW/mruikOuZMIPyb1kAKLY0ZzjyfPUCKZk4rnKOa792F8cSkhi4go3a9eUQsCFUwgdEnUIiQs/pUEEJPPIyXrBI9W1bLGCC7ZQTmgVIOWYIRaqEh4KKodnQwp7n7wJD04ifoqGEO6qa8/m5PHszXxiy73avgw3AWR9tXHwonK8e726Y23AyZ+YKJ8eRA5d6DJMb9DXiEKhmwVqznc7EjtUO6+QwVGsY+L7pD5x43yyWLswAqTmSo7ycxAbs/mxBiB4gMuuMyt84Gc/pMhA8DkOZavF+Tz8uPTPtkjmI7Sz6sAEBYEjZBzR13AjL0n3mUR1qJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSxeQBu44MGe8avwDtDwUaqE8GCNbaG6832aCweOQEo=;
 b=pWMbllwIMDksA+P7TofHqUEERguvuBH2ITr13F2tJB9cZGQuRZWl4SIKpt4AUPjBaxDHna2hqB0PQ94Q6UfE57FWNjggKjH1VCzvbwwz1ZsUAjE/yvcRGWcJMLGJLFEL61cAosP3B1z+TuVZJmRFFWfmCEJsJaKiyXkurLKPTmM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 23:59:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 23:59:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Index: AQHXFMXo4wNgQS9GTkW0a+Aab4SqFqp9FyLQgAGxLgCAAXt5wIAEwNuAgAC/9OA=
Date:   Mon, 15 Mar 2021 23:59:03 +0000
Message-ID: <TY2PR01MB36928F976EB10BB2B3D707E1D86C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
 <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20210311131748.GG3566@ninjato>
 <TY2PR01MB3692BAF4BB03CDFE3D904B98D86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20210315123117.GC1182@ninjato>
In-Reply-To: <20210315123117.GC1182@ninjato>
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
x-ms-office365-filtering-correlation-id: e28af222-9fc6-491e-b24d-08d8e80e4fce
x-ms-traffictypediagnostic: TYBPR01MB5391:
x-microsoft-antispam-prvs: <TYBPR01MB5391CEEC8B6DFF33B8E6320CD86C9@TYBPR01MB5391.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +0aAI2srNhEUjl/4CjBLQ+69cfWpJbrk20pgQeuIad9RONE4koq78UJMXkTyy7LDm+MvYYyWhkOEJ6A4ZhckcjnUGghlFjbjPIEBE0BAcewiVxHY2znTzxgPvGpdsiBnIXuG1PieBRLAkyytCLcuRtPfkJGwfwjcyMWaVjcSpM6+AiWv5dAQpBeBDMb7D4sNZeqF3/b+onPv0VChvZlXVpxZwW/A9hh799UsKVOqZn/ujsJA5Shp39Xkbrpxa2cMYqorOzEWw96NktfSa+4slJslYTa/A5B0BtKfP/t4quwYkIv4th/BCg9WPHpiKk3WLX9UFRHwlt+433dFiy6MMrpK2GcoAzRkqu4lx3+t/aKCrnDgc3HmtJ4PwPqAV6NrsWzdQhLpPYRqYRoMwHvNJxVLi2WGKhD6oUo2HbVuefqFScRhqZ+Ncj2PjinfOevyXQICJlRUlwFlRO7OsZHpMtsirjo5l9G8AuJCeQ6+G8aoolqFeTTpYfOiKKvpS1uO0Emwq3ZSmo853I4QhaPaA3vcjtPSlY0yTIP/8haavpfSKkGAJm1GvflsqqOTD8c8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(316002)(478600001)(26005)(186003)(86362001)(71200400001)(76116006)(5660300002)(2906002)(66446008)(8936002)(7696005)(64756008)(66946007)(55236004)(54906003)(4326008)(66556008)(52536014)(6506007)(55016002)(8676002)(9686003)(66476007)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?i/q8OKTiYustvNFVe6a7SfJCWzxdjcsKKaBXMWj02g0oL7xkvfcmuRPkiDIC?=
 =?us-ascii?Q?ho3pOH/CZ9hXFdLdP82lccaRTdd11BSiwg8VqUe7vjwtM44tjg5g0OtO1o91?=
 =?us-ascii?Q?xNs8lPFGBq814Uawfn5r8JA5xaAfjMnGiQlGxEyKiJxGMy+aTVK75sg1cFQ+?=
 =?us-ascii?Q?gBfv1O2cnx64+Z79oKMJmQK0m5nAhLOoIX6iAOoaiRVPUqdPLZg7Q5jTAQhN?=
 =?us-ascii?Q?B0KLWUNiUAI8m7bCxrfsv7CE5OwPJEUlHUyBm4fBy6bndkikihdcWPjDaI1b?=
 =?us-ascii?Q?lCxHw8ga/I8rzEFEDLd3mWaFVgW1kcb3/3NDhpkycWkmv22zCZftrbWGbQK0?=
 =?us-ascii?Q?Hged84o+91DVY5s/wbKS0ZJzeDTrMr7eJ/2E3La8GM3Ufywy+3OzxJtOZJkW?=
 =?us-ascii?Q?Lt1dra2HSMCNd9jxseScIvZtZTqa/JUePe78Rvcero8zmIpSsfQdJ7b0xzFC?=
 =?us-ascii?Q?zQFkpsUK8PIDPZBY3+B+lGMaFeovOjUnj4pKST9Q31r7qlm6/EoQZrED4fEq?=
 =?us-ascii?Q?uKoCBYqB0Rkdp8csSYB9oNQqXi8gZJAPkGhoa5i0C2P8Pu7aEiBv9aNOxYtw?=
 =?us-ascii?Q?8Al4EUaG6s50Dz0wP2cvlgfuiw0r5LCuKlWp/yycpOqN2Ahq4ohtg4C37/Mu?=
 =?us-ascii?Q?U16qVmMQsAOU3W4oECYYWvGaaviWUiDqASc3wm6O3pmT/GWhTXwNtr7+Nj2+?=
 =?us-ascii?Q?qCImA+LOpoaMNtMczpvBEtowwxn3BDW4jmmQSOMbTuFkx+ZBlqtvEfa8UvmE?=
 =?us-ascii?Q?uIdp8GHo47VtpiAfFn2Wtw0/yMi8/NXEt1wfk3GdEEpzyEzUIWw3TS7GYUQE?=
 =?us-ascii?Q?7Re2gNRNW4C49vNkdI2OvJZIc+7ileIkEDeetpM6zIKWjslwPtzpeTnBBOGw?=
 =?us-ascii?Q?i1/DPehByfCJoN9JiHTypTAWFOMdlAqT7lRHeUnuexuXHBNWdd01w/NEq14z?=
 =?us-ascii?Q?ePjnTvcqRmc7Yos6s8gMX5yxF7SrsIxvVLdfYsvXV5tM0AAqVKojp8Ssjwuk?=
 =?us-ascii?Q?nJwI2XyZr9y8loaLAcP8RdjvqVQRXwKcXuYmZUF80vbWFieYGTPpuxa/7cUw?=
 =?us-ascii?Q?rsHjGczWmi/ZHddgmCkgINYdDUcQvAquIO4/GnYGVTG+WCk+MdE8ojD4U67f?=
 =?us-ascii?Q?GwOPD+3uYHRkkFQ/A5CM8Om/qFkU1x2xETn8wgWGNG+ZlLZBSH5IWL30M8cC?=
 =?us-ascii?Q?KAYs8o8STtMIuhxinnq7yGOqxIBGE5KhsPoWcW1qRBjkmqgdetvTGuxGxl0E?=
 =?us-ascii?Q?r8ghDFzZgXqP+8gBK2XbpdlPMYHLoqC6rsH/D25KQh4IkspJDVMWenFPHwCe?=
 =?us-ascii?Q?9QStvFJFyYLTkAh5uVkwoqGv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28af222-9fc6-491e-b24d-08d8e80e4fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 23:59:03.7458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2ixjLNiMOX4ihIU9LYlPdoa7B1dXRADhuIUFIBA9HSUGCM3ZTbW4QWmMm8NcRX5ilD43YQPdkkA79U9FeNY3vG/wrLQiuKM5Yysf/g0GmwCpmGvVCqijyG+DKrINXHv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Monday, March 15, 2021 9:31 PM
>=20
> > Adding the function itself seems OK. However, I checked the code, and t=
hen
> > adding hard reset into renesas_sdhi_reset() seems to break the followin=
g:
> > -----
> > commit 5b0739d76227fd5a3f02f014385bfa9c86e0404b
> > Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Date:   Thu Aug 20 15:25:37 2020 +0200
> >
> >     mmc: tmio: don't reset whole IP core when tuning fails
> >
> >     SDHI needs to reset the SCC only, not the whole IP core. So, if tun=
ing
> >     fails, don't handle specifics in the generic TMIO core, but in the
> >     specific drivers. For SDHI, we need to move around the reset routin=
e a
> >     bit. It is not modified.
> > ------
> >
> > So, perhaps, we have to fix renesas_sdhi_execute_tuning() somehow befor=
e
> > adding hard reset. But, what do you think?
>=20
> Thanks for the pointer, Shimoda-san! It seems it gets messy again, so
> time for getting clearer, I think. I will introduce a reset_scc funtion
> again which is seperate from reset_sdhi, so we have a clear distinction.
> Then, I will call reset_scc from renesas_sdhi_execute_tuning() and the
> rest stays with reset_sdhi. I have a prototype patch which I will test
> some more and  hopefully send out later.

It's a nice idea! And, thank you for submitting a new patch series.
I'll test it later.

Best regards,
Yoshihiro Shimoda


