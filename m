Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 124B51E91F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEOHgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:36:11 -0400
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:12702
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726510AbfEOHgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vT7wemfY2BzQyF2qkUysmK+JjLW8G4Nw9B0xaCgDs=;
 b=FP3R//OUb/CiH1wQd6vzyGUGp9sqRcjCifyFteM9ssnP6tjNfAe4j/s7pbiMcpCCe29T0AU3kGa4BnV7WoFXG2i1DEabcJnGo+iP9sMzN4TQvRf41zDiEaAx74t+oAyqmUD0oUfapFw9BKak211cOfimS4QgXiijiTByNa1Ml+8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2967.jpnprd01.prod.outlook.com (52.134.254.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 07:36:05 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:36:05 +0000
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
Subject: RE: [PATCH v3 06/15] dt-bindings: rcar-gen3-phy-usb2: Document
 dr_mode
Thread-Topic: [PATCH v3 06/15] dt-bindings: rcar-gen3-phy-usb2: Document
 dr_mode
Thread-Index: AQHVCmVYs6B2CYo6nE+Har4DAHP6IqZrzMDw
Date:   Wed, 15 May 2019 07:36:05 +0000
Message-ID: <OSBPR01MB317465E28E294DC011A2B86DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-7-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-7-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd0360f8-d2b9-49f9-7f1d-08d6d907fd3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2967;
x-ms-traffictypediagnostic: OSBPR01MB2967:
x-microsoft-antispam-prvs: <OSBPR01MB29673914C8B4CAE77C6B7AD7D8090@OSBPR01MB2967.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(66066001)(68736007)(55016002)(86362001)(25786009)(66446008)(71200400001)(71190400001)(476003)(7416002)(229853002)(4326008)(107886003)(6246003)(9686003)(6436002)(478600001)(52536014)(53936002)(446003)(486006)(5660300002)(11346002)(14454004)(558084003)(256004)(8676002)(74316002)(54906003)(76116006)(7736002)(316002)(26005)(76176011)(186003)(66946007)(81166006)(305945005)(6506007)(33656002)(102836004)(66476007)(66556008)(99286004)(64756008)(8936002)(2906002)(6116002)(73956011)(81156014)(3846002)(110136005)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2967;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kV6Zt0iDGDEgp4C5+KnQ7kFbo3tVuvYrgiivqGDgRIY3ZfiFoorxAk7h0qtbM4+/GoQf/jkDaBEFuB4dQe9hGB0RKQ6DEfDj9ff7Dm3WwjV8fw2Vnk9EudYT3aXYz6g2+r9G4qVgvQWbDIiWFRiY4wxR6JgtZbA8hF5gv1sd/gSfLvWy5aeXJg96A4yfNv3+LFSI/fQdz5E8JROrugS0hgMW1QN6dfFaJ5JjF8t4pN9bBqQHSejOetEqnG9BZtS88A12B2KD/au7KGi/gIF01SsdQYtLsTxiqgm4VbRSod8TWrhBIM2Bsa6pinMWOeEDV9JY+HtOcgJZnBITcqP1lqZYZ4bx/gtKkq6EivCz8/1T4FMD9U+PSL7zDaCQzYjy2NNu8WcpLSvzMpDBe1NnmeGaJEHy5uh9dwF5LmxxhqI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0360f8-d2b9-49f9-7f1d-08d6d907fd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:36:05.4614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2967
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> Document the optional dr_mode property
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

