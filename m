Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDF21E950
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEOHpK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:45:10 -0400
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:39232
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbfEOHpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcm5ivat/pkWIk5h7AzLIXKoRIWO5kI+B+XWordBtNQ=;
 b=NZxE5XGTWlvYFDZUixHU+4qevyRZgmX7W1ULKvO2X+teyJkfnH7pF+iPmJJhDRWepL0OVsZJppwOQ0GAF3kd36UhTzlSe57AgMTYKipknL0Hep1I36cI/osARfvBi85S6CqPufaYSML8rtjBWX57B0kePEZvfvf8BWPcRXgWbRc=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB5270.jpnprd01.prod.outlook.com (20.178.99.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 07:45:01 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:45:01 +0000
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
Subject: RE: [PATCH v3 08/15] usb: renesas_usbhs: move flags to param
Thread-Topic: [PATCH v3 08/15] usb: renesas_usbhs: move flags to param
Thread-Index: AQHVCmVi9UC1EFC7gUqiwP4UC4STEqZrzjPw
Date:   Wed, 15 May 2019 07:45:01 +0000
Message-ID: <OSBPR01MB317490A34E05596A5DD60EA7D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-9-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-9-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79d24189-e761-47a2-71a5-08d6d9093cbb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5270;
x-ms-traffictypediagnostic: OSBPR01MB5270:
x-microsoft-antispam-prvs: <OSBPR01MB5270E1932572BA21B16BB176D8090@OSBPR01MB5270.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(396003)(376002)(136003)(366004)(39860400002)(199004)(189003)(110136005)(33656002)(107886003)(66066001)(25786009)(478600001)(6246003)(4326008)(53936002)(316002)(14454004)(66946007)(86362001)(74316002)(52536014)(446003)(4744005)(8936002)(6436002)(229853002)(71200400001)(305945005)(7736002)(66556008)(64756008)(66446008)(55016002)(66476007)(76116006)(73956011)(9686003)(2906002)(68736007)(99286004)(71190400001)(6506007)(11346002)(102836004)(7696005)(7416002)(76176011)(256004)(5660300002)(186003)(8676002)(81166006)(54906003)(26005)(81156014)(3846002)(6116002)(476003)(486006)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5270;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MXq8YXxuphQmVPGNoJJQBaPvv9oBi9Zc/zHK2CaucVXSx3hJXstoxFFcsdkNO4FlEuhyrvlqYXl6HOA0N2QPBleHu62e+PomUvUSPMMRj3nKndGEOTPWv1ANI2t2o2M4euVvwWM8861lyWoYBUbSoDktZVsw546ejQkbTdhaPu9jSAiuApSZz7tz0dniCzsePg2c7zO/YKDpbM0eZLI3QmZ72Cuah41u2Im5pOHoBCQJ6RkDDmUTxc4gb4yAnrwQCXxbDliC92cwhaZOoKnVooSIcFPK9AA2569y9FfxkzPVc1nNnAoOXHApr6dzujkpwG1q+b2f9ksV1pMMbvCVKFLc1I1qwPdg2Kwgg+FhxWmm+Rat/ppZYACQqCHkQxuL5v0kqa2gWLe4cZEkXK8ujkEl3kbh28hBGntWXhLxzm4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d24189-e761-47a2-71a5-08d6d9093cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:45:01.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5270
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> Move options from 'flags' field in private structure to param structure
> where other options are already being kept.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

