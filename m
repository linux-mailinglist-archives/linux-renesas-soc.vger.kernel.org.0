Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B551A3180
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 11:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgDIJEy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 05:04:54 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:22867
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726082AbgDIJEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:04:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdzesV0x0w3IkVlWYF2JVebcMysWBvQIYiWUITYz8P6CKMlktTa/xTLQRqKlOoCFN5HVnkofuuGkdd0/ez8/IDSqru+Do5OPop/YYbMWXBbBlNg7sEJuxeYssCPd4a+4Bio3AMahoDmy+ZQABmblV8se0fkvwA1n9mzO8xLhOR1U3JeJfYzxFLhMbtNQQMKy/X1V0UB11/Yqn0SEzbHKhDhDVMZIJy62ZrHl0b3f7OlBn7OqPkcNqINIVrOMigWPR6mJaqzRU1JVGaTAzkscakZDo1lSj7aDGxECMkzeSqqh0tF2BiSqhVEPclGwGkE0cjH542xmH+BdiZsYfFTzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ww832P34coEgXJgOdpSJ5VxLc9/oiD7CO0Y+y1E/j7E=;
 b=g4pbY+Fd9JDHEi7Qxu5vFyORtp8v3u+0gcj623C954w3HaBYaTd6GL7yl/dzxsnTVHPyz5Dve3TaQsfZ7QXQlfe+sbu5xOwDULe9lzYoZv/AXFf6iW3apUt+NkvJM7o14jhzGlQ9VzjARwzU0aM0XdMdYEeQm53pgBHfiwH9J0rsA4uYHTcKaOYo7Y+RPvbVR+9G7z/jT+cIsFAz6pHHyYnIjhINZayCX81OMacXcZUHoEhw4IYLMYVa9RY4fWCqlpFUUPGkH7jguxzuGgYJ/lQXwGmWyxpdfCAlTytXuCYin3Bxzc/b34sYXolbZcFNMOU8Xhm6D0L3R401YV394Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ww832P34coEgXJgOdpSJ5VxLc9/oiD7CO0Y+y1E/j7E=;
 b=agtKqCauSY8d8veW9eRkQ63pR37KrucDWplJJ0Y09gfmd2u9kYQ2BOyA8WCYqSTSE5fd++/e0yAvCfdYl/3TMlw1nAMv8C51kgv28jczSuHloMxi4cv39wMImaeO2zAnLzg5LYPBAPz+6x77QXpdzWQoB3zHqw6GSSBnEpKQK80=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4877.jpnprd01.prod.outlook.com (20.179.186.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.17; Thu, 9 Apr 2020 09:04:51 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 09:04:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH v2 3/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Topic: [PATCH v2 3/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Index: AQHWDYqjFNfM/x6O3kC+JTPWwOnZJahwgFNw
Date:   Thu, 9 Apr 2020 09:04:50 +0000
Message-ID: <TYAPR01MB4544D64D451700F97DAAF215D8C10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
 <20200408094638.10375-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200408094638.10375-4-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a274e10a-a3fa-4d42-fa3a-08d7dc650fd6
x-ms-traffictypediagnostic: TYAPR01MB4877:|TYAPR01MB4877:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB4877916901F449E12C06D6B7D8C10@TYAPR01MB4877.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(81156014)(2906002)(110136005)(54906003)(478600001)(8676002)(26005)(5660300002)(55016002)(9686003)(66446008)(7696005)(316002)(86362001)(66946007)(52536014)(66476007)(64756008)(8936002)(81166007)(4326008)(55236004)(4744005)(66556008)(6506007)(186003)(76116006)(33656002)(107886003)(71200400001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BYwqPqKF790j63jXwDF5A7sQbuMgJt4J31v4SHpkDAwbMcuwUOFfSZCGemgYt/SH2FEZbOwUrWENF4i7zIu9xDOeVCNAEt0ztPCcN/guhPbNldppIb28iXHfaJCfuXsCdioGA4E6wZOIe/R5369l3TqoOvcnd5OMTHddkLCV0TImOIa3VKzTPG0T6I14g633QaH9mXBvlmCsiBjpJafL+1I84JWxhPkbA9EEMFE8JMwmtc5hv49ZQQEZKsYgjyb+Jqteg58qN/gVX/+FUnrsvhgZ1Ir4tSelWS87FDZJg7etev+RR+i/Xujn4ADDqOhtenB6aByXySrlt9UdXmZ5pcv1R16ky1yz4I/GcJG4pOrVn9l8p1JL+MFmiJKxjQegJZQ7VtF2sK/EnH6JTqgkp814DGXiqtWJG6nlL2aM9y6LnEyV4feWUnXqPtXRUzbx
x-ms-exchange-antispam-messagedata: JIpc8S8O7F/p6nLskVrrAcjbmJdaoLQXCyc8kdVF52nTVAUjZEqIUCmzyxcFbpH+3a5EX9Ir9YuK4/eckrfSHupJ9vuk0pP60KzjS/kfLZz3mzp7pD5yx8p9WatORQyshHCZqyFw1GmABQMxi9FTvg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a274e10a-a3fa-4d42-fa3a-08d7dc650fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 09:04:50.9880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+ZIvVRVJRryL++EGkho8h/+hR0OErpIOLgh+EGrQDdg6gWA+b6OG4HB09m90UQN5haOZffqNp5tQBedI07MAvGdD6tJoWOnC2imrE6wcW3ZHaim+/Mbd8z9CLJji/93
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4877
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, April 8, 2020 6:47 PM
>=20
> When tuning HS400, if all TAPS are good, we can utilize the SMPCMP
> register to select the optimal TAP. For that, we populate a second
> bitmap with SMPCMP results and query it in case the regular bitmap is
> full (=3D all good).
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you for the patch! I tested on the my environment (R-Car H3)
and then using this SMPCMP result works correctly. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

