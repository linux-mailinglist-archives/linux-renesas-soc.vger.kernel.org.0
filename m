Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6DB32D3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 11:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfFCJ4S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 05:56:18 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:43072
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfFCJ4R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 05:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bteNSAyud6uiK7219yU9ZUOlgZtn6fN/VgixOtxB71I=;
 b=CHbsdTYAuKf8FU1FK6bahVs12SPv2vnwBNTS10HjrjDKYGm7w8TrYCzFP90D6pi76ptVjuwYgeKWek7hmSqHNkFPQj74hSFvzJsDcKo4EiH8m0qN7uWUw1K2Rs+BmEGHaFi6i6kPRLLoyg2APAtkyQotsvUXS4HWiCRAWDUPJvE=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3204.jpnprd01.prod.outlook.com (52.134.249.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Mon, 3 Jun 2019 09:56:10 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 09:56:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Thread-Topic: [PATCH v7 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Thread-Index: AQHVF5i2iqYQ2akI+UyVySqU87/Er6aJtcTw
Date:   Mon, 3 Jun 2019 09:56:10 +0000
Message-ID: <OSAPR01MB3089666DB60983B26B910F38D8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7b42a83-7414-4168-5cc4-08d6e809b4e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSAPR01MB3204;
x-ms-traffictypediagnostic: OSAPR01MB3204:
x-microsoft-antispam-prvs: <OSAPR01MB3204ED88699296D2E515E01ED8140@OSAPR01MB3204.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(376002)(136003)(346002)(199004)(189003)(305945005)(71200400001)(7736002)(52536014)(71190400001)(256004)(25786009)(14444005)(33656002)(4326008)(74316002)(86362001)(4744005)(2906002)(66066001)(5660300002)(478600001)(6436002)(76116006)(73956011)(9686003)(11346002)(76176011)(8936002)(66446008)(66556008)(66476007)(7696005)(64756008)(68736007)(229853002)(446003)(476003)(66946007)(6116002)(6246003)(102836004)(6506007)(316002)(3846002)(54906003)(14454004)(81166006)(186003)(81156014)(8676002)(7416002)(53936002)(26005)(55016002)(99286004)(486006)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3204;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Z8F50GhtMkqJoV2+bwUiK9QZLsbXrPqWl3yLt/eUSW01NqpPITxV+9KhYCd+9ywxyd5Move1vMIpZq3epck6kUxrZ5HU24ixuqMyuCn0exND9NmKWHZeDA5vc0xbHRYTm+dpuRMEehaTQYedOltmqGFxTf1fAbDDXUT8RAF/esb7LnY6lXHXwLiwxLN3g/hU8Zhca1h+rGRXHMpx975VILojmyqWXulc4UF0YjubiCOgNpKd2Fp+w0a/VgTlF2wj4LKF2GfFKpd8AFd6GxUOx2oxNsKtaVJLndc8r1mDSuLm+5eaUQmOfyF1vNPmMnAC9cAfXZxfcEfJOBGGXVdkqyE2YncFIzrzmbq1w2H1fNMR7fjOLmzVKUfZ51VFi3NyISVZUqDE0KD1CmwrLDQE30JOEXS4DIxmHpVwWmW5KM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b42a83-7414-4168-5cc4-08d6e809b4e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 09:56:10.5067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3204
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Friday, May 31, 2019 7:00 PM
>=20
> Update the DT bindings documentation to support usb role switch
> for USB Type-C connector using USB role switch class framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

