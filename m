Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC74F2DA750
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 06:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgLOFEq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 00:04:46 -0500
Received: from mail-eopbgr1320133.outbound.protection.outlook.com ([40.107.132.133]:18882
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgLOFEq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 00:04:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a00ZgkwizTlvuColDpBnuE7wzeaGO8KTvs2sXIVwwqm132wo0kSLqJ4JMoPdnYVi/LJqSxa9gFmO5WtTrA3cSPJxbEULgkfyJlybdu9PJMY0btpOZjTR8bZUQ+nofQrhdbrBlHkkBKRl5uIpY4PNtLX6JKLoDPRCoO21C0FWHpJbhqDEkhxdzd0zUnbfML8rAJnk0fua6sVdKnMrFiKNeGdG+KYZGT3iao5LqcwxTRMJ4vWPBcY8SR3yw3mVeSVa6Tfh8qPcWMr7H3JjIvSifua16WKSAenc5ND3AEe7bKRLVviwlw1m2VhKsHrHP4AyEbwCe7fBAx4o8GWAxs3qXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTD++MXhLCmeRp97a1hMyJ2281rb7rUGWEyD/Z45RyI=;
 b=N0kt+Negb/NrY6wUyXT1UsACNrFBEk2BoHlStzfRdffT3ZXAj1KVjSBBmwmYv9NnE3Qx3YQX4l+UliYgqxT+bZHd5GVrBbMJhkBFd9CZUHN24VMBUOlQvzLTHCkOsvMaLEke6HAUdnN1fpYfRhO0JITSurGqIZLWhvaiszT+cxFyka0IF6sSwIQbc4WCld7L83sEMDrz3ocgm6J2e4fyGjr5/rxXmpI4ccCzqMS+BcwVvdbeyaaBzzIaXFs30DYQAC1T4aL7v8kRxYMQpEDPa//UGGOaUcHd5JShBPCSbajnwSDNeZvh0+teiu2mZUf7lcLffq5n+3gbuYidewOxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTD++MXhLCmeRp97a1hMyJ2281rb7rUGWEyD/Z45RyI=;
 b=rqEF7jBG6+35L6q7vQe4bSab3bM9FPoK8oeZgzLi29wj856Rtbu4jlYZiar88dxR4QN2gnf+X18sSVDKBCg/6GxYvn3j8GfmlLFuuLMUechfHSfPN2aUrdeYAj7vIjrsPGxeniYu+8xwxG99dDdPo161RG85oycXxcqX41tMTWA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (20.178.142.214) by
 TY2PR01MB4220.jpnprd01.prod.outlook.com (20.178.142.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Tue, 15 Dec 2020 05:03:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 05:03:09 +0000
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
Thread-Index: AQHWyj/XFRA8x/qYgketk3GLo6qcL6n2zRCAgACZ/JCAAB6QIIAAJDvw
Date:   Tue, 15 Dec 2020 05:03:09 +0000
Message-ID: <TY2PR01MB369240E88E0629EDC140D0A1D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201214155001.GA950@ninjato>
 <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692AEAA842555886E0517B5D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692AEAA842555886E0517B5D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 95c45c7a-35f2-4e10-ea6c-08d8a0b6b798
x-ms-traffictypediagnostic: TY2PR01MB4220:
x-microsoft-antispam-prvs: <TY2PR01MB422069E38E53A5A08D89EDD3D8C60@TY2PR01MB4220.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J97TO/WaIqZ0vGYuOlZ/PbOz5Nx3x9PWpjghZkqyS8978RXwJ12mJe2N6Jd8tgA/odvQm8NAHD52l0AYihQAkyE+T+in+1TgqOvQHOWmsgxBWCTAyVuJzhHC8UgTsAkqJ83lYjXVdTREymYHWZLuVZVBPnoUeZ6XCSV95mrRRF43DTxC4oWimXIsbRToinBj+09ooZNqm1GiTZwIrvRsjQ9Lx07VU7uciW/oFglKL5cjqS40iAgWlp/MSCv1k9B9I9CkIEs3uKrE297uELiRoWEPTRDrZNEnj9vqj7LZls0KO4fI0UV3Pb6pny5rcLAMb7c08jj1CLryB64G0dQBiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(52536014)(66446008)(66476007)(64756008)(2906002)(186003)(4326008)(66946007)(5660300002)(478600001)(33656002)(66556008)(316002)(7696005)(8676002)(54906003)(2940100002)(8936002)(55016002)(9686003)(6506007)(71200400001)(83380400001)(76116006)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fz0SkDgQ+IvvIEOPwRmx92qpt1A9fL2QKTsCTbkss2fh1KsLC8dZezYSuPUi?=
 =?us-ascii?Q?hDVgjqX7ZyIQgnySlMekLhNxmAckKC7I/9IwPASrf49i7RA9rpbybcqKDuFH?=
 =?us-ascii?Q?8UaZViNCiQerS9nAAz5/IXozf77ZmlHvXRu5wvEFfCEDuC9kL1qYodBEtJYQ?=
 =?us-ascii?Q?VCvstgiLiTCSsBVi7dwBDPPokgVHRobQwLckAxnsxFxvrUkqIxrHI4NC7oEn?=
 =?us-ascii?Q?c2qzDoby7k/eiyG2NZ+QVF42HzJyhhNl+yJUxYrchagfKXlMJUuQ1KEt9sEr?=
 =?us-ascii?Q?itYFsdWb8TjDb//Zvnz+3af3+VKWvOoP57qZRUK7Vw1am7Gv7lXb6MK3cGpR?=
 =?us-ascii?Q?rQ5VAjYenWJf8msKZkx4VS7hs9T9UPF7ltIl/NKBFj6FMq5IRXcOe33ckLq2?=
 =?us-ascii?Q?uBdudW0Drl19rCOdeYsjko0hz3DHhWcRlKk3/Cc2iMlrZ/QB5qSbrxrIobFo?=
 =?us-ascii?Q?YPO3PXDvW0+dp/3tvXa4BtG58yUR00M/UNIYqm09R3hHPwxeTrxcbvAxV0AF?=
 =?us-ascii?Q?q3Ow7mTJINgAXt4kyLlObbA/lZffRNh+3CSGUNq/B/8R205dMKZGwV8weur9?=
 =?us-ascii?Q?vs+r35YgDlGcYvGhIEgFpRVN3Gk3+2B0hcD0HUmKOHtpOr1ETqgx4BRECysr?=
 =?us-ascii?Q?MrrIoAnJVutT355pqKHBW5ntksZucj5jKFEZWbrjdX72D8/J1O+pjfWLQyFN?=
 =?us-ascii?Q?7cXkDB6/DalOPGnCrrZn+cW/xdqmF87F2gI36RF4USGL/kYMUbGHg5MtAeH9?=
 =?us-ascii?Q?/Fd4Yyg/1nXNtdcNmNUfY/USUPnGmx6cKN8imwWt2nS0F/ebn22uQL7x5ioI?=
 =?us-ascii?Q?7h3a3pQe+pDUvXUsC9gzgULcxNhuyDMFmcf+/oWrIDckmXnX0qgwKTyCxn/a?=
 =?us-ascii?Q?0B46slJiO4JusdxX8n1lR9UXXYdfg87UfQ9eG4VV9udmjNm1En8gUSGojL0f?=
 =?us-ascii?Q?pX3nGzXjZ9ahDBNLJQceQuWWhjcu6ziSgpkAM6OlsW2TXulVR35CnfM2Lnj9?=
 =?us-ascii?Q?UesH3VBn4IrSoRZCEXoLvjl7MvMTZsE8mh/y0F2p2thj/Z4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c45c7a-35f2-4e10-ea6c-08d8a0b6b798
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 05:03:09.7059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PUhKHTzOLKOGoVRUYhJ+ED4kPg7EI95+aUhkq9mv5/t7en5J/rmlNFJOTvbqJ5y1sECMmWFmbd7xCT88LUCs0xT/AGLGaRBNdZt7bvicNHFn50I773yAHUXtBU5GFkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4220
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san again,

> From: Yoshihiro Shimoda, Sent: Tuesday, December 15, 2020 12:00 PM
> > From: Yoshihiro Shimoda, Sent: Tuesday, December 15, 2020 10:32 AM
> > > From: Wolfram Sang, Sent: Tuesday, December 15, 2020 12:50 AM
> > > On Fri, Dec 04, 2020 at 10:17:33PM +0900, Yoshihiro Shimoda wrote:
> > > >  /*
> > > >   * Specification of this driver:
> > > >   * - host->chan_{rx,tx} will be used as a flag of enabling/disabli=
ng the dma
> > > > @@ -172,6 +178,47 @@ renesas_sdhi_internal_dmac_dataend_dma(struct =
tmio_mmc_host *host) {
> > > >  	tasklet_schedule(&priv->dma_priv.dma_complete);
> > > >  }
> > > >
> > > > +/* Should not use host->sg_ptr/sg_len in the following function */
> > >
> > > Maybe a short explanation why we shouldn't use the functions?
> >
> > I tried to update the comment as below:
> > /*
> >  * tmio_mmc_request() only sets host->sg_{ptr,len} and
> >  * renesas_sdhi_internal_dmac_pre_req() doesn't set host->sg_{ptr,len} =
so that
> >  * we should not use the values in the following function.
> >  */
> >
> > Hmm... Perhaps, I should modify the code to use host->sg_{ptr,len}
> > in both paths (.request() and .pre_req()) and remove this comments.
> > So, I'll try to modify. I guess tmio_mmc_init_sg() is called in pre_req=
(),
> > we can use host->sg_{ptr,len}.
>=20
> I'm sorry. I was completely wrong. If we use {pre,post}_req,
> the MMC core will call pre_req() twice with each mmc_data before
> pre_req() is called. So that, second pre_req() will overwrite
> the host->sg_ptr. So, we should not use host->sg_ptr here.
> So, I'll update the comments like below.

I'm sorry again and again. But, I realized the current patch breaks
"force_pio" mode because tmio_mmc_pio_irq() doesn't take care of {pre,post}=
_req.
So, I'll try to refactor tmio core to support {pre,post}_req().

Best regards,
Yoshihiro Shimoda

