Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E37C47A20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfFQGiR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:38:17 -0400
Received: from mail-eopbgr1410138.outbound.protection.outlook.com ([40.107.141.138]:22545
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbfFQGiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe9aRn3yBpcWJlbeRMRLrXHov5SdIXtGL0ukBlvK0tU=;
 b=SF5NN9EaO04JezK1kdaJePSU25+YFOntdxT44i6G4jOdFYm18isHcfsLe3GJDZIYt7V8fme40J5Dooqay490U6EfTyHuQu3MmzXX/MIwy3RQxi4qY/ws6Ajx/0dfiXO6jQmULXt5awoWLkgYts3YZ29YHomoiKWUNhW3HxZr07s=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2485.jpnprd01.prod.outlook.com (52.134.255.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 06:38:13 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 06:38:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "hch@lst.de" <hch@lst.de>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
 merge the segments
Thread-Topic: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
 merge the segments
Thread-Index: AQHVIdGmGPEUTZUzykuLpLo4YRSl9aaaAScAgAVpc1A=
Date:   Mon, 17 Jun 2019 06:38:13 +0000
Message-ID: <OSBPR01MB35904746C1E9CEF1C404ED9FD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190613195839.GE6863@kunai>
In-Reply-To: <20190613195839.GE6863@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa52670-0d35-42e2-afe4-08d6f2ee5f8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2485;
x-ms-traffictypediagnostic: OSBPR01MB2485:
x-microsoft-antispam-prvs: <OSBPR01MB2485AA922F2530488FF5A42CD8EB0@OSBPR01MB2485.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(8936002)(68736007)(256004)(476003)(486006)(9686003)(99286004)(6506007)(186003)(7696005)(76176011)(316002)(102836004)(52536014)(305945005)(26005)(7736002)(4744005)(2906002)(54906003)(446003)(478600001)(14454004)(5660300002)(86362001)(71190400001)(6246003)(25786009)(6916009)(53936002)(66066001)(11346002)(3846002)(6116002)(73956011)(55016002)(229853002)(64756008)(76116006)(7416002)(66476007)(66556008)(6436002)(74316002)(81166006)(81156014)(33656002)(66446008)(4326008)(8676002)(66946007)(71200400001)(135533001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2485;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +3rLkP0GnbaxGZkyOqVpUrLpYVlmXJD9sWSb76hK0oR0A2OWv7Y9Qa/gHt+N+T3Rim12I5c2IKHDeJpCw5IZtQoVPPnYjbZJIx95L3WrxhipFYEM2R+u1GpoxF/1lXYSXlyKgW2fxLGSkZbuLe1OdKutcA7uypBPpKlDe2V5fDoqJg5Xuq80krkKwzga9Y8bWbPd0vMzFuiVqKK3SjQu7Kwrr4rbvYepzgtKRDM9ZHUs6IW5lNoMGhisOTXn+UNr+03MNY340lQTeXX0FyDWAx78Qo5NwjJEUBLl6mteBk3hJXkYc7A4HL1xq7yz9gj4N+mUPuzmv8NAC2lKL8+8GKSvxCoQ6ERCjutamUwmRLQ8boCsGv387qHd2j9nvQk7W810DlgOPihxsW3qMXrlY3NTMOKf8STkG8QgvGathZw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa52670-0d35-42e2-afe4-08d6f2ee5f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:38:13.7427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2485
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 14, 2019 4:59 AM
>=20
> > -	blk_queue_max_segments(mq->queue, host->max_segs);
> > +	/* blk_queue_can_use_iommu_merging() should succeed if can_merge =3D =
1 */
> > +	if (host->can_merge &&
> > +	    !blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)))
> > +		WARN_ON(1);
> > +	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
>=20
> Maybe we could use WARN here to save the comment and move the info to
> the printout?
>=20
> -	blk_queue_max_segments(mq->queue, host->max_segs);
> +	if (host->can_merge)
> +		WARN(!blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)),
> +		     "merging was advertised but not possible\n");
> +	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));

Thank you for the suggestion. It's a good idea! I'll fix the patch.

Best regards,
Yoshihiro Shimoda

