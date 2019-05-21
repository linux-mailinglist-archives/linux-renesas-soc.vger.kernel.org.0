Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBC6248A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 09:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfEUHDd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 03:03:33 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:6429
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725809AbfEUHDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 03:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbEQUDK0onKg6sOJe7LLnTqMXdoa4OosAJLWVbSfmgQ=;
 b=lFBsbIPjeU5yNBevlymzWqlbA3we4IRYVppsaTM1bG9DDP0MO3mXrBtIQTrohlHfhQoYoBaUMaHWbQo1fz/tF2JjGcBQcnQ4+whFv6acubGI03PEfb5rRZ9RCel5H8zkJlLDE0FsZgyTip5FZkL8RPTbJIGWciKtSDLp6E6zpPE=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1618.jpnprd01.prod.outlook.com (52.134.233.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 07:03:28 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 07:03:28 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Topic: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Index: AQHVC+ti8opjecbDNkeVOzFODhM55aZ1LoNA
Date:   Tue, 21 May 2019 07:03:28 +0000
Message-ID: <OSAPR01MB30894A7D5FE7983ED0D6E5B5D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4ddba73-f49c-4856-1f7a-08d6ddba6d06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1618;
x-ms-traffictypediagnostic: OSAPR01MB1618:
x-microsoft-antispam-prvs: <OSAPR01MB1618F877596450436524BD88D8070@OSAPR01MB1618.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(199004)(189003)(33656002)(6506007)(446003)(476003)(81156014)(11346002)(8676002)(25786009)(4744005)(6246003)(486006)(81166006)(102836004)(66066001)(55236004)(4326008)(71190400001)(7736002)(14454004)(71200400001)(110136005)(6116002)(3846002)(52536014)(478600001)(68736007)(186003)(54906003)(26005)(74316002)(316002)(14444005)(2906002)(73956011)(55016002)(5660300002)(76116006)(9686003)(66556008)(64756008)(99286004)(53936002)(66446008)(7696005)(305945005)(66946007)(229853002)(6436002)(86362001)(66476007)(256004)(76176011)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1618;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mCeIV5/NnlrIrYiqgUnBXdOwpEtZcSR2HYu3lFz9UTh7WMql9eti2uo1rho9VdFvMBgs9CKbyzDTwOlCGtRQ5O7koBJDy91fJTVZf6/JjCdrRG5a2HfdkZbidzOunHCcLc8amRkq0GCeIOBeEQojWx7DVliGifM+p3y6Eh1IDqb2l0BSfoWUn2KFPsGzuVKctHBNgUpkjsFUutKuqFzyT6xyRR62tT65XVzbkJ97GubfpHT7PvwnB3NOss+ltNSSB+6e0qRuS0FAcGNHlfLr9uMRlpj0M+w9rEn4aN/KW5tSgBYTbXvmT+g3LJ8/xsTL1mMiW8Onzdvwo2HcXc/63oqrCcFaFmt8LHR5521dI8IQ0OGD2oXbclBszBm/MEOWXyLruVIFwcmjw1SX0C/SX3rUlZkvMhaewSU9iMePN2o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ddba73-f49c-4856-1f7a-08d6ddba6d06
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 07:03:28.1074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1618
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Thursday, May 16, 2019 10:22 PM
>=20
> Fix the below smatch warning by adding variable check rather than the
> hardcoded value.
> warn: array off by one? 'data->select_value[channel_num]'
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

