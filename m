Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E76E32D49
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfFCJ66 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 05:58:58 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:47712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfFCJ6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob+WLqKgX/2PZkVEICjV3gZpoh6yN5vnFUHSClKWNzc=;
 b=ESfENHqFGO0oLxegs2ZOGlTCOh1neWpVRob62g2unrpHmH+/yBVoJAOYH85oahYP1uwjV+PLCrU/3Qfg8DDpiYfBYUkJnO2izBL7Q/NqMB73uL8px3u0pZb+8X1nCGLXkKRvhrV29wsLVnkn+D9yM4qVmARPy8aqZDjJF25Bvp0=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1748.jpnprd01.prod.outlook.com (52.134.229.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 09:58:47 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 09:58:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 4/7] usb: gadget: udc: renesas_usb3: Enhance role
 switch support
Thread-Topic: [PATCH v7 4/7] usb: gadget: udc: renesas_usb3: Enhance role
 switch support
Thread-Index: AQHVF5i57Zv2hIpNeUePiIjjDcVGPqaJtgOg
Date:   Mon, 3 Jun 2019 09:58:47 +0000
Message-ID: <OSAPR01MB3089D7928E6B857B382C1DBDD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559296800-5610-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2896dac-fef2-4634-48fe-08d6e80a128d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1748;
x-ms-traffictypediagnostic: OSAPR01MB1748:
x-microsoft-antispam-prvs: <OSAPR01MB1748704EBF2EF681EED52177D8140@OSAPR01MB1748.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(136003)(366004)(396003)(346002)(189003)(199004)(5660300002)(4744005)(71190400001)(2906002)(3846002)(6116002)(71200400001)(6246003)(81156014)(8676002)(11346002)(486006)(7416002)(316002)(81166006)(4326008)(25786009)(476003)(53936002)(8936002)(446003)(186003)(52536014)(33656002)(256004)(7696005)(54906003)(64756008)(99286004)(66446008)(66556008)(66476007)(68736007)(6506007)(74316002)(66066001)(102836004)(55016002)(9686003)(7736002)(76176011)(229853002)(14454004)(478600001)(26005)(73956011)(66946007)(110136005)(76116006)(86362001)(6436002)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1748;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F/7WBLXTu03lr9IABbJD6aD2lixqbQMzT0WgRVWAYi8+QwGsILBQUn9e6DkF8D7x+mLRzF45MwBtNa9B2QqC7I/lbXnPeb6D6EouJsl/OWbo5ZjwLQnQwAPooSPcVJsA9qdhJaQiBG1EvBQeROTVJGD3gkfWy/oXo5/QNy58KhFfJTHmdW2CR5h7Vtf8092gF4B9+ZCgqgfbaQL0kvA/NkiXKcMS0iboSCd/aVy54Ur8EITvlp5LDZHhcvYNZIHbqSo3Z70jemy5DBdzu3fKOxOX3IZKxdzFV6m9jI78tQL/tcsdoLxob0Q0fJWuw/KpIhwgdSuPFxsi5mdVlT8ZnNU0KYCJQVmlIm18hC/UD7z5cFBX1aF9vz8WTWET7aJHXxhJFh3nPkX8xu/KRULuhS0CmuoSbjACYlhivKm1wYY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2896dac-fef2-4634-48fe-08d6e80a128d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 09:58:47.6131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1748
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Friday, May 31, 2019 7:00 PM
>=20
> The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220 usb
> type-c drp port controller. Enhance role switch support to assign the rol=
e
> requested by connector device using the usb role switch class framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thank you for the patch! I tested this patch on R-Car H3 Salvator-X and
it seems no regressions. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

