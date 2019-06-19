Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E35934BADD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 16:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfFSOLq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 10:11:46 -0400
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:43232
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbfFSOLq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQC/NWF02kubb6ZqhtGOGsxZ2UfrvL5gWVAp5R6kakk=;
 b=F49+tCy/xeatELNXkWdwaSCU9HFbOnhg+i8XSfJOqx1UGqnAU1rCdQZou6bJraPBZWdk0IPzFRggGlKrk6RMw9BQ4UiXIQsOSfG4If+FPgSNbUrOSv+z2BPmXmoNBgdEl9Do1dlFiEAFMxHpFPHj2ctIAiRchY6F9/+mUaD7nwk=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1532.jpnprd01.prod.outlook.com (52.133.162.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 14:11:41 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 14:11:41 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Index: AQHVIrOD4fCNYWErgUiYJbbykExq36ahinuAgAAEL9CAAQ6hgIAACwaAgABEYwCAAB9okA==
Date:   Wed, 19 Jun 2019 14:11:41 +0000
Message-ID: <TY1PR01MB177099A8BAF4B364AAE8A780C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
 <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVb+sc0vdvbsAE0fkEY6wFS7KsbtqLmtB03ghVeuiHe1w@mail.gmail.com>
 <TY1PR01MB1770F9972F006B57917A0731C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190619121808.hnqoeihjch6silcd@verge.net.au>
In-Reply-To: <20190619121808.hnqoeihjch6silcd@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666440c6-e6c1-463c-0886-08d6f4c00d5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1532;
x-ms-traffictypediagnostic: TY1PR01MB1532:
x-microsoft-antispam-prvs: <TY1PR01MB1532D5C4851EA1FF14F93B70C0E50@TY1PR01MB1532.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(136003)(346002)(376002)(366004)(189003)(199004)(44832011)(55016002)(6246003)(14454004)(6916009)(478600001)(6506007)(4326008)(76176011)(102836004)(229853002)(256004)(9686003)(6436002)(3846002)(25786009)(54906003)(66446008)(73956011)(52536014)(71190400001)(66946007)(66556008)(64756008)(5660300002)(76116006)(66476007)(99286004)(71200400001)(4744005)(2906002)(53546011)(476003)(8676002)(446003)(68736007)(7736002)(486006)(186003)(53936002)(6116002)(74316002)(7696005)(11346002)(33656002)(86362001)(26005)(8936002)(81166006)(316002)(81156014)(66066001)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1532;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2AYVjD5okM7VE2AAwRfRDhgvCtES91YGx20SDLhhVV5guqVhzqrZW+Cbq2uKVEB2zqzzA/kHEwDtPMcAdewP3NQRRsXaYtG9hZwh7OpHuwsrmPlOBanV7+M9nJS+mm3+zUSsJV8+g6U0pOIbaakwF2WSibW/UNJD2OIQJXwtGrdBB22r0GRMzGvp+/uH1L7A4HbhM6zTOoaUIXhyn4xbyR7c9d8kIdHzNFf1ST7xDxuKypluupqTjjYMNhrpJjcyQjYmlJv2wI/XUvyzJTyoRBzB3H66O5cyYnkzpjdUmi2gOypyBipHjldA3H4k0VScLCqB+JURXMBBdf/Nfh22Idh2VsEFU5yCFJ+JBk9cdE2onfgo7N1MXEzGN46lTSVVTAPuxEF0yJFAFTgyUYxrFUi/IlGom3ajdZsribwVmss=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666440c6-e6c1-463c-0886-08d6f4c00d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 14:11:41.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1532
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 19 June 2019 13:18
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
>=20
> >
> > Will do. Simon, do you want me to send an incremental patch for this (t=
his patch
> > is on devel branch already) or would you rather I sent a v2?
>=20
> Please send an incremental patch, thanks.

Great, will send the patch in a minute.

Thanks,
Fab
