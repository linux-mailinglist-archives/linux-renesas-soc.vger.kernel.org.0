Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A463C2D8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 08:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfJAGjQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 02:39:16 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:59712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725777AbfJAGjQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 02:39:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du85uetPbfuU6+WYuclCfnF4Irbgiqk3ZHyn2eXi5BKqm4GjSQiUeBu/HHjwd76VUh5cZlMliKewvhG+6RzdC3svc+OQZ5gFpAtwFkqOu5QcgS8IyOpcX7fFpo/RAhe99cSKDnaiADJgaWxWiV9IiZzQGkMzBMHsVu6jnEQJpvEpegWsqRafkoRH8Ud+kHu55KyEvlq/7AXkMNPFx6CxGqnX2Gkyh3FcaxepczvYwDAteHRqd/tFDHGzxukmz0PXG1/tWWYO6j5sC37U4ote2vDlgkAHIEQNxNX+C2lDm8OrR7LxWlqsOnrCjMvgeY/M9xz+IsFEsh04ej73oZKHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsqFKG2ZbXCscqFAJMhj0x8amFcVFZCjDBV78pkGSJk=;
 b=Zi7eO/DMVtMTf87x0AYKVZFPRBdBzZ9c3wH/lfsP42m0h9JKpzk6EfDdKS/lrARD2XHCp56cmJEV/j6tMVJe9/AGnsgVtPyyoon0L9waQhfaJ/2iWqtAo2GxpG4dW/DOZaVes/2yt7vXpDTAhrvP7M8QBdGJKsEV5LWdnfUeUrX2/mBeNkwMDpoh+yP48yrxpKTygIn9x9ieZBaw4nRVvtEs1xwjR7KRnIX5S36WjSMEeBpbNtMMDMFSCGeZJMJdpwCIyJEIOdiQi1K29AVogg1C7ByfKCjJDmbD6fM6e0jfqJGZkRAMm49COzide9x82B+6piXTe/LP3mmaQYmXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsqFKG2ZbXCscqFAJMhj0x8amFcVFZCjDBV78pkGSJk=;
 b=gYQczGyPwpsWtgssaq8HXowAaknWW4ADwLEpCZADkZHe/9kHJFN53IIgeGmhfYzWWQstPB/Q/qL4JKIrFSDuYHG7uTVnJJPk8H9Em51eesuvZwmVBWPKN+lj4eK1XWfwfXOa/PoeQuBduZ5ShvA2nnVOoZAMbgqtsYcBMP2sCvI=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1751.jpnprd01.prod.outlook.com (52.134.227.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Tue, 1 Oct 2019 06:39:12 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 06:39:12 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Topic: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Index: AQHVC+tiLLGvXBZAYUqFmAoy3pT9cqZ1Lr4AgND+19A=
Date:   Tue, 1 Oct 2019 06:39:11 +0000
Message-ID: <OSBPR01MB2103A204D26A26D5C8E35F3DB89D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB30894A7D5FE7983ED0D6E5B5D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB30894A7D5FE7983ED0D6E5B5D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e5ff54d-27ff-4229-1ef1-08d7463a1214
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1751:|OSBPR01MB1751:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1751DF15F45C41EBBDA64014B89D0@OSBPR01MB1751.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(199004)(189003)(305945005)(66066001)(55016002)(86362001)(107886003)(966005)(6246003)(14444005)(478600001)(256004)(14454004)(66476007)(66446008)(64756008)(66556008)(66946007)(76116006)(71200400001)(316002)(7736002)(54906003)(6916009)(74316002)(6306002)(9686003)(71190400001)(102836004)(26005)(76176011)(99286004)(229853002)(4744005)(6436002)(8676002)(3846002)(486006)(52536014)(186003)(33656002)(476003)(8936002)(446003)(6116002)(2906002)(5660300002)(81166006)(81156014)(25786009)(11346002)(4326008)(7696005)(6506007)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1751;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eFscxrNMj5DcH/uzqJNTnNHhe46xrW+evSjoRLBZC90WJ/sxVvHRehWZItyW1FAiQAvys5M9Q5R8rz5AhB1VT9ck1kiZ1IBHMdumSo8dacVvQNWnUoe/v2h9bNv3hAGezLfO7eq+7Ri/V80k1XjYSRAnQjUcdVHlDKqP+q6mFBDiJd3RSVIxWp032d84RfFnMEnnj0tzpwjLMHyQca2LhGEFYFNsh0320QYigcW4r4sV8zzMDpHNtOObFz5BL9th0UOfbE/D4YxU8n1L1vemCidDw9yqHcY2ky9m2j0kHOQtRV3vrcMmmhzILrFxxRTpHM6LuebGSQ9ZzA+4TBX5HydBbvzCFPXTDy1yVzTQV6IZ0G5Mox+rbGLqOasyyw2fDW2y/MpAfXiNqD5PAcHzgSB0jIZwLZlPfHQjDwCSNJyW/9JVqzhmQ8RWe73Gykx1h1XKDUTlVFqUbqltk0SqGg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ff54d-27ff-4229-1ef1-08d7463a1214
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 06:39:11.9461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roCxVRfBV8i5avUiH0IewmR6vAj/hAlQHd7f1uu9Njk5YG0hoX0IDZ1ZQxhaWfafL4DpRejawhXcKdEYIacEMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1751
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Kishon,

Are you happy with this patch? Please let me know.

https://patchwork.kernel.org/patch/10946601/


Regards,
Biju

> Subject: RE: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by=
 one
> warning
>=20
> Hi Biju-san,
>=20
> > From: Biju Das, Sent: Thursday, May 16, 2019 10:22 PM
> >
> > Fix the below smatch warning by adding variable check rather than the
> > hardcoded value.
> > warn: array off by one? 'data->select_value[channel_num]'
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Thank you for the patch!
>=20
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Best regards,
> Yoshihiro Shimoda

