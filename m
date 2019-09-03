Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B14BA61A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 08:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfICGmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 02:42:07 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:5562
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725919AbfICGmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 02:42:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMrIXzwPitZnw76jKP4+f9UQgA1VfcuzVbJJC7r1BoDp3rUCUe8qtvkN+vb1t7mcLs6k756fGGM1D7WseH/ELWt3kH85FtSO9ReZNHYZSB4Jnbyplpom9c4J5DBNvwo9+Kf6nYqN6Lr9SDu6bJLGUQPbis37rq5fmVnRKsquZ4OPc/xoAoMfdAS6nUbu36FYtNww41cArJ/+ELX3WL5lrPl39lzWZ4TSa8J1B0qnu0ZIA/QoJmSFhq30Lr5W7wCpnoBgRUKxEuHUdNLey0/XfYhFoaC1Or8M6bXFtQ0WPfHvXee44TuK54W+4rc2U0yyGkKNjjlGxrKQy1/qBIM5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocw05ZN3JO3zFg8qoJWZGcqy42udnHpIDET+/1Hig1M=;
 b=Rd13KDkUk+Z7W8154UbC6ToJSWeCwzgfwgPSeNXnqLBwqRonCFMYZcf6Uf02WtLSbCWW5sGpVWIsliQFYlH5tovwMZ56sHfjHxqruoc0+jWIfov32MomUf1D/m7M7qeGYST2oPw4JtthWRv9C/zzTpARAGcV6YdSR2Ah2mGiAPBIye//Iw8nv/axB2sDtrMdUzyfSZHLYhelXNFSk0rmIpnIvvvF8o3sc7/+u4twtSdc8AClPyauJeeImOQoKvjFFQ+XeWAtulFdo2kS5pNAqa3V23/o/FPcb1oyxhBrmvnCNByraboj10sQ2nmIj8CtpqDB0Ht1UGFJaA4HKjowYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocw05ZN3JO3zFg8qoJWZGcqy42udnHpIDET+/1Hig1M=;
 b=NnO06CovIbBqdNL36uZXxaL5pLQzGqYdHOkvWVfRqDCS96FKVxYxw0n97cAe1XB01cqq6aMyeyHey1tRNKzRc9+RKWJL4zY/exC2txbDno2ZD2bR7dgrywB+cHixaZedFn/c2GiIQUuCW5YPkFYlXg4Rm9Rdp/Fo869zDGCS8VU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4686.jpnprd01.prod.outlook.com (20.179.175.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 06:42:02 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 06:42:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "hch@lst.de" <hch@lst.de>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>
Subject: RE: [PATCH v10 3/4] block: add a helper function to merge the
 segments
Thread-Topic: [PATCH v10 3/4] block: add a helper function to merge the
 segments
Thread-Index: AQHVXZ1a3dgM7EWWT0y+9VldzhpkbqcY9KsAgAB3rzCAABuDAIAAAUSA
Date:   Tue, 3 Sep 2019 06:42:02 +0000
Message-ID: <TYAPR01MB454479A82FB240305961035CD8B90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566995743-5614-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <e549e8e7-9dfe-6f68-2148-f49a9089db37@kernel.dk>
 <TYAPR01MB454492ADBC8561C0BEC6F449D8B90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190903063350.GA16908@lst.de>
In-Reply-To: <20190903063350.GA16908@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2beca01-60a2-484b-4d09-08d73039d42a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4686;
x-ms-traffictypediagnostic: TYAPR01MB4686:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB4686C35642E228445662B1D2D8B90@TYAPR01MB4686.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(74316002)(71200400001)(316002)(71190400001)(6916009)(33656002)(6246003)(4744005)(7696005)(76176011)(6436002)(5640700003)(26005)(6306002)(25786009)(7416002)(102836004)(66476007)(66556008)(66946007)(66446008)(64756008)(9686003)(86362001)(76116006)(2906002)(54906003)(6506007)(53936002)(3846002)(6116002)(99286004)(186003)(2351001)(476003)(8936002)(55016002)(52536014)(966005)(2501003)(4326008)(66066001)(7736002)(486006)(8676002)(81156014)(5660300002)(446003)(478600001)(81166006)(305945005)(1730700003)(229853002)(11346002)(14454004)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4686;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vd4u/zVGIFd3sYUr67XhAvsrDLolYmlEfVFEgx3OroApzQcp9yQeiY5M/ENCFFmk5jrR5j19BaIRHwhIB9opJma3gc3AzB2fDnZ0G+FmpN3WzRK61+Q4TUIVMVt0ohRl0mUE4o92XyCVDFeEpkkQqqo0AoKBtBThpFHJK2r/2waQSICcRk3GflUJTX2WDoSiFY7jxMBv/wJpSJUDLH8wi/MPlrfVd87vSUtMRpf2DTd7Ar0oSmhE+E5yKA45OpCYbleI4iIZdn5SbSr3vt9OceYgBe7CrAaX8MP+SvXBw8W14xwEA0ZhbLftwIe6t2QtOnaOC6/q96ZK/hOb0TlTyVDBe1nJnXf6MS3TMFm/957vIz2Z1Vn2IuyXvfapjqiRHKwNbp6KNV7mYKN0dhiqGhkEHH0ps3EacKmAmACVACk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2beca01-60a2-484b-4d09-08d73039d42a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:42:02.5776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4+7j+sO7sih72WXh4AhNoMWgaqGlYDvVZgXjOOuVDZ2AOSlr0GnuZCnrkAT5ujZ3R5CXdEYQv6xm3JEU6woTQWSAJBSpyeSuZKvY58NpoKvXNEoGQZII4z7yiUo/Jg5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4686
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> > Now this patch series got {Ack,Review}ed-by from each maintainer.
> > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D1=
66501
> >
> > So, would you pick this up through the dma-mapping tree as you said bef=
ore?
>=20
> I've applied it to the dma-mapping tree for 5.4 now, thanks a lot!

Thank you very much for your support!

Best regards,
Yoshihiro Shimoda

