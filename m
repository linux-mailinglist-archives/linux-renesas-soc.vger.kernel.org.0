Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F9CAB1BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 06:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbfIFElz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 00:41:55 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:45352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727514AbfIFElz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 00:41:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfOkvCNq9Z0BQdckQyQ5NtrYWBg6n2TV45WaMQBJIXKWwOiIfwZXMIQ3sNl3Vdowpxa7A9n8m8rv8MQvwiPufY97bkqy1/8hRUO+XnbTcfUyWkrXZUTmAKKRuiVOGkxXVzCjZKNjAfh5nG/wDtHEO1E2Sh3JM5TEKVgW+vrysYVfoGy1s3CB+ozKo5N+XidPprBHKRtJNN4P1Bu7P2+FfSDXg2TKDVWb0ej0uSFGkMonmzPEyBBASr/lXle09qJuuDGysDt5qHtwzclWdnuPePDMsIOlgiqqW4R3vJfF4ZpnblW12X+NVjBft/QD3jKY0HrxV6FOBJz2cz7saN1ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GbtWtWRhtZXpAgNaUbWyuiyXTuxTkbyenjrj9i+8cw=;
 b=CZYhNoUBz5gbVXk+XZG3CWYhZSNOQNcB5S00vj+JQN1NPyq5HAyg9IiNNeTOwqVHzBj+MtXAcyLA3YKH0cnny8flESi9nCuj8uOen8OKbHDRMlDSa7vQDBcHIj1o//AzsQnv+WhqEk9Jw76McykFrTsrHzPnoTMTc12Ds8ogYh0+qCmIuNEx6SRfeZUVopzDP+2Wx//C2kr7CPK+BDOM8HEQjHeuwETXoFOHeIHh8EvEHKApKJ3ik7k3+33cczhC0OpygSL0eWgAWK+kQi8RbQTJXTPYgseNPAAk4HuaNLtKFVr846quOkeXyj706icPm7UvW9EIMfiO/KT3d/14Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GbtWtWRhtZXpAgNaUbWyuiyXTuxTkbyenjrj9i+8cw=;
 b=EGNB1jd27lv5ypdxtezet3n0D1pLaCP29gv90AyiCJrflQt/KXLTjNDsOMpPFEsdfXXGFxxlVerHH+mafDfwL2Sx0Odwou4voTscEXWS6NoEL5JCU0uTWFY9xhz1cvvqBVdV+zeL7JkjftJpjQESRUuzY6m5ex5m75266Blep/U=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3360.jpnprd01.prod.outlook.com (20.178.139.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 6 Sep 2019 04:41:50 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Fri, 6 Sep 2019
 04:41:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
CC:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: RE: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Topic: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Index: AQHVY8ruVM4kfXu4JEmvaon6vzm6uKcc6MMQgACJ3YCAAJ8xQA==
Date:   Fri, 6 Sep 2019 04:41:50 +0000
Message-ID: <TYAPR01MB4544B6F543B4678FAF95C2E7D8BA0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1567675074-3331-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB45449D299241B52077101C85D8BB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190905190705.GA4062@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190905190705.GA4062@vmlxhi-102.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 375b8f69-133e-4502-a8db-08d7328488c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB3360;
x-ms-traffictypediagnostic: TYAPR01MB3360:|TYAPR01MB3360:
x-ms-exchange-purlcount: 3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB3360BD0776BA1400CDB78491D8BA0@TYAPR01MB3360.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(199004)(189003)(3846002)(966005)(66556008)(64756008)(76116006)(66946007)(316002)(8936002)(66476007)(476003)(66446008)(86362001)(53936002)(478600001)(25786009)(55016002)(6306002)(5660300002)(6436002)(6116002)(15650500001)(52536014)(4326008)(99286004)(6246003)(54906003)(14454004)(71190400001)(446003)(6506007)(8676002)(7736002)(71200400001)(81156014)(26005)(256004)(14444005)(2906002)(74316002)(229853002)(102836004)(66066001)(11346002)(186003)(33656002)(486006)(305945005)(7696005)(81166006)(9686003)(76176011)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3360;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1RRWNgB21VsZE6m2zbFP+6WFMJtwht2Rb0DAE14wqy/2/ayUPTtp3yPy9GsTbzuXHGjA2N0KltXFE7fRQSYAKpTYrqI+hb2GB5zKJT4vlxFlFc47tavfjAOxM55OzxfdBVum4jqgIidqyALrHi6fD46i1AXpk9yI5vTeWpTYj0FzqpVTApllH7RHox5Qh+A0KjGW3lG7CQ7gcrx/Ojyefy2ailHEHyCCoin+yYK3TU9grj03pkcTF2fSCSJSa6MQTzK1no3Z0tnOg8tnKXdXnZrxDXZ6zQXT+R3eO/gSTBsJ2t2ooPSexpYYiEBBsZK6T81hnIiNsCccjqwEdrTxgvncqGNqe53muRgThrAkW4dIrKImBZz67QMpiSyZhylu4xOsEKErmVpW63ssEr7vEPIYkQ26WMscluwx6/Kp/u0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375b8f69-133e-4502-a8db-08d7328488c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 04:41:50.6137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzCyHiprx0EgfoV4S8UVDi4Oqe/+9dkZ/opXlCc3r383iYK2N2VgXTm5D5obISaayEP3aIr5ixU6H0Ac5++rNffY4h2AcX6PnbyTFbkS+XuwAqy90+sMuBvu7rPtF+Is
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3360
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Eugeniu-san,

> From: Eugeniu Rosca, Sent: Friday, September 6, 2019 4:07 AM
<snip>
>=20
> I guess there are strong similarities between this patch and [3].
> Would you like to pick [1-3], as they still apply cleanly to vanilla?

Thank you for your comment! I completely forgot that you had submitted
these [1-3] patches though, I'm thinking renesas_usbhs driver also should
have this similar feature. I checked the [3] again and the commit log
and the conditions should be fixed like this patch. Would you submit
v2 patch series for renesas_usbhs driver? Or, May I submit it?
Anything is OK to me.

> [1] https://patchwork.kernel.org/patch/10581479/
>     ("[1/3] usb: renesas_usbhs: simplify usbhs_status_get_device_state()"=
)
> [2] https://patchwork.kernel.org/patch/10581485/
>     ("[2/3] usb: renesas_usbhs: enable DVSE interrupt")
> [3] https://patchwork.kernel.org/patch/10581489/
>     ("usb: renesas_usbhs: add suspend event support in gadget mode")
>=20
> PS: Apologize for long silence in [3].

No worries!

Best regards,
Yoshihiro Shimoda

