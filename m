Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966419F960
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 06:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfH1E1F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 00:27:05 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:44438
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725763AbfH1E1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 00:27:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2Rp8pILVayZwokxmeP4p7T9a0xI0DubAPtnl8j6pzhOA3LuW9Ng2JZ8P9uWGGU8O5U0OpRIz1q7o1OtxKaRcDo9SQ6RPxvjC/UGGIJVWlEhFfMQRhF+V7PxEQX7vmxe8jecrYiBYCCXwY7Dc6sUgk9eJjEfWjfwnEd0rcyGlMuu18fnc6VMVs9Qj0YRzI/nhA1lyD8/vCu0u5e9YYHJrYWSskJm1vABAK0ntlehh03AzDq3Kcjc1HkDQpdDEgDlDwElXIB164E4iNSu7GfjAfUbNR1DRwCmYHdcJ7WW0NnbcAcinCZo9b93l03xZht/u/ola1dtaAWk59Y0l2rLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfIewSVo6fyJiaSyrKg/YmWJyGPb1PRUh8NPKfxKCjw=;
 b=nxhRk899xQu7Pt1JuTlxvAgoVO4BP6alN9ysohV96cvKNO9+SNf11aGZeqUr+s5NM7FtlbqjxVV9AjEfpf2PoMQ5jQb4Muh20TvBL9o06ybDRIS9XjFUNHn7IFtQ+Wogx5LuJQuBw2KJgAt7S20qTCBKvXl8kzIUtbnmR+qkFTvZwYzhcvkhOnC3abU76efkQ1h1W93aOiwrxSOw7gWZUPf/mQynbE2BM7XYs89wg+Fasv8x7bMobzs8kn7Fn0z3TAtyx/iirpFVe1vMP7DU/HnpfzSDaoDOjOB9GdZBETMOeIJrNjvT0T4lj5kkdjC+W7y3dBV/CNDdTUH87Oq1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfIewSVo6fyJiaSyrKg/YmWJyGPb1PRUh8NPKfxKCjw=;
 b=jZmihOcGv7t0+Wx2nZvMjfxl5ncp45fdxu8PW8xM5JZOtQKmJ9emNAXUyt9qo4FUkCzKumh1fkTjk0KG5//xHKYoL8mpFCT9mdLoG+lawFtG3Oy+ewHLCCOzxWOSprY2ETQXS/Gwx2/BD6QN7dFoCa11OXn+tQNeADTqbL/ag20=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4175.jpnprd01.prod.outlook.com (20.178.136.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 04:27:02 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 04:27:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: xhci: rcar: Fix typo in compatible string
 matching
Thread-Topic: [PATCH] usb: host: xhci: rcar: Fix typo in compatible string
 matching
Thread-Index: AQHVXNYfCwXx5692N0iwEBASaUgozacP975A
Date:   Wed, 28 Aug 2019 04:27:02 +0000
Message-ID: <TYAPR01MB4544C8E72D83350A08A4BB7CD8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190827125112.12192-1-geert+renesas@glider.be>
In-Reply-To: <20190827125112.12192-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6c3cb9d-6ad3-4ded-33f2-08d72b6ff9c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4175;
x-ms-traffictypediagnostic: TYAPR01MB4175:
x-microsoft-antispam-prvs: <TYAPR01MB41757BB186D4AE9218E715ABD8A30@TYAPR01MB4175.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(110136005)(316002)(86362001)(71200400001)(8936002)(54906003)(256004)(229853002)(446003)(71190400001)(33656002)(3846002)(6116002)(81166006)(81156014)(8676002)(186003)(6506007)(9686003)(52536014)(102836004)(26005)(55016002)(6436002)(14454004)(53936002)(74316002)(2906002)(5660300002)(99286004)(7696005)(4326008)(7736002)(76176011)(76116006)(11346002)(66946007)(478600001)(25786009)(6246003)(4744005)(66066001)(305945005)(66476007)(66556008)(64756008)(66446008)(476003)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4175;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oKiUAw48RZw8LDCCJdekP/VIZXwNL2U1MgwDx81H8KiCKaaOgR4MApAOuZIFtphOLOAj98M9s0qm51U1kNvzG5x8Wvc4OtuIRjPLbzngypmVikZ3s27RBhpxlbRLRoV9onal0lBZA5cIY02Wz1F1F407Gow+mnKyVg9OHVfCqPYcjQQTe7nsF22LNGlpOjOfoMLGPiYjz8j0stm2lbIwQjQ3BPI8hRTcEUCfI61a6e/dYndbYcBzKibP+Ialg3VygW9LrR/Jbzplf5X8A30WxkJw0GHjl1jq4Y4HkCteml8JCLp4r80MdsusgN/GVwHr3cxSnSd8Iw3lDoq37szVrgJxSVaqHRoZnPHA8Yu7zclgkwCLKfpyy3SCL0t5Gt6Cv0lqiFX2JuzDTXzvAhnAMFNtUEPzgAffnkyTzamztlw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c3cb9d-6ad3-4ded-33f2-08d72b6ff9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 04:27:02.5982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqggOQSuoQkcE/SB2ceVIy7pn2OgNCy3QifPRNUnIabonCJwPVjwinoyTLMoa3RV+2Tc8amb4eF7A6VWjxgnY20KGHSsT0dUpH528lxxV5oCp/lNY2lDBmBBb6+PFMYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4175
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, August 27, 2019 9:51 PM
>=20
> It's spelled "renesas", not "renensas".
>=20
> Due to this typo, RZ/G1M and RZ/G1N were not covered by the check.
>=20
> Fixes: 2dc240a3308b269a ("usb: host: xhci: rcar: retire use of xhci_plat_=
type_is()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops! Thank you for your patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

