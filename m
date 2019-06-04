Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48B4B33CB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 03:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfFDB1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 21:27:44 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:39359
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726163AbfFDB1o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 21:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GumH3cUxCUa8zHUubRNuDfYkdOUGiuDIruYwkwan/4c=;
 b=REcAllaeFT+gRb+e3SFi4J54noOQ8Qe1i0KLBi8K+sLhyruOCm42j4yiGyP+WsCjbYZpGW/M4Jnyof8gXhgz0lg7CyjiC25EpxxZaPn7ed7Kr3nXbPhLqnK3a5cNc8x0UVJqSB55eSBLfhKJYgAp9vdYBB8oSuhF++bmHvFkXzw=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB4434.jpnprd01.prod.outlook.com (20.179.176.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 01:27:37 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 01:27:37 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 0/3] mmc: renesas_sdhi: improve performance by changing
 max_segs
Thread-Topic: [PATCH v4 0/3] mmc: renesas_sdhi: improve performance by
 changing max_segs
Thread-Index: AQHVF6LwJxpsbiS4bEWwJlJM7pbMcKaJ6GWAgAAEJYCAAMr8cA==
Date:   Tue, 4 Jun 2019 01:27:37 +0000
Message-ID: <OSAPR01MB308953D4E7A7E187294F9299D8150@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190603125701.jkmpkvctrtlj2io7@ninjato>
 <20190603131151.GA6147@infradead.org>
In-Reply-To: <20190603131151.GA6147@infradead.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61066673-afa5-4df5-ef85-08d6e88bd43a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB4434;
x-ms-traffictypediagnostic: OSAPR01MB4434:
x-microsoft-antispam-prvs: <OSAPR01MB44348D915A9A0B842A07D462D8150@OSAPR01MB4434.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(376002)(39860400002)(346002)(189003)(199004)(66946007)(74316002)(66476007)(55016002)(66556008)(73956011)(7736002)(68736007)(4744005)(9686003)(486006)(64756008)(229853002)(33656002)(66446008)(478600001)(446003)(25786009)(305945005)(76116006)(5660300002)(476003)(86362001)(14454004)(71190400001)(6436002)(256004)(11346002)(66066001)(71200400001)(6246003)(4326008)(52536014)(316002)(110136005)(54906003)(81166006)(81156014)(6506007)(8936002)(8676002)(102836004)(99286004)(186003)(53936002)(2906002)(6116002)(76176011)(3846002)(26005)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4434;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LeurAyu8dQVpBP242Cp2yuOnjASf1RqUElkAi9sqJ4glactmSBLMrZdgRL8rL5aEhwjHEp/ihgLi7uyOsJRRdMSei8voBX7oS2QAjOcQ7PiqLiURrp9G+LlooKk1NENLASyfM8m0dhMS9K6B6OviLYai9GlgKldYgiGe4ao0JCzXFobXUSMRqotvlkEAoIOZV/4ujiRiasj0OBDY0/Dh1cA82yCQkGY8c0E7pnLhMDKE7snGp0EcsCq1wSGcAGyMD4+eaPUN0YJZgeC4n6wElc3DOZNUwNezDxet5mnWEu0k9yCbNo4am++WsNdNH1O4ZbSntaVtC3HaUMj/32hpB+GYk1sEl09h/a91usBEaoaABJ3P046oPofmcouJyTaJHEkBabFfzS1sWSe6q4l5FF3B71KwqKgRQuGVwXTHNRU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61066673-afa5-4df5-ef85-08d6e88bd43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 01:27:37.6875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4434
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph, Wolfram,

> From: Christoph Hellwig, Sent: Monday, June 3, 2019 10:12 PM
>=20
> On Mon, Jun 03, 2019 at 02:57:01PM +0200, Wolfram Sang wrote:
> > Yes, dropping my rev on patch 3 is a good thing to do. I added Christop=
h
> > to the CC list because he gave valuable input last time.
>=20
> Assuming iommu merging in a driver using the DMA API is always bogus
> as mentioned last time.  As this cover letter don't seem to include
> any higher level DMA subsystem or block changes I'll stick to my NAK.

Thank you very much for your reply again. I understood this patch series is=
 NAK.
I'll continue to investigate DMA or block subsystem to achieve this. (I'm n=
ot sure
I can succeed or not though...)

Best regards,
Yoshihiro Shimoda

