Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8848FC46B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 06:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfJBEt0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 00:49:26 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:28832
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726628AbfJBEt0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 00:49:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvoGK9Gx3pnVP12GVHmz/sWclj5rBMasiJehLJjXKY9RpZqwUp1+LdJ5i2X1pOst1P2RDtt4k3lDrKHiHsHeY/PGgFlhUKd2OV8tXRTktXa3IC+VZR8czakOIZ9XZX/o56ikvt3poPKp88AMtlTiREBTWvYLt75TUkJcsNOz/uOAC+L5VaAWLcOkkSmfeKZc55nN1zpW4QLu95fnZ9Iv6OvHd4qk+GGnO65WmmEa6d7DCLtNLqKwAoorquItl16idnHrzJg552zfIWZydFmnrGZuXLnfNhtVb7FcXhoBPumH4BOXQujDPP9pB3+bjzJLNj7Xlu7vxlu2fApnbXXRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXcTWgQmiTb+tBucx+zH0e1DXzAKJizlbDY7kPr19eA=;
 b=RIJmxlZXPvou1mLlAOFlGufvQVHu89+ST5JksthPRMVPgwFv3gJBnZn+RvhHjsE9KH1Hu8QvkCi6iaSl4kMK9rdjExAwR3ys4KF12RnzvRbidQLnDoGcbQtlyKEK8H6FDQpvkcIOy9r2zAKlWqobn5p3oUJ/132Pnc7OJTmWuU9NaSR8yWtu4Qib46TYyBTAWtkyPDKXjKhVyCO8/VWEZEKDtq2FCUosxSby/oSAxHBfs7l/CStUVMwxthuvSXy7Y+Bph2hTsV1sSwhhGF9oVEqXY5l2A87zaut9ko5Cn/dsIhktJQ72VOFe6xt9NcpEwD4BL0AtDvGhjLhrboHeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXcTWgQmiTb+tBucx+zH0e1DXzAKJizlbDY7kPr19eA=;
 b=qlJEWUTQIDP7iEfsJI06egTEKQC8fXLPxUwHEeAzN9umAP6gUrWi9XQDiDDJsrHLrmL6OO26zjQaiY4RzgU0VQs8s/GIvxTEwS3reQQyjOFITu3vMbcb0FooEibVAjCbYTGiZBoKw94qGHDSQwFb73S3bYqrkZrjk+E4lYOHOw4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:49:23 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:49:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] iommu/ipmmu-vmsa: Only call platform_get_irq() when
 interrupt is mandatory
Thread-Topic: [PATCH] iommu/ipmmu-vmsa: Only call platform_get_irq() when
 interrupt is mandatory
Thread-Index: AQHVeILzu4iiuNfi/0+Hx5Z/WRrFZKdGxWcQ
Date:   Wed, 2 Oct 2019 04:49:22 +0000
Message-ID: <TYAPR01MB45442F203A35BD211C6FBE8DD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180622.806-1-geert+renesas@glider.be>
In-Reply-To: <20191001180622.806-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d0dc168-0a6f-48dc-d424-08d746f3e4c8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB488005EA32DEDB71E565F0C5D89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(478600001)(4326008)(110136005)(3846002)(316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsUa9ZARZA03mh0Eu7NLqL0QeXd3g7hY5BVkUGzVA0/98gEgtK1eW0Gsi47/L3aaNPKMMIBq0BaIyEEUj6W46jULV80+jlXNC7MFWkYeocywG4lpSVTemFwqUq+QSdvAI1Yr2WA202Re+fs80Y3IAC3sDCsOqniki7WSO2G9XNfQ+xX+NjuUV/kOYBj+neebjb5YpODL8vbW5jfQyXJ9pddOIP4RfOgfz6WJ6GZmF5LDGkVaNAQ1ToRwSQllnTGFnTA3swNjpJi78c6nAz4azAGA16DBnnGqhQ9+2z5uVBnyTFuRqth4CXuUkCTL670yhBbMkP583YmXRN8RoIHwwOL38tKwyPTsDmBrPzkRU1DAGx+1rvQciW5Id2lJyIgki/+Oa+2fN+3CFS3tf1fuGT7VuLEVBGZCtqaLybq08WA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0dc168-0a6f-48dc-d424-08d746f3e4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:49:22.4219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVreoXuX20U1yIDYhrbUEm44nVdjBXG4URhRyRio4D0JJx5iHKMEKwFcgDkohifwb5RuIavNN2wC5GDOHh9DCX+D5bLoFO4QCSUtIl7QdkWtJOkaiLUG4M2k4vCRWxOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:06 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, calling it gratuitously causes scary messages like:
>=20
>     ipmmu-vmsa e6740000.mmu: IRQ index 0 not found
>=20
> Fix this by moving the call to platform_get_irq() down, where the
> existence of the interrupt is mandatory.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H3. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

