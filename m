Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327672DA598
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 02:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgLOBdS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 20:33:18 -0500
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:32997
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729980AbgLOBdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 20:33:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqJwmXjGNnuZ+/z9IeUElscw1Niwd95aCS8h6XTIXQnTnxE+xfaqhr+S+JiYmji+Frl1V6qF8xGh3kXNYLFP1VHfiqCd47kzrMAln6r1qX82vqh56VX1fNHeP93c12wg4rpV37LGTz/AJPt0Ie5KH4QZRvQOB4yoveYZp+5Wrqj8LPlw5+TBP6LQPptZbq4bJ4VZW1+N6jPp4xI4P/y4Ai7fLwxOUjkXeTRgNjqY7mJ3VVXwXW2FTfOaggQWw5+Op5kgVHqmtErVOM+Xn9M0lRCQFD2+bw+bWXdyJb/nxKWkjCFHOZyF0wW4bVdFcQO13kf67PzdwW+2G82t+h314w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcuwLeXzTwMh3k8XkVnmPxzScRueCwOCRqENIMY5k88=;
 b=coc9QFiluSg2dk8nkN5YYZNCLfMNriqrLjqnMOgfDT3TRJbx4mPzqrb//GP38W0mOhqUHPLVIWUxpxYe1rDhoA7FqDRvm8W5LVKyCW2dBpW3DhCVJ19GhYZ4ZhDYssfmUAY7k1ZCzkWKpaPdxE9AWLRh0NlKs8gEc9aa+UTxz9+KkjLvzPao+1t37Mgj36BuhWYRSv8tXBS8sXTlK5LqNHbS1Kr/EbE5hyLzJ0DJMQlhZEMVotNMOAdXHOsr162EEwjXZ7MONklXRpKDRS5LsTqEEeexd2Emorr62v5v5AMDVegYkt/v6U4SOKD1k1vnfxuuQMxYmMi7I5t57arT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcuwLeXzTwMh3k8XkVnmPxzScRueCwOCRqENIMY5k88=;
 b=gKss/t5D6wE8zaW1Cs3dNMpPfZdLSJKboCU0JBgnIZcgXn7/1JAWau5rZRd1dMcw0IiUVw4p/7n9JED33ZDy93nff3dP4m0VRe2JaU1C84cqP8JiW6usyNOuWmDcK5z7JrErDSSXKd/PQMBQ7ZEea9Wlu7t0o/tHpdaV1ljAyAg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2223.jpnprd01.prod.outlook.com (2603:1096:404:6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 01:32:29 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 01:32:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Thread-Topic: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Thread-Index: AQHWyj/XFRA8x/qYgketk3GLo6qcL6n2zRCAgACZ/JA=
Date:   Tue, 15 Dec 2020 01:32:29 +0000
Message-ID: <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201214155001.GA950@ninjato>
In-Reply-To: <20201214155001.GA950@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:d95c:2734:f16c:3219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc3c683c-a5b6-4236-6523-08d8a0994937
x-ms-traffictypediagnostic: TYAPR01MB2223:
x-microsoft-antispam-prvs: <TYAPR01MB222321FD2089DE64997D806FD8C60@TYAPR01MB2223.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KoEOfgQ3uDQ+jJXwVzDA0VbMdWSoVao3rXdFIYZZtl1hkYWhSW0HiVH8PA3YEMe0fr+qZgKsHjmEzyc9zS6c0KXEYZyriYt0obMDQNpsr1KKpoyvnZsxTAaP9ZA9rX8JETfUpB6ciPO5Aq17n8GOYW9c1NV3S3SP5ZpuMIGkXxsBblFa8x4RuIpvgEch8M1kPl+p69JFXNBnzaBJktMgTMUHIfK9TJDx5ug+5+YXfI0H3gj6t+eP3rAgLEfDKQ5WGn/cvADCBoxCvXpyr1KI792v2mbgTKz9rHdAhQg7FYWEhJB0rqc+bRby6Lwu8x1niV6R33KRakc1W662Wj0Z1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(186003)(4326008)(71200400001)(8676002)(5660300002)(33656002)(478600001)(52536014)(66476007)(7696005)(2906002)(64756008)(66556008)(9686003)(316002)(76116006)(55016002)(83380400001)(6506007)(54906003)(8936002)(86362001)(66946007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Gaatl3vfusAmxxeTPVqPgz3D/FOQdAjewIrxO7Fnl0IS0OHaaZ7FxTr3c61R?=
 =?us-ascii?Q?CGi97SnauYSfpDgR2UHCEjNl1mCOEL0m+dC4hFm/29bPafZWLSYqLAeQ5W4L?=
 =?us-ascii?Q?eBPc1IT7tKF0Zw/sO5qhyiIoGH99D9JMsTQgtCjgjGV9xgSMUBLVdhWaYHcV?=
 =?us-ascii?Q?YKXJOJCidwZ5A2W6+iZYfK41yqIvoHhIDMaBQ360R1FTrjXJvOVxbbLbFm5k?=
 =?us-ascii?Q?rpyEuL1gDzCEwLoMIRXF8fyPyJfYtA0lWJVTuslfeghD57sWzP2BA0gAsH45?=
 =?us-ascii?Q?72VgW70XNnN/2ymBCTCP9klGTMMCAbwRyfq+YNlMTHuoC8I+dHzKWnn9/oRc?=
 =?us-ascii?Q?J4kfPnrrTg6gjSIQ0+Ol3QoKXqzOEtKGXlPIelkBlNjjVVPyt/L27tEyxHEj?=
 =?us-ascii?Q?4ZfWBzuXaklMx+O1z7n4VVWPmHQ/LTQZuD4YLr7ld7Le3QoxaHcDbr1mUh3s?=
 =?us-ascii?Q?MtV43CUouy7msELzJ+6l5ozbGHALOAyxPYrvm1iObAxv6PMAUCTqUck+2L9n?=
 =?us-ascii?Q?4L2KT97RPb/C3xGM+5LoZkew/g4XuVWquUkpdMSQiAIIhvvgpLnIfbg0/1zL?=
 =?us-ascii?Q?FVWVGf9Pef83oqvmzjKyguIVYnz8R3A41uOyVzwSXfeIwuifWf5mUWmeI7cc?=
 =?us-ascii?Q?3FOA3yRM9Up5nAO/DHAbJ1skg9wWUBWA4TPQkHLB2nePbR2XEWjEHC682Wgp?=
 =?us-ascii?Q?Qsj1ky3oyqh3VK407En+TAadKUnSDRr25YjNA1zJ2jRoqSRRyFUpoUQFO+c9?=
 =?us-ascii?Q?uwmAqwbOFGwCq88E9ByMEmilKjRNglWZJ1ndyZJ+5bNo7tn+OXMNKvBC6lD/?=
 =?us-ascii?Q?XKRbLXog2sJQvZ/i479Ftts1B5TVsnGnzINE4Mk+wU0z0q1Ep72IwbYqZZJu?=
 =?us-ascii?Q?xHvMuIqppuTeaICnrcZGnSWPyVZsF9bE9PFZ6ICVqoW/Cl9i8JxtnxcKKEE0?=
 =?us-ascii?Q?+Qu8fWb39LwFuU5dlv3Fpr0atVlIqF5yk1T3SgVPtXo/6PheIXSHKwTvyhxs?=
 =?us-ascii?Q?CJqrOe68HYMPawGA/5H7MnPm062n7R9SAZnC+iToWTwOTHk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3c683c-a5b6-4236-6523-08d8a0994937
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 01:32:29.1023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: daR7JyjdTdy6IB7FDHJ1OEy05Y1Wvj1vZ2B/9afckhWNM3JLHB3PXKVzcRcYAQ4+1W/NwbS1ExCQMMRSSMyV7ExrZP3mank31GZGQS3DIRObh1/HLVPpKirUwVosMEti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2223
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for your review!

> From: Wolfram Sang, Sent: Tuesday, December 15, 2020 12:50 AM
>=20
> Hi Shimoda-san,
>=20
> On Fri, Dec 04, 2020 at 10:17:33PM +0900, Yoshihiro Shimoda wrote:
> > Add pre_req and post_req support to improve performance.
> >
> > Inspired by a patch in the BSP by Masaharu Hayakawa.
>=20
> Thank you for upporting this!
>=20
> >  /*
> >   * Specification of this driver:
> >   * - host->chan_{rx,tx} will be used as a flag of enabling/disabling t=
he dma
> > @@ -172,6 +178,47 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio=
_mmc_host *host) {
> >  	tasklet_schedule(&priv->dma_priv.dma_complete);
> >  }
> >
> > +/* Should not use host->sg_ptr/sg_len in the following function */
>=20
> Maybe a short explanation why we shouldn't use the functions?

I tried to update the comment as below:
/*
 * tmio_mmc_request() only sets host->sg_{ptr,len} and
 * renesas_sdhi_internal_dmac_pre_req() doesn't set host->sg_{ptr,len} so t=
hat
 * we should not use the values in the following function.
 */

Hmm... Perhaps, I should modify the code to use host->sg_{ptr,len}
in both paths (.request() and .pre_req()) and remove this comments.
So, I'll try to modify. I guess tmio_mmc_init_sg() is called in pre_req(),
we can use host->sg_{ptr,len}.

> > +static void
> > +renesas_sdhi_internal_dmac_unmap(struct tmio_mmc_host *host,
> > +				 struct mmc_data *data,
> > +				 enum renesas_sdhi_dma_cookie cookie,
> > +				 bool expected_unmatch)
>=20
> Can we maybe skip "expected_unmatch"? It is always true for
> COOKIE_UNMAPPED and always false for the COOKIE_*MAPPED values, or?
>=20
> > +{
> > +	bool unmap =3D expected_unmatch ? (data->host_cookie !=3D cookie) :
> > +					(data->host_cookie =3D=3D cookie);
>=20
> Then, we could do:
>  +	bool unmap =3D cookie =3D=3D COOKIE_UNMAPPED ? (data->host_cookie !=3D=
 cookie) :
>  +					(data->host_cookie =3D=3D cookie);

Thank you for your suggestion! You're correct. I'll fix this.

> > +
> > +	if (unmap) {
> > +		dma_unmap_sg(&host->pdev->dev, data->sg, data->sg_len,
> > +			     mmc_get_dma_dir(data));
> > +		data->host_cookie =3D COOKIE_UNMAPPED;
> > +	}
>=20
> Is it maybe worth a warning if the expected condition was not found?

If we could add such a warning, it's helpful. However,
I have no idea how to implement a condition for it because
we cannot use "else" here. For example, when this driver mapped
as PRE_MAPPED and then renesas_sdhi_internal_dmac_complete() is called,
the "unmap" value of renesas_sdhi_internal_dmac_unmap()
from renesas_sdhi_internal_dmac_complete() is false:

	data->host_cookie =3D PRE_MAPPED,
  and
	cookie =3D MAPPED

This is because this driver should unmap in .post_req() so that
this is the expected condition in such a case. But, what do you think?

> Rest looks good!

Thanks!

Best regards,
Yoshihiro Shimoda

