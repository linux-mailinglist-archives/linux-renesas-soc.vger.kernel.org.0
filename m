Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE42215FEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 10:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfEGI6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 04:58:48 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:34231
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726236AbfEGI6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuX1xzOZAbbjL7qnnYMXgAHEZwpA/UI/InQYoOsTpx0=;
 b=IaST4m/cbQJimvxlBKPnrHOz69AovT578IrzY61cJ2UUJcq6DioBEn/SC25F688xW6XLKjDYaV0DRsc/CM6/ctBWSCZg7Np8ToFvhXmFVIA/zJgsFIYeAvLUrqkaEM8MVu8yBjBy+YzZrJLjJYXZ7N+MeAMsOorjbC4iklSQDMY=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB4757.jpnprd01.prod.outlook.com (20.179.184.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 08:58:44 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 08:58:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance
 by using IOMMU
Thread-Topic: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance
 by using IOMMU
Thread-Index: AQHU+/AkeRAaf76f8Ei+7P3pmBCRuaZOMeKAgBEqOVA=
Date:   Tue, 7 May 2019 08:58:43 +0000
Message-ID: <OSBPR01MB3174BFC6487E29AF4EA5E150D8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190426094611.GD1031@kunai>
In-Reply-To: <20190426094611.GD1031@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4ee9a9f-5d87-4180-3491-08d6d2ca3565
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4757;
x-ms-traffictypediagnostic: OSBPR01MB4757:
x-microsoft-antispam-prvs: <OSBPR01MB475733D030F18A1F3505CF77D8310@OSBPR01MB4757.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(54906003)(71200400001)(68736007)(74316002)(99286004)(52536014)(81166006)(81156014)(7736002)(8936002)(305945005)(9686003)(66066001)(316002)(5660300002)(25786009)(478600001)(6246003)(53936002)(4326008)(6916009)(14454004)(33656002)(14444005)(256004)(229853002)(76116006)(64756008)(66556008)(66446008)(66946007)(73956011)(66476007)(446003)(8676002)(3846002)(6506007)(26005)(486006)(71190400001)(6436002)(6116002)(186003)(476003)(102836004)(2906002)(55016002)(7696005)(86362001)(4744005)(76176011)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4757;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TyqOe9YB8l2R9L94XnNVPAKWoB8UQZO3HJ5h5Og1z2YarP5Yi6ETD2soudeVP1lKDGKhjmsaqsbmnYo7lY8l9jhdEBRCz60FWNByBFNnZU0CMEFvoLTJ2BqD0O/23Mulk9zkN95K2Yo4RCmulkSw6VgwST+ablXIVlQkBpn67sNU7aLWz19B+wf+tzCJf9tpB9EUJM5B6mxmFwV5xiuMh3qjMouOl5QTDKloLDC3M5YQaSoay99h54c5slEkz3gekzLwdsscc4SnJIuCPIOAVKcx8vfFQWt//ucr8/vmdkrF1bxUevvZQMXI3Hu4zM0prlF0tUxFDHgYkvkUujeDyUUEVfsZaseB1UUguiWZ3u/6T9wvndFr/2p4kfNovQ01KmkiFVvwLlDk60JZSBfOTlcUER5gOvwS0KA/lGncWMA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ee9a9f-5d87-4180-3491-08d6d2ca3565
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 08:58:43.7703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4757
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, April 26, 2019 6:46 PM
>=20
> Hi Shimoda-san,
>=20
> thanks for working on this!
>=20
> > Please refer to the end of this email about the performance.
>=20
> Yes, nice improvements, great!

Thanks!

> > (I beleive if the performance is improved, the CPU load is also increas=
ed.)
>=20
> I do wonder about this a bit, though. IPMMU and DMA shouldn't be that
> much expensive for the CPU, or? Am I overlooking something?

I'm guessing that a user land app (in this case bonnie++) consumes CPU load=
 for some reason.
I'll experiment whether my guess is correct or not by using usb 3.0 host li=
ke below tomorrow:
 - case 1: usb 3.0 host + usb SSD as SuperSpeed (IOMMU is disabled).
 - case 2: usb 3.0 host + usb SSD via a usb2.0 hub as high-speed (IOMMU is =
disabled).

Best regards,
Yoshihiro Shimoda

> Kind regards,
>=20
>    Wolfram

