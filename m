Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381302623C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 02:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgIIAAy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 20:00:54 -0400
Received: from mail-eopbgr1320100.outbound.protection.outlook.com ([40.107.132.100]:60976
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbgIIAAx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 20:00:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2f28KVv7M+QsSJCBY2IA2q4NoPhkjprRctshcXSE6Vl8ASiZYitMYnvXEyx/BzpyCYbcCcAsi+Z7qG6GX3ZQx5SGccfOldz8u7a5xQNEwnfkkwD91FNC8dmLR30LPgvcPb/KapirOq7pZ+BDjmwxnWpYygXK+re+RUZTWL8Iw2CFAeNMKMau+RhijAD5XX2vZwCe+rQbyRDgQBd0vPodPvEbW6517maTcTalkn13vSFQJjh+oLBZ2dpwSBPW+EqXbM6e7RQpq4m8uI8LIS0SQ7BO89HyKLz7zJHLEza9Q53S9Nr4NPlnneHrlZvqNi8sS6LGPL1b6TaCtDKjOVjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeUyeAALGVi9XNSlYTvgxa9quki6W4ladADyUJM2hq4=;
 b=n9O1bvhhzFcey0OsPTFICEZM5qrWd8bE28BnSSnDNbyr5VsfDtGWqapMkp5F9yKr5RlgW1huR68Oyxde+9wxSO7tNs9VKq/mASlC3nVuoqvgIrukylSo5sLjkE9mf7MNnHlh50JPfJVKtKW8rTwxBIM6PPzmNj4n9cujLS3WsEygS7VYWA78kKKXOvGelW3x8d4RfxETjst+Tu7y2+q3TxxlNRJXX7AJ5Oufm8LO13YuKk8hyqWg2Md4jRpZUrbhwRtjtZFnNfwiUFbyj6/yr3bPu/5BjuCSLD7WZcO9JnbBO0uMox+sZQCNH/5VuUj2FfyOpViFS+pqSwq7LJP/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeUyeAALGVi9XNSlYTvgxa9quki6W4ladADyUJM2hq4=;
 b=qLsvN6fI+P2EvC3w43qVcDhBCvuSTa1nywuBEn+w/bdVdKhfLE5adCNBGMYzINvi/YYjWrhLb/gI1okb+BF76MndEi8LaVve1DRlowmw2aZQugwXQLBNsUM9Q3S5UzgEo1S1ujCmO1EH5VL/Eowuw1tjJk/0IfXrq6/DpsrIU2s=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4297.jpnprd01.prod.outlook.com (2603:1096:404:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 00:00:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 00:00:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: u_serial: clear suspended flag when
 discnnecting
Thread-Topic: [PATCH] usb: gadget: u_serial: clear suspended flag when
 discnnecting
Thread-Index: AQHWd5j55bEosn9b8EG0P31GanvMHalfiPKA
Date:   Wed, 9 Sep 2020 00:00:46 +0000
Message-ID: <TY2PR01MB3692DC484D2E128508E85E6AD8260@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1598000179-28417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1598000179-28417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:750c:6815:ec54:30db]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2f7227f7-8b61-433c-ac64-08d854536755
x-ms-traffictypediagnostic: TY2PR01MB4297:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB429701576B46F352ADD84257D8260@TY2PR01MB4297.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t64G9plb0YWVEpbDb7ext7q4dtUfzGWlBjW+DYUh0DhKnwSdkbeujg8ZoJ6Vp1VOM9o8iW/d5mn5iBZEJsrhL1gHnrtwqUUa80DceAOyoDWm68DMMSKJUDqv5CEnbbCQ5M5Bnv810gHhNHLjlJm7uVMqK1BaTRTzasQ3QBxE3BY+yanfMfJviejo/nUhsAObgnAsD7dRBGy0xt2KIs8RPBZMt8wnJaJdNncj6fO+drOpLZkPU2KjOcrP00ZONmn7UXLAynfixzIP8peXK4GVDG3+3f/hFF/l+Do8u0ZteFK6pAsSj3XP8Lzr7+AxmuQwN0hE9ZunS95UWbsirPFqvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(66476007)(66556008)(52536014)(2906002)(54906003)(8936002)(110136005)(55016002)(478600001)(9686003)(83380400001)(558084003)(8676002)(5660300002)(7696005)(86362001)(186003)(66946007)(76116006)(64756008)(66446008)(15650500001)(71200400001)(6506007)(33656002)(53546011)(316002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6aTyxxuFhfEePMJFZJRe7KpyNT8rccd5DCrwNlACFptP41dm41aLE8VYRnll1OdfDBxs5028DFcfXlTb3gMGXkLSU4tiea2n+1PYW4Owh2yC+zmSZHZaSHkSKdeLaXS03oZZAs31CQnNgUa1+uvv2hz9AXKg7QppP+chTUnPUoN5RQdxzlCU5t4DqvvGcdZ+Zk0IR7t58gpqc5TbOn1HjYFtWX4G+CUGKCaGIfEERplzBlUeNZgPmoyXUUIDZPcXsUS0pgXb5n6+l+q8a3CeQ7PmISXh0X/mHB/uwlW1XXSj5L+PaiqG9GoIhh0fQ82Hj3Mulhq3MLWw1JWTYxsutvXA04FRxUBlXHOq39cXgSu6LTq3OiF5KydylAisDSG/x7YvGx6jlhXts6rgNFCKnSqn6NRlxbDE5Y+3D4uwHaUJ/W6ZQuvUkk9Bp+xtXZ1+DYGum5rJC0BDTbqvJouyXwFnobx9Bd6c9U1hseXZadlTksIhCRR5nMl5tdne5d9U3Ek2nAyoJlQmq38aU74yLl3fLmFXMFV09k8ZJnAIIaVyRwaxmMH33ERrOoN0WOhLeaOb/BXLz4Ss96NwUioUNpsRRzjn7/8z/2WJsaAqoFT4z0rWnTlj2W8VBMbeLQdtKYyGeiVtmxDJ+g0LPKJJUjWd0D++owLAdD/vn1vQc8fjg3qBHq0gv/EGaOrrNkWy7kPMaMOGZVMTq2kZkICsdA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7227f7-8b61-433c-ac64-08d854536755
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 00:00:46.4682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlHMxdOOQB0KdDQfBs8g+6k712/lFM8ejEDuXJ16a/+uUCpMZaMq2esO2P3d4pXH6FOAmyQx/4xJnw4H8DL3GaWPJJiE1Uw9PE5tPsajwRLiYjj06kEEI9YGbvRelKZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4297
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: Yoshihiro Shimoda, Sent: Friday, August 21, 2020 5:56 PM
> Subject: [PATCH] usb: gadget: u_serial: clear suspended flag when discnne=
cting

I realized the subject had typo. So, I'll resubmit v2 patch soon.

Best regards,
Yoshihiro Shimoda

