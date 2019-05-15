Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702091E92B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEOHhI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:37:08 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:36096
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725902AbfEOHhH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2Ftzu0/JNn/trqVLodq1qwQ5ZLWYUiW91BH7n04gUY=;
 b=YVrF6qfK0GcLQkie9HfWl+nCUy/f9BNAOQUx6SERTeu84CwQ/k1juuidcZP0MFzME0JK638pds7KPm955505QcnX++fsNpL+SxHy0OLAKFIwyhLgVMQ3/LVtmnEzVj85Fy8H9Or3bOxXu8fe7jkjDmfZX3forAgR817Ixo829Ds=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2967.jpnprd01.prod.outlook.com (52.134.254.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 07:37:03 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:37:03 +0000
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
Subject: RE: [PATCH v3 07/15] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210
 support
Thread-Topic: [PATCH v3 07/15] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210
 support
Thread-Index: AQHVCmVc9Or6wdADzECW+HM+CMN9GqZrzQyg
Date:   Wed, 15 May 2019 07:37:03 +0000
Message-ID: <OSBPR01MB317474C9D2D08C8648DE83E8D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-8-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-8-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb247921-d063-4f2b-4a0e-08d6d9081f8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2967;
x-ms-traffictypediagnostic: OSBPR01MB2967:
x-microsoft-antispam-prvs: <OSBPR01MB2967F08E1EE028BE66AD68AED8090@OSBPR01MB2967.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(66066001)(68736007)(55016002)(86362001)(25786009)(66446008)(71200400001)(71190400001)(476003)(7416002)(229853002)(4326008)(107886003)(6246003)(9686003)(6436002)(478600001)(52536014)(53936002)(446003)(486006)(5660300002)(11346002)(14454004)(558084003)(256004)(8676002)(74316002)(54906003)(76116006)(7736002)(316002)(26005)(76176011)(186003)(66946007)(81166006)(305945005)(6506007)(33656002)(102836004)(66476007)(66556008)(99286004)(64756008)(8936002)(2906002)(6116002)(73956011)(81156014)(3846002)(110136005)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2967;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /9gEvG6FD1VmhNTuG1kiu9zi1QpeMDyAl6TWmbh11TSdpIJ+uNNbgopgw+3USpz/ytIVkD+gZordPeV5V1n+qoibBEuhfWo9FU8kyuzYJR2CpR/jAg/QEPnCfIUTkv2IVIVs57soj3iiEE7jE/1d10fPyxZIjrLVbhA6atdXIJ/4WnNdYKhEqYLLAmY4DyaFmGeKeDPyrl4q6KRZl3xeqm9qeZgvIyFXkWVds5eCQjZ1Q6wX8/BtDVvmvnlc4A8L65HEq857lsXc+VR5+W0ggvoYIwCNDAJQK6VER5O9d2By8X2N+6tzBJKnv5zmFLwBJt21h2uJjoA84OD5cEWSSPP6YTfEY2KxcIQxLorb/4p0K2mGrfO7QpgF3TcGXpfabFhWkZu2P2uAR1apSDZJQ8fNLS6S59KWxQ89zzFYHtM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb247921-d063-4f2b-4a0e-08d6d9081f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:37:03.0214
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
> Document RZ/A2 (R7S9210) SoC bindings.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

