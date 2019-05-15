Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA701E912
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfEOHe6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:34:58 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:64946
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726032AbfEOHe6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfiFJMRsQClts4Y4m4tsuPigxA8Wslf1JEGecwqYMUc=;
 b=gM8Xu/gb0HF6NqTgIFaJnX/aAGG86Gvylg2FRGObDxXHmWC7BAOy3SPa15ux9YXS6ufNsCo8/oAaxqK5YS9r/g7gECnKwZrc5hRjOCY8nVijikiErSa24C9p8CgU5LGymAGCfSEDLsD+IdtMxrN7v2V5kskNj7YlEU5LT+2GPyo=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB4136.jpnprd01.prod.outlook.com (20.178.5.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 07:34:51 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:34:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Topic: [PATCH v3 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode
 when not using OTG
Thread-Index: AQHVCmVURGR5qhKJKECQiJhPpmnoU6ZrzGdw
Date:   Wed, 15 May 2019 07:34:51 +0000
Message-ID: <OSBPR01MB317447C71453340DC10D2476D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-6-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-6-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b251d24f-1789-43f6-32b9-08d6d907d13e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4136;
x-ms-traffictypediagnostic: OSBPR01MB4136:
x-microsoft-antispam-prvs: <OSBPR01MB413691FD173978628AC9BC9AD8090@OSBPR01MB4136.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(396003)(376002)(39860400002)(136003)(189003)(199004)(73956011)(99286004)(86362001)(476003)(4326008)(11346002)(66946007)(52536014)(76176011)(14454004)(256004)(2906002)(446003)(66476007)(71190400001)(74316002)(71200400001)(66556008)(4744005)(64756008)(25786009)(66446008)(7696005)(5660300002)(76116006)(486006)(102836004)(107886003)(6506007)(7416002)(53936002)(6246003)(66066001)(9686003)(110136005)(305945005)(26005)(54906003)(186003)(55016002)(229853002)(33656002)(6436002)(316002)(7736002)(68736007)(8676002)(81156014)(81166006)(8936002)(478600001)(3846002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4136;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a8SQasZNVLQyFlDl2DBQYNCudaNPkOe4Tpd5fPjNt7RgSRT3M+chDtJoscmZQzjHFvpP6fUaS/tqTxY2I5RsY65spNDSEwl0+RQenPGTg9EXPR18sZwX9A3ZSy4LH8xBnXx4+olEOSiaU0UaacICaQf8Ub9EVixhwoAbuUcNcB653NeBN5TPtPk+f9FoOS61mIoQzT9BjWmQ/9FDqPwcdkneF9lJbHhw69ax1hdTD77ISGxU3Q5HxiSvJ+6ycPa/YZLiFYGqcPY1Hh8O3VEx34ZxrBBLD6sza6FzMJqMP69pbNtIDFiqIsK0cNo3D4XjrXAtAllxu84X8pcBfOxTH835UD20bQhyJIAD3IpA77Jwp8grm7H1Zix1jhDPkI6aHJ9mtM8TpuanvdFp+3bNYlHAiH7cVR8CUJSR17zlxWQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b251d24f-1789-43f6-32b9-08d6d907d13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:34:51.6797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4136
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

