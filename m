Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADE72DA699
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 04:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgLODBu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 22:01:50 -0500
Received: from mail-eopbgr1320124.outbound.protection.outlook.com ([40.107.132.124]:6172
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbgLODBi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 22:01:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V65dwTdhuVzs7w3GyNbvkbufHQ0TkxFcK8l5YqXCg8zw1x8IgIr0xW5FPyYrmA942ynzuX0T4J/q7Upqh/0MePWKsdhEVyurVr2MWou7JTajteDnqC2ibDUoSwQGCgVOAFtaC7mSMhuSEi72Tne1bp24xH7LZg1/9/fsP3lRo4XDItHp2YF2TjUY12BISNum5JMwkRIA8BM20n5qxdg56RoYgwhggz7CvCVpXRB9QvfdYo7R1AeP+Hr2HpRZK1B/52Ow3y50l7Pc7fT+y2/esSjg6eI/LuWklxy0Pn16M+XGM7mdDQDUvXywrc6SenlMoCJAib2YRDwsQeb9gHmgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWBHWsg6sDU0FoC2k1puQigsee/gANKanrbOHGtplaE=;
 b=DYQKdkSYLR7M0c1xI/Tdo490NY5SLb0+xeUtHnJKunN/TKCZsXXlqrGYfpIL2yh9ryUui0+uov/M/lI8FQvrKDul+vMZqZlFdMPJ9fEp0GcPIKlQ9rVpcWEZXup1B5BK07tC4Pag143QuCqTVIIKnFjVy+L6ZJXQy4hIhU744ZSbgIqr/VJUAC+rbhKhJpVtdmIdpWjdUts3wChi4m8s3kkPf4bubqrqdbXLTNoiOdBS3E1/xFViR57ly8JGErgInTNoGVmklt9khKcGY+qhcZ6qSx+ZR6IIH17lAIPmCG3rxCn+US61bTTz1/zLHdL0g62XeuE4mK7ZmPoHe4wWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWBHWsg6sDU0FoC2k1puQigsee/gANKanrbOHGtplaE=;
 b=kJRgGvAuNYgDWboW17LlekGfRxyxxBRNV4xu0kn4028pRKvckHef0Hmar4tacLMpHhE0C6wYk0+yeFFXZnlCDT/HSOoEpD/c0qFhQ40RIMhhG6mK9sJoNFMtyGAHV5quRv8jN0zS2Z3ER9WALSX5ugljzw4/TO+I2nzyfsYPuZM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4300.jpnprd01.prod.outlook.com (2603:1096:404:10b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Tue, 15 Dec
 2020 03:00:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 03:00:03 +0000
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
Thread-Index: AQHWyj/XFRA8x/qYgketk3GLo6qcL6n2zRCAgACZ/JCAAB6QIA==
Date:   Tue, 15 Dec 2020 03:00:03 +0000
Message-ID: <TY2PR01MB3692AEAA842555886E0517B5D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201214155001.GA950@ninjato>
 <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 9501b197-323d-4aeb-0ac0-08d8a0a584d6
x-ms-traffictypediagnostic: TY2PR01MB4300:
x-microsoft-antispam-prvs: <TY2PR01MB430023100F30ED95681FC6F2D8C60@TY2PR01MB4300.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bJwWB7/FX65efz+sqt2P7bytR4nFTQGwpLFHp2GxSPndWxv6DOguh2VP3qy3FWkGMc7rsBeFlokmhGIcUqjI2/t1H2Ck6TN/HFqJNLGUQwEMvfxunX5pPG1Ip4gRVDIJc+9jnE2qXw56Sfxg63h8DkQ2zhu3hloWB+WAskW7nuD/yKUXMDaGOkeCmqBfyDw7wkExEMndpkVllE3DJD5cqqN4mko/SyUfFR7jsIuiliF0bNxlHhxOc+NXUHuK+Ghtpbe/O66E7Omts/RCGN1eCLjHH/YletpI1KDdUnNByANCUiteENTEgyt2q2FtVWZpwJBiT92kU5EsBtoLc2fAhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(6506007)(86362001)(54906003)(5660300002)(2940100002)(316002)(71200400001)(186003)(52536014)(7696005)(2906002)(8676002)(64756008)(4326008)(33656002)(83380400001)(76116006)(66476007)(66946007)(9686003)(55016002)(8936002)(66556008)(66446008)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fLnMrAhtXjbTa6dZvsi7rAPHEM7jAaD49gWABsuW0Kh2nND8Av9uPtYsDZur?=
 =?us-ascii?Q?yPKRJ7TwfZt38VWk6w8RPu0TnRG+Qxm9LAKhBQFf4M6HmznBdjAT/XwoD5sU?=
 =?us-ascii?Q?j5HoIB6s2zFRDU9TjZGp/yGB4T5IQevxrzxcsOZHxXEiC0/y1XcEqWGI2uXP?=
 =?us-ascii?Q?7OJzIw4XfC/YbGUB0tk/T5qmcjt4DWeP2QVGP6VVzXSoAdQgmKHtJMd94sob?=
 =?us-ascii?Q?3skZfEgue6dSQGV4eVZtClyLuDXv5wiBQB2ctvm9WgDl6J4pF3QiSTCUZ8ZG?=
 =?us-ascii?Q?NexlCNpKeQhVsNjYXojlZ57ldoNMcxh3ueHDOott9pHev4RiDwDBywN0TMsB?=
 =?us-ascii?Q?21cxwe2EAwiXlgMj3fhwParjY0Ul7P+cdvQZoqw/xTutTPRORs6s3A0KuTvh?=
 =?us-ascii?Q?vCMsaHkS0p2uRkOEX+KRP+kaaOPE5UH9cAruTYJMwtgLdSHD3YxH5OO4h7T2?=
 =?us-ascii?Q?4WWOu1Puw8rNWpcLHyKjsaZeKgJbEKG1yvJjHj05lJW+p69kaci8yizphdrD?=
 =?us-ascii?Q?XSiwVVC+4AeF6Pjo8niQy0VQplhsl6NCXHfp7n/LzaqxJKtobiEHG9HFkqPl?=
 =?us-ascii?Q?j+XituXstD0RTcNJ5rWY8tgsuXO9ALYk1msU1C+Otdt5njMlue/7PO1ZNJYB?=
 =?us-ascii?Q?OcBhfDvFbrSxDjGN14aQAjsJF/hUPoTFsmmRMUkkoWOEOL6v2CnTLfCZeesb?=
 =?us-ascii?Q?v3x0RQcfWAUydPKJAMBonN403NkaumlBz8eIneE184Ua4TvjOHy8AnlSlvCc?=
 =?us-ascii?Q?mz4qSHixylhGsoZjQzi9EBUGPRu1tqCVfatPv5gGljFgCwT6LWNlFy3KlCUF?=
 =?us-ascii?Q?c0jf7Pdm1oz4mbAJHiEDhJ5VBM0Jp+9AcOOf6djBZVnlSRd2ZkmpKFEa/W02?=
 =?us-ascii?Q?24BYck2lyO+ciX6QKhw5I2ypm1jmnlaTcGC8W/W5mBMynCIGOjvLyRccIDQb?=
 =?us-ascii?Q?vHjQuo3DdLjmRXlli93JDrfSGaoN+4vQdoRP9SI/xTUvbRxD/Uwwy0PDMKHs?=
 =?us-ascii?Q?8FfT2pLzeqFP9/yuKyy89/TbR7qLr5N6jezh0moFelJMIfc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9501b197-323d-4aeb-0ac0-08d8a0a584d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 03:00:03.0693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wF0O1zH4Nkmje5KPLP1epoWkFAsuehmcbFuzUP7Dr7/CB8H3D9pVeWKnRY7V0wW/UDeyYy7pNYTlguKpPtL8bP1rAAW/p1KaVnFmp8Sh5XnQsTtcEz340s+/Y/ZTq00Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4300
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san again,

> From: Yoshihiro Shimoda, Sent: Tuesday, December 15, 2020 10:32 AM
> > From: Wolfram Sang, Sent: Tuesday, December 15, 2020 12:50 AM
> > On Fri, Dec 04, 2020 at 10:17:33PM +0900, Yoshihiro Shimoda wrote:
> > >  /*
> > >   * Specification of this driver:
> > >   * - host->chan_{rx,tx} will be used as a flag of enabling/disabling=
 the dma
> > > @@ -172,6 +178,47 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tm=
io_mmc_host *host) {
> > >  	tasklet_schedule(&priv->dma_priv.dma_complete);
> > >  }
> > >
> > > +/* Should not use host->sg_ptr/sg_len in the following function */
> >
> > Maybe a short explanation why we shouldn't use the functions?
>=20
> I tried to update the comment as below:
> /*
>  * tmio_mmc_request() only sets host->sg_{ptr,len} and
>  * renesas_sdhi_internal_dmac_pre_req() doesn't set host->sg_{ptr,len} so=
 that
>  * we should not use the values in the following function.
>  */
>=20
> Hmm... Perhaps, I should modify the code to use host->sg_{ptr,len}
> in both paths (.request() and .pre_req()) and remove this comments.
> So, I'll try to modify. I guess tmio_mmc_init_sg() is called in pre_req()=
,
> we can use host->sg_{ptr,len}.

I'm sorry. I was completely wrong. If we use {pre,post}_req,
the MMC core will call pre_req() twice with each mmc_data before
pre_req() is called. So that, second pre_req() will overwrite
the host->sg_ptr. So, we should not use host->sg_ptr here.
So, I'll update the comments like below.

/*
 * Since pre_req() will be called twice before post_req() is called,
 * host->sg_ptr will be overwritten by second pre_req(). So, to use
 * suitable sg pointer, should use data->sg/sg_len instead of
 * host->sg_ptr/sg_len.
 */

Best regards,
Yoshihiro Shimoda

