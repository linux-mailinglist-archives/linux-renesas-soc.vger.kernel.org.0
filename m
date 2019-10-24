Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD220E2A7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 08:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437753AbfJXGjz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 02:39:55 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:44407
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2436471AbfJXGjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 02:39:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch/QoyARsLcrKlUneeTfU2xdJRsoZCL+vP1I0g2MNpjU6iGKEso+OIFxkEkG8kRaFVYhnpuONmsF1dGB10WHU5/HUVtlpe59Olet6v0RbwRYlTNR7rLUFJocjX9EBdPijJnnKaqQlHOrAomNclXbjl21g68LTPLU/FHZai+76/A8Vg0WlkH6YpbKHNzzwCU7SL0k0RJ4qjyV3TOZEyRankxGC1fjiXQalJSj2o4PWnyhV2EpeSb9pswFBHCJxCNLO/s1/8R9PY0MvUsJAoB0xaMbZr6pw9560SKrhKoe04IO/bQH9SFozLmeBVTO2rTlYQ7YTtRT6E2XeXe97RnS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjjaIwnLi5srrfaCQRuIgERvRKKo3hvO8k7abb+7PFc=;
 b=RAVPIHT7qcBI/AfBcLY5zFjVBU55X0xsMNfqoU7aSESnBh4do81uG3HxYiU3Hs8P8/vfcNUY5dpkNdW1A46PTpbIf1AN8FiFsRmtkUIggr+RR0zfjFGxERr/7ZQPsHU1ppmOOAscFE+CgBaIlAlBQKuJfgTth6y1fQwyX8918Fu1xOMgoQQhfTMQVwRplW53Yfp4YxxwiCjXQQRTmhxAXKq2HtHy1OaIo1K3LW6YEDu/z6fhEdG5enWZT8SnDI+xcjGLg7HF8pkgwRKvyFzOlL0PtQC2ywmcPPkyVkZVBLQuvDj7FkPQOUhg5t32hhg4mzdzy/Gi4yvrceSIRMXRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjjaIwnLi5srrfaCQRuIgERvRKKo3hvO8k7abb+7PFc=;
 b=MU7D5v8h/4Wq7/lee1I2uvEwKA/PDk16KmKPzTS4G7Fqr6PL8cSHYF7kXvxpbvyTnFG9NEA+WPUvrRCDlnh4E07ImF1+I7tokuLXZq6Lx9O0JJ5PfnxLUxPnjRAXZNH1JiflHMN5X78NyMBttig1lmq5gMqCHp8MzFVPFZ1ExXY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2888.jpnprd01.prod.outlook.com (52.134.255.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Thu, 24 Oct 2019 06:39:51 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2387.021; Thu, 24 Oct 2019
 06:39:50 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqdohGeAgAEBd0A=
Date:   Thu, 24 Oct 2019 06:39:49 +0000
Message-ID: <OSBPR01MB21030FA41FA0FCDC874CF365B86A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 2bfaa672-ef88-48e8-4d16-08d7584cf861
x-ms-traffictypediagnostic: OSBPR01MB2888:|OSBPR01MB2888:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB288858212C637D73FB9D401AB86A0@OSBPR01MB2888.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(51914003)(189003)(199004)(476003)(6916009)(71200400001)(486006)(14454004)(5660300002)(54906003)(446003)(71190400001)(9686003)(11346002)(229853002)(256004)(76116006)(6436002)(4744005)(66946007)(33656002)(44832011)(64756008)(66446008)(66556008)(66476007)(52536014)(55016002)(6506007)(3846002)(2906002)(7696005)(316002)(66066001)(76176011)(81156014)(81166006)(8676002)(99286004)(478600001)(4326008)(8936002)(86362001)(25786009)(26005)(6246003)(74316002)(102836004)(305945005)(7736002)(6116002)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2888;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ky3dpfVzTvu2mqxQ3BnX08Yv++f70V4X8QBWbxqb08OVQBYFviHufVSkF3wxrF60cm+WTswVh+A4Ydviayf1stkBBYz6Tg15HOlWR0MUUKTsVpS9TqbSsipiSY4r2oCYZpohmvAMLqnyuYr1+dldIk3ckgJC4As91FOlR6jMdIAX52Za960WLkaY8Vs39FXbETPUa8UN+FKoSKxhtX12jfQGTeWw5TN8iu94E69KCQmQ42Dqk5M9rPVLvRrFipEvGEw6oXC8VIBXV3TfDHTX1HRQ0UyeVHVmbfVFyLcGfD0O6vc5XSNo9mABMpTX6X7QUQo0123l/MQ4KrKEx4Zzwj/qMdernoiGoTiWQqufmaQyClMUMS+mQAd0VWIAvsbYwMtLSrWtiLJJKV804Tvj5WIB6mfigv0YTQWnvUfJb0w5FH7zqd36Gqi7ZWITurfg
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfaa672-ef88-48e8-4d16-08d7584cf861
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 06:39:50.0411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIHGN4wi50INgm6GYd5/l03O3WHqeAWiULYGyAAx72anlfd1hGuM3EC1cIN89lkJpUURV4KY9T57igPcbzbNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2888
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

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

Yes, I will keep an eye on the patch mentioned by Geert and will check the =
same with HW team.

Regards,
Biju



